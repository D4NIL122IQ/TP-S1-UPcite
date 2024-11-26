----------Connexion BD------------------------
$ psql -host opale maitrisedb
$ mdp

 // Connexion

$
$ \d  // visualiser le schema de la bd
          List of relations
 Schema |    Name     | Type  | Owner 
--------+-------------+-------+-------
 public | etudiant    | table | soto
 public | etudiant_td | table | soto
 public | etudiant_ue | table | soto
 public | td          | table | soto
 public | ue          | table | soto


$ \d etudiant;
$ \d etudiant_td;
$ \d etudiant_ue;
$ \d td;
$ \d  ue;

$ exit || \q 

--------------------------------------------------

--------------PART 2----------------------
$ man pg_dump 

$ pg_dump -h opale --inserts --data-only  maitrisedb

$ pg_dump -h opale --inserts --data-only -t etudiant maitrisedb

$pg_dump -h opale --no-owner --no-privileges --clean -f dump_maitrisedb  maitrisedb

-------------PART 3-------------------------------

$ psql -h opale -f dump_maitrisedb BDlogin 