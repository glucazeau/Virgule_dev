UPDATE teacher SET password = 'password';
# Update classroom for the second class found with same day and hours
UPDATE course c set fk_class_room = '2' WHERE c.id IN (67, 84, 87, 93, 95, 102, 109, 111, 129, 124, 126, 128, 131);
UPDATE course c set alternate_enddate = '2013-09-01' WHERE c.id IN (118, 119, 121, 129);

INSERT INTO teacher_course (course_id, teacher_id) VALUES (124, 76);

DELETE FROM comment WHERE comment = '';

UPDATE teacher set phone_number = "" WHERE phone_number = "0";
UPDATE teacher set cellphone_number = "" WHERE cellphone_number = "0";
UPDATE student set phone_number = "" WHERE phone_number = "0";
UPDATE student set cellphone_number = "" WHERE cellphone_number = "0";

UPDATE teacher SET (username_canonical, email_canonical, enabled, expired, locked, credentials_expired) VALUES (username, email, 0, 1, 1, 1); 
UPDATE teacher SET (enabled, expired, locked, credentials_expired) VALUES (1, 0, 0, 0) WHERE id IN (6, 73, 50, 75, 67, 76, 45, 72, 71, 51, 63, 53, 52, 68, 62, 74, 5, 64, 77, 70, 1);


#DELETE FROM course WHERE id = '122';
SET foreign_key_checks = 1; 
