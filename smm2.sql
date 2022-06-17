--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

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

--
-- Name: wmb; Type: SCHEMA; Schema: -; Owner: smm2
--

CREATE SCHEMA wmb;


ALTER SCHEMA wmb OWNER TO smm2;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: fnb_category; Type: TABLE; Schema: wmb; Owner: smm2
--

CREATE TABLE wmb.fnb_category (
    menu_category_id bigint NOT NULL,
    fn_b_id bigint NOT NULL
);


ALTER TABLE wmb.fnb_category OWNER TO smm2;

--
-- Name: m_customer; Type: TABLE; Schema: wmb; Owner: smm2
--

CREATE TABLE wmb.m_customer (
    customer_id bigint NOT NULL,
    mobile_phone_no character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    active_member boolean DEFAULT false,
    join_date timestamp with time zone,
    user_credential_id bigint
);


ALTER TABLE wmb.m_customer OWNER TO smm2;

--
-- Name: m_customer_customer_id_seq; Type: SEQUENCE; Schema: wmb; Owner: smm2
--

CREATE SEQUENCE wmb.m_customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wmb.m_customer_customer_id_seq OWNER TO smm2;

--
-- Name: m_customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: wmb; Owner: smm2
--

ALTER SEQUENCE wmb.m_customer_customer_id_seq OWNED BY wmb.m_customer.customer_id;


--
-- Name: m_customer_privileges; Type: TABLE; Schema: wmb; Owner: smm2
--

CREATE TABLE wmb.m_customer_privileges (
    id bigint NOT NULL,
    customer_id bigint,
    discount_pct numeric DEFAULT 0.000000
);


ALTER TABLE wmb.m_customer_privileges OWNER TO smm2;

--
-- Name: m_customer_privileges_id_seq; Type: SEQUENCE; Schema: wmb; Owner: smm2
--

CREATE SEQUENCE wmb.m_customer_privileges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wmb.m_customer_privileges_id_seq OWNER TO smm2;

--
-- Name: m_customer_privileges_id_seq; Type: SEQUENCE OWNED BY; Schema: wmb; Owner: smm2
--

ALTER SEQUENCE wmb.m_customer_privileges_id_seq OWNED BY wmb.m_customer_privileges.id;


--
-- Name: m_fnb; Type: TABLE; Schema: wmb; Owner: smm2
--

CREATE TABLE wmb.m_fnb (
    id bigint NOT NULL,
    menu_name text,
    price numeric
);


ALTER TABLE wmb.m_fnb OWNER TO smm2;

--
-- Name: m_fnb_category; Type: TABLE; Schema: wmb; Owner: smm2
--

CREATE TABLE wmb.m_fnb_category (
    fn_b_id bigint NOT NULL,
    menu_category_id bigint NOT NULL
);


ALTER TABLE wmb.m_fnb_category OWNER TO smm2;

--
-- Name: m_fnb_id_seq; Type: SEQUENCE; Schema: wmb; Owner: smm2
--

CREATE SEQUENCE wmb.m_fnb_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wmb.m_fnb_id_seq OWNER TO smm2;

--
-- Name: m_fnb_id_seq; Type: SEQUENCE OWNED BY; Schema: wmb; Owner: smm2
--

ALTER SEQUENCE wmb.m_fnb_id_seq OWNED BY wmb.m_fnb.id;


--
-- Name: m_menu_category; Type: TABLE; Schema: wmb; Owner: smm2
--

CREATE TABLE wmb.m_menu_category (
    id bigint NOT NULL,
    category_name text
);


ALTER TABLE wmb.m_menu_category OWNER TO smm2;

--
-- Name: m_menu_category_id_seq; Type: SEQUENCE; Schema: wmb; Owner: smm2
--

CREATE SEQUENCE wmb.m_menu_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wmb.m_menu_category_id_seq OWNER TO smm2;

--
-- Name: m_menu_category_id_seq; Type: SEQUENCE OWNED BY; Schema: wmb; Owner: smm2
--

ALTER SEQUENCE wmb.m_menu_category_id_seq OWNED BY wmb.m_menu_category.id;


--
-- Name: t_pos_bill; Type: TABLE; Schema: wmb; Owner: smm2
--

CREATE TABLE wmb.t_pos_bill (
    id character varying(36) NOT NULL,
    table_no text,
    trans_date timestamp with time zone
);


ALTER TABLE wmb.t_pos_bill OWNER TO smm2;

--
-- Name: t_pos_bill_detail; Type: TABLE; Schema: wmb; Owner: smm2
--

CREATE TABLE wmb.t_pos_bill_detail (
    id character varying(36) NOT NULL,
    bill_id character varying(36),
    menu_name text,
    qty bigint
);


ALTER TABLE wmb.t_pos_bill_detail OWNER TO smm2;

--
-- Name: user_credentials; Type: TABLE; Schema: wmb; Owner: smm2
--

CREATE TABLE wmb.user_credentials (
    id bigint NOT NULL,
    user_name character varying(50) NOT NULL,
    user_password character varying(10) NOT NULL,
    is_blocked boolean DEFAULT true
);


