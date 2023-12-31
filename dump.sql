--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2020-08-06 11:20:08


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
-- TOC entry 202 (class 1259 OID 91002)
-- Name: ambulatorios; Type: TABLE; Schema: public; Owner: postgres
--

-- CREATE TABLE public.ambulatorios (
--                                      nroa integer NOT NULL,
--                                      capacidade smallint,
--                                      andar numeric(3,0) NOT NULL
-- );


ALTER TABLE public.ambulatorios OWNER TO root;

--
-- TOC entry 203 (class 1259 OID 91005)
-- Name: consultas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consultas (
                                  codm integer NOT NULL,
                                  codp integer,
                                  data date NOT NULL,
                                  hora time without time zone NOT NULL
);


ALTER TABLE public.consultas OWNER TO root;

--
-- TOC entry 204 (class 1259 OID 91008)
-- Name: funcionarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionarios (
                                     codf integer NOT NULL,
                                     nome character varying(40) NOT NULL,
                                     idade smallint,
                                     cpf numeric(11,0),
                                     cidade character varying(30),
                                     salario numeric(10,0)
);


ALTER TABLE public.funcionarios OWNER TO root;

--
-- TOC entry 205 (class 1259 OID 91011)
-- Name: medicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicos (
                                codm integer NOT NULL,
                                nome character varying(40) NOT NULL,
                                idade smallint NOT NULL,
                                especialidade character(20),
                                cpf numeric(11,0),
                                cidade character varying(30),
                                nroa integer
);


ALTER TABLE public.medicos OWNER TO root;

--
-- TOC entry 206 (class 1259 OID 91014)
-- Name: pacientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pacientes (
                                  codp integer NOT NULL,
                                  nome character varying(40) NOT NULL,
                                  idade smallint NOT NULL,
                                  cidade character(30),
                                  cpf numeric(11,0),
                                  doenca character varying(40) NOT NULL
);


ALTER TABLE public.pacientes OWNER TO root;

--
-- TOC entry 2847 (class 0 OID 91002)
-- Dependencies: 202
-- Data for Name: ambulatorios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ambulatorios VALUES (1, 30, 1);
INSERT INTO public.ambulatorios VALUES (2, 50, 1);
INSERT INTO public.ambulatorios VALUES (3, 40, 2);
INSERT INTO public.ambulatorios VALUES (4, 25, 2);
INSERT INTO public.ambulatorios VALUES (5, 55, 2);
INSERT INTO public.ambulatorios VALUES (10, 10, 4);


--
-- TOC entry 2848 (class 0 OID 91005)
-- Dependencies: 203
-- Data for Name: consultas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.consultas VALUES (1, 1, '2006-06-12', '14:00:00');
INSERT INTO public.consultas VALUES (1, 4, '2006-06-13', '10:00:00');
INSERT INTO public.consultas VALUES (2, 1, '2006-06-13', '09:00:00');
INSERT INTO public.consultas VALUES (2, 2, '2006-06-13', '11:00:00');
INSERT INTO public.consultas VALUES (2, 3, '2006-06-14', '14:00:00');
INSERT INTO public.consultas VALUES (2, 4, '2006-06-14', '17:00:00');
INSERT INTO public.consultas VALUES (3, 1, '2006-06-19', '18:00:00');
INSERT INTO public.consultas VALUES (3, 3, '2006-06-12', '10:00:00');
INSERT INTO public.consultas VALUES (3, 4, '2006-06-19', '13:00:00');
INSERT INTO public.consultas VALUES (4, 4, '2006-06-20', '13:00:00');
INSERT INTO public.consultas VALUES (4, 4, '2006-06-22', '19:30:00');


