
#ifndef SINGLETON_H
#define SINGLETON_H

class Singleton {
private:
    Singleton();
    static Singleton* instance;

public:
    static Singleton* getInstance();
    void doSomething();
    ~Singleton();
};

#endif
