 use StudentInformationSystem
 
 Create Table Students(
	Student_ID int Primary Key,
	First_Name varchar(10),
	Last_Name varchar(10),
	DOB date,
	email varchar(max),
	phone_number varchar(20)
);

Create Table Teachers(
	teacher_id int Primary Key,
	first_name varchar(10),
	last_name varchar(10),
	email varchar(20)
);

Create Table Courses(
	course_id int Primary Key,
	course_name varchar(10),
	credits int,
	teacher_id int,
	Foreign key(teacher_id) REFERENCES Teachers(teacher_id)
);

Create Table Enrollments(
	enrollment_id int Primary Key,
	student_id int,
	course_id int,
	enrollmentDate date,
	Foreign key(student_id) REFERENCES Students(student_id),
	Foreign key(course_id) REFERENCES Courses(course_id)
);

Create Table Payments(
	payment_id int Primary Key,
	student_id int,
	amount int,
	payment_date date
	Foreign key (student_id) REFERENCES Students(student_id) 
);


INSERT INTO Students (Student_ID, First_Name, Last_Name, DOB, email, phone_number)
VALUES
  (1, 'John', 'Doe', '1995-03-15', 'john.doe@email.com', '5551234'),
  (2, 'Jane', 'Smith', '1998-07-21', 'jane.smith@email.com', '5555678'),
  (3, 'Bob', 'Johnson', '1990-11-08', 'bob.johnson@email.com', '5559876'),
  (4, 'Alice', 'Williams', '1993-02-28', 'alice.williams@email.com', '5554321'),
  (5, 'Charlie', 'Brown', '1997-05-10', 'charlie.brown@email.com', '5558765'),
  (6, 'Eva', 'Martinez', '1994-09-03', 'eva.martinez@email.com', '5553456'),
  (7, 'David', 'Anderson', '1996-12-17', 'david.anderson@email.com', '5556543'),
  (8, 'Olivia', 'Lee', '1999-04-25', 'olivia.lee@email.com', '5557890'),
  (9, 'Mike', 'Clark', '1992-08-12', 'mike.clark@email.com', '5552109'),
  (10, 'Sophie', 'Wright', '1991-01-30', 'sophie.wright@email.com', '5551098');


INSERT INTO Teachers (teacher_id, first_name, last_name, email)
VALUES
  (1, 'Professor', 'Smith', 'prof.smith@email.com'),
  (2, 'Dr.', 'Johnson', 'dr.johnson@email.com'),
  (3, 'Mrs.', 'Williams', 'mrs.williams@email.com'),
  (4, 'Mr.', 'Brown', 'mr.brown@email.com'),
  (5, 'Ms.', 'Martinez', 'ms.martinez@email.com'),
  (6, 'Professor', 'Anderson', 'prof.anderson@email.com'),
  (7, 'Dr.', 'Lee', 'dr.lee@email.com'),
  (8, 'Mrs.', 'Clark', 'mrs.clark@email.com'),
  (9, 'Mr.', 'Wright', 'mr.wright@email.com'),
  (10, 'Ms.', 'Taylor', 'ms.taylor@email.com');

ALTER TABLE Teachers
Alter COLUMN email VARCHAR(max);

INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
  (1, 'Math', 3, 1),
  (2, 'English', 4, 2),
  (3, 'History', 3, 3),
  (4, 'Science', 4, 4),
  (5, 'Spanish', 3, 5),
  (6, 'CSE', 4, 6),
  (7, 'Physics', 3, 7),
  (8, 'Chemistry', 4, 8),
  (9, 'Art', 3, 9),
  (10, 'Economics', 4, 10);



INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollmentDate)
VALUES
  (1, 1, 1, '2023-01-10'),
  (2, 2, 2, '2023-02-15'),
  (3, 3, 3, '2023-03-20'),
  (4, 4, 4, '2023-04-25'),
  (5, 5, 5, '2023-05-30'),
  (6, 6, 6, '2023-06-05'),
  (7, 7, 7, '2023-07-10'),
  (8, 8, 8, '2023-08-15'),
  (9, 9, 9, '2023-09-20'),
  (10, 10, 10, '2023-10-25');


INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
  (1, 1, 500, '2023-01-15'),
  (2, 2, 600, '2023-02-20'),
  (3, 3, 550, '2023-03-25'),
  (4, 4, 700, '2023-04-30'),
  (5, 5, 450, '2023-05-05'),
  (6, 6, 800, '2023-06-10'),
  (7, 7, 350, '2023-07-15'),
  (8, 8, 900, '2023-08-20'),
  (9, 9, 480, '2023-09-25'),
  (10, 10, 750, '2023-10-30');


Select * from Students
Select * from Courses
Select * from Enrollments
Select * from Teachers
Select * from Payments


-----------------------------------------------------------------------------------------------
--1--Write an SQL query to insert a new student into the "Students" table with the following details:

Declare @newID int =(select max(student_id)+1 from Students)

Insert Into Students(Student_ID,First_Name, Last_Name,DOB,email,phone_number)
VALUES (@newID, 'Udit','Panthi','2001-08-31','uditpanthi31@mail.com','7535975455');



-----------------------------------------------------------------------------------------------
--2--Write an SQL query to enroll a student in a course. Choose an existing student and course and 
   --insert a record into the "Enrollments" table with the enrollment date

Declare @newEid int=(select max(Enrollment_id)+1 from Enrollments);
Declare @newSid int=3;
Declare @newCid int=4;
Declare @newDate date='2023-11-30';

INSERT Into Enrollments(enrollment_id,student_id,course_id, enrollmentDate)
values (@newEid, @newSid, @newCid, @newDate);


-----------------------------------------------------------------------------------------------
--3--Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and 
   --modify their email address.

Update Teachers
SET email='helloworld@gmail.com'
where teacher_id=3;

-----------------------------------------------------------------------------------------------
--4--Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select 
   --an enrollment record based on student and course.

Declare @SIdToDelete int=2;
Declare @CIdToDelete int=7;

Delete From Enrollments 
where
student_id=@SIdToDelete and course_id=@CIdToDelete;


-----------------------------------------------------------------------------------------------
--5--Update the "Courses" table to assign a specific teacher to a course. Choose any course and 
   --teacher from the respective tables.

  Update Courses
  set teacher_id=4
  where course_id=8



-----------------------------------------------------------------------------------------------
--6--Delete a specific student from the "Students" table and remove all their enrollment records 
   --from the "Enrollments" table. Be sure to maintain referential integrity.

declare @idToDelete int =1;

Delete From Enrollments
where student_id=@idToDelete;

Delete From Payments
where student_id=@idToDelete;

Delete From Students
where Student_ID=@idToDelete;


-----------------------------------------------------------------------------------------------
--7--Update the payment amount for a specific payment record in the "Payments" table. Choose any 
   --payment record and modify the payment amount

Update Payments
set amount=10000
where student_id=6







----JOINS----

--1--Write an SQL query to calculate the total payments made by a specific student. You will need to 
   --join the "Payments" table with the "Students" table based on the student's ID

SELECT s.Student_ID, s.First_Name, s.Last_Name, SUM(p.amount) AS total_payments
FROM  Students s
JOIN Payments p ON s.Student_ID = p.student_id
GROUP BY s.Student_ID, s.First_Name, s.Last_Name;


-----------------------------------------------------------------------------------------------
--2--Write an SQL query to retrieve a list of courses along with the count of students enrolled in each 
   --course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.

Select c.course_name, count(e.course_id) as StudentsEnrolled
From Courses c
Left Join Enrollments e on c.course_id=e.course_id
Group by c.course_name

-----------------------------------------------------------------------------------------------
--3--Write an SQL query to find the names of students who have not enrolled in any course. Use a 
   --LEFT JOIN between the "Students" table and the "Enrollments" table to identify students 
   --without enrollments.

   Select s.First_Name,s.Last_Name, count(e.course_id) as SubjectsEnrolled
   from Students s
   Left Join Enrollments e 
   on s.Student_ID=e.student_id
   where e.student_id is null
   group by s.First_Name,s.Last_Name


-----------------------------------------------------------------------------------------------
--4--Write an SQL query to retrieve the first name, last name of students, and the names of the 
   --courses they are enrolled in. Use JOIN operations between the "Students" table and the 
   --"Enrollments" and "Courses" tables.

