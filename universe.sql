--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(36),
    ok_rel_big integer NOT NULL,
    planet_types integer NOT NULL,
    distance_from_earth numeric(5,2),
    description text,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(36),
    ok_rel_big integer NOT NULL,
    planet_types integer NOT NULL,
    distance_from_earth numeric(5,2),
    description text,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: one_more_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.one_more_table (
    one_more_table_id integer NOT NULL,
    name character varying(36),
    random_rel integer NOT NULL,
    planet_types integer NOT NULL,
    distance_from_earth numeric(5,2),
    description text,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.one_more_table OWNER TO freecodecamp;

--
-- Name: one_more_table_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.one_more_table_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.one_more_table_customer_id_seq OWNER TO freecodecamp;

--
-- Name: one_more_table_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.one_more_table_customer_id_seq OWNED BY public.one_more_table.one_more_table_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(36),
    ok_rel_big integer NOT NULL,
    planet_types integer NOT NULL,
    distance_from_earth numeric(5,2),
    description text,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(36),
    ok_rel_big integer NOT NULL,
    planet_types integer NOT NULL,
    distance_from_earth numeric(5,2),
    description text,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: one_more_table one_more_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.one_more_table ALTER COLUMN one_more_table_id SET DEFAULT nextval('public.one_more_table_customer_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, NULL, 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, NULL, 2, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, NULL, 3, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, NULL, 4, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, NULL, 5, 6, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, NULL, 6, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, NULL, 7, 8, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (8, NULL, 8, 9, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (9, NULL, 9, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (10, NULL, 10, 11, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (11, NULL, 11, 12, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (12, NULL, 12, 13, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (13, NULL, 13, 14, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (14, NULL, 15, 16, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (15, NULL, 16, 17, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (16, NULL, 17, 18, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (17, NULL, 18, 19, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (18, NULL, 20, 21, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (19, NULL, 21, 22, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (20, NULL, 22, 23, NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, NULL, 2, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, NULL, 3, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, NULL, 4, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, NULL, 5, 6, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, NULL, 6, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, NULL, 7, 8, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, NULL, 8, 9, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, NULL, 9, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, NULL, 10, 11, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, NULL, 11, 12, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, NULL, 12, 13, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, NULL, 13, 14, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, NULL, 15, 16, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, NULL, 16, 17, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, NULL, 17, 18, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, NULL, 18, 19, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, NULL, 20, 21, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, NULL, 21, 22, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, NULL, 22, 23, NULL, NULL, NULL, NULL);


--
-- Data for Name: one_more_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.one_more_table VALUES (1, NULL, 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.one_more_table VALUES (2, NULL, 2, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.one_more_table VALUES (3, NULL, 3, 4, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (14, NULL, 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (15, NULL, 2, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (16, NULL, 3, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (17, NULL, 4, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (18, NULL, 5, 6, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (19, NULL, 6, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (20, NULL, 7, 8, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (21, NULL, 8, 9, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (22, NULL, 9, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (23, NULL, 10, 11, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (24, NULL, 11, 12, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (25, NULL, 12, 13, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (26, NULL, 13, 14, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (27, NULL, 15, 16, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (28, NULL, 16, 17, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (29, NULL, 17, 18, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (30, NULL, 18, 19, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (31, NULL, 20, 21, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (32, NULL, 21, 22, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (33, NULL, 22, 23, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, NULL, 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (2, NULL, 2, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (3, NULL, 3, 4, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (4, NULL, 4, 5, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (5, NULL, 5, 6, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, NULL, 6, 7, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (7, NULL, 7, 8, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (14, NULL, 8, 9, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (15, NULL, 9, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (16, NULL, 10, 11, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (17, NULL, 11, 12, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (18, NULL, 12, 13, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (19, NULL, 13, 14, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (20, NULL, 15, 16, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (21, NULL, 16, 17, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (22, NULL, 17, 18, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (23, NULL, 18, 19, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (24, NULL, 20, 21, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (25, NULL, 21, 22, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (26, NULL, 22, 23, NULL, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: one_more_table_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.one_more_table_customer_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 33, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 26, true);


--
-- Name: galaxy galaxy_ok_rel_big_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_ok_rel_big_key UNIQUE (ok_rel_big);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_ok_rel_big_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_ok_rel_big_key UNIQUE (ok_rel_big);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: one_more_table one_more_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.one_more_table
    ADD CONSTRAINT one_more_table_pkey PRIMARY KEY (one_more_table_id);


--
-- Name: one_more_table one_more_table_random_rel_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.one_more_table
    ADD CONSTRAINT one_more_table_random_rel_key UNIQUE (random_rel);


--
-- Name: planet planet_ok_rel_big_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_ok_rel_big_key UNIQUE (ok_rel_big);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_ok_rel_big_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_ok_rel_big_key UNIQUE (ok_rel_big);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_ok_rel_big_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_ok_rel_big_fkey FOREIGN KEY (ok_rel_big) REFERENCES public.planet(ok_rel_big);


--
-- Name: planet planet_ok_rel_big_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_ok_rel_big_fkey FOREIGN KEY (ok_rel_big) REFERENCES public.star(ok_rel_big);


--
-- Name: star star_ok_rel_big_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_ok_rel_big_fkey FOREIGN KEY (ok_rel_big) REFERENCES public.galaxy(ok_rel_big);


--
-- PostgreSQL database dump complete
--

