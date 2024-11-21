--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-11-21 16:01:41

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
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 941 (class 1247 OID 17649)
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
-- TOC entry 245 (class 1259 OID 16654)
-- Name: Availability; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Availability" (
    instructor_id integer NOT NULL,
    date date NOT NULL,
    "time" timestamp without time zone NOT NULL
);


ALTER TABLE public."Availability" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16442)
-- Name: ContactPerson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ContactPerson" (
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    "personNumber" character varying(500) NOT NULL,
    "phoneNumber" character varying(500),
    adress character varying(500),
    email character varying(500)
);


ALTER TABLE public."ContactPerson" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16441)
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
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 219
-- Name: ContactPerson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ContactPerson_id_seq" OWNED BY public."ContactPerson".id;


--
-- TOC entry 234 (class 1259 OID 16499)
-- Name: EnsembleLesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EnsembleLesson" (
    id integer NOT NULL,
    date date NOT NULL,
    "time" timestamp(6) without time zone NOT NULL,
    "maximumStudents" bigint NOT NULL,
    "minimumStudents" bigint NOT NULL,
    genre character varying(500) NOT NULL,
    instructor_id integer NOT NULL,
    price_id integer NOT NULL,
    "skillLevel" public.skill_level NOT NULL
);


ALTER TABLE public."EnsembleLesson" OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16522)
-- Name: EnsembleLessonPrice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EnsembleLessonPrice" (
    id integer NOT NULL,
    "dateUpdated" date NOT NULL,
    price double precision NOT NULL,
    "skillLevel" public.skill_level NOT NULL
);


ALTER TABLE public."EnsembleLessonPrice" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16521)
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
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 238
-- Name: EnsembleLessonPrice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."EnsembleLessonPrice_id_seq" OWNED BY public."EnsembleLessonPrice".id;


--
-- TOC entry 233 (class 1259 OID 16498)
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
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 233
-- Name: EnsembleLesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."EnsembleLesson_id_seq" OWNED BY public."EnsembleLesson".id;


--
-- TOC entry 247 (class 1259 OID 16681)
-- Name: EnsemblesTaught; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EnsemblesTaught" (
    instructor_id integer NOT NULL,
    ensemble character varying(500) NOT NULL
);


ALTER TABLE public."EnsemblesTaught" OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16507)
-- Name: GroupLesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GroupLesson" (
    id bigint NOT NULL,
    date date NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "maximumStudents" bigint NOT NULL,
    "minimumStudents" bigint NOT NULL,
    instrument character varying(500) NOT NULL,
    instructor_id integer NOT NULL,
    price_id integer NOT NULL,
    "skillLevel" public.skill_level NOT NULL
);


ALTER TABLE public."GroupLesson" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16515)
-- Name: GroupLessonPrice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GroupLessonPrice" (
    id integer NOT NULL,
    "dateUpdated" date NOT NULL,
    price double precision NOT NULL,
    "skillLevel" public.skill_level NOT NULL
);


ALTER TABLE public."GroupLessonPrice" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16514)
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
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 236
-- Name: GroupLessonPrice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."GroupLessonPrice_id_seq" OWNED BY public."GroupLessonPrice".id;


--
-- TOC entry 232 (class 1259 OID 16490)
-- Name: IndividualLesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."IndividualLesson" (
    id integer NOT NULL,
    date date NOT NULL,
    "time" timestamp(6) without time zone NOT NULL,
    instrument character varying(500) NOT NULL,
    student_id integer NOT NULL,
    instructor_id integer NOT NULL,
    price_id integer NOT NULL,
    "skillLevel" public.skill_level NOT NULL
);


ALTER TABLE public."IndividualLesson" OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16529)
-- Name: IndividualLessonPrice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."IndividualLessonPrice" (
    id integer NOT NULL,
    "dateUpdated" date NOT NULL,
    price double precision NOT NULL,
    "skillLevel" public.skill_level NOT NULL
);


