--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-12-11 11:30:56

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 884 (class 1247 OID 28452)
-- Name: skill_level; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.skill_level AS ENUM (
    'beginner',
    'intermediate',
    'advanced'
);


ALTER TYPE public.skill_level OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 28459)
-- Name: contact_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_person (
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    person_number character varying(500) NOT NULL,
    phone_number character varying(500),
    adress character varying(500),
    email character varying(500)
);


ALTER TABLE public.contact_person OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 28464)
-- Name: ContactPerson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ContactPerson_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ContactPerson_id_seq" OWNER TO postgres;

--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 218
-- Name: ContactPerson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ContactPerson_id_seq" OWNED BY public.contact_person.id;


--
-- TOC entry 219 (class 1259 OID 28465)
-- Name: ensemble_lesson_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ensemble_lesson_price (
    id integer NOT NULL,
    date_updated date NOT NULL,
    price double precision NOT NULL,
    skill_level public.skill_level NOT NULL
);


ALTER TABLE public.ensemble_lesson_price OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 28468)
-- Name: EnsembleLessonPrice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."EnsembleLessonPrice_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."EnsembleLessonPrice_id_seq" OWNER TO postgres;

--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 220
-- Name: EnsembleLessonPrice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."EnsembleLessonPrice_id_seq" OWNED BY public.ensemble_lesson_price.id;


--
-- TOC entry 221 (class 1259 OID 28469)
-- Name: ensemble_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ensemble_lesson (
    id integer NOT NULL,
    date date NOT NULL,
    "time" timestamp(6) without time zone NOT NULL,
    maximum_students bigint NOT NULL,
    minimum_students bigint NOT NULL,
    genre character varying(500) NOT NULL,
    instructor_id integer NOT NULL,
    price_id integer NOT NULL,
    skill_level public.skill_level NOT NULL
);


ALTER TABLE public.ensemble_lesson OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 28474)
-- Name: EnsembleLesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."EnsembleLesson_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."EnsembleLesson_id_seq" OWNER TO postgres;

--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 222
-- Name: EnsembleLesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."EnsembleLesson_id_seq" OWNED BY public.ensemble_lesson.id;


--
-- TOC entry 223 (class 1259 OID 28475)
-- Name: group_lesson_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_lesson_price (
    id integer NOT NULL,
    date_updated date NOT NULL,
    price double precision NOT NULL,
    skill_level public.skill_level NOT NULL
);


ALTER TABLE public.group_lesson_price OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 28478)
-- Name: GroupLessonPrice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."GroupLessonPrice_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."GroupLessonPrice_id_seq" OWNER TO postgres;

--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 224
-- Name: GroupLessonPrice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."GroupLessonPrice_id_seq" OWNED BY public.group_lesson_price.id;


--
-- TOC entry 225 (class 1259 OID 28479)
-- Name: individual_lesson_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.individual_lesson_price (
    id integer NOT NULL,
    date_updated date NOT NULL,
    price double precision NOT NULL,
    skill_level public.skill_level NOT NULL
);


ALTER TABLE public.individual_lesson_price OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 28482)
-- Name: IndividualLessonPrice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."IndividualLessonPrice_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."IndividualLessonPrice_id_seq" OWNER TO postgres;

--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 226
-- Name: IndividualLessonPrice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."IndividualLessonPrice_id_seq" OWNED BY public.individual_lesson_price.id;


--
-- TOC entry 227 (class 1259 OID 28483)
-- Name: individual_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.individual_lesson (
    id integer NOT NULL,
    date date NOT NULL,
    "time" timestamp(6) without time zone NOT NULL,
    instrument character varying(500) NOT NULL,
    student_id integer NOT NULL,
    instructor_id integer NOT NULL,
    price_id integer NOT NULL,
    skill_level public.skill_level NOT NULL
);


ALTER TABLE public.individual_lesson OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 28488)
-- Name: IndividualLesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."IndividualLesson_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."IndividualLesson_id_seq" OWNER TO postgres;

--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 228
-- Name: IndividualLesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."IndividualLesson_id_seq" OWNED BY public.individual_lesson.id;


--
-- TOC entry 229 (class 1259 OID 28489)
-- Name: instructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor (
    id integer NOT NULL,
    person_number character varying(12) NOT NULL,
    name character varying(500) NOT NULL,
    phone_number character varying(500),
    adress character varying(500),
    email character varying(500)
);


