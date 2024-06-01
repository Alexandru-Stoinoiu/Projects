#ifndef UTILIZATOR_H
#define UTILIZATOR_H

#include <string>
#include <memory>
#include "SINGLETON.H"

class Utilizator {
public:
    Utilizator(const std::string& numeUtilizator, const std::string& parola);
    virtual ~Utilizator();
    virtual void afiseazaInformatii() const;
    virtual std::string getTip() const = 0;
    Utilizator& operator=(const Utilizator& altul);
    std::string getNumeUtilizator() const;
    static int getTotalUtilizatori();
    Singleton* getSingleton() const;
    std ::string getParola() const;

private:
    std::string numeUtilizator;
    std::string parola;
    static int totalUtilizatori;
    bool verificaParola(const std::string& parolaIntrodusa) const;
    Singleton* singleton;

};

using PtrUtilizator = std::shared_ptr<Utilizator>;
#endif
