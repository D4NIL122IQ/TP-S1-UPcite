------SUPPRESSION DES TABLES --------
$ DROP TABLE etudiant ;
$ DROP TABLE etudiant_ue;
$ DROP TABLE etudiant_td;
$ DROP TABLE td;
$ DROP TABLE ue;

-------------a_ Optimisaton-----------------
$ Clés étrangères
GAIN {NomJoueur} {nomSponsor}
RENCONTRE {nomPerdant} (non implementée) 
            {nomGagnant} (non implementée)
            {nomGagnant, LieuTournoi, Date} 
            {nomGagnant , LieuTournoi, Date}

-----------d_ Creation des tables----------------

CREATE Table joueur(
    nom CHAR(20),
    prenom CHAR(15) not NULL,
    anneeNaissance INTEGER not NULL default 1930,
    nationalite CHAR(15) not NULL,
    PRIMARY KEY (nom)
);

CREATE Table sponsor (
    nom char(15) PRIMARY KEY,
    adresse varchar(20) NOT NULL,
    chiffreAffaires INTEGER
);

CREATE Table gain(
    nomJoueur CHAR(20),
    lieuTournoi CHAR(20) not NULL,
    date INTEGER,
    prime INTEGER,
    nomSponsor CHAR(15) not NULL,
    PRIMARY KEY (nomJoueur , lieuTournoi , date),
    FOREIGN KEY(nomJoueur ) references joueur (nom),
    FOREIGN KEY (nomSponsor) references sponsor(nom)
);

CREATE Table Rencontre(
    nomGagnant CHAR(20),
    nomPerdant CHAR (20),
    lieuTournoi CHAR(20) not NULL,
    date INTEGER,
    score CHAR(20),
    PRIMARY KEY (nomGagnant , nomPerdant , lieuTournoi , date) ,
    FOREIGN KEY (nomGagnant , lieuTournoi , date) references gain (nomJoueur, lieuTournoi, date),
    FOREIGN KEY (nomPerdant , lieuTournoi , date) references gain (nomJoueur, lieuTournoi, date)
);

---------------e_ ORDRE D'insertion----------
1_ tuples de joueur ou sponsor
exp : pour implemeter la table gain et rencontre on a besoin des 
    clés étrangès qu offres ces tables la  

2_ tuples de gain

3_ tuples de rencontre

----------f_ insertion---------------

$ psql -h opale -f DATA_TENNIS.sql BDlogin  (x3 parce que les données ne sont pas dans le bon ordre)

----------g_ sauvgarde------------------

$ pg_dump -h opale --no-owner --clean --insert -f dump_tennis BDlogin

----------------- requete sql -------------
-- h -- 
SELECT nomJoueur , prime
FROM gain 
WHERE nomSponsor = 'Peugeot' AND date >= 1985 AND date <= 1990;
        -- alternative date between 1985 and 1990 -- 
-- i --
SELECT nom, anneeNaissance
FROM joueur j , gain g
WHERE j.nom = g.nomJoueur 
    AND g.date = 1989
    AND g.lieuTournoi = 'Roland Garros';

-- j --

SELECT J.nom , J.nationalite
FROM joueur J , gain G , rencontre R
WHERE J.nom = G.nomJoueur 
    AND G.nomSponsor = 'Peugeot'
    AND G.nomJoueur = R.nomGagnant
    AND R.lieuTournoi = 'Roland Garros';

-- k --
---- 1. JUSTE AVEC DES INTERSECT----
SELECT J.nom , J.nationalite 
FROM joueur J , gain G
WHERE J.nom = G.nomJoueur 
        AND G.date = 1985
        AND G.lieuTournoi = 'Roland Garros'
INTERSECT
SELECT J.nom , J.nationalite 
FROM joueur J , gain G
WHERE J.nom = G.nomJoueur 
        AND G.date = 1985
        AND G.lieuTournoi = 'Wimbledon';


----- 2. JUSTE AVEC DES IN ----
SELECT J.nom , J.nationalite 
FROM joueur J , gain G
WHERE J.nom = G.nomJoueur 
        AND G.date = 1985
        AND G.lieuTournoi = 'Roland Garros'
        AND J.nom IN (SELECT J.nom 
                      FROM joueur J , gain G
                      WHERE J.nom = G.nomJoueur 
                      AND G.date = 1985
                      AND G.lieuTournoi = 'Wimbledon ');


----- 3. JUSTE AVEC DES EXISTS -----  error

SELECT J.nom , J.nationalite 
FROM joueur J , gain G
WHERE J.nom = G.nomJoueur 
        AND G.date = 1985
        AND G.lieuTournoi = 'Roland Garros'
        AND  EXISTS (SELECT J.nom 
                      FROM joueur J , gain G
                      WHERE J.nom = G.nomJoueur 
                      AND G.date = 1985
                      AND G.lieuTournoi = 'Wimbledon ');


-- i -- 
----- 1. ----