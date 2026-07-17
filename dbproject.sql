<<<<<<< HEAD
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
-- Member B: Insert 5 sample rows with explicit classroom_id
INSERT INTO Classroom (classroom_id, room_number, building, capacity, floor_number)
VALUES
    (1, '101', 'Block A', 30, 1),
    (2, '202', 'Block B', 25, 2),
    (3, '303', 'Block C', 40, 3),
    (4, '104', 'Block A', 35, 1),
    (5, '205', 'Block B', 20, 2);
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
=======
-- Creation of the Database

CREATE DATABASE alu_db;
USE alu_db
-- Creation on courses tabl

CREATE TABLE Courses(
	course_id INT PRIMARY KEY,
	course_name VARCHAR(100),
	credits INT,
	faculty_id INT,
	classroom_id INT,
	FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
	FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

-- Inserting into the courses table

INSERt INTO Courses 
VALUES
(101, 'English', 600, 7, 10),
(102, 'Maths', 500, 8, 11),
(103, 'Science', 800, 9, 12),
(104, 'Accounting', 700, 10, 13),
(105, 'Public_health', 300, 11, 14);


-- Updating the courses table

UPDATE Courses SET Credits = 100 WHERE course_id = 102;

-- Deleting a course_id in the Courses table

DELETE FROM Courses WHERE course_id = 103;

-- Selecting a query

SELECT course_id, course_name, credits FROM Courses WHERE credits >= 500;

>>>>>>> MemberD
