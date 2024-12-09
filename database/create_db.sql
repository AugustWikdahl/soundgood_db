\c postgres;
DROP DATABASE soundgood;
CREATE DATABASE soundgood;
\c soundgood;
\i soundgood_dump.sql;
\i insert_data.sql;