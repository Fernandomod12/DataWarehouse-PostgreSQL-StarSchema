--
-- PostgreSQL database dump
--

\restrict 4OsRboDFW6jJdUz31CXnNseqtot4h7f0HFlSg1xtKBDsGuyMpuFAbY8mnRwII8f

-- Dumped from database version 14.19 (Ubuntu 14.19-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.19 (Ubuntu 14.19-0ubuntu0.22.04.1)

-- Started on 2025-12-03 10:48:38 CET

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 16715)
-- Name: dim_neo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_neo (
    id integer NOT NULL,
    original_id text,
    full_name text,
    neo character(1),
    pha character(1)
);


ALTER TABLE public.dim_neo OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16714)
-- Name: dim_neo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_neo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_neo_id_seq OWNER TO postgres;

--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 211
-- Name: dim_neo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_neo_id_seq OWNED BY public.dim_neo.id;


--
-- TOC entry 214 (class 1259 OID 16724)
-- Name: dim_orbita; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_orbita (
    id integer NOT NULL,
    class text,
    e double precision,
    a double precision,
    q double precision,
    i double precision
);


ALTER TABLE public.dim_orbita OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16723)
-- Name: dim_orbita_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_orbita_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_orbita_id_seq OWNER TO postgres;

--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 213
-- Name: dim_orbita_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_orbita_id_seq OWNED BY public.dim_orbita.id;


--
-- TOC entry 216 (class 1259 OID 16733)
-- Name: dim_risco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_risco (
    id integer NOT NULL,
    moid double precision,
    moid_ld double precision,
    pha character(1)
);


ALTER TABLE public.dim_risco OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16732)
-- Name: dim_risco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_risco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_risco_id_seq OWNER TO postgres;

--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 215
-- Name: dim_risco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_risco_id_seq OWNED BY public.dim_risco.id;


--
-- TOC entry 210 (class 1259 OID 16708)
-- Name: dim_tempo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_tempo (
    id integer NOT NULL,
    epoch_cal double precision,
    ano integer,
    mes integer,
    trimestre integer
);


ALTER TABLE public.dim_tempo OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16707)
-- Name: dim_tempo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_tempo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_tempo_id_seq OWNER TO postgres;

--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 209
-- Name: dim_tempo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_tempo_id_seq OWNED BY public.dim_tempo.id;


--
-- TOC entry 218 (class 1259 OID 16740)
-- Name: fato_neo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fato_neo (
    fato_id integer NOT NULL,
    neo_id integer,
    orbita_id integer,
    tempo_id integer,
    risco_id integer,
    diameter numeric(12,6),
    moid numeric(12,10),
    per_y numeric(12,4),
    diameter_sigma numeric(12,6)
);


ALTER TABLE public.fato_neo OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16739)
-- Name: fato_neo_fato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fato_neo_fato_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fato_neo_fato_id_seq OWNER TO postgres;

--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 217
-- Name: fato_neo_fato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fato_neo_fato_id_seq OWNED BY public.fato_neo.fato_id;


--
-- TOC entry 3268 (class 2604 OID 16718)
-- Name: dim_neo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_neo ALTER COLUMN id SET DEFAULT nextval('public.dim_neo_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 16727)
-- Name: dim_orbita id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_orbita ALTER COLUMN id SET DEFAULT nextval('public.dim_orbita_id_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 16736)
-- Name: dim_risco id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_risco ALTER COLUMN id SET DEFAULT nextval('public.dim_risco_id_seq'::regclass);


--
-- TOC entry 3267 (class 2604 OID 16711)
-- Name: dim_tempo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tempo ALTER COLUMN id SET DEFAULT nextval('public.dim_tempo_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 16743)
-- Name: fato_neo fato_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_neo ALTER COLUMN fato_id SET DEFAULT nextval('public.fato_neo_fato_id_seq'::regclass);


--
-- TOC entry 3277 (class 2606 OID 16722)
-- Name: dim_neo dim_neo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_neo
    ADD CONSTRAINT dim_neo_pkey PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 16731)
-- Name: dim_orbita dim_orbita_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_orbita
    ADD CONSTRAINT dim_orbita_pkey PRIMARY KEY (id);


--
-- TOC entry 3283 (class 2606 OID 16738)
-- Name: dim_risco dim_risco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_risco
    ADD CONSTRAINT dim_risco_pkey PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 16713)
-- Name: dim_tempo dim_tempo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tempo
    ADD CONSTRAINT dim_tempo_pkey PRIMARY KEY (id);


--
-- TOC entry 3285 (class 2606 OID 16745)
-- Name: fato_neo fato_neo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_neo
    ADD CONSTRAINT fato_neo_pkey PRIMARY KEY (fato_id);


--
-- TOC entry 3275 (class 1259 OID 16766)
-- Name: dim_neo_original_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dim_neo_original_id_idx ON public.dim_neo USING btree (original_id);


--
-- TOC entry 3278 (class 1259 OID 16767)
-- Name: dim_orbita_class_e_a_q_i_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dim_orbita_class_e_a_q_i_idx ON public.dim_orbita USING btree (class, e, a, q, i);


--
-- TOC entry 3281 (class 1259 OID 16769)
-- Name: dim_risco_moid_moid_ld_pha_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dim_risco_moid_moid_ld_pha_idx ON public.dim_risco USING btree (moid, moid_ld, pha);


--
-- TOC entry 3272 (class 1259 OID 16768)
-- Name: dim_tempo_epoch_cal_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dim_tempo_epoch_cal_idx ON public.dim_tempo USING btree (epoch_cal);


--
-- TOC entry 3286 (class 2606 OID 16746)
-- Name: fato_neo fato_neo_neo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_neo
    ADD CONSTRAINT fato_neo_neo_id_fkey FOREIGN KEY (neo_id) REFERENCES public.dim_neo(id);


--
-- TOC entry 3287 (class 2606 OID 16751)
-- Name: fato_neo fato_neo_orbita_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_neo
    ADD CONSTRAINT fato_neo_orbita_id_fkey FOREIGN KEY (orbita_id) REFERENCES public.dim_orbita(id);


--
-- TOC entry 3289 (class 2606 OID 16761)
-- Name: fato_neo fato_neo_risco_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_neo
    ADD CONSTRAINT fato_neo_risco_id_fkey FOREIGN KEY (risco_id) REFERENCES public.dim_risco(id);


--
-- TOC entry 3288 (class 2606 OID 16756)
-- Name: fato_neo fato_neo_tempo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_neo
    ADD CONSTRAINT fato_neo_tempo_id_fkey FOREIGN KEY (tempo_id) REFERENCES public.dim_tempo(id);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO pg_database_owner;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-12-03 10:48:38 CET

--
-- PostgreSQL database dump complete
--

\unrestrict 4OsRboDFW6jJdUz31CXnNseqtot4h7f0HFlSg1xtKBDsGuyMpuFAbY8mnRwII8f

