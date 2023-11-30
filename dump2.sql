--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 12.1

-- Started on 2020-11-12 18:40:53

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

--
-- TOC entry 196 (class 1259 OID 32983)
-- Name: animais; Type: TABLE; Schema: public; Owner: postgres
--


CREATE TABLE public.animais (
    "nomeAnimal" character varying(20),
    "codEspecie" integer,
    "codAnimal" integer NOT NULL,
    "codAnimalPai" integer,
    "codAnimalMae" integer,
    "dtNascAnimal" date
);


ALTER TABLE public.animais OWNER TO root;

--
-- TOC entry 197 (class 1259 OID 32986)
-- Name: consultas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consultas (
    codanimal integer NOT NULL,
    matricula integer NOT NULL,
    data date NOT NULL,
    diagnosticoconsulta character varying(100),
    codconsulta integer NOT NULL
);


ALTER TABLE public.consultas OWNER TO root;

--
-- TOC entry 198 (class 1259 OID 32989)
-- Name: especies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especies (
    codespecie integer NOT NULL,
    nomeespecie character varying(20),
    expectativaespecie integer
);


ALTER TABLE public.especies OWNER TO root;

--
-- TOC entry 199 (class 1259 OID 32992)
-- Name: funcionarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionarios (
    matricula integer NOT NULL,
    nome character varying(20),
    endereco character varying(20),
    email character varying(20),
    crmv integer,
    especialidade character varying(30)
);


ALTER TABLE public.funcionarios OWNER TO root;

--
-- TOC entry 200 (class 1259 OID 32995)
-- Name: medicamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicamentos (
    codmedicamento integer NOT NULL,
    nomemedicamento character varying(20)
);


ALTER TABLE public.medicamentos OWNER TO root;

--
-- TOC entry 201 (class 1259 OID 32998)
-- Name: prescricao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prescricao (
    codconsulta integer NOT NULL,
    codmedicamento integer NOT NULL
);


ALTER TABLE public.prescricao OWNER TO root;

--
-- TOC entry 2845 (class 0 OID 32983)
-- Dependencies: 196
-- Data for Name: animais; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.animais VALUES ('Glória', 1, 1, NULL, NULL, '2010-05-05');
INSERT INTO public.animais VALUES ('Vermelho', 1, 2, NULL, NULL, '2009-08-05');
INSERT INTO public.animais VALUES ('Juzz', 1, 3, 2, 1, '2015-05-07');
INSERT INTO public.animais VALUES ('Opalala', 1, 4, 2, 1, '2018-01-04');
INSERT INTO public.animais VALUES ('Branquinho', 2, 5, NULL, NULL, '2017-01-05');
INSERT INTO public.animais VALUES ('Quick', 2, 6, NULL, NULL, '2016-12-31');
INSERT INTO public.animais VALUES ('Morango', 2, 7, 5, 6, '2017-12-20');
INSERT INTO public.animais VALUES ('Chocolate', 2, 8, 5, 6, '2017-12-20');
INSERT INTO public.animais VALUES ('Salti', 2, 9, 5, 6, '2017-12-20');
INSERT INTO public.animais VALUES ('Jazz', 2, 10, 5, 6, '2018-02-28');
INSERT INTO public.animais VALUES ('Guto', 2, 11, 5, 6, '2018-02-28');
INSERT INTO public.animais VALUES ('Helio', 1, 12, 3, 1, '2018-03-01');
INSERT INTO public.animais VALUES ('Verduz', 2, 13, 8, 7, '2018-03-01');


--
-- TOC entry 2846 (class 0 OID 32986)
-- Dependencies: 197
-- Data for Name: consultas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.consultas VALUES (1, 111, '2018-02-10', 'Dor de Barriga', 1);
INSERT INTO public.consultas VALUES (1, 222, '2018-02-11', 'Dor de Barriga', 2);
INSERT INTO public.consultas VALUES (7, 222, '2018-02-28', 'Hepatite B', 3);
INSERT INTO public.consultas VALUES (7, 222, '2018-03-01', 'Hepatite B', 4);


--
-- TOC entry 2847 (class 0 OID 32989)
-- Dependencies: 198
-- Data for Name: especies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.especies VALUES (1, 'Hipopótamo', 10);
INSERT INTO public.especies VALUES (2, 'Coelho', 3);


