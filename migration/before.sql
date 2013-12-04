
SET foreign_key_checks = 0;

UPDATE teacher SET id = 0 WHERE username = 'root_new';
INSERT INTO organization_branch (id, name, address, president_name, phone_number, fax_number, email_address) VALUES (1, 'Délégation locale de Paris III et X', '40 rue Albert Thomas 75010 Paris', 'Ludovic Tessier', '0142067905', '0142067915', 'dl.paris10@croix-rouge.fr');
INSERT INTO classroom (id, fk_organization_branch, name, comments, address) VALUES (1, '1', 'Salle de cours', 'Indisponible le mardi pour cause de réunion', '40 rue Albert Thomas 75010 Paris');
INSERT INTO classroom (id, fk_organization_branch, name, comments, address) VALUES (2, '1', 'Musée', '', '40 rue Albert Thomas 75010 Paris');
INSERT INTO classroom (id, fk_organization_branch, name, comments, address) VALUES (3, '1', 'Baby Boutique', '', '53 rue de Paradis 75010 Paris');

| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| id             | int(11)      | NO   | PRI | NULL    | auto_increment |
| name           | varchar(100) | NO   |     | NULL    |                |
| address        | varchar(250) | YES  |     | NULL    |                |
| president_name | varchar(100) | NO   |     | NULL    |                |
| phone_number   | varchar(10)  | YES  |     | NULL    |                |
| fax_number     | varchar(10)  | YES  |     | NULL    |                |
| email_address  | varchar(45)  | YES  |     | NULL    |             