--
-- TOC entry 2849 (class 0 OID 91008)
-- Dependencies: 204
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.funcionarios VALUES (1, 'Rita', 32, 20000100000, 'Sao Jose', 1200);
INSERT INTO public.funcionarios VALUES (2, 'Maria', 55, 30000110000, 'Palhoca', 1220);
INSERT INTO public.funcionarios VALUES (3, 'Caio', 45, 41000100000, 'Florianopolis', 1100);
INSERT INTO public.funcionarios VALUES (4, 'Carlos', 44, 51000110000, 'Florianopolis', 1200);
INSERT INTO public.funcionarios VALUES (5, 'Paula', 33, 61000111000, 'Florianopolis', 2500);


--
-- TOC entry 2850 (class 0 OID 91011)
-- Dependencies: 205
-- Data for Name: medicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.medicos VALUES (1, 'Joao', 40, 'ortopedia           ', 10000100000, 'Florianopolis', 1);
INSERT INTO public.medicos VALUES (2, 'Maria', 42, 'traumatologia       ', 10000110000, 'Blumenau', 2);
INSERT INTO public.medicos VALUES (4, 'Carlos', 28, 'ortopedia           ', 11000110000, 'Joinville', NULL);
INSERT INTO public.medicos VALUES (3, 'Pedro', 51, 'pediatria           ', 11000100000, 'Sao Jose', 2);
INSERT INTO public.medicos VALUES (5, 'Marcia', 33, 'neurologia          ', 11000111000, 'Biguacu', 3);


--
-- TOC entry 2851 (class 0 OID 91014)
-- Dependencies: 206
-- Data for Name: pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pacientes VALUES (1, 'Ana', 20, 'Florianopolis                 ', 20000200000, 'gripe');
INSERT INTO public.pacientes VALUES (2, 'Paulo', 24, 'Palhoca                       ', 20000220000, 'fratura');
INSERT INTO public.pacientes VALUES (3, 'Lucia', 30, 'Biguacu                       ', 22000200000, 'tendinite');
INSERT INTO public.pacientes VALUES (4, 'Carlos', 28, 'Joinville                     ', 11000110000, 'sarampo');


--
-- TOC entry 2702 (class 2606 OID 91018)
-- Name: ambulatorios ambulatorios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ambulatorios
    ADD CONSTRAINT ambulatorios_pkey PRIMARY KEY (nroa);


--
-- TOC entry 2704 (class 2606 OID 91020)
-- Name: consultas consultas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_pkey PRIMARY KEY (codm, data, hora);


--
-- TOC entry 2706 (class 2606 OID 91024)
-- Name: funcionarios funcionarios_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_cpf_key UNIQUE (cpf);


--
-- TOC entry 2708 (class 2606 OID 91026)
-- Name: funcionarios funcionarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (codf);


--
-- TOC entry 2711 (class 2606 OID 91028)
-- Name: medicos medicos_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_cpf_key UNIQUE (cpf);


--
-- TOC entry 2713 (class 2606 OID 91030)
-- Name: medicos medicos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_pkey PRIMARY KEY (codm);


--
-- TOC entry 2715 (class 2606 OID 91032)
-- Name: pacientes pacientes_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_cpf_key UNIQUE (cpf);


--
-- TOC entry 2717 (class 2606 OID 91034)
-- Name: pacientes pacientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (codp);


--
-- TOC entry 2709 (class 1259 OID 91036)
-- Name: indice_cpf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX indice_cpf ON public.medicos USING btree (cpf);


--
-- TOC entry 2718 (class 2606 OID 91037)
-- Name: consultas consultas_codm_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_codm_fkey FOREIGN KEY (codm) REFERENCES public.medicos(codm);


--
-- TOC entry 2719 (class 2606 OID 91042)
-- Name: consultas consultas_codp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_codp_fkey FOREIGN KEY (codp) REFERENCES public.pacientes(codp);


--
-- TOC entry 2720 (class 2606 OID 91052)
-- Name: medicos medicos_nroa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_nroa_fkey FOREIGN KEY (nroa) REFERENCES public.ambulatorios(nroa);


-- Completed on 2020-08-06 11:20:08

--
-- PostgreSQL database dump complete
--
