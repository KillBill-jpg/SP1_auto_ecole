drop database if exists auto_ecole;
create database auto_ecole;
use auto_ecole;

create table user (
    id_user int auto_increment,
    email varchar(100) not null unique,
    mdp varchar(100) not null,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    role enum('admin', 'moniteur', 'candidat') default 'candidat',
    constraint pk_user primary key (id_user)
);

create table candidat (
    id_candidat int auto_increment,
    nomC varchar(50) not null,
    prenomC varchar(50) not null,
    date_naissanceC date not null,
    adresseC varchar(100),
    telephoneC varchar(15),
    date_inscription date not null,
    statut enum('En formation', 'Examen en cours', 'Diplome', 'Abandonne') default 'En formation',
    constraint pk_candidat primary key (id_candidat)
);

create table moniteur (
    id_moniteur int auto_increment,
    nomM varchar(50) not null,
    prenomM varchar(50) not null,
    emailM varchar(100) not null unique,
    telephoneM varchar(15),
    date_embauche DATE not null,
    constraint pk_moniteur primary key (id_moniteur)
);

create table vehicule (
    id_vehicule int auto_increment,
    immat varchar(20) not null unique,
    date_Achat date not null,
    nb_km int not null,
    energie varchar(20) not null,
    marque varchar(50) not null,
    modele varchar(50) not null,
    type_vehicule VARCHAR(50),
    constraint pk_vehicule primary key (id_vehicule)
);

create table lecon (
    id_lecon int auto_increment,
    id_candidat int,
    id_moniteur int,
    id_vehicule int,
    date_lecon datetime not null,
    libelle varchar(100),
    duree_lecon int not null,
    compterendu text,
    constraint pk_lecon primary key (id_lecon),
    foreign key (id_candidat) references candidat(id_candidat) on delete cascade,
    foreign key (id_moniteur) references moniteur(id_moniteur),
    foreign key (id_vehicule) references vehicule(id_vehicule)
);

create table examen (
    id_examen int auto_increment,
    id_candidat int not null,
    id_moniteur int,
    id_vehicule int,
    type_examen varchar(50) not null,
    lieu_examen varchar(100),
    date_examen datetime not null,
    resultat enum('En attente', 'Reussi', 'Echoue') default 'En attente',
    remarques text,
    constraint pk_examen primary key (id_examen),
    foreign key (id_candidat) references candidat(id_candidat) on delete cascade,
    foreign key (id_moniteur) references moniteur(id_moniteur),
    foreign key (id_vehicule) references vehicule(id_vehicule)
);

insert into user values (null, 'admin@admin.fr', 'adminpass', 'Admin', 'Systeme', 'admin'),
                        (null, 'admin@castellane.fr', 'adminpass',     'Dupont', 'Marie',    'admin'),
                        (null, 'martin@castellane.fr', 'moniteur123',  'Martin', 'Pierre',   'moniteur'),
                        (null, 'bernard@castellane.fr', 'moniteur123',  'Bernard', 'Sophie',   'moniteur'),
                        (null, 'leroy@castellane.fr', 'moniteur123',  'Leroy', 'Jacques',  'moniteur'),
                        (null, 'lucas.petit@email.fr', 'candidat123',  'Petit', 'Lucas',    'candidat'),
                        (null, 'emma.moreau@email.fr', 'candidat123',  'Moreau', 'Emma',     'candidat'),
                        (null, 'noah.simon@email.fr', 'candidat123',  'Simon', 'Noah',     'candidat'),
                        (null, 'jade.laurent@email.fr', 'candidat123',  'Laurent', 'Jade',     'candidat'),
                        (null, 'leo.michel@email.fr', 'candidat123',  'Michel',    'Léo',      'candidat'),
                        (null, 'chloe.garcia@email.fr', 'candidat123',  'Garcia',    'Chloé',    'candidat'),
                        (null, 'lopez@ca.fr', 'Santana123', 'Lopez', 'Santana', 'candidat'),
                        (null, 'jones@ca.com', 'Mercedes123', 'Jones', 'Mercedes', 'candidat'),
                        (null, 'kurt@ca.com', 'Kurt123', 'Hummel', 'Kurt', 'candidat'),
                        (null, 'durand@ca.com', 'Sophie123', 'Durand', 'Sophie', 'candidat');

