-- JOINS
-- [First names of students and instructors with the same gender and address]
SELECT INSTRUCTOR.FIRST_NAME, STUDENT.FIRST_NAME
FROM INSTRUCTOR
JOIN STUDENT
ON INSTRUCTOR.GENDER = STUDENT.GENDER
AND INSTRUCTOR.ADDRESS = STUDENT.ADDRESS;

-- [First names and last names of the instructors giving the courses]
SELECT COURSE.COURSE_NAME, INSTRUCTOR.FIRST_NAME, INSTRUCTOR.LAST_NAME
FROM COURSE, INSTRUCTOR
WHERE COURSE.INSTRUCTOR_ID = INSTRUCTOR.INSTRUCTOR_ID

-- NESTED QUERIES
-- [ID of students with grades A or B]
SELECT STUDENT_ID
FROM GRADE
WHERE LETTER_GRADE = 'A' OR LETTER_GRADE = 'B'

-- [ID of students taking GROWTH or DBMS courses]
SELECT STUDENT_ID
FROM GRADE
WHERE COURSE_ID
IN (SELECT COURSE_ID
FROM COURSE
WHERE COURSE_NAME = 'GROWTH' OR COURSE_NAME='DBMS');

-- SET OPERATIONS

-- [Faculty names of students with ID 12345 and students with ID 19238]
SELECT FACULTY_NAME
FROM FACULTY
WHERE STUDENT_ID = 12345
UNION
SELECT FACULTY_NAME
FROM FACULTY
WHERE STUDENT_ID = 19238

-- [First name, last name and ID of instructors
-- whose address is Istanbul and who are female]
SELECT FIRST_NAME,LAST_NAME, INSTRUCTOR_ID
FROM INSTRUCTOR
WHERE GENDER = 'FEMALE'
INTERSECT
SELECT FIRST_NAME,LAST_NAME, INSTRUCTOR_ID
FROM INSTRUCTOR
WHERE ADDRESS = 'ISTANBUL'

-- AGGREGATE OPERATIONS WITH JOINS
-- [All the grade information with students first name and last name]
SELECT GRADE.*, STUDENT.FIRST_NAME, STUDENT.LAST_NAME
FROM GRADE
JOIN STUDENT
ON GRADE.STUDENT_ID = STUDENT.STUDENT_ID;

-- [Faculty names where student names are registered]
SELECT FACULTY.FACULTY_NAME, STUDENT.FIRST_NAME
FROM FACULTY
JOIN STUDENT
ON FACULTY.STUDENT_ID = STUDENT.STUDENT_ID;
