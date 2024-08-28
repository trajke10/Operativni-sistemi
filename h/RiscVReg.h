//
// Created by os on 8/5/23.
//

#ifndef PROJECT_BASE_V1_1_RISCVREG_H
#define PROJECT_BASE_V1_1_RISCVREG_H
#include "../lib/hw.h"
#include "MemoryAllocator.h"
#include "TCB.h"
#include "Con.h"
#include "../lib/console.h"

class RiscVReg { //ideja za klasu preuzeta sa sedmih vezbi i sestog zadatka
public:
    static uint64 read_scause();
    static uint64 read_sstatus();
    static void write_sstatus(uint64);
    static void clear_ssip();
    static void popSppSpie();
};

inline uint64 RiscVReg::read_scause() {
    uint64 ret;
    __asm__ volatile("csrr %0, scause" : "=r" (ret));
    return ret;
}

inline uint64 RiscVReg::read_sstatus() {
    uint64 ret;
    __asm__ volatile("csrr %0, sstatus" : "=r" (ret));
    return ret;
}

inline void RiscVReg::write_sstatus(uint64 arg) {
    __asm__ volatile("csrw sstatus, %0" : : "r" (arg));
}

inline void RiscVReg::clear_ssip(){
    __asm__ volatile("csrc sip, 0x02");
}


#endif
