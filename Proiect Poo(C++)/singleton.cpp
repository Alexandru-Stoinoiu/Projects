#include "Singleton.h"
#include <iostream>

Singleton* Singleton::instance = nullptr;

Singleton::Singleton() {}

Singleton* Singleton::getInstance()
{
    if (!instance)
    {
        instance = new Singleton();
    }
    return instance;
}

void Singleton::doSomething()
{
    //std::cout << "singleton is here" << std::endl;
}

Singleton::~Singleton()
{
    if (instance)
    {
        delete instance;
        instance = nullptr;

    }
}
