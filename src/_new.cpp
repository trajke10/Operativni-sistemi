#include "../lib/hw.h"
#include "../h/MemoryAllocator.h"
#include "../h/syscall_cpp.hpp"

/*
void* operator new (uint64 n){
    size_t numOfBlocks=n/MEM_BLOCK_SIZE;
    if(n%MEM_BLOCK_SIZE) numOfBlocks++;
    return MemAlloc::getAllocator().mem_alloc(n);
}
void* operator new[] (uint64 n){
    size_t numOfBlocks=n/MEM_BLOCK_SIZE;
    if(n%MEM_BLOCK_SIZE) numOfBlocks++;
    return MemAlloc::getAllocator().mem_alloc(n);
}
void operator delete (void* a){
    MemAlloc::getAllocator().mem_free(a);
}
void operator delete[] (void* a){
    MemAlloc::getAllocator().mem_free(a);
}
*/
