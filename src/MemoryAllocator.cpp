//
// Created by os on 8/3/23.
//

#include "../h/MemoryAllocator.h"
#include "../lib/mem.h"
#include "../lib/console.h"

void* MemAlloc::mem_alloc(size_t sz) {
    void* ret=nullptr;
    for(FreeSeg* tmp=headFree;tmp;tmp=tmp->next) {
        if (tmp->szBl < sz) continue;
        if (tmp->szBl == sz) {
            if (tmp->prev) tmp->prev->next = tmp->next;
            if (tmp->next) tmp->next->prev = tmp->prev;
            if (tmp == headFree) headFree = headFree->next;
        } else {
            FreeSeg *newSeg = (FreeSeg *) ((uint8 *) tmp + sz * MEM_BLOCK_SIZE + sizeof(FreeSeg));
            newSeg->next = tmp->next;
            newSeg->prev = tmp->prev;
            newSeg->szBy = tmp->szBy - sz * MEM_BLOCK_SIZE - sizeof(FreeSeg);
            newSeg->szBl = bytesToBlocks(newSeg->szBy - sizeof(FreeSeg));
            if (tmp->prev) tmp->prev->next = newSeg;
            if (tmp->next) tmp->next->prev = newSeg;
            if (tmp == headFree) headFree = newSeg;
        }
        tmp->szBy = sz * MEM_BLOCK_SIZE + sizeof(FreeSeg);
        tmp->szBl = sz;
        ret = (uint8 *) tmp + sizeof(FreeSeg);
        break;
    }
    return ret;
}

int MemAlloc::mem_free(void *addr){
    if(addr<HEAP_START_ADDR || addr>=HEAP_END_ADDR) return -1; //uopste ne pripada dinamickoj zoni
    for(FreeSeg* tmp=headFree;tmp;tmp=tmp->next){
        if((uint8*)addr>=(uint8*)tmp && (uint8*)addr<(uint8*)tmp+tmp->szBy)
            return -2; // nije alociran da bi se dealocirao
    }
    //ispravan poziv
    FreeSeg* newSeg=(FreeSeg*)((uint8 *)addr-sizeof(FreeSeg));
    if(!headFree) {
        headFree=newSeg;
        headFree->next= nullptr;
        headFree->prev= nullptr;
        return 0;
    }
    if(newSeg<headFree){
        newSeg->next=headFree;
        headFree->prev=newSeg;
        headFree=newSeg;
    }else{
        FreeSeg *tmp;
        for (tmp = headFree; tmp->next ; tmp = tmp->next){
            if((uint8 *) newSeg > (uint8*) tmp &&
               (uint8* ) newSeg < (uint8*) tmp->next) break;
        }
        newSeg->next = tmp->next;
        newSeg->prev = tmp;
        tmp->next = newSeg;
        if (newSeg->next) newSeg->next->prev = newSeg;
    }
    tryToMerge(newSeg);
    return 0;
}

void MemAlloc::tryToMerge(FreeSeg* seg) {
    //spajanje sa onim pre
    if(seg->prev && (uint8 *)seg->prev+seg->prev->szBy==(uint8 *)seg) {
        seg->prev->szBy+=seg->szBy;
        seg->prev->szBl=bytesToBlocks(seg->prev->szBy-sizeof(FreeSeg));
        seg->prev->next=seg->next;
        if(seg->next) seg->next->prev=seg->prev;
        seg=seg->prev;
    }
    //spajanje sa onim posle
    if(seg->next && (uint8 *)seg+seg->szBy==(uint8 *)seg->next) {
        seg->szBy += seg->next->szBy;
        seg->szBl=bytesToBlocks(seg->szBy-sizeof(FreeSeg));
        seg->next=seg->next->next;
        if(seg->next) seg->next->prev=seg;
    }
}

size_t MemAlloc::bytesToBlocks(size_t s) {
    return s/MEM_BLOCK_SIZE;
}

