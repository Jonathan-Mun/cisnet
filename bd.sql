     drop database if exists cisnet;
     create database if not exists cisnet;
     use cisnet;
     
     create table if not exists professeurs
     (
     `id_professeur` INT PRIMARY KEY AUTO_INCREMENT,
     `nom` VARCHAR(40) NOT NULL ,
     `postnom`VARCHAR(40) NOT NULL,
     `prenom` VARCHAR(40),
     `sexe` ENUM('M', 'F') NOT NULL,
     `date_de_naissance` DATE NOT NULL,
     `lieu_de_naissance` VARCHAR(200) NOT NULL,
     `nationalite` VARCHAR(50) NOT NULL,
     `adresse` VARCHAR(100) NOT NULL,
     `telephone` VARCHAR(15) NOT NULL,
     `mail` VARCHAR(100) NOT NULL,
     `grade` VARCHAR(50) NOT NULL,
     `specialite` VARCHAR(100) NOT NULL,
     `date_recrutement` DATE NOT NULL,
     `description` TEXT
     );

     create table if not exists assistants
     (
          `id_assistant` INT PRIMARY KEY AUTO_INCREMENT,
          `nom` VARCHAR(40) NOT NULL,
          `postnom` VARCHAR(40) NOT NULL,
          `prenom` VARCHAR(40),
          `sexe` ENUM('M','F') NOT NULL,
          `date_de_naissance` DATE,
          `telephone` VARCHAR(15),
          `mail` VARCHAR(100),
          `role` ENUM('TA','Assistant','CT') NOT NULL DEFAULT 'Assistant',
          `description` TEXT
     );

     create table if not exists facultes
          (
          `id_faculte` INT PRIMARY KEY AUTO_INCREMENT,
          `nom_faculte` VARCHAR(100) NOT NULL,
          `doyen` INT NOT NULL,
          `vice_doyen` INT NOT NULL,
          foreign key (doyen) references professeurs(id_professeur),
          foreign key (vice_doyen) references professeurs(id_professeur)
          );

     create table if not exists departements
     (
     `id_departement` INT PRIMARY KEY AUTO_INCREMENT,
     `nom_departement` VARCHAR(100) NOT NULL,
     `faculte` INT NOT NULL,
     foreign key (faculte) references facultes(id_faculte)
     );


     create table if not exists promotions
          (
          `id_promotion` INT PRIMARY KEY AUTO_INCREMENT,
          `niveau` ENUM('L1', 'L2', 'L3', 'L4', 'M1', 'M2', 'D1', 'D2') NOT NULL,
          `faculte` INT NOT NULL,
          `departement` INT,
          foreign key (faculte) references facultes(id_faculte),
          foreign key (departement) references departements(id_departement)
          );

     create table if not exists frais_academique(
     `id_frais` INT PRIMARY KEY AUTO_INCREMENT,
     `montant_local` INT NOT NULL,
     `montant_etranger` INT NOT NULL,
     `id_promotion` INT NOT NULL,
     foreign key (id_promotion) references promotions(id_promotion)
     );

     create table if not exists etudiants
     (
          `id` INT PRIMARY KEY AUTO_INCREMENT,
          `nom` VARCHAR(40) NOT NULL ,
          `postnom`VARCHAR(40) NOT NULL,
          `prenom` VARCHAR(40),
          `sexe` ENUM('M', 'F') NOT NULL,
          `date_de_naissance` DATE NOT NULL,
          `lieu_de_naissance` VARCHAR(200) NOT NULL,
          `nationalite` VARCHAR(50) NOT NULL,
          `adresse` VARCHAR(100) NOT NULL,
          `telephone` VARCHAR(15) NOT NULL,
          `mail` VARCHAR(100) NOT NULL,
          `matricule` VARCHAR(7) NOT NULL,
          `promotion` INT NOT NULL,
          `niveau` INT NOT NULL,
          `date_inscription` DATE NOT NULL,
          `description` TEXT,

          foreign key (promotion) references promotions(id_promotion)
          ); 

     create table if not exists cours
          (
          `id_cours` INT PRIMARY KEY AUTO_INCREMENT,
          `intitule` VARCHAR(100) NOT NULL,
          `code_cours` VARCHAR(10) NOT NULL,
          `credit` INT NOT NULL,
          `semestre` ENUM('S1', 'S2') NOT NULL,
          `professeur` INT NOT NULL,
          `assistant` INT,
          `promotion` INT NOT NULL,   

          foreign key (promotion) references promotions(id_promotion),
          foreign key (professeur) references professeurs(id_professeur),
          foreign key (assistant) references assistants(id_assistant)
          );
     