ALTER TABLE public."IndividualLessonPrice" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16528)
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
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 240
-- Name: IndividualLessonPrice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."IndividualLessonPrice_id_seq" OWNED BY public."IndividualLessonPrice".id;


--
-- TOC entry 231 (class 1259 OID 16489)
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
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 231
-- Name: IndividualLesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."IndividualLesson_id_seq" OWNED BY public."IndividualLesson".id;


--
-- TOC entry 230 (class 1259 OID 16481)
-- Name: Instructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Instructor" (
    id integer NOT NULL,
    "personNumber" character varying(12) NOT NULL,
    name character varying(500) NOT NULL,
    "phoneNumber" character varying(500),
    adress character varying(500),
    email character varying(500)
);


ALTER TABLE public."Instructor" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16480)
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
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 229
-- Name: Instructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Instructor_id_seq" OWNED BY public."Instructor".id;


--
-- TOC entry 224 (class 1259 OID 16460)
-- Name: Instrument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Instrument" (
    id integer NOT NULL,
    "instrumentType_id" integer
);


ALTER TABLE public."Instrument" OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16634)
-- Name: InstrumentLease; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InstrumentLease" (
    student_id integer NOT NULL,
    instrument_id integer NOT NULL,
    "startDate" date NOT NULL,
    "leaseRules" integer NOT NULL
);


ALTER TABLE public."InstrumentLease" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16465)
-- Name: InstrumentType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InstrumentType" (
    id integer NOT NULL,
    quantity double precision NOT NULL,
    "rentalPrice" double precision NOT NULL
);


ALTER TABLE public."InstrumentType" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16464)
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
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 225
-- Name: InstrumentType_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."InstrumentType_id_seq" OWNED BY public."InstrumentType".id;


--
-- TOC entry 223 (class 1259 OID 16459)
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
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 223
-- Name: Instrument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Instrument_id_seq" OWNED BY public."Instrument".id;


--
-- TOC entry 246 (class 1259 OID 16664)
-- Name: InstrumentsTaught; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InstrumentsTaught" (
    instructor_id integer NOT NULL,
    "instrumentType_id" integer NOT NULL,
    "skillLevel" public.skill_level NOT NULL
);


ALTER TABLE public."InstrumentsTaught" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16472)
-- Name: LeaseRules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LeaseRules" (
    id integer NOT NULL,
    "maxLeasePerStudent" character varying(500) NOT NULL,
    "maxLeaseDuration" character varying(500) NOT NULL,
    "dateUpdated" date NOT NULL
);


ALTER TABLE public."LeaseRules" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16471)
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
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 227
-- Name: LeaseRules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."LeaseRules_id_seq" OWNED BY public."LeaseRules".id;


--
-- TOC entry 222 (class 1259 OID 16451)
-- Name: SiblingDiscountRules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SiblingDiscountRules" (
    id integer NOT NULL,
    "dateUpdated" date NOT NULL,
    discount character varying NOT NULL,
    "discountRequirements" character varying NOT NULL
);


ALTER TABLE public."SiblingDiscountRules" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16433)
-- Name: Student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Student" (
    id integer NOT NULL,
    "personNumber" character varying(12) NOT NULL,
    name character varying(500) NOT NULL,
    "phoneNumber" character varying(500),
    adress character varying(500),
    email character varying(500),
    "siblingDiscount_id" integer
);


ALTER TABLE public."Student" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16619)
-- Name: Student_ContactPerson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Student_ContactPerson" (
    student_id integer NOT NULL,
    "contactPerson_id" integer NOT NULL
);


ALTER TABLE public."Student_ContactPerson" OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16706)
-- Name: Student_EnsembleLesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Student_EnsembleLesson" (
    student_id integer NOT NULL,
    "ensembleLesson_id" integer NOT NULL
);


ALTER TABLE public."Student_EnsembleLesson" OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16691)
-- Name: Student_GroupLesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Student_GroupLesson" (
    student_id integer NOT NULL,
    "groupLesson_id" integer NOT NULL
);


