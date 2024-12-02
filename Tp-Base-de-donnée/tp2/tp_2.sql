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
        AND  EXISTS (SELECT j.nom 
                      FROM joueur j , gain G
                      WHERE j.nom = J.nom
                      AND j.nom = G.nomJoueur 
                      AND G.date = 1985
                      AND G.lieuTournoi = 'Wimbledon ');


-- i -- 
----- 1. JUSTE AVEC EXCEPT ----

SELECT nomJoueur
FROM gain
WHERE lieuTournoi = 'Roland Garros'
EXCEPT 
        SELECT nomJoueur
        FROM gain
        WHERE prime < 1000000
        AND lieuTournoi = 'Roland Garros';

----- 2. SANS EXCEPT ----
SELECT nomJoueur
FROM gain
WHERE lieuTournoi = 'Roland Garros'
        AND nomJoueur NOT IN ( SELECT nomJoueur
                                FROM gain
                                WHERE prime < 1000000
                                AND lieuTournoi = 'Roland Garros');

-- m --
----- 1.AVEC INTERSECT ET EXCEPT ----

(SELECT nomGagnant
FROM rencontre
WHERE lieuTournoi = 'Roland Garros'
EXCEPT  SELECT nomPerdant
        FROM rencontre 
        WHERE lieuTournoi = 'Roland Garros')
INTERSECT
        (SELECT nomPerdant
        FROM rencontre 
        WHERE lieuTournoi = 'Wimbledon'
        EXCEPT SELECT nomGagnant
                FROM rencontre
                WHERE lieuTournoi = 'Wimbledon');

----- 2.AVEC IN et EXISTS ----

SELECT DISTINCT nomGagnant 
FROM rencontre
WHERE lieuTournoi = 'Roland Garros'
        AND nomGagnant NOT IN (SELECT DISTINCT nomPerdant 
                                FROM rencontre
                                WHERE lieuTournoi = 'Roland Garros')
        AND EXISTS (SELECT DISTINCT nomPerdant FROM rencontre
                                WHERE lieuTournoi = 'Wimbledon'
                                        AND nomPerdant NOT IN (SELECT DISTINCT nomGagnant FROM rencontre
                                                                WHERE lieuTournoi = 'Wimbledon'));

-- n --

----- 1.AVEC EXCEPT ----
-- probleme
SELECT R.nomGagnant , R.nomPerdant
FROM rencontre R, joueur J1, joueur J2
WHERE R.nomGagnant = J1.nom AND R.nomGagnant = J1.prenom
        AND R.nomPerdant = J2.nom AND R.nomGagnant = J2.prenom
        AND NOT EXISTS (SELECT *
                    FROM rencontre r1
                    WHERE R.nomGagnant = r1.nomPerdant)
        AND NOT EXISTS ( SELECT *
                        FROM rencontre r2
                        WHERE R.nomPerdant = r2.nomGagnant);

-- o --
SELECT 

-- p --
SELECT count(*)
FROM gain
WHERE lieuTournoi = 'Wimbledon'
        AND date = 1989;

-- q --
SELECT gain.date , avg(gain.prime)
FROM gain
GROUP BY gain.date;

-- r --
SELECT count() AS numero, J.nom , J.prenom
FROM joueur J;

-- s --
INSERT INTO joueur (nom, prenom, nationalite)
VALUES ('Guidjou' , 'Danil' , 'Algerie');

-- t -- 
UPDATE joueur 
SET anneeNaissance = 2004
WHERE nom = 'Guidjou';

-- u -- 
DELETE FROM joueur 
WHERE nom = 'Guidjou';

-- v -- 
DELETE FROM joueur
WHERE nom = 'Noah';  --erreur car le tuple ou nom = 'Noah' est une cle etrangere pour un tuple dans la table gain

-- w -- ; erreur
UPDATE rencontre
SET 
DELETE FROM gain 
WHERE nomJoueur = 'Noah';

DELETE FROM joueur
WHERE nom = 'Noah';

-- X --  : erreur
SELECT G.nomJoueur , G.prime
FROM gain G
WHERE 200000 > ALL (SELECT sum(prime) 
                    FROM gain
                    WHERE G.nomJoueur = nomJoueur)
GROUP BY nomJoueur , prime;

-- 