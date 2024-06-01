
#ifndef PROFESOR_H
#define PROFESOR_H

#include "utilizator.h"

class Profesor : public Utilizator {
public:
    Profesor(const std::string& numeUtilizator, const std::string& parola, const std::string& materie);
    void afiseazaInformatii() const override;
    std::string getTip() const override;
    Profesor& operator=(const Profesor& altul);

private:
    std::string materie;
};

#endif
