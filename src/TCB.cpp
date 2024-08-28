//
// Created by os on 8/6/23.
//

#include "../h/TCB.h"
#include "../h/Scheduler.h"
#include "../h/syscall_c.hpp"
#include "../h/printing.hpp"

extern "C" void pushRegisters();
extern "C" void popRegisters();
extern "C" void putJob(void*);

extern "C" void idleJob(void* arg){
    while(1) {
        while (!Scheduler::head) {}
        thread_dispatch();
    }
}

TCB* TCB::running=nullptr;
uint64 TCB::timeSliceCnt=0;
BlockedElem* TCB::sleepHead= nullptr;

int TCB::_thread_create (TCB **instance, void (*start_routine)(void *), void *arg,void* stack) {
    //TCB* t=new TCB(start_routine,arg,stack);
    TCB* t=(TCB*)MemAlloc::getAllocator().mem_alloc((sizeof(TCB)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    if(!t) return -1;
    *t=TCB(start_routine,arg,stack);
    *instance=t;
    if(start_routine){
        Scheduler::put(t);
        t->context.ra=(uint64)wrapper; //da odmah krene na izvrsavanje tela, po prvom "vadjenju" iz reda
        t->context.sp=(uint64)((uint8*)stack+DEFAULT_STACK_SIZE*8);
    }
    return 0;
}

void TCB::_thread_dispatch() {
    //pushRegisters();
    TCB* old=TCB::running;
    if(!old->finished && !old->blocked && old->timeSlice && !old->sleepTime) Scheduler::put(old);
    if(old->finished){
        MemAlloc::getAllocator().mem_free(old->stack);
        /*int status2=MemAlloc::getAllocator().mem_free(old);
        if (status1<0 || status2<0){
            return;
        }*/ // nije uspela dealokacija, potrebno je vratiti se u _thread_exit i javiti kod greske
        //old= nullptr;
    }
    running=Scheduler::get();
    contextSwitch(&old->context,&running->context);
    /*
    if(running){

        popRegisters();
    }*/
}

void TCB::contextSwitch(TCB::Context *a, TCB::Context *b) {
    __asm__ volatile("mv %0, ra": "=r"(a->ra));
    __asm__ volatile("mv %0, sp": "=r"(a->sp));
    __asm__ volatile("mv ra, %0": :"r"(b->ra));
    __asm__ volatile("mv sp, %0": :"r"(b->sp));
}

int TCB::_thread_exit() {
    TCB* old=TCB::running;
    old->finished=true;
    _thread_dispatch();
    return -1; //ako ne uspe dealokacija
}

TCB::TCB(void (*start_routine)(void *), void *arg, void* stack) {
    job=start_routine;
    this->arg=arg;
    this->stack=(uint64 *)stack;
}

void TCB::_thread_join(TCB* handle) {
    if(handle && !handle->finished){
        TCB::running->blocked=true;
        handle->addBlockedElem(TCB::running);
        _thread_dispatch();
    }
}

void TCB::wrapper() {
    if(TCB::running->job!=putJob)
        RiscVReg::popSppSpie();
    TCB::running->job(TCB::running->arg);
    for(BlockedElem* tmp=TCB::running->blockedHead;tmp;tmp=tmp->next){
        tmp->thread->blocked=false;
        Scheduler::put(tmp->thread);
        delete tmp;
    }//obavestavanje svih onih niti koje su cekale i njihovo stavljanje u rasporedjivac
    thread_exit();
}

void TCB::addBlockedElem(TCB *t) {
    BlockedElem *newElem = (BlockedElem*)MemAlloc::getAllocator().mem_alloc((sizeof(BlockedElem)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    newElem->next= nullptr;
    newElem->prev= nullptr;
    newElem->thread=t;
    if (!this->blockedHead) {
        this->blockedHead = newElem;
    } else {
        newElem->next = this->blockedHead;
        this->blockedHead->prev=newElem;
        this->blockedHead = newElem;
    }
}

void TCB::addSleepedElem(TCB *t) {
    BlockedElem *newElem = (BlockedElem*)MemAlloc::getAllocator().mem_alloc((sizeof(BlockedElem)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    newElem->next= nullptr;
    newElem->prev= nullptr;
    newElem->thread=t;
    if(!sleepHead){
        sleepHead=newElem;
    }else{
        BlockedElem* tmp=sleepHead;
        while(t->sleepTime > tmp->thread->sleepTime && tmp->next){
            tmp=tmp->next;
        }
        if(tmp->next || t->sleepTime < tmp->thread->sleepTime ) {
            newElem->prev = tmp->prev;
            newElem->next = tmp;
            tmp->prev = newElem;
            if (newElem->prev) newElem->prev->next = newElem;
            else sleepHead=newElem;
        }else{
            newElem->next=tmp->next;
            newElem->prev=tmp;
            tmp->next=newElem;
        } // lista je uredjena po rastucem redosledu spavanja
    }
}

int TCB::_time_sleep(time_t time) {
    if(time==0) return 0;
    TCB::running->sleepTime=time;
    addSleepedElem(TCB::running);
    _thread_dispatch();
    return 0;
}

void TCB::removeElemsFromSleepList() {
    while(sleepHead && sleepHead->thread->getSleepTime()==0){
        Scheduler::put(sleepHead->thread);
        BlockedElem* old=sleepHead;
        sleepHead=sleepHead->next;
        if(sleepHead) sleepHead->prev= nullptr;
        MemAlloc::getAllocator().mem_free(old);
    }
}