ALTER TABLE public.instructor OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 28494)
-- Name: Instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Instructor_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Instructor_id_seq" OWNER TO postgres;

--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 230
-- Name: Instructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Instructor_id_seq" OWNED BY public.instructor.id;


--
-- TOC entry 231 (class 1259 OID 28495)
-- Name: instrument_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instrument_type (
    id integer NOT NULL,
    quantity double precision NOT NULL,
    name character varying(500)
);


ALTER TABLE public.instrument_type OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 28500)
-- Name: InstrumentType_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."InstrumentType_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."InstrumentType_id_seq" OWNER TO postgres;

--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 232
-- Name: InstrumentType_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."InstrumentType_id_seq" OWNED BY public.instrument_type.id;


--
-- TOC entry 233 (class 1259 OID 28501)
-- Name: instrument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instrument (
    id integer NOT NULL,
    instrument_type_id integer,
    rental_price double precision,
    brand character varying(500)
);


ALTER TABLE public.instrument OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 28506)
-- Name: Instrument_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Instrument_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Instrument_id_seq" OWNER TO postgres;

--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 234
-- Name: Instrument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Instrument_id_seq" OWNED BY public.instrument.id;


--
-- TOC entry 235 (class 1259 OID 28507)
-- Name: lease_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lease_rules (
    id integer NOT NULL,
    date_updated date NOT NULL,
    max_lease_per_student character varying(500),
    max_lease_duration character varying(500)
);


ALTER TABLE public.lease_rules OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 28512)
-- Name: LeaseRules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."LeaseRules_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."LeaseRules_id_seq" OWNER TO postgres;

--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 236
-- Name: LeaseRules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."LeaseRules_id_seq" OWNED BY public.lease_rules.id;


--
-- TOC entry 237 (class 1259 OID 28513)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    person_number character varying(12) NOT NULL,
    name character varying(500) NOT NULL,
    phone_number character varying(500),
    adress character varying(500),
    email character varying(500),
    sibling_discount_id integer
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 28518)
-- Name: Student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Student_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Student_id_seq" OWNER TO postgres;

--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 238
-- Name: Student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Student_id_seq" OWNED BY public.student.id;


--
-- TOC entry 239 (class 1259 OID 28519)
-- Name: availability; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.availability (
    instructor_id integer NOT NULL,
    date date NOT NULL,
    "time" timestamp without time zone NOT NULL
);


ALTER TABLE public.availability OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 28522)
-- Name: student_ensemble_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_ensemble_lesson (
    student_id integer NOT NULL,
    ensemble_lesson_id integer NOT NULL
);


ALTER TABLE public.student_ensemble_lesson OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 28525)
-- Name: ensemble_lessons_by_day; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ensemble_lessons_by_day AS
 SELECT e.id,
    to_char((e.date)::timestamp with time zone, 'DY'::text) AS weekday,
    e.date,
    e.genre,
    (e.maximum_students - COALESCE(t.student_count, (0)::bigint)) AS free_seats,
        CASE
            WHEN ((e.maximum_students - COALESCE(t.student_count, (0)::bigint)) > 2) THEN 'Many seats'::text
            WHEN ((e.maximum_students - COALESCE(t.student_count, (0)::bigint)) > 0) THEN '1 or 2 seats'::text
            WHEN ((e.maximum_students - COALESCE(t.student_count, (0)::bigint)) = 0) THEN 'No seats'::text
            ELSE NULL::text
        END AS "case"
   FROM (public.ensemble_lesson e
     LEFT JOIN ( SELECT student_ensemble_lesson.ensemble_lesson_id AS id,
            count(student_ensemble_lesson.ensemble_lesson_id) AS student_count
           FROM public.student_ensemble_lesson
          GROUP BY student_ensemble_lesson.ensemble_lesson_id) t ON ((e.id = t.id)))
  ORDER BY (EXTRACT(isodow FROM e.date)), e.genre;


