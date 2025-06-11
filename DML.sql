-- Student & Enrollment Reports

-- 1. How many students are currently enrolled in each course?

SELECT c.CourseID,c.Course_Name,COUNT(e.StudentID) AS Enrolled_Students
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.Course_Name
ORDER BY Enrolled_Students DESC;


-- 2  Which students are enrolled in multiple courses, and which courses are they taking?

SELECT s.StudentID,s.Name AS Student_Name,c.CourseID,c.Course_Name FROM Enrollments e 
JOIN Students s ON e.StudentID = s.StudentID JOIN Courses c ON e.CourseID = c.CourseID
WHERE 
    e.StudentID IN (
        SELECT StudentID
        FROM Enrollments
        GROUP BY StudentID
        HAVING COUNT(CourseID) > 1
    )
ORDER BY s.StudentID, c.CourseID;




-- 3 What is the total number of students per department across all courses?
SELECT d.DepartmentID,d.Department_Name,COUNT(DISTINCT s.StudentID) AS Total_Students
FROM Students s
JOIN Departments d ON s.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID, d.Department_Name
ORDER BY Total_Students DESC;


-- Course & Instructor Analysis

-- 1. Which courses have the highest number of enrollments?

SELECT c.CourseID,c.Course_Name,COUNT(e.StudentID) AS Total_Enrollments
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.Course_Name
ORDER BY Total_Enrollments DESC
LIMIT 1;


-- 2. Which department has the least number of students?

SELECT d.DepartmentID,d.Department_Name,COUNT(s.StudentID) AS Total_Students
FROM Departments d LEFT JOIN Students s ON d.DepartmentID = s.DepartmentID 
GROUP BY d.DepartmentID, d.Department_Name
ORDER BY Total_Students ASC
LIMIT 1;

-- Data Integrity & Operational Insights

-- 1. Are there any students not enrolled in any course?

SELECT s.StudentID,s.Name FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID 
WHERE e.EnrollmentID IS NULL;


-- 2. How many courses does each student take on average?

SELECT ROUND(AVG(course_count), 2) AS Avg_Courses_Per_Student
FROM ( SELECT StudentID,COUNT(CourseID) AS course_count
    FROM Enrollments GROUP BY StudentID
) AS student_courses;


-- 3. What is the gender distribution of students across courses and instructors?

SELECT c.CourseID,c.Course_Name,s.Gender,COUNT(s.StudentID) AS Total_Students
FROM Enrollments e JOIN Students s ON e.StudentID = s.StudentID JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY c.CourseID, c.Course_Name, s.Gender ORDER BY c.CourseID, s.Gender;


-- 4. Which course has the highest number of male or female students enrolled?


SELECT c.CourseID,Course_Name, Gender,COUNT(*) AS Total_Enrolled FROM Enrollments e 
JOIN Students s ON e.StudentID = s.StudentID JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY CourseID, Course_Name, Gender ORDER BY Total_Enrolled DESC;
