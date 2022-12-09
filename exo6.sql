DROP TABLE IF EXISTS
    OeuvreType;
CREATE TABLE OeuvreType(
    idType INTEGER(5) AUTO_INCREMENT NOT NULL,
    nomType VARCHAR(45),
    idOeuvre INTEGER(5),
    PRIMARY KEY(idType)
) ENGINE = InnoDB; DROP TABLE IF EXISTS
    Matiere;
CREATE TABLE Matiere(
    idMatiere INTEGER(5) AUTO_INCREMENT NOT NULL,
    nomMatiere VARCHAR(45),
    idOeuvre INTEGER(5),
    PRIMARY KEY(idMatiere)
) ENGINE = InnoDB; DROP TABLE IF EXISTS
    Oeuvre;
CREATE TABLE Oeuvre(
    idOeuvre INTEGER(5) AUTO_INCREMENT NOT NULL,
    titreOeuvre VARCHAR(45),
    anneeOeuvre DATE CHECK (dateNaissance > anneeOeuvre > dateDeces),
    dimensionsOeuvre VARCHAR(45),
    idExemplaire INTEGER(5),
    PRIMARY KEY(idOeuvre)
) ENGINE = InnoDB; DROP TABLE IF EXISTS
    Exemplaire;
CREATE TABLE Exemplaire(
    idExemplaire INTEGER(5) AUTO_INCREMENT NOT NULL,
    PRIMARY KEY(idExemplaire)
) ENGINE = InnoDB; DROP TABLE IF EXISTS
    Musee;
CREATE TABLE Musee(
    idMusee INTEGER(5) AUTO_INCREMENT NOT NULL,
    nomMusee VARCHAR(45),
    PRIMARY KEY(idMusee)
) ENGINE = InnoDB; DROP TABLE IF EXISTS
    Ville;
CREATE TABLE Ville(
    idVille INTEGER(5) AUTO_INCREMENT NOT NULL,
    nomVille VARCHAR(45),
    PRIMARY KEY(idVille)
) ENGINE = InnoDB; DROP TABLE IF EXISTS
    CourantArtistique;
CREATE TABLE CourantArtistique(
    idCourant INTEGER(5) AUTO_INCREMENT NOT NULL,
    nomCourant VARCHAR(45),
    debutCourant DATE CHECK (debutCourant > dateNaissance),
    finCourant DATE CHECK (finCourant < dateDeces),
    descriptionCourant VARCHAR(255),
    PRIMARY KEY(idCourant)
) ENGINE = InnoDB; DROP TABLE IF EXISTS
    Nationalite;
CREATE TABLE Nationalite(
    idNationalite INTEGER(5) AUTO_INCREMENT NOT NULL,
    nomNationalite VARCHAR(45),
    PRIMARY KEY(idNationalite)
) ENGINE = InnoDB; DROP TABLE IF EXISTS
    Artiste;
CREATE TABLE Artiste(
    idArtiste INTEGER(5) AUTO_INCREMENT NOT NULL,
    nomArtiste VARCHAR(45),
    prenomArtiste VARCHAR(45),
    dateNaissance DATE,
    dateDeces DATE,
    descriptionArtiste VARCHAR(255),
    PRIMARY KEY(idArtiste)
) ENGINE = InnoDB; DROP TABLE IF EXISTS
    est_situer;
CREATE TABLE est_situer(
    idExemplaire INTEGER(5) AUTO_INCREMENT NOT NULL,
    idMusee INTEGER(5) NOT NULL,
    PRIMARY KEY(idExemplaire, idMusee)
) ENGINE = InnoDB; DROP TABLE IF EXISTS
    est_dans;
CREATE TABLE est_dans(
    idMusee INTEGER(5) AUTO_INCREMENT NOT NULL,
    idVille INTEGER(5) NOT NULL,
    PRIMARY KEY(idMusee, idVille)
) ENGINE = InnoDB; DROP TABLE IF EXISTS
    oeuvre_appartienter_courantArtiste;
CREATE TABLE oeuvre_appartienter_courantArtiste(
    idOeuvre INTEGER(5) AUTO_INCREMENT NOT NULL,
    idCourant INTEGER(5) NOT NULL,
    PRIMARY KEY(idOeuvre, idCourant)
) ENGINE = InnoDB; DROP TABLE IF EXISTS
    artiste_posseder_nationalite;
