#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/syscall_cpp.hpp"
#include "../h/Scheduler.h"
#include "../test/Threads_C_API_test.hpp"
#include "../test/ConsumerProducer_C_API_test.hpp"
#include "../lib/hw.h"
#include "../test/Threads_CPP_API_test.hpp"

extern "C" void trap();
void userMain();
extern "C" void idleJob(void*);
static bool finishedA=false;

void userMainW(void* arg){
    userMain();
}

extern "C" void putJob(void* arg){
    while(true){
        while((*(char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT){
            char c=Con::getConsoleInstance().getcO();
            *(char*)CONSOLE_TX_DATA=c;
        }
        TCB::_thread_dispatch();
    }
}

class PT:public PeriodicThread{
public:
    PT(time_t period) : PeriodicThread(period){}
protected:
    void periodicActivation() override{
        static int i=0;
        putc('A');
        i++;
        if(i==10){
            finishedA=true;
        }
    }
};

int main() {
    __asm__ volatile("csrw stvec, %[vector]": :[vector]"r"(&trap));
    __asm__ volatile("csrs stvec,0x01");
    thread_t nit1,nit2,nit3;
    thread_t putThread;
    void*arg= nullptr;
    thread_create(&nit1,nullptr,arg);
    thread_create(&nit2,idleJob,arg);
    thread_create(&putThread,putJob,arg);
    TCB::running=nit1;
    changeToUserRegime();
    thread_create(&nit3,userMainW,nullptr);
    thread_join(nit3);
    //PT* nit3=new PT(5);
    //nit3->start();
    //while(!finishedA){}
    //nit3->terminate();
    MemAlloc::getAllocator().mem_free(nit1);
    MemAlloc::getAllocator().mem_free(nit2);
    MemAlloc::getAllocator().mem_free(nit3);
    MemAlloc::getAllocator().mem_free(putThread);
    return 0;
}