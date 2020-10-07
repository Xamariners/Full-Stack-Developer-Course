--1. Department Age
SELECT
	d.DepartmentId
	,d.Name
	,d.StartDate
	,DATEDIFF(year,d.StartDate,GETDATE())
FROM
	Department d

--2. Department Anniversary
SELECT
	d.DepartmentId
	,d.Name
	,d.StartDate
FROM
	Department d
WHERE
	DAY(d.StartDate) = DAY(GETDATE()) AND
	MONTH(d.StartDate) = MONTH(GETDATE())

--3. Department Administrator Summary
SELECT
	d.DepartmentId
	,d.Name
	,d.StartDate
	,I.FirstName+' '+I.LastName Administrator
	,I.HireDate
FROM
	Department d
	LEFT JOIN Instructor I ON I.DepartmentId = d.DepartmentId

-- 4. Department Without Administrator
SELECT
	d.DepartmentId
	,d.Name
	,d.StartDate
	,I.FirstName+' '+I.LastName Administrator
FROM
	Department d
	LEFT JOIN Instructor I ON I.DepartmentId = d.DepartmentId
WHERE
	d.Administrator IS NULL

--5. Department Summary
SELECT
	d.DepartmentId
	,d.Name
	,(SELECT COUNT(CourseId) 
	  FROM Course 
	  WHERE Course.DepartmentId = d.DepartmentId) Courses
	,(SELECT COUNT(InstructorId) 
	  FROM Instructor 
	  WHERE Instructor.DepartmentId = d.DepartmentId) Instructors
	,(SELECT COUNT(EnrollmentId) 
	  FROM Enrollment INNER JOIN Course ON Course.CourseId = Enrollment.CourseId
	  WHERE Course.DepartmentId = d.DepartmentId) Enrollments
FROM
	Department d

--6. Department Course Summary
SELECT
	d.DepartmentId
	,d.Name
	,(SELECT COUNT(CourseId)
	  FROM Course 
	  WHERE Course.DepartmentId = d.DepartmentId) Courses
	,(SELECT SUM(Credit)
	  FROM Course 
	  WHERE Course.DepartmentId = d.DepartmentId) Credits
FROM
	Department d

--7. Department Course details
SELECT
	C.CourseId
	,C.Title
	,C.Credit
	,I.FirstName+' '+I.LastName
	,(SELECT COUNT(EnrollmentId) 
	  FROM Enrollment 
	  WHERE Enrollment.CourseId = C.CourseId) Enrollments
FROM
	Course C
	LEFT JOIN CourseInstructor CI ON CI.CourseId = C.CourseId
	INNER JOIN Instructor I ON I.InstructorId = CI.InstructorId
WHERE
	C.DepartmentId = 1

--8. Course Listing
SELECT
	C.CourseId
	,C.Title
	,C.Credit
	,I.FirstName+' '+I.LastName Instructor
	,D.Name Department
FROM
	Course C
	LEFT JOIN CourseInstructor CI ON CI.CourseId = C.CourseId
	INNER JOIN Instructor I ON I.InstructorId = CI.InstructorId
	INNER JOIN Department D ON D.DepartmentId = C.DepartmentId

--9. Course Enrollment Summary
SELECT
	C.CourseId
	,C.Title
	,C.Credit
	,I.FirstName+' '+I.LastName Instructor
	,D.Name Department
	,(
	   SELECT COUNT(EnrollmentId)
	   FROM Enrollment
	   INNER JOIN Course ON Course.CourseId = Enrollment.CourseId
	   AND Enrollment.CourseId=C.CourseId
	 ) Enrollments
FROM
	Course C
	LEFT JOIN CourseInstructor CI ON CI.CourseId = C.CourseId
	INNER JOIN Instructor I ON I.InstructorId = CI.InstructorId
	INNER JOIN Department D ON D.DepartmentId = C.DepartmentId

--10. Course without Department
SELECT
	C.CourseId
	,C.Title
	,C.Credit
	,I.FirstName+' '+I.LastName Instructor
FROM
	Course C
	LEFT JOIN CourseInstructor CI ON CI.CourseId = C.CourseId
	INNER JOIN Instructor I ON I.InstructorId = CI.InstructorId
WHERE
	C.DepartmentId IS NULL

--11. Course without Instructor
SELECT
	C.CourseId
	,C.Title
	,C.Credit
	,D.Name Department
FROM
	Course C
	LEFT JOIN Department D ON D.DepartmentId = C.DepartmentId
	LEFT JOIN CourseInstructor CI ON CI.CourseId = C.CourseId
WHERE
	CI.InstructorId IS NULL

--12. Course without enrollments
SELECT
	C.CourseId
	,C.Title
	,C.Credit
	,D.Name Department
	,E.EnrollmentId
