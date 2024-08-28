//
// Created by os on 8/16/23.
//

#ifndef PROJECT_BASE_V1_1_CON_H
#define PROJECT_BASE_V1_1_CON_H

#include "Buf.h"

bool static first=true;
class Buf;

class Con {
private:
    Buf* inputBuf;
    Buf* outputBuf;
public:
    void putcO(char c);
    void putcI(char c);
    char getcO();
    char getcI();
    static Con& getConsoleInstance();
};

#endif //PROJECT_BASE_V1_1_CON_H
