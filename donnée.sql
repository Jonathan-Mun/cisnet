INSERT INTO professeurs 
(nom, postnom, prenom, sexe, date_de_naissance, lieu_de_naissance, nationalite, adresse, telephone, mail, grade, specialite, date_recrutement)
VALUES
('Kabila','Ilunga','Jean','M','1975-03-12','Lubumbashi','Congolaise','Lubumbashi','099111222','jean.kabila@univ.cd','Professeur','Informatique','2005-10-01'),
('Mukendi','Kasongo','Paul','M','1980-06-21','Kananga','Congolaise','Kananga','097222333','paul.mukendi@univ.cd','Docteur','Mathématiques','2010-09-15'),
('Tshibangu','Kalala','Marie','F','1982-11-05','Mbuji-Mayi','Congolaise','Mbuji-Mayi','098333444','marie.tshibangu@univ.cd','Professeur','Gestion','2012-01-10');

INSERT INTO facultes (nom_faculte, doyen, vice_doyen)
VALUES ('Sciences Informatiques', 1, 2);

INSERT INTO departements (nom_departement, faculte)
VALUES ('Informatique de Gestion', 1);

INSERT INTO promotions (niveau, faculte, departement)
VALUES
('L1', 1, 1),
('L2', 1, 1);

INSERT INTO frais_academique (montant_local, montant_etranger, id_promotion)
VALUES
(500000, 800000, 1),
(550000, 850000, 2);





INSERT INTO etudiants
(nom, postnom, prenom, sexe, date_de_naissance, lieu_de_naissance, nationalite, adresse, telephone, mail, matricule, promotion, date_inscription)
VALUES
('Ilunga','Mutombo','David','M','2003-01-12','Kinshasa','Congolaise','Kin','099000001','david1@mail.com','MAT001',1,'2023-10-01'),
('Kabeya','Kasongo','Patrick','M','2002-02-14','Kananga','Congolaise','Kananga','099000002','patrick2@mail.com','MAT002',1,'2023-10-01'),
('Tshomba','Kalala','Grace','F','2003-03-20','Mbuji-Mayi','Congolaise','Mbuji','099000003','grace3@mail.com','MAT003',1,'2023-10-01'),
('Mbuyi','Lukusa','Daniel','M','2002-04-10','Lubumbashi','Congolaise','Lushi','099000004','daniel4@mail.com','MAT004',1,'2023-10-01'),
('Banza','Kanku','Esther','F','2003-05-05','Kikwit','Congolaise','Kikwit','099000005','esther5@mail.com','MAT005',1,'2023-10-01'),

('Nkoy','Mpoyi','Samuel','M','2002-06-12','Kinshasa','Congolaise','Kin','099000006','samuel6@mail.com','MAT006',2,'2022-10-01'),
('Kalombo','Kabasele','Joseph','M','2001-07-18','Kolwezi','Congolaise','Kolwezi','099000007','joseph7@mail.com','MAT007',2,'2022-10-01'),
('Lukusa','Muanza','Deborah','F','2002-08-22','Matadi','Congolaise','Matadi','099000008','deborah8@mail.com','MAT008',2,'2022-10-01'),
('Minga','Tumba','Patrick','M','2001-09-15','Boma','Congolaise','Boma','099000009','patrick9@mail.com','MAT009',2,'2022-10-01'),
('Sumbu','Kibonge','Aline','F','2002-10-30','Bandundu','Congolaise','Bandundu','099000010','aline10@mail.com','MAT010',2,'2022-10-01'),

('Kanku','Muteba','Joel','M','2003-11-11','Kinshasa','Congolaise','Kin','099000011','joel11@mail.com','MAT011',1,'2023-10-01'),
('Mukuna','Tshilombo','Sarah','F','2003-12-01','Mbuji-Mayi','Congolaise','Mbuji','099000012','sarah12@mail.com','MAT012',1,'2023-10-01'),
('Bondo','Kiala','Michel','M','2002-01-25','Matadi','Congolaise','Matadi','099000013','michel13@mail.com','MAT013',1,'2023-10-01'),
('Ilunga','Mubiala','Clarisse','F','2003-02-14','Kinshasa','Congolaise','Kin','099000014','clarisse14@mail.com','MAT014',1,'2023-10-01'),
('Mabiala','Nsenga','Eric','M','2002-03-03','Boma','Congolaise','Boma','099000015','eric15@mail.com','MAT015',1,'2023-10-01'),

('Kiala','Mavungu','Junior','M','2001-04-04','Matadi','Congolaise','Matadi','099000016','junior16@mail.com','MAT016',2,'2022-10-01'),
('Lemba','Tshilengi','Pauline','F','2002-05-17','Kinshasa','Congolaise','Kin','099000017','pauline17@mail.com','MAT017',2,'2022-10-01'),
('Ngoma','Kalombo','Alex','M','2001-06-09','Lubumbashi','Congolaise','Lushi','099000018','alex18@mail.com','MAT018',2,'2022-10-01'),
('Kasongo','Mutombo','Irene','F','2002-07-27','Kananga','Congolaise','Kananga','099000019','irene19@mail.com','MAT019',2,'2022-10-01'),
('Tshimanga','Kafuti','Yves','M','2001-08-08','Mbandaka','Congolaise','Mbandaka','099000020','yves20@mail.com','MAT020',2,'2022-10-01');

INSERT INTO assistants (nom, postnom, prenom, sexe, date_de_naissance, telephone, mail, role)
VALUES
('Mbuyi','Kalala','Jean','M','1990-02-12','099111111','jean.mbuyi@mail.com','Assistant'),
('Kibonge','Mavungu','Claire','F','1992-05-20','099222222','claire.kibonge@mail.com','TA'),
('Lukusa','Tshilengi','Paul','M','1991-11-10','099333333','paul.lukusa@mail.com','CT');

INSERT INTO cours (intitule, code_cours, credit, semestre, professeur, assistant, promotion)
VALUES
('Algorithmique','INF101',4,'S1',1,1,1),
('Programmation C','INF102',3,'S1',1,2,1),
('Mathématiques Discrètes','MAT101',4,'S1',2,3,1),
('Structures de Données','INF103',4,'S2',1,1,1),
('Bases de Données','INF104',3,'S2',1,2,1),

('Systèmes d’Exploitation','INF201',4,'S1',2,1,2),
('Réseaux Informatiques','INF202',3,'S1',2,2,2),
('Programmation Java','INF203',3,'S1',1,3,2),
('Mathématiques Avancées','MAT201',4,'S1',2,3,2),
('Gestion de Projet','GES201',2,'S2',3,2,2),

('Intelligence Artificielle','INF301',4,'S1',1,1,2),
('Programmation Python','INF302',3,'S1',1,2,2),
('SGBD Avancés','INF303',3,'S2',2,3,2),
('Sécurité Informatique','INF304',4,'S2',3,1,2),
('Analyse et Conception','INF305',3,'S2',1,2,2),

('Statistiques','MAT301',3,'S1',2,1,2),
('Marketing Digital','GES301',2,'S2',3,3,2),
('Économie Appliquée','GES302',2,'S1',3,2,1),
('Développement Web','INF306',3,'S2',1,1,1),
('Systèmes Distribués','INF307',4,'S2',2,3,2);