ALTER TABLE public."Student_GroupLesson" OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16604)
-- Name: Student_Siblings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Student_Siblings" (
    student1_id integer NOT NULL,
    student2_id integer NOT NULL
);


ALTER TABLE public."Student_Siblings" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16432)
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
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 217
-- Name: Student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Student_id_seq" OWNED BY public."Student".id;


--
-- TOC entry 221 (class 1259 OID 16450)
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
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 221
-- Name: siblingDiscountRules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."siblingDiscountRules_id_seq" OWNED BY public."SiblingDiscountRules".id;


--
-- TOC entry 4790 (class 2604 OID 16445)
-- Name: ContactPerson id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactPerson" ALTER COLUMN id SET DEFAULT nextval('public."ContactPerson_id_seq"'::regclass);


--
-- TOC entry 4797 (class 2604 OID 16502)
-- Name: EnsembleLesson id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EnsembleLesson" ALTER COLUMN id SET DEFAULT nextval('public."EnsembleLesson_id_seq"'::regclass);


--
-- TOC entry 4799 (class 2604 OID 16525)
-- Name: EnsembleLessonPrice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EnsembleLessonPrice" ALTER COLUMN id SET DEFAULT nextval('public."EnsembleLessonPrice_id_seq"'::regclass);


--
-- TOC entry 4798 (class 2604 OID 16518)
-- Name: GroupLessonPrice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GroupLessonPrice" ALTER COLUMN id SET DEFAULT nextval('public."GroupLessonPrice_id_seq"'::regclass);


--
-- TOC entry 4796 (class 2604 OID 16493)
-- Name: IndividualLesson id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IndividualLesson" ALTER COLUMN id SET DEFAULT nextval('public."IndividualLesson_id_seq"'::regclass);


--
-- TOC entry 4800 (class 2604 OID 16532)
-- Name: IndividualLessonPrice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IndividualLessonPrice" ALTER COLUMN id SET DEFAULT nextval('public."IndividualLessonPrice_id_seq"'::regclass);


--
-- TOC entry 4795 (class 2604 OID 16484)
-- Name: Instructor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Instructor" ALTER COLUMN id SET DEFAULT nextval('public."Instructor_id_seq"'::regclass);


--
-- TOC entry 4792 (class 2604 OID 16463)
-- Name: Instrument id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Instrument" ALTER COLUMN id SET DEFAULT nextval('public."Instrument_id_seq"'::regclass);


--
-- TOC entry 4793 (class 2604 OID 16468)
-- Name: InstrumentType id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InstrumentType" ALTER COLUMN id SET DEFAULT nextval('public."InstrumentType_id_seq"'::regclass);


--
-- TOC entry 4794 (class 2604 OID 16475)
-- Name: LeaseRules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LeaseRules" ALTER COLUMN id SET DEFAULT nextval('public."LeaseRules_id_seq"'::regclass);


--
-- TOC entry 4791 (class 2604 OID 16454)
-- Name: SiblingDiscountRules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SiblingDiscountRules" ALTER COLUMN id SET DEFAULT nextval('public."siblingDiscountRules_id_seq"'::regclass);


--
-- TOC entry 4789 (class 2604 OID 16436)
-- Name: Student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student" ALTER COLUMN id SET DEFAULT nextval('public."Student_id_seq"'::regclass);


--
-- TOC entry 4840 (class 2606 OID 16658)
-- Name: Availability Availability_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Availability"
    ADD CONSTRAINT "Availability_pkey" PRIMARY KEY (instructor_id, date, "time");


--
-- TOC entry 4806 (class 2606 OID 16781)
-- Name: ContactPerson ContactPerson_personNumber_personNumber1_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactPerson"
    ADD CONSTRAINT "ContactPerson_personNumber_personNumber1_key" UNIQUE ("personNumber") INCLUDE ("personNumber");


