UPDATE teacher SET password = 'password';
# Update classroom for the second class found with same day and hours
UPDATE course c set fk_class_room = '2' WHERE c.id IN (67, 84, 87, 93, 95, 102, 109, 111, 129, 124, 126, 128, 131);
UPDATE course c set alternate_enddate = '2013-09-01' WHERE c.id IN (118, 119, 121, 129);

INSERT INTO teacher_course (course_id, teacher_id) VALUES (124, 76);

#DELETE FROM course WHERE id = '122';
SET foreign_key_checks = 1; 
