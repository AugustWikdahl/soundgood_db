\c soundgood;
set search_path to soundgood_dump,public;

-- Clear data from all related tables before inserting new data
TRUNCATE "contact_person", "sibling_discount_rules", "student", "instructor", 
         "instrument_type", "instrument", "lease_rules", "instrument_lease", 
         "student_contact_person", "student_siblings", "instruments_taught", 
         "ensembles_taught", "availability", "individual_lesson_price", 
         "group_lesson_price", "ensemble_lesson_price", "individual_lesson", 
         "ensemble_lesson", "group_lesson", "student_ensemble_lesson", 
         "student_group_lesson" RESTART IDENTITY CASCADE;

INSERT INTO "contact_person" ("id","name","person_number","phone_number","adress","email") VALUES
 (1,'Hakeem Gamble','462162342081','1-307-451-2258','486-1874 Mauris, Rd.','consectetuer.adipiscing.elit@google.org'),
 (2,'Harper Stanton','272326841334','1-244-485-8176','P.O. Box 155, 425 Sapien, St.','sagittis.augue@protonmail.net'),
 (3,'Emma Mayer','053258176173','(768) 528-3418','1456 Elit Avenue','fusce.dolor.quam@outlook.ca'),
 (4,'Elton Ellison','031554843797','(628) 453-4441','445-5856 Luctus Street','nec.tempus@protonmail.couk'),
 (5,'Astra Bates','642011657612','1-238-546-1598','410-3708 Elit, Av.','orci@protonmail.ca');

INSERT INTO "sibling_discount_rules" ("id","date_updated","discount","discount_requirements_value", "discount_requirements_description")
VALUES (1,'2024-11-05', '10%', 12, '2 Siblings must have taken lesson within 12 months');

INSERT INTO "student" ("id","name","person_number","phone_number","adress","email", "sibling_discount_id") VALUES 
(1,'Madonna Stein','491838370111','(750) 948-5088','P.O. Box 261, 5824 Id St.','ac.turpis@protonmail.net',1),
(2,'Leslie Downs','393177064646','(239) 691-5417','Ap #285-681 Eget St.','torquent.per@protonmail.couk',1),
(3,'Ella Wells','345184192271','1-443-777-7710','3873 Dapibus St.','nunc@hotmail.org',1),
(4,'Petra Ward','562685639281','1-365-959-8165','264-8960 Fusce Road','orci.ut.semper@outlook.edu',1),
(5,'Hedda Noble','565438496666','1-203-543-1137','174-8713 Dictum St.','lorem@aol.ca',1);

INSERT INTO "instructor" ("id","name","person_number","phone_number","adress","email")
VALUES (1,'Zorita Bell','247418879353','(654) 343-1470','854-1440 Ut, Rd.','nibh.aliquam@hotmail.edu'),
 (2,'Megan Rosario','680533314381','(417) 423-4364','4805 In, Rd.','mauris@icloud.com'),
 (3,'Patrick Roth','721450322409','1-985-236-1866','132-8138 Aliquet. Avenue','ante.blandit.viverra@yahoo.couk'),
 (4,'Mason Wyatt','314235638242','(650) 563-7579','P.O. Box 759, 362 Elementum, Rd.','odio.aliquam@protonmail.org'),
 (5,'Ezra Freeman','486037249470','1-424-227-8340','P.O. Box 478, 3728 In Rd.','vitae@yahoo.org');

INSERT INTO "instrument_type" ("id","quantity","rental_price")
VALUES (1,2,10.0),
 (2,3,10.0);

INSERT INTO "instrument" ("id","instrument_type_id")
VALUES (1,1),
(2,1),
(3,2),
(4,2),
(5,2);

INSERT INTO "lease_rules" ("id","max_lease_per_student","max_lease_duration","date_updated")
VALUES (1,2, '12 months', '2024-11-21');

INSERT INTO "instrument_lease" ("student_id", "instrument_id", "start_date", "lease_rules") VALUES 
(1, 1, '2024-11-21', 1),
(1, 2, '2024-11-21', 1),
(2, 3, '2024-11-21', 1),
(2, 4, '2024-11-21', 1);

INSERT INTO "student_contact_person" ("student_id", "contact_person_id") VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO "student_siblings" ("student1_id", "student2_id") VALUES (1,3), (2,3), (4,5), (1, 2);

