//
// Created by os on 8/16/23.
//
#include "../h/Con.h"

void Con::putcO(char c){outputBuf->put(c);}
void Con::putcI(char c){inputBuf->put(c);}
char Con::getcO(){ return outputBuf->get();}
char Con::getcI(){ return inputBuf->get();}
Con& Con::getConsoleInstance(){
    static Con instance;
    if(first){
        first=false;
        instance.inputBuf= (Buf*)MemAlloc::getAllocator().mem_alloc((sizeof(Buf)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
        instance.outputBuf=(Buf*)MemAlloc::getAllocator().mem_alloc((sizeof(Buf)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
        *instance.inputBuf=Buf();
        *instance.outputBuf=Buf();
    }
    return instance;
}
