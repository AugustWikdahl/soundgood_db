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
LEFT JOIN IndividualCounts i ON m.Month = i.Month
LEFT JOIN GroupCounts g ON m.Month = g.Month
LEFT JOIN EnsembleCounts e ON m.Month = e.Month
ORDER BY m.Month;

--QUERY to count siblings
SELECT * FROM (
    SELECT student1_id FROM "Student_Siblings"
    UNION ALL
    SELECT student2_id FROM "Student_Siblings"
);