#include "../h/syscall_cpp.hpp"

void* operator new (size_t sz){
    return mem_alloc(sz);
}
void operator delete(void* addr){
    mem_free(addr);
}

Thread::Thread(void (*body)(void *), void *arg) {
    this->body=body;
    this->arg=arg;
}

int Thread::start() {
    thread_create(&myHandle,body,arg);
    return 0;
}

void Thread::join() {
    thread_join(myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

Thread::~Thread() {
    myHandle= nullptr;
}

Thread::Thread() {
   this->body=wrapper;
   this->arg=this;
}

int Thread::sleep(time_t t) {
    return time_sleep(t);
}


Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle,init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

char Console::getc() {return _SYSCALL_CPP_HPP::getc();}
void Console::putc(char c) {return _SYSCALL_CPP_HPP::putc(c);}

PeriodicThread::PeriodicThread(time_t period) : Thread(){
    this->period=period;
}

void PeriodicThread::run() {
    while(period){
        periodicActivation();
        sleep(period);
    }
}