insert into moniteur values (null, 'Martin',  'Pierre',   'martin@castellane.fr',     '0612345601',   '2018-03-15'),
                            (null, 'Bernard', 'Sophie',   'bernard@castellane.fr',    '0612345602',   '2020-09-01'),
                            (null, 'Leroy',   'Jacques',  'leroy@castellane.fr',      '0612345603',   '2022-01-10'),


insert into candidat values (null, 'Petit',   'Lucas',    '2005-04-12', '12 rue des Lilas, Toulon',         '0611223301', '2025-09-01', 'En formation'),
                            (null, 'Moreau',  'Emma',     '2004-07-23', '45 avenue de la Mer, Toulon',      '0611223302', '2025-09-15', 'En formation'),
                            (null, 'Simon',   'Noah',     '2005-01-08', '8 boulevard Victor Hugo, La Garde','0611223303', '2025-10-01', 'Examen en cours'),
                            (null, 'Laurent', 'Jade',     '2003-11-30', '22 rue du Port, Hyères',           '0611223304', '2025-10-15', 'Examen en cours'),
                            (null, 'Michel',  'Léo',      '2004-03-17', '5 impasse des Roses, Toulon',      '0611223305', '2025-11-01', 'Diplome'),
                            (null, 'Garcia',  'Chloé',    '2006-08-25', '18 rue Gambetta, La Garde',        '0611223306', '2026-01-10', 'En formation'),
                            (null, 'Lopez', 'Santana', '1990-05-15', '123 Rue de la Paix, Paris', '0123456789', '2026-01-10', 'En formation'),
                            (null, 'Jones', 'Mercedes', '1995-08-20', '456 Avenue des Champs, Lyon', '0987654321', '2026-02-05', 'En formation'),
                            (null, 'Hummel', 'Kurt', '1992-12-01', '789 Boulevard Saint-Michel, Marseille', '0112233445', '2026-03-15', 'En formation'),
                            (null, 'Durand', 'Sophie', '2005-06-10', '10 rue des Fleurs, Toulon', '0611223307', '2025-09-20', 'En formation');

insert into vehicule values (null, 'AB-247-CD', '2021-06-01', 42000, 'Essence',    'Peugeot', '207',   'Voiture'),
                            (null, 'EF-583-GH', '2021-06-01', 38500, 'Essence',    'Peugeot', '207',   'Voiture'),
                            (null, 'IJ-912-KL', '2022-03-15', 29800, 'Diesel',     'Peugeot', '207',   'Voiture'),
                            (null, 'MN-374-OP', '2022-03-15', 31200, 'Essence',    'Peugeot', '207',   'Voiture'),
                            (null, 'QR-651-ST', '2023-01-20', 15600, 'Diesel',     'Peugeot', '207',   'Voiture'),
                            (null, 'UV-128-WX', '2021-09-10', 18900, 'Essence',    'Yamaha',  'MT-05', 'Moto'),
                            (null, 'YZ-496-AB', '2021-09-10', 22400, 'Essence',    'Yamaha',  'MT-05', 'Moto'),
                            (null, 'CD-837-EF', '2022-06-05', 11300, 'Essence',    'Yamaha',  'MT-05', 'Moto'),
                            (null, 'GH-265-IJ', '2022-06-05', 14700, 'Essence',    'Yamaha',  'MT-05', 'Moto'),
                            (null, 'KL-743-MN', '2023-02-14',  8200, 'Essence',    'Yamaha',  'MT-05', 'Moto');



