EduTrack Data Audit — Analysis Report

1. All enrollments

The query returned 16 enrollments, showing each student's name, course title, and completion percentage.

Student

Course

Completion Percentage

Emily Watson

Intro to Python

85

Emily Watson

Web Design Basics

60

Klaus Weber

Intro to Python

92

Klaus Weber

Data Analysis with SQL

78

Lucia Fernandes

Web Design Basics

5

Lucia Fernandes

Digital Marketing 101

3

Marco Rossi

Advanced Python

95

Marco Rossi

Intro to Python

88

Yuki Nakamura

Data Analysis with SQL

45

Yuki Nakamura

UI/UX Fundamentals

0

Pierre Dubois

UI/UX Fundamentals

0

Priya Sharma

Digital Marketing 101

70

Priya Sharma

Intro to Python

55

Pierre Dubois

Data Analysis with SQL

20

Emily Watson

Advanced Python

40

Lucia Fernandes

Advanced Python

0

2. Students who passed at least one course

The query returned 6 passed enrollments.

Student

Email

Course

Emily Watson

emily.watson@student.edutrack.com

Intro to Python

Klaus Weber

klaus.weber@student.edutrack.com

Intro to Python

Klaus Weber

klaus.weber@student.edutrack.com

Data Analysis with SQL

Marco Rossi

marco.rossi@student.edutrack.com

Advanced Python

Marco Rossi

marco.rossi@student.edutrack.com

Intro to Python

Priya Sharma

priya.sharma@student.edutrack.com

Digital Marketing 101

3. Average completion percentage per instructor

The query calculated the average completion percentage for each instructor and ordered the results from highest to lowest.

Instructor

Average Completion Percentage

Marta López

66.14

Carlos Vega

40.00

Lucia Prades

36.50

Pending assignment

0.00

4. Students with no enrollments

The LEFT JOIN identified one student with no enrollments.

Student

Email

Giulia Romano

giulia.romano@student.edutrack.com

5. Courses with no enrollments

The LEFT JOIN identified one course with no enrollments.

Course ID

Course

7

Email Campaigns

6. Students enrolled in more than one course

The query returned students enrolled in more than one course.

Student

Number of Courses

Emily Watson

3

Klaus Weber

2

Lucia Fernandes

3

Marco Rossi

2

Yuki Nakamura

2

Priya Sharma

2

7. Total revenue per category

Revenue was calculated using courses.monthly_fee, as required, rather than enrollments.monthly_fee_paid.

Category

Total Revenue

Programming

409.93

Design

169.96

Data

179.97

Marketing

59.98

8. Students per instructor

The intended metric is the number of distinct students currently enrolled in each instructor's courses.

Instructor

Number of Students

Marta López

6

Carlos Vega

3

Lucia Prades

2

Pending assignment

2

9. Orphaned student references

The data integrity check returned 0 rows.

No enrollments reference a student_id that does not exist in the students table.

10. Orphaned course references

The data integrity check returned 0 rows.

No enrollments reference a course_id that does not exist in the courses table.

Conclusion

The normalized EduTrack database contains valid relationships between students, courses, and enrollments. The LEFT JOIN checks identified the intentionally unassigned student and course, while the data integrity checks found no orphaned enrollment references.