--
-- TOC entry 2848 (class 0 OID 32992)
-- Dependencies: 199
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.funcionarios VALUES (333, 'Ana Maria Ritz', 'Rua Azul, 12', 'ana.ritz@zoo.br', 184, 'pediatra');
INSERT INTO public.funcionarios VALUES (111, 'Valéria Ana Sá', 'Rua dos Limões, 586 ', 'valeria.sa@zoo.br', 152, 'clínica geral');
INSERT INTO public.funcionarios VALUES (222, 'José de Oliveira', 'Rua Verde, 58', 'jose.oliveira@zoo.br', 555, 'clínica geral');


--
-- TOC entry 2849 (class 0 OID 32995)
-- Dependencies: 200
-- Data for Name: medicamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.medicamentos VALUES (55, 'Zorá 5mg');
INSERT INTO public.medicamentos VALUES (588, 'Fliur');
INSERT INTO public.medicamentos VALUES (781, 'Benafler 80');


--
-- TOC entry 2850 (class 0 OID 32998)
-- Dependencies: 201
-- Data for Name: prescricao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prescricao VALUES (1, 55);
INSERT INTO public.prescricao VALUES (1, 781);
INSERT INTO public.prescricao VALUES (2, 781);
INSERT INTO public.prescricao VALUES (3, 588);
INSERT INTO public.prescricao VALUES (4, 588);


--
-- TOC entry 2704 (class 2606 OID 33002)
-- Name: animais animais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animais
    ADD CONSTRAINT animais_pkey PRIMARY KEY ("codAnimal");


--
-- TOC entry 2711 (class 2606 OID 33004)
-- Name: especies especies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especies
    ADD CONSTRAINT especies_pkey PRIMARY KEY (codespecie);


--
-- TOC entry 2713 (class 2606 OID 33006)
-- Name: funcionarios funcionarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (matricula);


--
-- TOC entry 2715 (class 2606 OID 33008)
-- Name: medicamentos medicamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT medicamentos_pkey PRIMARY KEY (codmedicamento);


--
-- TOC entry 2709 (class 2606 OID 33010)
-- Name: consultas pk_codconsulta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT pk_codconsulta PRIMARY KEY (codconsulta);


--
-- TOC entry 2717 (class 2606 OID 33012)
-- Name: prescricao prescricao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescricao
    ADD CONSTRAINT prescricao_pkey PRIMARY KEY (codconsulta, codmedicamento);


--
-- TOC entry 2705 (class 1259 OID 33013)
-- Name: fki_especie; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_especie ON public.animais USING btree ("codEspecie");


--
-- TOC entry 2706 (class 1259 OID 33014)
-- Name: fki_mae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_mae ON public.animais USING btree ("codAnimalMae");


--
-- TOC entry 2707 (class 1259 OID 33015)
-- Name: fki_pai; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_pai ON public.animais USING btree ("codAnimalPai");


--
-- TOC entry 2721 (class 2606 OID 33016)
-- Name: consultas consultas_codanimal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_codanimal_fkey FOREIGN KEY (codanimal) REFERENCES public.animais("codAnimal");


--
-- TOC entry 2722 (class 2606 OID 33021)
-- Name: consultas consultas_matricula_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_matricula_fkey FOREIGN KEY (matricula) REFERENCES public.funcionarios(matricula);


--
-- TOC entry 2718 (class 2606 OID 33026)
-- Name: animais fk_especie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animais
    ADD CONSTRAINT fk_especie FOREIGN KEY ("codEspecie") REFERENCES public.especies(codespecie);


--
-- TOC entry 2719 (class 2606 OID 33031)
-- Name: animais fk_mae; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animais
    ADD CONSTRAINT fk_mae FOREIGN KEY ("codAnimalMae") REFERENCES public.animais("codAnimal");


--
-- TOC entry 2720 (class 2606 OID 33036)
-- Name: animais fk_pai; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animais
    ADD CONSTRAINT fk_pai FOREIGN KEY ("codAnimalPai") REFERENCES public.animais("codAnimal");


--
-- TOC entry 2723 (class 2606 OID 33041)
-- Name: prescricao prescricao_codmedicamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescricao
    ADD CONSTRAINT prescricao_codmedicamento_fkey FOREIGN KEY (codmedicamento) REFERENCES public.medicamentos(codmedicamento);


-- Completed on 2020-11-12 18:40:54

--
-- PostgreSQL database dump complete
--
