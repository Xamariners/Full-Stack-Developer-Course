USE [ContosoUniversity]
GO

SET IDENTITY_INSERT [dbo].[Course] ON 
GO
INSERT [dbo].[Course] ([CourseId], [Title], [Credit], [DepartmentId]) VALUES (1, N'Chemistry', 4, 1)
GO
INSERT [dbo].[Course] ([CourseId], [Title], [Credit], [DepartmentId]) VALUES (2, N'Physics', 4, 1)
GO
INSERT [dbo].[Course] ([CourseId], [Title], [Credit], [DepartmentId]) VALUES (3, N'Calculus', 4, 4)
GO
INSERT [dbo].[Course] ([CourseId], [Title], [Credit], [DepartmentId]) VALUES (4, N'Poetry', 2, 2)
GO
INSERT [dbo].[Course] ([CourseId], [Title], [Credit], [DepartmentId]) VALUES (5, N'Composition', 3, 2)
GO
INSERT [dbo].[Course] ([CourseId], [Title], [Credit], [DepartmentId]) VALUES (6, N'Literature', 4, 2)
GO
INSERT [dbo].[Course] ([CourseId], [Title], [Credit], [DepartmentId]) VALUES (7, N'Microeconomics', 3, 3)
GO
INSERT [dbo].[Course] ([CourseId], [Title], [Credit], [DepartmentId]) VALUES (8, N'Macroeconomics', 3, 3)
GO
INSERT [dbo].[Course] ([CourseId], [Title], [Credit], [DepartmentId]) VALUES (9, N'Quantitative', 2, 3)
GO
INSERT [dbo].[Course] ([CourseId], [Title], [Credit], [DepartmentId]) VALUES (10, N'Trigonometry', 4, 4)
GO
SET IDENTITY_INSERT [dbo].[Course] OFF
GO

INSERT [dbo].[CourseInstructor] ([CourseId], [InstructorId]) VALUES (1, 1)
GO
INSERT [dbo].[CourseInstructor] ([CourseId], [InstructorId]) VALUES (2, 6)
GO
INSERT [dbo].[CourseInstructor] ([CourseId], [InstructorId]) VALUES (3, 3)
GO
INSERT [dbo].[CourseInstructor] ([CourseId], [InstructorId]) VALUES (4, 2)
GO
INSERT [dbo].[CourseInstructor] ([CourseId], [InstructorId]) VALUES (5, 5)
GO
INSERT [dbo].[CourseInstructor] ([CourseId], [InstructorId]) VALUES (6, 2)
GO
INSERT [dbo].[CourseInstructor] ([CourseId], [InstructorId]) VALUES (7, 4)
GO
INSERT [dbo].[CourseInstructor] ([CourseId], [InstructorId]) VALUES (8, 7)
GO
INSERT [dbo].[CourseInstructor] ([CourseId], [InstructorId]) VALUES (9, 8)
GO
INSERT [dbo].[CourseInstructor] ([CourseId], [InstructorId]) VALUES (10, 3)
GO

SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([DepartmentId], [Name], [Budget], [StartDate], [Administrator]) VALUES (1, N'Engineering', 35000.0000, CAST(N'2007-09-01' AS Date), 1)
GO
INSERT [dbo].[Department] ([DepartmentId], [Name], [Budget], [StartDate], [Administrator]) VALUES (2, N'English', 120000.0000, CAST(N'2007-09-01' AS Date), 2)
GO
INSERT [dbo].[Department] ([DepartmentId], [Name], [Budget], [StartDate], [Administrator]) VALUES (3, N'Economics', 20000.0000, CAST(N'2007-09-01' AS Date), 4)
GO
INSERT [dbo].[Department] ([DepartmentId], [Name], [Budget], [StartDate], [Administrator]) VALUES (4, N'Mathematics', 25000.0000, CAST(N'2007-09-01' AS Date), 3)
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO


