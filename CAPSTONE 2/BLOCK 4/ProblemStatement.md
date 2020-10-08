# Problem Statement

## 1. Add Index

- Figure out the tables & column which need Indexes to be applied. 
- Add the Indexes to appropriate table & column

## 2. Add Stored Procedures
- For creating, updating & deleting Department.
- For creating, updating & deleting Course.
- For creating, updating & deleting Instructor.
- For creating, updating & deleting Student.
- For creating, updating & deleting Enrollment.

## 3. Management Reporting Stored Procedure
- Generate a stored procedure which when executed will return the following result set:

| No.      | Feature | Statistics |
| ----------- | ----------- | ----------- |
| 1      | Departments       | 100|
| 2      | Courses       | 100|
| 3      | Instructors       | 100|
| 1      | Students       | 100|
| 1      | Enrollments       | 100|

Note: Statistics = calculate the number of records at the execution time. For e.g. Departments statitcs will be the count of department at the stored procedure execution time.

## 4. Recreate Database Schema SQL file


---


## 5. Bonus
- Use of Schemas
    - Try recreating database with the use of Schemas.
    - Create Management & Admission schema.
    - Add Department, Course, Instructor under Management Schema.
    - Add Student, Enrollment under Admission Schema.
- Drawbacks of Current Schema
    - Department.Administrator depends on Instructor.InstructorId and Instructor.DepartmentId depends on Department.DepartmentId. It forms a cyclic dependency, which is not good.
    - Department & Course are tighly coupled.
    - Department & Instructor are tighly coupled.
- Department Changes
    - Create Department with only Department related columns.
    - Create DepartmentAdministrator join table with DepartmentId and Administrator (which is nothing but instructor id).
    - Make sure DepartmentAdministrator will always allow 1 Department to have only 1.Administrator or 1 Administrator will always belong to 1 Department only.
- Instructor Changes
    - Create Instructor table with only instructor related columns.
    - Create InstructorDepartment join table with InstructorId and DepartmentId.
    - Make sure 1 Instructor can belong to 1 Department only.
- Course Changes
    - Create Course table with only course related columns.
    - Create CourseDepartment join table with CourseId and DepartmentId.
        - Make sure 1 Course can belong to 1 Department only.
    - Create CourseInstructor join table with CourseId and InstructorId.
        - Make sure 1 Course is taken by 1 Instructor only.
- Recreate the DB Schema SQL file.
- Recreate the DB Seed SQL file.