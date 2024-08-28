#ifndef _SYSCALL_CPP_HPP
#define _SYSCALL_CPP_HPP

#include "syscall_c.hpp"

void* operator new (size_t sz);
void operator delete(void* addr);

class Thread{
public:
    Thread(void (*body)(void*),void* arg);
    virtual ~Thread();

    int start();
    void join();

    static void dispatch();
    static int sleep(time_t t);

protected:
    Thread();
    virtual void run() {};

private:
    static void wrapper(void* t){
        ((Thread*)t)->run();
    }
    thread_t myHandle;
    void(*body)(void*);
    void* arg;
};

class Semaphore{
public:
    Semaphore(unsigned init=1);
    virtual ~Semaphore();
    int wait();
    int signal();

private:
    sem_t myHandle;
};

class PeriodicThread : public Thread{
public:
    void terminate(){period=0;}
    virtual ~PeriodicThread(){period=0;}
    PeriodicThread(time_t period);

protected:
    void run() override;
    virtual void periodicActivation(){};

private:
    time_t period;

};

class Console{
public:
    static char getc();
    static void putc(char c);

};

#endif
