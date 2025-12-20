create table if not exists etudiants
     (
     `id_etudiant` INT PRIMARY KEY AUTO_INCREMENT,
     `nom_etudiant` VARCHAR(40) NOT NULL ,
     `postnom_etudiant`VARCHAR(40) NOT NULL,
     `prenom_etudiant` VARCHAR(40),
     `sexe_etudiant` ENUM('M', 'F') NOT NULL,
     `age_etudiant` TINYINT UNSIGNED NOT NULL,
     `adresse` VARCHAR(100) NOT NULL,
     `matricule` VARCHAR(7) NOT NULL,
     `faculte` INT(1) NOT NULL,
     `promotion` INT(1) NOT NULL,
     `niveau` INT(1) NOT NULL,
     `date_inscription` DATE NOT NULL,
     `nationalite` VARCHAR(50) NOT NULL,
     `lieu_de_naissance` VARCHAR(200) NOT NULL,
     `date_de_naissance` DATE NOT NULL,
     `mail_etudiant` VARCHAR(100) NOT NULL,
     `telephone_etudiant` VARCHAR(15) NOT NULL,
     `description_etudiant` TEXT
     );

drop table if exists etudiants; 
create table if not exists etudiants
     (
     `id` INT PRIMARY KEY AUTO_INCREMENT,
     `nom` VARCHAR(40) NOT NULL ,
     `postnom`VARCHAR(40) NOT NULL,
     `prenom` VARCHAR(40),
     `sexe` ENUM('M', 'F') NOT NULL,
     `date_de_naissance` DATE NOT NULL,
     `age` TINYINT UNSIGNED NOT NULL,
     `lieu_de_naissance` VARCHAR(200) NOT NULL,
     `nationalite` VARCHAR(50) NOT NULL,
     `adresse` VARCHAR(100) NOT NULL,
     `telephone` VARCHAR(15) NOT NULL,
     `mail` VARCHAR(100) NOT NULL,
     `matricule` VARCHAR(7) NOT NULL,
     `faculte` INT(1) NOT NULL,
     `promotion` INT(1) NOT NULL,
     `niveau` INT(1) NOT NULL,
     `date_inscription` DATE NOT NULL,
     `description` TEXT
     ); 


create table if not exists facultes
     (
     `id_faculte` INT PRIMARY KEY AUTO_INCREMENT,
     `nom_faculte` VARCHAR(100) NOT NULL
     );

create table if not exists promotions
     (
     `id_promotion` INT PRIMARY KEY AUTO_INCREMENT,
     `nom_promotion` VARCHAR(100) NOT NULL
     );

create table if not exists niveaux
     (
     `id_niveau` INT PRIMARY KEY AUTO_INCREMENT,
     `nom_niveau` VARCHAR(100) NOT NULL
     );

ajouter des cle etrangère a la table etudiants
alter table etudiants
     add constraint fk_faculte
     foreign key (faculte) references facultes(id_faculte);     

alter table etudiants
     add constraint fk_promotion
     foreign key (promotion) references promotions(id_promotion);

alter table etudiants
     add constraint fk_niveau
     foreign key (niveau) references niveaux(id_niveau);    

drop table if exists departements;
create table if not exists departements
     (
     `id_departement` INT PRIMARY KEY AUTO_INCREMENT,
     `nom_departement` VARCHAR(100) NOT NULL
     ); 

create table if not exists facultes
     (
     `id_faculte` INT PRIMARY KEY AUTO_INCREMENT,
     `nom_faculte` VARCHAR(100) NOT NULL,
     `doyen` INT NOT NULL,
     `vice_doyen` INT NOT NULL
     );

drop table if exists promotions;
create table if not exists promotions
     (
     `id_promotion` INT PRIMARY KEY AUTO_INCREMENT,
     `niveau` ENUM('L1', 'L2', 'L3', 'M1', 'M2', 'D1', 'D2') NOT NULL,
     `faculte` INT NOT NULL,
     `departement` INT,
     `frais_academique` INT NOT NULL,
     `titulaire` INT NOT NULL,
     `vice_titu` INT NOT NULL,
     foreign key (titulaire) references professeurs(id_professeur),
     foreign key (vice_titu) references professeurs(id_professeur),
     foreign key (faculte) references facultes(id_faculte),
     foreign key (departement) references departements(id_departement)
     );

     create table if not exists departements
     (
     `id_departement` INT PRIMARY KEY AUTO_INCREMENT,
     `nom_departement` VARCHAR(100) NOT NULL,
     `faculte` INT NOT NULL
     );

     create table if not exists cours
     (  
	`id_cours` INT PRIMARY KEY AUTO_INCREMENT,
	`nom_cours` VARCHAR(100) NOT NULL,
	`description` VARCHAR(255),
	`credit` INT NOT NULL,
	`titulaire` INT NOT NULL,
	`assistant` INT NOT NULL,
	`promotion` INT NOT NULL
     );

     
     create table if not exists professeurs
     (
     `id_professeur` INT PRIMARY KEY AUTO_INCREMENT,
     `nom` VARCHAR(40) NOT NULL ,
     `postnom`VARCHAR(40) NOT NULL,
     `prenom` VARCHAR(40),
     `sexe` ENUM('M', 'F') NOT NULL,
     `date_de_naissance` DATE NOT NULL,
     `age` TINYINT UNSIGNED NOT NULL,
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