CREATE DATABASE alu_db;

USE alu_db;
--creating the students table(BeckymemberA)
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    classroom_id INT,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id),
    enrollment_date DATE
);
--inserting data in the table
INSERT INTO Students(student_id, name, email, classroom_id, enrollment_date)
VALUES(1, 'Gahimbare', 'gahimbare@gmail.com', 002, 02-04-2026),
(2, 'Gatore', 'gatore@gmail.com', 002, 15-11-2026),
(3, 'Brinda', 'brinda@gmail.com', 002, 25-07-2025),
(4, 'Gabimana', 'gabimana@gmail.com', 002, 09-01-2025),
(5, 'Rukiza', 'rukiza@gmail.com', 002, 18-10-2026);

--select statement (Becky)
SELECT name, email FROM Students
WHERE student_id = 5;