#include "../lib/hw.h"
#include "../h/syscall_c.hpp"

void *mem_alloc(size_t size) {
    size_t numOfBlocks=size/MEM_BLOCK_SIZE;
    if(size%MEM_BLOCK_SIZE) numOfBlocks++;
    uint64 code=0x01;
    __asm__ volatile("mv a1, %0" : : "r"(numOfBlocks));
    __asm__ volatile("mv a0, %0" : : "r"(code));
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (void*) ret;
}

int mem_free(void* addr) {
    uint64 code=0x02;
    __asm__ volatile("mv a1, %0" : : "r"(addr));
    __asm__ volatile("mv a0, %0" : : "r"(code));
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int)ret;
}

int thread_create(
        thread_t * handle,
        void(*start_routine)(void*),
        void* arg){
    uint64 code=0x11;
    __asm__ volatile("mv a3,%0": :"r"(arg));
    __asm__ volatile("mv a2,%0": :"r"(start_routine));
    __asm__ volatile("mv a1,%0": :"r"(handle));
    __asm__ volatile("mv a0,%0": :"r"(code));
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0,a0": "=r"(ret));
    return (int)ret;
}

int thread_exit(){
    uint64 code=0x12;
    __asm__ volatile("mv a0,%0": :"r"(code));
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0,a0":"=r"(ret));
    return (int) ret;
}

void thread_dispatch(){
    uint64 code=0x13;
    __asm__ volatile("mv a0,%0": :"r"(code));
    __asm__ volatile("ecall");
}

void thread_join(thread_t handle){
    uint64 code=0x14;
    __asm__ volatile("mv a1,%0": :"r"(handle));
    __asm__ volatile("mv a0,%0": :"r"(code));
    __asm__ volatile("ecall");
}

int sem_open(sem_t* handle, unsigned init){
    uint64 code=0x21;
    __asm__ volatile("mv a2,%0": :"r"(init));
    __asm__ volatile("mv a1,%0": :"r"(handle));
    __asm__ volatile("mv a0,%0": :"r"(code));
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0,a0":"=r"(ret));
    return (int)ret;
}
int sem_close(sem_t handle){
    uint64 code=0x22;
    __asm__ volatile("mv a1,%0": :"r"(handle));
    __asm__ volatile("mv a0,%0": :"r"(code));
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0,a0":"=r"(ret));
    return (int)ret;
}
int sem_wait(sem_t id){
    uint64 code=0x23;
    __asm__ volatile("mv a1,%0": :"r"(id));
    __asm__ volatile("mv a0,%0": :"r"(code));
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0,a0":"=r"(ret));
    return (int)ret;
}

int sem_signal(sem_t id){
    uint64 code=0x24;
    __asm__ volatile("mv a1,%0": :"r"(id));
    __asm__ volatile("mv a0,%0": :"r"(code));
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0,a0":"=r"(ret));
    return (int)ret;
}

int time_sleep(time_t t){
    uint64 code=0x31;
    __asm__ volatile("mv a1,%0": :"r"(t));
    __asm__ volatile("mv a0,%0": :"r"(code));
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0,a0":"=r"(ret));
    return (int)ret;
}

void changeToUserRegime(){
    uint64 code=0x50;
    __asm__ volatile("mv a0,%0": :"r"(code));
    __asm__ volatile("ecall");
    uint64 a=0x50;
    return;
}

char getc(){
    uint64 code=0x41;
    __asm__ volatile("mv a0,%0": :"r"(code));
    __asm__ volatile("ecall");
    int ret=0;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (char)ret;
}
void putc(char c){
    uint64 code=0x42;
    __asm__ volatile("mv a1,%0": :"r"(c));
    __asm__ volatile("mv a0,%0": :"r"(code));
    __asm__ volatile("ecall");
}