--
-- TOC entry 4808 (class 2606 OID 16449)
-- Name: ContactPerson ContactPerson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ContactPerson"
    ADD CONSTRAINT "ContactPerson_pkey" PRIMARY KEY (id);


--
-- TOC entry 4830 (class 2606 OID 16527)
-- Name: EnsembleLessonPrice EnsembleLessonPrice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EnsembleLessonPrice"
    ADD CONSTRAINT "EnsembleLessonPrice_pkey" PRIMARY KEY (id);


--
-- TOC entry 4824 (class 2606 OID 16506)
-- Name: EnsembleLesson EnsembleLesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EnsembleLesson"
    ADD CONSTRAINT "EnsembleLesson_pkey" PRIMARY KEY (id);


--
-- TOC entry 4844 (class 2606 OID 16685)
-- Name: EnsemblesTaught EnsemblesTaught_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EnsemblesTaught"
    ADD CONSTRAINT "EnsemblesTaught_pkey" PRIMARY KEY (instructor_id);


--
-- TOC entry 4828 (class 2606 OID 16520)
-- Name: GroupLessonPrice GroupLessonPrice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GroupLessonPrice"
    ADD CONSTRAINT "GroupLessonPrice_pkey" PRIMARY KEY (id);


--
-- TOC entry 4826 (class 2606 OID 16513)
-- Name: GroupLesson GroupLesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GroupLesson"
    ADD CONSTRAINT "GroupLesson_pkey" PRIMARY KEY (id);


--
-- TOC entry 4832 (class 2606 OID 16534)
-- Name: IndividualLessonPrice IndividualLessonPrice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IndividualLessonPrice"
    ADD CONSTRAINT "IndividualLessonPrice_pkey" PRIMARY KEY (id);


--
-- TOC entry 4822 (class 2606 OID 16497)
-- Name: IndividualLesson IndividualLesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IndividualLesson"
    ADD CONSTRAINT "IndividualLesson_pkey" PRIMARY KEY (id);


--
-- TOC entry 4818 (class 2606 OID 16779)
-- Name: Instructor Instructor_personNumber_personNumber1_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Instructor"
    ADD CONSTRAINT "Instructor_personNumber_personNumber1_key" UNIQUE ("personNumber") INCLUDE ("personNumber");


--
-- TOC entry 4820 (class 2606 OID 16488)
-- Name: Instructor Instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Instructor"
    ADD CONSTRAINT "Instructor_pkey" PRIMARY KEY (id);


--
-- TOC entry 4838 (class 2606 OID 16638)
-- Name: InstrumentLease InstrumentLease_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InstrumentLease"
    ADD CONSTRAINT "InstrumentLease_pkey" PRIMARY KEY (student_id, instrument_id);


--
-- TOC entry 4814 (class 2606 OID 16470)
-- Name: InstrumentType InstrumentType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InstrumentType"
    ADD CONSTRAINT "InstrumentType_pkey" PRIMARY KEY (id);


--
-- TOC entry 4812 (class 2606 OID 16593)
-- Name: Instrument Instrument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Instrument"
    ADD CONSTRAINT "Instrument_pkey" PRIMARY KEY (id);


--
-- TOC entry 4842 (class 2606 OID 16670)
-- Name: InstrumentsTaught InstrumentsTaught_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InstrumentsTaught"
    ADD CONSTRAINT "InstrumentsTaught_pkey" PRIMARY KEY (instructor_id, "instrumentType_id");


--
-- TOC entry 4816 (class 2606 OID 16479)
-- Name: LeaseRules LeaseRules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LeaseRules"
    ADD CONSTRAINT "LeaseRules_pkey" PRIMARY KEY (id);


--
-- TOC entry 4836 (class 2606 OID 16623)
-- Name: Student_ContactPerson Student_ContactPerson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student_ContactPerson"
    ADD CONSTRAINT "Student_ContactPerson_pkey" PRIMARY KEY (student_id, "contactPerson_id");