insert into lecon values    (null, 1, 1, 1, '2026-03-03 09:00:00', 'Permis B', 60, 'premiere lecon, debutant mais motive'),
                            (null, 1, 1, 1, '2026-03-10 09:00:00', 'Permis B', 60, 'prise en main du vehicule correcte'),
                            (null, 1, 1, 1, '2026-03-17 09:00:00', 'Permis B', 60, 'travail gestion des distances'),
                            (null, 1, 1, 1, '2026-03-24 09:00:00', 'Permis B', 60, 'conduite en ville timide mais correcte'),
                            (null, 1, 1, 1, '2026-04-07 09:00:00', 'Permis B', 60, 'progres constants, priorites a consolider'),
                            (null, 1, 1, 1, '2026-04-14 09:00:00', 'Permis B', 60, 'voie rapide abordee, bonne maitrise'),
                            (null, 1, 1, 1, '2026-05-05 09:00:00', 'Permis B', 60, 'preparation examen, niveau satisfaisant'),
                            (null, 1, 1, 1, '2026-05-19 09:00:00', 'Permis B', 60, 'derniere lecon avant examen, candidat pret'),
                            (null, 1, 1, 1, '2026-06-09 09:00:00', 'Permis B', 60, 'repetition generale avant examen'),
                            (null, 1, 1, 1, '2026-06-11 08:00:00', 'Permis B', 60, 'lecon accompagnement jour j'),
                            (null, 1, 1, 1, '2026-06-18 09:00:00', 'Permis B', 60, 'suite formation apres resultat'),
                            (null, 1, 1, 1, '2026-06-25 09:00:00', 'Permis B', 60, 'correction des points faibles'),
                            (null, 2, 2, 2, '2026-03-04 10:00:00', 'Conduite accompagnee', 60, 'debut AAC, accompagnateur bien forme'),
                            (null, 2, 2, 2, '2026-03-11 10:00:00', 'Conduite accompagnee', 60, 'bonne progression, conduite souple'),
                            (null, 2, 2, 2, '2026-03-18 10:00:00', 'Conduite accompagnee', 60, 'gestion trafic urbain acquise'),
                            (null, 2, 2, 2, '2026-03-25 10:00:00', 'Conduite accompagnee', 60, 'voie rapide maitrisee'),
                            (null, 2, 2, 2, '2026-04-08 10:00:00', 'Conduite accompagnee', 60, 'tres bonne candidate, niveau homogene'),
                            (null, 2, 2, 2, '2026-05-06 10:00:00', 'Conduite accompagnee', 60, 'prete pour examen'),
                            (null, 2, 2, 2, '2026-05-20 10:00:00', 'Conduite accompagnee', 60, 'derniere lecon accompagnee avant passage'),
                            (null, 2, 2, 2, '2026-06-10 09:00:00', 'Conduite accompagnee', 60, 'dernier entrainement avant passage'),
                            (null, 2, 2, 2, '2026-06-17 10:00:00', 'Conduite accompagnee', 60, 'lecon post-examen'),
                            (null, 2, 2, 2, '2026-06-24 10:00:00', 'Conduite accompagnee', 60, 'amelioration suite retour examen'),
                            (null, 3, 3, 3, '2026-03-05 14:00:00', 'Permis B', 60, 'remise a niveau, bonne base'),
                            (null, 3, 3, 3, '2026-03-12 14:00:00', 'Permis B', 60, 'travail sur les points faibles'),
                            (null, 3, 3, 3, '2026-04-09 14:00:00', 'Permis B', 60, 'niveau suffisant pour passer'),
                            (null, 3, 3, 3, '2026-05-07 14:00:00', 'Permis B', 60, 'bonne maitrise generale'),
                            (null, 3, 3, 3, '2026-06-02 14:00:00', 'Permis B', 60, 'preparation finale, confiant'),
                            (null, 3, 3, 3, '2026-06-12 14:00:00', 'Permis B', 60, 'lecon post-examen, bilan resultat'),
                            (null, 3, 3, 3, '2026-06-19 14:00:00', 'Permis B', 60, 'analyse erreurs examen'),
                            (null, 3, 3, 3, '2026-06-26 14:00:00', 'Permis B', 60, 'preparation second passage'),
                            (null, 4, 1, 6, '2026-03-06 11:00:00', 'Permis A', 60, 'travail plateau, bonne maitrise'),
                            (null, 4, 1, 6, '2026-03-13 11:00:00', 'Permis A', 60, 'circulation urbaine ok'),
                            (null, 4, 1, 6, '2026-03-20 11:00:00', 'Permis A', 60, 'plateau maitrise, circulation a consolider'),
                            (null, 4, 1, 6, '2026-04-10 11:00:00', 'Permis A', 60, 'bonne maitrise generale moto'),
                            (null, 4, 1, 6, '2026-05-08 11:00:00', 'Permis A', 60, 'preparation examen moto, tres bon niveau'),
                            (null, 4, 1, 6, '2026-05-22 11:00:00', 'Permis A', 60, 'candidate prete pour le passage'),
                            (null, 4, 1, 6, '2026-06-13 11:00:00', 'Permis A', 60, 'bilan semaine examen moto'),
                            (null, 4, 1, 6, '2026-06-20 11:00:00', 'Permis A', 60, 'perfectionnement post-examen'),
                            (null, 5, 1, 1, '2026-01-10 09:00:00', 'Permis B', 60, 'lecon de perfectionnement'),
                            (null, 5, 1, 1, '2026-01-17 09:00:00', 'Permis B', 60, 'consolidation acquis'),
                            (null, 5, 1, 7, '2026-02-07 09:00:00', 'Permis A', 60, 'debut formation moto'),
                            (null, 5, 1, 7, '2026-02-14 09:00:00', 'Permis A', 60, 'bonne prise en main moto'),
                            (null, 5, 1, 7, '2026-03-07 09:00:00', 'Permis A', 60, 'niveau suffisant, pret pour examen'),
                            (null, 6, 2, 4, '2026-03-04 14:00:00', 'Permis B', 60, 'debut conduite, prise en main difficile'),
                            (null, 6, 2, 4, '2026-03-11 14:00:00', 'Permis B', 60, 'progres encourageants'),
                            (null, 6, 2, 4, '2026-03-18 14:00:00', 'Permis B', 60, 'conduite en ville timide mais correcte'),
                            (null, 6, 2, 4, '2026-03-25 14:00:00', 'Permis B', 60, 'bonne progression generale'),
                            (null, 6, 2, 4, '2026-04-08 14:00:00', 'Permis B', 60, 'encore quelques hesitations'),
                            (null, 6, 2, 4, '2026-05-06 14:00:00', 'Permis B', 60, 'nette amelioration, a poursuivre'),
                            (null, 6, 2, 4, '2026-05-20 14:00:00', 'Permis B', 60, 'bonne maitrise globale'),
                            (null, 6, 2, 4, '2026-06-19 14:00:00', 'Permis B', 60, 'formation continue'),
                            (null, 6, 2, 4, '2026-06-26 14:00:00', 'Permis B', 60, 'bonne progression'),
                            (null, 6, 2, 4, '2026-07-03 14:00:00', 'Permis B', 60, 'presque prete pour passer'),
                            (null, 7, 3, 5, '2026-03-05 10:00:00', 'Permis B', 60, 'bonne prise en main, travail sur les manoeuvres'),
                            (null, 7, 3, 5, '2026-03-12 10:00:00', 'Permis B', 60, 'progres sur les creneaux'),
                            (null, 7, 3, 5, '2026-04-09 10:00:00', 'Permis B', 60, 'conduite en ville maitrisee'),
                            (null, 7, 3, 5, '2026-04-16 10:00:00', 'Permis B', 60, 'voie rapide ok, bonne gestion priorites'),
                            (null, 7, 3, 5, '2026-05-07 10:00:00', 'Permis B', 60, 'preparation examen, tres bon niveau'),
                            (null, 7, 3, 5, '2026-05-21 10:00:00', 'Permis B', 60, 'candidat pret pour le passage'),
                            (null, 7, 3, 5, '2026-06-09 10:00:00', 'Permis B', 60, 'mise en condition avant examen'),
                            (null, 7, 3, 5, '2026-06-18 10:00:00', 'Permis B', 60, 'suite formation apres examen'),
                            (null, 7, 3, 5, '2026-06-25 10:00:00', 'Permis B', 60, 'correction points faibles'),
                            (null, 8, 2, 2, '2026-03-04 16:00:00', 'Permis B', 60, 'debut formation, gestion intersections a revoir'),
                            (null, 8, 2, 2, '2026-03-11 16:00:00', 'Permis B', 60, 'bonnes bases, travail sur la fluidite'),
                            (null, 8, 2, 2, '2026-04-08 16:00:00', 'Permis B', 60, 'conduite fluide, creneaux a ameliorer'),
                            (null, 8, 2, 2, '2026-04-15 16:00:00', 'Permis B', 60, 'creneaux maitrisees, preparation examen'),
                            (null, 8, 2, 2, '2026-05-06 16:00:00', 'Permis B', 60, 'prete pour examen, niveau satisfaisant'),
                            (null, 8, 2, 2, '2026-05-20 16:00:00', 'Permis B', 60, 'ultime repetition avant passage'),
                            (null, 8, 2, 2, '2026-06-10 10:00:00', 'Permis B', 60, 'dernier entrainement avant examen'),
                            (null, 8, 2, 2, '2026-06-17 16:00:00', 'Permis B', 60, 'lecon post-examen, axes amelioration'),
                            (null, 8, 2, 2, '2026-06-24 16:00:00', 'Permis B', 60, 'preparation repassage'),
                            (null, 9, 3, 3, '2026-03-05 16:00:00', 'Permis B', 60, 'bonne maitrise globale, quelques hesitations'),
                            (null, 9, 3, 3, '2026-03-12 16:00:00', 'Permis B', 60, 'travail sur autoroute, bien'),
                            (null, 9, 3, 3, '2026-04-09 16:00:00', 'Permis B', 60, 'tres bon niveau general'),
                            (null, 9, 3, 3, '2026-04-16 16:00:00', 'Permis B', 60, 'preparation examen, manoeuvres parfaites'),
                            (null, 9, 3, 3, '2026-05-07 16:00:00', 'Permis B', 60, 'candidat confirme, pret pour le passage'),
                            (null, 9, 3, 3, '2026-06-09 16:00:00', 'Permis B', 60, 'mise en condition avant examen'),
                            (null, 9, 3, 3, '2026-06-18 16:00:00', 'Permis B', 60, 'analyse erreurs examen'),
                            (null, 9, 3, 3, '2026-06-25 16:00:00', 'Permis B', 60, 'preparation second passage'),
                            (null, 10, 3, 5, '2026-03-05 12:00:00', 'Permis B', 60, 'debut formation, motivation evidente'),
                            (null, 10, 3, 5, '2026-03-12 12:00:00', 'Permis B', 60, 'bonne prise en main'),
                            (null, 10, 3, 5, '2026-04-09 12:00:00', 'Permis B', 60, 'progres reguliers'),
                            (null, 10, 3, 5, '2026-04-16 12:00:00', 'Permis B', 60, 'conduite en ville acquise'),
                            (null, 10, 3, 5, '2026-05-07 12:00:00', 'Permis B', 60, 'voie rapide travaillee, bon bilan'),
                            (null, 10, 3, 5, '2026-05-21 12:00:00', 'Permis B', 60, 'prete pour passer'),
                            (null, 10, 3, 5, '2026-06-11 12:00:00', 'Permis B', 60, 'lecon jour j, mise en confiance'),
                            (null, 10, 3, 5, '2026-06-18 12:00:00', 'Permis B', 60, 'poursuite formation'),
                            (null, 10, 3, 5, '2026-06-25 12:00:00', 'Permis B', 60, 'bonne evolution'),
                            (null, 10, 3, 5, '2026-07-02 12:00:00', 'Permis B', 60, 'niveau quasi suffisant pour passer');


