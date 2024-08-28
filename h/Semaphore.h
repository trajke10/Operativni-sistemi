//
// Created by os on 8/9/23.
//

#ifndef PROJECT_BASE_V1_1_SEMAPHORE_H
#define PROJECT_BASE_V1_1_SEMAPHORE_H

#include "MemoryAllocator.h"
#include "Thread.h"
#include "Scheduler.h"

class Sem {
    struct Elem{
        TCB* thread;
        Elem* next;
        Elem(TCB *t):thread(t),next(nullptr){}
    };
    int value;
    Elem* headBlocked= nullptr;
    Sem(int val):value(val){}
    void unblockAll();
    void block();
    void unblock();
    ~Sem();
public:
    static int _sem_open(Sem** handle,unsigned init);
    static int _sem_close(Sem* handle);
    static int _sem_wait(Sem* id);
    static int _sem_signal(Sem* id);
};


#endif
