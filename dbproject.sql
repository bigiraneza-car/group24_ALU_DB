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
