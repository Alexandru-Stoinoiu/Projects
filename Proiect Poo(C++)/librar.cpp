
#include "librar.h"
#include <iostream>

Librar::Librar(const std::string& numeUtilizator, const std::string& parola, const std::string& numeBiblioteca)
    : Utilizator(numeUtilizator, parola), numeBiblioteca(numeBiblioteca) {}

void Librar::afiseazaInformatii() const {
    Utilizator::afiseazaInformatii();
    std::cout << "Nume Bibliotecă: " << numeBiblioteca << std::endl;
}

std::string Librar::getTip() const {
    return "Librar";
}

Librar& Librar::operator=(const Librar& altul) {
    if (this != &altul) {
        Utilizator::operator=(altul);
        numeBiblioteca = altul.numeBiblioteca;
    }
    return *this;
}
