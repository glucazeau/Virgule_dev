UPDATE teacher SET password = 'f07a8c01ca91605714f81222683c24aeef0c113bcd07ea726f759f126f8cc60ce210bd19fe25051f76c1a768720214056cdd0b6edff3b73aee93cc966743fa8a', salt = '4m4f1jiqk204k0ck0wog8k4oc8swscg' WHERE username != 'root';
UPDATE teacher SET fk_role_id = 3 WHERE id = '51'; 

UPDATE course c SET fk_semester = '13' WHERE c.id IN (118, 119, 121, 129);

# Update classroom for the second class found with same day and hours
UPDATE course c SET fk_class_room = '2' WHERE c.id IN (67, 84, 87, 93, 95, 102, 109, 111, 129, 124, 126, 128, 131, 133);

INSERT INTO teacher_course (course_id, teacher_id) VALUES (124, 76);

DELETE FROM comment WHERE comment = '';

UPDATE teacher SET enabled = 1, expired = 0, locked = 0, credentials_expired = 0 WHERE id IN (6, 73, 50, 75, 67, 76, 45, 72, 71, 51, 63, 53, 52, 68, 62, 74, 5, 64, 77, 70, 1);
UPDATE teacher SET phone_number = "" WHERE phone_number = "0";
UPDATE teacher SET cellphone_number = "" WHERE cellphone_number = "0";
UPDATE teacher SET credentials_expire_at = "2014-02-28 00:00:00";

UPDATE student SET phone_number = "" WHERE phone_number = "0";
UPDATE student SET cellphone_number = "" WHERE cellphone_number = "0";
UPDATE student SET registration_date = '1970-01-01' WHERE registration_date = '0000-00-00';
DELETE FROM student WHERE firstname = '' AND lastname = '';
UPDATE student SET updatedAt = NULL WHERE updatedAt = '0000-00-00 00:00:00';

UPDATE class_level SET label = 'C1' WHERE label = 'B3';

SET foreign_key_checks = 1; 
