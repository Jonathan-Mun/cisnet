DROP DATABASE IF EXISTS cisnet;
CREATE DATABASE cisnet;
USE cisnet;

-- ================= PROFESSEURS =================
CREATE TABLE professeurs (
    id_professeur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(40) NOT NULL,
    postnom VARCHAR(40) NOT NULL,
    prenom VARCHAR(40),
    sexe ENUM('M','F') NOT NULL,
    date_de_naissance DATE NOT NULL,
    lieu_de_naissance VARCHAR(200) NOT NULL,
    nationalite VARCHAR(50) NOT NULL,
    adresse VARCHAR(100) NOT NULL,
    telephone VARCHAR(15),
    mail VARCHAR(100) NOT NULL,
    grade VARCHAR(50) NOT NULL,
    specialite VARCHAR(100) NOT NULL,
    date_recrutement DATE NOT NULL,
    description TEXT
);

-- ================= ASSISTANTS =================
CREATE TABLE assistants (
    id_assistant INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(40) NOT NULL,
    postnom VARCHAR(40) NOT NULL,
    prenom VARCHAR(40),
    sexe ENUM('M','F') NOT NULL,
    date_de_naissance DATE,
    telephone VARCHAR(15),
    mail VARCHAR(100),
    role ENUM('TA','Assistant','CT') NOT NULL DEFAULT 'Assistant',
    description TEXT
);

-- ================= FACULTES =================
CREATE TABLE facultes (
    id_faculte INT AUTO_INCREMENT PRIMARY KEY,
    nom_faculte VARCHAR(100) NOT NULL,
    doyen INT NOT NULL,
    vice_doyen INT NOT NULL,
    FOREIGN KEY (doyen) REFERENCES professeurs(id_professeur),
    FOREIGN KEY (vice_doyen) REFERENCES professeurs(id_professeur)
);

-- ================= DEPARTEMENTS =================
CREATE TABLE departements (
    id_departement INT AUTO_INCREMENT PRIMARY KEY,
    nom_departement VARCHAR(100) NOT NULL,
    faculte INT NOT NULL,
    FOREIGN KEY (faculte) REFERENCES facultes(id_faculte)
);

-- ================= PROMOTIONS =================
CREATE TABLE promotions (
    id_promotion INT AUTO_INCREMENT PRIMARY KEY,
    niveau ENUM('L1','L2','L3','L4','M1','M2','D1','D2') NOT NULL,
    faculte INT NOT NULL,
    departement INT,
    FOREIGN KEY (faculte) REFERENCES facultes(id_faculte),
    FOREIGN KEY (departement) REFERENCES departements(id_departement)
);

-- ================= FRAIS ACADEMIQUES =================
CREATE TABLE frais_academique (
    id_frais INT AUTO_INCREMENT PRIMARY KEY,
    montant_local INT NOT NULL,
    montant_etranger INT NOT NULL,
    id_promotion INT NOT NULL,
    UNIQUE (id_promotion),
    FOREIGN KEY (id_promotion) REFERENCES promotions(id_promotion)
);

-- ================= ETUDIANTS =================
CREATE TABLE etudiants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(40) NOT NULL,
    postnom VARCHAR(40) NOT NULL,
    prenom VARCHAR(40),
    sexe ENUM('M','F') NOT NULL,
    date_de_naissance DATE NOT NULL,
    lieu_de_naissance VARCHAR(200) NOT NULL,
    nationalite VARCHAR(50) NOT NULL,
    adresse VARCHAR(100) NOT NULL,
    telephone VARCHAR(15),
    mail VARCHAR(100) NOT NULL,
    matricule VARCHAR(7) NOT NULL UNIQUE,
    promotion INT NOT NULL,
    date_inscription DATE NOT NULL,
    description TEXT,
    FOREIGN KEY (promotion) REFERENCES promotions(id_promotion)
);

-- ================= COURS =================
CREATE TABLE cours (
    id_cours INT AUTO_INCREMENT PRIMARY KEY,
    intitule VARCHAR(100) NOT NULL,
    code_cours VARCHAR(10) NOT NULL UNIQUE,
    credit INT NOT NULL,
    semestre ENUM('S1','S2') NOT NULL,
    professeur INT NOT NULL,
    assistant INT,
    promotion INT NOT NULL,
    FOREIGN KEY (professeur) REFERENCES professeurs(id_professeur),
    FOREIGN KEY (assistant) REFERENCES assistants(id_assistant),
    FOREIGN KEY (promotion) REFERENCES promotions(id_promotion)
);
