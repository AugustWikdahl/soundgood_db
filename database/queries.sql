-- QUERY to Select amount of lessons total and per type for 12 months. Change 2024 to another year.
WITH all_months AS (
    SELECT generate_series(1, 12) AS month
),
individual_counts AS (
    SELECT 
        EXTRACT(MONTH FROM date) AS month,
        COUNT(*) AS individual_count
    FROM "individual_lesson"
    WHERE EXTRACT(YEAR FROM date) = '2024'
    GROUP BY month
),
group_counts AS (
    SELECT 
        EXTRACT(MONTH FROM date) AS month,
        COUNT(*) AS group_count
    FROM "group_lesson"
    WHERE EXTRACT(YEAR FROM date) = '2024'
    GROUP BY month
),
ensemble_counts AS (
    SELECT 
        EXTRACT(MONTH FROM date) AS month,
        COUNT(*) AS ensemble_count
    FROM "ensemble_lesson"
    WHERE EXTRACT(YEAR FROM date) = '2024'
    GROUP BY month
)
SELECT 
    m.month,
    COALESCE(i.individual_count, 0) AS individual_lessons,
    COALESCE(g.group_count, 0) AS group_lessons,
    COALESCE(e.ensemble_count, 0) AS ensemble_lessons,
    COALESCE(i.individual_count, 0) + COALESCE(g.group_count, 0) + COALESCE(e.ensemble_count, 0) AS total_lessons
FROM all_months m
    LEFT JOIN individual_counts AS i ON m.month = i.month
    LEFT JOIN group_counts AS g ON m.month = g.month
    LEFT JOIN ensemble_counts AS e ON m.month = e.month
ORDER BY m.month;

-- Query to count siblings
WITH sibling_counts AS (
    SELECT 
        s.id AS student_id, 
        COALESCE(
            COUNT(DISTINCT CASE 
                WHEN ss.student1_id = s.id THEN ss.student2_id 
                WHEN ss.student2_id = s.id THEN ss.student1_id 
                ELSE NULL 
            END), 0) AS sibling_count
    FROM 
        "student" AS s
    LEFT JOIN 
        "student_siblings" AS ss 
        ON s.id = ss.student1_id OR s.id = ss.student2_id
    GROUP BY 
        s.id
)
SELECT 
    sibling_categories.category AS sibling_count, 
    COUNT(sc.student_id) AS num_students
FROM 
    (VALUES (0), (1), (2)) AS sibling_categories(category)
LEFT JOIN 
    sibling_counts AS sc 
    ON sibling_categories.category = sc.sibling_count
GROUP BY 
    sibling_categories.category
ORDER BY 
    sibling_categories.category;

DROP VIEW IF EXISTS lessons_given_by_instructors;
-- Create the view to track lessons given by instructors
CREATE OR REPLACE VIEW lessons_given_by_instructors AS
WITH individual_lessons_given AS (
    SELECT
        id,
        EXTRACT(MONTH FROM date) AS month,
        COUNT(*) AS individual_lesson_count
    FROM "individual_lesson"
    GROUP BY id, month
),
group_lessons_given AS (
    SELECT
        id,
        EXTRACT(MONTH FROM date) AS month,
        COUNT(*) AS group_lesson_count
    FROM "group_lesson"
    GROUP BY id, month
),
ensemble_lessons_given AS (
    SELECT
        id,
        EXTRACT(MONTH FROM date) AS month,
        COUNT(*) AS ensemble_lesson_count
    FROM "ensemble_lesson"
    GROUP BY id, month
)
SELECT 
    i.id AS instructor_id,
    i.name,
    COALESCE(individual_lesson_count, 0) + 
    COALESCE(group_lesson_count, 0) + 
    COALESCE(ensemble_lesson_count, 0) AS no_of_lessons,
    t.month
FROM "instructor" i
JOIN (
    SELECT 
        COALESCE(ilg.id, glg.id, elg.id) AS id,
        COALESCE(individual_lesson_count, 0) AS individual_lesson_count,
        COALESCE(group_lesson_count, 0) AS group_lesson_count,
        COALESCE(ensemble_lesson_count, 0) AS ensemble_lesson_count,
        COALESCE(ilg.month, glg.month, elg.month) AS month
    FROM individual_lessons_given ilg
    FULL OUTER JOIN group_lessons_given glg ON ilg.id = glg.id
    FULL OUTER JOIN ensemble_lessons_given elg ON COALESCE(ilg.id, glg.id) = elg.id
) t ON i.id = t.id
ORDER BY no_of_lessons DESC;

-- Query the view for a specific month and amount of lessons
SELECT 
    instructor_id,
    name,
    no_of_lessons
FROM lessons_given_by_instructors
WHERE month = '11' AND no_of_lessons > 2
ORDER BY no_of_lessons DESC;

-- View to get ensemble lessons
CREATE OR REPLACE VIEW ensemble_lessons_by_day AS
SELECT
    e.id,
    TO_CHAR(date, 'DY') AS weekday,
    e.date,
    e.genre, 
    e.maximum_students - COALESCE(t.student_count, 0) AS free_seats,
    CASE 
        WHEN e.maximum_students - COALESCE(t.student_count, 0) > 2 THEN 'Many seats'
        WHEN e.maximum_students - COALESCE(t.student_count, 0) > 0 THEN '1 or 2 seats'
        WHEN e.maximum_students - COALESCE(t.student_count, 0) = 0 THEN 'No seats'
        ELSE NULL
    END
FROM
    "ensemble_lesson" AS e LEFT JOIN
    (
    SELECT 
        ensemble_lesson_id AS id,
        COUNT(ensemble_lesson_id) AS student_count
    FROM
        "student_ensemble_lesson"
    GROUP BY 
        ensemble_lesson_id
    ) AS t ON e.id = t.id
ORDER BY EXTRACT(ISODOW FROM date), genre;

-- Query to view next week's ensemble lessons from a specific date
SELECT *
FROM ensemble_lessons_by_day AS e
WHERE e.date >= DATE_TRUNC('week', DATE '2024-11-11') + INTERVAL '1 week'
    AND e.date < DATE_TRUNC('week', DATE '2024-11-11') + INTERVAL '2 weeks';

-- Analyze that query
VACUUM ANALYZE;
EXPLAIN SELECT *
FROM ensemble_lessons_by_day AS e
WHERE e.date >= DATE_TRUNC('week', DATE '2024-11-11') + INTERVAL '1 week'
    AND e.date < DATE_TRUNC('week', DATE '2024-11-11') + INTERVAL '2 weeks';
