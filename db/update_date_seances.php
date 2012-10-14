<?php
mysql_connect('localhost', 'root', 'root');
mysql_select_db('croixrouge');

$sql = "SELECT id_cours, heure_debut FROM alpha_cours";
$results = mysql_query($sql) or die (mysql_error());
	
while($cours = mysql_fetch_assoc($results)) {
	$heure_debut = $cours['heure_debut'];
	$id_cours = $cours['id_cours'];
	$sql = 'UPDATE alpha_seances SET date_seance = CONCAT(DATE_FORMAT(date_seance, \'%Y-%c-%d\'), \' \', \''.$heure_debut.'\')';
	$sql .= ' WHERE fk_id_cours = '.$id_cours;
	
	mysql_query($sql) or die (mysql_error());
}
?>