ALTER TABLE wmb.user_credentials OWNER TO smm2;

--
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: wmb; Owner: smm2
--

CREATE SEQUENCE wmb.user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wmb.user_credentials_id_seq OWNER TO smm2;

--
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: wmb; Owner: smm2
--

ALTER SEQUENCE wmb.user_credentials_id_seq OWNED BY wmb.user_credentials.id;


--
-- Name: m_customer customer_id; Type: DEFAULT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.m_customer ALTER COLUMN customer_id SET DEFAULT nextval('wmb.m_customer_customer_id_seq'::regclass);


--
-- Name: m_customer_privileges id; Type: DEFAULT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.m_customer_privileges ALTER COLUMN id SET DEFAULT nextval('wmb.m_customer_privileges_id_seq'::regclass);


--
-- Name: m_fnb id; Type: DEFAULT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.m_fnb ALTER COLUMN id SET DEFAULT nextval('wmb.m_fnb_id_seq'::regclass);


--
-- Name: m_menu_category id; Type: DEFAULT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.m_menu_category ALTER COLUMN id SET DEFAULT nextval('wmb.m_menu_category_id_seq'::regclass);


--
-- Name: user_credentials id; Type: DEFAULT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.user_credentials ALTER COLUMN id SET DEFAULT nextval('wmb.user_credentials_id_seq'::regclass);


--
-- Data for Name: fnb_category; Type: TABLE DATA; Schema: wmb; Owner: smm2
--

COPY wmb.fnb_category (menu_category_id, fn_b_id) FROM stdin;
\.


--
-- Data for Name: m_customer; Type: TABLE DATA; Schema: wmb; Owner: smm2
--

COPY wmb.m_customer (customer_id, mobile_phone_no, name, active_member, join_date, user_credential_id) FROM stdin;
5	08788123125	Doni	f	\N	\N
6	08788123126	Fadli	f	\N	\N
7	08788123127	Rifqi	f	\N	\N
8	08788123128	Kenzi	t	2022-06-15 07:17:58.492337+00	\N
9	08129080112	Joe	f	0001-01-01 00:00:00+00	\N
10	08129080113	Samuel	f	0001-01-01 00:00:00+00	\N
11	0856000111	Dika	f	0001-01-01 00:00:00+00	1
4	08788123124	Tika	t	2022-06-01 07:18:17.474949+00	8
3	08788123123	Jution	f	0001-01-01 00:00:00+00	5
30	0856000112	Agus	f	0001-01-01 00:00:00+00	25
31	0856000113	Mamang	f	0001-01-01 00:00:00+00	26
32	08777112113	Joni	f	\N	\N
\.


--
-- Data for Name: m_customer_privileges; Type: TABLE DATA; Schema: wmb; Owner: smm2
--

COPY wmb.m_customer_privileges (id, customer_id, discount_pct) FROM stdin;
3	30	0
4	31	10
\.


--
-- Data for Name: m_fnb; Type: TABLE DATA; Schema: wmb; Owner: smm2
--

COPY wmb.m_fnb (id, menu_name, price) FROM stdin;
1	Nasi Goreng	0
\.


--
-- Data for Name: m_fnb_category; Type: TABLE DATA; Schema: wmb; Owner: smm2
--

COPY wmb.m_fnb_category (fn_b_id, menu_category_id) FROM stdin;
\.


--
-- Data for Name: m_menu_category; Type: TABLE DATA; Schema: wmb; Owner: smm2
--

COPY wmb.m_menu_category (id, category_name) FROM stdin;
1	Food
2	Beverage
3	Main Course
4	Dessert
5	Appetizer
6	Breakfast
7	Lunch
8	Dinner
9	Side Dish
10	Coffee & Tea
11	Juice
12	Fish Dish
13	Local Taste
14	American
15	Oriental Dish
16	All Day Menu
\.


--
-- Data for Name: t_pos_bill; Type: TABLE DATA; Schema: wmb; Owner: smm2
--

COPY wmb.t_pos_bill (id, table_no, trans_date) FROM stdin;
4e5f726a-fda3-4845-bd2e-46f4e7c2fc68	1	2022-06-16 09:00:05.583054+00
\.


--
-- Data for Name: t_pos_bill_detail; Type: TABLE DATA; Schema: wmb; Owner: smm2
--

COPY wmb.t_pos_bill_detail (id, bill_id, menu_name, qty) FROM stdin;
d515a0a1-3cb9-45c7-a05a-f71af7c705ec	4e5f726a-fda3-4845-bd2e-46f4e7c2fc68	Nasi Goreng	1
\.


--
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: wmb; Owner: smm2
--

COPY wmb.user_credentials (id, user_name, user_password, is_blocked) FROM stdin;
1	dika123	111222	t
8	tikayes	888Abc	t
5	jutionxxx	AbCdEf	t
25	agus000	aGu5	t
26	M4M4n6	racing	t
\.


--
-- Name: m_customer_customer_id_seq; Type: SEQUENCE SET; Schema: wmb; Owner: smm2
--

SELECT pg_catalog.setval('wmb.m_customer_customer_id_seq', 37, true);


