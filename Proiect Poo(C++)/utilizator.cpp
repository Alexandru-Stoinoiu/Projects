#include "utilizator.h"
#include <iostream>

int Utilizator::totalUtilizatori = 0;

Utilizator::Utilizator(const std::string& numeUtilizator, const std::string& parola)
    : numeUtilizator(numeUtilizator), parola(parola) , singleton(Singleton::getInstance()) {
    ++totalUtilizatori;
    singleton = Singleton::getInstance();
}

Utilizator::~Utilizator() {

}

void Utilizator::afiseazaInformatii() const {
    std::cout << "Nume utilizator: " << numeUtilizator << std::endl;
}

Utilizator& Utilizator::operator=(const Utilizator& altul) {
    if (this != &altul) {
        numeUtilizator = altul.numeUtilizator;
        parola = altul.parola;

    }
    return *this;
}
std::string Utilizator::getNumeUtilizator() const {
    return numeUtilizator;
}
int Utilizator::getTotalUtilizatori() {
    return totalUtilizatori;
}

bool Utilizator::verificaParola(const std::string& parolaIntrodusa) const {
    return parola == parolaIntrodusa;
}


Singleton* Utilizator::getSingleton() const {
    return singleton;
}
std::string Utilizator::getParola() const {
    return parola;
}