ALTER VIEW public.ensemble_lessons_by_day OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 28530)
-- Name: ensemble_lessons_by_days; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ensemble_lessons_by_days AS
 SELECT e.id,
    to_char((e.date)::timestamp with time zone, 'DY'::text) AS weekday,
    e.date,
    e.genre,
    (e.maximum_students - COALESCE(t.student_count, (0)::bigint)) AS free_seats,
        CASE
            WHEN ((e.maximum_students - COALESCE(t.student_count, (0)::bigint)) > 2) THEN 'Many seats'::text
            WHEN ((e.maximum_students - COALESCE(t.student_count, (0)::bigint)) > 0) THEN '1 or 2 seats'::text
            WHEN ((e.maximum_students - COALESCE(t.student_count, (0)::bigint)) = 0) THEN 'No seats'::text
            ELSE NULL::text
        END AS "case"
   FROM (public.ensemble_lesson e
     LEFT JOIN ( SELECT student_ensemble_lesson.ensemble_lesson_id AS id,
            count(student_ensemble_lesson.ensemble_lesson_id) AS student_count
           FROM public.student_ensemble_lesson
          GROUP BY student_ensemble_lesson.ensemble_lesson_id) t ON ((e.id = t.id)))
  ORDER BY (EXTRACT(isodow FROM e.date)), e.genre;


ALTER VIEW public.ensemble_lessons_by_days OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 28535)
-- Name: ensemble_lessons_by_dayss; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ensemble_lessons_by_dayss AS
 SELECT e.id,
    to_char((e.date)::timestamp with time zone, 'DY'::text) AS weekday,
    e.date,
    e.genre,
    (e.maximum_students - COALESCE(t.student_count, (0)::bigint)) AS free_seats,
        CASE
            WHEN ((e.maximum_students - COALESCE(t.student_count, (0)::bigint)) > 2) THEN 'Many seats'::text
            WHEN ((e.maximum_students - COALESCE(t.student_count, (0)::bigint)) > 0) THEN '1 or 2 seats'::text
            WHEN ((e.maximum_students - COALESCE(t.student_count, (0)::bigint)) = 0) THEN 'No seats'::text
            ELSE NULL::text
        END AS "case"
   FROM (public.ensemble_lesson e
     LEFT JOIN ( SELECT student_ensemble_lesson.ensemble_lesson_id AS id,
            count(student_ensemble_lesson.ensemble_lesson_id) AS student_count
           FROM public.student_ensemble_lesson
          GROUP BY student_ensemble_lesson.ensemble_lesson_id) t ON ((e.id = t.id)))
  ORDER BY (EXTRACT(isodow FROM e.date)), e.genre;


ALTER VIEW public.ensemble_lessons_by_dayss OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 28540)
-- Name: ensemble_lessons_next_week; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ensemble_lessons_next_week AS
 SELECT e.id,
    to_char((e.date)::timestamp with time zone, 'DY'::text) AS weekday,
    e.genre,
    (e.maximum_students - COALESCE(t.student_count, (0)::bigint)) AS free_seats,
        CASE
            WHEN ((e.maximum_students - COALESCE(t.student_count, (0)::bigint)) > 2) THEN 'Many seats'::text
            WHEN ((e.maximum_students - COALESCE(t.student_count, (0)::bigint)) > 0) THEN '1 or 2 seats'::text
            WHEN ((e.maximum_students - COALESCE(t.student_count, (0)::bigint)) = 0) THEN 'No seats'::text
            ELSE NULL::text
        END AS "case"
   FROM (public.ensemble_lesson e
     LEFT JOIN ( SELECT student_ensemble_lesson.ensemble_lesson_id AS id,
            count(student_ensemble_lesson.ensemble_lesson_id) AS student_count
           FROM public.student_ensemble_lesson
          GROUP BY student_ensemble_lesson.ensemble_lesson_id) t ON ((e.id = t.id)));


ALTER VIEW public.ensemble_lessons_next_week OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 28545)
-- Name: ensembles_taught; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ensembles_taught (
    instructor_id integer NOT NULL,
    ensemble character varying(500) NOT NULL
);


ALTER TABLE public.ensembles_taught OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 28548)
-- Name: group_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_lesson (
    id bigint NOT NULL,
    date date NOT NULL,
    "time" timestamp without time zone NOT NULL,
    maximum_students bigint NOT NULL,
    minimum_students bigint NOT NULL,
    instrument character varying(500) NOT NULL,
    instructor_id integer NOT NULL,
    price_id integer NOT NULL,
    skill_level public.skill_level NOT NULL
);