INSERT INTO "instruments_taught" ("instructor_id" , "instrument_type_id", "skill_level") VALUES (1, 1, 'advanced'), 
(1, 2, 'advanced'),
(2, 1, 'advanced'),
(2, 2, 'advanced'),
(3, 1, 'advanced'),
(4, 1, 'advanced'),
(5, 1, 'advanced');

INSERT INTO "ensembles_taught" ("instructor_id" , "ensemble") VALUES (1, 'pop');

INSERT INTO "availability" ("instructor_id" , "date", "time") VALUES (1, '2024-11-21', '2024-11-21 10:00:00'),
(1, '2024-11-22', '2024-11-22 10:00:00'),
(1, '2024-11-23', '2024-11-23 15:00:00');

INSERT INTO "individual_lesson_price" ("id", "skill_level", "date_updated", "price") VALUES (1, 'beginner', '2024-11-21', 150.0),
(2, 'intermediate', '2024-11-21', 150.0),
(3, 'advanced', '2024-11-21', 200.0);

INSERT INTO "group_lesson_price" ("id", "skill_level", "date_updated", "price") VALUES
(1, 'beginner', '2024-11-21', 160.0),
(2, 'intermediate', '2024-11-21', 150.0),
(3, 'advanced', '2024-11-21', 200.0);

INSERT INTO "ensemble_lesson_price" ("id", "skill_level", "date_updated", "price") VALUES
(1, 'beginner', '2024-11-21', 180.0),
(2, 'intermediate', '2024-11-21', 150.0),
(3, 'advanced', '2024-11-21', 200.0);

INSERT INTO "individual_lesson" ("id", "date", "time", "instrument", "student_id", "instructor_id", "skill_level", "price_id") VALUES 
(1, '2024-11-21', '2024-11-21 10:00:00', 'guitar', 1, 1, 'beginner', 1),
(2, '2024-11-21', '2024-11-21 11:00:00', 'guitar', 2, 2, 'beginner', 1),
(3, '2024-11-21', '2024-11-21 12:00:00', 'guitar', 3, 1, 'beginner', 1),
(4, '2024-11-21', '2024-11-21 13:00:00', 'guitar', 4, 2, 'beginner', 1);

INSERT INTO "ensemble_lesson" ("id", "date", "time", "maximum_students", "minimum_students", "genre", "instructor_id", "skill_level", "price_id") VALUES 
(9, '2024-11-24', '2024-11-24 10:00:00', 5, 3, 'jazz', 1, 'beginner', 1),
(8, '2024-11-24', '2024-11-24 10:00:00', 5, 3, 'rock', 1, 'beginner', 1),
(7, '2024-12-20', '2024-11-20 10:00:00', 5, 3, 'rock', 1, 'beginner', 1),
(6, '2024-11-26', '2024-11-26 10:00:00', 5, 3, 'pop', 1, 'beginner', 1),
(5, '2024-11-25', '2024-11-25 10:00:00', 5, 3, 'pop', 1, 'beginner', 1),
(1, '2024-11-21', '2024-11-21 10:00:00', 5, 3, 'pop', 1, 'beginner', 1),
(2, '2024-11-22', '2024-11-22 10:00:00', 5, 3, 'pop', 1, 'beginner', 1),
(3, '2024-11-23', '2024-11-23 10:00:00', 5, 3, 'pop', 1, 'beginner', 1),
(4, '2024-11-24', '2024-11-24 10:00:00', 5, 3, 'pop', 1, 'beginner', 1);

INSERT INTO "group_lesson" ("id", "date", "time", "instrument", "maximum_students", "minimum_students", "instructor_id", "skill_level", "price_id") VALUES 
(5, '2024-11-24', '2024-11-24 10:00:00', 'guitar', 10, 3, 1, 'beginner', 1),
(1, '2024-11-21', '2024-11-21 10:00:00', 'guitar', 10, 3, 1, 'beginner', 1),
(2, '2024-11-22', '2024-11-22 10:00:00', 'guitar', 10, 3, 1, 'beginner', 1),
(3, '2024-11-23', '2024-11-23 10:00:00', 'guitar', 10, 3, 1, 'beginner', 1),
(4, '2024-11-24', '2024-11-24 10:00:00', 'guitar', 10, 3, 1, 'beginner', 1);

INSERT INTO "student_ensemble_lesson" ("student_id", "ensemble_lesson_id") VALUES 
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(1, 3),
(2, 3),
(3, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 1),
(5, 1);

INSERT INTO "student_group_lesson" ("student_id", "group_lesson_id") VALUES 
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(1, 3),
(2, 3),
(3, 3),
(1, 4),
(2, 4),
(3, 4);