insert into examen values (null, 5, null, null, 'Code de la route',  'Centre d examen de Toulon',  '2026-02-20 09:00:00', 'Reussi',   '38/40, obtenu du premier coup'),
                        (null, 5, 1,    1,   'Conduite Permis B', 'Centre d examen de Toulon',  '2026-03-20 10:00:00', 'Reussi',   'permis obtenu, felicitations'),
                        (null, 5, 1,    7,   'Conduite Permis A', 'Centre d examen de Toulon',  '2026-04-17 10:00:00', 'Reussi',   'permis moto obtenu, excellent niveau'),
                        (null, 3, 2, null, 'Code de la route',  'Centre d examen de La Garde', '2026-04-15 09:00:00', 'Reussi',     'code obtenu, 36/40'),
                        (null, 3, 3, 3,    'Conduite Permis B', 'Centre d examen de La Garde', '2026-06-11 14:00:00', 'En attente', 'candidat pret pour le passage'),
                        (null, 4, null, null, 'Code de la route',  'Centre d examen de Hyeres', '2026-03-10 09:00:00', 'Reussi',     'code obtenu 35/40'),
                        (null, 4, 1,    6,    'Conduite Permis A', 'Centre d examen de Hyeres', '2026-06-13 10:00:00', 'En attente', 'niveau moto tres correct'),
                        (null, 1, null, null, 'Code de la route',  'Centre d examen de Toulon', '2026-04-20 09:00:00', 'Reussi',     'code obtenu 37/40'),
                        (null, 1, 1,    1,    'Conduite Permis B', 'Centre d examen de Toulon', '2026-06-11 10:00:00', 'En attente', 'examen prevu le jour j'),
                        (null, 1, 1,    1,    'Conduite Permis B', 'Centre d examen de Toulon', '2026-06-25 10:00:00', 'En attente', 'repassage si echec le 11'),
                        (null, 2, null, null, 'Code de la route',  'Centre d examen de Toulon', '2026-04-22 09:00:00', 'Reussi',     'code obtenu 36/40'),
                        (null, 2, 2,    2,    'Conduite Permis B', 'Centre d examen de Toulon', '2026-06-12 14:00:00', 'En attente', 'candidate serieuse, bon niveau'),
                        (null, 7, null, null, 'Code de la route',  'Centre d examen de Toulon', '2026-05-05 09:00:00', 'Reussi',     'code obtenu 35/40'),
                        (null, 7, 3,    5,    'Conduite Permis B', 'Centre d examen de Toulon', '2026-06-11 16:00:00', 'En attente', 'candidat serieux, pret'),
                        (null, 8, null, null, 'Code de la route',  'Centre d examen de La Garde', '2026-05-10 09:00:00', 'Reussi',     'code obtenu 33/40'),
                        (null, 8, 2,    2,    'Conduite Permis B', 'Centre d examen de La Garde', '2026-06-12 10:00:00', 'En attente', 'candidate motivee'),
                        (null, 9, null, null, 'Code de la route',  'Centre d examen de Toulon', '2026-05-12 09:00:00', 'Reussi',     'code obtenu 37/40'),
                        (null, 9, 3,    3,    'Conduite Permis B', 'Centre d examen de Toulon', '2026-06-13 14:00:00', 'En attente', 'candidat confirme, bon niveau'),
                        (null, 10, null, null, 'Code de la route',  'Centre d examen de Toulon', '2026-05-15 09:00:00', 'Reussi',     'code obtenu 36/40'),
                        (null, 10, 3,    5,    'Conduite Permis B', 'Centre d examen de Toulon', '2026-06-11 14:00:00', 'En attente', 'candidate prete'),
                        (null, 6, null, null, 'Code de la route',  'Centre d examen de La Garde', '2026-07-05 09:00:00', 'En attente', 'premier passage code'),
                        (null, 6, 2,    4,    'Conduite Permis B', 'Centre d examen de La Garde', '2026-07-16 14:00:00', 'En attente', 'premier passage conduite planifie');