--
-- Name: m_customer_privileges_id_seq; Type: SEQUENCE SET; Schema: wmb; Owner: smm2
--

SELECT pg_catalog.setval('wmb.m_customer_privileges_id_seq', 4, true);


--
-- Name: m_fnb_id_seq; Type: SEQUENCE SET; Schema: wmb; Owner: smm2
--

SELECT pg_catalog.setval('wmb.m_fnb_id_seq', 1, true);


--
-- Name: m_menu_category_id_seq; Type: SEQUENCE SET; Schema: wmb; Owner: smm2
--

SELECT pg_catalog.setval('wmb.m_menu_category_id_seq', 16, true);


--
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: wmb; Owner: smm2
--

SELECT pg_catalog.setval('wmb.user_credentials_id_seq', 26, true);


--
-- Name: fnb_category fnb_category_pkey; Type: CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.fnb_category
    ADD CONSTRAINT fnb_category_pkey PRIMARY KEY (menu_category_id, fn_b_id);


--
-- Name: m_customer m_customer_mobile_phone_no_key; Type: CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.m_customer
    ADD CONSTRAINT m_customer_mobile_phone_no_key UNIQUE (mobile_phone_no);


--
-- Name: m_customer m_customer_pkey; Type: CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.m_customer
    ADD CONSTRAINT m_customer_pkey PRIMARY KEY (customer_id);


--
-- Name: m_customer_privileges m_customer_privileges_pkey; Type: CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.m_customer_privileges
    ADD CONSTRAINT m_customer_privileges_pkey PRIMARY KEY (id);


--
-- Name: m_fnb_category m_fnb_category_pkey; Type: CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.m_fnb_category
    ADD CONSTRAINT m_fnb_category_pkey PRIMARY KEY (fn_b_id, menu_category_id);


--
-- Name: m_fnb m_fnb_pkey; Type: CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.m_fnb
    ADD CONSTRAINT m_fnb_pkey PRIMARY KEY (id);


--
-- Name: m_menu_category m_menu_category_pkey; Type: CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.m_menu_category
    ADD CONSTRAINT m_menu_category_pkey PRIMARY KEY (id);


--
-- Name: t_pos_bill_detail t_pos_bill_detail_pkey; Type: CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.t_pos_bill_detail
    ADD CONSTRAINT t_pos_bill_detail_pkey PRIMARY KEY (id);


--
-- Name: t_pos_bill t_pos_bill_pkey; Type: CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.t_pos_bill
    ADD CONSTRAINT t_pos_bill_pkey PRIMARY KEY (id);


--
-- Name: user_credentials user_credentials_pkey; Type: CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.user_credentials
    ADD CONSTRAINT user_credentials_pkey PRIMARY KEY (id);


--
-- Name: user_credentials user_credentials_user_name_key; Type: CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.user_credentials
    ADD CONSTRAINT user_credentials_user_name_key UNIQUE (user_name);


--
-- Name: fnb_category fk_wmb_fnb_category_fn_b; Type: FK CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.fnb_category
    ADD CONSTRAINT fk_wmb_fnb_category_fn_b FOREIGN KEY (fn_b_id) REFERENCES wmb.m_fnb(id);


--
-- Name: fnb_category fk_wmb_fnb_category_menu_category; Type: FK CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.fnb_category
    ADD CONSTRAINT fk_wmb_fnb_category_menu_category FOREIGN KEY (menu_category_id) REFERENCES wmb.m_menu_category(id);


--
-- Name: m_customer_privileges fk_wmb_m_customer_customer_privileges; Type: FK CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.m_customer_privileges
    ADD CONSTRAINT fk_wmb_m_customer_customer_privileges FOREIGN KEY (customer_id) REFERENCES wmb.m_customer(customer_id);


--
-- Name: m_customer fk_wmb_m_customer_user_credential; Type: FK CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.m_customer
    ADD CONSTRAINT fk_wmb_m_customer_user_credential FOREIGN KEY (user_credential_id) REFERENCES wmb.user_credentials(id);


--
-- Name: m_fnb_category fk_wmb_m_fnb_category_fn_b; Type: FK CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.m_fnb_category
    ADD CONSTRAINT fk_wmb_m_fnb_category_fn_b FOREIGN KEY (fn_b_id) REFERENCES wmb.m_fnb(id);


--
-- Name: m_fnb_category fk_wmb_m_fnb_category_menu_category; Type: FK CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.m_fnb_category
    ADD CONSTRAINT fk_wmb_m_fnb_category_menu_category FOREIGN KEY (menu_category_id) REFERENCES wmb.m_menu_category(id);


--
-- Name: t_pos_bill_detail fk_wmb_t_pos_bill_bill_detail; Type: FK CONSTRAINT; Schema: wmb; Owner: smm2
--

ALTER TABLE ONLY wmb.t_pos_bill_detail
    ADD CONSTRAINT fk_wmb_t_pos_bill_bill_detail FOREIGN KEY (bill_id) REFERENCES wmb.t_pos_bill(id);


--
-- PostgreSQL database dump complete
--

