#ifndef FUNCTII_UTILITARE_H
#define FUNCTII_UTILITARE_H

#include <iostream>
#include <vector>

template <typename T>
class FunctiiUtilitare {
public:
    static void afisareInformatii(const T& utilizator) {
        utilizator.afiseazaInformatii();
    }
    template <typename U>
    static bool comparareObiecte(const U& obiect1, const U& obiect2) {
        return obiect1 == obiect2;
    }
};
#endif
