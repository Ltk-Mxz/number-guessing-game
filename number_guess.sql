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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.users (user_id, username, games_played, best_game) FROM stdin;
2	user_1746403889589	2	347
75	user_1746406911204	2	141
1	user_1746403889590	5	125
20	user_1746404400766	2	542
4	user_1746403924409	2	160
19	user_1746404400767	5	197
3	user_1746403924410	5	103
36	user_1746405205247	2	337
6	user_1746403960303	2	553
85	user_1746407158357	2	44
22	user_1746404432979	2	327
5	user_1746403960304	5	320
35	user_1746405205248	5	121
21	user_1746404432980	5	6
8	user_1746404028959	2	22
55	user_1746405819216	2	349
7	user_1746404028960	5	114
74	user_1746406911205	5	298
11	user_1746404101655	2	781
24	user_1746404476478	2	522
38	user_1746405212488	2	25
10	user_1746404101656	5	235
54	user_1746405819217	5	68
23	user_1746404476479	5	25
13	user_1746404125750	2	606
37	user_1746405212489	5	112
12	user_1746404125751	5	184
26	user_1746404570150	2	558
15	user_1746404206069	2	509
14	user_1746404206070	5	317
16	Mxz	1	15
25	user_1746404570151	5	51
18	user_1746404324883	2	492
17	user_1746404324884	5	63
40	user_1746405285506	2	264
28	user_1746404572027	2	50
57	user_1746405885434	2	577
27	user_1746404572028	5	319
9	Ltk	2	11
39	user_1746405285507	5	404
84	user_1746407158358	5	25
30	user_1746404842714	2	253
77	user_1746406919349	2	190
29	user_1746404842715	5	114
56	user_1746405885435	5	192
42	user_1746405297081	2	62
32	user_1746405027872	2	51
41	user_1746405297082	5	252
31	user_1746405027873	5	101
34	user_1746405127925	2	691
76	user_1746406919350	5	474
33	user_1746405127926	5	55
44	user_1746405308453	2	203
59	user_1746405922566	2	733
43	user_1746405308454	5	347
58	user_1746405922567	5	556
46	user_1746405348060	2	313
45	user_1746405348061	5	340
61	user_1746405936369	2	338
48	user_1746405436406	2	74
79	user_1746406921175	2	581
87	user_1746407208004	2	214
47	user_1746405436407	5	90
60	user_1746405936370	5	166
78	user_1746406921176	5	31
51	user_1746405554085	2	73
50	user_1746405554086	5	271
49	LOTOKO	2	10
63	user_1746405983736	2	257
86	user_1746407208005	5	206
53	user_1746405714616	2	550
62	user_1746405983737	5	281
64	user_1746406289345	0	\N
52	user_1746405714617	5	43
65	user_1746406289344	0	\N
66	user_1746406309582	0	\N
67	user_1746406309581	0	\N
68	user_1746406319184	0	\N
69	user_1746406319183	0	\N
70	user_1746406319970	0	\N
71	user_1746406319969	0	\N
81	user_1746407040918	2	559
73	user_1746406825103	2	407
72	user_1746406825104	5	35
80	user_1746407040919	5	30
83	user_1746407107265	2	168
82	user_1746407107266	5	98
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 87, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

