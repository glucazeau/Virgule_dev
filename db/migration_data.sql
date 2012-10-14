-- Mise à jour sexe des apprenants depuis le titre
/*
    * 0 = inconnu,
    * 1 = masculin,
    * 2 = féminin,
    * 9 = sans objet.
*/
UPDATE alpha_apprenants 
SET sexe =
	CASE
	WHEN titre = 0 THEN 1
	WHEN titre = 1 OR titre = 2 THEN 2
	ELSE 0;
	
UPDATE alpha_formateurs
SET tel_portable = NULL
WHERE tel_portable = 0;

UPDATE alpha_formateurs
SET tel_fixe = NULL
WHERE tel_fixe = 0;