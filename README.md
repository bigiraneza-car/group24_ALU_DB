# group24_ALU_DBA 
Relational database for a school system, built in MySQL as a team project. The database models five core entities — Students, Classroom, Faculty, Courses, and Extra_Curricular_Activities — along with two junction tables that resolve the many-to-many relationships between students and the courses/activities they participate in.

Team & Ownership

Student_Table - Becky Igiraneza
Classroom_Table - Elham Abdul Rahman
Faculty_Table - Refilwe Sodlulashe
Courses_Table - Roheya Touray 
Extra_Curricular_Activities_Table - Pax Gahamanyi

Each member is responsible for their own table's CREATE TABLE statement, data types, primary/foreign keys, sample data, and individual queries. Member E owns the two junction tables since they depend on Students, Courses, and Extra_Curricular_Activities already existing.

Database

Shared database name: alu_db

All members connect to the same MySQL DBMS instance and build inside this one shared database.

Build Order

Tables must be created in dependency order so that foreign key references resolve correctly:


Students, Classroom, Faculty — no dependencies, can be created first.
Courses — depends on Faculty and Classroom already existing
Extra_Curricular_Activities, Student_Courses, Student_Activities — depend on everything above already existing


Entity Relationships


One Faculty member can teach many Courses (one-to-many)
One Classroom can host many Courses (one-to-many)
Students and Courses have a many-to-many relationship, resolved through the Student_Courses junction table
Students and Extra_Curricular_Activities have a many-to-many relationship, resolved through the Student_Activities junction table


Repository Structure

group24_ALU_DB/
├── README.md
└── dbproject.sql

All SQL lives in a single shared file, dbproject.sql, containing, in order:


CREATE DATABASE statement
All 5 CREATE TABLE statements, in dependency order, with primary key and foreign key constraints
All INSERT statements (minimum 5 sample rows per table)
Each member's individual UPDATE, DELETE, and SELECT statements, labeled with a comment giving their name
The group's 3 JOIN queries and 1 aggregate (COUNT() / GROUP BY) query
The normalization discussion, written as a comment block at the top or bottom of the file


How to Run

bashmysql -u <your_username> -p < dbproject.sql

Or, from inside the MySQL client:

sqlSOURCE dbproject.sql;

This creates alu_db, builds all tables in dependency order, and populates them with sample data.

Individual Tasks (per member)

Each member, for their own table:


 CREATE TABLE statement matching the schema diagram, with correct data types
 Primary key defined
 Foreign key(s) defined, referencing the correct table/column
 At least 5 sample rows inserted (INSERT INTO)
 One UPDATE statement
 One DELETE statement
 One SELECT query with a WHERE clause


Group Tasks

Once all 5 tables exist and are populated:


 Relationships check — confirm every foreign key points to a valid primary key in another table (no orphaned references)
 Normalization check — written discussion of whether any table repeats data that should live elsewhere, and whether the junction tables correctly avoid many-to-many duplication
 3 JOIN queries pulling data across multiple tables into a full sentence, e.g.:

"Student X is enrolled in Course Y, taught by Faculty Z, in Classroom W."
"Student X participates in Activity Y, advised by Faculty Z."
One additional join query of the group's choice



 1 aggregate query using COUNT() or GROUP BY across joined tables (e.g. number of students per course)


Contribution Guidelines


Every member commits their own table's SQL directly to this repository — individual engagement is tracked through commit history, so work should not be pushed by a single person on everyone's behalf.
Commits should be small and attributable: one commit per table, one commit per join query, rather than a single dump at the time.
