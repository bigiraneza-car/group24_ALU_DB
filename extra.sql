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
-- (Removes student 4 from the Music Ensemble activity safely)
DELETE FROM Student_Activities 
WHERE student_id = 4 AND activity_id = 5;

-- Member E: Individual Select Statement with WHERE
-- Modified to account for the updated category name
SELECT * FROM Extra_Curricular_Activities 
WHERE category IN ('Arts', 'Visual & Performing Arts');