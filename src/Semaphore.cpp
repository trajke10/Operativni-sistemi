//
// Created by os on 8/9/23.
//

#include "../h/Semaphore.h"

int Sem::_sem_open(Sem **handle, unsigned init) {
    Sem* s=new Sem((int)init);
    if(!s)return -1;
    *handle=s;
    return 0;
}

int Sem::_sem_close(Sem*handle) {
    if(!handle) return -1;
    handle->unblockAll();
    int status=MemAlloc::getAllocator().mem_free(handle);
    return status;
}

int Sem::_sem_wait(Sem *id) {
    if(!id) return -1;
    if(id->value--<=0){
        id->block();
        TCB::_thread_dispatch();
    }
    return 0;
}

void Sem::block() {
    TCB *t=TCB::running;
    Elem* newElem=new Elem(t);
    if(!headBlocked){
        headBlocked=newElem;
    }else{
        newElem->next=headBlocked;
        headBlocked= newElem;
    }
    t->setBlocked(true);
}

int Sem::_sem_signal(Sem *id) {
    if(!id) return -1;
    if(++id->value<=0){
        id->unblock();
    }
    return 0;
}

void Sem::unblock() {
    Elem* elem=headBlocked;
    headBlocked=headBlocked->next;
    elem->thread->setBlocked(false);
    Scheduler::put(elem->thread);
}

void Sem::unblockAll() {
    while(headBlocked){
        headBlocked->thread->setBlocked(false);
        Scheduler::put(headBlocked->thread);
        Elem* old=headBlocked;
        headBlocked=headBlocked->next;
        delete old;
    }
}

Sem::~Sem() {
    while(headBlocked){
        Elem* old=headBlocked;
        headBlocked=headBlocked->next;
        delete old;
    }
}


