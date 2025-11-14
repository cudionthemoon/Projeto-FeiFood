--
-- PostgreSQL database dump
--

\restrict Nxh8lhQTrLuiuE57KYxwQADhlSTFLqfUc2IkcPxCfXdcZ4hI5AefMSaQ6lfZYiA

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-11-14 19:27:15

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 16442)
-- Name: tbalimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbalimento (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    tipo character varying(20) NOT NULL,
    preco numeric(10,2) NOT NULL
);


ALTER TABLE public.tbalimento OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16441)
-- Name: tbalimento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbalimento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbalimento_id_seq OWNER TO postgres;

--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 225
-- Name: tbalimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbalimento_id_seq OWNED BY public.tbalimento.id;


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: tbaluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbaluno (
    id integer NOT NULL,
    nome character varying(80),
    usuario character varying(50) NOT NULL,
    senha character varying(100) NOT NULL
);


ALTER TABLE public.tbaluno OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: tbaluno_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbaluno_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbaluno_id_seq OWNER TO postgres;

--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 219
-- Name: tbaluno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbaluno_id_seq OWNED BY public.tbaluno.id;


--
-- TOC entry 222 (class 1259 OID 16402)
-- Name: tbcategoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbcategoria (
    id integer NOT NULL,
    nome character varying(60) NOT NULL
);


ALTER TABLE public.tbcategoria OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16401)
-- Name: tbcategoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbcategoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbcategoria_id_seq OWNER TO postgres;

--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 221
-- Name: tbcategoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbcategoria_id_seq OWNED BY public.tbcategoria.id;


--
-- TOC entry 224 (class 1259 OID 16413)
-- Name: tbestabelecimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbestabelecimento (
    id integer NOT NULL,
    nome character varying(120) NOT NULL,
    tipo character varying(255)
);


ALTER TABLE public.tbestabelecimento OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16412)
-- Name: tbestabelecimento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbestabelecimento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbestabelecimento_id_seq OWNER TO postgres;

--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 223
-- Name: tbestabelecimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbestabelecimento_id_seq OWNED BY public.tbestabelecimento.id;


--
-- TOC entry 228 (class 1259 OID 16453)
-- Name: tbpedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbpedido (
    id integer NOT NULL,
    data timestamp without time zone DEFAULT now() NOT NULL,
    total numeric(10,2) DEFAULT 0 NOT NULL
);


ALTER TABLE public.tbpedido OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16452)
-- Name: tbpedido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbpedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbpedido_id_seq OWNER TO postgres;

--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 227
-- Name: tbpedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbpedido_id_seq OWNED BY public.tbpedido.id;


--
-- TOC entry 230 (class 1259 OID 16465)
-- Name: tbpedidoitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbpedidoitem (
    id integer NOT NULL,
    id_pedido integer,
    id_alimento integer,
    quantidade integer NOT NULL,
    preco_unitario numeric(10,2) NOT NULL
);


ALTER TABLE public.tbpedidoitem OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16464)
-- Name: tbpedidoitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbpedidoitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbpedidoitem_id_seq OWNER TO postgres;

--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 229
-- Name: tbpedidoitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbpedidoitem_id_seq OWNED BY public.tbpedidoitem.id;


--
-- TOC entry 4884 (class 2604 OID 16445)
-- Name: tbalimento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbalimento ALTER COLUMN id SET DEFAULT nextval('public.tbalimento_id_seq'::regclass);


--
-- TOC entry 4881 (class 2604 OID 16393)
-- Name: tbaluno id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbaluno ALTER COLUMN id SET DEFAULT nextval('public.tbaluno_id_seq'::regclass);


--
-- TOC entry 4882 (class 2604 OID 16405)
-- Name: tbcategoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbcategoria ALTER COLUMN id SET DEFAULT nextval('public.tbcategoria_id_seq'::regclass);


--
-- TOC entry 4883 (class 2604 OID 16416)
-- Name: tbestabelecimento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbestabelecimento ALTER COLUMN id SET DEFAULT nextval('public.tbestabelecimento_id_seq'::regclass);


--
-- TOC entry 4885 (class 2604 OID 16456)
-- Name: tbpedido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbpedido ALTER COLUMN id SET DEFAULT nextval('public.tbpedido_id_seq'::regclass);


--
-- TOC entry 4888 (class 2604 OID 16468)
-- Name: tbpedidoitem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbpedidoitem ALTER COLUMN id SET DEFAULT nextval('public.tbpedidoitem_id_seq'::regclass);


