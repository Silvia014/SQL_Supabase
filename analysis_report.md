# EduTrack Data Audit — Analysis Report

## 1. Enrollments in 'Intro to Python'

The query returned the enrollments for the course 'Intro to Python', including student name, email, and completion percentage.

The results showed the students enrolled in this course and their current completion progress.

---

## 2. Enrollments with completion below 10%

The audit identified 5 enrollments with a completion percentage below 10%.

- Lucia Fernandes — Web Design Basics — 5%
- Lucia Fernandes — Digital Marketing 101 — 3%
- Lucia Fernandes — Advanced Python — 0%
- Yuki Nakamura — UI/UX Fundamentals — 0%
- Pierre Dubois — UI/UX Fundamentals — 0%

These records represent enrollments with very low progress and may require further follow-up.

---

## 3. Enrollments with no instructor

The audit identified 2 enrollments where the instructor field was NULL.

Both records belonged to the course 'UI/UX Fundamentals'.

These records were subsequently updated to use the default value 'Pending assignment'.

---

## 4. Top 5 enrollments that have not been passed

The five highest completion percentages among enrollments that had not yet been passed were:

1. Emily Watson — Web Design Basics — 60%
2. Priya Sharma — Intro to Python — 55%
3. Yuki Nakamura — Data Analysis with SQL — 45%
4. Emily Watson — Advanced Python — 40%
5. Pierre Dubois — Data Analysis with SQL — 20%

These records show students who have made progress but had not yet reached the `passed` status.

---

## 5. Enrollments created in the last year

The query returned 0 enrollments.

No enrollment records in the current dataset were created within the last year relative to the current date.

---

## 6. Missing enrollment added

A missing enrollment confirmed by email was added to the database.

The inserted record was:

- Student: Lucia Fernandes
- Email: lucia.fernandes@student.edutrack.com
- Course: Advanced Python
- Category: Programming
- Enrollment date: 2025-04-01
- Completion: 0%
- Passed: FALSE
- Monthly fee paid: €69.99
- Instructor: Carlos Vega
- Enrollment ID: 18

---

## 7. Missing instructors corrected

All enrollments where the instructor field was NULL were updated.

The default value assigned was:

`Pending assignment`

Two enrollment records were affected.

---

## 8. Test accounts removed

Before deleting the records, a SELECT query was used to verify which enrollments were associated with `@test.com` accounts.

Two test enrollments were identified:

- James Miller
- Alex Chen

These two enrollment records were subsequently deleted from the `enrollments` table.

---

## 9. Enrollments by category

The number of enrollments by category was:

- Programming: 7
- Design: 4
- Data: 3
- Marketing: 2

Programming had the highest number of enrollments.

---

## 10. Average completion by course

The average completion percentage for each course was:

- Intro to Python: 80%
- Data Analysis with SQL: 47.67%
- Advanced Python: 45%
- Digital Marketing 101: 36.5%
- Web Design Basics: 32.5%
- UI/UX Fundamentals: 0%

UI/UX Fundamentals had the lowest average completion percentage at 0%.

---

## 11. Courses with more than 3 enrollments

The query using `HAVING` identified:

- Intro to Python: 4 enrollments

This was the only course with more than 3 enrollments.

---

## 12. Total revenue by category

The total revenue collected by category was:

- Programming: €409.93
- Data: €179.97
- Design: €169.96
- Marketing: €59.98

Programming generated the highest total revenue in the dataset.

---

# Conclusion

The EduTrack enrollment audit identified several data quality issues.

The audit found 5 enrollments with completion below 10%, 2 enrollments with missing instructor information, and 2 test-account enrollments.

The missing enrollment confirmed by email was added successfully, and the records with missing instructors were updated to `Pending assignment`. The test-account enrollments were also removed after confirming the affected rows.

The aggregation analysis showed that Programming had the highest number of enrollments and the highest total revenue. At course level, Intro to Python had the highest average completion percentage, while UI/UX Fundamentals had an average completion of 0%.

These findings provide a cleaner enrollment dataset for the upcoming reporting cycle.