--Trigger pour le chevauchement des lecons

delimiter //

create trigger verif_chevauchement_lecon
before insert on lecon
for each row
begin
    declare fin_nouvelle datetime;
    declare nb_conflit_candidat int;
    declare nb_conflit_moniteur int;
    declare nb_conflit_vehicule int;
    
    set fin_nouvelle = date_add(new.date_lecon, interval new.duree_lecon minute);
    
    select count(*) into nb_conflit_candidat
    from lecon
    where id_candidat = new.id_candidat
      and id_lecon != ifnull(new.id_lecon, 0)
      and new.date_lecon < date_add(date_lecon, interval duree_lecon minute)
      and fin_nouvelle > date_lecon;
    
    if nb_conflit_candidat > 0 then
        signal sqlstate '45000'
        set message_text = 'ERREUR : Ce candidat a déjà une leçon sur ce créneau !';
    end if;
    
    if new.id_moniteur is not null then
        select count(*) into nb_conflit_moniteur
        from lecon
        where id_moniteur = new.id_moniteur
          and id_lecon != ifnull(new.id_lecon, 0)
          and new.date_lecon < date_add(date_lecon, interval duree_lecon minute)
          and fin_nouvelle > date_lecon;
        
        if nb_conflit_moniteur > 0 then
            signal sqlstate '45000'
            set message_text = 'ERREUR : Ce moniteur est déjà occupé sur ce créneau !';
        end if;
    end if;
    
    if new.id_vehicule is not null then
        select count(*) into nb_conflit_vehicule
        from lecon
        where id_vehicule = new.id_vehicule
          and id_lecon != ifnull(new.id_lecon, 0)
          and new.date_lecon < date_add(date_lecon, interval duree_lecon minute)
          and fin_nouvelle > date_lecon;
        
        if nb_conflit_vehicule > 0 then
            signal sqlstate '45000'
            set message_text = 'ERREUR : Ce véhicule est déjà réservé sur ce créneau !';
        end if;
    end if;
