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

