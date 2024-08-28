//
// Created by os on 8/6/23.
//

#include "../h/Thread.h"
#include "../h/Scheduler.h"
#include "../h/syscall_c.hpp"

extern "C" void pushRegisters();
extern "C" void popRegisters();

TCB* TCB::running=nullptr;

int TCB::_thread_create (TCB **instance, void (*start_routine)(void *), void *arg,void* stack) {
    TCB* t=new TCB(start_routine,arg,stack);
    if(!t) return -1;
    *instance=t;
    if(start_routine){
        Scheduler::put(t);
        t->context.ra=(uint64)wrapper; //da odmah krene na izvrsavanje tela, po prvom "vadjenju" iz reda
        t->context.sp=(uint64)((uint8*)stack+DEFAULT_STACK_SIZE);
    }
    return 0;
}



void TCB::_thread_dispatch() {
    //pushRegisters();
    TCB* old=TCB::running;
    if(!old->finished && !old->blocked) Scheduler::put(old);
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
    thread_dispatch();
    return -1; //ako ne uspe dealokacija
}

TCB::TCB(void (*start_routine)(void *), void *arg,void* stack) {
    this->stack=(uint64 *)stack;
    job=start_routine;
    this->arg=arg;
}

void TCB::_thread_join(TCB* handle) {
    if(handle && !handle->finished){
        TCB::running->blocked=true;
        handle->addBlockedElem(TCB::running);
        thread_dispatch();
    }
}

void TCB::wrapper() {
    TCB::running->job(TCB::running->arg);
    for(BlockedElem* tmp=TCB::running->blockedHead;tmp;tmp=tmp->next){
        tmp->thread->blocked=false;
        Scheduler::put(tmp->thread);
        delete tmp;
    }//obavestavanje svih onih niti koje su cekale i njihovo stavljanje u rasporedjivac
    thread_exit();
}

void TCB::addBlockedElem(TCB *t) {
    BlockedElem* newElem=new BlockedElem(t);
    if(!this->blockedHead){
        this->blockedHead=newElem;
    }else{
        newElem->next=this->blockedHead;
        this->blockedHead=newElem;
    }
}

void TCB::_thread_init(TCB** instance,void (*start_routine)(void*), void *arg,void* stack) {
    TCB* t=new TCB(start_routine,arg,stack);
    *instance=t;
    t->job=start_routine;
    t->stack=(uint64 *)stack;
}