end//

delimiter //

create trigger verif_chevauchement_lecon_update
before update on lecon
for each row
begin
    declare fin_nouvelle datetime;
    declare nb_conflit_candidat int;
    declare nb_conflit_moniteur int;
    declare nb_conflit_vehicule int;
    
    set fin_nouvelle = date_add(new.date_lecon, interval new.duree_lecon minute);
    
    select count(*) into nb_conflit_candidat
    from lecon
    where id_candidat = new.id_candidat
      and id_lecon != new.id_lecon
      and new.date_lecon < date_add(date_lecon, interval duree_lecon minute)
      and fin_nouvelle > date_lecon;
    
    if nb_conflit_candidat > 0 then
        signal sqlstate '45000'
        set message_text = 'ERREUR : Ce candidat a déjà une leçon sur ce créneau !';
    end if;
    
    if new.id_moniteur is not null then
        select count(*) into nb_conflit_moniteur
        from lecon
        where id_moniteur = new.id_moniteur
          and id_lecon != new.id_lecon
          and new.date_lecon < date_add(date_lecon, interval duree_lecon minute)
          and fin_nouvelle > date_lecon;
        
        if nb_conflit_moniteur > 0 then
            signal sqlstate '45000'
            set message_text = 'ERREUR : Ce moniteur est déjà occupé sur ce créneau !';
        end if;
    end if;
    
    if new.id_vehicule is not null then
        select count(*) into nb_conflit_vehicule
        from lecon
        where id_vehicule = new.id_vehicule
          and id_lecon != new.id_lecon
          and new.date_lecon < date_add(date_lecon, interval duree_lecon minute)
          and fin_nouvelle > date_lecon;
        
        if nb_conflit_vehicule > 0 then
            signal sqlstate '45000'
            set message_text = 'ERREUR : Ce véhicule est déjà réservé sur ce créneau !';
        end if;
    end if;
end//

delimiter ;                          

                        

