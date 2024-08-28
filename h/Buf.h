//
// Created by os on 8/16/23.
//

#ifndef PROJECT_BASE_V1_1_BUF_H
#define PROJECT_BASE_V1_1_BUF_H

#include "Sem.h"

class Sem;

class Buf {
private:
    int head=0,tail=0;
    char* buf;
    Sem* itemAvailable;
    Sem* spaceAvailable;
    static const int BUFF_SIZE=2048;
public:
    Buf();
    void put(char c);
    char get();
};


#endif //PROJECT_BASE_V1_1_BUF_H