ALTER TABLE public.group_lesson OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 28553)
-- Name: instrument_lease; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instrument_lease (
    start_date date NOT NULL,
    lease_rules integer NOT NULL,
    is_terminated boolean,
    id integer NOT NULL,
    student_id integer,
    instrument_id integer
);


ALTER TABLE public.instrument_lease OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 28824)
-- Name: instrument_lease_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instrument_lease_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instrument_lease_id_seq OWNER TO postgres;

--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 255
-- Name: instrument_lease_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instrument_lease_id_seq OWNED BY public.instrument_lease.id;


--
-- TOC entry 248 (class 1259 OID 28556)
-- Name: instruments_taught; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instruments_taught (
    instructor_id integer NOT NULL,
    instrument_type_id integer NOT NULL,
    skill_level public.skill_level NOT NULL
);


ALTER TABLE public.instruments_taught OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 28559)
-- Name: lessons_given_by_instructors; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.lessons_given_by_instructors AS
 WITH individual_lessons_given AS (
         SELECT individual_lesson.id,
            EXTRACT(month FROM individual_lesson.date) AS month,
            count(*) AS individual_lesson_count
           FROM public.individual_lesson
          GROUP BY individual_lesson.id, (EXTRACT(month FROM individual_lesson.date))
        ), group_lessons_given AS (
         SELECT group_lesson.id,
            EXTRACT(month FROM group_lesson.date) AS month,
            count(*) AS group_lesson_count
           FROM public.group_lesson
          GROUP BY group_lesson.id, (EXTRACT(month FROM group_lesson.date))
        ), ensemble_lessons_given AS (
         SELECT ensemble_lesson.id,
            EXTRACT(month FROM ensemble_lesson.date) AS month,
            count(*) AS ensemble_lesson_count
           FROM public.ensemble_lesson
          GROUP BY ensemble_lesson.id, (EXTRACT(month FROM ensemble_lesson.date))
        )
 SELECT i.id AS instructor_id,
    i.name,
    ((COALESCE(t.individual_lesson_count, (0)::bigint) + COALESCE(t.group_lesson_count, (0)::bigint)) + COALESCE(t.ensemble_lesson_count, (0)::bigint)) AS no_of_lessons,
    t.month
   FROM (public.instructor i
     JOIN ( SELECT COALESCE((ilg.id)::bigint, glg.id, (elg.id)::bigint) AS id,
            COALESCE(ilg.individual_lesson_count, (0)::bigint) AS individual_lesson_count,
            COALESCE(glg.group_lesson_count, (0)::bigint) AS group_lesson_count,
            COALESCE(elg.ensemble_lesson_count, (0)::bigint) AS ensemble_lesson_count,
            COALESCE(ilg.month, glg.month, elg.month) AS month
           FROM ((individual_lessons_given ilg
             FULL JOIN group_lessons_given glg ON ((ilg.id = glg.id)))
             FULL JOIN ensemble_lessons_given elg ON ((COALESCE((ilg.id)::bigint, glg.id) = elg.id)))) t ON ((i.id = t.id)))
  ORDER BY ((COALESCE(t.individual_lesson_count, (0)::bigint) + COALESCE(t.group_lesson_count, (0)::bigint)) + COALESCE(t.ensemble_lesson_count, (0)::bigint)) DESC;


ALTER VIEW public.lessons_given_by_instructors OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 28564)
-- Name: sibling_discount_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sibling_discount_rules (
    id integer NOT NULL,
    date_updated date NOT NULL,
    discount character varying(500) NOT NULL,
    discount_requirements_value integer,
    discount_requirements_description character varying(500)
);


ALTER TABLE public.sibling_discount_rules OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 28569)
-- Name: siblingDiscountRules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."siblingDiscountRules_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."siblingDiscountRules_id_seq" OWNER TO postgres;

--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 251
-- Name: siblingDiscountRules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."siblingDiscountRules_id_seq" OWNED BY public.sibling_discount_rules.id;


--
-- TOC entry 252 (class 1259 OID 28570)
-- Name: student_contact_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_contact_person (
    student_id integer NOT NULL,
    contact_person_id integer NOT NULL
);


