-- TRIGGER 1
CREATE OR REPLACE FUNCTION delete_followments() RETURNS trigger AS $delete_followments$
DECLARE
	nb numeric;
BEGIN
	SELECT COUNT(*) INTO nb
	FROM Followments
	WHERE course_id = OLD.id;
	IF nb > 0 THEN
		DELETE FROM Followments
  		WHERE course_id = OLD.id;
	END IF;
	RETURN OLD;
END;
$delete_followments$ LANGUAGE plpgsql;

CREATE TRIGGER delete_followments AFTER DELETE ON Courses
    FOR EACH ROW EXECUTE PROCEDURE delete_followments();



-- TRIGGER 2
CREATE OR REPLACE FUNCTION delete_old_exams() RETURNS trigger AS $delete_old_exams$
DECLARE
	nb numeric;
BEGIN
	SELECT COUNT(*) INTO nb
	FROM Old_Exams
	WHERE course_id = OLD.id;
	IF nb > 0 THEN
		SELECT COUNT(*) INTO nb
		FROM COMMENTS
		WHERE old_exam_id IN (
				SELECT id FROM Old_Exams
				WHERE course_id = Old.id);
		IF nb > 0 THEN
			DELETE FROM Comments
			WHERE old_exam_id IN (
				SELECT id FROM Old_Exams
				WHERE course_id = Old.id);
		END IF;
		DELETE FROM Old_Exams
  		WHERE course_id = OLD.id;
	END IF;
	RETURN OLD;
END;
$delete_old_exams$ LANGUAGE plpgsql;

CREATE TRIGGER delete_old_exams BEFORE DELETE ON Courses
    FOR EACH ROW EXECUTE PROCEDURE delete_old_exams();


-- TRIGGER 3
CREATE OR REPLACE FUNCTION delete_comments() RETURNS trigger AS $delete_comments$
DECLARE
	nb numeric;
BEGIN
	SELECT COUNT(*) INTO nb
	FROM Comments
	WHERE old_exam_id = OLD.id;
	IF nb > 0 THEN
		DELETE FROM Comments
  		WHERE old_exam_id = OLD.id;
	END IF;
	RETURN OLD;
END;
$delete_comments$ LANGUAGE plpgsql;

CREATE TRIGGER delete_comments BEFORE DELETE ON Old_Exams
    FOR EACH ROW EXECUTE PROCEDURE delete_comments();
