//
// Created by os on 8/5/23.
//

#include "../h/RiscVReg.h"
#include "../h/printing.hpp"

void RiscVReg::popSppSpie(){
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}

extern "C" void interruptHandler(){
    uint64 a1,a2,a3,a4;
    uint64 code;
    __asm__ volatile("mv %0, a0":"=r"(code));
    __asm__ volatile("ld %0, 14*8(s0)" : "=r" (a4));
    __asm__ volatile("ld %0, 13*8(s0)" : "=r" (a3));
    __asm__ volatile("ld %0, 12*8(s0)" : "=r" (a2));
    __asm__ volatile("ld %0, 11*8(s0)" : "=r" (a1));
    uint64 scauseV=RiscVReg::read_scause();
    uint64 sepcVar;
    __asm__ volatile("csrr %0, sepc" : "=r" (sepcVar));
    if(scauseV==0x08 || scauseV==0x09) { //sistemski poziv

        uint64 statusVar = RiscVReg::read_sstatus();

        if (code == 0x01) { //mem_alloc
            uint64 n = a1;
            void *addr = MemAlloc::getAllocator().mem_alloc((size_t) n);
            __asm__ volatile("mv a0, %0" : : "r" (addr));
        }else if (code == 0x02) { //mem_free
            uint64 addr = a1;
            int status = MemAlloc::getAllocator().mem_free((void *) addr);
            __asm__ volatile("mv a0, %0" : : "r" (status));
        }else if (code == 0x11) { //thread_create
            TCB **handle;
            void (*body)(void *);
            void *arg;
            void *stack_space;
            handle = (TCB **) a1;
            body = (void (*)(void *)) a2;
            arg = (void *) a3;
            if(body) stack_space=MemAlloc::getAllocator().mem_alloc((DEFAULT_STACK_SIZE*8+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
            //stack_space = (void *) a4;
            int status = TCB::_thread_create(handle, body, arg, stack_space);
            __asm__ volatile("mv a0, %0": :"r"(status));
        }else if (code == 0x12) { //thread_exit
            int status = TCB::_thread_exit();
            __asm__ volatile("mv a0, %0": :"r"(status));
        }else if (code == 0x13) { //thread_dispatch
            TCB::_thread_dispatch();
        }else if (code == 0x14) { //thread_join
            TCB *handle = (TCB *) a1;
            TCB::_thread_join(handle);
        }else if(code==0x21) { //sem_open
            sem_t * handle=(sem_t*)a1;
            unsigned init=(unsigned)a2;
            int ret=Sem::_sem_open(handle,init);
            __asm__ volatile("mv a0, %0": :"r"(ret));
        }else if(code==0x22) { //sem_close
            sem_t handle = (sem_t) a1;
            int ret = Sem::_sem_close(handle);
            __asm__ volatile("mv a0, %0": :"r"(ret));
        }else if(code==0x23) { //sem_wait
            sem_t id = (sem_t) a1;
            int ret = Sem::_sem_wait(id);
            __asm__ volatile("mv a0, %0": :"r"(ret));
        }else if(code==0x24) { //sem_signal
            sem_t id=(sem_t)a1;
            int ret = Sem::_sem_signal(id);
            __asm__ volatile("mv a0, %0": :"r"(ret));
        }else if(code==0x31){ // time_sleep
            time_t time=a1;
            int ret=TCB::_time_sleep(time);
            __asm__ volatile("mv a0, %0": :"r"(ret));
        }else if(code==0x41){ //getc
            //int c=__getc();
            char c=Con::getConsoleInstance().getcI();
            __asm__ volatile("mv a0, %0": :"r"(c));
        }else if(code==0x42){ //putc
            char c=(char)a1;
            Con::getConsoleInstance().putcO(c);
            //__putc((char)c);
        }else if(code==0x50){
            RiscVReg::write_sstatus(statusVar); //restauracija statusnog registra
            uint64 mask=1<<8;
            __asm__ volatile("csrc sstatus, %0" : :"r"(mask)); //podmecem vrednost da se vrati u korisnicki rezim
            sepcVar+=4; //jer ecall cuva pc koji ukazuje opet na nju
            __asm__ volatile("csrw sepc, %0" : : "r" (sepcVar));
            RiscVReg::clear_ssip();//oznacavamo da je sistemski poziv opsluzen
            return;
        }

        RiscVReg::write_sstatus(statusVar); //restauracija statusnog registra
        sepcVar+=4; //jer ecall cuva pc koji ukazuje opet na nju
        __asm__ volatile("csrw sepc, %0" : : "r" (sepcVar));
        RiscVReg::clear_ssip();//oznacavamo da je sistemski poziv opsluzen

    }
    else
    {
        printInt(scauseV);
        putc('\n');
    }
}

extern "C" void consoleHandler(){
    uint64 ret=plic_claim();
    if(ret==CONSOLE_IRQ) {
        while ((*(char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT) {
            Con::getConsoleInstance().putcI(*(char *) CONSOLE_RX_DATA);
        }
    }
    plic_complete(ret);
}

extern "C" void timerHandler(){
    TCB::timeSliceCnt++;
    for(BlockedElem* tmp=TCB::sleepHead;tmp;tmp=tmp->next){
        tmp->thread->decSleepTime();
    }
    if(TCB::sleepHead && TCB::sleepHead->thread->getSleepTime()==0){
        TCB::removeElemsFromSleepList();
    }
    if(TCB::timeSliceCnt>=TCB::running->getTimeSlice()){
        uint64 sepcV,ssatusV;
        __asm__ volatile("csrr %0, sepc": "=r"(sepcV));
        __asm__ volatile("csrr %0, sstatus": "=r"(ssatusV));
        TCB::timeSliceCnt=0;
        TCB::_thread_dispatch();
        __asm__ volatile("csrw sepc, %0": :"r"(sepcV));
        __asm__ volatile("csrw sstatus, %0": :"r"(ssatusV));
    }
    RiscVReg::clear_ssip();
}