ALTER TABLE public.student_contact_person OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 28573)
-- Name: student_group_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_group_lesson (
    student_id integer NOT NULL,
    group_lesson_id integer NOT NULL
);


ALTER TABLE public.student_group_lesson OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 28576)
-- Name: student_siblings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_siblings (
    student1_id integer NOT NULL,
    student2_id integer NOT NULL
);


ALTER TABLE public.student_siblings OWNER TO postgres;

--
-- TOC entry 4810 (class 2604 OID 28579)
-- Name: contact_person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person ALTER COLUMN id SET DEFAULT nextval('public."ContactPerson_id_seq"'::regclass);


--
-- TOC entry 4812 (class 2604 OID 28580)
-- Name: ensemble_lesson id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble_lesson ALTER COLUMN id SET DEFAULT nextval('public."EnsembleLesson_id_seq"'::regclass);


--
-- TOC entry 4811 (class 2604 OID 28581)
-- Name: ensemble_lesson_price id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble_lesson_price ALTER COLUMN id SET DEFAULT nextval('public."EnsembleLessonPrice_id_seq"'::regclass);


--
-- TOC entry 4813 (class 2604 OID 28582)
-- Name: group_lesson_price id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson_price ALTER COLUMN id SET DEFAULT nextval('public."GroupLessonPrice_id_seq"'::regclass);


--
-- TOC entry 4815 (class 2604 OID 28583)
-- Name: individual_lesson id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson ALTER COLUMN id SET DEFAULT nextval('public."IndividualLesson_id_seq"'::regclass);


--
-- TOC entry 4814 (class 2604 OID 28584)
-- Name: individual_lesson_price id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson_price ALTER COLUMN id SET DEFAULT nextval('public."IndividualLessonPrice_id_seq"'::regclass);


--
-- TOC entry 4816 (class 2604 OID 28585)
-- Name: instructor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor ALTER COLUMN id SET DEFAULT nextval('public."Instructor_id_seq"'::regclass);


--
-- TOC entry 4818 (class 2604 OID 28586)
-- Name: instrument id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument ALTER COLUMN id SET DEFAULT nextval('public."Instrument_id_seq"'::regclass);


--
-- TOC entry 4821 (class 2604 OID 28825)
-- Name: instrument_lease id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument_lease ALTER COLUMN id SET DEFAULT nextval('public.instrument_lease_id_seq'::regclass);


--
-- TOC entry 4817 (class 2604 OID 28587)
-- Name: instrument_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument_type ALTER COLUMN id SET DEFAULT nextval('public."InstrumentType_id_seq"'::regclass);


--
-- TOC entry 4819 (class 2604 OID 28588)
-- Name: lease_rules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lease_rules ALTER COLUMN id SET DEFAULT nextval('public."LeaseRules_id_seq"'::regclass);


--
-- TOC entry 4822 (class 2604 OID 28589)
-- Name: sibling_discount_rules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_discount_rules ALTER COLUMN id SET DEFAULT nextval('public."siblingDiscountRules_id_seq"'::regclass);


--
-- TOC entry 4820 (class 2604 OID 28590)
-- Name: student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public."Student_id_seq"'::regclass);


--
-- TOC entry 4824 (class 2606 OID 28592)
-- Name: contact_person ContactPerson_personNumber_personNumber1_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT "ContactPerson_personNumber_personNumber1_key" UNIQUE (person_number) INCLUDE (person_number);


--
-- TOC entry 4838 (class 2606 OID 28594)
-- Name: instructor Instructor_personNumber_personNumber1_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT "Instructor_personNumber_personNumber1_key" UNIQUE (person_number) INCLUDE (person_number);


--
-- TOC entry 4848 (class 2606 OID 28596)
-- Name: student Student_personNumber_personNumber1_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT "Student_personNumber_personNumber1_key" UNIQUE (person_number) INCLUDE (person_number);


--
-- TOC entry 4852 (class 2606 OID 28598)
-- Name: availability availability_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.availability
    ADD CONSTRAINT availability_pkey PRIMARY KEY (instructor_id, date, "time");


--
-- TOC entry 4826 (class 2606 OID 28600)
-- Name: contact_person contact_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT contact_person_pkey PRIMARY KEY (id);


