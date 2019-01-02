-- Create DB
CREATE DATABASE pluralsight;

-- Create table 1
CREATE TABLE table1
(
    ID INT,
    Value VARCHAR(10)
);
INSERT INTO Table1
    (ID, Value)
    SELECT 1, 'First'
UNION ALL
    SELECT 2, 'Second'
UNION ALL
    SELECT 3, 'Third'
UNION ALL
    SELECT 4, 'Fourth'
UNION ALL
    SELECT 5, 'Fifth';

-- Create table 2
CREATE TABLE table2
(
    ID INT,
    Value VARCHAR(10)
);
INSERT INTO Table2
    (ID, Value)
    SELECT 1, 'First'
UNION ALL
    SELECT 2, 'Second'
UNION ALL
    SELECT 3, 'Third'
UNION ALL
    SELECT 6, 'Sixth'
UNION ALL
    SELECT 7, 'Seventh'
UNION ALL
    SELECT 8, 'Eighth';

SELECT *
FROM Table1;
SELECT *
FROM Table2;

/* INNER JOIN */
SELECT t1.*, t2.*
FROM Table1 t1
    INNER JOIN Table2 t2 ON t1.ID = t2.ID;

/* Left Join */
SELECT t1.ID AS T1ID, t1.Value AS T1Value,
    t2.ID AS T2ID, t2.Value AS T2Value
FROM Table1 t1
    LEFT JOIN Table2 t2 ON t1.ID = t2.ID;

/* Right Join */
SELECT t1.ID AS T1ID, t1.Value AS T1Value,
    t2.ID AS T2ID, t2.Value AS T2Value
FROM Table1 t1
    RIGHT JOIN Table2 t2 ON t1.ID = t2.ID;

/* FULL OUTER JOIN */
-- Following will throw an error
SELECT t1.ID AS T1ID, t1.Value AS T1Value,
    t2.ID AS T2ID, t2.Value AS T2Value
FROM Table2 t2
    FULL OUTER JOIN Table1 t1 ON t1.ID = t2.ID;


/* FULL OUTER JOIN */
    SELECT t1.ID AS T1ID, t1.Value AS T1Value,
        t2.ID AS T2ID, t2.Value AS T2Value
    FROM Table1 t1
        LEFT JOIN Table2 t2 ON t1.ID = t2.ID
UNION
    SELECT t1.ID AS T1ID, t1.Value AS T1Value,
        t2.ID AS T2ID, t2.Value AS T2Value
    FROM Table1 t1
        RIGHT JOIN Table2 t2 ON t1.ID = t2.ID;

/* CROSS JOIN */
SELECT t1.ID AS T1ID, t1.Value AS T1Value,
    t2.ID T2ID, t2.Value AS T2Value
FROM Table1 t1
CROSS JOIN Table2 t2;


----------------------- QUIZ ------------------------
-- Students
CREATE TABLE Students
(
    StudentId INT,
    StudentName VARCHAR(10)
);
INSERT INTO Students
    (StudentId, StudentName)
    SELECT 1, 'John'
UNION ALL
    SELECT 2, 'Matt'
UNION ALL
    SELECT 3, 'James';

-- Classes
CREATE TABLE Classes
(
    ClassId INT,
    ClassName VARCHAR(10)
);
INSERT INTO Classes
    (ClassId, ClassName)
    SELECT 1, 'Maths'
UNION ALL
    SELECT 2, 'Arts'
UNION ALL
    SELECT 3, 'History';

-- StudentClass
CREATE TABLE StudentClass
(
    StudentId INT,
    ClassId INT
);
INSERT INTO StudentClass
    (StudentId, ClassId)
    SELECT 1, 1
UNION ALL
    SELECT 1, 2
UNION ALL
    SELECT 3, 1
UNION ALL
    SELECT 3, 2
UNION ALL
    SELECT 3, 3;


-- Select Data
SELECT *
FROM Students;

SELECT *
FROM Classes;

SELECT *
FROM StudentClass;

/* Q1: What will be the possible join if we want to retrieve 
all the students who have signed up for the classes in the summer ? */

SELECT st.StudentName, cl.ClassName
FROM StudentClass sc
    INNER JOIN classes cl ON cl.ClassID = sc.ClassID
    INNER JOIN students st ON st.StudentID = sc.StudentID;

/* Q2: What will be the best possible join if we want to retrieve all the students who have signed up for no classes in summer ?*/

SELECT st.StudentName, cl.ClassName
FROM Students st
    LEFT JOIN StudentClass sc ON st.StudentID = sc.StudentID
    LEFT JOIN Classes cl ON cl.ClassID = sc.ClassID
WHERE cl.ClassName IS NULL;

-- shorter 
SELECT st.StudentName
FROM Students st
    LEFT JOIN StudentClass sc ON st.StudentID = sc.StudentID
WHERE sc.ClassID IS NULL;