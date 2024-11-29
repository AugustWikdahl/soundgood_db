-- Create database
CREATE DATABASE historicaldb;

-- Connect to HistoricalDB
\c historicaldb;

-- Create a table to store historical data
CREATE TABLE historical_lessons (
    id SERIAL PRIMARY KEY,
    lesson_type VARCHAR(20) NOT NULL,
    genre VARCHAR(500), -- Optional: empty if not an ensemble
    instrument VARCHAR(500), -- Optional: empty if an ensemble
    lesson_price double precision NOT NULL,
    student_name VARCHAR(500) NOT NULL,
    student_email VARCHAR(500) NOT NULL
);
ALTER TABLE historical_lessons ADD COLUMN lesson_id bigint;