--
-- TOC entry 5063 (class 0 OID 16442)
-- Dependencies: 226
-- Data for Name: tbalimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbalimento (id, nome, tipo, preco) FROM stdin;
1	Prato Feito de Frango Grelhado	Comida	22.90
2	Prato Feito de Bife Acebolado	Comida	24.90
3	Macarrão ao Molho Bolonhesa	Comida	25.00
4	Estrogonofe de Frango	Comida	23.50
5	Estrogonofe de Carne	Comida	25.50
6	Arroz, Feijão e Omelete	Comida	18.90
7	Salada Completa com Frango	Comida	19.50
8	Frango à Parmegiana	Comida	26.00
9	Carne Moída com Legumes	Comida	21.50
10	Frango Xadrez com Arroz Branco	Comida	24.00
11	Hambúrguer Clássico	Lanche	19.90
12	X-Salada	Lanche	21.00
13	X-Bacon	Lanche	23.50
14	X-Egg	Lanche	22.00
15	Misto Quente	Lanche	12.00
16	Pão de Queijo Recheado	Lanche	9.00
17	Sanduíche Natural de Frango	Lanche	14.50
18	Sanduíche Natural de Atum	Lanche	15.00
19	Hambúrguer de Frango Crispy	Lanche	21.50
20	X-Calabresa	Lanche	22.90
21	Refrigerante Lata	Bebida	6.00
22	Suco Natural de Laranja	Bebida	8.50
23	Suco Natural de Limão	Bebida	7.50
24	Água Mineral	Bebida	4.00
25	Café Expresso	Bebida	5.00
\.


--
-- TOC entry 5057 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: tbaluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbaluno (id, nome, usuario, senha) FROM stdin;
1	Administrador	admin	123
2	jow	jowzin	1234
3	higor	higin	1234
\.


--
-- TOC entry 5059 (class 0 OID 16402)
-- Dependencies: 222
-- Data for Name: tbcategoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbcategoria (id, nome) FROM stdin;
\.


--
-- TOC entry 5061 (class 0 OID 16413)
-- Dependencies: 224
-- Data for Name: tbestabelecimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbestabelecimento (id, nome, tipo) FROM stdin;
31	FeiFood	Comida
\.


--
-- TOC entry 5065 (class 0 OID 16453)
-- Dependencies: 228
-- Data for Name: tbpedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbpedido (id, data, total) FROM stdin;
\.


--
-- TOC entry 5067 (class 0 OID 16465)
-- Dependencies: 230
-- Data for Name: tbpedidoitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbpedidoitem (id, id_pedido, id_alimento, quantidade, preco_unitario) FROM stdin;
\.


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 225
-- Name: tbalimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbalimento_id_seq', 25, true);


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 219
-- Name: tbaluno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbaluno_id_seq', 3, true);


--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 221
-- Name: tbcategoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbcategoria_id_seq', 1, false);


--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 223
-- Name: tbestabelecimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbestabelecimento_id_seq', 31, true);


--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 227
-- Name: tbpedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbpedido_id_seq', 1, false);


--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 229
-- Name: tbpedidoitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbpedidoitem_id_seq', 1, false);


--
-- TOC entry 4902 (class 2606 OID 16451)
-- Name: tbalimento tbalimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbalimento
    ADD CONSTRAINT tbalimento_pkey PRIMARY KEY (id);


--
-- TOC entry 4890 (class 2606 OID 16398)
-- Name: tbaluno tbaluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbaluno
    ADD CONSTRAINT tbaluno_pkey PRIMARY KEY (id);


--
-- TOC entry 4892 (class 2606 OID 16400)
-- Name: tbaluno tbaluno_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbaluno
    ADD CONSTRAINT tbaluno_usuario_key UNIQUE (usuario);


--
-- TOC entry 4894 (class 2606 OID 16411)
-- Name: tbcategoria tbcategoria_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbcategoria
    ADD CONSTRAINT tbcategoria_nome_key UNIQUE (nome);


--
-- TOC entry 4896 (class 2606 OID 16409)
-- Name: tbcategoria tbcategoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbcategoria
    ADD CONSTRAINT tbcategoria_pkey PRIMARY KEY (id);


--
-- TOC entry 4898 (class 2606 OID 16422)
-- Name: tbestabelecimento tbestabelecimento_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbestabelecimento
    ADD CONSTRAINT tbestabelecimento_nome_key UNIQUE (nome);


--
-- TOC entry 4900 (class 2606 OID 16420)
-- Name: tbestabelecimento tbestabelecimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbestabelecimento
    ADD CONSTRAINT tbestabelecimento_pkey PRIMARY KEY (id);


--
-- TOC entry 4904 (class 2606 OID 16463)
-- Name: tbpedido tbpedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbpedido
    ADD CONSTRAINT tbpedido_pkey PRIMARY KEY (id);


--
-- TOC entry 4906 (class 2606 OID 16473)
-- Name: tbpedidoitem tbpedidoitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbpedidoitem
    ADD CONSTRAINT tbpedidoitem_pkey PRIMARY KEY (id);


--
-- TOC entry 4907 (class 2606 OID 16479)
-- Name: tbpedidoitem tbpedidoitem_id_alimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbpedidoitem
    ADD CONSTRAINT tbpedidoitem_id_alimento_fkey FOREIGN KEY (id_alimento) REFERENCES public.tbalimento(id);


--
-- TOC entry 4908 (class 2606 OID 16474)
-- Name: tbpedidoitem tbpedidoitem_id_pedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbpedidoitem
    ADD CONSTRAINT tbpedidoitem_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.tbpedido(id);


-- Completed on 2025-11-14 19:27:15

--
-- PostgreSQL database dump complete
--

\unrestrict Nxh8lhQTrLuiuE57KYxwQADhlSTFLqfUc2IkcPxCfXdcZ4hI5AefMSaQ6lfZYiA

