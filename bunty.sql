create database mini_project;
use mini_project;
-- Students Table 
 
CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    Name VARCHAR(50), 
    Age INT, 
    Gender VARCHAR(10) 
);
-- Courses Table 
 
CREATE TABLE Courses ( 
    CourseID INT PRIMARY KEY, 
    CourseName VARCHAR(50), 
    Instructor VARCHAR(50) 
);
CREATE TABLE Enrollments ( 
    EnrollmentID INT PRIMARY KEY, 
    StudentID INT, 
    CourseID INT, 
    Grade INT, 
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
);

insert into students (StudentID , Name , Age , Gender)values(1 , 'Alice' , 20 , 'Female') , (2 , 'Bob' , 21 , 'Male') , (3 , 'Charlie' , 22 , 'Male') , (4 , 'Diana' , 23 , 'Female') , (5 , 'Esha' , 20 , NULL);
insert into courses(CourseID , CourseName , Instructor) values (101 , 'Mathematics' , 'DR. Rao') , (102 , 'Computer Science' , 'DR. Iyer') , (103 , 'Physics' , 'DR. Gupta');
insert into enrollments(EnrollmentID , StudentID , CourseID, Grade)values ( 1, 1, 101 , 85) , (2, 1, 102 , 92) , (3 , 2 , 101 , 78) , (4 , 2 , 103 , 67) , (5 , 3 , 101 , 88) , (6, 3 , 102 , 91) , (7 , 4 , 103 , 72) , (8 , 4 , 102 , 65) , (9 , 2 , 102 , 65) , (10 , 4 , 101 , 73) , (11 , 5 , 103 , null);
select s.name , c.CourseName , e.grade from students s join courses c natural join enrollments e;


SELECT c.CourseName, AVG(e.Grade) AS AvgGrade
FROM Courses c JOIN Enrollments e ON c.CourseID =
e.CourseID GROUP BY c.CourseName;

select c.CourseName , count(e.StudentID) as studentcount from courses c join enrollments e on c.CourseID = e.courseID group by c.CourseName;


select
	s.Name ,
    e.grade as mark
from 
	students s 
join 
	enrollments e 
where 
	s.StudentID = e.StudentID 
and
	grade > 90;
    
    SELECT 
    s.Name, 
    c.CourseName, 
    e.Grade
FROM 
    Enrollments e
JOIN 
    Students s ON e.StudentID = s.StudentID
JOIN 
    Courses c ON e.CourseID = c.CourseID
WHERE 
    (e.CourseID, e.Grade) IN (
        SELECT 
            CourseID, MAX(Grade)
        FROM 
            Enrollments
        GROUP BY 
            CourseID
    );
    
    
    SELECT 
    s.Name, 
    c.CourseName, 
    e.Grade,
    CASE 
        WHEN e.Grade >= 90 THEN 'A'
        WHEN e.Grade >= 75 THEN 'B'
        WHEN e.Grade >= 60 THEN 'C'
        ELSE 'D'
    END AS GradeBand
FROM 
    Enrollments e
JOIN 
    Students s ON e.StudentID = s.StudentID
JOIN 
    Courses c ON e.CourseID = c.CourseID;
    
    SELECT 
    s.StudentID,
    s.Name,
    COUNT(e.CourseID) AS TotalCourses
FROM 
    Enrollments e
JOIN 
    Students s ON e.StudentID = s.StudentID
GROUP BY 
    s.StudentID, s.Name
HAVING 
    COUNT(e.CourseID) > 1;
    
    SELECT 
    s.StudentID,
    s.Name,
    AVG(e.Grade) AS AverageGrade
FROM 
    Enrollments e
JOIN 
    Students s ON e.StudentID = s.StudentID
GROUP BY 
    s.StudentID, s.Name;
    
    SELECT 
    Gender, 
    COUNT(*) AS Total
FROM 
    Students
GROUP BY 
    Gender;
    
    SELECT 
    s.StudentID,
    s.Name,
    AVG(e.Grade) AS StudentAvg
FROM 
    Enrollments e
JOIN 
    Students s ON e.StudentID = s.StudentID
GROUP BY 
    s.StudentID, s.Name
HAVING 
    AVG(e.Grade) > (
        SELECT AVG(Grade) FROM Enrollments
    );
    
    