--
-- TOC entry 4830 (class 2606 OID 28602)
-- Name: ensemble_lesson ensemble_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble_lesson
    ADD CONSTRAINT ensemble_lesson_pkey PRIMARY KEY (id);


--
-- TOC entry 4828 (class 2606 OID 28604)
-- Name: ensemble_lesson_price ensemble_lesson_price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble_lesson_price
    ADD CONSTRAINT ensemble_lesson_price_pkey PRIMARY KEY (id);


--
-- TOC entry 4856 (class 2606 OID 28606)
-- Name: ensembles_taught ensembles_taught_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensembles_taught
    ADD CONSTRAINT ensembles_taught_pkey PRIMARY KEY (instructor_id);


--
-- TOC entry 4858 (class 2606 OID 28608)
-- Name: group_lesson group_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson
    ADD CONSTRAINT group_lesson_pkey PRIMARY KEY (id);


--
-- TOC entry 4832 (class 2606 OID 28610)
-- Name: group_lesson_price group_lesson_price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson_price
    ADD CONSTRAINT group_lesson_price_pkey PRIMARY KEY (id);


--
-- TOC entry 4836 (class 2606 OID 28612)
-- Name: individual_lesson individual_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson
    ADD CONSTRAINT individual_lesson_pkey PRIMARY KEY (id);


--
-- TOC entry 4834 (class 2606 OID 28614)
-- Name: individual_lesson_price individual_lesson_price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson_price
    ADD CONSTRAINT individual_lesson_price_pkey PRIMARY KEY (id);


--
-- TOC entry 4840 (class 2606 OID 28616)
-- Name: instructor instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_pkey PRIMARY KEY (id);


--
-- TOC entry 4860 (class 2606 OID 28830)
-- Name: instrument_lease instrument_lease_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument_lease
    ADD CONSTRAINT instrument_lease_pkey PRIMARY KEY (id);


--
-- TOC entry 4844 (class 2606 OID 28620)
-- Name: instrument instrument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_pkey PRIMARY KEY (id);


--
-- TOC entry 4842 (class 2606 OID 28622)
-- Name: instrument_type instrument_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument_type
    ADD CONSTRAINT instrument_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4846 (class 2606 OID 28624)
-- Name: lease_rules lease_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lease_rules
    ADD CONSTRAINT lease_rules_pkey PRIMARY KEY (id);


--
-- TOC entry 4862 (class 2606 OID 28626)
-- Name: sibling_discount_rules sibling_discount_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_discount_rules
    ADD CONSTRAINT sibling_discount_rules_pkey PRIMARY KEY (id);


--
-- TOC entry 4864 (class 2606 OID 28628)
-- Name: student_contact_person student_contact_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_contact_person
    ADD CONSTRAINT student_contact_person_pkey PRIMARY KEY (student_id, contact_person_id);


--
-- TOC entry 4854 (class 2606 OID 28630)
-- Name: student_ensemble_lesson student_ensemble_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_ensemble_lesson
    ADD CONSTRAINT student_ensemble_lesson_pkey PRIMARY KEY (student_id, ensemble_lesson_id);


--
-- TOC entry 4866 (class 2606 OID 28632)
-- Name: student_group_lesson student_group_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_group_lesson
    ADD CONSTRAINT student_group_lesson_pkey PRIMARY KEY (student_id, group_lesson_id);


--
-- TOC entry 4850 (class 2606 OID 28634)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- TOC entry 4868 (class 2606 OID 28636)
-- Name: student_siblings student_siblings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_siblings
    ADD CONSTRAINT student_siblings_pkey PRIMARY KEY (student1_id, student2_id);


