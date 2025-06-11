CREATE SCHEMA COLLEGE;
-- Use the schema
USE COLLEGE;

-- Table: Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    Department_Name VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, Department_Name) VALUES
(1, 'CS'),
(2, 'EE'),
(3, 'ME'),
(4, 'CE'),
(5, 'IT'),
(6, 'BIO'),
(7, 'CHEM'),
(8, 'PHYS'),
(9, 'MATH'),
(10, 'ECON');


-- Table: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Gender CHAR(1),
    DOB DATE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


INSERT INTO Students (StudentID, Name, Gender, DOB, DepartmentID) VALUES
(101, 'Amit Sharma', 'M', '2002-01-15', 1),
(102, 'Neha Verma', 'F', '2001-05-20', 2),
(103, 'Rahul Kumar', 'M', '2002-03-10', 1),
(104, 'Sana Sheikh', 'F', '2000-07-18', 3),
(105, 'Karan Mehta', 'M', '2003-09-22', 4),
(106, 'Isha Jain', 'F', '2001-12-02', 1),
(107, 'Vikram Rana', 'M', '2002-06-11', 5),
(108, 'Priya Sen', 'F', '2000-11-05', 6),
(109, 'Arjun Malhotra', 'M', '2003-01-25', 2),
(110, 'Riya Das', 'F', '2001-08-14', 5);


-- Table: Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


INSERT INTO Courses (CourseID, Course_Name, DepartmentID) VALUES
(201, 'DSA', 1),
(202, 'OOP', 1),
(203, 'Circuits', 2),
(204, 'Thermo', 3),
(205, 'Structures', 4),
(206, 'Networks', 1),
(207, 'Biochem', 6),
(208, 'Calculus', 9),
(209, 'Physics', 8),
(210, 'Econ101', 10);



-- Table: Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(301, 101, 201, '2024-01-10'),
(302, 102, 203, '2024-01-15'),
(303, 103, 202, '2024-02-01'),
(304, 104, 204, '2024-01-20'),
(305, 105, 205, '2024-02-11'),
(306, 106, 206, '2024-01-18'),
(307, 107, 208, '2024-03-01'),
(308, 108, 207, '2024-02-25'),
(309, 109, 203, '2024-01-30'),
(310, 110, 210, '2024-02-05'),
(311, 101, 201, '2024-07-01'), 
(312, 101, 203, '2024-07-02'), 
(313, 103, 201, '2024-07-01'), 
(314, 103, 204, '2024-07-03'); 


-- Table: Instructors
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender CHAR(1),
    DOB DATE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Instructors (InstructorID, Name, Gender, DOB, DepartmentID) VALUES
(401, 'Dr. Rakesh Nair', 'M', '1980-04-15', 1),
(402, 'Prof. Anjali Mehta', 'F', '1985-06-20', 2),
(403, 'Dr. Suresh Rao', 'M', '1978-09-12', 3),
(404, 'Dr. Kavita Das', 'F', '1983-02-22', 4),
(405, 'Prof. Rohan Singh', 'M', '1987-11-10', 5),
(406, 'Dr. Neeta Kulkarni', 'F', '1981-07-08', 6),
(407, 'Dr. Manoj Joshi', 'M', '1975-12-05', 9),
(408, 'Dr. Farhan Khan', 'M', '1982-03-18', 8),
(409, 'Prof. Meena Nair', 'F', '1986-08-23', 10),
(410, 'Dr. Ajay Patel', 'M', '1984-05-14', 1);