CREATE TABLE artiste_posseder_nationalite(
    idNationalite INTEGER(5) AUTO_INCREMENT NOT NULL,
    idArtiste INTEGER(5) NOT NULL,
    PRIMARY KEY(idNationalite, idArtiste)
) ENGINE = InnoDB; DROP TABLE IF EXISTS
    artiste_participer_courant;
CREATE TABLE artiste_participer_courant(
    idCourant INTEGER(5) AUTO_INCREMENT NOT NULL,
    idArtiste INTEGER(5) NOT NULL,
    PRIMARY KEY(idCourant, idArtiste)
) ENGINE = InnoDB; DROP TABLE IF EXISTS
    est_auteur;
CREATE TABLE est_auteur(
    idOeuvre INTEGER(5) AUTO_INCREMENT NOT NULL,
    idArtiste INTEGER(5) NOT NULL,
    PRIMARY KEY(idOeuvre, idArtiste)
) ENGINE = InnoDB; ALTER TABLE
    OeuvreType ADD CONSTRAINT FK_OeuvreType_idOeuvre FOREIGN KEY(idOeuvre) REFERENCES Oeuvre(idOeuvre);
ALTER TABLE
    Matiere ADD CONSTRAINT FK_Matiere_idOeuvre FOREIGN KEY(idOeuvre) REFERENCES Oeuvre(idOeuvre);
ALTER TABLE
    Oeuvre ADD CONSTRAINT FK_Oeuvre_idExemplaire FOREIGN KEY(idExemplaire) REFERENCES Exemplaire(idExemplaire);
ALTER TABLE
    est_situer ADD CONSTRAINT FK_est_situer_idExemplaire FOREIGN KEY(idExemplaire) REFERENCES Exemplaire(idExemplaire);
ALTER TABLE
    est_situer ADD CONSTRAINT FK_est_situer_idMusee FOREIGN KEY(idMusee) REFERENCES Musee(idMusee);
ALTER TABLE
    est_dans ADD CONSTRAINT FK_est_dans_idMusee FOREIGN KEY(idMusee) REFERENCES Musee(idMusee);
ALTER TABLE
    est_dans ADD CONSTRAINT FK_est_dans_idVille FOREIGN KEY(idVille) REFERENCES Ville(idVille);
ALTER TABLE
    oeuvre_appartienter_courantArtiste ADD CONSTRAINT FK_oeuvre_appartienter_courantArtiste_idOeuvre FOREIGN KEY(idOeuvre) REFERENCES Oeuvre(idOeuvre);
ALTER TABLE
    oeuvre_appartienter_courantArtiste ADD CONSTRAINT FK_oeuvre_appartienter_courantArtiste_idCourant FOREIGN KEY(idCourant) REFERENCES CourantArtistique(idCourant);
ALTER TABLE
    artiste_posseder_nationalite ADD CONSTRAINT FK_artiste_posseder_nationalite_idNationalite FOREIGN KEY(idNationalite) REFERENCES Nationalite(idNationalite);
ALTER TABLE
    artiste_posseder_nationalite ADD CONSTRAINT FK_artiste_posseder_nationalite_idArtiste FOREIGN KEY(idArtiste) REFERENCES Artiste(idArtiste);
ALTER TABLE
    artiste_participer_courant ADD CONSTRAINT FK_artiste_participer_courant_idCourant FOREIGN KEY(idCourant) REFERENCES CourantArtistique(idCourant);
ALTER TABLE
    artiste_participer_courant ADD CONSTRAINT FK_artiste_participer_courant_idArtiste FOREIGN KEY(idArtiste) REFERENCES Artiste(idArtiste);
ALTER TABLE
    est_auteur ADD CONSTRAINT FK_est_auteur_idOeuvre FOREIGN KEY(idOeuvre) REFERENCES Oeuvre(idOeuvre);
ALTER TABLE
    est_auteur ADD CONSTRAINT FK_est_auteur_idArtiste FOREIGN KEY(idArtiste) REFERENCES Artiste(idArtiste);