--
-- TOC entry 4883 (class 2606 OID 28637)
-- Name: instruments_taught InstrumentsTaught_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instruments_taught
    ADD CONSTRAINT "InstrumentsTaught_instructor_id_fkey" FOREIGN KEY (instructor_id) REFERENCES public.instructor(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4884 (class 2606 OID 28642)
-- Name: student_contact_person Student_ContactPerson_contactPerson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_contact_person
    ADD CONSTRAINT "Student_ContactPerson_contactPerson_id_fkey" FOREIGN KEY (contact_person_id) REFERENCES public.contact_person(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4885 (class 2606 OID 28647)
-- Name: student_contact_person Student_ContactPerson_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_contact_person
    ADD CONSTRAINT "Student_ContactPerson_student_id_fkey" FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4875 (class 2606 OID 28652)
-- Name: student_ensemble_lesson Student_EnsembleLesson_ensembleLesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_ensemble_lesson
    ADD CONSTRAINT "Student_EnsembleLesson_ensembleLesson_id_fkey" FOREIGN KEY (ensemble_lesson_id) REFERENCES public.ensemble_lesson(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4876 (class 2606 OID 28657)
-- Name: student_ensemble_lesson Student_EnsembleLesson_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_ensemble_lesson
    ADD CONSTRAINT "Student_EnsembleLesson_student_id_fkey" FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4886 (class 2606 OID 28662)
-- Name: student_group_lesson Student_GroupLesson_groupLesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_group_lesson
    ADD CONSTRAINT "Student_GroupLesson_groupLesson_id_fkey" FOREIGN KEY (group_lesson_id) REFERENCES public.group_lesson(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4887 (class 2606 OID 28667)
-- Name: student_group_lesson Student_GroupLesson_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_group_lesson
    ADD CONSTRAINT "Student_GroupLesson_student_id_fkey" FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4888 (class 2606 OID 28672)
-- Name: student_siblings Student_Siblings_student1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_siblings
    ADD CONSTRAINT "Student_Siblings_student1_id_fkey" FOREIGN KEY (student1_id) REFERENCES public.student(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4889 (class 2606 OID 28677)
-- Name: student_siblings Student_Siblings_student2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_siblings
    ADD CONSTRAINT "Student_Siblings_student2_id_fkey" FOREIGN KEY (student2_id) REFERENCES public.student(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4869 (class 2606 OID 28682)
-- Name: ensemble_lesson instructor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble_lesson
    ADD CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES public.instructor(id) NOT VALID;


--
-- TOC entry 4878 (class 2606 OID 28687)
-- Name: group_lesson instructor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson
    ADD CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES public.instructor(id) NOT VALID;


--
-- TOC entry 4871 (class 2606 OID 28692)
-- Name: individual_lesson instructor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson
    ADD CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES public.instructor(id) NOT VALID;


--
-- TOC entry 4874 (class 2606 OID 28697)
-- Name: availability instructor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.availability
    ADD CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES public.instructor(id);


--
-- TOC entry 4877 (class 2606 OID 28702)
-- Name: ensembles_taught instructor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensembles_taught
    ADD CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES public.instructor(id);


--
-- TOC entry 4880 (class 2606 OID 28836)
-- Name: instrument_lease instrument_lease_instrument_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument_lease
    ADD CONSTRAINT instrument_lease_instrument_id_fkey FOREIGN KEY (instrument_id) REFERENCES public.instrument(id) NOT VALID;


--
-- TOC entry 4881 (class 2606 OID 28831)
-- Name: instrument_lease instrument_lease_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument_lease
    ADD CONSTRAINT instrument_lease_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) NOT VALID;


--
-- TOC entry 4882 (class 2606 OID 28712)
-- Name: instrument_lease leaseRules_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument_lease
    ADD CONSTRAINT "leaseRules_id" FOREIGN KEY (lease_rules) REFERENCES public.lease_rules(id) NOT VALID;


--
-- TOC entry 4872 (class 2606 OID 28717)
-- Name: individual_lesson price; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson
    ADD CONSTRAINT price FOREIGN KEY (price_id) REFERENCES public.individual_lesson_price(id) NOT VALID;


--
-- TOC entry 4870 (class 2606 OID 28722)
-- Name: ensemble_lesson price_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ensemble_lesson
    ADD CONSTRAINT price_id FOREIGN KEY (price_id) REFERENCES public.ensemble_lesson_price(id) NOT VALID;


--
-- TOC entry 4879 (class 2606 OID 28727)
-- Name: group_lesson price_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_lesson
    ADD CONSTRAINT price_id FOREIGN KEY (price_id) REFERENCES public.group_lesson_price(id) NOT VALID;


--
-- TOC entry 4873 (class 2606 OID 28732)
-- Name: individual_lesson student_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual_lesson
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES public.student(id) NOT VALID;


-- Completed on 2024-12-11 11:30:56

--
-- PostgreSQL database dump complete
--

