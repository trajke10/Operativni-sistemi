//
// Created by os on 8/6/23.
//

#ifndef PROJECT_BASE_V1_1_THREAD_H
#define PROJECT_BASE_V1_1_THREAD_H
#include "../lib/hw.h"
#include "MemoryAllocator.h"

class TCB {
    struct Context{
        uint64 ra; //dokle se stiglo sa izvrsavanjem tela funkcije
        uint64 sp;
    };
    struct BlockedElem{
        TCB* thread;
        BlockedElem* next;
        BlockedElem(TCB* t):thread(t),next(nullptr){}
    };
    Context context;
    size_t timeSlice=DEFAULT_TIME_SLICE;
    uint64 * stack;
    void(* job)(void*);
    void* arg;
    bool finished=false;
    bool blocked=false;
    BlockedElem* blockedHead=nullptr;
    void addBlockedElem(TCB* t);
    TCB(void (*start_routine)(void *), void *arg,void* stack);
    static void contextSwitch(Context* a,Context* b);
    static void wrapper();
public:
    static TCB* running;
    void setBlocked(bool b) {blocked=b;}
    static int _thread_create(TCB** instance,void(* start_routine)(void*),void* arg,void* stack);
    static void _thread_init(TCB** instance,void(*start_routine)(void*),void* arg,void* stack);
    static int _thread_exit();
    static void _thread_dispatch();
    static void _thread_join(TCB* handle);
    ~TCB(){if (stack) delete(stack);}
};

#endif
