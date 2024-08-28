//
// Created by os on 8/6/23.
//

#include "../h/Scheduler.h"

Elem* Scheduler::head=nullptr;

void Scheduler::put(TCB *t) {
    Elem* novi=(Elem*)MemAlloc::getAllocator().mem_alloc((sizeof(Elem)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    novi->thread=t;
    novi->next=nullptr;
    if(!head){
        head=novi;
    }else{
        Elem* tek;
        for(tek=head;tek->next;tek=tek->next);
        tek->next=novi;
    }
}

TCB *Scheduler::get() {
    TCB* ret=nullptr;
    if(head){
        ret=head->thread;
        Elem* stari=head;
        head=head->next;
        MemAlloc::getAllocator().mem_free(stari);
    }
    return ret;
}

Scheduler::~Scheduler() {
    while (head) {
        Elem *stari = head;
        head = head->next;
        delete stari->thread;
        delete stari;
    }
}