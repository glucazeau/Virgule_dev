<?php

//conection:
$link = mysqli_connect("localhost","root","","virgule") or die("Error " . mysqli_error($link));

//consultation:

$query = "SELECT c1.id
FROM course c1 
INNER JOIN course c2 
ON c1.day_of_week = c2.day_of_week 
AND c1.start_time = c2.start_time 
AND c1.end_time = c2.end_time 
AND c1.id != c2.id
AND c1.fk_semester = c2.fk_semester
ORDER BY c1.id" or die("Error in the consult.." . mysqli_error($link));

//execute the query.

$result = $link->query($query);

//display information:

while($row = mysqli_fecth_array($result)) {
  echo $row["name"] . "<br>";
} 
?> 
