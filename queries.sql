-- ============================================
-- EduTrack Data Audit
-- queries.sql
-- ============================================


-- ============================================
-- Q1. Enrollments in 'Intro to Python'
-- ============================================

SELECT student_name, student_email, completion_percentage
FROM enrollments
WHERE course_title = 'Intro to Python';


-- ============================================
-- Q2. Enrollments with completion below 10%
-- ============================================

SELECT *
FROM enrollments
WHERE completion_percentage < 10;


-- ============================================
-- Q3. Enrollments with no instructor
-- ============================================

SELECT *
FROM enrollments
WHERE instructor IS NULL;


-- ============================================
-- Q4. Top 5 enrollments not yet passed
-- ============================================

SELECT *
FROM enrollments
WHERE passed = FALSE
ORDER BY completion_percentage DESC
LIMIT 5;


-- ============================================
-- Q5. Enrollments created in the last year
-- ============================================

SELECT *
FROM enrollments
WHERE enrollment_date >= CURRENT_DATE - INTERVAL '1 year'
ORDER BY enrollment_date DESC;


-- ============================================
-- Q6. Insert the missing enrollment
-- ============================================

INSERT INTO enrollments (
    id,
    student_id,
    student_name,
    student_email,
    course_id,
    course_title,
    category,
    enrollment_date,
    completion_percentage,
    passed,
    monthly_fee_paid,
    instructor
)
VALUES (
    18,
    3,
    'Lucia Fernandes',
    'lucia.fernandes@student.edutrack.com',
    5,
    'Advanced Python',
    'Programming',
    '2025-04-01',
    0,
    FALSE,
    69.99,
    'Carlos Vega'
);


-- ============================================
-- Q7. Update enrollments with missing instructor
-- ============================================

UPDATE enrollments
SET instructor = 'Pending assignment'
WHERE instructor IS NULL;


-- ============================================
-- Q8. Delete test-account enrollments
-- ============================================

DELETE FROM enrollments
WHERE student_email LIKE '%@test.com';


-- ============================================
-- Q9. Count enrollments by category
-- ============================================

SELECT category, COUNT(*)
FROM enrollments
GROUP BY category;


-- ============================================
-- Q10. Average completion by course
-- ============================================

SELECT course_title, AVG(completion_percentage)
FROM enrollments
GROUP BY course_title;


-- ============================================
-- Q11. Courses with more than 3 enrollments
-- ============================================

SELECT course_title, COUNT(*) AS enrollment_count
FROM enrollments
GROUP BY course_title
HAVING COUNT(*) > 3;


-- ============================================
-- Q12. Total revenue by category
-- ============================================

SELECT
    category,
    SUM(monthly_fee_paid) AS total_revenue
FROM enrollments
GROUP BY category;