SET IDENTITY_INSERT [dbo].[Instructor] ON 
GO
INSERT [dbo].[Instructor] ([InstructorId], [FirstName], [LastName], [HireDate], [DepartmentId]) VALUES (1, N'Kim', N'Abercombie', CAST(N'1995-03-11' AS Date), 1)
GO
INSERT [dbo].[Instructor] ([InstructorId], [FirstName], [LastName], [HireDate], [DepartmentId]) VALUES (2, N'Fadi', N'Fakhouri', CAST(N'2002-08-06' AS Date), 2)
GO
INSERT [dbo].[Instructor] ([InstructorId], [FirstName], [LastName], [HireDate], [DepartmentId]) VALUES (3, N'Roger', N'Harui', CAST(N'1998-07-01' AS Date), 4)
GO
INSERT [dbo].[Instructor] ([InstructorId], [FirstName], [LastName], [HireDate], [DepartmentId]) VALUES (4, N'Roger', N'Zheng', CAST(N'2004-02-12' AS Date), 3)
GO
INSERT [dbo].[Instructor] ([InstructorId], [FirstName], [LastName], [HireDate], [DepartmentId]) VALUES (5, N'Stacy', N'Serrano', CAST(N'1999-06-01' AS Date), 2)
GO
INSERT [dbo].[Instructor] ([InstructorId], [FirstName], [LastName], [HireDate], [DepartmentId]) VALUES (6, N'Jasmine', N'Stewart', CAST(N'1997-10-12' AS Date), 1)
GO
INSERT [dbo].[Instructor] ([InstructorId], [FirstName], [LastName], [HireDate], [DepartmentId]) VALUES (7, N'Kristen', N'Xu', CAST(N'2001-07-23' AS Date), 3)
GO
INSERT [dbo].[Instructor] ([InstructorId], [FirstName], [LastName], [HireDate], [DepartmentId]) VALUES (8, N'Roger', N'Houten', CAST(N'2000-12-07' AS Date), 3)
GO
SET IDENTITY_INSERT [dbo].[Instructor] OFF
GO

SET IDENTITY_INSERT [dbo].[Student] ON 
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (1, N'Gytis', N'Barzdukas', CAST(N'2005-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (2, N'Peggy', N'Justice', CAST(N'2001-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (3, N'Yan', N'Li', CAST(N'2002-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (4, N'Laura', N'Norman', CAST(N'2003-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (5, N'Nino', N'Olivotto', CAST(N'2005-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (6, N'Wayne', N'Tang', CAST(N'2005-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (7, N'Meredith', N'Alonso', CAST(N'2002-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (8, N'Sophia', N'Lopez', CAST(N'2004-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (9, N'Meredith', N'Browning', CAST(N'2000-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (10, N'Arturo', N'Anand', CAST(N'2003-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (11, N'Alexandra', N'Walker', CAST(N'2000-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (12, N'Carson', N'Powell', CAST(N'2004-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (13, N'Damien', N'Jai', CAST(N'2001-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (14, N'Robyn', N'Carlson', CAST(N'2005-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (16, N'Carson', N'Bryant', CAST(N'2001-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (17, N'Robyn', N'Suarez', CAST(N'2004-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (18, N'Roger', N'Holt', CAST(N'2004-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (19, N'Carson', N'Alexander', CAST(N'2005-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (20, N'Isaiah', N'Morgan', CAST(N'2001-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (21, N'Randall', N'Martin', CAST(N'2005-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (22, N'Cody', N'Rogers', CAST(N'2002-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (23, N'Anthony', N'White', CAST(N'2001-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (24, N'Rachel', N'Griffin', CAST(N'2004-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (25, N'Alicia', N'Shan', CAST(N'2003-09-01' AS Date))
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [EnrollmentDate]) VALUES (26, N'Erica', N'Gao', CAST(N'2003-01-30' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Student] OFF
GO

SET IDENTITY_INSERT [dbo].[Enrollment] ON 
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (1, 1, 5, N'B')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (2, 1, 4, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (3, 2, 5, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (4, 2, 4, N'B')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (5, 3, 5, N'D')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (6, 3, 6, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (7, 4, 5, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (8, 4, 6, N'B')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (9, 5, 5, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (10, 5, 6, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (11, 6, 8, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (12, 7, 8, NULL)
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (13, 8, 8, N'D')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (14, 9, 8, NULL)
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (15, 9, 9, NULL)
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (16, 10, 7, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (18, 11, 9, N'B')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (19, 12, 8, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (20, 13, 7, N'D')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (21, 14, 7, N'D')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (23, 16, 7, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (24, 17, 9, N'B')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (25, 18, 9, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (26, 19, 7, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (27, 20, 8, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (28, 21, 9, N'D')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (29, 22, 7, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (30, 23, 3, N'E')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (31, 20, 2, N'B')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (32, 21, 2, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (33, 22, 1, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (34, 22, 2, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (37, 24, 1, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (38, 24, 2, N'B')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (39, 25, 1, N'C')
GO
INSERT [dbo].[Enrollment] ([EnrollmentId], [StudentId], [CourseId], [Grade]) VALUES (40, 25, 2, N'B')
GO
SET IDENTITY_INSERT [dbo].[Enrollment] OFF
GO
