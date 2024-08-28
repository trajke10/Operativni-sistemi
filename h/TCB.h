//
// Created by os on 8/6/23.
//

#ifndef PROJECT_BASE_V1_1_TCB_H
#define PROJECT_BASE_V1_1_TCB_H
#include "../lib/hw.h"
#include "RiscVReg.h"

class TCB;

struct BlockedElem{
    TCB* thread;
    BlockedElem* next;
    BlockedElem* prev;
    BlockedElem(TCB* t):thread(t),next(nullptr),prev(nullptr){}
};

class TCB {
    struct Context{
        uint64 ra; //dokle se stiglo sa izvrsavanjem tela funkcije
        uint64 sp;
    };
    Context context;
    size_t timeSlice=DEFAULT_TIME_SLICE;
    size_t sleepTime=0;
    uint64 * stack;
    void(* job)(void*);
    void* arg;
    bool finished=false;
    bool blocked=false;
    BlockedElem* blockedHead=nullptr;
    void addBlockedElem(TCB* t);
    static void addSleepedElem(TCB *t);
    TCB(void (*start_routine)(void *), void *arg, void* stack);
    static void contextSwitch(Context* a,Context* b);
    static void wrapper();
public:
    static uint64 timeSliceCnt; // koliko se tekuca nit vec izvrsava
    static TCB* running;
    void setBlocked(bool b) {blocked=b;}
    static int _thread_create(TCB** instance,void(* start_routine)(void*),void* arg,void* stack);
    static int _thread_exit();
    static void _thread_dispatch();
    static void _thread_join(TCB* handle);
    static int _time_sleep(time_t time);
    static void setTimeSlice(TCB* handle,size_t time) {handle->timeSlice=time;}
    size_t getTimeSlice() const {return timeSlice;}
    //~TCB(){if(stack) delete stack;}

    static BlockedElem* sleepHead;
    void decSleepTime(){sleepTime--;}
    size_t getSleepTime(){return sleepTime;}

    static void removeElemsFromSleepList();
};

#endif
