//
// Created by os on 8/6/23.
//

#ifndef PROJECT_BASE_V1_1_SCHEDULER_H
#define PROJECT_BASE_V1_1_SCHEDULER_H
#include "TCB.h"

class TCB;

struct Elem{
    TCB* thread;
    Elem* next=nullptr;
};

class Scheduler {
    Scheduler()=default;
public:
    static Elem* head;
    static void put(TCB* t);
    static TCB* get();
    ~Scheduler();
};


#endif
