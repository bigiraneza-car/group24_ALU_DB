<<<<<<< HEAD
CREATE DATABASE alu_db;

USE alu_db;
SHOW TABLES;
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

--select + where statement (Becky)
SELECT name, email FROM Students
WHERE student_id = 5;
--update statement(Becky)
UPDATE Students
SET email ='muhire@gmail.com'
WHERE student_id = 5;
=======
# Creation of faculty table
USE alu_db;
CREATE TABLE Faculty(
    faculty_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);
INSERT INTO Faculty(faculty_id, name, email, department)
VALUES
    (20241, 'Zintle',  'zintle@sustudent.com',  'BEng'),
    (20242, 'Amazing', 'amazing@sustudent.com', 'BEd'),
    (20243, 'Buhle',   'buhle@sustudent.com',   'BAgric'),
    (20244, 'Sibu',    'subu@sustudent.com',    'AppMath');
#Select Statement from faculty table(Refi_19)
SELECT * FROM Faculty;
#UPDATE Statement from faculty table(Refi_19)
UPDATE Faculty
SET department = 'CompSci'
WHERE faculty_id = 20241;
#DELETE statement from faculty table(Refi_19)
DELETE FROM Faculty
WHERE faculty_id = 20244;

-- =====================
-- Member B: Classroom Table
-- =====================
-- Create Classroom table
CREATE TABLE Classroom (
    classroom_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(20) NOT NULL,
    building VARCHAR(100),
    capacity INT NOT NULL,
    floor_number INT
);
-- Member B: Insert 5 sample rows
INSERT INTO Classroom (room_number, building, capacity, floor_number)
VALUES
    ('101', 'Block A', 30, 1),
    ('202', 'Block B', 25, 2),
    ('303', 'Block C', 40, 3),
    ('104', 'Block A', 35, 1),
    ('205', 'Block B', 20, 2);
-- Member B: Update one classroom
UPDATE Classroom
SET capacity = 45
WHERE classroom_id = 3;
-- Member B: Delete one classroom
DELETE FROM Classroom
WHERE classroom_id = 5;
-- Member B: Select classrooms with capacity greater than 25
SELECT * FROM Classroom
WHERE capacity > 25;
>>>>>>> f1ceeabe43edfc5ac73d3ebbb56e2ad72279afa5
