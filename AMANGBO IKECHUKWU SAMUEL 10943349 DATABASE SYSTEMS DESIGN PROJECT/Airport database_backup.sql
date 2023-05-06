--
-- PostgreSQL database dump
--

-- Dumped from database version 10.21
-- Dumped by pg_dump version 10.21

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: update_total_price(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_total_price() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.total_price := (
    SELECT price_per_litre * NEW.quantity
    FROM FuelType
    WHERE FuelType.fuel_id = NEW.fuel_id
  );

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_total_price() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_name character varying(200) NOT NULL,
    customer_id integer NOT NULL,
    customer_contact character varying(200) NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    employee_name character varying(200) NOT NULL,
    employee_position character varying(200) NOT NULL,
    date_of_hire character varying(200) NOT NULL,
    shift text NOT NULL,
    reports_to text
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: fuelpump; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fuelpump (
    pump_id integer NOT NULL,
    fuel_id integer NOT NULL,
    status character varying(50) NOT NULL
);


ALTER TABLE public.fuelpump OWNER TO postgres;

--
-- Name: fuelpump_pump_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fuelpump_pump_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fuelpump_pump_id_seq OWNER TO postgres;

--
-- Name: fuelpump_pump_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fuelpump_pump_id_seq OWNED BY public.fuelpump.pump_id;


--
-- Name: fuelsales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fuelsales (
    sales_id integer NOT NULL,
    fuel_id integer NOT NULL,
    quantity numeric(10,2) NOT NULL,
    total_price numeric(10,2),
    sale_date character varying(100) NOT NULL
);


ALTER TABLE public.fuelsales OWNER TO postgres;

--
-- Name: fuelsales_sales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fuelsales_sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fuelsales_sales_id_seq OWNER TO postgres;

--
-- Name: fuelsales_sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fuelsales_sales_id_seq OWNED BY public.fuelsales.sales_id;


--
-- Name: fueltype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fueltype (
    fuel_id integer NOT NULL,
    fuel_name character varying(50),
    price_per_litre numeric(5,2) NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.fueltype OWNER TO postgres;

--
-- Name: paymentmethod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paymentmethod (
    payment_id integer NOT NULL,
    payment_name character varying(200) NOT NULL,
    payment_type character varying(100) NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.paymentmethod OWNER TO postgres;

--
-- Name: paymentmethod_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paymentmethod_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paymentmethod_payment_id_seq OWNER TO postgres;

--
-- Name: paymentmethod_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paymentmethod_payment_id_seq OWNED BY public.paymentmethod.payment_id;


--
-- Name: vehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle (
    vehicle_id integer NOT NULL,
    customer_id integer NOT NULL,
    car_brand character varying(200) NOT NULL
);


ALTER TABLE public.vehicle OWNER TO postgres;

--
-- Name: vehicle_vehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_vehicle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_vehicle_id_seq OWNER TO postgres;

--
-- Name: vehicle_vehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_vehicle_id_seq OWNED BY public.vehicle.vehicle_id;


--
-- Name: fuelpump pump_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuelpump ALTER COLUMN pump_id SET DEFAULT nextval('public.fuelpump_pump_id_seq'::regclass);


--
-- Name: fuelsales sales_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuelsales ALTER COLUMN sales_id SET DEFAULT nextval('public.fuelsales_sales_id_seq'::regclass);


--
-- Name: paymentmethod payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paymentmethod ALTER COLUMN payment_id SET DEFAULT nextval('public.paymentmethod_payment_id_seq'::regclass);


--
-- Name: vehicle vehicle_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle ALTER COLUMN vehicle_id SET DEFAULT nextval('public.vehicle_vehicle_id_seq'::regclass);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_name, customer_id, customer_contact) FROM stdin;
John Smith	1	1234567890
Jane Doe	2	9876543210
Michael Johnson	3	5551234567
Emily Brown	4	9998887777
David Wilson	5	4445556666
Sarah Davis	6	1112223333
Robert Taylor	7	6667778888
Linda Anderson	8	2223334444
Thomas Lee	9	7778889999
Olivia Martin	10	3334445555
William Johnson	11	5556667777
Emma Thompson	12	8889990000
Christopher Davis	13	4443332222
Sophia Wilson	14	6665554444
James Brown	15	1112223333
Ava Smith	16	8889991111
Matthew Anderson	17	2223334444
Emma Taylor	18	5556667777
Daniel Davis	19	7778889999
Sophia Martin	20	3334445555
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_id, employee_name, employee_position, date_of_hire, shift, reports_to) FROM stdin;
101	Robert Johnson	Manager	15/01/2010	Day Shift	\N
105	Jennifer Smith	Supervisor	03/05/2011	Night Shift	Manager
103	Christopher Davis	Technician	21/09/2012	Evening Shift	Manager
104	Michelle Thompson	Assistant	12/07/2013	Day Shift	Manager
102	Daniel Wilson	Operator	30/11/2014	Night Shift	Manager
106	Jessica Brown	Technician	01/03/2015	Day Shift	Manager
108	David Johnson	Supervisor	18/06/2016	Night Shift	Manager
111	Samantha Davis	Technician	24/09/2017	Evening Shift	Manager
107	Andrew Smith	Assistant	09/02/2018	Day Shift	Manager
110	Emily Wilson	Operator	28/05/2019	Night Shift	Manager
115	Michael Thompson	Operator	05/09/2020	Day Shift	Manager
112	Emma Davis	Supervisor	19/12/2021	Night Shift	Manager
109	James Johnson	Technician	14/03/2022	Evening Shift	Manager
113	Sophia Brown	Assistant	08/06/2023	Day Shift	Manager
117	Matthew Wilson	Operator	25/09/2020	Night Shift	Manager
116	Olivia Smith	Technician	17/12/2021	Day Shift	Manager
119	Jacob Thompson	Supervisor	04/03/2021	Night Shift	Manager
114	Isabella Davis	Technician	29/05/2010	Evening Shift	Manager
118	William Johnson	Assistant	13/08/2011	Day Shift	Manager
120	Emily Wilson	Operator	21/11/2020	Night Shift	Manager
\.


--
-- Data for Name: fuelpump; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fuelpump (pump_id, fuel_id, status) FROM stdin;
1	1	Active
2	2	Active
3	3	Active
4	4	Active
5	5	Active
6	6	Active
7	7	Active
8	8	Active
9	9	Active
10	10	Active
11	11	Active
12	12	Active
13	13	Active
14	14	Active
15	15	Active
16	16	Active
17	17	Active
18	18	Active
19	19	Active
20	20	Active
\.


--
-- Data for Name: fuelsales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fuelsales (sales_id, fuel_id, quantity, total_price, sale_date) FROM stdin;
1	1	50.00	1037.50	01/04/2023
2	2	30.00	568.50	02/04/2023
3	3	20.00	290.00	03/04/2023
4	4	40.00	924.00	04/04/2023
5	5	25.00	445.00	05/04/2023
6	6	35.00	673.75	06/04/2023
7	7	15.00	222.00	07/04/2023
8	8	45.00	740.25	08/04/2023
9	9	55.00	1171.50	09/04/2023
10	10	50.00	1245.00	10/04/2023
11	11	20.00	455.00	11/04/2023
12	12	30.00	468.00	12/04/2023
13	13	40.00	730.00	13/04/2023
14	14	25.00	587.50	14/04/2023
15	15	35.00	882.00	15/04/2023
16	16	15.00	251.25	16/04/2023
17	17	45.00	918.00	17/04/2023
18	18	55.00	1094.50	18/04/2023
19	19	50.00	1075.00	19/04/2023
20	20	20.00	359.00	20/04/2023
21	1	39.00	809.25	17/03/2023
\.


--
-- Data for Name: fueltype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fueltype (fuel_id, fuel_name, price_per_litre, customer_id) FROM stdin;
1	Gasoline	20.75	1
2	Diesel	18.95	2
3	Electric	14.50	3
4	Hybrid	23.10	4
5	Ethanol	17.80	5
6	Biodiesel	19.25	6
7	Compressed Natural Gas (CNG)	14.80	7
8	Liquefied Petroleum Gas (LPG)	16.45	8
9	Hydrogen	21.30	9
10	Propane	24.90	10
11	Methanol	22.75	11
12	Liquefied Natural Gas (LNG)	15.60	12
13	Biofuel	18.25	13
14	Synthetic Fuel	23.50	14
15	Aviation Fuel	25.20	15
16	Kerosene	16.75	16
17	Methane	20.40	17
18	Butane	19.90	18
19	Jet Fuel	21.50	19
20	Biomethane	17.95	20
\.


--
-- Data for Name: paymentmethod; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paymentmethod (payment_id, payment_name, payment_type, customer_id) FROM stdin;
1	Credit Card	Card Payment	1
2	PayPal	Online Payment	2
3	Cash	Cash Payment	3
4	Bank Transfer	Bank Payment	4
5	Mobile Wallet	Digital Payment	5
6	Cheque	Paper Payment	6
7	Cryptocurrency	Digital Payment	7
8	Gift Card	Prepaid Payment	8
9	Money Order	Secure Payment	9
10	Direct Debit	Automatic Payment	10
11	Google Pay	Digital Payment	11
12	Apple Pay	Mobile Payment	12
13	Venmo	Peer-to-Peer Payment	13
14	Stripe	Online Payment	14
15	Square	Card Payment	15
16	Zelle	Bank Transfer	16
17	Western Union	Money Transfer	17
18	Amazon Pay	Digital Wallet	18
19	Alipay	Mobile Payment	19
20	Samsung Pay	Mobile Payment	20
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle (vehicle_id, customer_id, car_brand) FROM stdin;
1	15	Toyota
2	18	Honda
3	12	Ford
4	19	Chevrolet
5	14	BMW
6	16	Mercedes-Benz
7	20	Nissan
8	13	Volkswagen
9	11	Audi
10	17	Hyundai
11	10	Kia
12	9	Mazda
13	7	Subaru
14	8	Lexus
15	6	Jeep
16	5	Volvo
17	4	Mitsubishi
18	3	Chrysler
19	2	Land Rover
20	1	Tesla
\.


--
-- Name: fuelpump_pump_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fuelpump_pump_id_seq', 20, true);


--
-- Name: fuelsales_sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fuelsales_sales_id_seq', 21, true);


--
-- Name: paymentmethod_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paymentmethod_payment_id_seq', 20, true);


--
-- Name: vehicle_vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_vehicle_id_seq', 20, true);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- Name: fuelpump fuelpump_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuelpump
    ADD CONSTRAINT fuelpump_pkey PRIMARY KEY (pump_id);


--
-- Name: fuelsales fuelsales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuelsales
    ADD CONSTRAINT fuelsales_pkey PRIMARY KEY (sales_id);


--
-- Name: fueltype fueltype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fueltype
    ADD CONSTRAINT fueltype_pkey PRIMARY KEY (fuel_id);


--
-- Name: paymentmethod paymentmethod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paymentmethod
    ADD CONSTRAINT paymentmethod_pkey PRIMARY KEY (payment_id);


--
-- Name: vehicle vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (vehicle_id);


--
-- Name: fuelsales fuel_sales_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER fuel_sales_trigger BEFORE INSERT ON public.fuelsales FOR EACH ROW EXECUTE PROCEDURE public.update_total_price();


--
-- Name: fuelpump fuelpump_fuel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuelpump
    ADD CONSTRAINT fuelpump_fuel_id_fkey FOREIGN KEY (fuel_id) REFERENCES public.fueltype(fuel_id);


--
-- Name: fuelsales fuelsales_fuel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fuelsales
    ADD CONSTRAINT fuelsales_fuel_id_fkey FOREIGN KEY (fuel_id) REFERENCES public.fueltype(fuel_id);


--
-- Name: fueltype fueltype_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fueltype
    ADD CONSTRAINT fueltype_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: paymentmethod paymentmethod_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paymentmethod
    ADD CONSTRAINT paymentmethod_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: vehicle vehicle_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- PostgreSQL database dump complete
--

