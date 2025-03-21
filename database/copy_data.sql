\c soundgood;
-- Export data for individual lessons to a temporary table
CREATE TEMP TABLE temp_individual_lessons AS
SELECT 
    'individual' AS lesson_type, 
    il.id AS lesson_id, 
    null AS genre, 
    il.instrument, 
    ilp.price AS lesson_price, 
    s.name AS student_name, 
    s.email AS student_email
FROM 
    "individual_lesson" il
JOIN 
    "individual_lesson_price" ilp 
    ON il.price_id = ilp.id AND il.skill_level = ilp.skill_level
JOIN 
    "student" s 
    ON il.student_id = s.id;

-- Export data for group lessons to a temporary table
CREATE TEMP TABLE temp_group_lessons AS
SELECT 
    'group' AS lesson_type, 
    gl.id AS lesson_id, 
    null AS genre, 
    gl.instrument, 
    glp.price AS lesson_price, 
    s.name AS student_name, 
    s.email AS student_email
FROM 
    "group_lesson" gl
JOIN 
    "student_group_lesson" sgl 
    ON gl.id = sgl.group_lesson_id
JOIN 
    "student" s 
    ON sgl.student_id = s.id
JOIN 
    "group_lesson_price" glp 
    ON gl.price_id = glp.id AND gl.skill_level = glp.skill_level;

-- Export data for ensemble lessons to a temporary table
CREATE TEMP TABLE temp_ensemble_lessons AS
SELECT 
    'ensemble' AS lesson_type, 
    el.id AS lesson_id, 
    el.genre, 
    null AS instrument, 
    elp.price AS lesson_price, 
    s.name AS student_name, 
    s.email AS student_email
FROM 
    "ensemble_lesson" el
JOIN 
    "student_ensemble_lesson" sel 
    ON el.id = sel.ensemble_lesson_id
JOIN 
    "student" s 
    ON sel.student_id = s.id
JOIN 
    "ensemble_lesson_price" elp 
    ON el.price_id = elp.id AND el.skill_level = elp.skill_level;

-- Combine individual, group, and ensemble lessons into a single temporary table
CREATE TEMP TABLE temp_combined_lessons AS
SELECT * FROM temp_individual_lessons
UNION ALL
SELECT * FROM temp_group_lessons
UNION ALL
SELECT * FROM temp_ensemble_lessons;

-- Export the combined data to a CSV file
\COPY (SELECT * FROM temp_combined_lessons) TO 'combined_lessons.csv' WITH CSV HEADER;

-- Connect to historicaldb
\c historicaldb;

-- Clear the historical_lessons table before import
TRUNCATE historical_lessons;

-- Import the combined data into the historical_lessons table
\COPY historical_lessons (lesson_type, lesson_id, genre, instrument, lesson_price, student_name, student_email) FROM 'combined_lessons.csv' WITH CSV HEADER;

-- Verify the imported data sorted by lesson_type and lesson_id
SELECT * 
FROM historical_lessons
ORDER BY lesson_type, lesson_id;
