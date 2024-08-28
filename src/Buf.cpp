//
// Created by os on 8/16/23.
//

#include "../h/Buf.h"

Buf:: Buf(){
    buf=(char*)MemAlloc::getAllocator().mem_alloc(BUFF_SIZE/MEM_BLOCK_SIZE);
    Sem::_sem_open(&itemAvailable,0);
    Sem::_sem_open(&spaceAvailable,2048);
}

void Buf::put(char c){
    Sem::_sem_wait(spaceAvailable);
    buf[tail]=c;
    tail=(tail+1)%BUFF_SIZE;
    Sem::_sem_signal(itemAvailable);
}

char Buf::get(){
    Sem::_sem_wait(itemAvailable);
    char c=buf[head];
    head=(head+1)%BUFF_SIZE;
    Sem::_sem_signal(spaceAvailable);
    return c;
}

