
#ifndef LIBRAR_H
#define LIBRAR_H

#include "utilizator.h"

class Librar : public Utilizator {
public:
    Librar(const std::string& numeUtilizator, const std::string& parola, const std::string& numeBiblioteca);
    void afiseazaInformatii() const override;
    std::string getTip() const override;
    Librar& operator=(const Librar& altul);

private:
    std::string numeBiblioteca;
};

#endif
