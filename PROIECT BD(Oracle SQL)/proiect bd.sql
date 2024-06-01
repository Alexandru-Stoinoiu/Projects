CREATE TABLE Abonamente (
    ID_Abonament NUMBER(7) PRIMARY KEY,
    Tip_Abonament VARCHAR(50),
    Cost_Abonament DECIMAL(10, 2)
);


INSERT INTO Abonamente (ID_Abonament, Tip_Abonament, Cost_Abonament) VALUES
(1, 'Abonament Lunar', 15.99);
INSERT INTO Abonamente (ID_Abonament, Tip_Abonament, Cost_Abonament) VALUES
(2, 'Abonament Anual', 150.00);

Select * From Abonamente;

CREATE TABLE Cititori (
    ID_Cititor NUMBER(7) PRIMARY KEY,
    Nume_Cititor VARCHAR(100),
    Adresa VARCHAR(255),
    Email VARCHAR(100),
    ID_Abonament INT NOT NULL,
    CONSTRAINT fk_abonament FOREIGN KEY (ID_Abonament) REFERENCES Abonamente(ID_Abonament)
);

INSERT INTO Cititori (ID_Cititor, Nume_Cititor, Adresa, Email, ID_Abonament) VALUES
(1, 'Adrian Ionut', 'Bulevardul Camile Ressu, Nr. 42', 'adrian.ionut@gmail.com', 1);
INSERT INTO Cititori (ID_Cititor, Nume_Cititor, Adresa, Email, ID_Abonament) VALUES
(2, 'Cristescu Andrei', 'Bulevardul Theodor Pallady, Nr. 7', 'cristescu.andrei@yahoo.com.com', 2);
INSERT INTO Cititori (ID_Cititor, Nume_Cititor, Adresa, Email, ID_Abonament) VALUES
(3, 'Munteanu Gabriel', 'Bulevardul Nicolae Grigorescu, Nr. 42', 'munteanu.gabriel@gmail.com', 1);
INSERT INTO Cititori (ID_Cititor, Nume_Cititor, Adresa, Email, ID_Abonament) VALUES
(4, 'Budau Fabian', 'Bulevardul Theodor Pallady, Nr. 66', 'budau.fabian@yahoo.com.com', 1);

Select * From Cititori;

CREATE TABLE Editura (
    ID_Editura NUMBER(7) PRIMARY KEY,
    Nume_Editura VARCHAR(100),
    Tara_Sediu VARCHAR(50)
);

INSERT INTO Editura (ID_Editura, Nume_Editura, Tara_Sediu) VALUES
(1, 'Editura Bibliophile', 'Romania');
INSERT INTO Editura (ID_Editura, Nume_Editura, Tara_Sediu) VALUES
(2, 'Editura Canonica', 'Romania');

Select * From Editura;



CREATE TABLE Angajati_B (
    ID_Angajat NUMBER(7) PRIMARY KEY,
    Nume_Angajat VARCHAR(100),
    Pozitie VARCHAR(50),
    Data_Angajare DATE,
    Salariu DECIMAL(10, 2)
);

INSERT INTO Angajati_B (ID_Angajat, Nume_Angajat, Pozitie, Data_Angajare, Salariu) VALUES
(1, 'Alex Dinescu', 'Bibliotecar', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 2500.00);
INSERT INTO Angajati_B (ID_Angajat, Nume_Angajat, Pozitie, Data_Angajare, Salariu) VALUES
(2, 'Andra Demircan', 'Manager Sectiune', TO_DATE('2019-03-15', 'YYYY-MM-DD'), 3000.00);
INSERT INTO Angajati_B (ID_Angajat, Nume_Angajat, Pozitie, Data_Angajare, Salariu) VALUES
(3, 'Filip Popa', 'Ingrijitor', TO_DATE('2012-09-19', 'YYYY-MM-DD'), 1900.00);
INSERT INTO Angajati_B (ID_Angajat, Nume_Angajat, Pozitie, Data_Angajare, Salariu) VALUES
(4, 'Denis Botea', 'Manager Sectiune', TO_DATE('2021-11-09', 'YYYY-MM-DD'), 3000.00);

Select * From Angajati_B;

CREATE TABLE Evenimente (
    ID_Eveniment NUMBER(7) PRIMARY KEY,
    Nume_Eveniment VARCHAR(100),
    Data_Eveniment DATE,
    Locatie VARCHAR(100),
    ID_AngajatResponsabil INT NOT NULL,
    CONSTRAINT fk_angajat_eveniment FOREIGN KEY (ID_AngajatResponsabil) REFERENCES Angajati_B(ID_Angajat)
);