--
-- TOC entry 4848 (class 2606 OID 16710)
-- Name: Student_EnsembleLesson Student_EnsembleLesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student_EnsembleLesson"
    ADD CONSTRAINT "Student_EnsembleLesson_pkey" PRIMARY KEY (student_id, "ensembleLesson_id");


--
-- TOC entry 4846 (class 2606 OID 16695)
-- Name: Student_GroupLesson Student_GroupLesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student_GroupLesson"
    ADD CONSTRAINT "Student_GroupLesson_pkey" PRIMARY KEY (student_id, "groupLesson_id");


--
-- TOC entry 4834 (class 2606 OID 16608)
-- Name: Student_Siblings Student_Siblings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student_Siblings"
    ADD CONSTRAINT "Student_Siblings_pkey" PRIMARY KEY (student1_id, student2_id);


--
-- TOC entry 4802 (class 2606 OID 16722)
-- Name: Student Student_personNumber_personNumber1_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_personNumber_personNumber1_key" UNIQUE ("personNumber") INCLUDE ("personNumber");


--
-- TOC entry 4804 (class 2606 OID 16440)
-- Name: Student Student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY (id);


--
-- TOC entry 4810 (class 2606 OID 16458)
-- Name: SiblingDiscountRules siblingDiscountRules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SiblingDiscountRules"
    ADD CONSTRAINT "siblingDiscountRules_pkey" PRIMARY KEY (id);


