#include "student.h"
#include "profesor.h"
#include "librar.h"
#include "utilizator.h"
#include "singleton.h"
#include "FunctiiUtilitare.h"
#include <vector>
#include <iostream>

class Exceptie : public std::exception
{
public:
    const char* what() const noexcept override
    {
        return "Tip de utilizator invalid!";
    }
};

int main()
{
    std::vector<PtrUtilizator> utilizatori;

    try
    {
        utilizatori.push_back(std::make_shared<Student>("student1", "pass1", 123));
        utilizatori.push_back(std::make_shared<Profesor>("profesor1", "pass2", "Matematica"));
        utilizatori.push_back(std::make_shared<Librar>("librar1", "pass3", "Biblioteca Centrala"));

        for (const auto& utilizator : utilizatori)
        {
            FunctiiUtilitare<Utilizator>::afisareInformatii(*utilizator);
            utilizator->getSingleton()->doSomething();
            std::cout << "\n";
        }

        std::cout << "Total utilizatori: " << Utilizator::getTotalUtilizatori() << std::endl;

    }
    catch (const Exceptie& e)
    {
        std::cerr << "Excepție prinsă: " << e.what() << std::endl;
    }
    catch (const std::exception& e)
    {
        std::cerr << "Excepție prinsă: " << e.what() << std::endl;
    }

    std::string numeUtilizator;
    bool utilizatorGasit = false;

    do
    {
        std::cout << "Introduceti numele utilizatorului pentru autentificare: ";
        std::cin >> numeUtilizator;

        for (const auto& utilizator : utilizatori)
        {
            if (utilizator->getNumeUtilizator() == numeUtilizator)
            {
                utilizatorGasit = true;
                break;
            }
        }

        if (!utilizatorGasit)
        {
            std::cout << "Nume de utilizator inexistent. Incercati din nou." << std::endl;
        }
    }
    while (!utilizatorGasit);

    const int numarMaximIncercari = 3;
    int incercariRamase = numarMaximIncercari;

    for (const auto& utilizator : utilizatori)
    {
        if (utilizator->getNumeUtilizator() == numeUtilizator)
        {
            std::string parolaCorecta = utilizator->getParola();
            std::string parolaIntrodusa;

            do
            {
                std::cout << "Introduceti parola pentru autentificare: ";
                std::cin >> parolaIntrodusa;
                std::cout << "\n";

                if (FunctiiUtilitare<std::string>::comparareObiecte(parolaCorecta, parolaIntrodusa))
                {
                    std::cout << "Autentificare reusita!" << std::endl;
                    std::cout << "\n";
                    break;
                }
                else
                {
                    std::cout << "Autentificare esuata. Parola incorecta." << std::endl;
                    std::cout << "Incercari ramase: " << --incercariRamase << std::endl;
                }

            }
            while (incercariRamase > 0);

            if (incercariRamase == 0)
            {
                std::cout << "Numarul maxim de incercari a fost atins. Cont blocat." << std::endl;
            }

            break;
        }
    }

    return 0;
}
