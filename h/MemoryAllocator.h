//
// Created by os on 8/3/23.
//

#ifndef PROJECT_BASE_V1_1_MEMORYALLOCATOR_H
#define PROJECT_BASE_V1_1_MEMORYALLOCATOR_H
#include "../lib/hw.h"

class MemAlloc{
    struct FreeSeg{
        FreeSeg* prev;
        FreeSeg* next;
        size_t szBl;
        size_t szBy;
    };
    FreeSeg* headFree= nullptr;
    bool flag=false;
    void tryToMerge(FreeSeg*);
    static size_t  bytesToBlocks(size_t s);
    MemAlloc()=default;
public:
    void* mem_alloc(size_t);
    int mem_free(void*);
    static MemAlloc& getAllocator(){
        static MemAlloc instance;
        if(!instance.flag){
            instance.flag=true;
            instance.headFree=(FreeSeg*)HEAP_START_ADDR;
            instance.headFree->next= nullptr;
            instance.headFree->prev= nullptr;
            instance.headFree->szBy=(uint64)((uint64*)HEAP_END_ADDR-(uint64*)HEAP_START_ADDR);
            instance.headFree->szBl=bytesToBlocks(instance.headFree->szBy-sizeof(FreeSeg));
        }
        return instance;
    }
};

#endif