FROM
	Course C
	LEFT JOIN Department D ON D.DepartmentId = C.DepartmentId
	LEFT JOIN Enrollment E ON E.CourseId = C.CourseId
WHERE
	E.EnrollmentId IS NULL

--13. Instructor Listing
SELECT
	I.InstructorId
	,I.FirstName
	,I.LastName
	,I.HireDate
	,D.Name Department
FROM
	Instructor I
	LEFT JOIN Department D ON D.DepartmentId = I.DepartmentId

--14. Instructor Age	
SELECT
	I.InstructorId
	,I.FirstName+' '+I.LastName Name
	,I.HireDate
	,DATEDIFF(year,I.HireDate,GETDATE()) Age
FROM
	Instructor I
ORDER BY AGE DESC

--15. Instructor Anniversary
SELECT
	I.InstructorId
	,I.FirstName+' '+I.LastName Name
	,I.HireDate
FROM
	Instructor I
WHERE
	DAY(I.HireDate) = DAY(GETDATE()) AND
	MONTH(I.HireDate) = MONTH(GETDATE())

--16. Instructors who are Administrators
SELECT
	I.InstructorId
	,I.FirstName+' '+I.LastName Name
	,I.HireDate
	,D.Name Department
FROM
	Instructor I
	INNER JOIN Department D ON D.Administrator = I.InstructorId
ORDER BY 
	I.InstructorId

--17. Instructors courses
SELECT
	C.CourseId
	,C.Title
	,C.Credit
	,D.Name Department
FROM
	Course C
	INNER JOIN Department D ON D.DepartmentId = C.DepartmentId
	INNER JOIN CourseInstructor CI ON CI.CourseId = C.CourseId
WHERE
	CI.InstructorId = 1
ORDER BY 
	C.CourseId

--18. Instructors without courses
SELECT
	I.InstructorId
	,I.FirstName+' '+I.LastName Name
	,D.Name Department
FROM
	Instructor I
	LEFT JOIN CourseInstructor CI ON I.InstructorId = CI.InstructorId
	LEFT JOIN Department D ON D.DepartmentId = I.DepartmentId
WHERE
	CI.CourseId IS NULL
ORDER BY 
	I.InstructorId

--19. Instructors without Department
SELECT
	I.InstructorId
	,I.FirstName+' '+I.LastName Name
	,D.Name Department
FROM
	Instructor I
	LEFT JOIN Department D ON D.DepartmentId = I.DepartmentId
WHERE
	I.DepartmentId IS NULL
ORDER BY 
	I.InstructorId

--20. Instructors course enrollment summary
SELECT
	C.CourseId
	,C.Title
	,C.Credit
	,(
		SELECT COUNT(EnrollmentId)
		FROM Enrollment
		WHERE Enrollment.CourseId = C.CourseId
	) Enrollments
	,D.Name Department
FROM
	Course C
	LEFT JOIN Department D ON D.DepartmentId = C.DepartmentId
	INNER JOIN CourseInstructor CI ON CI.CourseId=C.CourseId
WHERE
	CI.InstructorId = 2
ORDER BY 
	C.CourseId

--21. Student Age
SELECT
	S.StudentId
	,S.FirstName
	,S.LastName
	,S.EnrollmentDate
	,DATEDIFF(year,S.EnrollmentDate,GETDATE()) UniAge
FROM
	Student S

--22. Student Enrollment Summary
SELECT
	S.StudentId
	,S.FirstName+' '+S.LastName Name
	,S.EnrollmentDate
	,(
		SELECT COUNT(EnrollmentId)
		FROM Enrollment
		WHERE Enrollment.StudentId = S.StudentId
	) Enrollments
FROM
	Student S
ORDER BY
	S.StudentId

--23. Students without Enrollment
SELECT
	S.StudentId
	,S.FirstName+' '+S.LastName Name
	,S.EnrollmentDate
	,E.EnrollmentId
FROM
	Student S
	LEFT JOIN Enrollment E ON S.StudentId = E.StudentId
WHERE
	E.EnrollmentId IS NULL
ORDER BY
	S.StudentId

--24. Student Enrollment Details
SELECT
	C.CourseId
	,C.Title
	,C.Credit
	,I.FirstName+' '+I.LastName Instructor
	,D.Name Department
	,E.Grade
FROM
	Enrollment E
	INNER JOIN Course C ON C.CourseId = E.StudentId
	INNER JOIN Department D ON D.DepartmentId= C.DepartmentId
	INNER JOIN CourseInstructor CI ON C.CourseId = CI.CourseId
	INNER JOIN Instructor I ON I.InstructorId = CI.InstructorId
WHERE
	E.StudentId = 1
ORDER BY
	C.CourseId