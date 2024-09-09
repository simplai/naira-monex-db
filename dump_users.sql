--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    "user" character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    active boolean NOT NULL,
    authenticated boolean,
    last_action timestamp without time zone
);


ALTER TABLE public.users OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.users (id, name, "user", email, password, active, authenticated, last_action) VALUES (2, 'gestor', 'gestor', 'gestor@naira.com', 'gestor', true, false, NULL);
INSERT INTO public.users (id, name, "user", email, password, active, authenticated, last_action) VALUES (1, 'admin', 'admin', 'admin@naira.com', '$2b$12$jWzdOyahOEftUcbZrsCP4./pb2i8yNWjXQhFKPaGncrKLgHEz74X6', true, false, NULL);
INSERT INTO public.users (id, name, "user", email, password, active, authenticated, last_action) VALUES (3, 'test_naira', 'test_naira', 'test_naira', '$2b$12$6vGe0I9YeqxVyT9Qoywc.OqKRsNl/s7F6r.43zaJDlWDHcn2j9HxS', true, false, NULL);
INSERT INTO public.users (id, name, "user", email, password, active, authenticated, last_action) VALUES (5, 'Luis Manuel Hernández', 'lmhernandezv@monex.com.mx', 'lmhernandezv@monex.com.mx', '$2b$12$iQF9x6O4Kf6Nx1rBtNxCvO2HF1tao0DWfmAjVox8/uxZIf.bnvfDO', true, false, NULL);
INSERT INTO public.users (id, name, "user", email, password, active, authenticated, last_action) VALUES (6, 'Magdalena Arriola', 'marriolap1@monex.com.mx', 'marriolap1@monex.com.mx', '$2b$12$7cZcCyxZG.NHqJ75CZQYQeMcFRCptrEHO0ToZVudzIzjOEmKCJbS.', true, false, NULL);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

