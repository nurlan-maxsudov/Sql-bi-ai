DROP TABLE IF EXISTS student;

CREATE TABLE student(
    student_id INTEGER PRIMARY KEY IDENTITY,
    classes INTEGER,
    tuition_per_class FLOAT,
    total_tuition AS (tuition_per_class * classes)
);

INSERT INTO student
VALUES (15, 200.0), (5, 345), (7, 210);

SELECT * FROM student;
