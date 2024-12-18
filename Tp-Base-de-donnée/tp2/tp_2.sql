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

SELECT DISTINCT J.nom , J.nationalite
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
SELECT J.nom, J.nationalite
FROM joueur J , gain G
WHERE J.nom = G.nomJoueur 
        AND G.date = 1985
        AND G.lieuTournoi = 'Roland Garros'
        AND J.nom IN (SELECT J2.nom 
                      FROM joueur J2 , gain G2
                      WHERE J2.nom = G2.nomJoueur 
                      AND G2.date = 1985
                      AND G2.lieuTournoi = 'Wimbledon ');

----- 3. JUSTE AVEC DES EXISTS -----  

SELECT nom , nationalite
FROM joueur 
WHERE EXISTS (SELECT *
                FROM gain 
                WHERE  nom = nomJoueur 
                    AND date = 1985
                    AND lieuTournoi = 'Roland Garros')
        AND  EXISTS (SELECT *
                      FROM gain
                      WHERE  nom = nomJoueur 
                            AND date = 1985
                            AND lieuTournoi = 'Wimbledon');

---- DEFI : sans sous-requete sans IN sans EXISTS sans INTERSECT ---

SELECT nom, nationalite
FROM joueur ,gain G1 , gain G2
WHERE nom = G1.nomJoueur
        AND G1.lieuTournoi = 'Roland Garros'
        AND G1.date = 1985
        AND nom = G2.nomJoueur
        AND G2.lieuTournoi = 'Wimbledon'
        AND G2.date = 1985;

---- DEFI : avec sous-requete sans IN sans EXISTS sans INTERSECT ---
SELECT nom , nationalite 
FROM joueur 
WHERE nom = ANY (SELECT J2.nom 
                      FROM joueur J2 , gain G2
                      WHERE J2.nom = G2.nomJoueur 
                      AND G2.date = 1985
                      AND G2.lieuTournoi = 'Roland Garros')

        AND nom = ANY(SELECT J2.nom 
                      FROM joueur J2 , gain G2
                      WHERE J2.nom = G2.nomJoueur 
                      AND G2.date = 1985
                      AND G2.lieuTournoi = 'Wimbledon ');


-- l -- 
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
        -- II -- 
SELECT nomJoueur
FROM gain
WHERE lieuTournoi = 'Roland Garros'
GROUP BY nomJoueur
HAVING min(prime) >= 1000000;



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
        AND EXISTS (SELECT DISTINCT nomPerdant 
                    FROM rencontre
                    WHERE lieuTournoi = 'Wimbledon'
                            AND nomPerdant NOT IN (SELECT DISTINCT nomGagnant 
                                                    FROM rencontre
                                                    WHERE lieuTournoi = 'Wimbledon'));



-- n --
----- 1.AVEC EXISTS ---- 
SELECT DISTINCT j1.nom , j1.prenom , j2.nom , j2.prenom
FROM joueur j1, joueur j2
WHERE EXISTS (SELECT *
                FROM rencontre R
                WHERE j1.nom = R.nomGagnant
                        AND j2.nom = R.nomPerdant)
        AND NOT EXISTS (SELECT * 
                        FROM rencontre R
                        WHERE j2.nom = R.nomGagnant
                                AND j1.nom = R.nomPerdant);


----- 2. AVEC EXCEPT ---
SELECT j1.nom , j1.prenom , j2.nom , j2.prenom
FROM joueur j1, joueur j2, rencontre R
WHERE j1.nom = R.nomGagnant
        AND j2.nom = R.nomPerdant
EXCEPT
    SELECT j1.nom , j1.prenom , j2.nom , j2.prenom
    FROM joueur j1, joueur j2, rencontre R
    WHERE j2.nom = R.nomGagnant
            AND j1.nom = R.nomPerdant;


------ 3. AVEC IN -------
SELECT DISTINCT j1.nom , j1.prenom , j2.nom , j2.prenom
FROM joueur j1, joueur j2
WHERE (j1.nom , j2.nom) IN (SELECT nomGagnant , nomPerdant
                                FROM rencontre
                                where j1.nom = nomGagnant 
                                        AND j2.nom = nomPerdant)
        AND (j2.nom , j1.nom) NOT IN (SELECT nomGagnant , nomPerdant
                                FROM rencontre
                                where j2.nom = nomGagnant 
                                        AND j1.nom = nomPerdant);

-- o --
SELECT nomJoueur
FROM gain
WHERE lieuTournoi = 'Roland Garros'
GROUP BY nomJoueur
HAVING count(nomJoueur) = (SELECT count(DISTINCT date)
                            FROM gain 
                            WHERE lieuTournoi = 'Roland Garros') ;


----- EXCEPT -----
SELECT distinct nomJoueur
FROM gain g1
WHERE lieuTournoi = 'Roland Garros'
        AND NOT EXISTS ((SELECT  date
                from gain
                WHERE lieuTournoi = 'Roland Garros'
                )
                EXCEPT 
                (select date
                from gain g2
                WHERE lieuTournoi = 'Roland Garros'
                        AND g1.nomJoueur = g2.nomJoueur
                ) );

-- p --
SELECT count(*) AS nbr_Joueur_Wimbledon_1989
FROM gain
WHERE lieuTournoi = 'Wimbledon'
        AND date = 1989;

-- q --
SELECT gain.date , avg(gain.prime) AS moyenne
FROM gain
GROUP BY gain.date;

--- nbr de date par tournoi ---

SELECT  lieuTournoi ,count(DISTINCT date)
FROM gain
GROUP BY lieuTournoi;

----- nbr de date par tournoi qui possede plus de 2 date ----
SELECT  lieuTournoi ,count(DISTINCT date)
FROM gain
GROUP BY lieuTournoi
HAVING count(DISTINCT date) > 2;

-- r --
SELECT count( x.nom) , x.nom , x.prenom
FROM joueur x, joueur y
WHERE x.nom >= y.nom
GROUP BY x.nom, x.prenom 
ORDER BY 1;

-- s --
INSERT INTO joueur (nom, prenom, nationalite)
VALUES ('Guidjou' , 'Danil' , 'Algerienne');

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

-- w -- 
--modif
ALTER TABLE gain DROP constraint gain_nomjoueur_fkey;
ALTER TABLE rencontre DROP constraint rencontre_nomgagnant_fkey;
ALTER TABLE rencontre DROP constraint rencontre_nomperdant_fkey;

ALTER TABLE gain ADD FOREIGN KEY (nomJoueur) references joueur (nom) ON DELETE CASCADE;
ALTER TABLE rencontre ADD FOREIGN KEY (nomGagnant, lieuTournoi, date) references gain (nomJoueur, lieuTournoi, date) ON DELETE CASCADE;
ALTER TABLE rencontre ADD FOREIGN KEY (nomPerdant, lieuTournoi, date) references gain (nomJoueur, lieuTournoi, date) ON DELETE CASCADE;

-- supp
DELETE FROM joueur
WHERE nom = 'Noah';

-- X -- 
DELETE FROM gain 
WHERE nomJoueur NOT IN (SELECT G.nomJoueur
                        FROM gain G
                        GROUP BY nomJoueur 
                        HAVING sum(G.prime)>200000;)

-- --

