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






-- Group Task: Join Query 1
SELECT CONCAT(s.name, ' is enrolled in ', co.course_name, ', taught by ', f.name, ', in Classroom ', cl.room_number, '.') AS sentence
FROM Student_Courses sc
JOIN Students s ON sc.student_id = s.student_id
JOIN Courses co ON sc.course_id = co.course_id
JOIN Faculty f ON co.faculty_id = f.faculty_id
JOIN Classroom cl ON co.classroom_id = cl.classroom_id;

-- Group Task: Join Query 2
SELECT CONCAT(s.name, ' participates in ', a.activity_name, ', advised by ', f.name, '.') AS sentence
FROM Student_Activities sa
JOIN Students s ON sa.student_id = s.student_id
JOIN Extra_Curricular_Activities a ON sa.activity_id = a.activity_id
JOIN Faculty f ON a.faculty_advisor_id = f.faculty_id;

-- Group Task: Join Query 3 (Custom Choice: Students and their corresponding assigned classroom)
SELECT CONCAT(s.name, ' is assigned to homeroom ', cl.room_number, ' in the ', cl.building, ' building.') AS sentence
FROM Students s
JOIN Classroom cl ON s.classroom_id = cl.classroom_id;

-- Group Task: Aggregate Query (Number of students per course)
SELECT co.course_name, COUNT(sc.student_id) AS student_count
FROM Courses co
LEFT JOIN Student_Courses sc ON co.course_id = sc.course_id
GROUP BY co.course_id, co.course_name;

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

INSERT INTO Courses 
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


-- ==========================================
-- MEMBER E: EXTRA-CURRICULAR & JUNCTION TABLES
-- ==========================================

-- 1. Extra_Curricular_Activities Table
CREATE TABLE Extra_Curricular_Activities (
    activity_id INT PRIMARY KEY,
    activity_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    faculty_advisor_id INT,
    FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty(faculty_id)
);

-- 2. Student_Courses Junction Table (Many-to-Many)
CREATE TABLE Student_Courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- 3. Student_Activities Junction Table (Many-to-Many)
CREATE TABLE Student_Activities (
    student_id INT,
    activity_id INT,
    PRIMARY KEY (student_id, activity_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (activity_id) REFERENCES Extra_Curricular_Activities(activity_id)
);

-- Insert 5 activities
INSERT INTO Extra_Curricular_Activities (activity_id, activity_name, category, faculty_advisor_id) VALUES
(1, 'Robotics Club', 'STEM', 101),
(2, 'Debate Team', 'Academic', 102),
(3, 'Soccer Team', 'Sports', 103),
(4, 'Drama Club', 'Arts', 104),
(5, 'Music Ensemble', 'Arts', 105);

-- Insert sample records into Student_Courses
INSERT INTO Student_Courses (student_id, course_id) VALUES
(1, 10), (1, 11), (2, 10), (3, 12), (4, 11);

-- Insert sample records into Student_Activities
INSERT INTO Student_Activities (student_id, activity_id) VALUES
(1, 1), (1, 3), (2, 2), (3, 4), (4, 5);

-- Member E: Individual Update Statement
UPDATE Extra_Curricular_Activities 
SET category = 'Visual & Performing Arts' 
WHERE activity_id = 4;

-- Member E: Individual Delete Statement
DELETE FROM Student_Activities 
WHERE student_id = 4 AND activity_id = 5;

-- Member E: Individual Select Statement with WHERE
SELECT * FROM Extra_Curricular_Activities 
WHERE category = 'Arts';