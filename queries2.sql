queries2.sql
-- EduTrack Data Audit — Related Tables
-- 10 required queries

-- 1. List every enrollment showing student name, course title,
--    and completion percentage.
SELECT
    students.name,
    courses.title,
    enrollments.completion_percentage
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.id;


-- 2. Show students who passed at least one course,
--    with their email and the course title.
SELECT
    students.name,
    students.email,
    courses.title
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.id
WHERE enrollments.passed = TRUE;


-- 3. Calculate average completion percentage per instructor,
--    ordered from highest to lowest.
SELECT
    courses.instructor_name,
    AVG(enrollments.completion_percentage)
FROM enrollments
JOIN courses
    ON enrollments.course_id = courses.id
GROUP BY courses.instructor_name
ORDER BY AVG(enrollments.completion_percentage) DESC;


-- 4. Find all students with no enrollments.
SELECT
    students.name,
    students.email
FROM students
LEFT JOIN enrollments
    ON students.id = enrollments.student_id
WHERE enrollments.id IS NULL;


-- 5. Find all courses with no enrollments.
SELECT
    courses.title,
    courses.id
FROM courses
LEFT JOIN enrollments
    ON courses.id = enrollments.course_id
WHERE enrollments.id IS NULL;


-- 6. Count how many courses each student is enrolled in.
--    Show only students enrolled in more than one course.
SELECT
    students.name,
    COUNT(enrollments.course_id) AS course_count
FROM students
JOIN enrollments
    ON students.id = enrollments.student_id
GROUP BY students.name
HAVING COUNT(enrollments.course_id) > 1;


-- 7. Calculate total revenue per category using the course price
--    from courses.monthly_fee, not enrollments.monthly_fee_paid.
SELECT
    courses.category,
    SUM(courses.monthly_fee) AS total_revenue
FROM courses
JOIN enrollments
    ON courses.id = enrollments.course_id
GROUP BY courses.category;


-- 8. Show each instructor alongside the number of distinct students
--    currently enrolled in their courses.
SELECT
    courses.instructor_name,
    COUNT(DISTINCT students.id) AS student_count
FROM courses
JOIN enrollments
    ON courses.id = enrollments.course_id
JOIN students
    ON enrollments.student_id = students.id
GROUP BY courses.instructor_name;


-- 9. Check for enrollments whose student_id does not match
--    any existing student.
SELECT
    enrollments.id,
    enrollments.student_id
FROM enrollments
LEFT JOIN students
    ON enrollments.student_id = students.id
WHERE students.id IS NULL;


-- 10. Check for enrollments whose course_id does not match
--     any existing course.
SELECT
    enrollments.id,
    enrollments.course_id
FROM enrollments
LEFT JOIN courses
    ON enrollments.course_id = courses.id
WHERE courses.id IS NULL;
