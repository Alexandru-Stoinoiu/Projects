
#include "profesor.h"
#include <iostream>

Profesor::Profesor(const std::string& numeUtilizator, const std::string& parola, const std::string& materie)
    : Utilizator(numeUtilizator, parola), materie(materie) {}

void Profesor::afiseazaInformatii() const {
    Utilizator::afiseazaInformatii();
    std::cout << "Materie: " << materie << std::endl;
}

std::string Profesor::getTip() const {
    return "Profesor";
}

Profesor& Profesor::operator=(const Profesor& altul) {
    if (this != &altul) {
        Utilizator::operator=(altul);
        materie = altul.materie;
    }
    return *this;
}