Select s.First_Name,s.Last_Name,c.course_id,c.course_name
from Students s
join Enrollments e on s.Student_ID=e.student_id
join Courses c on c.course_id=e.course_id

-----------------------------------------------------------------------------------------------
--5--Create a query to list the names of teachers and the courses they are assigned to. Join the 
   --"Teacher" table with the "Courses" table.

Select t.teacher_id, t.first_name, t.last_name, c.course_id, c.course_name
from Teachers t
JOIN Courses c on c.teacher_id=t.teacher_id


-----------------------------------------------------------------------------------------------
--6--Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the 
   --"Students" table with the "Enrollments" and "Courses" tables.

Select s.First_Name,s.Last_Name,c.course_name,e.enrollmentDate
from Students s
JOIN Enrollments e on s.Student_ID=e.student_id
JOIN Courses c on e.course_id=c.course_id


-----------------------------------------------------------------------------------------------
--7--Find the names of students who have not made any payments. Use a LEFT JOIN between the 
   --"Students" table and the "Payments" table and filter for students with NULL payment records.

Select s.First_Name, s.Last_Name
From Students s
Left JOIN Payments p on s.Student_ID=p.student_id
where p.student_id is null


-----------------------------------------------------------------------------------------------
--8--Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN 
   --between the "Courses" table and the "Enrollments" table and filter for courses with NULL 
   --enrollment records.

Select c.course_id,c.course_name
From Courses c
Left JOIN Enrollments e
on c.course_id=e.course_id
where e.enrollment_id is Null

-----------------------------------------------------------------------------------------------
--9--Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" 
   --table to find students with multiple enrollment records.

SELECT DISTINCT
    e1.student_id,
    s.First_Name,
    s.Last_Name
FROM Enrollments e1
JOIN Enrollments e2 ON e1.student_id = e2.student_id AND e1.enrollment_id <> e2.enrollment_id
JOIN Students s ON e1.student_id = s.Student_ID
ORDER BY  s.Last_Name, s.First_Name;


------------------------------------------------------------------------------------------------
--10--Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" 
   --table and the "Courses" table and filter for teachers with NULL course assignments.

SELECT t.teacher_id,t.first_name,t.last_name
FROM Teachers t
LEFT JOIN Courses ON t.teacher_id = Courses.teacher_id
WHERE Courses.course_id IS NULL;






--AGGREGGATE FUNCTION--
--1--Write an SQL query to calculate the average number of students enrolled in each course. Use 
   --aggregate functions and subqueries to achieve this.


SELECT AVG(EnrollmentCount) AS average_students_per_course
FROM (
    SELECT
        Courses.course_id,
        COUNT(Enrollments.student_id) AS EnrollmentCount
    FROM
        Courses 
    LEFT JOIN
        Enrollments ON Courses.course_id = Enrollments.course_id
    GROUP BY
        Courses.course_id
) AS CourseEnrollments;

-----------------------------------------------------------------------------------------------
--2--Identify the student(s) who made the highest payment. Use a subquery to find the maximum
   --payment amount and then retrieve the student(s) associated with that amount.

SELECT Students.student_id,Students.first_name,Students.last_name,
    Payments.amount AS highest_payment
FROM Students 
JOIN Payments ON Students.student_id = Payments.student_id
WHERE Payments.amount = (SELECT MAX(amount) FROM Payments);



-----------------------------------------------------------------------------------------------
--3--Retrieve a list of courses with the highest number of enrollments. Use subqueries to find 
   --the course(s) with the maximum enrollment count

SELECT Courses.course_id,Courses.course_name,
    EnrollmentsCount AS enrollment_count
FROM Courses
JOIN (
    SELECT
        course_id,
        COUNT(student_id) AS EnrollmentsCount
    FROM
        Enrollments
    GROUP BY
        course_id
) AS EnrollmentCounts ON Courses.course_id = EnrollmentCounts.course_id
WHERE
    EnrollmentsCount = (SELECT MAX(EnrollmentsCount) FROM (
        SELECT
            COUNT(student_id) AS EnrollmentsCount
        FROM
            Enrollments
        GROUP BY
            course_id
    ) AS MaxEnrollments);


-----------------------------------------------------------------------------------------------
--4--Calculate the total payments made to courses taught by each teacher. Use subqueries to 
   --sum payments for each teacher's courses.