INSERT INTO Evenimente (ID_Eveniment, Nume_Eveniment, Data_Eveniment, Locatie, id_angajatresponsabil) VALUES
(1, 'Lansare carte noua', TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Sala de Lectura', 2);
INSERT INTO Evenimente (ID_Eveniment, Nume_Eveniment, Data_Eveniment, Locatie, id_angajatresponsabil) VALUES
(2, 'Sesiune de autografe', TO_DATE('2024-01-17', 'YYYY-MM-DD'), 'Holul Bibliotecii', 2);

Select * From Evenimente;

CREATE TABLE Sectiune (
    ID_Sectiune NUMBER(7) PRIMARY KEY,
    Nume_Sectiune VARCHAR(100),
    ID_AngajatResponsabil INT NOT NULL,
    CONSTRAINT fk_angajat_sectiune FOREIGN KEY (ID_AngajatResponsabil) REFERENCES Angajati_B(ID_Angajat)
);

INSERT INTO Sectiune (ID_Sectiune, Nume_Sectiune, ID_AngajatResponsabil) VALUES
(1, 'Fictiune', 1);
INSERT INTO Sectiune (ID_Sectiune, Nume_Sectiune, ID_AngajatResponsabil) VALUES
(2, 'Stiinte', 2);
INSERT INTO Sectiune (ID_Sectiune, Nume_Sectiune, ID_AngajatResponsabil) VALUES
(3, 'Romance', 4);

SELECT * FROM Sectiune;

CREATE TABLE Carte (
    ID_Carte NUMBER(7) PRIMARY KEY,
    Titlu VARCHAR(255),
    Autor VARCHAR(50),
    ID_Editura INT NOT NULL,
    ID_Sectiune INT NOT NULL,
    CONSTRAINT fk_editura FOREIGN KEY (ID_Editura) REFERENCES Editura(ID_Editura),
    CONSTRAINT fk_sectiune FOREIGN KEY (ID_Sectiune) REFERENCES Sectiune(ID_Sectiune)
);


INSERT INTO Carte (ID_Carte, Titlu, Autor, ID_Editura, ID_Sectiune) VALUES
(1, 'Cronicile Bibliotecii', 'Gabriel Ionita' , 1, 1);
INSERT INTO Carte (ID_Carte, Titlu, Autor, ID_Editura, ID_Sectiune) VALUES
(2, 'Colt Alb', 'Jack London', 2, 2);
INSERT INTO Carte (ID_Carte, Titlu, Autor, ID_Editura, ID_Sectiune) VALUES
(3, 'Harry Potter Si Piatra Filozofala', 'J.K. Rowling', 1, 1); 
INSERT INTO Carte (ID_Carte, Titlu, Autor, ID_Editura, ID_Sectiune) VALUES
(4, '1984', 'George Orwell', 2, 1);
INSERT INTO Carte (ID_Carte, Titlu, Autor, ID_Editura, ID_Sectiune) VALUES
(5, 'M�ndrie si Prejudecata', 'Jane Austen', 1, 2);
INSERT INTO Carte (ID_Carte, Titlu, Autor, ID_Editura, ID_Sectiune) VALUES
(6, 'Crima din Orient Express', 'Agatha Christie', 2, 2);
INSERT INTO Carte (ID_Carte, Titlu, Autor, ID_Editura, ID_Sectiune) VALUES
(7, 'To Kill a Mockingbird', 'Harper Lee', 1, 3);
INSERT INTO Carte (ID_Carte, Titlu, Autor, ID_Editura, ID_Sectiune) VALUES
(8, 'Cercul de piatr?', 'Diana Gabaldon', 2, 3); 

Select * From Carte;


CREATE TABLE Imprumuturi(
    ID_Imprumut NUMBER(7) PRIMARY KEY,
    ID_Cititor INT NOT NULL,
    ID_Carte INT NOT NULL,
    Data_Imprumut DATE,
    Data_Restituire DATE,
    CONSTRAINT fk_cititor FOREIGN KEY (ID_Cititor) REFERENCES Cititori(ID_Cititor),
    CONSTRAINT fk_carte FOREIGN KEY (ID_Carte) REFERENCES Carte(ID_Carte)
);

INSERT INTO Imprumuturi (ID_Imprumut, ID_Cititor, ID_Carte, Data_Imprumut, Data_Restituire) VALUES
(1, 1, 2, TO_DATE('2024-01-5', 'YYYY-MM-DD'), TO_DATE('2024-02-05', 'YYYY-MM-DD'));
INSERT INTO Imprumuturi (ID_Imprumut, ID_Cititor, ID_Carte, Data_Imprumut, Data_Restituire) VALUES
(2, 2, 1, TO_DATE('2024-01-09', 'YYYY-MM-DD'), TO_DATE('2024-02-09', 'YYYY-MM-DD'));
INSERT INTO Imprumuturi (ID_Imprumut, ID_Cititor, ID_Carte, Data_Imprumut, Data_Restituire) VALUES
(3, 3, 6, TO_DATE('2024-01-09', 'YYYY-MM-DD'), TO_DATE('2024-02-09', 'YYYY-MM-DD'));
INSERT INTO Imprumuturi (ID_Imprumut, ID_Cititor, ID_Carte, Data_Imprumut, Data_Restituire) VALUES
(4, 2, 4, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-02-10', 'YYYY-MM-DD'));


Select * From Imprumuturi;



DROP TABLE CARTE CASCADE CONSTRAINTS;
DROP TABLE ABONAMENTE CASCADE CONSTRAINTS;
DROP TABLE CITITORI CASCADE CONSTRAINTS;
DROP TABLE IMPRUMUTURI CASCADE CONSTRAINTS;
DROP TABLE EDITURA CASCADE CONSTRAINTS;
DROP TABLE SECTIUNE CASCADE CONSTRAINTS;
DROP TABLE ANGAJATI_B CASCADE CONSTRAINTS;
DROP TABLE EVENIMENTE CASCADE CONSTRAINTS;
