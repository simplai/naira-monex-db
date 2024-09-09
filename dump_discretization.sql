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
-- Name: admin_discretization_condition; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_discretization_condition (
    id integer NOT NULL,
    field_id integer,
    "order" integer,
    min double precision,
    max double precision,
    allowed character varying[],
    allowed_na boolean,
    final_value double precision,
    discretization_id integer
);


ALTER TABLE public.admin_discretization_condition OWNER TO admin;

--
-- Name: admin_discretization_condition_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.admin_discretization_condition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_discretization_condition_id_seq OWNER TO admin;

--
-- Name: admin_discretization_condition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.admin_discretization_condition_id_seq OWNED BY public.admin_discretization_condition.id;


--
-- Name: admin_discretization_condition id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_discretization_condition ALTER COLUMN id SET DEFAULT nextval('public.admin_discretization_condition_id_seq'::regclass);


--
-- Data for Name: admin_discretization_condition; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (78, NULL, 1, NULL, NULL, '{}', true, 0, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (79, NULL, 2, -0.15, NULL, '{}', false, 0, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (80, NULL, 3, -0.15, -0.1, '{}', false, 2, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (81, NULL, 4, -0.1, 0, '{}', false, 4, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (82, NULL, 5, 0, 0.03, '{}', false, 6, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (83, NULL, 6, 0.03, 0.07, '{}', false, 8, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (84, NULL, 7, NULL, 0.07, '{}', false, 10, 13);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (85, NULL, 1, NULL, NULL, '{}', true, 8, 14);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (86, NULL, 2, -0.1, NULL, '{}', false, 0, 14);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (87, NULL, 3, -0.1, -0.02, '{}', false, 2, 14);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (88, NULL, 4, -0.02, 0.01, '{}', false, 4, 14);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (89, NULL, 5, 0.01, 0.05, '{}', false, 6, 14);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (90, NULL, 6, 0.05, 0.07, '{}', false, 8, 14);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (91, NULL, 7, NULL, 0.07, '{}', false, 10, 14);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (92, NULL, 1, NULL, NULL, '{}', true, 8, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (93, NULL, 2, -0.1, NULL, '{}', false, 0, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (94, NULL, 3, -0.1, 0, '{}', false, 2, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (95, NULL, 4, 0, 0.01, '{}', false, 4, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (22, NULL, 1, NULL, NULL, '{1}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (23, NULL, 2, NULL, NULL, '{2}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (24, NULL, 3, NULL, NULL, '{3}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (25, NULL, 4, NULL, NULL, '{4}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (26, NULL, 5, NULL, NULL, '{5}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (27, NULL, 6, NULL, NULL, '{6}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (96, NULL, 5, 0.01, 0.05, '{}', false, 6, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (97, NULL, 6, 0.05, 0.07, '{}', false, 8, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (98, NULL, 7, NULL, 0.07, '{}', false, 10, 15);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (99, NULL, 1, NULL, NULL, '{}', true, 8, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (100, NULL, 2, 1.5, NULL, '{}', false, 10, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (101, NULL, 3, 1.5, 2, '{}', false, 8, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (102, NULL, 4, 2, 2.5, '{}', false, 6, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (103, NULL, 5, 2.5, 3, '{}', false, 4, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (104, NULL, 6, 3, 4, '{}', false, 2, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (34, NULL, 1, NULL, 0.5, '{}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (46, NULL, 1, NULL, NULL, '{"MOP 1"}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (47, NULL, 2, NULL, NULL, '{"MOP 2"}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (69, NULL, 1, NULL, NULL, '{"No presenta clave"}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (70, NULL, 2, NULL, NULL, '{1}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (40, NULL, 1, NULL, 0.5, '{}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (41, NULL, 2, NULL, NULL, '{0.5}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (42, NULL, 3, 0.5, 0.8, '{}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (44, NULL, 5, 1, 1.5, '{}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (55, NULL, 1, NULL, 0.01, '{}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (56, NULL, 2, NULL, NULL, '{0.01}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (57, NULL, 3, 0.01, 0.02, '{}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (2, NULL, 2, 0.5, 1, '{}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (3, NULL, 3, 1, 2, '{}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (4, NULL, 4, 2, 2.5, '{}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (5, NULL, 5, 2.5, 3, '{}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (74, NULL, 1, 2, 3, '{}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (75, NULL, 2, 3, 5, '{}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (76, NULL, 3, 5, 10, '{}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (77, NULL, 4, 10, NULL, '{}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (35, NULL, 2, NULL, NULL, '{0.5}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (36, NULL, 3, 0.5, 1, '{}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (37, NULL, 4, 1, 2, '{}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (38, NULL, 5, 2, 3, '{}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (39, NULL, 6, 3, NULL, '{}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (48, NULL, 3, NULL, NULL, '{"Sin información"}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (49, NULL, 4, NULL, NULL, '{"MOP 3","Mayor o igual a MOP 4"}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (62, NULL, 1, NULL, 0.6, '{}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (63, NULL, 2, NULL, NULL, '{0.6}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (64, NULL, 3, 0.6, 1, '{}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (65, NULL, 4, 1, 1.5, '{}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (66, NULL, 5, 1.5, 2, '{}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (67, NULL, 6, NULL, NULL, '{2}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (68, NULL, 7, 2, NULL, '{}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (58, NULL, 4, 0.02, 0.03, '{}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (59, NULL, 5, 0.03, 0.04, '{}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (71, NULL, 3, NULL, NULL, '{2}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (72, NULL, 4, NULL, NULL, '{3}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (73, NULL, 5, NULL, NULL, '{"Sin historial"}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (50, NULL, 1, NULL, NULL, '{"MOP 1"}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (51, NULL, 2, NULL, NULL, '{"MOP 2"}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (52, NULL, 3, NULL, NULL, '{"MOP 3"}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (53, NULL, 4, NULL, NULL, '{"Sin información"}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (54, NULL, 5, NULL, NULL, '{"Mayor o igual a MOP 4"}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (28, NULL, 1, NULL, NULL, '{1}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (29, NULL, 2, NULL, NULL, '{2}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (30, NULL, 3, NULL, NULL, '{3,8}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (31, NULL, 4, NULL, NULL, '{4}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (32, NULL, 5, NULL, NULL, '{5}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (33, NULL, 6, NULL, NULL, '{6,7}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (105, NULL, 7, NULL, 4, '{}', false, 0, 16);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (106, NULL, 1, NULL, NULL, '{}', true, 8, 17);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (107, NULL, 2, 1, NULL, '{}', false, 0, 17);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (108, NULL, 3, 1, 1.5, '{}', false, 2, 17);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (109, NULL, 4, 1.5, 2.5, '{}', false, 4, 17);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (110, NULL, 5, 2.5, 4, '{}', false, 6, 17);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (111, NULL, 6, 4, 7, '{}', false, 8, 17);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (112, NULL, 7, NULL, 7, '{}', false, 10, 17);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (113, NULL, 1, NULL, NULL, '{}', true, 8, 18);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (114, NULL, 2, 0.06, NULL, '{}', false, 0, 18);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (115, NULL, 3, 0.06, 0.09, '{}', false, 2, 18);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (116, NULL, 4, 0.09, 0.13, '{}', false, 4, 18);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (117, NULL, 5, 0.13, 0.23, '{}', false, 6, 18);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (118, NULL, 6, 0.23, 0.35, '{}', false, 8, 18);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (119, NULL, 7, 0.35, NULL, '{}', false, 10, 18);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (120, NULL, 1, NULL, NULL, '{}', true, 8, 19);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (121, NULL, 2, 0.5, NULL, '{}', false, 0, 19);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (122, NULL, 3, 0.5, 0.8, '{}', false, 2, 19);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (123, NULL, 4, 0.8, 1, '{}', false, 4, 19);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (124, NULL, 5, 0.8, 1, '{}', false, 6, 19);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (125, NULL, 6, 1, 2, '{}', false, 8, 19);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (126, NULL, 7, 2, 3, '{}', false, 10, 19);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (127, NULL, 1, NULL, NULL, '{}', true, 8, 20);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (128, NULL, 2, 60, NULL, '{}', false, 10, 20);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (129, NULL, 3, 60, 90, '{}', false, 8, 20);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (130, NULL, 4, 90, 120, '{}', false, 6, 20);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (131, NULL, 5, 120, 150, '{}', false, 4, 20);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (132, NULL, 6, 150, 180, '{}', false, 2, 20);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (133, NULL, 7, NULL, 180, '{}', false, 0, 20);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (134, NULL, 1, NULL, NULL, '{}', true, 8, 21);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (135, NULL, 2, 0.02, NULL, '{}', false, 0, 21);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (136, NULL, 3, 0.02, 0.07, '{}', false, 2, 21);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (137, NULL, 4, 0.07, 0.25, '{}', false, 4, 21);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (138, NULL, 5, 0.25, 0.5, '{}', false, 6, 21);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (139, NULL, 6, 0.5, 0.75, '{}', false, 8, 21);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (140, NULL, 7, NULL, 0.75, '{}', false, 10, 21);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (141, NULL, 1, NULL, NULL, '{"Sin información"}', true, 0, 22);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (142, NULL, 2, 2, NULL, '{}', false, 0, 22);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (143, NULL, 3, 2, 3, '{}', false, 4, 22);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (144, NULL, 4, 3, 5, '{}', false, 6, 22);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (145, NULL, 5, 5, 10, '{}', false, 8, 22);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (146, NULL, 6, NULL, 10, '{}', false, 10, 22);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (147, NULL, 1, NULL, NULL, '{6,8,7}', true, 0, 23);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (148, NULL, 2, NULL, NULL, '{5}', false, 2, 23);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (149, NULL, 3, NULL, NULL, '{4}', false, 4, 23);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (150, NULL, 4, NULL, NULL, '{3}', false, 6, 23);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (151, NULL, 5, NULL, NULL, '{2}', false, 8, 23);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (152, NULL, 6, NULL, NULL, '{1}', false, 10, 23);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (153, NULL, 1, NULL, NULL, '{6}', true, 0, 24);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (154, NULL, 2, NULL, NULL, '{5}', false, 2, 24);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (155, NULL, 3, NULL, NULL, '{4}', false, 4, 24);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (156, NULL, 4, NULL, NULL, '{3}', false, 6, 24);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (157, NULL, 5, NULL, NULL, '{2}', false, 8, 24);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (158, NULL, 6, NULL, NULL, '{1}', false, 10, 24);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (159, NULL, 1, NULL, NULL, '{6}', false, 0, 25);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (160, NULL, 2, NULL, NULL, '{5}', false, 2, 25);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (161, NULL, 3, NULL, NULL, '{4}', false, 4, 25);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (162, NULL, 4, NULL, NULL, '{3,7,5}', false, 6, 25);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (163, NULL, 5, NULL, NULL, '{2}', false, 8, 25);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (164, NULL, 6, NULL, NULL, '{1}', false, 10, 25);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (165, NULL, 1, NULL, NULL, '{"Sin información"}', true, 6, 26);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (166, NULL, 2, NULL, NULL, '{0}', false, 10, 26);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (167, NULL, 3, NULL, NULL, '{1}', false, 8, 26);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (168, NULL, 4, NULL, NULL, '{2}', false, 6, 26);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (169, NULL, 5, NULL, NULL, '{3}', false, 4, 26);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (170, NULL, 6, NULL, NULL, '{4}', false, 2, 26);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (171, NULL, 6, NULL, 4, '{}', false, 2, 26);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (172, NULL, 1, NULL, NULL, '{"Sin información"}', true, 0, 27);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (173, NULL, 2, NULL, NULL, '{0}', false, 10, 27);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (174, NULL, 3, 1, 7, '{}', false, 8, 27);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (175, NULL, 4, 7, 25, '{}', false, 6, 27);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (176, NULL, 5, 25, 36, '{}', false, 4, 27);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (177, NULL, 6, NULL, NULL, '{36}', false, 2, 27);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (178, NULL, 7, NULL, 36, '{}', false, 2, 27);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (14, NULL, 1, NULL, NULL, '{1}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (15, NULL, 2, NULL, NULL, '{2}', false, 8, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (16, NULL, 3, NULL, NULL, '{3}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (17, NULL, 4, NULL, NULL, '{4}', false, 4, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (18, NULL, 5, NULL, NULL, '{5}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (19, NULL, 6, NULL, NULL, '{6}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (20, NULL, 7, NULL, NULL, '{7}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (21, NULL, 8, NULL, NULL, '{8}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (60, NULL, 6, 0.04, 0.05, '{}', false, 2, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (1, NULL, 1, NULL, 0.5, '{}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (6, NULL, 6, 3, NULL, '{}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (61, NULL, 7, 0.05, NULL, '{}', false, 0, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (43, NULL, 4, 0.8, 1, '{}', false, 6, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (45, NULL, 6, 1.5, NULL, '{}', false, 10, NULL);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (185, NULL, 1, NULL, NULL, '{"Pago siempre puntual"}', false, 10, 29);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (186, NULL, 2, NULL, NULL, '{"Un atraso poco relevante"}', false, 8, 29);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (187, NULL, 3, NULL, NULL, '{"Un atraso relevante"}', false, 4, 29);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (188, NULL, 4, NULL, NULL, '{"Más de un atraso relevante"}', false, 2, 29);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (189, NULL, 5, NULL, NULL, '{"Cliente nuevo / Sin información"}', false, 8, 29);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (195, NULL, 1, NULL, 0.6, '{}', false, 10, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (196, NULL, 2, NULL, NULL, '{0.6}', false, 10, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (197, NULL, 3, 0.6, 1, '{}', false, 8, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (198, NULL, 4, 1, 1.5, '{}', false, 6, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (199, NULL, 5, 1.5, 2, '{}', false, 4, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (200, NULL, 6, NULL, NULL, '{2}', false, 2, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (201, NULL, 7, 2, NULL, '{}', false, 0, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (202, NULL, 8, NULL, NULL, '{}', true, 0, 31);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (203, NULL, 1, NULL, NULL, '{0}', false, 10, 32);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (206, NULL, 4, NULL, NULL, '{3}', false, -15, 32);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (216, NULL, 5, NULL, NULL, '{}', true, 6, 32);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (204, NULL, 2, NULL, NULL, '{1}', false, 10, 32);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (205, NULL, 3, NULL, NULL, '{2}', false, 2, 32);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (179, NULL, 1, NULL, 2, '{}', false, 10, 28);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (180, NULL, 2, 2, 3, '{}', false, 8, 28);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (181, NULL, 3, 3, 4, '{}', false, 6, 28);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (182, NULL, 4, 4, 5, '{}', false, 4, 28);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (183, NULL, 5, 5, 6, '{}', false, -3, 28);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (184, NULL, 6, 6, 7, '{}', false, -4, 28);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (217, NULL, 7, 7, NULL, '{}', false, -23, 28);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (215, NULL, 5, NULL, NULL, '{-1}', false, -23, 30);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (218, NULL, 1, NULL, 3, '{}', false, -23, 30);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (219, NULL, 2, 3, 5, '{}', false, -10, 30);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (220, NULL, 3, 5, 7, '{}', false, 7, 30);
INSERT INTO public.admin_discretization_condition (id, field_id, "order", min, max, allowed, allowed_na, final_value, discretization_id) VALUES (221, NULL, 4, 7, NULL, '{}', false, 10, 30);


--
-- Name: admin_discretization_condition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.admin_discretization_condition_id_seq', 221, true);


--
-- Name: admin_discretization_condition admin_discretization_condition_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_discretization_condition
    ADD CONSTRAINT admin_discretization_condition_pkey PRIMARY KEY (id);


--
-- Name: admin_discretization_condition admin_discretization_condition_discretization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_discretization_condition
    ADD CONSTRAINT admin_discretization_condition_discretization_id_fkey FOREIGN KEY (discretization_id) REFERENCES public.admin_discretization(id);


--
-- Name: admin_discretization_condition admin_discretization_condition_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_discretization_condition
    ADD CONSTRAINT admin_discretization_condition_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.admin_field(id);


--
-- PostgreSQL database dump complete
--