SELECT
    t.teacher_id,
    t.first_name,
    t.last_name,
    SUM(Payments.amount) AS total_payments_for_courses
FROM
    Teachers t
JOIN
    Courses ON t.teacher_id = Courses.teacher_id
LEFT JOIN
    Enrollments ON Courses.course_id = Enrollments.course_id
LEFT JOIN
    Payments ON Enrollments.student_id = Payments.student_id
GROUP BY
    t.teacher_id, t.first_name, t.last_name;


-----------------------------------------------------------------------------------------------
--5--Identify students who are enrolled in all available courses. Use subqueries to compare a 
   --student's enrollments with the total number of courses.

SELECT
    Students.student_id,
    Students.first_name,
    Students.last_name
FROM
    Students
WHERE
    NOT EXISTS (
        SELECT Courses.course_id
        FROM Courses 
        WHERE NOT EXISTS (
            SELECT Enrollments.course_id
            FROM Enrollments 
            WHERE Enrollments.student_id = Students.student_id AND Enrollments.course_id = Courses.course_id
        )
    );


-----------------------------------------------------------------------------------------------
--6--Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to 
   --find teachers with no course assignments.

SELECT
    t.teacher_id,
    t.first_name,
    t.last_name
FROM
    Teachers t
WHERE
    NOT EXISTS (
        SELECT 1
        FROM Courses 
        WHERE Courses.teacher_id = t.teacher_id
    );

-----------------------------------------------------------------------------------------------
--7--Calculate the average age of all students. Use subqueries to calculate the age of each student 
   --based on their date of birth.
SELECT
    AVG(StudentAge) AS average_student_age
FROM (
    SELECT
        DATEDIFF(YEAR, DOB, GETDATE()) AS StudentAge
    FROM
        Students
) AS StudentAges;


-----------------------------------------------------------------------------------------------
--8--Identify courses with no enrollments. Use subqueries to find courses without enrollment records.

SELECT
    course_id,
    course_name
FROM
    Courses
WHERE
    NOT EXISTS (
        SELECT 1
        FROM Enrollments
        WHERE Enrollments.course_id = Courses.course_id
    );

-----------------------------------------------------------------------------------------------
--9--Calculate the total payments made by each student for each course they are enrolled in. 
   --Use subqueries and aggregate functions to sum payments.

SELECT Students.student_id,Students.first_name,Students.last_name,Courses.course_id,Courses.course_name,
COALESCE(SUM(Payments.amount), 0) AS total_payments
FROM Students
CROSS JOIN Courses
LEFT JOIN Payments ON Students.student_id = Payments.student_id 
GROUP BY STUDENTS.student_id,Students.first_name,Students.last_name,Courses.course_id,Courses.course_name;


-----------------------------------------------------------------------------------------------
--10-- Identify students who have made more than one payment. Use subqueries and aggregate functions 
    --to count payments per student and filter for those with counts greater than one.

SELECT
    s.student_id,
    s.first_name,
    s.last_name
FROM
    Students s
JOIN
    Payments p ON s.student_id = p.student_id
GROUP BY
    s.student_id, s.first_name, s.last_name
HAVING
    COUNT(p.payment_id) > 1;

-----------------------------------------------------------------------------------------------
--11--Write an SQL query to calculate the total payments made by each student. Join the "Students" 
    --table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.

SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    SUM(p.amount) AS total_payments
FROM
    Students s
JOIN
    Payments p ON s.student_id = p.student_id
GROUP BY
    s.student_id, s.first_name, s.last_name;


-----------------------------------------------------------------------------------------------
--12--Retrieve a list of course names along with the count of students enrolled in each course. 
    --Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments

SELECT
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS student_count
FROM
    Courses c
LEFT JOIN
    Enrollments e ON c.course_id = e.course_id
GROUP BY
    c.course_id, c.course_name;


-----------------------------------------------------------------------------------------------
--13--Calculate the average payment amount made by students. Use JOIN operations between the 
    --"Students" table and the "Payments" table and GROUP BY to calculate the average.

SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    AVG(p.amount) AS average_payment_amount
FROM
    Students s
JOIN
    Payments p ON s.student_id = p.student_id
GROUP BY
    s.student_id, s.first_name, s.last_name;



