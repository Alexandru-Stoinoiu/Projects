
#ifndef STUDENT_H
#define STUDENT_H

#include "utilizator.h"

class Student : public Utilizator {
public:
    Student(const std::string& numeUtilizator, const std::string& parola, int idStudent);
    void afiseazaInformatii() const override;
    std::string getTip() const override;
    Student& operator=(const Student& altul);

private:
    int idStudent;
};

#endif