--
-- TOC entry 4866 (class 2606 OID 16723)
-- Name: InstrumentsTaught InstrumentsTaught_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InstrumentsTaught"
    ADD CONSTRAINT "InstrumentsTaught_instructor_id_fkey" FOREIGN KEY (instructor_id) REFERENCES public."Instructor"(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4867 (class 2606 OID 16728)
-- Name: InstrumentsTaught InstrumentsTaught_instrumentsType_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InstrumentsTaught"
    ADD CONSTRAINT "InstrumentsTaught_instrumentsType_id_fkey" FOREIGN KEY ("instrumentType_id") REFERENCES public."InstrumentType"(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4860 (class 2606 OID 16738)
-- Name: Student_ContactPerson Student_ContactPerson_contactPerson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student_ContactPerson"
    ADD CONSTRAINT "Student_ContactPerson_contactPerson_id_fkey" FOREIGN KEY ("contactPerson_id") REFERENCES public."ContactPerson"(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4861 (class 2606 OID 16733)
-- Name: Student_ContactPerson Student_ContactPerson_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student_ContactPerson"
    ADD CONSTRAINT "Student_ContactPerson_student_id_fkey" FOREIGN KEY (student_id) REFERENCES public."Student"(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4871 (class 2606 OID 16748)
-- Name: Student_EnsembleLesson Student_EnsembleLesson_ensembleLesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student_EnsembleLesson"
    ADD CONSTRAINT "Student_EnsembleLesson_ensembleLesson_id_fkey" FOREIGN KEY ("ensembleLesson_id") REFERENCES public."EnsembleLesson"(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4872 (class 2606 OID 16743)
-- Name: Student_EnsembleLesson Student_EnsembleLesson_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student_EnsembleLesson"
    ADD CONSTRAINT "Student_EnsembleLesson_student_id_fkey" FOREIGN KEY (student_id) REFERENCES public."Student"(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4869 (class 2606 OID 16758)
-- Name: Student_GroupLesson Student_GroupLesson_groupLesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student_GroupLesson"
    ADD CONSTRAINT "Student_GroupLesson_groupLesson_id_fkey" FOREIGN KEY ("groupLesson_id") REFERENCES public."GroupLesson"(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4870 (class 2606 OID 16753)
-- Name: Student_GroupLesson Student_GroupLesson_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student_GroupLesson"
    ADD CONSTRAINT "Student_GroupLesson_student_id_fkey" FOREIGN KEY (student_id) REFERENCES public."Student"(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4858 (class 2606 OID 16763)
-- Name: Student_Siblings Student_Siblings_student1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student_Siblings"
    ADD CONSTRAINT "Student_Siblings_student1_id_fkey" FOREIGN KEY (student1_id) REFERENCES public."Student"(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4859 (class 2606 OID 16773)
-- Name: Student_Siblings Student_Siblings_student2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student_Siblings"
    ADD CONSTRAINT "Student_Siblings_student2_id_fkey" FOREIGN KEY (student2_id) REFERENCES public."Student"(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4854 (class 2606 OID 16546)
-- Name: EnsembleLesson instructor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EnsembleLesson"
    ADD CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES public."Instructor"(id) NOT VALID;


--
-- TOC entry 4856 (class 2606 OID 16558)
-- Name: GroupLesson instructor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GroupLesson"
    ADD CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES public."Instructor"(id) NOT VALID;


--
-- TOC entry 4851 (class 2606 OID 16580)
-- Name: IndividualLesson instructor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IndividualLesson"
    ADD CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES public."Instructor"(id) NOT VALID;


--
-- TOC entry 4865 (class 2606 OID 16659)
-- Name: Availability instructor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Availability"
    ADD CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES public."Instructor"(id);


--
-- TOC entry 4868 (class 2606 OID 16686)
-- Name: EnsemblesTaught instructor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EnsemblesTaught"
    ADD CONSTRAINT instructor_id FOREIGN KEY (instructor_id) REFERENCES public."Instructor"(id);


--
-- TOC entry 4850 (class 2606 OID 16594)
-- Name: Instrument instrumentType_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Instrument"
    ADD CONSTRAINT "instrumentType_id" FOREIGN KEY ("instrumentType_id") REFERENCES public."InstrumentType"(id) NOT VALID;


--
-- TOC entry 4862 (class 2606 OID 16644)
-- Name: InstrumentLease instrument_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InstrumentLease"
    ADD CONSTRAINT instrument_id FOREIGN KEY (instrument_id) REFERENCES public."Instrument"(id);


--
-- TOC entry 4863 (class 2606 OID 16649)
-- Name: InstrumentLease leaseRules_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InstrumentLease"
    ADD CONSTRAINT "leaseRules_id" FOREIGN KEY ("leaseRules") REFERENCES public."LeaseRules"(id) NOT VALID;


--
-- TOC entry 4852 (class 2606 OID 16585)
-- Name: IndividualLesson price; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IndividualLesson"
    ADD CONSTRAINT price FOREIGN KEY (price_id) REFERENCES public."IndividualLessonPrice"(id) NOT VALID;


--
-- TOC entry 4855 (class 2606 OID 16551)
-- Name: EnsembleLesson price_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EnsembleLesson"
    ADD CONSTRAINT price_id FOREIGN KEY (price_id) REFERENCES public."EnsembleLessonPrice"(id) NOT VALID;


--
-- TOC entry 4857 (class 2606 OID 16568)
-- Name: GroupLesson price_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GroupLesson"
    ADD CONSTRAINT price_id FOREIGN KEY (price_id) REFERENCES public."GroupLessonPrice"(id) NOT VALID;


--
-- TOC entry 4849 (class 2606 OID 16599)
-- Name: Student siblingDiscount_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "siblingDiscount_id" FOREIGN KEY ("siblingDiscount_id") REFERENCES public."SiblingDiscountRules"(id) NOT VALID;


--
-- TOC entry 4853 (class 2606 OID 16575)
-- Name: IndividualLesson student_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IndividualLesson"
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES public."Student"(id) NOT VALID;


--
-- TOC entry 4864 (class 2606 OID 16639)
-- Name: InstrumentLease student_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InstrumentLease"
    ADD CONSTRAINT student_id FOREIGN KEY (student_id) REFERENCES public."Student"(id);


-- Completed on 2024-11-21 16:01:41

--
-- PostgreSQL database dump complete
--

