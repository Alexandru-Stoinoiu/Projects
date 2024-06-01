
#include "student.h"
#include <iostream>

Student::Student(const std::string& numeUtilizator, const std::string& parola, int idStudent)
    : Utilizator(numeUtilizator, parola), idStudent(idStudent) {}

void Student::afiseazaInformatii() const {
    Utilizator::afiseazaInformatii();
    std::cout << "ID Student: " << idStudent << std::endl;
}

std::string Student::getTip() const {
    return "Student";
}

Student& Student::operator=(const Student& altul) {
    if (this != &altul) {
        Utilizator::operator=(altul);
        idStudent = altul.idStudent;
    }
    return *this;
}
