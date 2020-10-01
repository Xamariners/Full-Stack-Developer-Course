# Problem Statement

The management at Contoso University would like you to design a database schema for their institution management. The management had a lot of discussions with different stakeholders within the instituion. The outcome of the discussions have been used to provide you the following details:

<br />

# Things to manage:
Contoso university wants to manage the following as an institution:
- Courses
- Departments
- Instructors
- Students

<br />

# Courses

Contoso University being an educational institution provides a lot of course offering for students. Following are the characteristics of a course:
- Every Course needs to be identified uniquely.
- A Course is identified by its title.
    - Title can be sometimes short or long. 
    - Title should have a minimum of 3 characters.
    - The database should account for this appropriately. 
- A Course has credits.
    - Credits are usually in the range of 0 to 5. 
    - The credit should default to 0.
- A Course usually belongs to a Department.
- A Course is usually thought by an Instructor

<br />

# Departments

Contoso University has a lot of Departments within them. Each Department is responsible for specific course. Following are the characteristics of a department:
- Every Department needs to be identified uniquely.
- A Department consists of following characteristics:
    - Name of the department. Usually 100 characters in length.
    - Budget - Every department has a monetary budget set. This is for just admin purpose.
    - Start Date - The start of the department.
- A Department has an Administrator.
- A Department can handle 1 or more courses.
- A Department can have 1 or more instructor.

<br />

# Instructors

Contoso University has a lot of instructors who teach various courses in the institution. Following are the characteristics of Instructor:
- Every Instructor needs to be identified uniquely.
- They have first name & last name.
- Hire date of Instructors needs to be noted.
- Instructor can teach 1 or more courses.
- Instructor can belong to only 1 Department.

<br />

# Student
Following are some of the key points when it comes to Student management:
- Student First name and last name needs to be recorded.
- Student's enrollment date needs to be recorded.
- A Student can enroll to 1 or many courses.
- A Student is graded per course he has enrolled. Grades assigned are 'A' to 'F'.