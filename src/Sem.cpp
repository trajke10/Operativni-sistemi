//
// Created by os on 8/9/23.
//

#include "../h/Sem.h"

int Sem::_sem_open(Sem **handle, unsigned init) {
    Sem* s=(Sem*)MemAlloc::getAllocator().mem_alloc((sizeof(Sem)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    if(!s)return -1;
    *s=Sem((int)init);
    *handle=s;
    return 0;
}

int Sem::_sem_close(Sem*handle) {
    if(!handle) return -1;
    handle->unblockAll();
    handle->closed=true;
    int status=MemAlloc::getAllocator().mem_free(handle);
    return status;
}

int Sem::_sem_wait(Sem *id) {
    if(!id) return -1;
    if(id->value--<=0){
        id->block();
        TCB::_thread_dispatch();
    }
    if(!id || id->closed) return -1;
    return 0;
}

void Sem::block() {
    TCB *t=TCB::running;
    Elem* newElem=(Elem*)MemAlloc::getAllocator().mem_alloc((sizeof(Elem)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    newElem->thread=t;
    newElem->next= nullptr;
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
    MemAlloc::getAllocator().mem_free(elem);
}

void Sem::unblockAll() {
    while(headBlocked){
        headBlocked->thread->setBlocked(false);
        Scheduler::put(headBlocked->thread);
        Elem* old=headBlocked;
        headBlocked=headBlocked->next;
        MemAlloc::getAllocator().mem_free(old);
    }
}

Sem::~Sem() {
    while(headBlocked){
        Elem* old=headBlocked;
        old->thread->setBlocked(false);
        headBlocked=headBlocked->next;
        delete old;
    }
}


