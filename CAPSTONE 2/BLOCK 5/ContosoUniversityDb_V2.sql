USE [master]
GO
/****** Object:  Database [ContosoUniversityDb]    Script Date: 8/10/2020 3:39:36 pm ******/
CREATE DATABASE [ContosoUniversityDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ContosoUniversityDb', FILENAME = N'C:\Users\LohithGoudagereNagar\ContosoUniversityDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ContosoUniversityDb_log', FILENAME = N'C:\Users\LohithGoudagereNagar\ContosoUniversityDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ContosoUniversityDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContosoUniversityDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ContosoUniversityDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ContosoUniversityDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ContosoUniversityDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ContosoUniversityDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ContosoUniversityDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ContosoUniversityDb] SET  MULTI_USER 
GO
ALTER DATABASE [ContosoUniversityDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ContosoUniversityDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ContosoUniversityDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ContosoUniversityDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ContosoUniversityDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ContosoUniversityDb] SET QUERY_STORE = OFF
GO
USE [ContosoUniversityDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ContosoUniversityDb]
GO
/****** Object:  Schema [Admission]    Script Date: 8/10/2020 3:39:36 pm ******/
CREATE SCHEMA [Admission]
GO
/****** Object:  Schema [Management]    Script Date: 8/10/2020 3:39:36 pm ******/
CREATE SCHEMA [Management]
GO
/****** Object:  Table [Admission].[Enrollment]    Script Date: 8/10/2020 3:39:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admission].[Enrollment](
	[EnrollmentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[EnrollmentDate] [date] NOT NULL,
	[Grade] [char](1) NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[EnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Admission].[Student]    Script Date: 8/10/2020 3:39:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admission].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[RegistrationDate] [date] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Management].[Course]    Script Date: 8/10/2020 3:39:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[StartDate] [date] NOT NULL,
	[Credit] [smallint] NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Management].[CourseInstructor]    Script Date: 8/10/2020 3:39:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[CourseInstructor](
	[CourseId] [int] NOT NULL,
	[InstructorId] [int] NOT NULL,
 CONSTRAINT [UQ_CourseInstructor] UNIQUE NONCLUSTERED 
(
	[CourseId] ASC,
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Management].[Department]    Script Date: 8/10/2020 3:39:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[Department](
	[DepartmentId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NOT NULL,
	[Budget] [money] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Management].[DepartmentAdministrator]    Script Date: 8/10/2020 3:39:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[DepartmentAdministrator](
	[DepartmentId] [int] NOT NULL,
	[Administrator] [int] NOT NULL,
 CONSTRAINT [UQ_DepartmentAdministrator] UNIQUE NONCLUSTERED 
(
	[DepartmentId] ASC,
	[Administrator] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Management].[Instructor]    Script Date: 8/10/2020 3:39:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[Instructor](
	[InstructorId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[HireDate] [date] NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Management].[InstructorDepartment]    Script Date: 8/10/2020 3:39:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Management].[InstructorDepartment](
	[InstructorId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [UQ_InstructorDepartment] UNIQUE NONCLUSTERED 
(
	[InstructorId] ASC,
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Enrollment_Course]    Script Date: 8/10/2020 3:39:36 pm ******/
CREATE NONCLUSTERED INDEX [IX_Enrollment_Course] ON [Admission].[Enrollment]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Enrollment_Student]    Script Date: 8/10/2020 3:39:36 pm ******/
CREATE NONCLUSTERED INDEX [IX_Enrollment_Student] ON [Admission].[Enrollment]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Admission].[Enrollment] ADD  CONSTRAINT [DF_Enrollment_EnrollmentDate]  DEFAULT (getdate()) FOR [EnrollmentDate]
GO
ALTER TABLE [Management].[Department] ADD  CONSTRAINT [DF_Department_Budget]  DEFAULT ((0)) FOR [Budget]
GO
ALTER TABLE [Admission].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Course] FOREIGN KEY([CourseId])
REFERENCES [Management].[Course] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [Admission].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Course]
GO
ALTER TABLE [Admission].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([StudentId])
REFERENCES [Admission].[Student] ([StudentId])
ON DELETE CASCADE
GO
ALTER TABLE [Admission].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
ALTER TABLE [Management].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([DepartmentId])
REFERENCES [Management].[Department] ([DepartmentId])
ON DELETE CASCADE
GO
ALTER TABLE [Management].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO
ALTER TABLE [Management].[CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK_CourseInstructor_Course] FOREIGN KEY([CourseId])
REFERENCES [Management].[Course] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [Management].[CourseInstructor] CHECK CONSTRAINT [FK_CourseInstructor_Course]
GO
ALTER TABLE [Management].[CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK_CourseInstructor_Instructor] FOREIGN KEY([InstructorId])
REFERENCES [Management].[Instructor] ([InstructorId])
ON DELETE CASCADE
GO
ALTER TABLE [Management].[CourseInstructor] CHECK CONSTRAINT [FK_CourseInstructor_Instructor]
GO
ALTER TABLE [Management].[DepartmentAdministrator]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentAdministrator_Department] FOREIGN KEY([DepartmentId])
REFERENCES [Management].[Department] ([DepartmentId])
ON DELETE CASCADE
GO
ALTER TABLE [Management].[DepartmentAdministrator] CHECK CONSTRAINT [FK_DepartmentAdministrator_Department]
GO
ALTER TABLE [Management].[DepartmentAdministrator]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentAdministrator_Instructor] FOREIGN KEY([Administrator])
REFERENCES [Management].[Instructor] ([InstructorId])
ON DELETE CASCADE
GO
ALTER TABLE [Management].[DepartmentAdministrator] CHECK CONSTRAINT [FK_DepartmentAdministrator_Instructor]
GO
ALTER TABLE [Management].[InstructorDepartment]  WITH CHECK ADD  CONSTRAINT [FK_InstructorDepartment_Department] FOREIGN KEY([DepartmentId])
REFERENCES [Management].[Department] ([DepartmentId])
ON DELETE CASCADE
GO
ALTER TABLE [Management].[InstructorDepartment] CHECK CONSTRAINT [FK_InstructorDepartment_Department]
GO
ALTER TABLE [Management].[InstructorDepartment]  WITH CHECK ADD  CONSTRAINT [FK_InstructorDepartment_Instructor] FOREIGN KEY([InstructorId])
REFERENCES [Management].[Instructor] ([InstructorId])
ON DELETE CASCADE
GO
ALTER TABLE [Management].[InstructorDepartment] CHECK CONSTRAINT [FK_InstructorDepartment_Instructor]
GO
ALTER TABLE [Admission].[Enrollment]  WITH CHECK ADD  CONSTRAINT [CK_Enrollment_EnrollmentDate] CHECK  (([EnrollmentDate]<=getdate()))
GO
ALTER TABLE [Admission].[Enrollment] CHECK CONSTRAINT [CK_Enrollment_EnrollmentDate]
GO
ALTER TABLE [Admission].[Enrollment]  WITH CHECK ADD  CONSTRAINT [CK_Enrollment_Grade] CHECK  (([Grade]>='A' AND [Grade]<='F'))
GO
ALTER TABLE [Admission].[Enrollment] CHECK CONSTRAINT [CK_Enrollment_Grade]
GO
ALTER TABLE [Admission].[Student]  WITH CHECK ADD  CONSTRAINT [CK_Student_RegsitrationDate] CHECK  (([RegistrationDate]<=getdate()))
GO
ALTER TABLE [Admission].[Student] CHECK CONSTRAINT [CK_Student_RegsitrationDate]
GO
ALTER TABLE [Management].[Course]  WITH CHECK ADD  CONSTRAINT [CK_Course_Credit] CHECK  (([Credit]>=(0) AND [Credit]<=(5)))
GO
ALTER TABLE [Management].[Course] CHECK CONSTRAINT [CK_Course_Credit]
GO
ALTER TABLE [Management].[Course]  WITH CHECK ADD  CONSTRAINT [CK_Course_Title] CHECK  ((len([Title])>(2)))
GO
ALTER TABLE [Management].[Course] CHECK CONSTRAINT [CK_Course_Title]
GO
ALTER TABLE [Management].[Instructor]  WITH CHECK ADD  CONSTRAINT [CK_Instructor_HireDate] CHECK  (([HireDate]<=getdate()))
GO
ALTER TABLE [Management].[Instructor] CHECK CONSTRAINT [CK_Instructor_HireDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Departments of Contoso University' , @level0type=N'SCHEMA',@level0name=N'Management', @level1type=N'TABLE',@level1name=N'Department'
GO
USE [master]
GO
ALTER DATABASE [ContosoUniversityDb] SET  READ_WRITE 
GO
