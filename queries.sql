--QUERY to Select amount of lessons total and per type for 12 months. Change 2024 to another year. 
WITH AllMonths AS (
    SELECT generate_series(1, 12) AS Month
),
IndividualCounts AS (
    SELECT 
        EXTRACT(MONTH FROM date) AS Month,
        COUNT(*) AS IndividualCount
    FROM "IndividualLesson"
    WHERE EXTRACT(YEAR FROM date) = '2024'
    GROUP BY Month
),
GroupCounts AS (
    SELECT 
        EXTRACT(MONTH FROM date) AS Month,
        COUNT(*) AS GroupCount
    FROM "GroupLesson"
    WHERE EXTRACT(YEAR FROM date) = '2024'
    GROUP BY Month
),
EnsembleCounts AS (
    SELECT 
        EXTRACT(MONTH FROM date) AS Month,
        COUNT(*) AS EnsembleCount
    FROM "EnsembleLesson"
    WHERE EXTRACT(YEAR FROM date) = '2024'
    GROUP BY Month
)
SELECT 
    m.Month,
    COALESCE(i.IndividualCount, 0) AS IndividualLessons,
    COALESCE(g.GroupCount, 0) AS GroupLessons,
    COALESCE(e.EnsembleCount, 0) AS EnsembleLessons,
    COALESCE(i.IndividualCount, 0) + COALESCE(g.GroupCount, 0) + COALESCE(e.EnsembleCount, 0) AS TotalLessons
FROM AllMonths m
    LEFT JOIN IndividualCounts as i ON m.Month = i.Month
    LEFT JOIN GroupCounts as g ON m.Month = g.Month
    LEFT JOIN EnsembleCounts as e ON m.Month = e.Month
ORDER BY m.Month;

--Query to count siblings
WITH sibling_counts AS (--This part creates a table with every student id on one side and every pair of siblings where it belongs
    SELECT 
        s.id AS student_id, 
        COALESCE(
            COUNT(DISTINCT CASE 
                WHEN ss.student1_id = s.id THEN ss.student2_id 
                WHEN ss.student2_id = s.id THEN ss.student1_id 
                ELSE NULL 
            END), 0) AS sibling_count
    FROM 
        "Student" AS s
    LEFT JOIN 
        "Student_Siblings" AS ss 
        ON s.id = ss.student1_id OR s.id = ss.student2_id
    GROUP BY 
        s.id
)
SELECT ---This part counts the amount of people in each sibling"category".
    sibling_categories.category AS sibling_count, 
    COUNT(sc.student_id) AS num_students
FROM 
    (VALUES (0), (1), (2)) AS sibling_categories(category) -- 
LEFT JOIN --Creates a table of the student id's and which category of sibling amount they belong to
    sibling_counts AS sc 
    ON sibling_categories.category = sc.sibling_count
GROUP BY 
    sibling_categories.category ---Groups them by which category they belong to and then COUNT(sc.student_id) counts how many in each category
ORDER BY 
    sibling_categories.category;


-- Create the view to track lessons given by instructors
CREATE OR REPLACE VIEW lessons_given_by_instructors AS
WITH IndividualLessonsGiven AS (
    SELECT
        id,
        EXTRACT(MONTH FROM date) AS Month,
        COUNT(*) AS IndividualLessonCount
    FROM "IndividualLesson"
    GROUP BY id, Month
),
GroupLessonsGiven AS (
    SELECT
        id,
        EXTRACT(MONTH FROM date) AS Month,
        COUNT(*) AS GroupLessonCount
    FROM "GroupLesson"
    GROUP BY id, Month
),
EnsembleLessonsGiven AS (
    SELECT
        id,
        EXTRACT(MONTH FROM date) AS Month,
        COUNT(*) AS EnsembleLessonCount
    FROM "EnsembleLesson"
    GROUP BY id, Month
)
SELECT 
    i.id AS InstructorId,
    i.name,
    COALESCE(IndividualLessonCount, 0) + 
    COALESCE(GroupLessonCount, 0) + 
    COALESCE(EnsembleLessonCount, 0) AS NoOfLessons,
    t.Month
FROM "Instructor" i
JOIN (
    SELECT 
        COALESCE(ilg.id, glg.id, elg.id) AS id,
        COALESCE(IndividualLessonCount, 0) AS IndividualLessonCount,
        COALESCE(GroupLessonCount, 0) AS GroupLessonCount,
        COALESCE(EnsembleLessonCount, 0) AS EnsembleLessonCount,
        COALESCE(ilg.Month, glg.Month, elg.Month) AS Month
    FROM IndividualLessonsGiven ilg
    FULL OUTER JOIN GroupLessonsGiven glg ON ilg.id = glg.id
    FULL OUTER JOIN EnsembleLessonsGiven elg ON COALESCE(ilg.id, glg.id) = elg.id
) t ON i.id = t.id
ORDER BY NoOfLessons DESC;

-- Query the view for a specific month and amount of lessons
SELECT 
    InstructorId,
    name,
    NoOfLessons
FROM lessons_given_by_instructors
WHERE Month = '11' and NoOfLessons > 2 -- You can change the month and amount of lessons here
ORDER BY NoOfLessons DESC;

--View to get ensemble lessons
CREATE OR REPLACE VIEW ensemble_lessons_by_day AS
SELECT
    e.id,
    TO_CHAR(date, 'DY') as weekday,
    e.date,
    e.genre, 
    e."maximumStudents" - COALESCE(t.student_count,0) as free_seats,
    CASE 
        WHEN e."maximumStudents" - COALESCE(t.student_count,0) > 2 THEN 'Many seats'
        WHEN e."maximumStudents" - COALESCE(t.student_count,0) > 0 THEN '1 or 2 seats'
        WHEN e."maximumStudents" - COALESCE(t.student_count,0) = 0 THEN 'No seats'
        ELSE NULL
    END
FROM
    "EnsembleLesson" as e LEFT JOIN
    (
    SELECT 
        "ensembleLesson_id" as id,
        COUNT("ensembleLesson_id") as student_count
    FROM
        "Student_EnsembleLesson"
    GROUP BY 
        "ensembleLesson_id"
    ) as t ON e.id = t.id
ORDER BY EXTRACT(ISODOW from date), genre;

--Query to view next weeks ensemble lessons from a specific date
SELECT *
FROM ensemble_lessons_by_day as e
WHERE e.date >= DATE_TRUNC('week', DATE '2024-11-11') + INTERVAL '1 week' --Date_TRUNC('week') select the monday of that week
    AND e.date < DATE_TRUNC('week', DATE '2024-11-11') + INTERVAL '2 weeks';




