--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

DROP INDEX public.zahl1;
DROP INDEX public.xididx3;
DROP INDEX public.xididx2;
DROP INDEX public.xididx1;
DROP INDEX public.vkp2;
DROP INDEX public.vkp1;
DROP INDEX public.ucfg2;
DROP INDEX public.ucfg;
DROP INDEX public.trace2;
DROP INDEX public.trace1;
DROP INDEX public.tarmed_id;
DROP INDEX public.tarmed5;
DROP INDEX public.tarmed4;
DROP INDEX public.tarmed3;
DROP INDEX public.tarmed2;
DROP INDEX public.rrl2;
DROP INDEX public.rrl1;
DROP INDEX public.rp1;
DROP INDEX public.rn5;
DROP INDEX public.rn4;
DROP INDEX public.rn3;
DROP INDEX public.rn2;
DROP INDEX public.rn1;
DROP INDEX public.rem3;
DROP INDEX public.rem2;
DROP INDEX public.rem1;
DROP INDEX public.problemdg1;
DROP INDEX public.problemdauermedikation1;
DROP INDEX public.problembehdl1;
DROP INDEX public.paj2;
DROP INDEX public.paj1;
DROP INDEX public.lst2;
DROP INDEX public.lst1;
DROP INDEX public.loinc1;
DROP INDEX public.labor3;
DROP INDEX public.labor2;
DROP INDEX public.labor1;
DROP INDEX public.labit2;
DROP INDEX public.labit1;
DROP INDEX public.konto2;
DROP INDEX public.konto1;
DROP INDEX public.k0;
DROP INDEX public.icd2;
DROP INDEX public.icd1;
DROP INDEX public.i8;
DROP INDEX public.i5;
DROP INDEX public.i4;
DROP INDEX public.i3;
DROP INDEX public.etikette3;
DROP INDEX public.etikette2;
DROP INDEX public.etikette1;
DROP INDEX public.eol1;
DROP INDEX public.ekp2;
DROP INDEX public.ekp1;
DROP INDEX public.dg1;
DROP INDEX public.dbimage1;
DROP INDEX public.chelpr_idx2;
DROP INDEX public.chelpr_idx1;
DROP INDEX public.cheacp;
DROP INDEX public.ch_elexis_icpc_idx1;
DROP INDEX public.ch_elexis_icpc_episodes1;
DROP INDEX public.ch_elexis_icpc_encounter2;
DROP INDEX public.ch_elexis_icpc_encounter1;
DROP INDEX public.ch_elexis_eigendiagnosen_idx1;
DROP INDEX public.block3;
DROP INDEX public.block2;
DROP INDEX public.block1;
DROP INDEX public.bdg1;
DROP INDEX public.bbs1;
DROP INDEX public.bal_i1;
DROP INDEX public.auf1;
DROP INDEX public.art3;
DROP INDEX public.art2;
DROP INDEX public.art1;
DROP INDEX public.aij1;
ALTER TABLE ONLY public.zahlungen DROP CONSTRAINT zahlungen_pkey;
ALTER TABLE ONLY public.xid DROP CONSTRAINT xid_pkey;
ALTER TABLE ONLY public.user_role_joint DROP CONSTRAINT user_role_joint_pkey;
ALTER TABLE ONLY public.user_ DROP CONSTRAINT user__pkey;
ALTER TABLE ONLY public.role_right_joint DROP CONSTRAINT role_right_joint_pkey;
ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
ALTER TABLE ONLY public.right_ DROP CONSTRAINT right__pkey;
ALTER TABLE ONLY public.rezepte DROP CONSTRAINT rezepte_pkey;
ALTER TABLE ONLY public.reminders_responsible_link DROP CONSTRAINT reminders_responsible_link_pkey;
ALTER TABLE ONLY public.reminders DROP CONSTRAINT reminders_pkey;
ALTER TABLE ONLY public.rechnungen DROP CONSTRAINT rechnungen_pkey;
ALTER TABLE ONLY public.patient_artikel_joint DROP CONSTRAINT patient_artikel_joint_pkey;
ALTER TABLE ONLY public.output_log DROP CONSTRAINT output_log_pkey;
ALTER TABLE ONLY public.logs DROP CONSTRAINT logs_pkey;
ALTER TABLE ONLY public.leistungsblock DROP CONSTRAINT leistungsblock_pkey;
ALTER TABLE ONLY public.leistungen DROP CONSTRAINT leistungen_pkey;
ALTER TABLE ONLY public.laborwerte DROP CONSTRAINT laborwerte_pkey;
ALTER TABLE ONLY public.laboritems DROP CONSTRAINT laboritems_pkey;
ALTER TABLE ONLY public.labgroups DROP CONSTRAINT labgroups_pkey;
ALTER TABLE ONLY public.konto DROP CONSTRAINT konto_pkey;
ALTER TABLE ONLY public.kontakt DROP CONSTRAINT kontakt_pkey;
ALTER TABLE ONLY public.kontakt_adress_joint DROP CONSTRAINT kontakt_adress_joint_pkey;
ALTER TABLE ONLY public.icd10 DROP CONSTRAINT icd10_pkey;
ALTER TABLE ONLY public.iatrix_problem_dg_joint DROP CONSTRAINT iatrix_problem_dg_joint_pkey;
ALTER TABLE ONLY public.iatrix_problem_dauermedikation_joint DROP CONSTRAINT iatrix_problem_dauermedikation_joint_pkey;
ALTER TABLE ONLY public.iatrix_problem_behdl_joint DROP CONSTRAINT iatrix_problem_behdl_joint_pkey;
ALTER TABLE ONLY public.heap DROP CONSTRAINT heap_pkey;
ALTER TABLE ONLY public.heap2 DROP CONSTRAINT heap2_pkey;
ALTER TABLE ONLY public.faelle DROP CONSTRAINT faelle_pkey;
ALTER TABLE ONLY public.etiketten DROP CONSTRAINT etiketten_pkey;
ALTER TABLE ONLY public.eigenleistungen DROP CONSTRAINT eigenleistungen_pkey;
ALTER TABLE ONLY public.diagnosen DROP CONSTRAINT diagnosen_pkey;
ALTER TABLE ONLY public.dbimage DROP CONSTRAINT dbimage_pkey;
ALTER TABLE ONLY public.config DROP CONSTRAINT config_pkey;
ALTER TABLE ONLY public.ch_elexis_privatrechnung DROP CONSTRAINT ch_elexis_privatrechnung_pkey;
ALTER TABLE ONLY public.ch_elexis_messages DROP CONSTRAINT ch_elexis_messages_pkey;
ALTER TABLE ONLY public.ch_elexis_icpc DROP CONSTRAINT ch_elexis_icpc_pkey;
ALTER TABLE ONLY public.ch_elexis_eigendiagnosen DROP CONSTRAINT ch_elexis_eigendiagnosen_pkey;
ALTER TABLE ONLY public.ch_elexis_arzttarife_ch_physio DROP CONSTRAINT ch_elexis_arzttarife_ch_physio_pkey;
ALTER TABLE ONLY public.briefe DROP CONSTRAINT briefe_pkey;
ALTER TABLE ONLY public.behdl_dg_joint DROP CONSTRAINT behdl_dg_joint_pkey;
ALTER TABLE ONLY public.behandlungen DROP CONSTRAINT behandlungen_pkey;
ALTER TABLE ONLY public.bbs DROP CONSTRAINT bbs_pkey;
ALTER TABLE ONLY public.auf DROP CONSTRAINT auf_pkey;
ALTER TABLE ONLY public.at_medevit_elexis_loinc DROP CONSTRAINT at_medevit_elexis_loinc_pkey;
ALTER TABLE ONLY public.artikel DROP CONSTRAINT artikel_pkey;
DROP TABLE public.zahlungen;
DROP TABLE public.xid;
DROP TABLE public.vk_preise;
DROP TABLE public.userconfig;
DROP TABLE public.traces;
DROP TABLE public.tarmed_extension;
DROP TABLE public.tarmed_definitionen;
DROP TABLE public.tarmed_daten;
DROP TABLE public.tarmed;
DROP VIEW public.rights_per_user;
DROP TABLE public.user_role_joint;
DROP TABLE public.user_;
DROP VIEW public.rights_per_role;
DROP TABLE public.role_right_joint;
DROP TABLE public.role;
DROP TABLE public.right_;
DROP TABLE public.rezepte;
DROP TABLE public.reminders_responsible_link;
DROP TABLE public.reminders;
DROP TABLE public.rechnungen;
DROP TABLE public.patient_artikel_joint;
DROP TABLE public.output_log;
DROP TABLE public.logs;
DROP TABLE public.leistungsblock;
DROP TABLE public.leistungen;
DROP TABLE public.laborwerte;
DROP TABLE public.laboritems;
DROP TABLE public.labgroups;
DROP TABLE public.labgroup_item_joint;
DROP TABLE public.konto;
DROP TABLE public.kontakt_adress_joint;
DROP TABLE public.kontakt;
DROP TABLE public.icd10;
DROP TABLE public.iatrix_problem_dg_joint;
DROP TABLE public.iatrix_problem_dauermedikation_joint;
DROP TABLE public.iatrix_problem_behdl_joint;
DROP TABLE public.heap2;
DROP TABLE public.heap;
DROP TABLE public.faelle;
DROP TABLE public.etiketten_object_link;
DROP TABLE public.etiketten_objclass_link;
DROP TABLE public.etiketten;
DROP TABLE public.ek_preise;
DROP TABLE public.eigenleistungen;
DROP TABLE public.diagnosen;
DROP TABLE public.dbimage;
DROP TABLE public.config;
DROP TABLE public.ch_elexis_privatrechnung;
DROP TABLE public.ch_elexis_messages;
DROP TABLE public.ch_elexis_icpc_episodes_diagnoses_link;
DROP TABLE public.ch_elexis_icpc_episodes;
DROP TABLE public.ch_elexis_icpc_encounter;
DROP TABLE public.ch_elexis_icpc;
DROP TABLE public.ch_elexis_eigendiagnosen;
DROP TABLE public.ch_elexis_arzttarife_ch_physio;
DROP TABLE public.briefe;
DROP TABLE public.behdl_dg_joint;
DROP TABLE public.behandlungen;
DROP TABLE public.bbs;
DROP TABLE public.auf;
DROP TABLE public.at_medevit_elexis_loinc;
DROP TABLE public.artikel_details;
DROP TABLE public.artikel;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: artikel; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE artikel (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    ean character varying(15),
    subid character varying(20),
    lieferantid character varying(25),
    klasse character varying(80),
    name character varying(127),
    name_intern character varying(127),
    maxbestand character(4),
    minbestand character(4),
    istbestand character(4),
    ek_preis character(8),
    vk_preis character(8),
    typ character varying(15),
    codeclass character varying(10),
    extid character varying(25),
    lastimport character(8),
    validfrom character(8),
    validto character(8),
    atc_code character varying(255),
    extinfo bytea
);


ALTER TABLE public.artikel OWNER TO elexistest;

--
-- Name: artikel_details; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE artikel_details (
    article_id character varying(25),
    notes text,
    image bytea
);


ALTER TABLE public.artikel_details OWNER TO elexistest;

--
-- Name: at_medevit_elexis_loinc; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE at_medevit_elexis_loinc (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    code character varying(128),
    longname text,
    shortname character varying(255),
    class character varying(128),
    unit character varying(128)
);


ALTER TABLE public.at_medevit_elexis_loinc OWNER TO elexistest;

--
-- Name: auf; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE auf (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    patientid character varying(25),
    fallid character varying(25),
    briefid character varying(25),
    prozent character(3),
    datumauz character(8),
    datumvon character(8),
    datumbis character(8),
    grund character varying(50),
    aufzusatz character varying(80)
);


ALTER TABLE public.auf OWNER TO elexistest;

--
-- Name: bbs; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE bbs (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    reference character varying(25),
    topic character varying(80),
    date character(8),
    "time" character(4),
    authorid character varying(25),
    message text
);


ALTER TABLE public.bbs OWNER TO elexistest;

--
-- Name: behandlungen; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE behandlungen (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    fallid character varying(25),
    mandantid character varying(25),
    rechnungsid character varying(25),
    datum character(8),
    diagnosen character varying(25),
    leistungen character varying(25),
    eintrag bytea
);


ALTER TABLE public.behandlungen OWNER TO elexistest;

--
-- Name: behdl_dg_joint; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE behdl_dg_joint (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    behandlungsid character varying(25),
    diagnoseid character varying(25)
);


ALTER TABLE public.behdl_dg_joint OWNER TO elexistest;

--
-- Name: briefe; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE briefe (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    betreff character varying(80),
    datum character(8),
    modifiziert character(8),
    gedruckt character(8),
    geloescht character(2),
    absenderid character varying(25),
    destid character varying(25),
    behandlungsid character varying(25),
    patientid character varying(25),
    typ character varying(30),
    mimetype character varying(80),
    path text
);


ALTER TABLE public.briefe OWNER TO elexistest;

--
-- Name: ch_elexis_arzttarife_ch_physio; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE ch_elexis_arzttarife_ch_physio (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    validfrom character(8),
    validuntil character(8),
    tp character(8),
    ziffer character varying(6),
    titel character varying(255),
    description text
);


ALTER TABLE public.ch_elexis_arzttarife_ch_physio OWNER TO elexistest;

--
-- Name: ch_elexis_eigendiagnosen; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE ch_elexis_eigendiagnosen (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    parent character varying(20),
    code character varying(20),
    title character varying(80),
    comment text,
    extinfo bytea
);


ALTER TABLE public.ch_elexis_eigendiagnosen OWNER TO elexistest;

--
-- Name: ch_elexis_icpc; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE ch_elexis_icpc (
    id character(3) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    component character(2),
    short character varying(80),
    synonyms character varying(250),
    icd10 text,
    txt text,
    criteria text,
    inclusion text,
    exclusion text,
    consider text,
    note text
);


ALTER TABLE public.ch_elexis_icpc OWNER TO elexistest;

--
-- Name: ch_elexis_icpc_encounter; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE ch_elexis_icpc_encounter (
    id character varying(25),
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    kons character varying(25),
    episode character varying(25),
    rfe character(4),
    diag character(4),
    proc character(4),
    extinfo bytea
);


ALTER TABLE public.ch_elexis_icpc_encounter OWNER TO elexistest;

--
-- Name: ch_elexis_icpc_episodes; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE ch_elexis_icpc_episodes (
    id character varying(25),
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    patientid character varying(25),
    title character varying(256),
    startdate character varying(20),
    number character varying(10),
    status character(1) DEFAULT '1'::bpchar,
    extinfo bytea
);


ALTER TABLE public.ch_elexis_icpc_episodes OWNER TO elexistest;

--
-- Name: ch_elexis_icpc_episodes_diagnoses_link; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE ch_elexis_icpc_episodes_diagnoses_link (
    id character varying(25),
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    episode character varying(25),
    diagnosis character varying(80)
);


ALTER TABLE public.ch_elexis_icpc_episodes_diagnoses_link OWNER TO elexistest;

--
-- Name: ch_elexis_messages; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE ch_elexis_messages (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    origin character varying(25),
    destination character varying(25),
    datetime character(14),
    msg text
);


ALTER TABLE public.ch_elexis_messages OWNER TO elexistest;

--
-- Name: ch_elexis_privatrechnung; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE ch_elexis_privatrechnung (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    parent character varying(80),
    name character varying(499),
    short character varying(80),
    cost character(8),
    price character(8),
    "time" character(4),
    subsystem character varying(25),
    valid_from character(8),
    valid_until character(8),
    extinfo bytea
);


ALTER TABLE public.ch_elexis_privatrechnung OWNER TO elexistest;

--
-- Name: config; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE config (
    lastupdate bigint,
    param character varying(80) NOT NULL,
    wert text
);


ALTER TABLE public.config OWNER TO elexistest;

--
-- Name: dbimage; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE dbimage (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    datum character(8),
    prefix character varying(80),
    title character varying(80),
    bild bytea
);


ALTER TABLE public.dbimage OWNER TO elexistest;

--
-- Name: diagnosen; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE diagnosen (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    dg_txt character varying(255),
    dg_code character varying(25),
    klasse character varying(80)
);


ALTER TABLE public.diagnosen OWNER TO elexistest;

--
-- Name: eigenleistungen; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE eigenleistungen (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    code character varying(20),
    bezeichnung character varying(80),
    ek_preis character(6),
    vk_preis character(6),
    zeit character(4)
);


ALTER TABLE public.eigenleistungen OWNER TO elexistest;

--
-- Name: ek_preise; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE ek_preise (
    typ character varying(80),
    id character varying(25),
    lastupdate bigint,
    datum_von character(8),
    datum_bis character(8),
    multiplikator character(8)
);


ALTER TABLE public.ek_preise OWNER TO elexistest;

--
-- Name: etiketten; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE etiketten (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    image character varying(25),
    deleted character(1) DEFAULT '0'::bpchar,
    importance character varying(7),
    name character varying(40),
    foreground character(6),
    background character(6),
    classes character varying(255)
);


ALTER TABLE public.etiketten OWNER TO elexistest;

--
-- Name: etiketten_objclass_link; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE etiketten_objclass_link (
    objclass character varying(80),
    sticker character varying(25)
);


ALTER TABLE public.etiketten_objclass_link OWNER TO elexistest;

--
-- Name: etiketten_object_link; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE etiketten_object_link (
    lastupdate bigint,
    obj character varying(25),
    etikette character varying(25)
);


ALTER TABLE public.etiketten_object_link OWNER TO elexistest;

--
-- Name: faelle; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE faelle (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    patientid character varying(25),
    garantid character varying(25),
    kostentrid character varying(25),
    versnummer character varying(25),
    fallnummer character varying(25),
    betriebsnummer character varying(25),
    diagnosen character varying(80),
    datumvon character(8),
    datumbis character(8),
    bezeichnung character varying(80),
    grund character varying(80),
    gesetz character varying(20),
    status character varying(80),
    extinfo bytea
);


ALTER TABLE public.faelle OWNER TO elexistest;

--
-- Name: heap; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE heap (
    id character varying(80) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    inhalt bytea,
    datum character(8)
);


ALTER TABLE public.heap OWNER TO elexistest;

--
-- Name: heap2; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE heap2 (
    id character varying(80) NOT NULL,
    deleted character(1) DEFAULT '0'::bpchar,
    datum character(8),
    lastupdate bigint,
    contents bytea
);


ALTER TABLE public.heap2 OWNER TO elexistest;

--
-- Name: iatrix_problem_behdl_joint; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE iatrix_problem_behdl_joint (
    id character varying(25) NOT NULL,
    problemid character varying(25),
    behandlungsid character varying(25)
);


ALTER TABLE public.iatrix_problem_behdl_joint OWNER TO elexistest;

--
-- Name: iatrix_problem_dauermedikation_joint; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE iatrix_problem_dauermedikation_joint (
    id character varying(25) NOT NULL,
    problemid character varying(25),
    dauermedikationid character varying(25)
);


ALTER TABLE public.iatrix_problem_dauermedikation_joint OWNER TO elexistest;

--
-- Name: iatrix_problem_dg_joint; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE iatrix_problem_dg_joint (
    id character varying(25) NOT NULL,
    problemid character varying(25),
    diagnoseid character varying(25)
);


ALTER TABLE public.iatrix_problem_dg_joint OWNER TO elexistest;

--
-- Name: icd10; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE icd10 (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    parent character varying(25),
    icdcode character varying(10),
    encoded text,
    icdtxt text,
    extinfo bytea
);


ALTER TABLE public.icd10 OWNER TO elexistest;

--
-- Name: kontakt; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE kontakt (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    istorganisation character(1) DEFAULT '0'::bpchar,
    istperson character(1) DEFAULT '0'::bpchar,
    istpatient character(1) DEFAULT '0'::bpchar,
    istanwender character(1) DEFAULT '0'::bpchar,
    istmandant character(1) DEFAULT '0'::bpchar,
    istlabor character(1) DEFAULT '0'::bpchar,
    land character(3),
    geburtsdatum character(8),
    geschlecht character(1),
    titel character varying(255),
    titelsuffix character varying(255),
    bezeichnung1 character varying(255),
    bezeichnung2 character varying(255),
    bezeichnung3 character varying(255),
    strasse character varying(255),
    plz character varying(6),
    ort character varying(255),
    telefon1 character varying(30),
    telefon2 character varying(30),
    fax character varying(30),
    natelnr character varying(30),
    email character varying(255),
    website character varying(255),
    gruppe character varying(10),
    patientnr character varying(40),
    anschrift text,
    bemerkung text,
    diagnosen bytea,
    persanamnese bytea,
    sysanamnese bytea,
    famanamnese bytea,
    risiken text,
    allergien text,
    extinfo bytea
);


ALTER TABLE public.kontakt OWNER TO elexistest;

--
-- Name: kontakt_adress_joint; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE kontakt_adress_joint (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    myid character varying(25),
    otherid character varying(25),
    bezug character varying(80),
    myrtype character(4),
    otherrtype character(4)
);


ALTER TABLE public.kontakt_adress_joint OWNER TO elexistest;

--
-- Name: konto; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE konto (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    patientid character varying(25),
    rechnungsid character varying(25),
    zahlungsid character varying(25),
    betrag character(8),
    datum character(8),
    bemerkung character varying(80)
);


ALTER TABLE public.konto OWNER TO elexistest;

--
-- Name: labgroup_item_joint; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE labgroup_item_joint (
    lastupdate bigint,
    groupid character varying(25),
    itemid character varying(25),
    comment text
);


ALTER TABLE public.labgroup_item_joint OWNER TO elexistest;

--
-- Name: labgroups; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE labgroups (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    name character varying(30)
);


ALTER TABLE public.labgroups OWNER TO elexistest;

--
-- Name: laboritems; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE laboritems (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    kuerzel character varying(80),
    titel character varying(80),
    laborid character varying(25),
    refmann character varying(256),
    reffrauortx character varying(256),
    einheit character varying(20),
    typ character(1),
    gruppe character varying(25),
    prio character(3),
    billingcode character varying(128),
    export character varying(100),
    loinccode character varying(128),
    visible character varying(1),
    digits character varying(16),
    formula character varying(255)
);


ALTER TABLE public.laboritems OWNER TO elexistest;

--
-- Name: laborwerte; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE laborwerte (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    patientid character varying(25),
    datum character(8),
    zeit character(6),
    itemid character varying(25),
    resultat character varying(255),
    flags character varying(10),
    origin character varying(30),
    unit character varying(255),
    analysetime character varying(24),
    observationtime character varying(24),
    transmissiontime character varying(24),
    refmale character varying(255),
    reffemale character varying(255),
    originid character varying(25),
    kommentar text,
    extinfo bytea
);


ALTER TABLE public.laborwerte OWNER TO elexistest;

--
-- Name: leistungen; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE leistungen (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    behandlung character varying(25),
    leistg_txt character varying(255),
    leistg_code character varying(25),
    klasse character varying(80),
    zahl character(3),
    ek_kosten character(8),
    vk_tp character(8),
    vk_scale character(8),
    vk_preis character(8),
    scale character(4) DEFAULT '100'::bpchar,
    scale2 character(4) DEFAULT '100'::bpchar,
    userid character varying(25),
    detail bytea
);


ALTER TABLE public.leistungen OWNER TO elexistest;

--
-- Name: leistungsblock; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE leistungsblock (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    mandantid character varying(25),
    name character varying(30),
    macro character varying(30),
    leistungen bytea
);


ALTER TABLE public.leistungsblock OWNER TO elexistest;

--
-- Name: logs; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE logs (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    oid character varying(255),
    datum character(8),
    typ character varying(20),
    userid character varying(25),
    station character varying(255),
    extinfo bytea
);


ALTER TABLE public.logs OWNER TO elexistest;

--
-- Name: output_log; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE output_log (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    objectid character varying(25),
    objecttype character varying(80),
    datum character(8),
    outputter character varying(80),
    extinfo bytea
);


ALTER TABLE public.output_log OWNER TO elexistest;

--
-- Name: patient_artikel_joint; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE patient_artikel_joint (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    patientid character varying(25),
    artikelid character varying(25),
    artikel character varying(255),
    rezeptid character varying(25),
    datefrom character(8),
    dateuntil character(8),
    dosis character varying(255),
    anzahl character(3),
    bemerkung character varying(255),
    presctype character(2),
    sortorder character(3),
    prescdate character(8),
    prescriptor character varying(25),
    extinfo bytea
);


ALTER TABLE public.patient_artikel_joint OWNER TO elexistest;

--
-- Name: rechnungen; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE rechnungen (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    rnnummer character varying(8),
    fallid character varying(25),
    mandantid character varying(25),
    rndatum character(8),
    rnstatus character varying(20),
    rndatumvon character(8),
    rndatumbis character(8),
    betrag character(8),
    statusdatum character(8),
    extinfo bytea
);


ALTER TABLE public.rechnungen OWNER TO elexistest;

--
-- Name: reminders; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE reminders (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    identid character varying(25),
    originid character varying(25),
    responsible character varying(25),
    datedue character(8),
    status character varying(1),
    typ character varying(1),
    params text,
    message text
);


ALTER TABLE public.reminders OWNER TO elexistest;

--
-- Name: reminders_responsible_link; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE reminders_responsible_link (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    reminderid character varying(25),
    responsibleid character varying(25)
);


ALTER TABLE public.reminders_responsible_link OWNER TO elexistest;

--
-- Name: rezepte; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE rezepte (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    patientid character varying(25),
    mandantid character varying(25),
    briefid character varying(25),
    datum character(8),
    rptxt text,
    rpzusatz character varying(80)
);


ALTER TABLE public.rezepte OWNER TO elexistest;

--
-- Name: right_; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE right_ (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    log_execution character(1),
    name character varying(256),
    parentid character varying(25),
    i18n_name character varying(256)
);


ALTER TABLE public.right_ OWNER TO elexistest;

--
-- Name: role; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE role (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    extinfo bytea,
    issystemrole character(1) DEFAULT '0'::bpchar
);


ALTER TABLE public.role OWNER TO elexistest;

--
-- Name: role_right_joint; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE role_right_joint (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT NULL::bpchar,
    role_id character varying(25) NOT NULL
);


ALTER TABLE public.role_right_joint OWNER TO elexistest;

--
-- Name: rights_per_role; Type: VIEW; Schema: public; Owner: elexistest
--

CREATE VIEW rights_per_role AS
 SELECT r.id AS role_id,
    ri.id AS right_id
   FROM ((role r
   LEFT JOIN role_right_joint rrj ON (((r.id)::text = (rrj.role_id)::text)))
   LEFT JOIN right_ ri ON (((rrj.id)::text = (ri.id)::text)))
  ORDER BY r.id;


ALTER TABLE public.rights_per_role OWNER TO elexistest;

--
-- Name: user_; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE user_ (
    id character varying(25) NOT NULL,
    deleted character(1) DEFAULT '0'::bpchar,
    kontakt_id character varying(25),
    lastupdate bigint,
    hashed_password character varying(64),
    salt character varying(64),
    is_active character(1) DEFAULT '1'::bpchar,
    is_administrator character(1) DEFAULT '0'::bpchar,
    keystore text,
    extinfo bytea
);


ALTER TABLE public.user_ OWNER TO elexistest;

--
-- Name: user_role_joint; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE user_role_joint (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT NULL::bpchar,
    user_id character varying(25) NOT NULL
);


ALTER TABLE public.user_role_joint OWNER TO elexistest;

--
-- Name: rights_per_user; Type: VIEW; Schema: public; Owner: elexistest
--

CREATE VIEW rights_per_user AS
 SELECT u.id AS user_id,
    ri.id AS right_id,
    ri.name AS right_name
   FROM ((((user_ u
   LEFT JOIN user_role_joint urj ON (((u.id)::text = (urj.user_id)::text)))
   LEFT JOIN role r ON (((urj.id)::text = (r.id)::text)))
   LEFT JOIN role_right_joint rrj ON (((r.id)::text = (rrj.role_id)::text)))
   LEFT JOIN right_ ri ON (((rrj.id)::text = (ri.id)::text)))
  ORDER BY u.id;


ALTER TABLE public.rights_per_user OWNER TO elexistest;

--
-- Name: tarmed; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE tarmed (
    id character varying(25),
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    parent character varying(14),
    digniquanti character(5),
    digniquali character(4),
    sparte character(4),
    gueltigvon character(8),
    gueltigbis character(8),
    nickname character varying(25),
    tx255 character varying(255),
    code character varying(25)
);


ALTER TABLE public.tarmed OWNER TO elexistest;

--
-- Name: tarmed_daten; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE tarmed_daten (
    parameter character varying(80),
    datumvon character(8),
    datumbis character(8),
    wert character varying(10)
);


ALTER TABLE public.tarmed_daten OWNER TO elexistest;

--
-- Name: tarmed_definitionen; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE tarmed_definitionen (
    spalte character varying(20),
    kuerzel character varying(5),
    titel character varying(255)
);


ALTER TABLE public.tarmed_definitionen OWNER TO elexistest;

--
-- Name: tarmed_extension; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE tarmed_extension (
    code character varying(25),
    limits bytea,
    med_interpret text,
    tech_interpret text
);


ALTER TABLE public.tarmed_extension OWNER TO elexistest;

--
-- Name: traces; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE traces (
    logtime bigint,
    workstation character varying(40),
    username character varying(30),
    action text
);


ALTER TABLE public.traces OWNER TO elexistest;

--
-- Name: userconfig; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE userconfig (
    lastupdate bigint,
    userid character varying(25),
    param character varying(80),
    value text
);


ALTER TABLE public.userconfig OWNER TO elexistest;

--
-- Name: vk_preise; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE vk_preise (
    typ character varying(80),
    id character varying(25),
    lastupdate bigint,
    datum_von character(8),
    datum_bis character(8),
    multiplikator character(8)
);


ALTER TABLE public.vk_preise OWNER TO elexistest;

--
-- Name: xid; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE xid (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    type character varying(80),
    object character varying(25),
    domain character varying(255),
    domain_id character varying(255),
    quality character(1) DEFAULT '0'::bpchar
);


ALTER TABLE public.xid OWNER TO elexistest;

--
-- Name: zahlungen; Type: TABLE; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE TABLE zahlungen (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    rechnungsid character varying(25),
    betrag character(8),
    datum character(8),
    bemerkung character varying(80)
);


ALTER TABLE public.zahlungen OWNER TO elexistest;

--
-- Data for Name: artikel; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY artikel (id, lastupdate, deleted, ean, subid, lieferantid, klasse, name, name_intern, maxbestand, minbestand, istbestand, ek_preis, vk_preis, typ, codeclass, extid, lastimport, validfrom, validto, atc_code, extinfo) FROM stdin;
\.


--
-- Data for Name: artikel_details; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY artikel_details (article_id, notes, image) FROM stdin;
\.


--
-- Data for Name: at_medevit_elexis_loinc; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY at_medevit_elexis_loinc (id, lastupdate, deleted, code, longname, shortname, class, unit) FROM stdin;
VERSION	\N	0	1.0.0	\N	\N	\N	\N
Cde1abfb822c149b50182	1461310407445	0	2885-2	Protein [Mass/volume] in Serum or Plasma	Prot SerPl-mCnc	CHEM	\N
Hbbd641c862ae32490140	1461310401225	0	14682-9	Creatinine [Moles/volume] in Serum or Plasma	Creat SerPl-sCnc	CHEM	\N
TOP2000VERSION	1461310976109	0	1.1.0	\N	\N	\N	\N
Lb3e17ef066545cbd0198	1461310409762	0	48643-1	Glomerular filtration rate/1.73 sq M predicted among blacks by Creatinine-based formula (MDRD)	GFR/BSA pred.black SerPl MDRD-ArVRat	CHEM	\N
i8baca317086ccf190158	1461310404037	0	786-4	Erythrocyte mean corpuscular hemoglobin concentration [Mass/volume] by Automated count	MCHC RBC Auto-mCnc	HEM/BC	\N
vb46b800906faff750172	1461310405929	0	787-2	Erythrocyte mean corpuscular volume [Entitic volume] by Automated count	MCV RBC Auto	HEM/BC	\N
Ub3a8f7e62db4c8990142	1461310401637	0	718-7	Hemoglobin [Mass/volume] in Blood	Hgb Bld-mCnc	HEM/BC	\N
aad1f6b0c05e035b60160	1461310404278	0	785-6	Erythrocyte mean corpuscular hemoglobin [Entitic mass] by Automated count	MCH RBC Qn Auto	HEM/BC	\N
Md58c2ec0df7df34c0144	1461310401962	0	2823-3	Potassium [Moles/volume] in Serum or Plasma	Potassium SerPl-sCnc	CHEM	\N
te0d2478556758da60204	1461310410587	0	26464-8	Leukocytes [#/volume] in Blood	WBC # Bld	HEM/BC	\N
U9572ea0da2c687e20192	1461310408987	0	704-7	Basophils [#/volume] in Blood by Automated count	Basophils # Bld Auto	HEM/BC	\N
Fc9d047fee5ac548c0184	1461310407687	0	6768-6	Alkaline phosphatase [Enzymatic activity/volume] in Serum or Plasma	ALP SerPl-cCnc	CHEM	\N
ne5124e4d2d69428e0174	1461310406220	0	777-3	Platelets [#/volume] in Blood by Automated count	Platelet # Bld Auto	HEM/BC	\N
K7c2a25ff05ca6e070146	1461310402245	0	14749-6	Glucose [Moles/volume] in Serum or Plasma	Glucose SerPl-sCnc	CHEM	\N
dd659187f327e490b0162	1461310404537	0	2000-8	Calcium [Moles/volume] in Serum or Plasma	Calcium SerPl-sCnc	CHEM	\N
Lbbb8557f7f59f8a00148	1461310402628	0	2951-2	Sodium [Moles/volume] in Serum or Plasma	Sodium SerPl-sCnc	CHEM	\N
g6c634d1d86f8d8030164	1461310404870	0	15074-8	Glucose [Moles/volume] in Blood	Glucose Bld-sCnc	CHEM	\N
qd3cb9d3ee59387290150	1461310402928	0	3094-0	Urea nitrogen [Mass/volume] in Serum or Plasma	BUN SerPl-mCnc	CHEM	\N
Q96234d6c0a32ad440176	1461310406487	0	1920-8	Aspartate aminotransferase [Enzymatic activity/volume] in Serum or Plasma	AST SerPl-cCnc	CHEM	\N
edeea3e27db24463c0152	1461310403186	0	2028-9	"Carbon dioxide	 total [Moles/volume] in Serum or Plasma"	CO2 SerPl-sCnc	\N
Ta7b1fe6ca6c6c78c0186	1461310408087	0	788-0	Erythrocyte distribution width [Ratio] by Automated count	RDW RBC Auto-Rto	HEM/BC	\N
jd1ccb47a1d1ad2820166	1461310405162	0	4544-3	Hematocrit [Volume Fraction] of Blood by Automated count	Hct VFr Bld Auto	HEM/BC	\N
tbecc9952dd0c10f50154	1461310403511	0	2075-0	Chloride [Moles/volume] in Serum or Plasma	Chloride SerPl-sCnc	CHEM	\N
qc04b0354553adb8b0200	1461310409995	0	26515-7	Platelets [#/volume] in Blood	Platelet # Bld	HEM/BC	\N
Yb0f45c048d043c3c0178	1461310406787	0	1751-7	Albumin [Mass/volume] in Serum or Plasma	Albumin SerPl-mCnc	CHEM	\N
la48d3cde1d5395950168	1461310405420	0	6690-2	Leukocytes [#/volume] in Blood by Automated count	WBC # Bld Auto	HEM/BC	\N
ud15db9afed826ffb0156	1461310403745	0	789-8	Erythrocytes [#/volume] in Blood by Automated count	RBC # Bld Auto	HEM/BC	\N
M8659687364dd9ebd0194	1461310409270	0	20570-8	Hematocrit [Volume Fraction] of Blood	Hct VFr Bld	HEM/BC	\N
B97cf608405bf120d0188	1461310408362	0	770-8	Neutrophils/100 leukocytes in Blood by Automated count	Neutrophils NFr Bld Auto	HEM/BC	\N
xd8a1175d0b804c9e0170	1461310405654	0	1742-6	Alanine aminotransferase [Enzymatic activity/volume] in Serum or Plasma	ALT SerPl-cCnc	CHEM	\N
Ea54f54f1c3d3bb0a0180	1461310407120	0	14631-6	Bilirubin.total [Moles/volume] in Serum or Plasma	Bilirub SerPl-sCnc	CHEM	\N
b6d672958d197ca9a0223	1461310415538	0	706-2	Basophils/100 leukocytes in Blood by Automated count	Basophils NFr Bld Auto	HEM/BC	\N
cb73676207f7ad7d30221	1461310415187	0	736-9	Lymphocytes/100 leukocytes in Blood by Automated count	Lymphocytes NFr Bld Auto	HEM/BC	\N
ac6ead646c362e5fb0210	1461310412968	0	14927-8	Triglyceride [Moles/volume] in Serum or Plasma	Trigl SerPl-sCnc	CHEM	\N
u6d4584f905e278810206	1461310410921	0	30428-7	Erythrocyte mean corpuscular volume [Entitic volume]	MCV RBC	HEM/BC	\N
K76c4c943fb8f15a60196	1461310409512	0	48642-3	Glomerular filtration rate/1.73 sq M predicted among non-blacks by Creatinine-based formula (MDRD)	GFR/BSA pred.non black SerPl MDRD-ArVRat	CHEM	\N
Hbd0b298fc81495360190	1461310408687	0	33914-3	Glomerular filtration rate/1.73 sq M.predicted by Creatinine-based formula (MDRD)	GFR/BSA.pred SerPl MDRD-ArVRat	CHEM	\N
e981b567eddca2ea50202	1461310410237	0	14647-2	Cholesterol [Moles/volume] in Serum or Plasma	Cholest SerPl-sCnc	CHEM	\N
hac445552a29d57aa0215	1461310414062	0	14646-4	Cholesterol in HDL [Moles/volume] in Serum or Plasma	HDLc SerPl-sCnc	CHEM	\N
i72ea754016619f400208	1461310411246	0	731-0	Lymphocytes [#/volume] in Blood by Automated count	Lymphocytes # Bld Auto	HEM/BC	\N
ybd61f9df48130d7c0219	1461310414871	0	26485-3	Monocytes/100 leukocytes in Blood	Monocytes NFr Bld	HEM/BC	\N
d769525df7bc416e30212	1461310413837	0	10466-1	Anion gap 3 in Serum or Plasma	Anion Gap3 SerPl-sCnc	CHEM	\N
Ab23e129b62149bb20227	1461310416196	0	5905-5	Monocytes/100 leukocytes in Blood by Automated count	Monocytes NFr Bld Auto	HEM/BC	\N
ka0855f4191cffe790217	1461310414454	0	6463-4	Bacteria identified in Unspecified specimen by Culture	Bacteria XXX Cult	MICRO	\N
Wd9b2afaee452da990229	1461310416579	0	26478-8	Lymphocytes/100 leukocytes in Blood	Lymphocytes NFr Bld	HEM/BC	\N
mb89dc9d9b9d490fe0225	1461310415880	0	713-8	Eosinophils/100 leukocytes in Blood by Automated count	Eosinophil NFr Bld Auto	HEM/BC	\N
D8f5372f2c839f4ed0231	1461310416971	0	751-8	Neutrophils [#/volume] in Blood by Automated count	Neutrophils # Bld Auto	HEM/BC	\N
Rb3c5cf98af54c3920233	1461310417346	0	5902-2	Prothrombin time (PT) in Platelet poor plasma by Coagulation assay	PT Time PPP	COAG	\N
Vd5d89f3e509489f90235	1461310417629	0	33069-6	Fetal Neck.soft tissue Translucency width US	Fet Width.translucency US.meas	OB.US	\N
Gb7fc2d2bfd84b91e0237	1461310417930	0	26450-7	Eosinophils/100 leukocytes in Blood	Eosinophil NFr Bld	HEM/BC	\N
Z99978b38259a9fe60239	1461310418238	0	711-2	Eosinophils [#/volume] in Blood by Automated count	Eosinophil # Bld Auto	HEM/BC	\N
bc579cb311be681270273	1461310424133	0	26449-9	Eosinophils [#/volume] in Blood	Eosinophil # Bld	HEM/BC	\N
nb9a776df697a1bfc03324	1461310868665	0	30525-0	Age	Age	MISC	\N
pe22c2cffe442e9ac0259	1461310421880	0	1759-0	Albumin/Globulin [Mass ratio] in Serum or Plasma	Albumin/Glob SerPl-mRto	CHEM	\N
N979c2e596381aa7f0241	1461310418638	0	22637-3	Pathology report final diagnosis Narrative	Path report.final Dx Spec	TUMRRGT	\N
Vd898531f91ba76280285	1461310425830	0	22705-8	Glucose [Moles/volume] in Urine by Test strip	Glucose Ur Strip-sCnc	UA	\N
Ja2d8d1f7d633e4ca0243	1461310419038	0	742-7	Monocytes [#/volume] in Blood by Automated count	Monocytes # Bld Auto	HEM/BC	\N
cc210b4651f5d50cb0321	1461310431464	0	32309-7	Cholesterol.total/Cholesterol in HDL [Molar ratio] in Serum or Plasma	Cholest/HDLc SerPl-sRto	CHEM	\N
s75dbd95da24e1ca70261	1461310422204	0	26484-6	Monocytes [#/volume] in Blood	Monocytes # Bld	HEM/BC	\N
md0d49db703a9e3a00275	1461310424497	0	66126-4	Cholesterol in VLDL [Moles/volume] in Serum or Plasma by calculation	VLDLc SerPl Calc-sCnc	CHEM	\N
I79aca4f2a0d113b10245	1461310419788	0	6301-6	INR in Platelet poor plasma by Coagulation assay	INR PPP	COAG	\N
I7988a0cfbd71f4ee0295	1461310427330	0	2601-3	Magnesium [Moles/volume] in Serum or Plasma	Magnesium SerPl-sCnc	CHEM	\N
f9d4d57647d75ab220263	1461310422471	0	10834-0	Globulin [Mass/volume] in Serum by calculation	Globulin Ser Calc-mCnc	CHEM	\N
Oc5dbbd6fa87bb87b0247	1461310420147	0	30180-4	Basophils/100 leukocytes in Blood	Basophils NFr Bld	HEM/BC	\N
Ge50ab5ea4128a95b0287	1461310426063	0	5804-0	Protein [Mass/volume] in Urine by Test strip	Prot Ur Strip-mCnc	UA	\N
A78e5eb0e6e5eda7d0277	1461310424730	0	14879-1	Phosphate [Moles/volume] in Serum or Plasma	Phosphate SerPl-sCnc	CHEM	\N
P7665d5a9b3dd6b170249	1461310420463	0	3097-3	Urea nitrogen/Creatinine [Mass ratio] in Serum or Plasma	BUN/Creat SerPl-mRto	CHEM	\N
hd7abb74efa8ad6230265	1461310422746	0	39469-2	Cholesterol in LDL [Moles/volume] in Serum or Plasma by calculation	LDLc SerPl Calc-sCnc	CHEM	\N
pe648bee8220164420309	1461310429364	0	47527-7	Cytology report of Cervical or vaginal smear or scraping Cyto stain.thin prep	Cytology Cvx/Vag Doc Thin Prep	CYTO	\N
wa8604f2c5863161d0251	1461310420788	0	5802-4	Nitrite [Presence] in Urine by Test strip	Nitrite Ur Ql Strip	UA	\N
rc34b2cdf6807d3770303	1461310428605	0	14629-0	Bilirubin.direct [Moles/volume] in Serum or Plasma	Bilirub Direct SerPl-sCnc	CHEM	\N
kb535f3c3d15e99480267	1461310423030	0	5770-3	Bilirubin.total [Presence] in Urine by Test strip	Bilirub Ur Ql Strip	UA	\N
r70f48025290084e00253	1461310421054	0	26499-4	Neutrophils [#/volume] in Blood	Neutrophils # Bld	HEM/BC	\N
Wacd78253c8e985940279	1461310425021	0	26474-7	Lymphocytes [#/volume] in Blood	Lymphocytes # Bld	HEM/BC	\N
Z81f3cfeb848c98330289	1461310426305	0	11579-0	Thyrotropin [Units/volume] in Serum or Plasma by Detection limit <= 0.05 mIU/L	TSH SerPl DL<=0.05 mIU/L-aCnc	CHEM	\N
z9dc34726decffbe90255	1461310421330	0	5778-6	Color of Urine	Color Ur	SPEC	\N
y76037d7494bfc82e0269	1461310423380	0	5799-2	Leukocyte esterase [Presence] in Urine by Test strip	Leukocyte esterase Ur Ql Strip	UA	\N
O6bf1c63add99f33e0297	1461310427638	0	5821-4	Leukocytes [#/area] in Urine sediment by Microscopy high power field	WBC #/area UrnS HPF	UA	\N
o880ee74d4428168c0257	1461310421613	0	5803-2	pH of Urine by Test strip	pH Ur Strip	UA	\N
D9d60dacc0419fc350281	1461310425313	0	5811-5	Specific gravity of Urine by Test strip	Sp Gr Ur Strip	UA	\N
c99b60f654e4406920271	1461310423738	0	5767-9	Appearance of Urine	Appearance Ur	SPEC	\N
N9945be6e7fe0ab2a0291	1461310426605	0	26511-6	Neutrophils/100 leukocytes in Blood	Neutrophils NFr Bld	HEM/BC	\N
ha956a3324a0604c70315	1461310430414	0	22636-5	Pathology report relevant history Narrative	Path report.relevant Hx Spec	TUMRRGT	\N
Rb45d9748d02f3f1a0283	1461310425547	0	5794-3	Hemoglobin [Presence] in Urine by Test strip	Hgb Ur Ql Strip	UA	\N
z7e470b8f59ed72950305	1461310428888	0	2336-6	Globulin [Mass/volume] in Serum	Globulin Ser-mCnc	CHEM	\N
P81c263bb72e3664c0299	1461310427963	0	22702-5	Ketones [Moles/volume] in Urine by Test strip	Ketones Ur Strip-sCnc	UA	\N
J6f0b9836fd1576590293	1461310426897	0	3173-2	Activated partial thromboplastin time (aPTT) in Blood by Coagulation assay	aPTT Time Bld	COAG	\N
sba6e350aa4f7d39d0311	1461310429647	0	11557-6	Carbon dioxide [Partial pressure] in Blood	pCO2 Bld	CHEM	\N
D9333bffcc0dcade50331	1461310433072	0	11558-4	pH of Blood	pH Bld	CHEM	\N
w77cd4f3f990c01130301	1461310428305	0	4548-4	Hemoglobin A1c/Hemoglobin.total in Blood	Hgb A1c MFr Bld	HEM/BC	\N
yb8108685c12062150319	1461310431055	0	2157-6	Creatine kinase [Enzymatic activity/volume] in Serum or Plasma	CK SerPl-cCnc	CHEM	\N
oabea494be3ae29320307	1461310429138	0	11555-0	Base excess in Blood	Base excess Bld-sCnc	CHEM	\N
Abcb4e08f49fdd0790327	1461310432480	0	2713-6	Oxygen saturation Calculated from oxygen partial pressure in Blood	SaO2 % Bld from pO2	CHEM	\N
k7087dfe1b3f143460317	1461310430722	0	5769-5	Bacteria [#/area] in Urine sediment by Microscopy high power field	Bacteria #/area UrnS HPF	UA	\N
f6e8e1fc189e9f2430313	1461310429986	0	11556-8	Oxygen [Partial pressure] in Blood	pO2 Bld	CHEM	\N
bdb4418175fac17680323	1461310431871	0	22748-8	Cholesterol in LDL [Moles/volume] in Serum or Plasma	LDLc SerPl-sCnc	CHEM	\N
m8e745d24f457b99d0325	1461310432230	0	630-4	Bacteria identified in Urine by Culture	Bacteria Ur Cult	MICRO	\N
Rad98934de047ed350333	1461310433388	0	22639-9	Pathology report supplemental reports Narrative	Path report.supplemental reports Spec	TUMRRGT	\N
W9f48ad4f68b09f800329	1461310432788	0	22638-1	Pathology report comments Narrative	Path report.comments Imp Spec	TUMRRGT	\N
V7b22f4e1fd714bf00335	1461310433689	0	20454-5	Protein [Presence] in Urine by Test strip	Prot Ur Ql Strip	UA	\N
G73e1207c6af7c2980337	1461310433955	0	13945-1	Erythrocytes [#/area] in Urine sediment by Microscopy high power field	RBC #/area UrnS HPF	UA	\N
Z980c253232aac9c90339	1461310434264	0	738-5	Macrocytes [Presence] in Blood by Light microscopy	Macrocytes Bld Ql Smear	HEM/BC	\N
Nd960913e35ba708c0341	1461310434588	0	2514-8	Ketones [Presence] in Urine by Test strip	Ketones Ur Ql Strip	CHEM	\N
J67c866415ec593440343	1461310434914	0	741-9	Microcytes [Presence] in Blood by Light microscopy	Microcytes Bld Ql Smear	HEM/BC	\N
Iaf3755629ea456090345	1461310435289	0	19146-0	Reference lab test results	Ref Lab Test Results	MISC	\N
w8cea8bc695ada6110401	1461310443548	0	6742-1	Erythrocyte morphology finding [Identifier] in Blood	RBC morph Bld	HEM/BC	\N
Od3a936b1c5435c2b0397	1461310442806	0	1994-3	Calcium.ionized [Moles/volume] in Blood	Ca-I Bld-sCnc	CHEM	\N
ta0106f9e1c19b41d0404	1461310443923	0	14920-3	Thyroxine (T4) free [Moles/volume] in Serum or Plasma	T4 Free SerPl-sCnc	CHEM	\N
Ocfba43ed83e8a48b0347	1461310435647	0	3016-3	Thyrotropin [Units/volume] in Serum or Plasma	TSH SerPl-aCnc	CHEM	\N
f83b1d96cea2efbe60363	1461310437805	0	10839-9	Troponin I.cardiac [Mass/volume] in Serum or Plasma	Troponin I SerPl-mCnc	CHEM	\N
a89e6f82afb7c85110410	1461310444673	0	764-1	Neutrophils.band form/100 leukocytes in Blood by Manual count	Neuts Band NFr Bld Manual	HEM/BC	\N
A94d82cd3ee6b278b0377	1461310439847	0	1959-6	Bicarbonate [Moles/volume] in Blood	HCO3 Bld-sCnc	CHEM	\N
P97db17967df4def40349	1461310435930	0	6298-4	Potassium [Moles/volume] in Blood	Potassium Bld-sCnc	CHEM	\N
Z7d34bd88b565a9340389	1461310441556	0	20409-9	Erythrocytes [#/volume] in Urine by Test strip	RBC # Ur Strip	UA	\N
he6563acfb17ac6e10365	1461310438114	0	19773-1	Recommended follow-up [Identifier] in Cervical or vaginal smear or scraping by Cyto stain	Recom F/U Cvx/Vag Cyto	CYTO	\N
j8c0e6cc09edc4a240416	1461310445398	0	3040-3	Lipase [Enzymatic activity/volume] in Serum or Plasma	Lipase SerPl-cCnc	CHEM	\N
w8c99c9f0ea4065e50351	1461310436197	0	34927-4	Urobilinogen [Moles/volume] in Urine	Urobilinogen Ur-sCnc	CHEM	\N
z73909c9f5163db3301055	1461310536895	0	1863-0	Anion gap 4 in Serum or Plasma	Anion Gap4 SerPl-sCnc	CHEM	\N
ua0f3348fac3772dc0406	1461310444215	0	5818-0	Urobilinogen [Presence] in Urine by Test strip	Urobilinogen Ur Ql Strip	CHEM	\N
W74694a935ce25ef50379	1461310440172	0	26444-0	Basophils [#/volume] in Blood	Basophils # Bld	HEM/BC	\N
rd15bc5e54a5dc11c0353	1461310436530	0	19764-0	Statement of adequacy [interpretation] of Cervical or vaginal smear or scraping by Cyto stain	Stat of Adq Cvx/Vag Cyto-Imp	CYTO	\N
k68fb7843da43e19f0367	1461310438413	0	19769-9	Pathologist who read Cyto stain of Cervical or vaginal smear or scraping	Pathologist Cvx/Vag Cyto	CYTO	\N
d7cba74dcd3b2243c0412	1461310444889	0	4537-7	Erythrocyte sedimentation rate by Westergren method	ESR Bld Qn Westrgrn	HEM/BC	\N
P7b84c8240f2267730399	1461310443098	0	600-7	Bacteria identified in Blood by Culture	Bacteria Bld Cult	MICRO	\N
zcd528ab5119733c60355	1461310436814	0	19767-3	Cytologist who read Cyto stain of Cervical or vaginal smear or scraping	Cytologist Cvx/Vag Cyto	CYTO	\N
Nc85886eb5bba8c0f0391	1461310441831	0	14635-7	Calcidiol [Moles/volume] in Serum or Plasma	25(OH)D3 SerPl-sCnc	CHEM	\N
yc7573ad1ae32ac320369	1461310438714	0	2349-9	Glucose [Presence] in Urine	Glucose Ur Ql	CHEM	\N
idb966e913626c5fe0408	1461310444456	0	44915-7	Cholesterol in LDL/Cholesterol in HDL [Molar ratio] in Serum or Plasma	LDLc/HDLc SerPl-sRto	CHEM	\N
obafa9935baf11e790357	1461310437063	0	19763-2	Specimen source [Identifier] in Cervical or vaginal smear or scraping by Cyto stain	Specimen source Cvx/Vag Cyto	CYTO	\N
D8e5beb2ecfd149b00381	1461310440447	0	2965-2	Specific gravity of Urine	Sp Gr Ur	CHEM	\N
E6ae8dc764b2c93850430	1461310448360	0	13317-3	Methicillin resistant Staphylococcus aureus [Presence] in Unspecified specimen by Organism specific culture	MRSA XXX Ql Cult	MICRO	\N
pe173a7a5e6c801760359	1461310437322	0	13969-1	Creatine kinase.MB [Mass/volume] in Serum or Plasma	CK MB SerPl-mCnc	CHEM	\N
Y99ce8e811d2e57670428	1461310447871	0	14921-1	Thyroxine (T4) [Moles/volume] in Serum or Plasma	T4 SerPl-sCnc	CHEM	\N
cdc9e82b68ffcb7250371	1461310439056	0	34928-2	Urobilinogen [Moles/volume] in Urine by Test strip	Urobilinogen Ur Strip-sCnc	UA	\N
l703fd6a6fecab92e0418	1461310445623	0	14798-3	Iron [Moles/volume] in Serum or Plasma	Iron SerPl-sCnc	CHEM	\N
s8e931dd57e2ed4810361	1461310437539	0	18314-5	Morphology [interpretation] in Blood Narrative	Morphology Bld-Imp	HEM/BC	\N
gcb64a17718f8a75b0414	1461310445148	0	8310-5	Body temperature	Body temperature	BDYTMP.ATOM	\N
Rdd5d91a50b7fec520383	1461310440764	0	23658-8	Other Antibiotic [Susceptibility]	Other Antibiotic Susc Islt	ABXBACT	\N
b896ad349d40875bc0373	1461310439355	0	33037-3	Anion gap in Serum or Plasma	Anion Gap SerPl-sCnc	CHEM	\N
vc07b9a7abd9232d30422	1461310446381	0	14933-6	Urate [Moles/volume] in Serum or Plasma	Urate SerPl-sCnc	CHEM	\N
Jc8e5c878d3f38b3b0393	1461310442281	0	8247-9	Mucus [Presence] in Urine sediment by Light microscopy	Mucous Threads UrnS Ql Micro	UA	\N
md200a7139ce10c920375	1461310439630	0	728-6	Hypochromia [Presence] in Blood by Light microscopy	Hypochromia Bld Ql Smear	HEM/BC	\N
Va9fd357ece59ab1c0385	1461310441039	0	2857-1	Prostate specific Ag [Mass/volume] in Serum or Plasma	PSA SerPl-mCnc	CHEM	\N
Q9e5bd54fa395cfff0426	1461310446948	0	925-8	Blood product disposition [Type]	Bld Prod Disposition BPU	BLDBK	\N
xbe2d99a02631708b0420	1461310446006	0	9317-9	Platelet adequacy [Presence] in Blood by Light microscopy	Platelet Bld Ql Smear	HEM/BC	\N
Ib3d6818bbf59457b0395	1461310442564	0	2947-0	Sodium [Moles/volume] in Blood	Sodium Bld-sCnc	CHEM	\N
n6b45205eaebb61940424	1461310446657	0	20565-8	"Carbon dioxide	 total [Moles/volume] in Blood"	CO2 Bld-sCnc	\N
Gba0e677986677a150387	1461310441314	0	14630-8	Bilirubin.indirect [Moles/volume] in Serum or Plasma	Bilirub Indirect SerPl-sCnc	CHEM	\N
Cccfc631f8ea045e40432	1461310448664	0	14979-9	Activated partial thromboplastin time (aPTT) in Platelet poor plasma by Coagulation assay	aPTT Time PPP	COAG	\N
Te75895f84474373f0436	1461310449207	0	32623-1	Platelet mean volume [Entitic volume] in Blood by Automated count	PMV Bld Auto	HEM/BC	\N
Fb264fa4c2808bc720434	1461310448948	0	11277-1	Epithelial cells.squamous [#/area] in Urine sediment by Microscopy high power field	Squamous #/area UrnS HPF	UA	\N
B8133f65e3ab4a2370438	1461310449473	0	14685-2	Cobalamin (Vitamin B12) [Moles/volume] in Serum or Plasma	Vit B12 SerPl-sCnc	CHEM	\N
H9215205d821be12b0440	1461310449832	0	20453-7	Epithelial cells [Presence] in Urine sediment by Light microscopy	Epi Cells UrnS Ql Micro	UA	\N
Ue1b49d828066e01c0442	1461310450115	0	1798-8	Amylase [Enzymatic activity/volume] in Serum or Plasma	Amylase SerPl-cCnc	CHEM	\N
Mb98e8480000f12f20444	1461310450448	0	2276-4	Ferritin [Mass/volume] in Serum or Plasma	Ferritin SerPl-mCnc	CHEM	\N
Ka38c495dcd6321800446	1461310450698	0	1988-5	C reactive protein [Mass/volume] in Serum or Plasma	CRP SerPl-mCnc	CHEM	\N
Lcf8055bf8db6a4b50448	1461310451073	0	5808-1	Erythrocytes [#/volume] in Urine sediment by Microscopy high power field	RBC # UrnS HPF	UA	\N
uba12ca4fcf97401c0806	1461310503968	0	14771-0	Fasting glucose [Moles/volume] in Serum or Plasma	Glucose p fast SerPl-sCnc	CHAL	\N
j9172bad774214ae30466	1461310453423	0	31100-1	Hematocrit [Volume Fraction] of Blood by Impedance	Hct VFr Bld Imped	HEM/BC	\N
qace468f3a31733690450	1461310451324	0	2532-0	Lactate dehydrogenase [Enzymatic activity/volume] in Serum or Plasma	LDH SerPl-cCnc	CHEM	\N
Ed8242074708d88540480	1461310455215	0	70199-5	Bilirubin.total [Moles/volume] in Urine	Bilirub Ur-sCnc	CHEM	\N
l9839d002eb36fd4f0518	1461310460040	0	2324-2	Gamma glutamyl transferase [Enzymatic activity/volume] in Serum or Plasma	GGT SerPl-cCnc	CHEM	\N
ea36bc093866f760f0452	1461310451615	0	14800-7	Iron binding capacity [Moles/volume] in Serum or Plasma	TIBC SerPl-sCnc	CHEM	\N
le1ca95b1044952420468	1461310453715	0	11580-8	Thyrotropin [Units/volume] in Serum or Plasma by Detection limit <= 0.005 mIU/L	TSH SerPl DL<=0.005 mIU/L-aCnc	CHEM	\N
qbd66cfdeb08ccdce0500	1461310457857	0	14732-2	Folate [Moles/volume] in Serum or Plasma	Folate SerPl-sCnc	CHEM	\N
Uce8069303e53d2460492	1461310456707	0	26508-2	Neutrophils.band form/100 leukocytes in Blood	Neuts Band NFr Bld	HEM/BC	\N
tb61a0865ac4729080454	1461310451832	0	5782-8	Crystals [type] in Urine sediment by Light microscopy	Crystals UrnS Micro	UA	\N
C83e9a80ec3282b4c0482	1461310455432	0	30167-1	Human papilloma virus 16+18+31+33+35+39+45+51+52+56+58+59+68 DNA [Presence] in Cervix by Probe and signal amplification method	HPV I/H Risk 1 DNA Cervix Ql bDNA	MICRO	\N
xd5b8b0981338e0eb0470	1461310453924	0	5787-7	Epithelial cells [#/area] in Urine sediment by Microscopy high power field	Epi Cells #/area UrnS HPF	UA	\N
uc1b012c4bcedec670456	1461310452074	0	21000-5	Erythrocyte distribution width [Entitic volume] by Automated count	RDW RBC Auto	HEM/BC	\N
v6f59c7ce5b0d2c030522	1461310460482	0	14801-5	Iron saturation [Molar fraction] in Serum or Plasma	Iron Satn SFr SerPl	CHEM	\N
gd971d50d9de0eb050514	1461310459549	0	30313-1	Hemoglobin [Mass/volume] in Arterial blood	Hgb BldA-mCnc	HEM/BC	\N
i705f58b07adc1b7f0458	1461310452448	0	2753-2	pH of Serum or Plasma	pH SerPl	CHEM	\N
vc7d0bb90ed29703b0472	1461310454206	0	735-1	Lymphocytes Variant/100 leukocytes in Blood by Manual count	Variant Lymphs NFr Bld Manual	HEM/BC	\N
F7781b15ec741f63b0484	1461310455623	0	20507-0	Reagin Ab [Presence] in Serum by RPR	RPR Ser Ql	MICRO	\N
a69d542da738fb1fc0460	1461310452723	0	14683-7	Creatinine [Moles/volume] in Urine	Creat Ur-sCnc	CHEM	\N
i8418499292b5e5d50508	1461310458898	0	933-2	Blood product type	Bld Prod Typ BPU	BLDBK	\N
M82667dc0790841930494	1461310456957	0	24111-7	Neisseria gonorrhoeae DNA [Presence] in Unspecified specimen by Probe and target amplification method	N gonorrhoea DNA XXX Ql PCR	MICRO	\N
n87df2f6aacad2af40474	1461310454507	0	934-0	Blood product unit ID [#]	BPU ID	BLDBK	\N
db7cf387b2776ad040462	1461310452923	0	20408-1	Leukocytes [#/volume] in Urine by Test strip	WBC # Ur Strip	UA	\N
T9c47ef49cb4afdcf0486	1461310455890	0	3151-8	Inhaled oxygen flow rate	Inhaled O2 flow rate	CLIN	\N
gcc8878e40bd83feb0464	1461310453182	0	27045-4	Microscopic exam [interpretation] of Urine by Cytology	Microscopic Ur-Imp	CYTO	\N
Qbb16d5bceb27220a0476	1461310454731	0	882-1	ABO and Rh group [Type] in Blood	ABO+Rh Gp Bld	BLDBK	\N
ecdcce4367890251d0502	1461310458057	0	1995-0	Calcium.ionized [Moles/volume] in Serum or Plasma	Ca-I SerPl-sCnc	CHEM	\N
Kb7a3c0d7014760640496	1461310457215	0	11279-7	Urine sediment comments by Light microscopy Narrative	UrnS Cmnt Micro	UA	\N
B9462ff2b0c01d46e0488	1461310456232	0	14957-5	Microalbumin [Mass/volume] in Urine	Microalbumin Ur-mCnc	CHEM	\N
Y7acf19eb4a022cf10478	1461310454957	0	19161-9	Urobilinogen [Units/volume] in Urine by Test strip	Urobilinogen Ur Strip-aCnc	UA	\N
Ye2965c1f861af4eb0528	1461310461182	0	3879-4	Opiates [Presence] in Urine	Opiates Ur Ql	DRUG/TOX	\N
Q9137ad290fd792030526	1461310460940	0	664-3	Microscopic observation [Identifier] in Unspecified specimen by Gram stain	Gram Stn XXX	MICRO	\N
H70ec69424676f7610490	1461310456432	0	58448-2	Microalbumin ug/min [Mass/time] in 24 hour Urine	Microalbumin ug/min 24H Ur-mRate	CHEM	\N
t9fa3e157663440570504	1461310458282	0	11282-1	Cells Counted Total [#] in Blood	Total Cells Counted Bld	HEM/BC	\N
L946808ddc3dc7f940498	1461310457590	0	21613-5	Chlamydia trachomatis DNA [Presence] in Unspecified specimen by Probe and target amplification method	C trach DNA XXX Ql PCR	MICRO	\N
a794d13f0313714cc0510	1461310459132	0	737-7	Lymphocytes/100 leukocytes in Blood by Manual count	Lymphocytes NFr Bld Manual	HEM/BC	\N
x7041866c81331ca70520	1461310460207	0	25162-9	Hyaline casts [Presence] in Urine sediment by Light microscopy	Hyaline Casts UrnS Ql Micro	UA	\N
jce38cd1362512a7f0516	1461310459799	0	10378-8	Polychromasia [Presence] in Blood by Light microscopy	Polychromasia Bld Ql Smear	HEM/BC	\N
u89946ecc785c2b670506	1461310458549	0	2106-3	Choriogonadotropin (pregnancy test) [Presence] in Urine	HCG Preg Ur Ql	CHEM	\N
dd7b8edf3ca6538260512	1461310459367	0	2744-1	pH of Arterial blood	pH BldA	CHEM	\N
nc8dde2b840e7f6a90524	1461310460724	0	2703-7	Oxygen [Partial pressure] in Arterial blood	pO2 BldA	CHEM	\N
Ce4bfa535277792f90532	1461310461774	0	53553-4	Glucose mean value [Moles/volume] in Blood Estimated from glycated hemoglobin	Est. average glucose Bld gHb Est-sCnc	CHEM	\N
Eaa10252c53d497e30530	1461310461474	0	3390-2	Benzodiazepines [Presence] in Urine	Benzodiaz Ur Ql	DRUG/TOX	\N
Tc17b3272064f90f90536	1461310462282	0	26507-4	Neutrophils.band form [#/volume] in Blood	Neuts Band # Bld	HEM/BC	\N
F958e126708f7f5aa0534	1461310461990	0	890-4	Blood group antibody screen [Presence] in Serum or Plasma	Bld gp Ab Scn SerPl Ql	BLDBK	\N
Bc9541cb0d6be1faf0538	1461310462607	0	3050-2	Triiodothyronine resin uptake (T3RU) in Serum or Plasma	T3RU NFr SerPl	CHEM	\N
H84e9c0f4bf4c82830540	1461310462984	0	30405-5	Leukocytes [#/volume] in Urine	WBC # Ur	UA	\N
U94f838d0bdeed8bb0542	1461310463349	0	48345-3	HIV 1+O+2 Ab [Presence] in Serum or Plasma	HIV 1+O+2 Ab SerPl Ql	MICRO	\N
M760fdf2e86ba3b6c0544	1461310463690	0	14913-8	Testosterone [Moles/volume] in Serum or Plasma	Testost SerPl-sCnc	CHEM	\N
K77f130d4ac82ae5f0546	1461310463958	0	30934-4	Natriuretic peptide B [Mass/volume] in Serum or Plasma	BNP SerPl-mCnc	CHEM	\N
Ld9ec748eda8b21270548	1461310464199	0	2019-8	Carbon dioxide [Partial pressure] in Arterial blood	pCO2 BldA	CHEM	\N
j99ebbbe8bb508e680566	1461310467049	0	3349-8	Amphetamines [Presence] in Urine	Amphetamines Ur Ql	DRUG/TOX	\N
Uc57c10412dfc75710592	1461310471499	0	1003-3	Indirect antiglobulin test.complement specific reagent [Presence] in Serum or Plasma	IAT Comp-Sp Reag SerPl Ql	BLDBK	\N
q6df62b9fb58e6c400550	1461310464457	0	34714-6	INR in Blood by Coagulation assay	INR Bld	COAG	\N
A78fda01a0638d3a50627	1461310477100	0	774-0	Ovalocytes [Presence] in Blood by Light microscopy	Ovalocytes Bld Ql Smear	HEM/BC	\N
l9e555034128465680568	1461310467391	0	17856-6	Hemoglobin A1c/Hemoglobin.total in Blood by HPLC	Hgb A1c MFr Bld HPLC	HEM/BC	\N
ec94149c7aa07c3350552	1461310464783	0	3377-9	Barbiturates [Presence] in Urine	Barbiturates Ur Ql	DRUG/TOX	\N
Cc455833eb0d64ae60582	1461310470008	0	32215-6	Thyroxine (T4) free index in Serum or Plasma	FT4I SerPl-aCnc	CHEM	\N
ecf8bc832f9416eaf0602	1461310473183	0	53927-0	Neisseria gonorrhoeae rRNA [Presence] in Urethra by Probe and target amplification method	N gonorrhoea rRNA Urth Ql PCR	MICRO	\N
tb250357c89ed3a250554	1461310465107	0	8061-4	Nuclear Ab [Presence] in Serum	ANA Ser Ql	SERO	\N
xc2effa3db47fcc1b0570	1461310467838	0	11253-2	Tacrolimus [Mass/volume] in Blood	Tacrolimus Bld-mCnc	DRUG/TOX	\N
Mb63fcc58c95dbfe20594	1461310471808	0	769-0	Neutrophils.segmented/100 leukocytes in Blood by Manual count	Neuts Seg NFr Bld Manual	HEM/BC	\N
ua98d908b8906acaf0556	1461310465432	0	11529-5	Surgical pathology study		ATTACH.CLINRPT	\N
Fbe69ea1bc12f19f20584	1461310470283	0	14930-2	Triiodothyronine (T3) [Moles/volume] in Serum or Plasma	T3 SerPl-sCnc	CHEM	\N
vdf741d29055fda020572	1461310468458	0	33903-6	Ketones [Presence] in Urine	Ketones Ur Ql	CHEM	\N
i9a9dc7a9d4a45b6d0558	1461310465808	0	5196-1	Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Immunoassay	HBV surface Ag SerPl Ql EIA	MICRO	\N
c88be69608724d2fd0621	1461310476158	0	2731-8	Parathyrin.intact [Mass/volume] in Serum or Plasma	PTH-Intact SerPl-mCnc	CHEM	\N
s894b9eddad4a59500611	1461310474558	0	19145-2	Reference lab test name	Ref Lab Test Name	MISC	\N
a79ba6b8f9baa7dfa0560	1461310466165	0	49136-5	Creatine kinase.MB/Creatine kinase.total [Ratio] in Serum or Plasma	CK MB SerPl-Rto	CHEM	\N
nd5948961c762bfe60574	1461310468799	0	883-9	ABO group [Type] in Blood	ABO Group Bld	BLDBK	\N
Tbbca73101c9918980586	1461310470574	0	18282-4	Cannabinoids [Presence] in Urine by Screen method	Cannabinoids Ur Ql Scn	DRUG/TOX	\N
dc988509e1a939cde0562	1461310466458	0	14959-1	Microalbumin/Creatinine [Mass ratio] in Urine	Microalbumin/Creat Ur-mRto	CHEM	\N
K87caa64da1227af60596	1461310472033	0	714-6	Eosinophils/100 leukocytes in Blood by Manual count	Eosinophil NFr Bld Manual	HEM/BC	\N
Q950c152efc07d2540576	1461310469099	0	25371-6	Cholesterol in VLDL [Moles/volume] in Serum or Plasma	VLDLc SerPl-sCnc	CHEM	\N
gc2f97722d0c53b790564	1461310466791	0	48346-1	HIV 1+O+2 Ab [Units/volume] in Serum or Plasma	HIV 1+O+2 Ab SerPl-aCnc	MICRO	\N
z6d25d57c8248a5290605	1461310473708	0	60256-5	Neisseria gonorrhoeae rRNA [Presence] in Urine by Probe and target amplification method	N gonorrhoea rRNA Ur Ql PCR	MICRO	\N
Bd4c15343700267bd0588	1461310470850	0	744-3	Monocytes/100 leukocytes in Blood by Manual count	Monocytes NFr Bld Manual	HEM/BC	\N
Yd42dfc54a399c1700578	1461310469424	0	2458-8	IgA [Mass/volume] in Serum or Plasma	IgA SerPl-mCnc	CHEM	\N
k6ddce6e15bace1a10617	1461310475583	0	5198-7	Hepatitis C virus Ab [Units/volume] in Serum by Immunoassay	HCV Ab Ser EIA-aCnc	MICRO	\N
Lcca761e8e336c5b30598	1461310472316	0	15067-2	Follitropin [Units/volume] in Serum or Plasma	FSH SerPl-aCnc	CHEM	\N
H88c5ce66cb15e6660590	1461310471124	0	5195-3	Hepatitis B virus surface Ag [Presence] in Serum	HBV surface Ag Ser Ql	MICRO	\N
Eaf8a08f7bea38bf20580	1461310469749	0	22753-8	Iron binding capacity.unsaturated [Moles/volume] in Serum or Plasma	UIBC SerPl-sCnc	CHEM	\N
ob3b409222c140f8a0607	1461310474025	0	702-1	Anisocytosis [Presence] in Blood by Light microscopy	Anisocytosis Bld Ql Smear	HEM/BC	\N
mcb8bccc175bc60740625	1461310476783	0	53925-4	Chlamydia trachomatis rRNA [Presence] in Urethra by Probe and target amplification method	C trach rRNA Urth Ql PCR	MICRO	\N
qb442db5ff9703ca30600	1461310472822	0	14715-7	Estradiol (E2) [Moles/volume] in Serum or Plasma	Estradiol SerPl-sCnc	CHEM	\N
fd9da3329d6c617fe0613	1461310474866	0	29265-6	Calcium [Moles/volume] corrected for albumin in Serum or Plasma	Calcium Album cor SerPl-sCnc	CHEM	\N
pc40d9ead30194e480609	1461310474283	0	707-0	Basophils/100 leukocytes in Blood by Manual count	Basophils NFr Bld Manual	HEM/BC	\N
yaf0b3dfe492ecc040619	1461310475858	0	14866-8	Parathyrin.intact [Moles/volume] in Serum or Plasma	PTH-Intact SerPl-sCnc	CHEM	\N
hddb4dad0586fc70c0615	1461310475225	0	5796-8	Hyaline casts [#/area] in Urine sediment by Microscopy low power field	Hyaline Casts #/area UrnS LPF	UA	\N
V80d1c975e6fbeaf50635	1461310478333	0	1250-0	Major crossmatch [interpretation]	Maj XM SerPl-Imp	BLDBK	\N
bbce5e824a2b42e100623	1461310476500	0	2465-3	IgG [Mass/volume] in Serum or Plasma	IgG SerPl-mCnc	CHEM	\N
Wbc158ebd0033425d0629	1461310477350	0	12454-5	Urate crystals amorphous [Presence] in Urine sediment by Light microscopy	Amorph Urate Cry UrnS Ql Micro	UA	\N
D8d64dc45d6e5ad680631	1461310477641	0	30341-2	Erythrocyte sedimentation rate	ESR Bld Qn	HEM/BC	\N
Gd0e96c3c5049a94f0637	1461310478650	0	22634-0	Pathology report gross observation Narrative	Path report.gross Spec	TUMRRGT	\N
R87209ff1c0b7a40e0633	1461310477983	0	798-9	Erythrocytes [#/volume] in Urine by Automated count	RBC # Ur Auto	UA	\N
Za17a54622ee4cc1d0639	1461310478916	0	69419-0	Cholesterol in LDL [Moles/volume] in Serum or Plasma by Direct assay	LDLc SerPl Direct Assay-sCnc	CHEM	\N
Ncc78e264622807150641	1461310479175	0	56598-6	Epstein Barr virus early IgM Ab [Units/volume] in Serum by Immunoassay	EBV EA IgM Ser EIA-aCnc	MICRO	\N
J7f023036308b1a0d0643	1461310479449	0	11572-5	Rheumatoid factor [Units/volume] in Serum or Plasma	Rheumatoid fact SerPl-aCnc	SERO	\N
I724b7c8a53fcb50a0645	1461310479725	0	19080-1	Choriogonadotropin [Units/volume] in Serum or Plasma	HCG SerPl-aCnc	CHEM	\N
Odbfadfbfa4b0083a0647	1461310479966	0	18998-5	Trimethoprim+Sulfamethoxazole [Susceptibility]	TMP SMX Susc Islt	ABXBACT	\N
Pceca47c8de0a2f150649	1461310480175	0	43304-5	Chlamydia trachomatis rRNA [Presence] in Unspecified specimen by Probe and target amplification method	C trach rRNA XXX Ql PCR	MICRO	\N
i7a9acd1e1c449af901658	1461310623728	0	20512-0	Turbidity of Cerebral spinal fluid Qualitative	Turbidity CSF Ql	SPEC	\N
od13e6d1e9428ddb20707	1461310487917	0	59826-8	Creatinine [Moles/volume] in Blood	Creat Bld-sCnc	CHEM	\N
fde53143eb3edf2170713	1461310488775	0	15198-5	Macrocytes [Presence] in Blood by Automated count	Macrocytes Bld Ql Auto	HEM/BC	\N
Da9441bd701b8ce970681	1461310484459	0	6462-6	Bacteria identified in Wound by Culture	Bacteria Wnd Cult	MICRO	\N
w9f75bcaa0f684a7d0651	1461310480433	0	10331-7	Rh [Type] in Blood	Rh Bld	BLDBK	\N
kb3262197eaf3c20c0667	1461310482667	0	2472-9	IgM [Mass/volume] in Serum or Plasma	IgM SerPl-mCnc	CHEM	\N
r8115ec667d063d780653	1461310480708	0	43305-2	Neisseria gonorrhoeae rRNA [Presence] in Unspecified specimen by Probe and target amplification method	N gonorrhoea rRNA XXX Ql PCR	MICRO	\N
Jc8da7ffb2133460f0693	1461310485617	0	634-6	Bacteria identified in Unspecified specimen by Aerobe culture	Bacteria XXX Aerobe Cult	MICRO	\N
yd53e17e42afebcd30669	1461310482825	0	31208-2	Specimen source [Identifier] of Unspecified specimen	Specimen source XXX	SPEC	\N
z6f27ffb6e5829c2b0655	1461310480983	0	10701-1	Ova and parasites identified in Stool by Concentration	O+P Stl Conc	MICRO	\N
wdce1c96b6afe25730701	1461310486967	0	51656-7	Hepatitis C virus Ab Signal/Cutoff in Body fluid	HCV Ab s/co Fld	MICRO	\N
Raaf922726b0d81e00683	1461310484642	0	10501-5	Lutropin [Units/volume] in Serum or Plasma	LH SerPl-aCnc	CHEM	\N
oa2a3b5da32576f1b0657	1461310481291	0	13362-9	Collection duration of Urine	Collect duration Time Ur	SPEC	\N
cce74bc7f17cb4c3e0671	1461310483017	0	18928-2	Gentamicin [Susceptibility]	Gentamicin Susc Islt	ABXBACT	\N
Dc84a5234a0e100040731	1461310491501	0	2069-3	Chloride [Moles/volume] in Blood	Chloride Bld-sCnc	CHEM	\N
Wda4ae167719d0d280729	1461310491126	0	9842-6	Casts [#/area] in Urine sediment by Microscopy low power field	Casts #/area UrnS LPF	UA	\N
pbaa0c909d7bc05e10659	1461310481558	0	11125-2	Platelet morphology finding [Identifier] in Blood	Plat morph Bld	HEM/BC	\N
Ibba32c85fb2ae1660695	1461310485884	0	50387-0	Chlamydia trachomatis rRNA [Presence] in Cervix by Probe and target amplification method	C trach rRNA Cervix Ql PCR	MICRO	\N
Vda073ce05e30d0f30685	1461310484817	0	19244-3	Character of Urine	Character Ur	SPEC	\N
be36e3d13bc35ff560673	1461310483492	0	14807-2	Lead [Moles/volume] in Blood	Lead Bld-sCnc	DRUG/TOX	\N
s702c9a8f430c60d70661	1461310481858	0	15180-3	Hypochromia [Presence] in Blood by Automated count	Hypochromia Bld Ql Auto	HEM/BC	\N
p829023cc91030c690709	1461310488192	0	15150-6	Anisocytosis [Presence] in Blood by Automated count	Anisocytosis Bld Ql Auto	HEM/BC	\N
fa0112788e7048bad0663	1461310482134	0	12258-0	Epithelial cells.squamous [Presence] in Urine sediment by Light microscopy	Squamous UrnS Ql Micro	UA	\N
mb7f804943a4bc1a10675	1461310483775	0	3255-7	Fibrinogen [Mass/volume] in Platelet poor plasma by Coagulation assay	Fibrinogen PPP-mCnc	COAG	\N
rc2ce526ece8ad0290703	1461310487259	0	4679-7	Reticulocytes/100 erythrocytes in Blood	Retics/100 RBC NFr	HEM/BC	\N
Gb6d57cb3ba97f83f0687	1461310485000	0	19659-2	Phencyclidine [Presence] in Urine by Screen method	PCP Ur Ql Scn	DRUG/TOX	\N
hac6e445b90eeaead0665	1461310482350	0	22633-2	Pathology report site of origin Narrative	Path report.site of origin Spec	TUMRRGT	\N
A6e04a6ee72b3ec8c0677	1461310483992	0	3184-9	Activated clotting time in Blood by Coagulation assay	ACT Time Bld	COAG	\N
O984674760e8024140697	1461310486192	0	50388-8	Neisseria gonorrhoeae rRNA [Presence] in Cervix by Probe and target amplification method	N gonorrhoea rRNA Cervix Ql PCR	MICRO	\N
ya4127017c9a3b6d20719	1461310489542	0	70204-3	Cholesterol non HDL [Moles/volume] in Serum or Plasma	NonHDLc SerPl-sCnc	CHEM	\N
Z75ed8e4fd5f49fd00689	1461310485217	0	14928-6	Triiodothyronine (T3) Free [Moles/volume] in Serum or Plasma	T3Free SerPl-sCnc	CHEM	\N
W812115c63481db660679	1461310484283	0	19139-5	Pathologist name	Pathologist name	CLIN	\N
hcea340cc868438e50715	1461310489034	0	33051-4	Erythrocytes [Presence] in Urine	RBC Ur Ql	UA	\N
Pc90c097cb53dab230699	1461310486626	0	35691-5	XXX microorganism DNA [Presence] in Unspecified specimen by Probe and target amplification method	Other microorganism DNA XXX Ql PCR	MICRO	\N
N6c1d9d6297d7b6ba0691	1461310485384	0	624-7	Bacteria identified in Sputum by Respiratory culture	Bacteria Spt Resp Cult	MICRO	\N
zcb09dfe4bfa7f2fe0705	1461310487592	0	22635-7	Pathology report microscopic observation Narrative Other stain	Path report.microscopic Spec Other Stn	TUMRRGT	\N
s852f0df8e8a983160711	1461310488459	0	14338-8	Prealbumin [Mass/volume] in Serum or Plasma	Prealb SerPl-mCnc	CHEM	\N
ba2be6e44a18f84da0723	1461310490109	0	6598-7	Troponin T.cardiac [Mass/volume] in Serum or Plasma	Troponin T SerPl-mCnc	CHEM	\N
cb59e87718aa12de20721	1461310489809	0	2842-3	Prolactin [Mass/volume] in Serum or Plasma	Prolactin SerPl-mCnc	CHEM	\N
k7c294bc25c1997e50717	1461310489301	0	6299-2	Urea nitrogen [Mass/volume] in Blood	BUN Bld-mCnc	CHEM	\N
A909b7c3253bff26f0727	1461310490759	0	3393-6	Benzoylecgonine [Presence] in Urine	BZE Ur Ql	DRUG/TOX	\N
Rd74471de5c51e2910733	1461310491834	0	5334-8	Rubella virus IgG Ab [Units/volume] in Serum by Immunoassay	RUBV IgG Ser EIA-aCnc	MICRO	\N
me202b019708f2b9e0725	1461310490434	0	2888-6	Protein [Mass/volume] in Urine	Prot Ur-mCnc	UA	\N
Ge299fb77813d67bb0737	1461310492476	0	42931-6	Chlamydia trachomatis rRNA [Presence] in Urine by Probe and target amplification method	C trach rRNA Ur Ql PCR	MICRO	\N
Vb7a42797fcafa1450735	1461310492159	0	20569-0	Creatine kinase.MB/Creatine kinase.total in Serum or Plasma	CK MB CFr SerPl	CHEM	\N
Zb958bac26943a6730739	1461310492800	0	15199-3	Microcytes [Presence] in Blood by Automated count	Microcytes Bld Ql Auto	HEM/BC	\N
Nb32a637b4054d13d0741	1461310493201	0	20629-2	Levofloxacin [Susceptibility]	Levofloxacin Susc Islt	ABXBACT	\N
Jb21e5950a25e47700743	1461310493718	0	3397-7	Cocaine [Presence] in Urine	Cocaine Ur Ql	DRUG/TOX	\N
I6d31e1e4b5c825aa0745	1461310494017	0	779-9	Poikilocytosis [Presence] in Blood by Light microscopy	Poikilocytosis Bld Ql Smear	HEM/BC	\N
O79f3e8372e74f07b0747	1461310494351	0	35591-7	Creatinine renal clearance predicted by Cockcroft-Gault formula	Creat Cl predicted SerPl C-G-vRate	CHEM	\N
Pdec50a0c1ce097350749	1461310494626	0	32356-8	Yeast [Presence] in Urine sediment by Light microscopy	Yeast UrnS Ql Micro	UA	\N
Nd07b3faf6229f4e80791	1461310501476	0	14914-6	Testosterone Free [Moles/volume] in Serum or Plasma	Testost Free SerPl-sCnc	CHEM	\N
k9b054c9f0d9137d00767	1461310497584	0	2862-1	Albumin [Mass/volume] in Serum or Plasma by Electrophoresis	Albumin SerPl Elph-mCnc	CHEM	\N
rdf50493923540a0d0803	1461310503396	0	18864-9	Ampicillin [Susceptibility]	Ampicillin Susc Islt	ABXBACT	\N
wb9f4eaf6fd546a640751	1461310494976	0	18878-9	Cefazolin [Susceptibility]	Cefazolin Susc Islt	ABXBACT	\N
ic2434be3139d021f0808	1461310504301	0	635-3	Bacteria identified in Unspecified specimen by Anaerobe culture	Bacteria XXX Anaerobe Cult	MICRO	\N
E969215a7ceaafe9a01230	1461310563922	0	13503-8	Borrelia burgdorferi Ab.IgM band pattern [interpretation] in Serum by Immunoblot (IB)	B burgdor IgM Patrn Ser IB-Imp	MICRO	\N
D8bd56895b7940ea30781	1461310499985	0	28541-1	Metamyelocytes/100 leukocytes in Blood	Metamyelocytes NFr Bld	HEM/BC	\N
r711dd21b8e6e54c10753	1461310495368	0	740-1	Metamyelocytes/100 leukocytes in Blood by Manual count	Metamyelocytes NFr Bld Manual	HEM/BC	\N
Qc0cc0e10b8eb9a9c0826	1461310507160	0	46744-9	Organic acidemias newborn screen interpretation	OA DBS-Imp	CHEM	\N
yaa9ec12fa72f5aeb0769	1461310497868	0	2871-2	Beta globulin [Mass/volume] in Serum or Plasma by Electrophoresis	B-Globulin SerPl Elph-mCnc	CHEM	\N
ga21c2651fefd5dfd0814	1461310505310	0	18955-5	Nitrofurantoin [Susceptibility]	Nitrofurantoin Susc Islt	ABXBACT	\N
z873f8cdd321b5f3a0755	1461310495693	0	12851-2	Protein Fractions [interpretation] in Serum or Plasma by Electrophoresis	Prot Pattern SerPl Elph-Imp	CHEM	\N
abc18382508e96cce0810	1461310504651	0	547-0	Streptococcus.beta-hemolytic [Presence] in Unspecified specimen by Organism specific culture	B-Hem Strep XXX Ql Cult	MICRO	\N
Jc459355e61f457cc0793	1461310501793	0	58413-6	Nucleated erythrocytes/100 leukocytes [Ratio] in Blood by Automated count	nRBC/100 WBC Bld Auto-Rto	HEM/BC	\N
cb43c3e8048d9618e0771	1461310498151	0	2865-4	Alpha 1 globulin [Mass/volume] in Serum or Plasma by Electrophoresis	Alpha1 Glob SerPl Elph-mCnc	CHEM	\N
oa73a9bd9bc2f9e010757	1461310495992	0	31147-2	Reagin Ab [Titer] in Serum by RPR	RPR Ser-Titr	MICRO	\N
R7284fe69837b3d550783	1461310500293	0	3936-2	Phencyclidine [Presence] in Urine	PCP Ur Ql	DRUG/TOX	\N
T80d573141cc0db8a0836	1461310508868	0	763-3	Neutrophils.band form [#/volume] in Blood by Manual count	Neuts Band # Bld Manual	HEM/BC	\N
wc8ca62216b35c2fb0801	1461310502960	0	18865-6	Ampicillin+Sulbactam [Susceptibility]	Ampicillin+Sulbac Susc Islt	ABXBACT	\N
pa36ca78db3d179160759	1461310496301	0	25428-4	Glucose [Presence] in Urine by Test strip	Glucose Ur Ql Strip	UA	\N
xc1acfac2fb58ee3e0820	1461310506293	0	12235-8	Microscopic observation [Identifier] in Urine sediment by Light microscopy	Micro UrnS	UA	\N
bd4c1d77e433c78af0773	1461310498493	0	2868-8	Alpha 2 globulin [Mass/volume] in Serum or Plasma by Electrophoresis	Alpha2 Glob SerPl Elph-mCnc	CHEM	\N
dcfbfc99053657b3a0812	1461310504960	0	5194-6	Hepatitis B virus surface Ab [Units/volume] in Serum by Radioimmunoassay (RIA)	HBV surface Ab Ser RIA-aCnc	MICRO	\N
sa24f3bfe43e41be40761	1461310496618	0	1960-4	Bicarbonate [Moles/volume] in Arterial blood	HCO3 BldA-sCnc	CHEM	\N
Vdb049f443133182c0785	1461310500568	0	48159-8	Hepatitis C virus Ab Signal/Cutoff in Serum or Plasma by Immunoassay	HCV Ab s/co SerPl EIA	MICRO	\N
j9b42b7fb9f7344e90816	1461310505627	0	18481-2	Streptococcus pyogenes Ag [Presence] in Throat	S pyo Ag Throat Ql	MICRO	\N
m67da891746f95f230775	1461310498901	0	18906-8	Ciprofloxacin [Susceptibility]	Ciprofloxacin Susc Islt	ABXBACT	\N
f6b19ccc02bdcf6b30763	1461310496968	0	2111-3	Choriogonadotropin.beta subunit [Moles/volume] in Serum or Plasma	B-HCG SerPl-sCnc	CHEM	\N
Ia4254a3cf6b0c25a0795	1461310502103	0	36903-3	Chlamydia trachomatis+Neisseria gonorrhoeae DNA [Identifier] in Unspecified specimen by Probe and target amplification method	C trach+GC DNA XXX PCR	MICRO	\N
nda1a775a541bdfc00824	1461310506943	0	14675-3	Cortisol [Moles/volume] in Serum or Plasma	Cortis SerPl-sCnc	CHEM	\N
hc488022b3e36f15c0765	1461310497293	0	2039-6	Carcinoembryonic Ag [Mass/volume] in Serum or Plasma	CEA SerPl-mCnc	CHEM	\N
A774d35cc9b79a18d0777	1461310499259	0	14890-8	Progesterone [Moles/volume] in Serum or Plasma	Progest SerPl-sCnc	CHEM	\N
Cc1d6e774b04d26c10832	1461310508431	0	5048-4	Nuclear Ab [Titer] in Serum by Immunofluorescence	ANA Titr Ser IF	SERO	\N
Gd9cf49d368d447150787	1461310500801	0	2874-6	Gamma globulin [Mass/volume] in Serum or Plasma by Electrophoresis	Gamma glob SerPl Elph-mCnc	CHEM	\N
vc1d2db3a114e5d1a0822	1461310506576	0	7791-7	Dacrocytes [Presence] in Blood by Light microscopy	Dacryocytes Bld Ql Smear	HEM/BC	\N
l95f64b8e0f6cc7a80818	1461310505935	0	14754-6	Glucose [Moles/volume] in Serum or Plasma --1 hour post 50 g glucose PO	Glucose 1h p 50 g Glc PO SerPl-sCnc	CHAL	\N
W92dcea27d0dce8290779	1461310499651	0	13950-1	Hepatitis A virus IgM Ab [Presence] in Serum or Plasma by Immunoassay	HAV IgM SerPl Ql EIA	MICRO	\N
E88f5a9df5c1cf0510830	1461310507806	0	8099-4	Thyroperoxidase Ab [Units/volume] in Serum or Plasma	Thyroperoxidase Ab SerPl-aCnc	SERO	\N
Y7d249bbadfbe09830828	1461310507469	0	14611-8	Nuclear Ab pattern [interpretation] in Serum	ANA Pat Ser-Imp	SERO	\N
Ob9806b4f40bc954a0797	1461310502385	0	580-1	Fungus identified in Unspecified specimen by Culture	Fungus XXX Cult	MICRO	\N
Zd7c9b44f3f5a8e2d0789	1461310501126	0	31201-7	HIV 1+2 Ab [Presence] in Serum or Plasma by Immunoassay	HIV1+2 Ab SerPl Ql EIA	MICRO	\N
B866c253b76aa8ee10838	1461310509077	0	30522-7	C reactive protein [Mass/volume] in Serum or Plasma by High sensitivity method	CRP SerPl HS-mCnc	CHEM	\N
F8f5a89a4bd9dc0b60834	1461310508677	0	2524-7	Lactate [Moles/volume] in Serum or Plasma	Lactate SerPl-sCnc	CHEM	\N
P93f2d273305814460799	1461310502660	0	2692-2	Osmolality of Serum or Plasma	Osmolality SerPl	CHEM	\N
Hce357814965e16130840	1461310509277	0	11156-7	Leukocyte morphology finding [Identifier] in Blood	WBC morph Bld	HEM/BC	\N
Ub7641a1da4d3314d0842	1461310509468	0	19000-9	Vancomycin [Susceptibility]	Vancomycin Susc Islt	ABXBACT	\N
Mba87d942948f7c970844	1461310509677	0	2335-8	Hemoglobin.gastrointestinal [Presence] in Stool	Hemoccult Stl Ql	CHEM	\N
K9717b2777b778c020846	1461310509902	0	6824-7	Color of Body fluid	Color Fld	SPEC	\N
L8b95aa763386c6e40848	1461310510127	0	24113-3	Hepatitis B virus core IgM Ab [Presence] in Serum or Plasma by Immunoassay	HBV core IgM SerPl Ql EIA	MICRO	\N
qd6bd6de65432d64e0850	1461310510377	0	14578-9	ABO group [Type] in Blood from Blood product unit	ABO Group Bld BPU	BLDBK	\N
P77c1c74667247c0602649	1461310774909	0	9660-2	HIV 1 gp160 Ab [Presence] in Serum by Immunoblot (IB)	HIV1 gp160 Ab Ser Ql IB	MICRO	\N
v695e5f19bacb00bf0922	1461310520069	0	1925-7	Base excess in Arterial blood	Base excess BldA-sCnc	CHEM	\N
C8217294e8380414f0882	1461310514686	0	11031-2	Lymphocytes/100 leukocytes in Body fluid	Lymphocytes NFr Fld	HEM/BC	\N
la1806843862186860868	1461310512368	0	800-3	Schistocytes [Presence] in Blood by Light microscopy	Schistocytes Bld Ql Smear	HEM/BC	\N
ebd4eb8d822c9ed4c0852	1461310510568	0	14907-0	Rh [Type] in Blood from Blood product unit	Rh Bld BPU	BLDBK	\N
M8576ecc8deb4542b0894	1461310516044	0	13655-6	Leukocytes [Presence] in Stool by Light microscopy	WBC Stl Ql Micro	HEM/BC	\N
td12488a9e66c2c8d0854	1461310510785	0	14877-5	Phenytoin [Moles/volume] in Serum or Plasma	Phenytoin SerPl-sCnc	DRUG/TOX	\N
xe3ef053665a935950870	1461310512719	0	21198-7	Choriogonadotropin.beta subunit [Units/volume] in Serum or Plasma	B-HCG SerPl-aCnc	CHEM	\N
Qa9945fa0322c36950926	1461310520610	0	47094-8	Calciferol (Vit D2) [Moles/volume] in Serum or Plasma	Vitamin D2 SerPl-sCnc	CHEM	\N
Fae9b3d545746c8500884	1461310514952	0	749-2	Myelocytes/100 leukocytes in Blood by Manual count	Myelocytes NFr Bld Manual	HEM/BC	\N
ubb6a126a889ef75d0856	1461310511018	0	14698-5	Digoxin [Moles/volume] in Serum or Plasma	Digoxin SerPl-sCnc	DRUG/TOX	\N
t9c9c037b3eb496a00904	1461310517427	0	5783-6	Unidentified crystals [Presence] in Urine sediment by Light microscopy	Unident Crys UrnS Ql Micro	UA	\N
v73bf2a4703d27ff90872	1461310512960	0	14719-9	Ethanol [Moles/volume] in Serum or Plasma	Ethanol SerPl-sCnc	DRUG/TOX	\N
id4de84753dd89e6f0858	1461310511277	0	13965-9	Homocysteine [Moles/volume] in Serum or Plasma	Homocysteine SerPl-sCnc	CHEM	\N
K85de51776d080b160896	1461310516302	0	8123-2	CD3+CD4+ (T4 helper) cells/100 cells in Blood	CD3+CD4+ Cells NFr Bld	CELLMARK	\N
Tbb8bbb66ff3c0f500886	1461310515185	0	18932-4	Imipenem [Susceptibility]	Imipenem Susc Islt	ABXBACT	\N
ae4388e57762b81d80860	1461310511510	0	55593-8	Creatinine [Moles/volume] in unspecified time Urine	Creat ?Tm Ur-sCnc	CHEM	\N
ncc6e953eccbe07540874	1461310513202	0	22763-7	Ammonia [Mass/volume] in Plasma	Ammonia Plas-mCnc	CHEM	\N
d6bdab075150d54af0862	1461310511718	0	18893-8	Ceftazidime [Susceptibility]	Ceftazidime Susc Islt	ABXBACT	\N
d7419eb6f75ba09e50912	1461310518769	0	31017-7	Tissue transglutaminase IgA Ab [Units/volume] in Serum	tTG IgA Ser-aCnc	SERO	\N
Qba3ee6fbabadc2640876	1461310513668	0	16362-6	Ammonia [Moles/volume] in Plasma	Ammonia Plas-sCnc	CHEM	\N
g8529550e8fa247e10864	1461310511943	0	18970-4	Piperacillin+Tazobactam [Susceptibility]	Piperacillin+Tazobac Susc Islt	ABXBACT	\N
lbefdf489373236c90918	1461310519603	0	3167-4	Volume of 24 hour Urine	Specimen vol 24h Ur	SPEC	\N
Be48cc3f5f3f416a00888	1461310515385	0	18943-1	Meropenem [Susceptibility]	Meropenem Susc Islt	ABXBACT	\N
u6a666a599366f2000906	1461310517802	0	39797-6	Vancomycin [Moles/volume] in Serum or Plasma --trough	Vancomycin Trough SerPl-sCnc	DRUG/TOX	\N
je0f3b069320d77440866	1461310512127	0	54218-3	CD3+CD4+ (T4 helper) cells/CD3+CD8+ (T8 suppressor cells) cells [# Ratio] in Blood	CD3+CD4+ Cells/CD3+CD8+ Cells Bld	CELLMARK	\N
Y9c5433d5f4e0b46a0878	1461310514111	0	3426-4	Tetrahydrocannabinol [Presence] in Urine	THC Ur Ql	DRUG/TOX	\N
L87a6d0da27a4ea3c0898	1461310516602	0	26498-6	Myelocytes/100 leukocytes in Blood	Myelocytes NFr Bld	HEM/BC	\N
Hd99cb483593c95e10890	1461310515669	0	32673-6	Creatine kinase.MB [Enzymatic activity/volume] in Serum or Plasma	CK MB SerPl-cCnc	CHEM	\N
E7f7d5b50c9472e850880	1461310514435	0	26487-9	Monocytes/100 leukocytes in Body fluid	Monocytes NFr Fld	HEM/BC	\N
q7ab9143f28c725290900	1461310516861	0	19162-7	Varicella zoster virus IgG Ab [Presence] in Serum	VZV IgG Ser Ql	MICRO	\N
U8e7c2f7c6986a4900892	1461310515835	0	22322-2	Hepatitis B virus surface Ab [Presence] in Serum	HBV surface Ab Ser Ql	MICRO	\N
Ed1c02c48d52364d00930	1461310520994	0	18993-6	Tetracycline [Susceptibility]	Tetracycline Susc Islt	ABXBACT	\N
g72a6bf1298ba94b20914	1461310519060	0	3150-0	Inhaled oxygen concentration	Inhaled O2 concentration	CLIN	\N
i92cad3d2d9a8507a0908	1461310518077	0	4092-3	Vancomycin [Mass/volume] in Serum or Plasma --trough	Vancomycin Trough SerPl-mCnc	DRUG/TOX	\N
e71a7eaf8aae98c290902	1461310517186	0	18879-7	Cefepime [Susceptibility]	Cefepime Susc Islt	ABXBACT	\N
nc71e604d0100f7780924	1461310520352	0	1990-1	Cholecalciferol (Vit D3) [Mass/volume] in Serum or Plasma	Vitamin D3 SerPl-mCnc	CHEM	\N
x72472cf1ad216d860920	1461310519811	0	18895-3	Ceftriaxone [Susceptibility]	Ceftriaxone Susc Islt	ABXBACT	\N
abe32ab43786363270910	1461310518394	0	8124-0	CD3 cells/100 cells in Blood	CD3 Cells NFr Bld	CELLMARK	\N
j8efce923f52a83570916	1461310519277	0	1834-1	Alpha-1-Fetoprotein [Mass/volume] in Serum or Plasma	AFP SerPl-mCnc	CHEM	\N
Yac9efd8b339951650928	1461310520811	0	14796-7	Insulin [Moles/volume] in Serum or Plasma	Insulin SerPl-sCnc	CHEM	\N
Ba7cc5a99877d70c70938	1461310522019	0	8101-8	CD3+CD8+ (T8 suppressor cells) cells/100 cells in Blood	CD3+CD8+ Cells NFr Bld	CELLMARK	\N
H87a380deaace282a0940	1461310522295	0	13451-0	Creatinine dialysis fluid clearance	Creat Cl Dial fld+SerPl-vRate	CHEM	\N
F9d7557e92f2c9abf0934	1461310521561	0	13955-0	Hepatitis C virus Ab [Presence] in Serum or Plasma by Immunoassay	HCV Ab SerPl Ql EIA	MICRO	\N
Ce5b2d82b071678190932	1461310521294	0	17790-7	Leukocytes Left Shift [Presence] in Blood by Automated count	WBC Left Shift Bld Ql Auto	HEM/BC	\N
Tc999a491d32d45b80936	1461310521794	0	18996-9	Tobramycin [Susceptibility]	Tobramycin Susc Islt	ABXBACT	\N
Ua8e61a042d1e86c80942	1461310522577	0	1305-2	D Ag [Presence] in Blood	D Ag Bld Ql	BLDBK	\N
M6e9d7bbd37b251c00944	1461310522852	0	5130-0	DNA double strand Ab [Units/volume] in Serum	dsDNA Ab Ser-aCnc	SERO	\N
Kbb617048470ac8ed0946	1461310523094	0	46737-3	Galactosemias newborn screen interpretation	Galactosemias DBS-Imp	CHEM	\N
L88701d49e2e147c00948	1461310523328	0	14581-3	Acetaminophen [Moles/volume] in Serum or Plasma	Acetamin SerPl-sCnc	DRUG/TOX	\N
q8a42b515c4792b1f0950	1461310523811	0	14895-7	Protein Fractions [interpretation] in Serum or Plasma by Immunofixation	Prot Pattern SerPl IFE-Imp	CHEM	\N
e7a6fee80f6f844cb0952	1461310524069	0	18886-2	Cefotaxime [Susceptibility]	Cefotaxime Susc Islt	ABXBACT	\N
t67cd45100f2d5ffd0954	1461310524286	0	46733-2	Amino acidemias newborn screen interpretation	Amino acidemias DBS-Imp	CHEM	\N
Tc5e527d3fb12f8da0986	1461310528203	0	4073-3	Tricyclic antidepressants [Presence] in Serum or Plasma	Tricyclics SerPl Ql	DRUG/TOX	\N
v9fd2cef1f6518f4d0972	1461310526578	0	18860-7	Amikacin [Susceptibility]	Amikacin Susc Islt	ABXBACT	\N
ubae001ba4e2eab150956	1461310524552	0	35492-8	Methicillin resistant Staphylococcus aureus (MRSA) DNA [Presence] by Probe and target amplification method	MRSA DNA XXX Ql PCR	ABXBACT	\N
uc0b1e0c44c92c30801006	1461310530854	0	34713-8	Clostridium difficile toxin A+B [Presence] in Stool	C dif Tox A+B Stl Ql	MICRO	\N
i6dcf0a2d24a8b2150958	1461310524794	0	46736-5	Fatty acid oxidation defects newborn screen interpretation	FOD DBS-Imp	CHEM	\N
n6c7380c7551166160974	1461310526861	0	12238-2	Neutrophils/100 leukocytes in Body fluid by Manual count	Neutrophils NFr Fld Manual	HEM/BC	\N
La8e1ca28dbd92ae80998	1461310529704	0	8122-4	CD3 cells [#/volume] in Blood	CD3 Cells # Bld	CELLMARK	\N
Bbc13f4c02c62fff10988	1461310528486	0	1006-6	Direct antiglobulin test.IgG specific reagent [interpretation] on Red Blood Cells	DAT IgG-Sp Reag RBC-Imp	BLDBK	\N
acc267a5b379aad160960	1461310525103	0	14946-8	Valproate [Moles/volume] in Serum or Plasma	Valproate SerPl-sCnc	DRUG/TOX	\N
Qc04c2d68f96b0d240976	1461310527069	0	8098-6	Thyroglobulin Ab [Units/volume] in Serum or Plasma	Thyroglob Ab SerPl-aCnc	SERO	\N
d67de034eac8f242b0962	1461310525369	0	38478-4	Biotinidase [Presence] in Dried blood spot	Biotinidase DBS Ql	CHEM	\N
n6ad06a0e5fd316b001024	1461310532970	0	16128-1	Hepatitis C virus Ab [Presence] in Serum	HCV Ab Ser Ql	MICRO	\N
H6d94edab65120ae20990	1461310528679	0	31160-5	Polymorphonuclear cells/100 leukocytes in Blood by Manual count	Polys NFr Bld Manual	HEM/BC	\N
gce3314d02c82cf240964	1461310525619	0	34148-7	Borrelia burgdorferi IgG+IgM Ab [Units/volume] in Serum	B burgdor IgG+IgM Ser-aCnc	MICRO	\N
Y6b8e7dabfec4245d0978	1461310527253	0	3773-9	Methadone [Presence] in Urine	Methadone Ur Ql	DRUG/TOX	\N
g7f7bd0937b173af101014	1461310531828	0	26455-6	Erythrocytes [#/volume] in Body fluid	RBC # Fld	HEM/BC	\N
j6807cc7ab5bd4e2c0966	1461310525852	0	18969-6	Piperacillin [Susceptibility]	Piperacillin Susc Islt	ABXBACT	\N
qbe87c2d4926fca6201000	1461310529929	0	21667-1	F5 gene mutations found [Identifier] in Blood or Tissue by Molecular genetics method Nominal	F5 gene Mut Anal Bld/T	MOLPATH.MUT	\N
Eb9833adc91de73a00980	1461310527444	0	26452-3	Eosinophils/100 leukocytes in Body fluid	Eosinophil NFr Fld	HEM/BC	\N
ld697aec7f92395140968	1461310526103	0	2955-3	Sodium [Moles/volume] in Urine	Sodium Ur-sCnc	CHEM	\N
ica7c21228fa8b9d901008	1461310531154	0	26510-8	Neutrophils.band form/100 leukocytes in Body fluid	Neuts Band NFr Fld	HEM/BC	\N
Ue541e8eb38b49a420992	1461310529003	0	7790-9	Burr cells [Presence] in Blood by Light microscopy	Burr Cells Bld Ql Smear	HEM/BC	\N
x867326e1b0c9001b0970	1461310526303	0	10381-2	Target cells [Presence] in Blood by Light microscopy	Targets Bld Ql Smear	HEM/BC	\N
C80f37e1c376c6ae10982	1461310527678	0	18961-3	Oxacillin [Susceptibility]	Oxacillin Susc Islt	ABXBACT	\N
x869f1a624268047901020	1461310532471	0	57845-0	Leukocytes [#/volume] in Body fluid by Automated count	WBC # Fld Auto	HEM/BC	\N
eb77f90299341e93901002	1461310530295	0	584-3	Streptococcus agalactiae [Presence] in Vaginal fluid by Organism specific culture	Gp B Strep Vag Ql Cult	MICRO	\N
M90f0974a5ad269180994	1461310529262	0	543-9	Mycobacterium sp identified in Unspecified specimen by Organism specific culture	Mycobacterium XXX Cult	MICRO	\N
Fcfefa9723dbda1f20984	1461310527969	0	10352-3	Bacteria identified in Genital specimen by Aerobe culture	Bacteria Genital Aerobe Cult	MICRO	\N
Wc451c4309a9074f301029	1461310533387	0	7918-6	HIV 1+2 Ab [Presence] in Serum	HIV1+2 Ab Ser Ql	MICRO	\N
ad2c7285de97b208201010	1461310531445	0	8246-1	Amorphous sediment [Presence] in Urine sediment by Light microscopy	Amorph Sed UrnS Ql Micro	UA	\N
K76912b59b075d00d0996	1461310529503	0	20564-1	Oxygen saturation in Blood	SaO2 % Bld	HEMODYN.MOLEC	\N
t69f49f38dd24b01601004	1461310530503	0	10334-1	Cancer Ag 125 [Units/volume] in Serum or Plasma	Cancer Ag125 SerPl-aCnc	CHEM	\N
jc6c0fefc185aba2301016	1461310532054	0	4485-9	Complement C3 [Mass/volume] in Serum or Plasma	C3 SerPl-mCnc	HEM/BC	\N
G93d3e3e3ea9aa3d801037	1461310534662	0	13518-6	Lymphocytes Variant/100 leukocytes in Body fluid by Manual count	Variant Lymphs NFr Fld Manual	HEM/BC	\N
V9bdfa4d5b6021cfe01035	1461310534429	0	14684-5	Creatinine [Moles/time] in 24 hour Urine	Creat 24h Ur-sRate	CHEM	\N
d7956a2c2fe046fa701012	1461310531620	0	18919-1	Erythromycin [Susceptibility]	Erythromycin Susc Islt	ABXBACT	\N
v8e260a7d3d673ba701022	1461310532716	0	5176-3	Helicobacter pylori IgG Ab [Units/volume] in Serum by Immunoassay	H pylori IgG Ser EIA-aCnc	MICRO	\N
lc5f3c8061f5a410601018	1461310532253	0	4498-2	Complement C4 [Mass/volume] in Serum or Plasma	C4 SerPl-mCnc	HEM/BC	\N
Q763a28fcc6b075b701026	1461310533171	0	14135-8	CD3+CD8+ (T8 suppressor cells) cells [#/volume] in Blood	CD3+CD8+ Cells # Bld	CELLMARK	\N
Rbc11aeb02214373c01033	1461310534104	0	18908-4	Clindamycin [Susceptibility]	Clindamycin Susc Islt	ABXBACT	\N
D72ec158dd23853e401031	1461310533620	0	19312-8	Tricyclic antidepressants [Presence] in Urine by Screen method	Tricyclics Ur Ql Scn	DRUG/TOX	\N
Na70c5b00f3e8d1d801041	1461310535237	0	6864-3	Hemoglobin S [Presence] in Blood by Solubility test	Hgb S Bld Ql Soly	HEM/BC	\N
J9705779d4ab48caf01043	1461310535454	0	49563-0	Troponin I.cardiac [Mass/volume] in Serum or Plasma by Detection limit <= 0.01 ng/mL	Troponin I SerPl DL<=0.01 ng/mL-mCnc	CHEM	\N
Z7f2b01a0361126e001039	1461310534937	0	12179-8	Basophils/100 leukocytes in Body fluid by Manual count	Basophils NFr Fld Manual	HEM/BC	\N
Ie175b697929457e101045	1461310535654	0	33255-1	Cell Fractions/Differential [interpretation] in Blood	Cell Fract Bld-Imp	HEM/BC	\N
O76ab420ec8257f5301047	1461310535887	0	2708-6	Oxygen saturation in Arterial blood	SaO2 % BldA	CHEM	\N
P68924c51b946162801049	1461310536121	0	5209-2	Herpes simplex virus 2 IgG Ab [Units/volume] in Serum by Immunoassay	HSV2 IgG Ser EIA-aCnc	MICRO	\N
w6ff79359d1176d7b01051	1461310536429	0	18964-7	Penicillin [Susceptibility]	Penicillin Susc Islt	ABXBACT	\N
rc77f2d3b7ad76c5801053	1461310536654	0	18868-0	Aztreonam [Susceptibility]	Aztreonam Susc Islt	ABXBACT	\N
od5992cd9668fe23301057	1461310537129	0	29574-1	Thyrotropin [Presence] in Dried blood spot	TSH DBS Ql	CHEM	\N
C96f5de40fe0fd15d01232	1461310564297	0	14725-6	[Type] of Body fluid	Body fld type	SPEC	\N
G799788269f5b6ed801087	1461310541154	0	30318-0	Base deficit in Blood	Base deficit Bld-sCnc	CHEM	\N
Pcbe801045cbcecc201099	1461310542729	0	2110-5	Choriogonadotropin.beta subunit (pregnancy test) [Presence] in Serum or Plasma	B-HCG Preg SerPl Ql	CHEM	\N
p742596532435019a01059	1461310537421	0	19994-3	Oxygen/Inspired gas setting [Volume Fraction] Ventilator	O2/Inspired gas setting VFr Vent	PULM	\N
m68b704f0e4ff759901075	1461310539429	0	70200-1	Cholesterol in HDL/Cholesterol.total [Molar ratio] in Serum or Plasma	HDLc SerPl-sRto	CHEM	\N
sb073ea5861a48c4001061	1461310537621	0	32854-2	17-Hydroxyprogesterone [Presence] in Dried blood spot	17OHP DBS Ql	CHEM	\N
Zd0af1db1327511fe01089	1461310541413	0	743-5	Monocytes [#/volume] in Blood by Manual count	Monocytes # Bld Manual	HEM/BC	\N
Aa55e3db2b2b3d44f01077	1461310539721	0	19113-0	IgE [Units/volume] in Serum or Plasma	IgE SerPl-aCnc	CHEM	\N
fb53ec81184caf7a201063	1461310537854	0	29571-7	Phenylalanine [Presence] in Dried blood spot	Phe DBS Ql	CHEM	\N
c889fd3c85177c59501121	1461310546663	0	18887-0	Cefotetan [Susceptibility]	Cefotetan Susc Islt	ABXBACT	\N
h9eae67f098914d2e01115	1461310545746	0	29247-4	Sirolimus [Mass/volume] in Blood	Sirolimus Bld-mCnc	DRUG/TOX	\N
we054ac93c0d73fa501101	1461310543051	0	13952-7	Hepatitis B virus core Ab [Presence] in Serum or Plasma by Immunoassay	HBV core Ab SerPl Ql EIA	MICRO	\N
hc1a2d82a96d5ced501065	1461310538104	0	21654-9	CFTR gene mutations found [Identifier] in Blood or Tissue by Molecular genetics method Nominal	CFTR Mut Anal Bld/T	MOLPATH.MUT	\N
Wb88a29aa9aa8a34f01079	1461310539963	0	12232-5	Measles virus Ag [Presence] in Unspecified specimen by Immunofluorescence	MeV Ag XXX Ql IF	MICRO	\N
Nde919deba53eccf701091	1461310541688	0	5569-9	Acetone [Presence] in Urine	Acetone Ur Ql	DRUG/TOX	\N
k8e1f90ba6c2385d201067	1461310538379	0	38486-7	Homocystine [Presence] in Dried blood spot	(Hcys)2 DBS Ql	CHEM	\N
pb8a65b9abe9d1d2001109	1461310544671	0	33358-3	Protein.monoclonal [Mass/volume] in Serum or Plasma by Electrophoresis	M Protein SerPl Elph-mCnc	CHEM	\N
D8a08f7b474bf0a9e01081	1461310540212	0	14688-6	Dehydroepiandrosterone sulfate (DHEA-S) [Moles/volume] in Serum or Plasma	DHEA-S SerPl-sCnc	CHEM	\N
y68d442ed2585508201069	1461310538621	0	38479-2	Branched chain keto-acid dehydrogenase complex [Presence] in Dried blood spot	BCKAD DBS Ql	CHEM	\N
Jdc21aebbf3f70fef01093	1461310541946	0	3520-4	Cyclosporine [Mass/volume] in Blood	Cyclosporin Bld-mCnc	DRUG/TOX	\N
cc93a6e2272e44fda01071	1461310538946	0	46779-5	Medium/Short chain acyl-CoA dehydrogenase deficiency newborn screen interpretation	M/SCHADD DBS-Imp	CHEM	\N
Rb69fe7313f100d4f01083	1461310540604	0	625-4	Bacteria identified in Stool by Culture	Bacteria Stl Cult	MICRO	\N
Vaabc1f5a171b59f701135	1461310548663	0	19107-2	Histoplasma capsulatum Ag [Units/volume] in Serum by Radioimmunoassay (RIA)	H capsul Ag Ser RIA-aCnc	MICRO	\N
r78461d00100d5e8601103	1461310543698	0	610-6	Bacteria identified in Body fluid by Aerobe culture	Bacteria Fld Aerobe Cult	MICRO	\N
b82be5bba27953e4901073	1461310539187	0	14909-6	Salicylates [Moles/volume] in Serum or Plasma	Salicylates SerPl-sCnc	DRUG/TOX	\N
Rd9f61196bf5edb5101133	1461310548313	0	29891-9	Helicobacter pylori [Presence] in Stomach by urea breath test	Urea Breath Test Ql	MICRO	\N
Vbdce93768af537c901085	1461310540871	0	24475-6	F2 gene p.G20210A [Presence] in Blood or Tissue by Molecular genetics method	F2 p.G20210A Bld/T Ql	MOLPATH.MUT	\N
Ie69008da9ae92ea401095	1461310542204	0	32693-4	Lactate [Moles/volume] in Blood	Lactate Bld-sCnc	CHEM	\N
s859227ce7fe8c41901111	1461310544913	0	65633-0	Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Confirmatory method	HBV surface Ag SerPl Ql Cfm	MICRO	\N
z8691c91713420bd701105	1461310544146	0	5403-1	Varicella zoster virus IgG Ab [Units/volume] in Serum by Immunoassay	VZV IgG Ser EIA-aCnc	MICRO	\N
Od96d7195e98cf1a501097	1461310542496	0	48065-7	Fibrin D-dimer FEU [Mass/volume] in Platelet poor plasma	D dimer FEU PPP-mCnc	COAG	\N
k6e583c8ebe2457e301117	1461310546104	0	739-3	Metamyelocytes [#/volume] in Blood by Manual count	Metamyelocytes # Bld Manual	HEM/BC	\N
Ae03168c813ed826301127	1461310547488	0	30089-7	Transitional cells [#/area] in Urine sediment by Microscopy high power field	Trans Cells #/area UrnS HPF	UA	\N
bc6b55669b37c046401123	1461310546938	0	10335-8	Color of Cerebral spinal fluid	Color CSF	SPEC	\N
f847c2be7d2e2f32101113	1461310545349	0	10524-7	Microscopic observation [Identifier] in Cervix by Cyto stain	Cyto Cervix	CYTO	\N
oa3c45ae50b38b21801107	1461310544396	0	803-7	Toxic granules [Presence] in Blood by Light microscopy	Toxic Granules Bld Ql Smear	HEM/BC	\N
yc7337e8e9a69cebe01119	1461310546413	0	2889-4	Protein [Mass/time] in 24 hour Urine	Prot 24h Ur-mRate	CHEM	\N
Dda10c67bf23ddc3001131	1461310548029	0	2828-2	Potassium [Moles/volume] in Urine	Potassium Ur-sCnc	CHEM	\N
G7045d3e6d2e66c8a01137	1461310549017	0	2639-3	Myoglobin [Mass/volume] in Serum or Plasma	Myoglobin SerPl-mCnc	CHEM	\N
ma6ef826a3ff2334201125	1461310547238	0	39778-6	Iron/Iron binding capacity.total [Molar ratio] in Serum or Plasma	Iron/TIBC SerPl-sRto	CHEM	\N
Wa5042c82b948252801129	1461310547738	0	20761-3	Clostridium difficile [Presence] in Stool by Agglutination	C dif Stl Ql Aggl	MICRO	\N
N7b3b81259efba9f501141	1461310549622	0	1922-4	Base deficit in Arterial blood	Base deficit BldA-sCnc	CHEM	\N
Z9241ca579854bf6501139	1461310549338	0	5028-6	Neisseria gonorrhoeae rRNA [Presence] in Unspecified specimen by DNA probe	N gonorrhoea rRNA XXX Ql Prb	MICRO	\N
J898dcdae5974152301143	1461310549905	0	48058-2	Fibrin D-dimer DDU [Mass/volume] in Platelet poor plasma by Immunoassay	D dimer DDU PPP EIA-mCnc	COAG	\N
Ic21799b43c5d83c101145	1461310550204	0	35365-6	Vitamin D+Metabolites [Mass/volume] in Serum or Plasma	Vit D+metab SerPl-mCnc	CHEM	\N
O8fb3e66ff9526e9601147	1461310550504	0	772-4	Nucleated erythrocytes [#/volume] in Blood by Manual count	nRBC # Bld Manual	HEM/BC	\N
Pd996199fb10dc14b01149	1461310550821	0	806-0	Leukocytes [#/volume] in Cerebral spinal fluid by Manual count	WBC # CSF Manual	HEM/BC	\N
w7dcb9116cc1b347b01151	1461310551088	0	14566-4	Calcitriol [Moles/volume] in Serum or Plasma	"1	25(OH)2D3 SerPl-sCnc"	\N
rc4437fc34843736801153	1461310551388	0	3181-5	Cardiolipin IgG Ab [Units/volume] in Serum by Immunoassay	Cardiolipin IgG Ser EIA-aCnc	COAG	\N
za9de110c7b2ef23e01155	1461310551747	0	3182-3	Cardiolipin IgM Ab [Units/volume] in Serum by Immunoassay	Cardiolipin IgM Ser EIA-aCnc	COAG	\N
o9144549ffa81ab9f01207	1461310560564	0	11011-4	Hepatitis C virus RNA [Units/volume] (viral load) in Serum or Plasma by Probe and target amplification method	HCV RNA SerPl PCR-aCnc	MICRO	\N
bd0bd1f28ed0a399801173	1461310554947	0	25145-4	Bacteria [Presence] in Urine sediment by Light microscopy	Bacteria UrnS Ql Micro	UA	\N
o7223d5fb6694b4ea01157	1461310552122	0	4546-8	Hemoglobin A/Hemoglobin.total in Blood	Hgb A MFr Bld	HEM/BC	\N
G8ecb1eaf8b6a0fe101187	1461310557463	0	546-2	Streptococcus.beta-hemolytic [Presence] in Throat by Organism specific culture	B-Hem Strep Throat Ql Cult	MICRO	\N
B78536d708227098201238	1461310565281	0	46765-4	Sickle cell anemia newborn screen interpretation	Sickle Cell Anemia DBS-Imp	CHEM	\N
pc16678e5f2962b4201159	1461310552447	0	49541-6	Fasting status [Presence] - Reported	Fasting status Patient Ql Reported	MISC	\N
Pda596255d14b082c01199	1461310559420	0	673-4	Ova and parasites identified in Unspecified specimen by Light microscopy	O+P XXX Micro	MICRO	\N
m7839ac318a8de84601175	1461310555305	0	24467-3	CD3+CD4+ (T4 helper) cells [#/volume] in Blood	CD3+CD4+ Cells # Bld	CELLMARK	\N
K879c781fa075d80f01246	1461310566789	0	14744-7	Glucose [Moles/volume] in Cerebral spinal fluid	Glucose CSF-sCnc	CHEM	\N
Ya0515fbe28a1d43e01228	1461310563597	0	49049-0	Collection time of Unspecified specimen	Collect Tme XXX	SPEC	\N
s982bb99c77b1a1e201161	1461310552747	0	4576-5	Hemoglobin F/Hemoglobin.total in Blood	Hgb F MFr Bld	HEM/BC	\N
Za4b71abdbbe3e26701189	1461310557738	0	21484-1	Mother's race	Mother's race	CLIN	\N
T8b8a700ae3fed6c301236	1461310564964	0	4545-0	Hematocrit [Volume Fraction] of Blood by Centrifugation	Hct VFr Bld Spun	HEM/BC	\N
A8138f2536be93b0101177	1461310555838	0	33762-6	Natriuretic peptide.B prohormone N-Terminal [Mass/volume] in Serum or Plasma	NT-proBNP SerPl-mCnc	CHEM	\N
fe3e3b23c39ad7cf101163	1461310553130	0	2890-2	Protein/Creatinine [Mass ratio] in Urine	Prot/Creat Ur-mRto	CHEM	\N
m773a0e98a075fd0f01225	1461310563222	0	4563-3	Hemoglobin C/Hemoglobin.total in Blood	Hgb C MFr Bld	HEM/BC	\N
hbc464dd4c90ad69c01215	1461310561872	0	33944-0	Immunoglobulin light chains.lambda.free [Mass/volume] in Serum or Plasma	Lambda LC Free SerPl-mCnc	CHEM	\N
pd86fe6bd6e7c1ea701209	1461310560880	0	12841-3	Prostate Specific Ag Free/Prostate specific Ag.total in Serum or Plasma	PSA Free MFr SerPl	CHEM	\N
h780b62e996d96f7201165	1461310553488	0	33935-8	Cyclic citrullinated peptide IgG Ab [Units/volume] in Serum	cCP IgG Ser-aCnc	SERO	\N
qba423b9032a1092001250	1461310567439	0	9587-7	Borrelia burgdorferi 41kD IgM Ab [Presence] in Serum by Immunoblot (IB)	B burgdor41kD IgM Ser Ql IB	MICRO	\N
w904686169649d31d01201	1461310559722	0	5064-1	Borrelia burgdorferi IgM Ab [Units/volume] in Serum by Immunoassay	B burgdor IgM Ser EIA-aCnc	MICRO	\N
Wd9b333e09f922cb501179	1461310556172	0	48066-5	Fibrin D-dimer DDU [Mass/volume] in Platelet poor plasma	D dimer DDU PPP-mCnc	COAG	\N
Fc4265bbb863f33d701234	1461310564639	0	21299-3	Gestational age method	GA method	OB.US	\N
N7364ca1a3c52699501191	1461310558130	0	2021-4	Carbon dioxide [Partial pressure] in Venous blood	pCO2 BldV	CHEM	\N
ka5fc8611d336b9ce01167	1461310553913	0	16935-9	Hepatitis B virus surface Ab [Units/volume] in Serum	HBV surface Ab Ser-aCnc	MICRO	\N
M8ed47ef3b15bad3b01244	1461310566372	0	18862-3	Amoxicillin+Clavulanate [Susceptibility]	Amoxicillin+Clav Susc Islt	ABXBACT	\N
Uac1e38af599cdebe01242	1461310566072	0	49048-2	Protein feed time	Protein feed time Patient	CHEM	\N
Hd2680f43bd9b9c4501240	1461310565630	0	10362-2	Endomysium IgA Ab [Presence] in Serum	Endomysium IgA Ser Ql	SERO	\N
Dc4b41b6ff315c76001181	1461310556522	0	4625-0	Hemoglobin S/Hemoglobin.total in Blood	Hgb S MFr Bld	HEM/BC	\N
yd0cbad2e9399f42901169	1461310554247	0	5193-8	Hepatitis B virus surface Ab [Units/volume] in Serum by Immunoassay	HBV surface Ab Ser EIA-aCnc	MICRO	\N
J7cdac9f6679d701601193	1461310558472	0	30446-9	Myelocytes [#/volume] in Blood	Myelocytes # Bld	HEM/BC	\N
cc5b5a47c4a5396e401171	1461310554572	0	20399-2	Nuclear Ab pattern.nucleolar [Titer] in Serum	ANA nucleolar Titr Ser	SERO	\N
Ra7b8d0858141e24c01183	1461310556855	0	2746-6	pH of Venous blood	pH BldV	CHEM	\N
caf53c1c2c540af8001221	1461310562672	0	19066-0	Blood bank comment	Blood Bank Cmnt Patient-Imp	BLDBK	\N
r9b183a29c1743de801203	1461310560005	0	32998-7	Tissue transglutaminase IgG Ab [Units/volume] in Serum	tTG IgG Ser-aCnc	SERO	\N
L6a46d3c1bd15623401248	1461310567131	0	18965-4	Penicillin G [Susceptibility]	Penicillin G Susc Islt	ABXBACT	\N
Ibf1c955fe28c667d01195	1461310558772	0	748-4	Myelocytes [#/volume] in Blood by Manual count	Myelocytes # Bld Manual	HEM/BC	\N
V9fa452b32f22990301185	1461310557147	0	3376-1	"Barbiturates [Presence] in Serum	 Plasma or Blood"	Barbiturates SerPlBld Ql	\N
ec5ddfb0f215867b601252	1461310567672	0	18390-5	Opiates [Presence] in Urine by Confirmatory method	Opiates Ur Ql Cfm	DRUG/TOX	\N
sb9212119ec10c96201211	1461310561205	0	11006-4	Borrelia burgdorferi Ab [Presence] in Serum	B burgdor Ab Ser Ql	MICRO	\N
ta1a1703425e1830d01254	1461310567864	0	10886-0	Prostate Specific Ag Free [Mass/volume] in Serum or Plasma	PSA Free SerPl-mCnc	CHEM	\N
za47ca6e6f68b148101205	1461310560305	0	56537-4	Tissue transglutaminase IgG Ab [Units/volume] in Serum by Immunoassay	tTG IgG Ser EIA-aCnc	SERO	\N
Oa39991a12fa0719101197	1461310559130	0	17898-8	Bacteria identified in Throat by Aerobe culture	Bacteria Throat Aerobe Cult	MICRO	\N
ud68943893dce060001256	1461310568081	0	14196-0	Reticulocytes [#/volume] in Blood	Retics #	HEM/BC	\N
k8ffe7da2aee1795001217	1461310562139	0	3389-4	Benzodiazepines [Presence] in Serum or Plasma	Benzodiaz SerPl Ql	DRUG/TOX	\N
ibf1b6841f952e13a01258	1461310568314	0	2695-5	Osmolality of Urine	Osmolality Ur	CHEM	\N
fbd90335e05045c2101213	1461310561522	0	2880-3	Protein [Mass/volume] in Cerebral spinal fluid	Prot CSF-mCnc	CHEM	\N
abc62e4d38043083901260	1461310568564	0	42481-2	Human papilloma virus 6+11+42+43+44 DNA [Presence] in Cervix by Probe and signal amplification method	HPV Low Risk DNA Cervix Ql bDNA	MICRO	\N
bad53ed91f8e1827901223	1461310562955	0	48803-1	Neural tube defect risk in Fetus	Neural tube defect risk Fetus	CHEM	\N
y89add097d540544801219	1461310562405	0	5206-8	Herpes simplex virus 1 IgG Ab [Units/volume] in Serum by Immunoassay	HSV1 IgG Ser EIA-aCnc	MICRO	\N
d9d04630aab2d439a01262	1461310568789	0	13951-9	Hepatitis A virus Ab [Presence] in Serum by Immunoassay	HAV Ab Ser Ql EIA	MICRO	\N
e6b0c6b8b87bd3d1d03452	1461310885000	0	49581-2	Reference lab test identifier and name [Identifier]	Ref Lab Test ID+Name	MISC	\N
ad247d778ad36226001310	1461310575340	0	44357-2	Galactomannan Ag [Units/volume] in Serum or Plasma by Immunoassay	Galactomannan Ag SerPl EIA-aCnc	MICRO	\N
Ub68bd50cb6d3fc1101292	1461310572714	0	9589-3	Borrelia burgdorferi 23kD IgG Ab [Presence] in Serum by Immunoblot (IB)	B burgdor23kD IgG Ser Ql IB	MICRO	\N
ede8203a20054833101302	1461310574048	0	9595-0	Borrelia burgdorferi 58kD IgG Ab [Presence] in Serum by Immunoblot (IB)	B burgdor58kD IgG Ser Ql IB	MICRO	\N
E9b3e8f0be49da51901280	1461310571431	0	17792-3	Sjogrens syndrome-A extractable nuclear Ab [Units/volume] in Serum	ENA SS-A Ab Ser-aCnc	SERO	\N
gc5bc87f3063ec67101264	1461310569080	0	13502-0	Borrelia burgdorferi Ab.IgG band pattern [interpretation] in Serum by Immunoblot (IB)	B burgdor IgG Patrn Ser IB-Imp	MICRO	\N
je3b914e64ddc557001266	1461310569381	0	11090-8	Smith extractable nuclear Ab [Units/volume] in Serum	ENA SM Ab Ser-aCnc	SERO	\N
M7ea0b2773efa838601294	1461310572915	0	9591-9	Borrelia burgdorferi 30kD IgG Ab [Presence] in Serum by Immunoblot (IB)	B burgdor30kD IgG Ser Ql IB	MICRO	\N
C8d04dfc66eea7c4101282	1461310571606	0	11004-9	Tricyclic antidepressants [Presence] in Urine	Tricyclics Ur Ql	DRUG/TOX	\N
lae5dcecd8f7aa06501268	1461310569681	0	606-4	Bacteria identified in Cerebral spinal fluid by Culture	Bacteria CSF Cult	MICRO	\N
v836c46b9dfc13ec601322	1461310577173	0	6331-3	Campylobacter sp identified in Stool by Organism specific culture	Campylobacter Stl Cult	MICRO	\N
tddcced8b6ce415e801304	1461310574381	0	9596-8	Borrelia burgdorferi 66kD IgG Ab [Presence] in Serum by Immunoblot (IB)	B burgdor66kD IgG Ser Ql IB	MICRO	\N
F9e7ec756af39eb8d01284	1461310571840	0	17791-5	Sjogrens syndrome-B extractable nuclear Ab [Units/volume] in Serum	ENA SS-B Ab Ser-aCnc	SERO	\N
x7f262f5bc31b832801270	1461310569964	0	6561-5	Treponema pallidum IgG Ab [Presence] in Serum	T pallidum IgG Ser Ql	MICRO	\N
Kc0359cdb936eeabe01296	1461310573123	0	9592-7	Borrelia burgdorferi 39kD IgG Ab [Presence] in Serum by Immunoblot (IB)	B burgdor39kD IgG Ser Ql IB	MICRO	\N
vcb74dc9566f9b61b01272	1461310570298	0	47238-1	Treponema pallidum IgG Ab [Presence] in Serum by Immunoassay	T pallidum IgG Ser Ql EIA	MICRO	\N
Tde49eb267a11b2a401286	1461310572065	0	9593-5	Borrelia burgdorferi 41kD IgG Ab [Presence] in Serum by Immunoblot (IB)	B burgdor41kD IgG Ser Ql IB	MICRO	\N
nd541e9513651d48f01274	1461310570540	0	18185-9	Gestational age	GA	OB.US	\N
da3ab85dc6316354401312	1461310575731	0	6410-5	Gardnerella vaginalis rRNA [Presence] in Genital specimen by DNA probe	G vaginalis rRNA Genital Ql Prb	MICRO	\N
Fc7066b5ead95541701334	1461310578973	0	36916-5	Immunoglobulin light chains.kappa.free [Mass/volume] in Serum	Kappa LC Free Ser-mCnc	CHEM	\N
La924b43987cc1db001298	1461310573448	0	9599-2	Borrelia burgdorferi 39kD IgM Ab [Presence] in Serum by Immunoblot (IB)	B burgdor39kD IgM Ser Ql IB	MICRO	\N
B900efe837e1a59c701288	1461310572306	0	9590-1	Borrelia burgdorferi 28kD IgG Ab [Presence] in Serum by Immunoblot (IB)	B burgdor28kD IgG Ser Ql IB	MICRO	\N
Qb4b8dd83d9cd3bec01276	1461310570906	0	9597-6	Borrelia burgdorferi 93kD IgG Ab [Presence] in Serum by Immunoblot (IB)	B burgdor93kD IgG Ser Ql IB	MICRO	\N
u9482206df6b738fb01306	1461310574740	0	47000-5	Candida sp rRNA [Presence] in Vaginal fluid by DNA probe	Candida rRNA Vag Ql Prb	MICRO	\N
Yadf7867afb62ee4301278	1461310571206	0	31418-7	Heterophile Ab [Presence] in Serum	Heteroph Ab Ser Ql	MICRO	\N
l9370f8fc890218f001318	1461310576648	0	2164-2	Creatinine renal clearance in 24 hour	Creat Cl 24h Ur+SerPl-vRate	CHEM	\N
H750a43ef586608d701290	1461310572506	0	9594-3	Borrelia burgdorferi 45kD IgG Ab [Presence] in Serum by Immunoblot (IB)	B burgdor45kD IgG Ser Ql IB	MICRO	\N
qb5bee0fc2ac4f86e01300	1461310573723	0	9598-4	Borrelia burgdorferi 23kD IgM Ab [Presence] in Serum by Immunoblot (IB)	B burgdor23kD IgM Ser Ql IB	MICRO	\N
gabbcca90cf54af7e01314	1461310576057	0	6568-0	Trichomonas vaginalis rRNA [Presence] in Genital specimen by DNA probe	T vaginalis rRNA Genital Ql Prb	MICRO	\N
ia1aa57a0acefef6701308	1461310575015	0	9588-5	Borrelia burgdorferi 18kD IgG Ab [Presence] in Serum by Immunoblot (IB)	B burgdor18kD IgG Ser Ql IB	MICRO	\N
n851c114dd6237a0001324	1461310577351	0	21262-1	Escherichia coli shiga-like [Presence] in Stool by Immunoassay	E coli SLTEC Stl Ql EIA	MICRO	\N
x8ed50d88a63e17f001320	1461310576964	0	43371-4	Salmonella sp/Shigella sp identified in Stool by Organism specific culture	Salm/Shig Stl Cult	MICRO	\N
jd7c5378dbdd16a8c01316	1461310576406	0	14564-9	Hemoglobin.gastrointestinal [Presence] in Stool --2nd specimen	Hemoccult sp2 Stl Ql	CHEM	\N
Ya46b3deea39b001301328	1461310577956	0	9335-1	Appearance of Body fluid	Appearance Fld	SPEC	\N
Cca82077e1bb0aa7001332	1461310578748	0	29463-7	Body weight	Weight	BDYWGT.ATOM	\N
Q9d720530ef2df94101326	1461310577664	0	29374-6	Ribonucleoprotein extractable nuclear Ab [Units/volume] in Serum	ENA RNP Ab Ser-aCnc	SERO	\N
M8720d97b8b655f4e01344	1461310580115	0	6420-4	Helicobacter pylori IgA Ab [Units/volume] in Serum by Immunoassay	H pylori IgA Ser EIA-aCnc	MICRO	\N
Ud8016c1807d6b87301342	1461310579932	0	19993-5	Oxygen/Inspired gas Inhaled gas by Gas dilution.rebreath	FIO2 Gas Dil.rebreath	PULM	\N
E83367af5a6d28f2e01330	1461310578148	0	19157-7	Tube number of Cerebral spinal fluid	Tube # CSF	SPEC	\N
T841ee2e90fe9fefc01336	1461310579231	0	15189-4	Immunoglobulin light chains.kappa/Immunoglobulin light chains.lambda [Mass ratio] in Serum	Kappa LC/Lambda Ser-mRto	CHEM	\N
B75609f1f037a8dfc01338	1461310579440	0	70209-2	Haptoglobin [Moles/volume] in Serum or Plasma	Haptoglob SerPl-sCnc	HEM/BC	\N
Hcd41ce56b9b3c97301340	1461310579674	0	15120-9	Ethanol [Moles/volume] in Blood	Ethanol Bld-sCnc	DRUG/TOX	\N
Kb2e03d618430269701346	1461310580307	0	14565-6	Hemoglobin.gastrointestinal [Presence] in Stool --3rd specimen	Hemoccult sp3 Stl Ql	CHEM	\N
L744eac8fd83de1d101348	1461310580507	0	17842-6	Cancer Ag 27-29 [Units/volume] in Serum or Plasma	Cancer Ag27-29 SerPl-aCnc	CHEM	\N
qdb9f1aad547164e201350	1461310580773	0	32515-9	CD3+CD4+ (T4 helper) cells [#/volume] in Unspecified specimen	CD3+CD4+ Cells # XXX	CELLMARK	\N
eab931183eac5b44401352	1461310581134	0	7886-5	Epstein Barr virus capsid IgM Ab [Units/volume] in Serum	EBV VCA IgM Ser-aCnc	MICRO	\N
eaa998fc565d60d9301452	1461310592983	0	20496-6	Gliadin IgG Ab [Units/volume] in Serum by Immunoassay	Gliadin IgG Ser EIA-aCnc	SERO	\N
tabec319456ee0a8c01354	1461310581423	0	5159-9	Epstein Barr virus capsid IgM Ab [Units/volume] in Serum by Immunoassay	EBV VCA IgM Ser EIA-aCnc	MICRO	\N
a98fd138c7d73659c01660	1461310624053	0	32198-4	Neisseria gonorrhoeae rRNA [Presence] in Cervix by DNA probe	N gonorrhoea rRNA Cervix Ql Prb	MICRO	\N
taea035bfb2bf7bfd01404	1461310587199	0	19550-3	Methadone [Presence] in Urine by Screen method	Methadone Ur Ql Scn	DRUG/TOX	\N
v84aa22b959c58ece01372	1461310583407	0	46769-6	Cystic fibrosis newborn screen interpretation	Cystic Fibrosis DBS-Imp	CHEM	\N
u91f57ad3328901c301356	1461310581673	0	26052-1	Epithelial cells.renal [#/area] in Urine sediment by Microscopy high power field	Renal Epi Cells #/area UrnS HPF	UA	\N
Kba5a15a443799c1d01396	1461310586316	0	14563-1	Hemoglobin.gastrointestinal [Presence] in Stool --1st specimen	Hemoccult sp1 Stl Ql	CHEM	\N
T8f86c581fe39a84101386	1461310585049	0	4993-2	Chlamydia trachomatis rRNA [Presence] in Unspecified specimen by DNA probe	C trach rRNA XXX Ql Prb	MICRO	\N
i6f555c423be0f88e01358	1461310581874	0	7885-7	Epstein Barr virus capsid IgG Ab [Units/volume] in Serum	EBV VCA IgG Ser-aCnc	MICRO	\N
nd86a457df93be20f01374	1461310583615	0	2484-4	Insulin-like growth factor-I [Mass/volume] in Serum or Plasma	IGF-I SerPl-mCnc	CHEM	\N
a8c798c601f3d83fd01360	1461310582123	0	5157-3	Epstein Barr virus capsid IgG Ab [Units/volume] in Serum by Immunoassay	EBV VCA IgG Ser EIA-aCnc	MICRO	\N
E9e1020db2b217e1701430	1461310590816	0	10333-3	Appearance of Cerebral spinal fluid	Appearance CSF	SPEC	\N
l728ac35391235d4301418	1461310589024	0	20506-2	Specimen drawn from	Specimen drawn from Patient	SPEC	\N
dc67a29568acb3c4f01412	1461310588198	0	2761-5	Phenylketones [Presence] in Blood	Phenylketones Bld Ql	CHEM	\N
Qa743aae01a4ed54201376	1461310583799	0	2118-8	Choriogonadotropin (pregnancy test) [Presence] in Serum or Plasma	HCG Preg SerPl Ql	CHEM	\N
d8d0da9fdd7e8df0801362	1461310582365	0	33768-3	Leukocyte clumps [#/volume] in Urine by Automated count	WBC clumps # Ur Auto	UA	\N
B7e8bf24e6c3c939901388	1461310585315	0	1977-8	Bilirubin.total [Presence] in Urine	Bilirub Ur Ql	CHEM	\N
Lb220f905ecf58a8901398	1461310586524	0	20447-9	HIV 1 RNA [#/volume] (viral load) in Serum or Plasma by Probe and target amplification method	HIV1 RNA # SerPl PCR	MICRO	\N
gba0da36a506835e001364	1461310582574	0	23811-3	Alpha-1-Fetoprotein [Multiple of the median] adjusted in Serum or Plasma	AFP adj MoM SerPl	CHEM	\N
Y8d3778ebf703e48601378	1461310584015	0	18974-6	Rifampin [Susceptibility]	Rifampin Susc Islt	ABXBACT	\N
ue69a64920812ef1801406	1461310587474	0	49090-4	Trisomy 21 risk based on maternal age in Fetus	Ts 21risk-age Fetus	CHEM	\N
jce24e773995aed4a01366	1461310582790	0	3013-0	Thyroglobulin [Mass/volume] in Serum or Plasma	Thyroglob SerPl-mCnc	CHEM	\N
Hc1f9b839bf6fa6ac01390	1461310585540	0	44877-9	Insulin dependent diabetes mellitus [Presence]	IDDM Patient Ql	MISC	\N
E7d4a8796923f137d01380	1461310584316	0	12710-0	Hemoglobin pattern [interpretation] in Blood	Hgb Fract Bld-Imp	HEM/BC	\N
la62b5db8baa2a07901368	1461310582982	0	6206-7	Peanut IgE Ab [Units/volume] in Serum	Peanut IgE Qn	ALLERGY	\N
qdcc4ff09022a39bb01400	1461310586732	0	5244-9	Measles virus IgG Ab [Units/volume] in Serum by Immunoassay	MeV IgG Ser EIA-aCnc	MICRO	\N
xc0b1264fc0a4db5c01370	1461310583199	0	2756-5	pH of Urine	pH Ur	CHEM	\N
Ud28ea900d7c4b18b01392	1461310585740	0	23641-4	Quinupristin+Dalfopristin [Susceptibility] by Minimum inhibitory concentration (MIC)	Quinupristin+Dalfoprist Islt MIC	ABXBACT	\N
Cd82ed174b73a924101382	1461310584573	0	34705-4	Carbon dioxide [Partial pressure] adjusted to patients actual temperature in Blood	pCO2 temp adj Bld	CHEM	\N
F8e12ab762cf1e58c01384	1461310584832	0	19254-2	Oxygen [Partial pressure] adjusted to patients actual temperature in Blood	pO2 temp adj Bld	CHEM	\N
i87cb1b0c386b920901408	1461310587691	0	21026-0	Pathologist interpretation of Blood tests	Path Interp Bld-Imp	PATH	\N
Md21b823502b258d001394	1461310585949	0	46740-7	Hemoglobin disorders newborn screen interpretation	Hemoglobin disorders DBS-Imp	CHEM	\N
ec099771a8ca11d2d01402	1461310586965	0	15064-9	Estriol (E3).unconjugated [Moles/volume] in Serum or Plasma	u Estriol SerPl-sCnc	CHEM	\N
g754c9e1067fe378001414	1461310588473	0	3779-6	Methamphetamine [Presence] in Urine	Methamphet Ur Ql	DRUG/TOX	\N
nd4eab4db8b509d5a01424	1461310590065	0	13532-7	Xanthochromia of Cerebral spinal fluid Qualitative	Xanthochromia CSF Ql	SPEC	\N
x67e559036b9a2c4401420	1461310589349	0	19057-9	ABO and Rh group [Type] in Blood from newborn	ABO+Rh Gp Bld NB	BLDBK	\N
ab7dcbe41cdd0a57f01410	1461310587932	0	49543-2	Calcidiol+Calciferol [Mass/volume] in Serum or Plasma	Calcidiol+Calciferol SerPl-mCnc	CHEM	\N
Bd37bca3b5775128a01438	1461310591749	0	6248-9	Soybean IgE Ab [Units/volume] in Serum	Soybean IgE Qn	ALLERGY	\N
j712f7c72f5de421601416	1461310588774	0	35663-4	Protein [Mass/volume] in unspecified time Urine	Prot ?Tm Ur-mCnc	UA	\N
Yadf1bf18f89d96eb01428	1461310590566	0	26454-9	Erythrocytes [#/volume] in Cerebral spinal fluid	RBC # CSF	HEM/BC	\N
v7ee01a872ebc1abc01422	1461310589709	0	626-2	Bacteria identified in Throat by Culture	Bacteria Throat Cult	MICRO	\N
Q922344dac924743d01426	1461310590341	0	34660-1	Hemoglobin A2/Hemoglobin.total in Blood by Chromatography column	Hgb A2 MFr Bld Column Chrom	HEM/BC	\N
Cb5d067e9a62d254f01432	1461310591099	0	5822-2	Yeast [#/area] in Urine sediment by Microscopy high power field	Yeast #/area UrnS HPF	UA	\N
F84915285c01d93f501434	1461310591392	0	49092-0	Second trimester quad maternal screen [interpretation] in Serum or Plasma Narrative	2nd trimester 4 screen SerPl-Imp	CHEM	\N
T8f72e861b27e0edd01436	1461310591549	0	6276-0	Wheat IgE Ab [Units/volume] in Serum	Wheat IgE Qn	ALLERGY	\N
U863c4e4fe742a8cb01442	1461310592166	0	6095-4	American house dust mite IgE Ab [Units/volume] in Serum	D farinae IgE Qn	ALLERGY	\N
H92804aea77772d6901440	1461310591999	0	3281-3	Lupus anticoagulant [interpretation] in Platelet poor plasma	LAC PPP-Imp	COAG	\N
Mb230f2fc6c4cdbe801444	1461310592324	0	25160-3	Granular casts [Presence] in Urine sediment by Light microscopy	Gran Casts UrnS Ql Micro	UA	\N
Kadf7019cf702c73901446	1461310592516	0	33804-6	RBC casts [Presence] in Urine sediment by Light microscopy	RBC Casts UrnS Ql Micro	UA	\N
Le6d7255d7b70face01448	1461310592669	0	703-9	Basophilic stippling [Presence] in Blood by Light microscopy	Baso Stipl Bld Ql Smear	HEM/BC	\N
q8098ec6446321dfa01450	1461310592833	0	6020-2	Alternaria alternata IgE Ab [Units/volume] in Serum	A alternata IgE Qn	ALLERGY	\N
t6f5b83f8588c08bf01454	1461310593149	0	29541-0	HIV 1 RNA [Log #/volume] (viral load) in Plasma by Probe and target amplification method	HIV1 RNA Plas PCR-Log#	MICRO	\N
Od475f4db8f324d3001497	1461310598346	0	6096-2	European house dust mite IgE Ab [Units/volume] in Serum	D pteronyss IgE Qn	ALLERGY	\N
y6b83d514aee083b201519	1461310601841	0	46640-9	Secondary diagnosis RFC		SURVEY.RFC	\N
ub9dfd0f1e0dd2c5c01456	1461310593358	0	6584-7	Virus identified in Unspecified specimen by Culture	Virus XXX Cult	MICRO	\N
bd48b2e3e9c51abaa01473	1461310595625	0	19554-5	Methamphetamine [Presence] in Urine by Screen method	Methamphet Ur Ql Scn	DRUG/TOX	\N
Gc670bb61782a417801487	1461310597250	0	21612-7	Age - Reported	Age - Reported	MISC	\N
pc119401c2d706f4f01459	1461310593616	0	19343-3	Amphetamine [Presence] in Urine by Screen method	Amphet Ur Ql Scn	DRUG/TOX	\N
ma36069f865663a4801475	1461310595974	0	10328-3	Lymphocytes/100 leukocytes in Cerebral spinal fluid by Manual count	Lymphocytes NFr CSF Manual	HEM/BC	\N
s9cceb823a790e24401461	1461310593874	0	13964-2	Methylmalonate [Moles/volume] in Serum or Plasma	Methylmalonate SerPl-sCnc	CHEM	\N
od70b1d7da23ce2e801507	1461310599883	0	49121-7	Erythrocyte inclusion bodies [Identifier] in Blood	RBC inclusions Bld	HEM/BC	\N
P9c29454be67417ec01499	1461310598608	0	26473-9	Leukocytes other/100 leukocytes in Body fluid	WBC Other NFr Fld	HEM/BC	\N
Zd105a5479a62207101489	1461310597425	0	14639-9	Carbamazepine [Moles/volume] in Serum or Plasma	Carbamazepine SerPl-sCnc	DRUG/TOX	\N
f6eb5ec3c8218213d01463	1461310594241	0	802-9	Spherocytes [Presence] in Blood by Light microscopy	Spherocytes Bld Ql Smear	HEM/BC	\N
A94e3be5a5cc38d6601477	1461310596191	0	2705-2	Oxygen [Partial pressure] in Venous blood	pO2 BldV	CHEM	\N
h990069a7a8666c1801465	1461310594499	0	10704-5	Ova and parasites identified in Stool by Light microscopy	O+P Stl Micro	MICRO	\N
Zbe169f29affc7c5b01539	1461310604658	0	8248-7	Spermatozoa [Presence] in Urine sediment by Light microscopy	Sperm UrnS Ql Micro	UA	\N
hce0b3412205172b401515	1461310600992	0	21264-7	Estriol (E3).unconjugated [Multiple of the median] adjusted in Serum or Plasma	u Estriol adj MoM SerPl	CHEM	\N
Wcf2a9148cf4e104901479	1461310596374	0	43994-3	Trisomy 18 risk in Fetus	Ts 18 risk Fetus	CHEM	\N
kb9d4fc71834126c601467	1461310594825	0	5185-4	Hepatitis B virus core IgM Ab [Units/volume] in Serum by Immunoassay	HBV core IgM Ser EIA-aCnc	MICRO	\N
N7c00aaf1b1b593c201491	1461310597599	0	43995-0	Trisomy 21 risk in Fetus	Ts 21 risk Fetus	CHEM	\N
w83f137ec8b867aec01501	1461310598950	0	24108-3	Cancer Ag 19-9 [Units/volume] in Serum or Plasma	Cancer Ag19-9 SerPl-aCnc	CHEM	\N
y88a8fe031cafc55b01469	1461310595141	0	46269-7	25-Hydroxycalciferol [Moles/volume] in Serum or Plasma	25(OH)D2 SerPl-sCnc	CHEM	\N
D6e82858e6725f39a01481	1461310596541	0	14334-7	Lithium [Moles/volume] in Serum or Plasma	Lithium SerPl-sCnc	DRUG/TOX	\N
m896842cc0d7cf3d001525	1461310602800	0	35678-2	Sodium [Moles/volume] in unspecified time Urine	Sodium ?Tm Ur-sCnc	CHEM	\N
c9a5ee74b6a2c84a201471	1461310595383	0	7258-7	Cow milk IgE Ab [Units/volume] in Serum	Cow Milk IgE Qn	ALLERGY	\N
p8184b59ed9dc85f001509	1461310600183	0	13967-5	Sex hormone binding globulin [Moles/volume] in Serum or Plasma	SHBG SerPl-sCnc	CHEM	\N
J6fc653abd07dc6df01493	1461310597783	0	5124-3	Cytomegalovirus IgG Ab [Units/volume] in Serum by Immunoassay	CMV IgG Ser EIA-aCnc	MICRO	\N
Rb384c0b24d6b9f2f01483	1461310596774	0	41477-1	Bacterial sialidase [Presence] in Unspecified specimen	Bacterial sialidase XXX Ql	MICRO	\N
rdaba8f33da9ff17901503	1461310599342	0	5859-4	Herpes simplex virus identified in Unspecified specimen by Organism specific culture	HSV XXX Cult	MICRO	\N
V8835760c87b2d64601485	1461310596991	0	33254-4	pH of Arterial blood adjusted to patients actual temperature	pH temp adj BldA	CHEM	\N
Ia5bf290ac2e7422901495	1461310598016	0	10366-3	Cotinine [Mass/volume] in Urine	Cotinine Ur-mCnc	DRUG/TOX	\N
cc09a004af0693e9701521	1461310602125	0	42216-2	Reference lab name [Identifier]	Ref Lab Name	MISC	\N
kb78411bef23595d301517	1461310601500	0	25836-8	HIV 1 RNA [#/volume] (viral load) in Unspecified specimen by Probe and target amplification method	HIV1 RNA # XXX PCR	MICRO	\N
s7b7f95918a0d310601511	1461310600442	0	3095-7	Urea nitrogen [Mass/volume] in Urine	UUN Ur-mCnc	CHEM	\N
zd6780e88c031585201505	1461310599641	0	5774-5	Calcium oxalate crystals [Presence] in Urine sediment by Light microscopy	CaOx Cry UrnS Ql Micro	UA	\N
W6c5c05fa852e5dc101529	1461310603283	0	5793-5	Granular casts [#/area] in Urine sediment by Microscopy low power field	Gran Casts #/area UrnS LPF	UA	\N
fe574bd95c5bedfc601513	1461310600724	0	6025-1	Aspergillus fumigatus IgE Ab [Units/volume] in Serum	A fumigatus IgE Qn	ALLERGY	\N
V86a31f4c3deda28c01535	1461310604151	0	20495-8	Gliadin IgA Ab [Units/volume] in Serum by Immunoassay	Gliadin IgA Ser EIA-aCnc	SERO	\N
A84f6d93b4be2eae601527	1461310603033	0	10459-6	Alpha-1-Fetoprotein Ag [Presence] in Tissue by Immune stain	AFP Ag Tiss Ql ImStn	PATH	\N
ba007fb7ce57cd13701523	1461310602500	0	48391-7	"Carbon dioxide	 total [Moles/volume] in Venous blood by calculation"	CO2 BldV Calc-sCnc	\N
Ra5e0f195f24ec7b501533	1461310603858	0	34701-3	Platelet Ab.heparin induced [Presence] in Serum	Heparin Ind Platelet Ab Ser Ql	SERO	\N
Dacfa57b6207628d101531	1461310603616	0	6099-6	Dog epithelium IgE Ab [Units/volume] in Serum	Dog Epith IgE Qn	ALLERGY	\N
G9b7630a7974445a201537	1461310604417	0	1761-6	Aldolase [Enzymatic activity/volume] in Serum or Plasma	Aldolase SerPl-cCnc	CHEM	\N
J864f160d8dcf22ab01543	1461310605209	0	31374-2	Epstein Barr virus nuclear IgG Ab [Units/volume] in Serum	EBV NA IgG Ser-aCnc	MICRO	\N
Nb21578f121326fab01541	1461310604934	0	2078-4	Chloride [Moles/volume] in Urine	Chloride Ur-sCnc	CHEM	\N
Iac6c13fb856b9d5801545	1461310605492	0	30083-0	Epstein Barr virus nuclear IgG Ab [Units/volume] in Serum by Immunoassay	EBV NA IgG Ser EIA-aCnc	MICRO	\N
Od26d9a08c4460c6e01547	1461310605767	0	47223-3	Trisomy 18 risk based on maternal age in Fetus	Ts 18 risk-Age Fetus	CHEM	\N
Pa965e5c19c7bff2701549	1461310606017	0	14633-2	C peptide [Moles/volume] in Serum or Plasma	C peptide SerPl-sCnc	CHEM	\N
wa79e1f85652aee6e01551	1461310606326	0	23883-2	Inhibin A [Mass/volume] in Serum	Inhibin A Ser-mCnc	CHEM	\N
r7b8a75ba124d853a01553	1461310606601	0	34468-9	Clostridium difficile toxin A+B [Presence] in Stool by Immunoassay	C dif Tox A+B Stl Ql EIA	MICRO	\N
zd00d826e240d13e301555	1461310606850	0	2881-1	Protein [Mass/volume] in Body fluid	Prot Fld-mCnc	CHEM	\N
Qc829030b32f8655b02476	1461310748744	0	48683-7	Streptococcus agalactiae DNA [Presence] in Unspecified specimen by Probe and target amplification method	Gp B Strep DNA XXX Ql PCR	MICRO	\N
za5fa2839065d5f8701605	1461310615301	0	45371-2	Multiple pregnancy	Multiple Pregnancy	CLIN	\N
Oac78a8bc4d015c5801597	1461310613034	0	46154-1	Trichomonas vaginalis rRNA [Presence] in Unspecified specimen by Probe and target amplification method	T vaginalis rRNA XXX Ql PCR	MICRO	\N
b89e6797fe3eef2da01573	1461310609267	0	38526-0	Number of specimens tested of Stool	# Spec Tst Stl	SPEC	\N
ob1abf6ac56dcdef201557	1461310607101	0	3243-3	Thrombin time in Platelet poor plasma by Coagulation assay	TT Time PPP	COAG	\N
Gaa619114ac40e71301587	1461310611334	0	5332-2	Rubella virus Ab [Presence] in Serum by Latex agglutination	RUBV Ab Ser Ql LA	MICRO	\N
pd7718e559f17823a01559	1461310607418	0	19270-8	Barbiturates [Presence] in Urine by Screen method	Barbiturates Ur Ql Scn	DRUG/TOX	\N
bb23c4a8138e9a6a501623	1461310618558	0	6087-1	Corn IgE Ab [Units/volume] in Serum	Corn IgE Qn	ALLERGY	\N
m8826a3d0fdc4358501575	1461310609592	0	40752-8	Epstein Barr virus early IgG Ab [Presence] in Serum by Immunoassay	EBV EA IgG Ser Ql EIA	MICRO	\N
sc9684de42312910101561	1461310607650	0	15432-8	Testosterone Free/Testosterone.total in Serum or Plasma	Testost Free MFr SerPl	CHEM	\N
f9508fb133bb7c1dd01613	1461310616759	0	11153-4	Hematocrit [Volume Fraction] of Body fluid	Hct VFr Fld	HEM/BC	\N
P74d13ad248f01b3401599	1461310613426	0	6357-8	Chlamydia trachomatis DNA [Presence] in Urine by Probe and target amplification method	C trach DNA Ur Ql PCR	MICRO	\N
Z683adffd57c5958f01589	1461310611601	0	12248-1	Epithelial cells.renal [Presence] in Urine sediment by Light microscopy	Renal Epi Cells UrnS Ql Micro	UA	\N
Acfb739a6c852208801577	1461310609826	0	6833-8	Cat dander IgE Ab [Units/volume] in Serum	Cat Dander IgE Qn	ALLERGY	\N
fd9a305050d8e901001563	1461310607926	0	26466-3	Leukocytes [#/volume] in Body fluid	WBC # Fld	HEM/BC	\N
ha3fc1c3f3deda70101565	1461310608217	0	21440-3	Human papilloma virus 16+18+31+33+35+45+51+52+56 DNA [Presence] in Cervix by DNA probe	HPV I/H Risk DNA Cervix Ql Prb	MICRO	\N
o9785cfd2fff3a21601607	1461310615676	0	2742-5	Angiotensin converting enzyme [Enzymatic activity/volume] in Serum or Plasma	ACE SerPl-cCnc	CHEM	\N
Wcbbfc32287305ba801579	1461310610068	0	5813-1	Trichomonas vaginalis [Presence] in Urine sediment by Light microscopy	T vaginalis UrnS Ql Micro	UA	\N
kcbc9a821fe0561d401567	1461310608467	0	14874-2	Phenobarbital [Moles/volume] in Serum or Plasma	Phenobarb SerPl-sCnc	DRUG/TOX	\N
Na435d91dc11f187f01591	1461310611934	0	5892-5	Protein S [Units/volume] in Platelet poor plasma by Coagulation assay	Prot S PPP-aCnc	COAG	\N
Ace20743c20bc8c6101627	1461310619151	0	11259-9	Hepatitis C virus RNA [Presence] in Serum or Plasma by Probe and target amplification method	HCV RNA SerPl Ql PCR	MICRO	\N
Dcf37e330ccac9e9901581	1461310610376	0	6189-5	White Oak IgE Ab [Units/volume] in Serum	White Oak IgE Qn	ALLERGY	\N
y75e7c5d917e8e8cd01569	1461310608759	0	10835-7	Lipoprotein a [Mass/volume] in Serum or Plasma	LPa SerPl-mCnc	CHEM	\N
wc160fef0c934894401601	1461310614101	0	36904-1	Inhibin A [Multiple of the median] adjusted in Serum	Inhibin A adj MoM Ser	CHEM	\N
yccc6786b9ea3d53701619	1461310617976	0	6741-3	Erythrocytes [#/volume] in Body fluid by Manual count	RBC # Fld Manual	HEM/BC	\N
c889a3fe2bb467fc501571	1461310609009	0	22330-5	Hepatitis D virus Ab [Units/volume] in Serum	HDV Ab Ser-aCnc	MICRO	\N
Jdc827d52540b737301593	1461310612276	0	4552-6	Hemoglobin A2/Hemoglobin.total in Blood by Electrophoresis	Hgb A2 MFr Bld Elph	HEM/BC	\N
Ra669ab1746fe893f01583	1461310610659	0	6075-6	Cladosporium herbarum IgE Ab [Units/volume] in Serum	C herbarum IgE Qn	ALLERGY	\N
pe5d6df6f82ccf8a501609	1461310616018	0	32764-3	Clue cells [Presence] in Unspecified specimen by Wet preparation	Clue Cells XXX Ql Wet Prep	MICRO	\N
Vb85236d81f161c6401585	1461310611001	0	14314-9	Benzoylecgonine [Presence] in Urine by Screen method	BZE Ur Ql Scn	DRUG/TOX	\N
ra41f5094545172ed01603	1461310614917	0	5862-8	Influenza virus A Ag [Presence] in Unspecified specimen by Immunoassay	FLUAV Ag XXX Ql EIA	MICRO	\N
Iabf01e2fad525e1f01595	1461310612659	0	22314-9	Hepatitis A virus IgM Ab [Presence] in Serum	HAV IgM Ser Ql	MICRO	\N
h7282896442130cae01615	1461310617143	0	6875-9	Cancer Ag 15-3 [Units/volume] in Serum or Plasma	Cancer Ag15-3 SerPl-aCnc	CHEM	\N
Zccde2b1abb9a5de901639	1461310620818	0	53962-7	Alpha-1-fetoprotein.tumor marker [Mass/volume] in Serum or Plasma	AFP-TM SerPl-mCnc	CHEM	\N
sa38780745828b35001611	1461310616385	0	42247-7	Hemoglobin pattern [interpretation] in Blood by HPLC Narrative	Hgb Fract Bld HPLC-Imp	HEM/BC	\N
ma2c445c655cb899601625	1461310618859	0	14955-9	Zinc [Moles/volume] in Serum or Plasma	Zinc SerPl-sCnc	DRUG/TOX	\N
c687070256d9d0bff01621	1461310618251	0	7900-4	Helicobacter pylori Ab [Units/volume] in Serum	H pylori Ab Ser-aCnc	MICRO	\N
kb89e7474477bd2e001617	1461310617642	0	32166-1	Choriogonadotropin [Multiple of the median] adjusted in Serum or Plasma	HCG adj MoM SerPl	CHEM	\N
Vbfa1227c6cb4602c01635	1461310620209	0	5370-2	Streptolysin O Ab [Units/volume] in Serum or Plasma	ASO Ab SerPl-aCnc	MICRO	\N
Re6a80d44c527298701633	1461310619918	0	14731-4	Folate [Moles/volume] in Red Blood Cells	Folate RBC-sCnc	CHEM	\N
W6a3e8841f24c273701629	1461310619435	0	38180-6	Hepatitis C virus RNA [log units/volume] (viral load) in Serum or Plasma by Probe and target amplification method	HCV RNA SerPl PCR-Log IU	MICRO	\N
D6d4ee8b70d14724d01631	1461310619651	0	3299-5	Acetaminophen [Presence] in Urine	Acetamin Ur Ql	DRUG/TOX	\N
Ge104f5f69f09af4a01637	1461310620477	0	6041-8	Bermuda grass IgE Ab [Units/volume] in Serum	Bermuda grass IgE Qn	ALLERGY	\N
N937db6ab7bdf94e601641	1461310621193	0	17859-0	Helicobacter pylori IgG Ab [Presence] in Serum or Plasma by Immunoassay	H pylori IgG SerPl Ql EIA	MICRO	\N
Ja5bca368ca03878b01643	1461310621527	0	6212-5	Penicillium notatum IgE Ab [Units/volume] in Serum	P notatum IgE Qn	ALLERGY	\N
Ie59a1e67140389ee01645	1461310621860	0	22496-4	Rubella virus Ab [Presence] in Serum	RUBV Ab Ser Ql	MICRO	\N
O7976cb098832b0e201647	1461310622101	0	49050-8	Microscopic observation [Identifier] in Endocervical brush by Cyto stain	Cyto Endocvx brush	CYTO	\N
Pcd4e5f96ce43e7b501649	1461310622368	0	21190-4	Chlamydia trachomatis DNA [Presence] in Cervix by Probe and target amplification method	C trach DNA Cervix Ql PCR	MICRO	\N
wd8708926fdf702f001651	1461310622610	0	30457-6	Nonhematic cells/100 leukocytes in Body fluid	Nonhematic Cells NFr Fld	HEM/BC	\N
z8c6f73c40f93a84701655	1461310623285	0	7966-5	Mumps virus IgG Ab [Units/volume] in Serum	MuV IgG Ser-aCnc	MICRO	\N
da415a1496f47181701662	1461310624411	0	6085-5	Common Ragweed IgE Ab [Units/volume] in Serum	Common Ragweed IgE Qn	ALLERGY	\N
Q8703765c41d9db1b03326	1461310868898	0	32546-4	Glucose-6-Phosphate dehydrogenase [Enzymatic activity/mass] in Red Blood Cells	G6PD RBC-cCnt	CHEM	\N
Hb25620d0753ef85801690	1461310628537	0	1795-4	Amylase [Enzymatic activity/volume] in Body fluid	Amylase Fld-cCnc	CHEM	\N
rad5a17cda7edc1ba01653	1461310622968	0	34985-2	Unidentified cells/100 leukocytes in Body fluid	Unident Cells NFr Fld	HEM/BC	\N
Y888882e8bb037e4701678	1461310626961	0	70203-5	Cholesterol in VLDL 3 [Moles/volume] in Serum or Plasma	VLDL3c SerPl-sCnc	CHEM	\N
ga338666f26b216c601664	1461310624678	0	6110-1	English Plantain IgE Ab [Units/volume] in Serum	Engl Plantain IgE Qn	ALLERGY	\N
T921ad22d04ada0a801736	1461310635887	0	19153-6	Volume of unspecified time Urine	Specimen vol ?Tm Ur	SPEC	\N
a77c849a7527a0fec01710	1461310631661	0	14627-4	Bicarbonate [Moles/volume] in Venous blood	HCO3 BldV-sCnc	CHEM	\N
e750fcf424432e8b001702	1461310630394	0	2064-4	Ceruloplasmin [Mass/volume] in Serum or Plasma	Ceruloplasmin SerPl-mCnc	CHEM	\N
Ud03c670a3c69bed101692	1461310628903	0	1871-3	Apolipoprotein B-100 [Mass/volume] in Serum or Plasma	Apo B100 SerPl-mCnc	CHEM	\N
Eaf08306145b5a4e001680	1461310627220	0	49062-3	Lipid risk factors [Finding]	Lipid risk factors Patient	CHEM	\N
j7a02c17f379b61f301666	1461310624961	0	6303-2	Dilute Russell viper venom time (dRVVT) in Platelet poor plasma by Coagulation assay	dRVV Tme Time PPP	COAG	\N
lda18a6a1469648a101668	1461310625295	0	27811-9	Antithrombin actual/normal in Platelet poor plasma by Chromogenic method	AT III Act/Nor PPP Chro	COAG	\N
Fcdc22e21ed338dd301734	1461310635287	0	20444-6	Herpes simplex virus 1+2 DNA [Presence] in Unspecified specimen by Probe and target amplification method	HSV1+2 DNA XXX Ql PCR	MICRO	\N
C92c0c46b563b7fa301682	1461310627494	0	32046-5	Pregnancy associated plasma protein A [Units/volume] in Serum or Plasma	PAPP-A SerPl-aCnc	CHEM	\N
x79c69031f8feab8401670	1461310625644	0	47213-4	Cholesterol in LDL real size pattern [Identifier] in Serum or Plasma	LDLc real size Pat SerPl	CHEM	\N
M89d9602ff6bda99001694	1461310629186	0	33716-2	Non-gynecological cytology method study		ATTACH.CLINRPT	\N
Yc459f2cbad3ba5f001728	1461310634254	0	15205-8	Rheumatoid factor [Units/volume] in Serum by Nephlometry	Rheumatoid fact Ser Neph-aCnc	SERO	\N
F86544ce08a93070d01684	1461310627719	0	26760-9	Cannabinoids [Units/volume] in Urine	Cannabinoids Ur-aCnc	DRUG/TOX	\N
vac5937a4ee30be3101672	1461310626028	0	31145-6	Thyroxine (T4) [Moles/volume] in Dried blood spot	T4 DBS-sCnc	CHEM	\N
lda1d9ea56765cb0b01718	1461310632853	0	13514-5	Hemoglobin pattern [interpretation] in Blood by Electrophoresis Narrative	Hgb Fract Bld Elph-Imp	HEM/BC	\N
tb432448ab0c17b8601704	1461310630737	0	792-2	Erythrocytes [#/volume] in Cerebral spinal fluid by Manual count	RBC # CSF Manual	HEM/BC	\N
ne21c149d261e30bd01674	1461310626336	0	70201-9	Cholesterol in IDL [Moles/volume] in Serum or Plasma	IDLc SerPl-sCnc	CHEM	\N
Ke014382eeae8382601696	1461310629512	0	14586-2	Aldosterone [Moles/volume] in Serum or Plasma	Aldost SerPl-sCnc	CHEM	\N
T7480ffd074f6ee4001686	1461310627920	0	13183-9	White Elm IgG Ab [Units/volume] in Serum	White Elm IgG Qn	ALLERGY	\N
Q830fa62ce296377c01676	1461310626653	0	70202-7	Cholesterol in IDL+Cholesterol in VLDL 3 [Moles/volume] in Serum or Plasma	IDLc+VLDL3c SerPl-sCnc	CHEM	\N
d7cc272302631bee401712	1461310631928	0	31204-1	Hepatitis B virus core IgM Ab [Presence] in Serum	HBV core IgM Ser Ql	MICRO	\N
Ba28b33f663af5d2701688	1461310628195	0	29967-7	Neutrophil cytoplasmic IgG Ab [Titer] in Serum by Immunofluorescence	ANCA IgG Titr Ser IF	SERO	\N
u8186ba05eff8662f01706	1461310631053	0	29771-3	Hemoglobin.gastrointestinal [Presence] in Stool by Immunologic method	Occult Bld Stl Ql Imm	CHEM	\N
Lbfddcc243f4a4af101698	1461310629795	0	34574-4	Pathology report final diagnosis	Path report.final Dx Spec	TUMRRGT	\N
n6bc8430fa197440101724	1461310633678	0	13953-5	Hepatitis B virus e Ab [Presence] in Serum by Immunoassay	HBV e Ab Ser Ql EIA	MICRO	\N
g8fbe309b4dba29d901714	1461310632162	0	14626-6	Beta-2-Microglobulin [Moles/volume] in Serum	B2 Microglob Ser-sCnc	CHEM	\N
qaa32532530cc321a01700	1461310630095	0	45353-0	Date of analysis of unspecified specimen	Date Of Analysis XXX	MISC	\N
i8a6601d6f44d64ed01708	1461310631387	0	30170-5	American Cockroach IgE Ab [Units/volume] in Serum	Amer Roach IgE Qn	ALLERGY	\N
x9360ed425be68a0c01720	1461310633095	0	24012-7	HIV 1 Ag [Presence] in Serum	HIV1 Ag Ser Ql	MICRO	\N
C756b90abd2b4cf7701732	1461310634945	0	709-6	Blasts/100 leukocytes in Blood by Manual count	Blasts NFr Bld Manual	HEM/BC	\N
j8ffdf5c91cdf64f101716	1461310632578	0	1952-1	Beta-2-Microglobulin [Mass/volume] in Serum	B2 Microglob Ser-mCnc	CHEM	\N
Qd8726f2b192c92cb01726	1461310633961	0	14745-4	Glucose [Moles/volume] in Body fluid	Glucose Fld-sCnc	CHEM	\N
vbcc0c8285ce34d1401722	1461310633368	0	5222-5	HIV 1 Ag [Presence] in Serum by Immunoassay	HIV1 Ag Ser Ql EIA	MICRO	\N
Bd20c536b4a0c2a4201738	1461310636581	0	3209-4	Coagulation factor VIII activity actual/normal in Platelet poor plasma by Coagulation assay	Fact VIII Act/Nor PPP	COAG	\N
E98ab6a4fad4cbc8e01730	1461310634587	0	29770-5	Karyotype [Identifier] in Blood or Tissue Nominal	Karyotyp Bld/T	MOLPATH	\N
Uda7220a1972864f301742	1461310637796	0	5866-9	Influenza virus B Ag [Presence] in Unspecified specimen by Immunoassay	FLUBV Ag XXX Ql EIA	MICRO	\N
Had18169bef18d34d01740	1461310637271	0	7155-5	Boxelder IgE Ab [Units/volume] in Serum	Boxelder IgE Qn	ALLERGY	\N
M8522ed81c483cefb01744	1461310638204	0	13590-5	Activated protein C resistance [Time Ratio] in Platelet poor plasma by Coagulation assay	aPCR PPP	COAG	\N
Kb2f4112e4829bd2601746	1461310638679	0	47528-5	Cytology report of Cervical or vaginal smear or scraping Cyto stain	Cytology Cvx/Vag Doc Cyto	CYTO	\N
L69b89fe75e689f5301748	1461310638978	0	6106-9	Egg white IgE Ab [Units/volume] in Serum	Egg White IgE Qn	ALLERGY	\N
qc7a25db3d9064e2901750	1461310639237	0	2006-5	Cancer Ag 125 [Presence] in Serum or Plasma	Cancer Ag125 SerPl Ql	CHEM	\N
ec874b7e84e6f3d2901752	1461310639571	0	655-1	Microscopic observation [Identifier] in Unspecified specimen by Acid fast stain.Kinyoun modified	Acid fast Mod Kiny Stn XXX	MICRO	\N
t7a8683fef59097dd01754	1461310639853	0	3854-7	Nicotine [Mass/volume] in Urine	Nicotine Ur-mCnc	DRUG/TOX	\N
vb583837bd905ce0701822	1461310650721	0	14995-5	Glucose [Moles/volume] in Serum or Plasma --2 hours post 75 g glucose PO	Glucose 2h p 75 g Glc PO SerPl-sCnc	CHAL	\N
Kb7ec41f88fc7837401796	1461310646146	0	2915-7	Renin [Enzymatic activity/volume] in Plasma	Renin Plas-cCnc	CHEM	\N
u73a388b7853a770501756	1461310640137	0	16131-5	Herpes simplex virus 2 DNA [Presence] in Unspecified specimen by Probe and target amplification method	HSV2 DNA XXX Ql PCR	MICRO	\N
vdf71c582efd994c501772	1461310642804	0	10900-9	Hepatitis B virus surface Ab [Presence] in Serum by Immunoassay	HBV surface Ab Ser Ql EIA	MICRO	\N
dbd347c6a58b999cf01812	1461310649076	0	5177-1	Helicobacter pylori IgM Ab [Units/volume] in Serum by Immunoassay	H pylori IgM Ser EIA-aCnc	MICRO	\N
T7da515585b8ed93301786	1461310644754	0	13046-8	Lymphocytes Variant/100 leukocytes in Blood	Variant Lymphs NFr Bld	HEM/BC	\N
ie6fece790208e5ab01758	1461310640446	0	13954-3	Hepatitis B virus e Ag [Presence] in Serum by Immunoassay	HBV e Ag Ser Ql EIA	MICRO	\N
nd40d08cd61cab39901774	1461310643096	0	3284-7	Lupus anticoagulant neutralization platelet [Time] in Platelet poor plasma by Coagulation assay	LAC Nt Platelet Time PPP	COAG	\N
ad286b6df2856a87a01760	1461310640796	0	26446-5	Blasts/100 leukocytes in Blood	Blasts NFr Bld	HEM/BC	\N
lcd6c3d40a5d1488001818	1461310650088	0	15054-0	Dehydroepiandrosterone (DHEA) [Moles/volume] in Serum or Plasma	DHEA SerPl-sCnc	CHEM	\N
ud3f2031da5f9c17001806	1461310647796	0	6182-0	Mucor racemosus IgE Ab [Units/volume] in Serum	M racemosus IgE Qn	ALLERGY	\N
Lbefe4f9d99f7665c01798	1461310646554	0	27416-7	SCL-70 extractable nuclear Ab [Units/volume] in Serum	ENA Scl70 Ab Ser-aCnc	SERO	\N
Bb963191c89254fc201788	1461310645054	0	5351-2	Sjogrens syndrome-A extractable nuclear Ab [Presence] in Serum by Immunoassay	ENA SS-A Ab Ser Ql EIA	SERO	\N
dd30bdd79aa32775e01762	1461310641121	0	7792-5	Dohle body [Presence] in Blood by Light microscopy	Dohle Bod Bld Ql Smear	HEM/BC	\N
Qdb2fc2f7f22fd63001776	1461310643354	0	3414-0	Buprenorphine [Presence] in Urine	Buprenorphine Ur Ql	DRUG/TOX	\N
gcbcbbfcd3df975ba01764	1461310641438	0	2529-6	Lactate dehydrogenase [Enzymatic activity/volume] in Body fluid	LDH Fld-cCnc	CHEM	\N
Y83aba719eb526d3f01778	1461310643554	0	20404-0	Fibronectin.fetal [Presence] in Vaginal fluid	Fibronectin Fetal Vag Ql	CHEM	\N
jaf102ddd0db364d001766	1461310641745	0	41399-7	Herpes simplex virus 1+2 IgM Ab [Units/volume] in Serum by Immunoassay	HSV1+2 IgM Ser EIA-aCnc	MICRO	\N
Hb66e7f9677a58ae701790	1461310645346	0	6412-1	Giardia lamblia Ag [Presence] in Stool by Immunoassay	G lamblia Ag Stl Ql EIA	MICRO	\N
ldab48226c6e52b6d01768	1461310642079	0	3034-6	Transferrin [Mass/volume] in Serum or Plasma	Transferrin SerPl-mCnc	CHEM	\N
Qb6a0462a15257ae801826	1461310651513	0	51724-3	Cefuroxime [Susceptibility]	Cefuroxime Susc Islt	ABXBACT	\N
E6854ac8b46ff307901780	1461310643796	0	10998-3	Oxycodone [Presence] in Urine	Oxycodone Ur Ql	DRUG/TOX	\N
qe5b2f4e18035510501800	1461310646879	0	6565-6	Trichomonas vaginalis [Identifier] in Genital specimen by Wet preparation	T vaginalis Genital Wet Prep	MICRO	\N
xa481a1ec344cca5201770	1461310642437	0	22674-6	Transferrin [Moles/volume] in Serum or Plasma	Transferrin SerPl-sCnc	CHEM	\N
gd7a44187316d1ad601814	1461310649479	0	13516-0	Neutrophils/100 leukocytes in Cerebral spinal fluid by Manual count	Neutrophils NFr CSF Manual	HEM/BC	\N
Udf29a5ea82acb9ae01792	1461310645629	0	2614-6	Methemoglobin/Hemoglobin.total in Blood	MetHgb MFr Bld	CHEM	\N
C9d2abe5f315547ab01782	1461310644113	0	10976-9	6-Monoacetylmorphine (6-MAM) [Presence] in Urine	6MAM Ur Ql	DRUG/TOX	\N
ic60113ca6901003301808	1461310648112	0	49544-0	Newborn screening recommended follow-up [interpretation]	NB screen recommended f/u Patient-Imp	CHEM	\N
Fdf71351ece6f2a4f01784	1461310644445	0	14674-6	Corticotropin [Moles/volume] in Plasma	ACTH Plas-sCnc	CHEM	\N
e9d0d6651282373c101802	1461310647196	0	21003-9	Fungus identified in Unspecified specimen by Fungus stain	Fungus XXX Fungus Stn	MICRO	\N
M7ff166549822f4a101794	1461310645929	0	5353-8	Sjogrens syndrome-B extractable nuclear Ab [Presence] in Serum by Immunoassay	ENA SS-B Ab Ser Ql EIA	SERO	\N
C91dbcbb263391efb01832	1461310652509	0	46735-7	Endocrine disorders newborn screen interpretation	Endocrine Disorders DBS-Imp	CHEM	\N
x9c2dd4f61a948f4301820	1461310650404	0	30243-0	Choriogonadotropin.intact [Units/volume] in Serum or Plasma	HGC Intact SerPl-aCnc	CHEM	\N
a6d80336c97a2870101810	1461310648371	0	3297-9	Acetaminophen [Presence] in Serum or Plasma	Acetamin SerPl Ql	DRUG/TOX	\N
tc150ef815e5bda8801804	1461310647480	0	5639-0	Ethanol [Presence] in Blood	Ethanol Bld Ql	DRUG/TOX	\N
j9b1305b99941956701816	1461310649771	0	4023-8	Salicylates [Presence] in Serum or Plasma	Salicylates SerPl Ql	DRUG/TOX	\N
nd4e3e0934bc0186301824	1461310651104	0	4547-6	Hemoglobin A1/Hemoglobin.total in Blood	Hgb A1 MFr Bld	HEM/BC	\N
Ee26314486042cc8f01830	1461310652163	0	6152-3	Johnson grass IgE Ab [Units/volume] in Serum	Johnson grass IgE Qn	ALLERGY	\N
Y82f877d0f0b1558101828	1461310651830	0	15061-5	Erythropoietin (EPO) [Units/volume] in Serum or Plasma	EPO SerPl-aCnc	CHEM	\N
F772862091916bdb201834	1461310652755	0	6252-1	Stemphylium botryosum IgE Ab [Units/volume] in Serum	S botryosum IgE Qn	ALLERGY	\N
Te2257597ecd228b201836	1461310653063	0	32286-7	Hepatitis C virus genotype [Identifier] in Serum or Plasma by Probe and target amplification method	HCV Gentyp SerPl PCR	MICRO	\N
Bd94c109f6fd1cb7d01838	1461310653413	0	17948-1	Fungus # 3 identified in Unspecified specimen by Culture	Fungus XXX Cult org #3	MICRO	\N
N9109d61da122025a01841	1461310653805	0	5199-5	Hepatitis C virus Ab [Presence] in Serum by Immunoblot (IB)	HCV Ab Ser Ql IB	MICRO	\N
Ja6a70ed4540ab8d701843	1461310654105	0	17947-3	Fungus # 2 identified in Unspecified specimen by Culture	Fungus XXX Cult org #2	MICRO	\N
Ia226aedd517bbf7d01845	1461310654422	0	17949-9	Fungus # 4 identified in Unspecified specimen by Culture	Fungus XXX Cult org #4	MICRO	\N
Oadb9348a30f4ae5901847	1461310654871	0	42637-9	Natriuretic peptide B [Mass/volume] in Blood	BNP Bld-mCnc	CHEM	\N
P6c5789f516cd5c8301849	1461310655146	0	9327-8	Phosphatidylserine IgM Ab [Presence] in Serum by Immunoassay	PS IgM Ser Ql EIA	COAG	\N
E76c72c5a275bb9f102030	1461310683732	0	4090-7	Vancomycin [Mass/volume] in Serum or Plasma --peak	Vancomycin Peak SerPl-mCnc	DRUG/TOX	\N
wac6e09699cdf13a801851	1461310655421	0	14679-5	Cortisol [Moles/volume] in Serum or Plasma --AM peak specimen	Cortis AM peak SerPl-sCnc	CHEM	\N
J8024bd6faf82005b01893	1461310662414	0	70216-7	Salicylates [Moles/volume] in Serum or Plasma by Screen method	Salicylates SerPl Scn-sCnc	DRUG/TOX	\N
y73e667f1a93148cc01869	1461310658230	0	18929-0	Gentamicin.high potency [Susceptibility]	Gentamicin Synergy Susc Islt	ABXBACT	\N
r84cbc92ba973a6a101853	1461310655663	0	14569-8	17-Hydroxyprogesterone [Moles/volume] in Serum or Plasma	17OHP SerPl-sCnc	CHEM	\N
mc35180aaf319c3c601925	1461310667764	0	8665-2	Date last menstrual period	Date LMP	H&P.HX	\N
yc87eb6c9d9a66ff801919	1461310666722	0	56490-6	Hemoglobin.gastrointestinal [Presence] in Stool by Immunologic method --2nd specimen	Occult Bld sp2 Stl Ql Imm	CHEM	\N
R9bfda9fb84a07f2901883	1461310660755	0	2745-8	pH of Capillary blood	pH BldC	CHEM	\N
z75173005e59d6db101855	1461310655896	0	14604-3	Blood group antibodies present [Identifier] in Serum or Plasma from Blood product unit	Bld gp Ab present SerPl BPU	BLDBK	\N
c6f450b2d2801ab7e01871	1461310658613	0	2004-0	Calcium [Moles/volume] in Urine	Calcium Ur-sCnc	CHEM	\N
pa7bba10618439df801909	1461310665055	0	14836-1	Methotrexate [Moles/volume] in Serum or Plasma	MTX SerPl-sCnc	DRUG/TOX	\N
oaa28d15ba2d9d48101857	1461310656147	0	20513-8	Turbidity of Body fluid Qualitative	Turbidity Fld Ql	SPEC	\N
Ia5db9ffcd44ebf2b01895	1461310662780	0	3665-7	Gentamicin [Mass/volume] in Serum or Plasma --trough	Gentamicin Trough SerPl-mCnc	DRUG/TOX	\N
bd144dbd834114dea01873	1461310658938	0	6034-3	Bahia grass IgE Ab [Units/volume] in Serum	Bahia grass IgE Qn	ALLERGY	\N
pd1cd91a927d1bb9001859	1461310656446	0	48035-0	Hemoglobin [Presence] in Cerebral spinal fluid	Hgb CSF Ql	HEM/BC	\N
V90ea23b72e1001db01885	1461310661113	0	33022-5	Carbon dioxide [Partial pressure] in Capillary blood by Transcutaneous CO2 monitor	pCO2 BldC TcCo2	PULM	\N
h9fafe0707b5f3a9b01915	1461310666063	0	14765-2	Glucose [Moles/volume] in Serum or Plasma --3 hours post dose glucose	Glucose 3h p Glc SerPl-sCnc	CHAL	\N
rbe7ecc78cb0b0e2a01903	1461310664130	0	32765-0	Yeast [Presence] in Unspecified specimen by Wet preparation	Yeast XXX Ql Wet Prep	MICRO	\N
s789112a98df69e5f01861	1461310656713	0	1825-9	Alpha 1 antitrypsin [Mass/volume] in Serum or Plasma	A1AT SerPl-mCnc	CHEM	\N
m9e561eb3583e109901875	1461310659339	0	5358-7	Smooth muscle Ab [Titer] in Serum by Immunofluorescence	Smooth muscle Ab Titr Ser IF	SERO	\N
fbf5167227550455701863	1461310656980	0	5213-4	Heterophile Ab [Presence] in Serum by Latex agglutination	Heteroph Ab Ser Ql LA	MICRO	\N
Ga3ac19515441abf201887	1461310661480	0	13438-7	Protein Fractions [interpretation] in Urine by Electrophoresis	Prot Pattern Ur Elph-Imp	CHEM	\N
A6bdd5810d6be132201877	1461310659622	0	5388-4	Toxoplasma gondii IgG Ab [Units/volume] in Serum by Immunoassay	T gondii IgG Ser EIA-aCnc	MICRO	\N
hcd7d0ffc08e1044d01865	1461310657480	0	13440-3	Immunofixation [interpretation] for Urine	Interpretation Ur IFE-Imp	CHEM	\N
Oafee555e97223a0f01897	1461310663072	0	22747-0	Gentamicin [Moles/volume] in Serum or Plasma --trough	Gentamicin Trough SerPl-sCnc	DRUG/TOX	\N
kbffc3feee4112a7b01867	1461310657871	0	6039-2	Beef IgE Ab [Units/volume] in Serum	Beef IgE Qn	ALLERGY	\N
We2353fa67b56aa4001879	1461310659980	0	27948-9	Herpes simplex virus 1+2 IgG Ab [Units/volume] in Serum by Immunoassay	HSV1+2 IgG Ser EIA-aCnc	MICRO	\N
Zb12d6bc452750b1b01889	1461310661755	0	8117-4	CD19 cells/100 cells in Blood	CD19 Cells NFr Bld	CELLMARK	\N
sa83a8a64caa2213101911	1461310665372	0	6924-5	Gliadin IgA Ab [Units/volume] in Serum	Gliadin IgA Ser-aCnc	SERO	\N
zafe51719dbdf307e01905	1461310664439	0	20563-3	Carboxyhemoglobin/Hemoglobin.total in Blood	COHgb MFr Bld	CHEM	\N
P91e5f17b247130e501899	1461310663454	0	14753-8	Glucose [Moles/volume] in Serum or Plasma --1 hour post 100 g glucose PO	Glucose 1h p 100 g Glc PO SerPl-sCnc	CHAL	\N
Dc2e2fc74f31f409c01881	1461310660355	0	9439-1	Casts [#/area] in Urine sediment by Microscopy high power field	Casts #/area UrnS HPF	UA	\N
Nddfcd01b6892197c01891	1461310662155	0	38527-8	Number of specimens received of Stool	# Spec Recd Stl	SPEC	\N
ba608a8adf9dd256501923	1461310667405	0	14759-5	Glucose [Moles/volume] in Serum or Plasma --2 hours post dose glucose	Glucose 2h p Glc SerPl-sCnc	CHAL	\N
kd3c34a124a82f0fc01917	1461310666389	0	5876-8	Respiratory syncytial virus Ag [Presence] in Unspecified specimen by Immunoassay	RSV Ag XXX Ql EIA	MICRO	\N
wa909ca4e8dbc2f2f01901	1461310663772	0	13527-7	Unidentified cells/100 leukocytes in Cerebral spinal fluid by Manual count	Unident Cells NFr CSF Manual	HEM/BC	\N
oe4f4e00ebbedc35b01907	1461310664789	0	51597-3	Glucose [Moles/volume] in Serum or Plasma --1 hour post 75 g glucose PO	Glucose 1h p 75 g Glc PO SerPl-sCnc	CHAL	\N
f6b4740b04ae08ff401913	1461310665705	0	18983-7	Streptomycin.high potency [Susceptibility]	Streptomycin High Pot Susc Islt	ABXBACT	\N
ca6c19424f8c236af01921	1461310667063	0	56491-4	Hemoglobin.gastrointestinal [Presence] in Stool by Immunologic method --3rd specimen	Occult Bld sp3 Stl Ql Imm	CHEM	\N
D9bfd6137bc5677fa01931	1461310668763	0	26486-1	Monocytes/100 leukocytes in Cerebral spinal fluid	Monocytes NFr CSF	HEM/BC	\N
A79e720eec7fd866201927	1461310668122	0	27819-2	Protein C actual/normal in Platelet poor plasma by Coagulation assay	Prot C Act/Nor PPP	COAG	\N
W86f904d761fff53e01929	1461310668447	0	5076-5	Cardiolipin IgA Ab [Units/volume] in Serum by Immunoassay	Cardiolipin IgA Ser EIA-aCnc	COAG	\N
R82ffb12c80813e9001933	1461310669138	0	1884-6	Apolipoprotein B [Mass/volume] in Serum or Plasma	Apo B SerPl-mCnc	CHEM	\N
V9b1c8a3720a0cd4d01935	1461310669489	0	29953-7	Nuclear Ab [Titer] in Serum	ANA Titr Ser	SERO	\N
Gba8bb8d582692fae01937	1461310669914	0	7291-8	Whole Egg IgE Ab [Units/volume] in Serum	Whole Egg IgE Qn	ALLERGY	\N
Z6eb9a423797c3a5001939	1461310670247	0	22745-4	Ethanol [Moles/volume] in Urine	Ethanol Ur-sCnc	DRUG/TOX	\N
Nc210fa876d68a8fc01941	1461310670580	0	11545-1	Microscopic observation [Identifier] in Unspecified specimen by Acid fast stain	Acid fast Stn XXX	MICRO	\N
Ja235a5dcbe79cbc201943	1461310670822	0	6473-3	Microscopic observation [Identifier] in Tissue by Trichrome stain	Tri Stn Tiss	MICRO	\N
Ib89207bc94be4ed501945	1461310671272	0	20460-2	Cefuroxime Oral [Susceptibility] by Minimum inhibitory concentration (MIC)	Cefuroxime Oral Islt MIC	ABXBACT	\N
O82377db0fb9b990201947	1461310671664	0	14757-9	Glucose [Moles/volume] in Serum or Plasma --2 hours post 100 g glucose PO	Glucose 2h p 100 g Glc PO SerPl-sCnc	CHAL	\N
Y95eedd7a5c7f244602478	1461310748978	0	20574-0	Histoplasma capsulatum yeast phase Ab [Titer] in Serum by Complement fixation	H capsul Yst Ab Titr Ser CF	MICRO	\N
Gbce56c189bc5c1cc01987	1461310677439	0	6244-8	Sheep Sorrel IgE Ab [Units/volume] in Serum	Sheep Sorrel IgE Qn	ALLERGY	\N
Ab60302a59953b37201977	1461310676047	0	13508-7	Hematocrit [Volume Fraction] of Cerebral spinal fluid by Centrifugation	Hct VFr CSF Spun	HEM/BC	\N
Pb3332d8649abf79401949	1461310672047	0	21033-6	Yeast.budding [Presence] in Urine sediment	Yeast Budding UrnS Ql	UA	\N
E958830f1053477a802480	1461310749144	0	49539-0	Cytomegalovirus IgM Ab [Presence] in Serum by Immunofluorescence	CMV IgM Ser Ql IF	MICRO	\N
hbb7d0d5f2680fdeb01965	1461310674414	0	38908-0	Poikilocytosis [Presence] in Blood by Automated count	Poikilocytosis Bld Ql Auto	HEM/BC	\N
cc37cc4c71e4c270d02021	1461310682423	0	19415-9	Tetrahydrocannabinol [Presence] in Urine by Screen method	THC Ur Ql Scn	DRUG/TOX	\N
w74981913fda7021101951	1461310672314	0	19941-4	Oxygen gas flow Oxygen delivery system	Gas flow.O2 O2 delivery sys	PULM	\N
Wdab952e3a22a564501979	1461310676289	0	11135-1	Appearance of Spun Cerebral spinal fluid	Appearance spun CSF	SPEC	\N
C6bc09d303f958ab202482	1461310749419	0	33721-2	Bone marrow Pathology biopsy report		ATTACH.CLINRPT	\N
kac205570f23634e001967	1461310674681	0	13517-8	Lymphocytes Variant/100 leukocytes in Cerebral spinal fluid by Manual count	Variant Lymphs NFr CSF Manual	HEM/BC	\N
rd39f7b786a77dd0101953	1461310672589	0	6073-1	Chocolate IgE Ab [Units/volume] in Serum	Chocolate IgE Qn	ALLERGY	\N
Fba6ede46819d45e702484	1461310749744	0	5127-6	Cytomegalovirus IgM Ab [Titer] in Serum by Immunofluorescence	CMV IgM Titr Ser IF	MICRO	\N
Ob6e8cfe09618b01501997	1461310678906	0	11064-3	Urea nitrogen [Mass/volume] in Serum or Plasma --post dialysis	BUN p dialysis SerPl-mCnc	CHEM	\N
Ze4ca13384f7338d401989	1461310677764	0	6219-0	Pork IgE Ab [Units/volume] in Serum	Pork IgE Qn	ALLERGY	\N
zc3606c61a6b9d7a701955	1461310672905	0	12208-5	Eosinophils/100 leukocytes in Cerebral spinal fluid by Manual count	Eosinophil NFr CSF Manual	HEM/BC	\N
Te4e17c408bb5809e02486	1461310750094	0	33773-3	Karyotype [Identifier] in Amniotic fluid Nominal	Karyotyp Amn	MOLPATH	\N
yb60bf21923c78bd801969	1461310674939	0	41016-7	Bilirubin.total [Moles/volume] in Urine by Test strip	Bilirub Ur Strip-sCnc	UA	\N
Dbdc7becc6869454d01981	1461310676623	0	13525-1	Nonhematic cells/100 leukocytes in Cerebral spinal fluid by Manual count	Nonhematic Cells NFr CSF Manual	HEM/BC	\N
oe1bfccda6784727201957	1461310673172	0	12278-8	Neutrophils.band form/100 leukocytes in Cerebral spinal fluid by Manual count	Neuts Band NFr CSF Manual	HEM/BC	\N
B9c9943fd041c530502488	1461310750561	0	49051-6	Gestational age in weeks	GA (weeks)	OB.US	\N
cdb4cbbc96c4cfed801971	1461310675291	0	13529-3	Nucleated erythrocytes [#/volume] in Cerebral spinal fluid by Manual count	nRBC # CSF Manual	HEM/BC	\N
pc3597b4a90b7a57201959	1461310673456	0	14637-3	Calcium [Moles/time] in 24 hour Urine	Calcium 24h Ur-sRate	CHEM	\N
hab7d709710c76a7a02015	1461310681448	0	8234-7	Phencyclidine [Presence] in Meconium by Screen method	PCP Mec Ql Scn	DRUG/TOX	\N
zcdd8a37c259fd36502005	1461310680148	0	13068-2	Nuclear Ab pattern [interpretation] in Serum by Immunofluorescence	ANA Pat Ser IF-Imp	SERO	\N
H7742872def99055e02490	1461310750994	0	7789-1	Acanthocytes [Presence] in Blood by Light microscopy	Acanthocytes Bld Ql Smear	HEM/BC	\N
Nb80a3fa17261db5e01991	1461310678122	0	11050-2	Immunoglobulin light chains.kappa [Mass/volume] in Serum	Kappa LC Ser-mCnc	CHEM	\N
R85f351600bb6501001983	1461310676865	0	14764-5	Glucose [Moles/volume] in Serum or Plasma --3 hours post 100 g glucose PO	Glucose 3h p 100 g Glc PO SerPl-sCnc	CHAL	\N
se143cf9168fd7c9b01961	1461310673764	0	13519-4	Basophils/100 leukocytes in Cerebral spinal fluid by Manual count	Basophils NFr CSF Manual	HEM/BC	\N
b8eded5c3de34fd3501973	1461310675573	0	10329-1	Monocytes/100 leukocytes in Cerebral spinal fluid by Manual count	Monocytes NFr CSF Manual	HEM/BC	\N
U9bfe2478cf9c6fb502492	1461310751294	0	8338-6	Body weight Measured --ante partum	Weight ante partum Measured	BDYWGT.MOLEC	\N
fdeae603297c8435601963	1461310674148	0	3160-9	Volume of Semen	Specimen vol Smn	FERT	\N
Pa77e3f214bee032c01999	1461310679331	0	6273-7	Walnut IgE Ab [Units/volume] in Serum	Walnut IgE Qn	ALLERGY	\N
mde85231e78c1ec6201975	1461310675806	0	26472-1	Leukocytes other/100 leukocytes in Cerebral spinal fluid	WBC Other NFr CSF	HEM/BC	\N
Vb9b352eb0beb3f1801985	1461310677215	0	28008-1	Cytomegalovirus DNA [Presence] in Blood by Probe and signal amplification method	CMV DNA Bld Ql bDNA	MICRO	\N
s90cc30da2dceac8302011	1461310680965	0	14756-1	Glucose [Moles/volume] in Serum or Plasma --1 hour post dose glucose	Glucose 1h p Glc SerPl-sCnc	CHAL	\N
J87a766c47e5dce7701993	1461310678489	0	783-1	Promyelocytes/100 leukocytes in Blood by Manual count	Promyelocytes NFr Bld Manual	HEM/BC	\N
wa26af3facf9745c402001	1461310679598	0	14638-1	Calculus analysis [interpretation] in Stone	Stone Analysis-Imp	CHEM	\N
I68d6bfbe4526c10801995	1461310678681	0	70207-6	Estrogen [Moles/volume] in Serum or Plasma	Estrogen SerPl-sCnc	CHEM	\N
odb7992ff9f490a5a02007	1461310680381	0	8149-7	Amphetamines [Presence] in Serum or Plasma by Screen method	Amphetamines SerPl Ql Scn	DRUG/TOX	\N
y8aeaf90369c7502602019	1461310682098	0	19141-1	Propoxyphene [Presence] in Urine	Propoxyph Ur Ql	DRUG/TOX	\N
r79c877e054330cbc02003	1461310679881	0	8191-9	Cocaine [Presence] in Serum or Plasma by Screen method	Cocaine SerPl Ql Scn	DRUG/TOX	\N
faec0eedad6ec2f8002013	1461310681164	0	26524-9	Promyelocytes/100 leukocytes in Blood	Promyelocytes NFr Bld	HEM/BC	\N
pab0be23a74cb7d7002009	1461310680648	0	6153-1	Kentucky blue grass IgE Ab [Units/volume] in Serum	Kent blue grass IgE Qn	ALLERGY	\N
k981b4b67d636959002017	1461310681765	0	11065-0	Urea nitrogen [Mass/volume] in Serum or Plasma --pre dialysis	BUN pre dial SerPl-mCnc	CHEM	\N
bbfc2ff30b35b25c902023	1461310682732	0	35741-8	Prostate specific Ag [Mass/volume] in Serum or Plasma by Detection limit <= 0.01 ng/mL	PSA SerPl DL<=0.01 ng/mL-mCnc	CHEM	\N
m812e7b2247b5a49402025	1461310683073	0	6265-3	Timothy IgE Ab [Units/volume] in Serum	Timothy IgE Qn	ALLERGY	\N
Adbc6507ef416435202027	1461310683348	0	6233-1	Rough Pigweed IgE Ab [Units/volume] in Serum	Rough Pigweed IgE Qn	ALLERGY	\N
Cb9e6973d748aa0ae02032	1461310684434	0	39796-8	Vancomycin [Moles/volume] in Serum or Plasma --peak	Vancomycin Peak SerPl-sCnc	DRUG/TOX	\N
Yb5f1558cd3fc6a7e03328	1461310869224	0	32164-6	Cells [#/volume] in Synovial fluid by Manual count	Cells # Snv Manual	HEM/BC	\N
n9c712046a2b6816502074	1461310692024	0	29641-8	Neutrophil Cytoplasmic Ab atypical [Presence] in Serum by Immunofluorescence	Atyp ANCA Ser Ql IF	SERO	\N
Hd072744892f4c7c402090	1461310694523	0	3663-2	Gentamicin [Mass/volume] in Serum or Plasma --peak	Gentamicin Peak SerPl-mCnc	DRUG/TOX	\N
Fe3b04d0ad17fe1d902034	1461310685040	0	2026-3	"Carbon dioxide	 total [Moles/volume] in Arterial blood"	CO2 BldA-sCnc	\N
qd1173653c5c7815902050	1461310687974	0	19128-8	Bacteria identified in Catheter tip by Culture	Bacteria Cath Tip Cult	MICRO	\N
gdab065b071c71f9b02064	1461310690482	0	2748-2	pH of Body fluid	pH Fld	CHEM	\N
Tdac85decba1f2ba602036	1461310685290	0	2714-4	Fractional oxyhemoglobin in Arterial blood	OxyHgb MFr BldA	CHEM	\N
K8b41d8a08450040102096	1461310695491	0	5126-8	Cytomegalovirus IgM Ab [Units/volume] in Serum by Immunoassay	CMV IgM Ser EIA-aCnc	MICRO	\N
e801571d8c190dc3802052	1461310688290	0	6281-0	White mulberry IgE Ab [Units/volume] in Serum	White mulberry IgE Qn	ALLERGY	\N
Bd588eea544b31aae02038	1461310685631	0	22131-7	Borrelia burgdorferi IgG+IgM Ab [Presence] in Serum	B burgdor IgG+IgM Ser Ql	MICRO	\N
Qc0834e56a99d503302076	1461310692332	0	5034-4	Streptococcus agalactiae rRNA [Presence] in Unspecified specimen by DNA probe	Gp B Strep rRNA XXX Ql Prb	MICRO	\N
je6b1af94b6f7227702066	1461310690823	0	26513-2	Neutrophils/100 leukocytes in Body fluid	Neutrophils NFr Fld	HEM/BC	\N
Hc53db00a74bfa90a02040	1461310686007	0	5404-9	Varicella zoster virus IgM Ab [Units/volume] in Serum by Immunoassay	VZV IgM Ser EIA-aCnc	MICRO	\N
td1c49a834688eaf302054	1461310688673	0	24013-5	HIV 1 RNA [interpretation] in Serum	HIV1 RNA Ser-Imp	MICRO	\N
F8908eab2127ff80502084	1461310693498	0	6178-8	Mountain Juniper IgE Ab [Units/volume] in Serum	Mt Juniper IgE Qn	ALLERGY	\N
Ub9be1ff4972c6bac02042	1461310686498	0	14905-4	Retinol [Moles/volume] in Serum or Plasma	Vit A SerPl-sCnc	CHEM	\N
tb234cd9558afd7da02104	1461310696707	0	28005-7	MTHFR gene c.677C>T [Presence] in Blood or Tissue by Molecular genetics method	MTHFR c.677C>T Bld/T Ql	MOLPATH.MUT	\N
u85396eb1bbdb197802056	1461310688999	0	17780-8	Helicobacter pylori Ag [Presence] in Stool by Immunoassay	H pylori Ag Stl Ql EIA	MICRO	\N
M8f7791ac6db9c9f202044	1461310686882	0	33718-8	Cytology report of Tissue fine needle aspirate Cyto stain	Cytology Tiss FNA Doc Cyto	CYTO	\N
le00becc6560054e302068	1461310691131	0	8130-7	CD45 (Lymphs) cells/100 cells in Blood	CD45 Cells NFr Bld	CELLMARK	\N
Ybd0fba1e56af2f5902078	1461310692573	0	773-2	Nucleated erythrocytes/100 erythrocytes in Blood by Manual count	nRBC/100 RBC NFr Bld Manual	HEM/BC	\N
K8b17fcf9a2fe006b02046	1461310687282	0	8112-5	CD3-CD16+CD56+ (Natural killer) cells/100 cells in Blood	CD3-CD16+CD56+ Cells NFr Bld	CELLMARK	\N
i76729c32f8fe983402058	1461310689381	0	13169-8	Immunoelectrophoresis [interpretation] for Serum or Plasma	Interpretation SerPl IEP-Imp	CHEM	\N
Ub1f0128a70258a8002092	1461310694857	0	1927-3	Base excess in Venous blood	Base excess BldV-sCnc	CHEM	\N
Ldb2a97f1a8f14e9d02048	1461310687607	0	19774-9	Cytology study comment Cervical or vaginal smear or scraping Cyto stain	Cytology Cmnt Cvx/Vag Cyto-Imp	CYTO	\N
x7361a8f6242e53b202070	1461310691382	0	11276-3	Tubular cells [Presence] in Urine sediment by Light microscopy	Tubular Cells UrnS Ql Micro	UA	\N
a7945076ce68a768302060	1461310689774	0	15210-8	Thyroglobulin Ab [Presence] in Serum	Thyroglob Ab Ser Ql	SERO	\N
Td9789a855f43ba8402086	1461310693891	0	11266-4	Streptococcus agalactiae Ag [Presence] in Unspecified specimen	Gp B Strep Ag XXX Ql	MICRO	\N
E98b7d4a220f8b65902080	1461310692882	0	35383-9	Galactomannan Ag [Units/volume] in Serum or Plasma	Galactomannan Ag SerPl-aCnc	MICRO	\N
d83f0dc1ec5b7b13202062	1461310690124	0	4532-8	Complement total hemolytic CH50 [Units/volume] in Serum or Plasma	CH50 SerPl-aCnc	HEM/BC	\N
v9100c07c2f5322b202072	1461310691732	0	25458-1	Lamotrigine [Moles/volume] in Serum or Plasma	Lamotrigine SerPl-sCnc	DRUG/TOX	\N
Lc1af5170cf1342c702098	1461310695757	0	40844-3	Immunoglobulin light chains.kappa.free/Immunoglobulin light chains.lambda [Mass ratio] in Serum	Kappa LC Free/Lambda Ser-mRto	CHEM	\N
B86f0098901ffe4fe02088	1461310694224	0	22746-2	Gentamicin [Moles/volume] in Serum or Plasma --peak	Gentamicin Peak SerPl-sCnc	DRUG/TOX	\N
Cba19f07d4950e4ef02082	1461310693165	0	22587-0	Treponema pallidum Ab [Presence] in Serum	T pallidum Ab Ser Ql	MICRO	\N
Ma96fa7210e8e9d4602094	1461310695174	0	5247-2	Mitochondria Ab [Titer] in Serum by Immunofluorescence	Mitochondria Ab Titr Ser IF	SERO	\N
aa568d2f1801a338202110	1461310697691	0	12230-9	Macrophages/100 leukocytes in Body fluid by Manual count	Macrophages NFr Fld Manual	HEM/BC	\N
ebf6f0ece61788d1702102	1461310696257	0	15218-1	Food Allergen Mix 2 (Cod+Blue Mussel+Shrimp+Salmon+Tuna) IgE Ab [Presence] in Serum by Multidisk	Food Allerg Mix2 IgE Ql	ALLERGY	\N
i9da21fc8e06a7cc402108	1461310697373	0	14912-0	Smudge cells/100 leukocytes in Blood by Manual count	Smudge Cells NFr Bld Manual	HEM/BC	\N
q91b2a80708c95dc702100	1461310695990	0	15069-8	Fructosamine [Moles/volume] in Serum or Plasma	Fructosamine SerPl-sCnc	CHEM	\N
u8104802c6793ce1002106	1461310697032	0	8014-3	Rubella virus IgG Ab [Units/volume] in Serum	RUBV IgG Ser-aCnc	MICRO	\N
db43085d9d2e2aa7e02112	1461310697974	0	27038-9	Endomysium IgA Ab [Titer] in Serum by Immunofluorescence	Endomysium IgA Titr Ser IF	SERO	\N
jd718808bae3fff8602116	1461310698640	0	6246-3	Shrimp IgE Ab [Units/volume] in Serum	Shrimp IgE Qn	ALLERGY	\N
ldf17c6665f89368b02118	1461310698982	0	42176-8	"1	3 beta glucan [Mass/volume] in Serum"	"1	\N
g6eb64a5e2d32d16302114	1461310698357	0	20573-2	Histoplasma capsulatum mycelial phase Ab [Titer] in Serum by Complement fixation	H capsul Myc Ab Titr Ser CF	MICRO	\N
x90edb11333cb517202120	1461310699349	0	19075-1	Cells Counted Total [#] in Cerebral spinal fluid	Total Cells Counted CSF	HEM/BC	\N
v90aa4c4c4732c7ce02122	1461310699690	0	33910-1	Rheumatoid factor [Presence] in Serum	Rheumatoid fact Ser Ql	SERO	\N
na52962737591e2b402124	1461310700057	0	9822-8	Bacteria identified in Dialysis fluid by Culture	Bacteria Dial fld Cult	MICRO	\N
Q68d08e11fedb494302126	1461310700432	0	931-6	Blood product source [Type]	Bld Prod Source BPU	BLDBK	\N
Yb767109b906cdbcd02128	1461310700699	0	32140-6	Hemoglobin F [Presence] in Blood by Kleihauer-Betke method	Hgb F Bld Ql Kleih Betke	HEM/BC	\N
Ee778739fc397069802130	1461310700974	0	53982-5	Centromere protein B Ab [Units/volume] in Serum	Centromere B Ab Ser-aCnc	SERO	\N
Bb3685624acd5ee9e02188	1461310709325	0	5273-8	Parvovirus B19 IgG Ab [Units/volume] in Serum by Immunoassay	B19V IgG Ser EIA-aCnc	MICRO	\N
ve116848a5fea509402172	1461310706716	0	33006-8	Cytomegalovirus DNA [#/volume] (viral load) in Unspecified specimen by Probe and target amplification method	CMV DNA # XXX PCR	MICRO	\N
Cdad2f076bded7dbd02132	1461310701257	0	51775-5	Chromatin Ab [Units/volume] in Serum or Plasma	Chromatin Ab SerPl-aCnc	SERO	\N
Lc123942c25437cb302148	1461310703491	0	6186-1	Nettle IgE Ab [Units/volume] in Serum	Nettle IgE Qn	ALLERGY	\N
d9b2e5719f7ebee9002162	1461310705124	0	9780-8	Spermatozoa [#/volume] in Semen	Sperm # Smn	FERT	\N
F72d2a12446a2146602134	1461310701591	0	19295-5	Opiates [Presence] in Urine by Screen method	Opiates Ur Ql Scn	DRUG/TOX	\N
Mb4443cec8a3d3ad502194	1461310710233	0	13990-7	Alpha 1 globulin/Protein.total in Urine by Electrophoresis	Alpha1 Glob MFr Ur Elph	CHEM	\N
qd7ac9f329f7e640c02150	1461310703707	0	11565-9	Jo-1 extractable nuclear Ab [Units/volume] in Serum	ENA Jo1 Ab Ser-aCnc	SERO	\N
T7a4a782856fdcb1702136	1461310701899	0	24011-9	Hepatitis C virus Ab band pattern [interpretation] in Serum by Immunoblot (IB)	HCV Ab Patrn Ser IB-Imp	MICRO	\N
Ce313a610506e32c602182	1461310708166	0	38506-2	Thyroxine (T4) [Presence] in Dried blood spot	T4 DBS Ql	CHEM	\N
nc6e91bbb73b08f7a02174	1461310706966	0	22415-4	Mumps virus IgG Ab [Presence] in Serum	MuV IgG Ser Ql	MICRO	\N
g6f152761eaaf6d9c02164	1461310705399	0	6002-0	Platelet factor 4 [Units/volume] in Platelet poor plasma	PF4 PPP-aCnc	COAG	\N
B9ffc009cc6650de802138	1461310702140	0	5187-0	Hepatitis B virus core Ab [Units/volume] in Serum by Immunoassay	HBV core Ab Ser EIA-aCnc	MICRO	\N
ee4ac06b52e449efe02152	1461310703866	0	30376-8	Blasts [#/volume] in Blood	Blasts # Bld	HEM/BC	\N
Ha9aee6d567abd4f802140	1461310702441	0	2963-7	Somatotropin [Mass/volume] in Serum or Plasma	GH SerPl-mCnc	CHEM	\N
u7b724d8ddec9a74d02206	1461310712225	0	40750-2	Epstein Barr virus capsid IgG Ab [Presence] in Serum by Immunofluorescence	EBV VCA IgG Ser Ql IF	MICRO	\N
t77c6e548d293d2a202154	1461310703991	0	35676-6	Chloride [Moles/volume] in unspecified time Urine	Chloride ?Tm Ur-sCnc	CHEM	\N
U9919489a88a9140d02142	1461310702758	0	13530-1	Nucleated erythrocytes [#/volume] in Body fluid by Manual count	nRBC # Fld Manual	HEM/BC	\N
jcf7fe0e978c16ca802166	1461310705691	0	6014-5	von Willebrand factor (vWf) ristocetin cofactor actual/normal in Platelet poor plasma by Aggregation	vWf:RCo Act/Nor PPP Aggr	COAG	\N
H9686b4cd4877111902190	1461310709600	0	13992-3	Albumin/Protein.total in Urine by Electrophoresis	Albumin MFr Ur Elph	CHEM	\N
Q944acab534b7025102176	1461310707224	0	6476-6	Mumps virus IgG Ab [Presence] in Serum by Immunoassay	MuV IgG Ser Ql EIA	MICRO	\N
M90e9cd057813b2d902144	1461310702990	0	6082-2	Codfish IgE Ab [Units/volume] in Serum	Codfish IgE Qn	ALLERGY	\N
uda14d8b4929bc21d02156	1461310704232	0	32637-1	Urease [Presence] in Tissue	Urease Tiss Ql	MICRO	\N
Ke1648523577081b302146	1461310703241	0	6156-4	Goosefoot IgE Ab [Units/volume] in Serum	Goosefoot IgE Qn	ALLERGY	\N
lcbc46123bb207b3e02168	1461310705974	0	20475-0	Cytomegalovirus IgG Ab [interpretation] in Serum	CMV IgG Ser-Imp	MICRO	\N
i7b72925eac4bed0e02158	1461310704508	0	46248-1	Borrelia burgdorferi IgG and IgM [interpretation] in Serum by Immunoassay	B burgdor IgG+IgM Ser EIA-Imp	MICRO	\N
Fb6b6ab5e774b459202184	1461310708483	0	13522-8	Blasts/100 leukocytes in Body fluid by Manual count	Blasts NFr Fld Manual	HEM/BC	\N
Y76eee18fe93fb18002178	1461310707516	0	49053-2	History of neural tube defect Narrative	Neural tube defect Hx Patient	CHEM	\N
a6afe2f04643aa01302160	1461310704824	0	1721-0	Adenosine triphosphate [Mass/volume] in Blood	ATP Bld-mCnc	CHEM	\N
x932d627598f87e5c02170	1461310706332	0	33248-6	Diabetes status [Identifier]	Diabetes status Patient	MISC	\N
qde37298f4115af9902200	1461310711074	0	7407-0	White Hickory IgE Ab [Units/volume] in Serum	White Hickory IgE Qn	ALLERGY	\N
K8eb3ad968fa3bda402196	1461310710500	0	801-1	Sickle cells [Presence] in Blood by Light microscopy	Sickle Cells Bld Ql Smear	HEM/BC	\N
Tc9c7004e6d1bfc6702186	1461310708866	0	5274-6	Parvovirus B19 IgM Ab [Units/volume] in Serum by Immunoassay	B19V IgM Ser EIA-aCnc	MICRO	\N
Ec89b866d1390bc6a02180	1461310707857	0	21024-5	Pathologist interpretation of Cerebral spinal fluid tests	Path Interp CSF-Imp	PATH	\N
U95f7546fb8ab540f02192	1461310709899	0	5393-4	Treponema pallidum Ab [Presence] in Serum by Immunofluorescence	T pallidum Ab Ser Ql IF	MICRO	\N
y734c78e0cec6341c02219	1461310713991	0	16126-5	Helicobacter pylori IgG Ab [Presence] in Serum	H pylori IgG Ser Ql	MICRO	\N
t7dd7d9aeb42438c502204	1461310711891	0	30471-7	Levetiracetam [Mass/volume] in Serum or Plasma	Levetiracetam SerPl-mCnc	DRUG/TOX	\N
kc334f3d361302d9002217	1461310713733	0	42768-2	HIV 1 and 2 Ab [interpretation] in Serum Narrative	HIV 1 & 2 Ab Ser-Imp	MICRO	\N
Le43c4f07f7d010c702198	1461310710741	0	14582-1	Acetone [Moles/volume] in Serum or Plasma	Acetone SerPl-sCnc	DRUG/TOX	\N
e99c066f8b3d0a68d02202	1461310711477	0	46420-6	Leukocyte clumps [#/area] in Urine sediment by Microscopy high power field	WBC clumps #/area UrnS HPF	UA	\N
ddd83b8d81e17efcb02212	1461310713133	0	2466-1	IgG subclass 1 [Mass/volume] in Serum	IgG1 Ser-mCnc	CHEM	\N
i69cca039961fe9e002208	1461310712533	0	6019-4	Almond IgE Ab [Units/volume] in Serum	Almond IgE Qn	ALLERGY	\N
aca71a0da3df0e8a602210	1461310712808	0	41874-9	White Birch IgE Ab [Units/volume] in Serum	White Birch IgE Qn	ALLERGY	\N
g8ffb5bbc7f93369202214	1461310713399	0	6968-2	Proteinase 3 Ab [Units/volume] in Serum	Proteinase3 Ab Ser-aCnc	SERO	\N
c98b968b807b92f0702221	1461310714242	0	11258-1	Hepatitis B virus DNA [Units/volume] in Serum	HBV DNA Ser-aCnc	MICRO	\N
bd7848b5b43189a2502223	1461310714541	0	667-6	Microscopic observation [Identifier] in Unspecified specimen by KOH preparation	KOH Prep XXX	MICRO	\N
mba1a0321b2b3252202225	1461310715300	0	1747-5	Albumin [Mass/volume] in Body fluid	Albumin Fld-mCnc	CHEM	\N
Adcc33113bc933e1a02227	1461310715691	0	9586-9	Borrelia burgdorferi Ab [interpretation] in Serum	B burgdor Ab Ser-Imp	MICRO	\N
W7a60e2498043a8a802229	1461310715975	0	681-7	Microscopic observation [Identifier] in Unspecified specimen by Wright stain	Wright Stn XXX	MICRO	\N
Dd726c24ca572b75102231	1461310716291	0	6942-7	Albumin [Mass/volume] in Urine by Electrophoresis	Albumin Ur Elph-mCnc	CHEM	\N
bcfcaab810cd2f00e02273	1461310722392	0	24476-4	F2 gene mutations found [Identifier] in Blood or Tissue by Molecular genetics method Nominal	F2 gene Mut Anal Bld/T	MOLPATH.MUT	\N
P7847d0ed2bc5d1c402249	1461310718767	0	14278-6	Neutrophil cytoplasmic Ab.perinuclear [Titer] in Serum by Immunofluorescence	p-ANCA Titr Ser IF	SERO	\N
R7d3918dcad458e5c02233	1461310716533	0	6969-0	Myeloperoxidase Ab [Units/volume] in Serum	Myeloperoxidase Ab Ser-aCnc	SERO	\N
Pd69740c765e57ec202299	1461310725642	0	33673-5	Thrombin time.factor substitution in Platelet poor plasma by Coagulation assay --immediately after addition of protamine sulfate	TT imm SO4 Time PPP	COAG	\N
Zddf1d8800a58d7b502289	1461310724325	0	44525-4	Histoplasma capsulatum Ag [Presence] in Serum by Immunoassay	H capsul Ag Ser Ql EIA	MICRO	\N
fbe072bcb8843c21502263	1461310720725	0	6556-5	Streptococcus pyogenes Ag [Presence] in Throat by Immunoassay	S pyo Ag Throat Ql EIA	MICRO	\N
V7a2dcdb02643c16502235	1461310716775	0	6183-8	Mugwort IgE Ab [Units/volume] in Serum	Mugwort IgE Qn	ALLERGY	\N
wbdd13edd2bffacbb02251	1461310719008	0	12180-6	Calcium.ionized [Moles/volume] in Serum or Plasma by Ion-selective membrane electrode (ISE)	Ca-I SerPl ISE-sCnc	CHEM	\N
Gcb91b4c53981846f02237	1461310717110	0	3719-2	Lithium [Mass/volume] in Serum or Plasma	Lithium SerPl-mCnc	DRUG/TOX	\N
I97eba1059445813402295	1461310725067	0	26518-1	Polymorphonuclear cells/100 leukocytes in Body fluid	Polys NFr Fld	HEM/BC	\N
me12d2e6aba27c67d02275	1461310722575	0	14929-4	Triiodothyronine (T3).reverse [Moles/volume] in Serum or Plasma	T3Reverse SerPl-sCnc	CHEM	\N
r758242829e657b8c02253	1461310719358	0	48344-6	Kaolin activated time in Platelet poor plasma	KC time Time PPP	COAG	\N
Z6bb322294926d6d302239	1461310717408	0	2469-5	IgG subclass 4 [Mass/volume] in Serum	IgG4 Ser-mCnc	CHEM	\N
h9a6e02a0cc00ece502265	1461310721033	0	34661-9	Actin IgG Ab [Units/volume] in Serum or Plasma	Actin IgG SerPl-aCnc	SERO	\N
R73a3be42e8acdf0602283	1461310723542	0	14676-1	Cortisol Free [Moles/time] in 24 hour Urine	Cortis F 24h Ur-sRate	CHEM	\N
N7712c6d16afe7d8702241	1461310717683	0	2467-9	IgG subclass 2 [Mass/volume] in Serum	IgG2 Ser-mCnc	CHEM	\N
ze575cc9ec7599e2802255	1461310719700	0	28637-7	Base deficit in Venous cord blood	Base deficit BldCoV-sCnc	CHEM	\N
Jadfbd4ccbf8578ee02243	1461310717966	0	2468-7	IgG subclass 3 [Mass/volume] in Serum	IgG3 Ser-mCnc	CHEM	\N
k8b6e565eeea693b002267	1461310721325	0	41274-2	Alpha-1-Fetoprotein interpretation [interpretation] in Serum or Plasma	AFP Interp SerPl-Imp	CHEM	\N
o959a2cf875e0ace702257	1461310719958	0	18500-9	Microscopic observation [Identifier] in Cervix by Cyto stain.thin prep	Thin Prep Cervix	CYTO	\N
Ia4e46b45c7206b8f02245	1461310718216	0	32146-3	Platelets Large [Presence] in Blood by Light microscopy	Lg Platelets Bld Ql Smear	HEM/BC	\N
Ab20a59cde22aa9bf02277	1461310722783	0	25700-6	Immunofixation [interpretation] for Serum or Plasma	Interpretation SerPl IFE-Imp	CHEM	\N
h9015c7fdec6e935c02315	1461310727543	0	6098-8	Dog dander IgE Ab [Units/volume] in Serum	Dog Dander IgE Qn	ALLERGY	\N
Oc9574a90fbbffa9e02247	1461310718500	0	14277-8	Neutrophil cytoplasmic Ab.classic [Titer] in Serum by Immunofluorescence	c-ANCA Titr Ser IF	SERO	\N
p8fa775fd41accbd402259	1461310720225	0	13987-3	Alpha 2 globulin/Protein.total in 24 hour Urine by Electrophoresis	Alpha2 Glob 24h MFr Ur Elph	CHEM	\N
Na76b38593f355ef702291	1461310724526	0	2115-4	Choriogonadotropin.beta subunit free [Moles/volume] in Serum or Plasma	B-HCG Free SerPl-sCnc	CHEM	\N
ye01dc0088eaeface02269	1461310721709	0	33719-6	Flow cytometry study		ATTACH.CLINRPT	\N
Vb221fba9eac4f20c02285	1461310723825	0	21020-3	Bacteria identified in Unspecified specimen by Anaerobe+Aerobe culture	Bacteria XXX Anaerobe+Aerobe Cult	MICRO	\N
se36629288269cb0d02261	1461310720484	0	13989-9	Gamma globulin/Protein.total in 24 hour Urine by Electrophoresis	Gamma glob 24h MFr Ur Elph	CHEM	\N
W931847e441bff4ee02279	1461310723009	0	14915-3	Theophylline [Moles/volume] in Serum or Plasma	Theophylline SerPl-sCnc	DRUG/TOX	\N
ce57adcfb1e9edcfc02271	1461310722025	0	5158-1	Epstein Barr virus capsid IgG Ab [Titer] in Serum by Immunofluorescence	EBV VCA IgG Titr Ser IF	MICRO	\N
r685117e49678b84c02303	1461310726284	0	12286-1	Drugs identified in Urine by Screen method	Drugs Ur Scn	DRUG/TOX	\N
Odb040a0f3ab1fc2d02297	1461310725409	0	19076-9	Cells Counted Total [#] in Unspecified specimen	Total Cells Counted XXX	HEM/BC	\N
G77dfc562f354c11c02287	1461310724109	0	19108-0	Histoplasma capsulatum Ag [Presence] in Serum	H capsul Ag Ser Ql	MICRO	\N
Dd7dbb3786b2447fe02281	1461310723267	0	11878-6	Number of fetuses by US	# Fetuses US	OB.US	\N
J7e305bc7517f326602293	1461310724834	0	32167-9	Clarity of Urine	Clarity Ur	SPEC	\N
s71815954cec8093d02311	1461310727092	0	13994-9	Beta globulin/Protein.total in Urine by Electrophoresis	B-Globulin MFr Ur Elph	CHEM	\N
wdf97e33382e845d502301	1461310726033	0	32133-1	Lactate [Moles/volume] in Plasma venous	Lactate PlasV-sCnc	CHEM	\N
pa692acaede3649f002309	1461310726884	0	8187-7	Benzoylecgonine [Presence] in Meconium	BZE Mec Ql	DRUG/TOX	\N
oa8d6edd9ec587aa702307	1461310726717	0	5095-5	Coccidioides immitis Ab [Presence] in Serum by Immune diffusion (ID)	C immitis Ab Ser Ql ID	MICRO	\N
zaeb06a1e51cdd34c02305	1461310726526	0	6263-8	American Sycamore IgE Ab [Units/volume] in Serum	Amer Sycamore IgE Qn	ALLERGY	\N
fccbd4c38298dfc7c02313	1461310727301	0	26523-1	Promyelocytes [#/volume] in Blood	Promyelocytes # Bld	HEM/BC	\N
kb9f385137d249ebe02317	1461310727801	0	22310-7	Helicobacter pylori Ab [Presence] in Serum	H pylori Ab Ser Ql	MICRO	\N
yb62a86a46c608db702319	1461310728125	0	20124-4	Ventilation mode [Identifier] Ventilator	Ventilation mode Vent	PULM	\N
cbf1a368a387c947a02321	1461310728300	0	6107-7	Egg yolk IgE Ab [Units/volume] in Serum	Egg Yolk IgE Qn	ALLERGY	\N
ba99cc9414cb743c702323	1461310728543	0	6604-3	Influenza virus identified in Unspecified specimen by Organism specific culture	FLUV XXX Cult	MICRO	\N
m9b66eb02a1bc5a6c02325	1461310728843	0	28647-6	pH of Venous cord blood	pH BldCoV	CHEM	\N
A9e98b2f28711396502327	1461310729109	0	6800-7	Spermatozoa Motile/100 spermatozoa in Semen	Sperm Motile NFr Smn	FERT	\N
Wbc60e0634ccf305d02329	1461310729526	0	6718-1	Cashew Nut IgE Ab [Units/volume] in Serum	Cashew Nut IgE Qn	ALLERGY	\N
Dc3b35df5a442070402331	1461310729818	0	5181-3	Hepatitis A virus IgM Ab [Units/volume] in Serum by Immunoassay	HAV IgM Ser EIA-aCnc	MICRO	\N
Me72b57f8e5207e5802494	1461310751594	0	5117-7	Cryoglobulin [Presence] in Serum	Cryoglob Ser Ql	CHEM	\N
R7ebca66526c81fd202383	1461310736785	0	48343-8	Hemoglobin.other/Hemoglobin.total in Blood	Hgb Other MFr Bld	HEM/BC	\N
Pcf03cffa56ec7ed302349	1461310733035	0	11274-8	Elliptocytes [Presence] in Blood by Light microscopy	Elliptocytes Bld Ql Smear	HEM/BC	\N
Ra0340f48bf5761da02333	1461310730109	0	1961-2	Bicarbonate [Moles/volume] in Capillary blood	HCO3 BldC-sCnc	CHEM	\N
fb73f7f0fe508b41502363	1461310734584	0	9631-3	Viscosity of Semen	Visc Smn	SPEC	\N
Va896e3b156b2cc8602335	1461310730434	0	28646-8	pH of Arterial cord blood	pH BldCoA	CHEM	\N
w82b021411a2c456c02351	1461310733226	0	46995-7	HLA-DP+DQ+DR (class II) Ab in Serum	HLA-DP+DQ+DR Ab NFr Ser	HLA	\N
ma733fd0a3f44fb0002375	1461310736009	0	17850-9	Herpes simplex virus 1 IgG Ab [Presence] in Serum	HSV1 IgG Ser Ql	MICRO	\N
G92d633b0eb0f373f02337	1461310730735	0	11051-0	Immunoglobulin light chains.lambda [Mass/volume] in Serum	Lambda LC Ser-mCnc	CHEM	\N
w7924ac05bb9d285402401	1461310738793	0	2483-6	Insulin-like growth factor binding protein 3 [Mass/volume] in Serum or Plasma	IGF BP3 SerPl-mCnc	CHEM	\N
hd0d83536dfa3176502365	1461310734826	0	10585-8	Round cells [#/volume] in Semen	Round Cells # Smn	FERT	\N
rcc3e77ffd9ea2cae02353	1461310733501	0	46994-0	HLA-A+B+C (class I) Ab in Serum	HLA-A+B+C Ab NFr Ser	HLA	\N
Zc7c06485bfaa9a1002339	1461310731151	0	32032-5	Phosphatidylserine IgG Ab [Units/volume] in Serum by Immunoassay	PS IgG Ser EIA-aCnc	COAG	\N
z8cf868025aab799502405	1461310739577	0	33594-3	Platelet factor 4 [Presence] in Platelet poor plasma	PF4 PPP Ql	COAG	\N
Na918f0f7a4c054fb02391	1461310737477	0	5791-9	Fungi.yeastlike [#/area] in Urine sediment by Microscopy high power field	Yeast Like Fungi #/area UrnS HPF	UA	\N
N9e7dd4a8287e149f02341	1461310731476	0	25362-5	Calcium [Moles/volume] in 24 hour Urine	Calcium 24h Ur-sCnc	CHEM	\N
V83bbcdeddc121af002385	1461310736926	0	5160-7	Epstein Barr virus capsid IgM Ab [Titer] in Serum by Immunofluorescence	EBV VCA IgM Titr Ser IF	MICRO	\N
z773c79c5e408379c02355	1461310733760	0	6208-3	Pecan or Hickory Nut IgE Ab [Units/volume] in Serum	Pecan/Hick Nut IgE Qn	ALLERGY	\N
Aa49664996fb0c9e902377	1461310736193	0	51916-5	Herpes simplex virus 1 IgG Ab [Presence] in Serum by Immunoassay	HSV1 IgG Ser Ql EIA	MICRO	\N
kd79f5174c85c6a4502367	1461310735043	0	33217-1	Spermatozoa Agglutinated [Presence] in Semen	Sperm Agglutinated Smn Ql	FERT	\N
J9bd01003033a3b2a02343	1461310731809	0	7793-3	Howell-Jolly bodies [Presence] in Blood by Light microscopy	Howell-Jolly Bod Bld Ql Smear	HEM/BC	\N
oa36347d7d9e84a9402357	1461310733960	0	17851-7	Herpes simplex virus 2 IgG Ab [Presence] in Serum	HSV2 IgG Ser Ql	MICRO	\N
Ia7eb4c6b45f67e1602345	1461310732209	0	35668-3	Gentamicin [Mass/volume] in Serum or Plasma	Gentamicin SerPl-mCnc	DRUG/TOX	\N
ye480394e1c5751ae02369	1461310735193	0	5218-3	Histoplasma capsulatum Ab [Presence] in Serum by Immune diffusion (ID)	H capsul Ab Ser Ql ID	MICRO	\N
Oc8eb2cedc0bc089302347	1461310732662	0	47109-4	Gentamicin [Moles/volume] in Serum or Plasma	Gentamicin SerPl-sCnc	DRUG/TOX	\N
pa7c4f29ea13529d902359	1461310734126	0	43180-9	Herpes simplex virus 2 IgG Ab [Presence] in Serum by Immunoassay	HSV2 IgG Ser Ql EIA	MICRO	\N
O7d1c4605716a528602397	1461310738127	0	20991-6	Antithrombin [interpretation] in Platelet poor plasma	AT III PPP-Imp	COAG	\N
W9259be529103f93302379	1461310736326	0	31844-4	Hepatitis B virus e Ag [Presence] in Serum	HBV e Ag Ser Ql	MICRO	\N
sa41c366aaa9a952a02361	1461310734335	0	30166-3	Thyroid stimulating immunoglobulins actual/normal in Serum	TSI Act/Nor Ser	CHEM	\N
c9e22e336ff3234da02371	1461310735460	0	27822-6	Protein S actual/normal in Platelet poor plasma by Coagulation assay	Prot S Act/Nor PPP	COAG	\N
Gd0bc9adb62f8b21f02387	1461310737110	0	29615-2	Hepatitis B virus DNA [#/volume] (viral load) in Serum or Plasma by Probe and target amplification method	HBV DNA # SerPl PCR	MICRO	\N
D8e11cd3becc5d0b102381	1461310736485	0	20450-3	Alpha-1-Fetoprotein [Multiple of the median] in Serum or Plasma	AFP MoM SerPl	CHEM	\N
bcf7e42b060c8380002373	1461310735726	0	17793-1	Immunoglobulin light chains [Mass/volume] in 24 hour Urine	BJ Protein 24h Ur-mCnc	CHEM	\N
f728e6de526b5939e02413	1461310741051	0	8216-4	Opiates [Presence] in Meconium by Screen method	Opiates Mec Ql Scn	DRUG/TOX	\N
Je3ffbd124d00dbf502393	1461310737701	0	20423-0	Beta lactamase organism identified in Isolate	B-Lactamase Organism Islt	MICRO	\N
sa3094d1a2ce5a4b202411	1461310740710	0	17849-1	Reticulocytes/100 erythrocytes in Blood by Automated count	Retics/100 RBC NFr Auto	HEM/BC	\N
Z9a30e35213ba356902389	1461310737276	0	21032-8	Thrombin time [interpretation] in Blood	TT Bld-Imp	COAG	\N
rada9bb00d8b1af0802403	1461310739176	0	34712-0	Clostridium difficile [Presence] in Stool	C dif Stl Ql	MICRO	\N
Pa7af721717b6c97102399	1461310738476	0	33720-4	Blood bank consult		ATTACH.CLINRPT	\N
I962a75038551b31f02395	1461310737910	0	8146-3	Amphetamines [Presence] in Meconium by Screen method	Amphetamines Mec Ql Scn	DRUG/TOX	\N
p6c21462029e1a22902409	1461310740368	0	22663-9	Estrone (E1) [Moles/volume] in Serum or Plasma	Estrone SerPl-sCnc	CHEM	\N
o8aceb0ede86597c402407	1461310739985	0	8169-5	Tetrahydrocannabinol [Presence] in Meconium by Screen method	THC Mec Ql Scn	DRUG/TOX	\N
yda017da7076607de02419	1461310741977	0	7798-2	Smudge cells [Presence] in Blood by Light microscopy	Smudge Cells Bld Ql Smear	HEM/BC	\N
h8e8e26f7fffb1e1b02415	1461310741393	0	27816-8	von Willebrand factor (vWf) Ag actual/normal in Platelet poor plasma by Immunologic method	vWF Ag Act/Nor PPP Imm	COAG	\N
kd32169723eacace602417	1461310741685	0	8116-6	CD19 cells [#/volume] in Blood	CD19 Cells # Bld	CELLMARK	\N
ca38d2e771a51eeac02421	1461310742210	0	9795-6	Composition in Stone	Compn Stone	PATH	\N
bbc2f3f19d85badd702423	1461310742444	0	5390-0	Toxoplasma gondii IgM Ab [Units/volume] in Serum by Immunoassay	T gondii IgM Ser EIA-aCnc	MICRO	\N
mbe0725b3809114ef02425	1461310742676	0	32218-0	Cyclic citrullinated peptide Ab [Units/volume] in Serum by Immunoassay	cCP Ab Ser EIA-aCnc	SERO	\N
Ac9d510b2049b1ff402427	1461310742885	0	46266-3	Myeloperoxidase Ab [Units/volume] in Serum by Immunoassay	Myeloperoxidase Ab Ser EIA-aCnc	SERO	\N
W914a32c1f515aadb02429	1461310743185	0	20479-2	Measles virus IgG Ab [Presence] in Serum	MeV IgG Ser Ql	MICRO	\N
Cb273e3966162fdd002432	1461310743443	0	35275-7	Measles virus IgG Ab [Presence] in Serum by Immunoassay	MeV IgG Ser Ql EIA	MICRO	\N
dcab1a4fe951d674302462	1461310747186	0	41222-1	Yeast [Presence] in Body fluid by Light microscopy	Yeast Fld Ql Micro	MICRO	\N
jd1ab550df0f1907402516	1461310755286	0	5183-9	Hepatitis A virus Ab [Units/volume] in Serum by Immunoassay	HAV Ab Ser EIA-aCnc	MICRO	\N
F86b8fe55ddaea8d002434	1461310743668	0	5781-0	Crystals [type] in Synovial fluid by Light microscopy	Crystals Snv Micro	HEM/BC	\N
ea246a3cb0c6c51f702502	1461310752935	0	41499-5	Legionella pneumophila 1 Ag [Presence] in Urine by Immunoassay	L pneumo1 Ag Ur Ql EIA	MICRO	\N
qce2e35c4de30c12f02450	1461310745669	0	5817-2	Urate crystals [Presence] in Urine sediment by Light microscopy	Urate Cry UrnS Ql Micro	UA	\N
n9086356f248a1a4e02474	1461310748535	0	33437-5	Oxygen [Partial pressure] in Capillary blood by Transcutaneous O2 monitor	pO2 BldC TcO2	PULM	\N
T9503e92972357c2f02436	1461310743935	0	26043-0	HLA-B27 [Presence] by Probe and target amplification method	HLA-B27 Ql PCR	HLA	\N
ac77764a28b08280c02510	1461310754302	0	2615-3	Methemoglobin/Hemoglobin.total in Arterial blood	MetHgb MFr BldA	CHEM	\N
gb6751b07dad4269802464	1461310747427	0	38505-4	Thyroglobulin recovery in Serum or Plasma	Thyroglob Recovery MFr SerPl	CHEM	\N
ed43480b54fb3643002452	1461310745994	0	46267-1	Proteinase 3 Ab [Units/volume] in Serum by Immunoassay	Proteinase3 Ab Ser EIA-aCnc	SERO	\N
Be5eac9a503dfdadd02438	1461310744194	0	16136-4	Beta 2 glycoprotein 1 IgM Ab [Units/volume] in Serum	B2 Glycoprot1 IgM Ser-aCnc	COAG	\N
Ybe4bad229f8df5cb02528	1461310756928	0	26512-4	Neutrophils/100 leukocytes in Cerebral spinal fluid	Neutrophils NFr CSF	HEM/BC	\N
te0ca6df8e720742f02504	1461310753344	0	3141-9	Body weight Measured	Weight Measured	BDYWGT.ATOM	\N
Kb9035326b2a1657502496	1461310751860	0	2752-4	pH of Semen	pH Smn	CHEM	\N
He06e63ee95d531e502440	1461310744485	0	44449-7	Beta 2 glycoprotein 1 IgM Ab [Units/volume] in Serum by Immunoassay	B2 Glycoprot1 IgM Ser EIA-aCnc	COAG	\N
tbf8abf371e6e2aeb02454	1461310746302	0	2270-7	Fat [Presence] in Stool	Fat Stl Ql	CHEM	\N
jb867f7f89134416802466	1461310747627	0	16135-6	Beta 2 glycoprotein 1 IgG Ab [Units/volume] in Serum	B2 Glycoprot1 IgG Ser-aCnc	COAG	\N
U68e49b034c16050502442	1461310744710	0	19296-3	Opiates tested for in Urine by Screen method Nominal	Opiates Tested Ur Scn	DRUG/TOX	\N
H6de3ebf3fe096ec202540	1461310758711	0	49573-9	HIV genotype [Susceptibility] in Isolate by Genotype method Narrative	HIV Gentyp Islt	ABXBACT	\N
L7c779d7486ab9c6302498	1461310752202	0	15359-3	Dilute Russell viper venom time (dRVVT) actual/normal in Platelet poor plasma by Coagulation assay	dRVV Tme Act/Nor PPP	COAG	\N
uabac5318ee1719b802456	1461310746618	0	6278-6	White Ash IgE Ab [Units/volume] in Serum	White Ash IgE Qn	ALLERGY	\N
Mcc1ab8b8cd1f6fe502444	1461310744976	0	14115-0	Collagen crosslinked N-telopeptide/Creatinine [Molar ratio] in Urine	Collagen NTx/Creat Ur-sRto	CHEM	\N
de264b5cda7e812a702512	1461310754652	0	5053-4	Aspergillus sp Ab [Titer] in Serum by Complement fixation	Aspergillus Ab Titr Ser CF	MICRO	\N
u719cdc1f89078e6102506	1461310753719	0	5348-8	SCL-70 extractable nuclear Ab [Presence] in Serum by Immunoassay	ENA Scl70 Ab Ser Ql EIA	SERO	\N
ld257be6793f970e202468	1461310747827	0	44448-9	Beta 2 glycoprotein 1 IgG Ab [Units/volume] in Serum by Immunoassay	B2 Glycoprot1 IgG Ser EIA-aCnc	COAG	\N
K8ae07e82b594a2de02446	1461310745201	0	14761-1	Glucose [Moles/volume] in Serum or Plasma --2 hours post meal	Glucose 2h p meal SerPl-sCnc	CHAL	\N
i9e69deb86ae884c802458	1461310746785	0	7369-2	Perennial rye grass IgE Ab [Units/volume] in Serum	Per rye grass IgE Qn	ALLERGY	\N
qd0e43c897cad5ae102500	1461310752486	0	2077-6	Chloride [Moles/volume] in Sweat	Chloride Sweat-sCnc	CHEM	\N
L8f4cfd4b7e95ca3502448	1461310745410	0	5290-2	Reagin Ab [Presence] in Cerebral spinal fluid by VDRL	VDRL CSF Ql	MICRO	\N
vcfa85c46debc38a602522	1461310756086	0	20466-9	Estriol (E3).unconjugated [Multiple of the median] in Serum or Plasma	u Estriol MoM SerPl	CHEM	\N
lc71c718eb1bde2d702518	1461310755578	0	29893-5	HIV 1 Ab [Presence] in Serum by Immunoassay	HIV1 Ab Ser Ql EIA	MICRO	\N
a922dcdc56e85dbe402460	1461310747010	0	8091-1	Ribonucleoprotein extractable nuclear Ab [Presence] in Serum	ENA RNP Ab Ser Ql	SERO	\N
xc9d21ab35b4c801402470	1461310748044	0	6076-4	Clam IgE Ab [Units/volume] in Serum	Clam IgE Qn	ALLERGY	\N
ie0181e739023a92b02508	1461310754003	0	15761-0	Sweet gum IgE Ab RAST class in Serum	Sweet gum IgE RAST Ql	ALLERGY	\N
ga6d190f73e68918502514	1461310754936	0	33247-8	Weight of Sweat	Specimen wt Sweat Qn	SPEC	\N
B7cad4fbaf4bd5bec02538	1461310758403	0	1924-0	Base deficit in Venous blood	Base deficit BldV-sCnc	CHEM	\N
Qe08073a3141676ab02526	1461310756653	0	27923-2	Ubiquinone 10 [Mass/volume] in Serum or Plasma	Ubiquinone10 SerPl-mCnc	CHEM	\N
v864d1c87265002f302472	1461310748277	0	593-4	Legionella sp identified in Unspecified specimen by Organism specific culture	Legionella XXX Cult	MICRO	\N
xb12b5e52b1fbca0802520	1461310755853	0	20465-1	Choriogonadotropin [Multiple of the median] in Serum or Plasma	HCG MoM SerPl	CHEM	\N
n797afce03ba66c0502524	1461310756361	0	38404-0	CFTR gene mutation analysis in Blood or Tissue by Molecular genetics method Narrative	CFTR Mut Anal Bld/T	MOLPATH.MUT	\N
F6e2ae5c8ac72522d02534	1461310757811	0	5880-0	Rotavirus Ag [Presence] in Stool by Immunoassay	RV Ag Stl Ql EIA	MICRO	\N
Ea9382fbb62d6047902530	1461310757228	0	48039-2	Fibronectin.fetal [Presence] in Unspecified specimen	Fibronectin Fetal XXX Ql	CHEM	\N
C6e60c4543acd478f02532	1461310757520	0	14665-4	Copper [Moles/volume] in Serum or Plasma	Copper SerPl-sCnc	DRUG/TOX	\N
T9e37f962b1a5c94c02536	1461310758103	0	15083-9	Normetanephrine [Moles/time] in 24 hour Urine	Normetanephrine 24h Ur-sRate	CHEM	\N
Uaeb114ef96fae58502542	1461310759043	0	15191-0	Lupus anticoagulant neutralization dilute phospholipid [Presence] in Platelet poor plasma	LAC Nt Dil PL PPP Ql	COAG	\N
Mba98acf5338ca46202544	1461310759361	0	5356-1	Smith extractable nuclear Ab [Presence] in Serum by Immunoassay	ENA SM Ab Ser Ql EIA	SERO	\N
Kbe5a5204fbd4eaff02546	1461310759619	0	23761-0	Neutrophils/100 leukocytes in Blood by Manual count	Neutrophils NFr Bld Manual	HEM/BC	\N
L6c6a466490996a0f02548	1461310759878	0	5297-7	Rheumatoid factor [Presence] in Serum by Latex agglutination	Rheumatoid fact Ser Ql LA	SERO	\N
qc4908db4f93afcb602900	1461310808811	0	52955-2	Benzodiazepines [Moles/volume] in Urine	Benzodiaz Ur-sCnc	DRUG/TOX	\N
qca0720517358150f02550	1461310760173	0	5301-7	Ribonucleoprotein extractable nuclear Ab [Presence] in Serum by Immunoassay	ENA RNP Ab Ser Ql EIA	SERO	\N
Eb7ffc5862bece53903330	1461310869482	0	9811-1	Chromogranin A [Mass/volume] in Serum or Plasma	CgA SerPl-mCnc	CHEM	\N
ic83975f6cccfd22c02608	1461310769467	0	9784-0	Ehrlichia chaffeensis IgM Ab [Titer] in Serum	E chaffeensis IgM Titr Ser	MICRO	\N
Ua0194a2aabe3bb4502592	1461310766920	0	12234-1	Mesothelial cells/100 leukocytes in Body fluid by Manual count	Mesothl Cell NFr Fld Manual	HEM/BC	\N
l8ff95fea0a673b8602568	1461310762703	0	46083-2	Influenza virus B Ag [Presence] in Nasopharynx by Immunoassay	FLUBV Ag Nph Ql EIA	MICRO	\N
ed0bd4330860ecc2502552	1461310760428	0	9783-2	Ehrlichia chaffeensis IgG Ab [Titer] in Serum	E chaffeensis IgG Titr Ser	MICRO	\N
Cce3f098d0e92120202582	1461310765070	0	20458-6	Rubella virus IgG Ab [interpretation] in Serum	RUBV IgG Ser-Imp	MICRO	\N
t89491ecacf881f2e02554	1461310760728	0	25156-1	Eosinophils [Presence] in Urine sediment by Light microscopy	Eosinophil UrnS Ql Micro	UA	\N
g7533ae371b0619b502614	1461310770292	0	11261-5	Bacteria identified in Vaginal fluid by Aerobe culture	Bacteria Vag Aerobe Cult	MICRO	\N
xd58e51695c7af22f02570	1461310763178	0	2357-2	Glucose-6-Phosphate dehydrogenase [Enzymatic activity/volume] in Red Blood Cells	G6PD RBC-cCnc	CHEM	\N
u91e937cd50d615bb02556	1461310760970	0	19839-0	Breath rate spontaneous --on ventilator	Breaths.spontaneous on vent	PULM	\N
e9768a21130bf2d1402602	1461310768442	0	14252-1	Smooth muscle Ab [Presence] in Serum	Smooth muscle Ab Ser Ql	SERO	\N
M85a71ec88549a1b202594	1461310767247	0	23877-4	Anaplasma phagocytophilum IgG Ab [Titer] in Serum by Immunofluorescence	A phagocytoph IgG Titr Ser IF	MICRO	\N
F67bb93a23b39c8ec02584	1461310765362	0	27818-4	Protein C actual/normal in Platelet poor plasma by Chromogenic method	Prot C Act/Nor PPP Chro	COAG	\N
vd71a4c94e0c7807902572	1461310763553	0	28645-0	Carbon dioxide [Partial pressure] in Venous cord blood	pCO2 BldCoV	CHEM	\N
id350f8d463db90db02558	1461310761178	0	13539-2	Phosphate [Moles/volume] in Urine	Phosphate Ur-sCnc	CHEM	\N
a7c8d49cac4394c0d02560	1461310761437	0	13988-1	Beta globulin/Protein.total in 24 hour Urine by Electrophoresis	B-Globulin 24h MFr Ur Elph	CHEM	\N
n86a4ef8aede89ad602574	1461310763853	0	39786-9	Pyridoxine [Moles/volume] in Serum or Plasma	Vit B6 SerPl-sCnc	CHEM	\N
Y902e616ba6f95e0402628	1461310772250	0	57804-7	Number of occult blood specimens recommended by testing kit protocol [#] in Stool	# Occ bld spec recommended Stl	CHEM	\N
db74befd10486eb0e02562	1461310761745	0	4621-9	Hemoglobin S [Presence] in Blood	Hgb S Bld Ql	HEM/BC	\N
Tdb248fe15620bfb702586	1461310765812	0	7691-9	Scallop IgE Ab [Units/volume] in Serum	Scallop IgE Qn	ALLERGY	\N
a98523ff1de445c1f02610	1461310769717	0	49701-6	pH of Blood adjusted to patients actual temperature	pH temp adj Bld	CHEM	\N
Q76ec37695fa2219102576	1461310764203	0	5809-9	Reducing substances [Presence] in Urine	Reducing Subs Ur Ql	UA	\N
ge316b71be834adcc02564	1461310762095	0	26471-3	Leukocytes other/100 leukocytes in Blood	WBC Other NFr Bld	HEM/BC	\N
K85e175e0a775086802596	1461310767553	0	28644-3	Carbon dioxide [Partial pressure] in Arterial cord blood	pCO2 BldCoA	CHEM	\N
j8733619eab4ac4b802566	1461310762395	0	46082-4	Influenza virus A Ag [Presence] in Nasopharynx by Immunoassay	FLUAV Ag Nph Ql EIA	MICRO	\N
Bba1fb68678bf1e4702588	1461310766170	0	20474-3	Bacteria identified in Tissue by Biopsy culture	Bacteria Tiss Bx Cult	MICRO	\N
Yb5a62155546c707502578	1461310764570	0	28649-2	Oxygen [Partial pressure] in Venous cord blood	pO2 BldCoV	CHEM	\N
td0db2181e6581c1c02604	1461310768667	0	21108-6	Beta 2 glycoprotein 1 IgA Ab [Units/volume] in Serum	B2 Glycoprot1 IgA Ser-aCnc	COAG	\N
Q9d8ffd613919cf1b02626	1461310772001	0	25459-9	Lead [Moles/volume] in Serum or Plasma	Lead SerPl-sCnc	DRUG/TOX	\N
Le5e69852548d1b5c02598	1461310767812	0	2956-1	Sodium [Moles/time] in 24 hour Urine	Sodium 24h Ur-sRate	CHEM	\N
E99be1300df82231102580	1461310764845	0	6825-4	Crystals [type] in Body fluid by Light microscopy	Crystals Fld Micro	HEM/BC	\N
Haa0ee8d7b0a1c0d302590	1461310766578	0	28641-9	Bicarbonate [Moles/volume] in Venous cord blood	HCO3 BldCoV-sCnc	CHEM	\N
jaba4f065b45e84e302616	1461310770584	0	23878-2	Anaplasma phagocytophilum IgM Ab [Titer] in Serum by Immunofluorescence	A phagocytoph IgM Titr Ser IF	MICRO	\N
u7a2df53019f592fb02606	1461310768925	0	44447-1	Beta 2 glycoprotein 1 IgA Ab [Units/volume] in Serum by Immunoassay	B2 Glycoprot1 IgA Ser EIA-aCnc	COAG	\N
q6e844258200bce3e02600	1461310768145	0	28648-4	Oxygen [Partial pressure] in Arterial cord blood	pO2 BldCoA	CHEM	\N
d694b1bd3e687f32802612	1461310770009	0	6891-6	Testosterone.bioavailable/Testosterone.total in Serum or Plasma	Testost Bioavail MFr SerPl	CHEM	\N
x788759a3e635967502620	1461310771167	0	49047-4	Globulin [Mass/volume] in Urine by Electrophoresis	Globulin Ur Elph-mCnc	CHEM	\N
n8f52cf274decbc6602624	1461310771709	0	32319-6	Glucose [Moles/volume] in Serum or Plasma --30 minutes post 75 g glucose PO	Glucose 30M p 75 g Glc PO SerPl-sCnc	CHAL	\N
l958c706efeed577902618	1461310770909	0	2112-1	Choriogonadotropin.beta subunit (pregnancy test) [Presence] in Urine	B-HCG Preg Ur Ql	CHEM	\N
Ee59d0b18cd00654402630	1461310772592	0	32207-3	Platelet distribution width [Entitic volume] in Blood by Automated count	PDW Bld Auto	HEM/BC	\N
ve0fe4488709b4d4802622	1461310771442	0	28640-1	Bicarbonate [Moles/volume] in Arterial cord blood	HCO3 BldCoA-sCnc	CHEM	\N
C9d6041b6cc8383f802632	1461310772867	0	25386-4	Creatinine [Moles/volume] in Body fluid	Creat Fld-sCnc	CHEM	\N
Ta3d84b67076f420002636	1461310773459	0	33393-0	Coarse Granular Casts [#/area] in Urine sediment by Microscopy low power field	Coarse Gran Casts #/area UrnS LPF	UA	\N
F98b702d45bf86e9d02634	1461310773109	0	3174-0	Antithrombin [Units/volume] in Platelet poor plasma by Chromogenic method	AT III PPP Chro-aCnc	COAG	\N
Zadb5bf9c7c83ac5d02639	1461310773734	0	9490-4	Aspergillus flavus Ab [Presence] in Serum	A flavus Ab Ser Ql	MICRO	\N
N7e5058b27465b37b02641	1461310773942	0	26447-3	Blasts/100 leukocytes in Cerebral spinal fluid	Blasts NFr CSF	HEM/BC	\N
Je6d7708d312e96c402643	1461310774109	0	8095-2	Smooth muscle Ab [Titer] in Serum	Smooth muscle Ab Titr Ser	SERO	\N
Idedb86cc0485e5d902645	1461310774325	0	14712-4	Epinephrine [Moles/time] in 24 hour Urine	Epineph 24h Ur-sRate	CHEM	\N
Oce47ad6e4936794002647	1461310774642	0	6136-6	Hazelnut IgE Ab [Units/volume] in Serum	Hazelnut IgE Qn	ALLERGY	\N
w69be0a401f1c46ff02651	1461310775209	0	2873-8	Gamma globulin [Mass/volume] in Cerebral spinal fluid by Electrophoresis	Gamma glob CSF Elph-mCnc	CHEM	\N
Da9bd21eb812b08f302681	1461310779725	0	5354-6	Sjogrens syndrome-B extractable nuclear Ab [Presence] in Serum by Immune diffusion (ID)	ENA SS-B Ab Ser Ql ID	SERO	\N
wd55c217a4a7ba8d402701	1461310781826	0	3746-5	Meperidine [Presence] in Urine	Meperidine Ur Ql	DRUG/TOX	\N
r8e66ccd5158b15cb02653	1461310775493	0	9668-5	HIV 1 p55 Ab [Presence] in Serum by Immunoblot (IB)	HIV1 p55 Ab Ser Ql IB	MICRO	\N
ya867652fe31cdcd602669	1461310777851	0	14650-6	Citrate [Moles/time] in 24 hour Urine	Citrate 24h Ur-sRate	CHEM	\N
z75999a2fd00f34c302655	1461310775776	0	9667-7	HIV 1 p51 Ab [Presence] in Serum by Immunoblot (IB)	HIV1 p51 Ab Ser Ql IB	MICRO	\N
Rd273388dba51a40c02683	1461310779959	0	27387-0	Streptococcus pneumoniae 14 IgG Ab [Mass/volume] in Serum	S pneum14 IgG Ser-mCnc	MICRO	\N
c7dd97fda2e129f4a02671	1461310778309	0	14603-5	Androstenedione [Moles/volume] in Serum or Plasma	Androst SerPl-sCnc	CHEM	\N
obb5a8dbf74d76f8e02657	1461310776084	0	24469-9	Hemoglobin XXX/Hemoglobin.total in Blood by Electrophoresis	Hgb XXX MFr Bld Elph	HEM/BC	\N
Jae93bd5d624cb46102693	1461310780893	0	2640-1	Myoglobin [Presence] in Urine	Myoglobin Ur Ql	CHEM	\N
pa9288800e46bf43b02709	1461310783201	0	28643-5	Oxygen saturation in Venous cord blood	SaO2 % BldCoV	CHEM	\N
p783ef81dc909162f02659	1461310776334	0	771-6	Nucleated erythrocytes [#/volume] in Blood by Automated count	nRBC # Bld Auto	HEM/BC	\N
bbc8b046470e49d8202673	1461310778601	0	13993-1	Alpha 2 globulin/Protein.total in Urine by Electrophoresis	Alpha2 Glob MFr Ur Elph	CHEM	\N
V97b97cb2e3e9ff6e02685	1461310780176	0	27229-4	Streptococcus pneumoniae 14 IgG Ab [Mass/volume] in Serum by Immunoassay	S pneum14 IgG Ser EIA-mCnc	MICRO	\N
s78704ae51226b52f02661	1461310776634	0	9664-4	HIV 1 p24 Ab [Presence] in Serum by Immunoblot (IB)	HIV1 p24 Ab Ser Ql IB	MICRO	\N
ha05965aec2c81bd202715	1461310784293	0	13926-1	Glutamate decarboxylase 65 Ab [Units/volume] in Serum	GAD65 Ab Ser-aCnc	SERO	\N
rc07ad4752f793be402703	1461310782184	0	12195-4	Creatinine renal clearance/1.73 sq M in 24 hour	Creat Cl/1.73 sq M 24h Ur+SerPl-ArVRat	CHEM	\N
mbfcdc3f3118664a002675	1461310778876	0	5785-1	Eosinophils [#/area] in Urine sediment by Microscopy high power field	Eosinophil #/area UrnS HPF	UA	\N
f89084d4ca069980502663	1461310776976	0	9661-0	HIV 1 gp120 Ab [Presence] in Serum by Immunoblot (IB)	HIV1 gp120 Ab Ser Ql IB	MICRO	\N
Id4707f3552b0bb8a02695	1461310781192	0	2998-3	Thiamine [Mass/volume] in Blood	Vit B1 Bld-mCnc	CHEM	\N
G9d0d029beac05a5902687	1461310780334	0	1869-7	Apolipoprotein A-I [Mass/volume] in Serum or Plasma	Apo A-I SerPl-mCnc	CHEM	\N
h82a79838fe5c2ec302665	1461310777192	0	9666-9	HIV 1 p31 Ab [Presence] in Serum by Immunoblot (IB)	HIV1 p31 Ab Ser Ql IB	MICRO	\N
A86c132fdc881eb5102677	1461310779234	0	13995-6	Gamma globulin/Protein.total in Urine by Electrophoresis	Gamma glob MFr Ur Elph	CHEM	\N
kd3475a9fd87a321a02667	1461310777517	0	11070-0	Microscopic observation [Identifier] in Urine by Cyto stain	Cyto Ur	CYTO	\N
A9a5d2260e4b6426d02727	1461310786801	0	11039-5	C reactive protein [Presence] in Serum or Plasma	CRP SerPl Ql	CHEM	\N
W8a9cdd22e863123002679	1461310779551	0	14854-4	Norepinephrine [Moles/time] in 24 hour Urine	Norepineph 24h Ur-sRate	CHEM	\N
Zcdcd7291075d99fa02689	1461310780476	0	33332-8	Linezolid [Susceptibility] by Gradient strip (E-test)	Linezolid Islt E-test	ABXBACT	\N
O74a3aa407a2daa6002697	1461310781376	0	38544-3	Spermatozoa [#/volume] in Semen --pre washing	Sperm Pre Wash # Smn	FERT	\N
sa4ad758d18a8cec702711	1461310783610	0	5057-5	Blastomyces dermatitidis Ab [Titer] in Serum by Complement fixation	B dermat Ab Titr Ser CF	MICRO	\N
z8c80ae9c091d12b702705	1461310782526	0	15059-9	Dopamine [Moles/time] in 24 hour Urine	Dopamine 24h Ur-sRate	CHEM	\N
N9fa42e989a76b56602691	1461310780685	0	5352-0	Sjogrens syndrome-A extractable nuclear Ab [Presence] in Serum by Immune diffusion (ID)	ENA SS-A Ab Ser Ql ID	SERO	\N
P90398e3a9f7c11f502699	1461310781592	0	38540-1	Spermatozoa Motile/100 spermatozoa in Semen --pre washing	Sperm Motile Pre Wash NFr Smn	FERT	\N
cdf96ae5cdf80377402721	1461310785401	0	6007-9	Protein C [Units/volume] in Platelet poor plasma by Coagulation assay	Prot C PPP-aCnc	COAG	\N
k6ad981a4c823c28a02717	1461310784651	0	2513-0	Ketones [Presence] in Serum or Plasma	Ketones SerPl Ql	CHEM	\N
o9a99b1d720ee752c02707	1461310782843	0	11140-1	Metanephrine [Moles/time] in 24 hour Urine	Metaneph 24h Ur-sRate	CHEM	\N
f947f9759595cbcea02713	1461310783960	0	6092-1	Crab IgE Ab [Units/volume] in Serum	Crab IgE Qn	ALLERGY	\N
m845b50fe86a35c7502725	1461310786318	0	7984-8	Parvovirus B19 IgM Ab [Units/volume] in Serum	B19V IgM Ser-aCnc	MICRO	\N
Vd34bce9085c9050102735	1461310788035	0	28642-7	Oxygen saturation in Arterial cord blood	SaO2 % BldCoA	CHEM	\N
y8038c7da5fcac0ed02719	1461310785018	0	2518-9	Lactate [Moles/volume] in Arterial blood	Lactate BldA-sCnc	CHEM	\N
bb05ce812f9a18e4302723	1461310785732	0	14708-2	Endomysium Ab [Titer] in Serum	Endomysium Ab Titr Ser	SERO	\N
G8fb4882cf5e0701702737	1461310788418	0	25489-6	Normetanephrine [Moles/volume] in Serum or Plasma	Normetanephrine SerPl-sCnc	CHEM	\N
D6d78e93c2b99f34b02731	1461310787451	0	30340-4	Epstein Barr virus capsid IgM Ab [Presence] in Serum	EBV VCA IgM Ser Ql	MICRO	\N
W6c186f83dc75707702729	1461310787201	0	32680-1	Fine Granular Casts [#/area] in Urine sediment by Microscopy low power field	Fine Gran Casts #/area UrnS LPF	UA	\N
Rc266eb2af5c16e5b02733	1461310787727	0	24115-8	Epstein Barr virus capsid IgM Ab [Presence] in Serum by Immunoassay	EBV VCA IgM Ser Ql EIA	MICRO	\N
Zd9938b527684620e02739	1461310788676	0	19942-2	Oxygen gas flow setting	Gas flow.O2 setting	PULM	\N
N82c2f6911c4289a302741	1461310788776	0	18319-4	Neutrophils.vacuolated [Presence] in Blood by Light microscopy	Neuts Vac Bld Ql Smear	HEM/BC	\N
J798807c53874d8f902743	1461310789026	0	15530-9	Alternaria alternata IgE Ab RAST class in Serum	A alternata IgE RAST Ql	ALLERGY	\N
Ib7f8d88f7531a03702745	1461310789177	0	3256-5	Fibrinogen Ag [Mass/volume] in Platelet poor plasma by Immunologic method	Fibrinogen Ag PPP Imm-mCnc	COAG	\N
Oc54562d9119af7b202747	1461310789343	0	35789-7	Daptomycin [Susceptibility]	Daptomycin Susc Islt	ABXBACT	\N
P9704cc3ebbe08ecf02749	1461310789479	0	21365-2	Leptin [Mass/volume] in Serum or Plasma	Leptin SerPl-mCnc	CHEM	\N
k82f07f397ab56d3402767	1461310791043	0	6379-2	Cytomegalovirus Ag [Presence] in Unspecified specimen by Immunoassay	CMV Ag XXX Ql EIA	MICRO	\N
we3c7faf1b652f27a02751	1461310789702	0	21441-1	Human papilloma virus 6+11+42+43+44 DNA [Presence] in Cervix by DNA probe	HPV Low Risk DNA Cervix Ql Prb	MICRO	\N
Db82b4dc9aacf6cde02781	1461310792135	0	9796-4	Color of Stone	Color Stone	SPEC	\N
r7f5272311f49995802753	1461310789959	0	14956-7	Microalbumin [Mass/time] in 24 hour Urine	Microalbumin 24h Ur-mRate	CHEM	\N
pb9c882682722182d02809	1461310796660	0	15212-4	Lipase [Enzymatic activity/volume] in Body fluid	Lipase Fld-cCnc	CHEM	\N
Jbfc0d7ae5fe38e4c02793	1461310793960	0	25170-2	Mercury [Moles/volume] in Blood	Mercury Bld-sCnc	DRUG/TOX	\N
y82dbc28b01fc1c7e02769	1461310791177	0	16264-4	Calcium oxalate monohydrate crystals [Presence] in Stone by Infrared spectroscopy	COM Cry Stone Ql IR	CHEM	\N
za3fa75ec50a28c5a02755	1461310790160	0	14935-1	Urate [Moles/time] in 24 hour Urine	Urate 24h Ur-sRate	CHEM	\N
Rbd57ad3937881bee02783	1461310792410	0	9802-0	Size [Entitic volume] of Stone	Size Stone	PATH	\N
c6e85a17e0de047fa02771	1461310791352	0	49542-4	Date and time of pheresis procedure	Pheresis Date&Time	BLDBK	\N
o9bd176cb7c4c5f9c02757	1461310790327	0	5863-6	Influenza virus A Ag [Presence] in Unspecified specimen by Immunofluorescence	FLUAV Ag XXX Ql IF	MICRO	\N
hb776ef65f0241c8602815	1461310797285	0	27230-2	Streptococcus pneumoniae 19 IgG Ab [Mass/volume] in Serum by Immunoassay	S pneum19 IgG Ser EIA-mCnc	MICRO	\N
rdeac451fc351c33802803	1461310795702	0	19835-8	Breath rate setting Ventilator synchronized intermittent mandatory	Breaths setting SIMV	PULM	\N
p8f55c7c4d6334b4002759	1461310790468	0	34524-9	Neutrophils.band form [Presence] in Blood by Automated count	Neuts Band Bld Ql Auto	HEM/BC	\N
Ie18859345f07ad1a02795	1461310794285	0	2605-4	Meat fibers [Presence] in Stool by Light microscopy	Meat Fibers Stl Ql Micro	CHEM	\N
b9bf3efd3e8778f4402773	1461310791518	0	30339-6	Epstein Barr virus capsid IgG Ab [Presence] in Serum	EBV VCA IgG Ser Ql	MICRO	\N
sd68e990ab30dfeac02761	1461310790660	0	23841-0	Choriogonadotropin.beta subunit [Multiple of the median] adjusted in Serum or Plasma	B-HCG adj MoM SerPl	CHEM	\N
Vd8ceef127acea6e602785	1461310792743	0	2428-1	Homocysteine [Mass/volume] in Serum or Plasma	Homocysteine SerPl-mCnc	CHEM	\N
mb62d24a128068a6002775	1461310791626	0	24114-1	Epstein Barr virus capsid IgG Ab [Presence] in Serum by Immunoassay	EBV VCA IgG Ser Ql EIA	MICRO	\N
f84933ca2474f15f902763	1461310790760	0	1857-2	Angiotensin converting enzyme [Enzymatic activity/volume] in Blood	ACE Bld-cCnc	CHEM	\N
Waa6b02310adb4cef02829	1461310798385	0	40926-8	Streptococcus pneumoniae 68 IgG Ab [Mass/volume] in Serum by Immunoassay	S pneum68 IgG Ser EIA-mCnc	MICRO	\N
A86ca103081e6498c02827	1461310798144	0	30153-1	Streptococcus pneumoniae 68 IgG Ab [Mass/volume] in Serum	S pneum68 IgG Ser-mCnc	MICRO	\N
h849eb312b8f7995702765	1461310790860	0	31797-4	Cytomegalovirus Ag [Presence] in Unspecified specimen	CMV Ag XXX Ql	MICRO	\N
Gc580288a6b10f9d202787	1461310793135	0	35538-8	Baker's yeast IgG Ab [Mass/volume] in Serum	Baker's yeast IgG-mCnc	ALLERGY	\N
Ab04a96a8abb865f702777	1461310791810	0	32554-8	Thiamine [Moles/volume] in Blood	Vit B1 Bld-sCnc	CHEM	\N
sd1bc105d90e8869e02811	1461310796994	0	3507-1	Codeine [Presence] in Urine	Codeine Ur Ql	DRUG/TOX	\N
Obfcc6a6dd7ea77d602797	1461310794701	0	730-2	Leukocytes other/100 leukocytes in Blood by Manual count	WBC Other NFr Bld Manual	HEM/BC	\N
zccd0e4c571bfe65602805	1461310795960	0	27395-3	Streptococcus pneumoniae 56 IgG Ab [Mass/volume] in Serum	S pneum56 IgG Ser-mCnc	MICRO	\N
We37e00c5a18ded8802779	1461310791918	0	14316-4	Benzodiazepines [Presence] in Urine by Screen method	Benzodiaz Ur Ql Scn	DRUG/TOX	\N
Ze4b29fc77497044b02789	1461310793402	0	48050-9	Neutrophils [Presence] in Stool by Wright stain	Neutrophils Stl Ql Wright Stn	HEM/BC	\N
P8efef7349799bdf802799	1461310795102	0	8249-5	Transitional cells [Presence] in Urine sediment by Light microscopy	Trans Cells UrnS Ql Micro	UA	\N
N79d4005aa977ef4c02791	1461310793652	0	20593-0	CD19 cells/100 cells in Unspecified specimen	CD19 Cells NFr XXX	CELLMARK	\N
kb90c560938d7bc0402817	1461310797478	0	27389-6	Streptococcus pneumoniae 23 IgG Ab [Mass/volume] in Serum	S pneum23 IgG Ser-mCnc	MICRO	\N
odb8f5d214bd7b55602807	1461310796277	0	40913-6	Streptococcus pneumoniae 56 IgG Ab [Mass/volume] in Serum by Immunoassay	S pneum56 IgG Ser EIA-mCnc	MICRO	\N
wc1dd8e370a4828aa02801	1461310795419	0	30427-9	Macrophages/100 leukocytes in Body fluid	Macrophages NFr Fld	HEM/BC	\N
f7aeef73073c1a56502813	1461310797144	0	27390-4	Streptococcus pneumoniae 19 IgG Ab [Mass/volume] in Serum	S pneum19 IgG Ser-mCnc	MICRO	\N
ca06d3cc2d22fcf3f02821	1461310797710	0	27094-2	Streptococcus pneumoniae 4 IgG Ab [Mass/volume] in Serum	S pneum4 IgG Ser-mCnc	MICRO	\N
md59bdcc71546322e02825	1461310797936	0	4575-7	Hemoglobin E/Hemoglobin.total in Blood	Hgb E MFr Bld	HEM/BC	\N
yb563516677aa574e02819	1461310797560	0	27231-0	Streptococcus pneumoniae 23 IgG Ab [Mass/volume] in Serum by Immunoassay	S pneum23 IgG Ser EIA-mCnc	MICRO	\N
Dadff47caaaf92c0602831	1461310798644	0	35127-0	Hemoglobin A2.prime/Hemoglobin.total in Blood	Hgb A2.prime MFr Bld	HEM/BC	\N
bb6435d0ce2d0b25802823	1461310797835	0	40908-6	Streptococcus pneumoniae 4 IgG Ab [Mass/volume] in Serum by Immunoassay	S pneum4 IgG Ser EIA-mCnc	MICRO	\N
Rcbd31c8bffdc92f702833	1461310799002	0	31156-3	Hemoglobin Barts/Hemoglobin.total in Blood	Hgb Barts MFr Bld	HEM/BC	\N
Gc121464594a3b3a802837	1461310799761	0	33593-5	Hemoglobin G - Coushatta/Hemoglobin.total in Blood	Hgb G-Coush MFr Bld	HEM/BC	\N
Vc6b5c7575735158902835	1461310799428	0	4569-0	Hemoglobin D/Hemoglobin.total in Blood	Hgb D MFr Bld	HEM/BC	\N
Zc293425d8974965c02839	1461310800044	0	35125-4	Hemoglobin Lepore/Hemoglobin.total in Blood	Hgb Lepore MFr Bld	HEM/BC	\N
Nb4f84d06640d398002841	1461310800319	0	35126-2	Hemoglobin O - Arab/Hemoglobin.total in Blood	Hgb O-Arab MFr Bld	HEM/BC	\N
J9f2a63071f6cf42a02843	1461310800653	0	13986-5	Albumin/Protein.total in 24 hour Urine by Electrophoresis	Albumin 24h MFr Ur Elph	CHEM	\N
Ia0a3b96ce7936ee902845	1461310800978	0	6165-5	Lobster IgE Ab [Units/volume] in Serum	Lobster IgE Qn	ALLERGY	\N
Ob5a6d257adc5dda402847	1461310801344	0	21709-1	MTHFR gene mutations found [Identifier] in Blood or Tissue by Molecular genetics method Nominal	MTHFR gene Mut Anal Bld/T	MOLPATH.MUT	\N
P923cd7ce325a888102849	1461310801677	0	29573-3	Phenylalanine [Moles/volume] in Dried blood spot	Phe DBS-sCnc	CHEM	\N
Cd9abdc844a4fd83903332	1461310869783	0	10355-6	Microscopic observation [Identifier] in Bone marrow by Wright Giemsa stain	Wright Gie Stn Mar	MICRO	\N
U75d30a688845825902892	1461310807278	0	17607-3	Volume of Cerebral spinal fluid	Specimen vol CSF	SPEC	\N
la7015888a8eb968002868	1461310804069	0	14947-6	Vanillylmandelate [Moles/time] in 24 hour Urine	VMA 24h Ur-sRate	CHEM	\N
w6d8b413a06d1aaec02851	1461310802002	0	35572-7	Phenylalanine/Tyrosine [Molar ratio] in Dried blood spot	Phe/Tyr DBS-sRto	CHEM	\N
i8e6c927856ddb6b903358	1461310873216	0	70218-3	Triglyceride [Moles/volume] in Blood	Trigl Bld-sCnc	CHEM	\N
C7b66239cbe063ca502882	1461310805736	0	33333-6	Colistin [Susceptibility] by Gradient strip (E-test)	Colistin Islt E-test	ABXBACT	\N
Kdf1e7b98c078612d03346	1461310871516	0	41279-1	Borrelia burgdorferi IgG Ab/IgM Ab [Ratio] in Serum	B burgdor IgG/IgM Ser-Rto	MICRO	\N
re621bf082a6001ab02853	1461310802310	0	14833-8	Metanephrines [Moles/time] in 24 hour Urine	MetanephS 24h Ur-sRate	CHEM	\N
H9108e9d6a18f304a03340	1461310870766	0	7613-3	Pistachio IgE Ab [Units/volume] in Serum	Pistachio IgE Qn	ALLERGY	\N
xaa5ba6a555d60df202870	1461310804269	0	14835-3	Methanol [Moles/volume] in Serum or Plasma	Methanol SerPl-sCnc	DRUG/TOX	\N
Fa02d07d34f18eacf03334	1461310870016	0	15057-3	Androstanolone [Moles/volume] in Serum or Plasma	Androstanolone SerPl-sCnc	CHEM	\N
zbb016f240a2e086e02855	1461310802560	0	35571-9	Tyrosine [Moles/volume] in Dried blood spot	Tyrosine DBS-sCnc	CHEM	\N
M956d6444d3c7197702894	1461310807728	0	43583-4	Lipoprotein a [Moles/volume] in Serum or Plasma	LPa SerPl-sCnc	CHEM	\N
vc08d1086dc5e6d2c02872	1461310804530	0	13499-9	HIV 1 Ab band pattern [interpretation] in Serum by Immunoblot (IB)	HIV1 Ab Patrn Ser IB-Imp	MICRO	\N
o6c3e5918d9d61bc902857	1461310802885	0	13984-0	Alpha 1 globulin/Protein.total in 24 hour Urine by Electrophoresis	Alpha1 Glob 24h MFr Ur Elph	CHEM	\N
lc64df10ea1eed07303368	1461310874968	0	30193-7	Acylcarnitine/Carnitine.free (C0) [Molar ratio] in Serum or Plasma	Acylcarnitine/C0 SerPl-sRto	CHEM	\N
Fcc5d8451d028d34302884	1461310806028	0	71790-0	Calcium [Moles/volume] in unspecified time Urine	Calcium ?Tm Ur-sCnc	CHEM	\N
gca4f63cd138ebea803364	1461310874216	0	14869-2	Pathologist review of Blood tests	Path Rev Bld -Imp	BLDBK	\N
p713c329860ed2a3402859	1461310803136	0	38415-6	MTHFR gene mutation analysis in Blood or Tissue by Molecular genetics method Narrative	MTHFR gene Mut Anal Bld/T	MOLPATH.MUT	\N
T8436c30a398aea2a03336	1461310870266	0	32109-1	Phenytoin Free [Moles/volume] in Serum or Plasma	Phenytoin Free SerPl-sCnc	DRUG/TOX	\N
nc6919d5240e24c2102874	1461310804736	0	49540-8	Acid citrate dextrose [Volume] in Blood product unit	Acid citrate dextrose Vol BPU	BLDBK	\N
Ua998fff022073f3f03342	1461310870983	0	14083-0	Epstein Barr virus early Ab [Titer] in Serum by Immunofluorescence	EBV EA Ab Titr Ser IF	MICRO	\N
s91a76b567c29194402861	1461310803403	0	42484-6	Protein.monoclonal/Protein.total in 24 hour Urine by Electrophoresis	M Protein 24h MFr Ur Elph	CHEM	\N
e69e0397b1d52f9de03352	1461310872341	0	1746-7	Albumin [Mass/volume] in Cerebral spinal fluid	Albumin CSF-mCnc	CHEM	\N
T9bf58642d2fdce1102886	1461310806361	0	588-4	Legionella pneumophila Ag [Presence] in Unspecified specimen by Immunofluorescence	L pneumo Ag XXX Ql IF	MICRO	\N
Qd20b11684945335b02876	1461310804961	0	5292-8	Reagin Ab [Presence] in Serum by VDRL	VDRL Ser Ql	MICRO	\N
Lb3af799952c3380403348	1461310871841	0	7883-2	Epstein Barr virus nuclear IgG Ab [Presence] in Serum	EBV NA IgG Ser Ql	MICRO	\N
g93343b656db1484602864	1461310803661	0	10863-9	Endomysium IgA Ab [Titer] in Serum	Endomysium IgA Titr Ser	SERO	\N
Bb7a1187ca857c4e803338	1461310870507	0	6270-3	Tuna IgE Ab [Units/volume] in Serum	Tuna IgE Qn	ALLERGY	\N
K773a9d0ab100a7ba02896	1461310808132	0	52956-0	Barbiturates [Moles/volume] in Urine	Barbiturates Ur-sCnc	DRUG/TOX	\N
jd2a8d3f632dff34602866	1461310803861	0	3830-7	Morphine [Presence] in Urine	Morphine Ur Ql	DRUG/TOX	\N
B6c6fc8d30bfcb10302888	1461310806703	0	8150-5	Amphetamines [Mass/volume] in Urine	Amphetamines Ur-mCnc	DRUG/TOX	\N
Yb800bdf16f8fee3d02878	1461310805186	0	31102-7	Protein S actual/normal in Platelet poor plasma by Chromogenic method	Prot S Act/Nor PPP Chro	COAG	\N
ud343f81bea5637e603356	1461310872883	0	26479-6	Lymphocytes/100 leukocytes in Cerebral spinal fluid	Lymphocytes NFr CSF	HEM/BC	\N
Mae4ce30dcbd3021f03344	1461310871232	0	18182-6	Osmolality of Serum or Plasma by calculation	Osmolality SerPl Calc	CHEM	\N
Ee7311a85820bf55d02880	1461310805427	0	25157-9	Epithelial casts [Presence] in Urine sediment by Light microscopy	Epith Casts UrnS Ql Micro	UA	\N
dbc19838c81f6883603362	1461310873941	0	15643-0	Clam IgE Ab RAST class in Serum	Clam IgE RAST Ql	ALLERGY	\N
Ldf36295c2c0ee9e102898	1461310808495	0	9785-7	Deprecated Microscopic observation [Identifier] in Stool by Ova and Parasite Preparation	Deprecated O and P Prep Stl	MICRO	\N
H70bac2efcc9b77b302890	1461310806986	0	40287-5	Glucose [Moles/volume] in Serum or Plasma --1 hour post meal	Glucose 1h p meal SerPl-sCnc	CHAL	\N
q9e1f85ceecbb8b0b03350	1461310872091	0	20425-5	Cardiolipin IgM Ab [interpretation] in Serum	Cardiolipin IgM Ser-Imp	COAG	\N
tbd77de9e86fc451603354	1461310872591	0	20424-8	Cardiolipin IgG Ab [interpretation] in Serum	Cardiolipin IgG Ser-Imp	COAG	\N
aa6595b9f117a257703360	1461310873532	0	609-8	Bacteria identified in Eye by Aerobe culture	Bacteria Eye Aerobe Cult	MICRO	\N
j8150f0b3a075edcd03366	1461310874524	0	5814-9	Triple phosphate crystals [Presence] in Urine sediment by Light microscopy	Tri-Phos Cry UrnS Ql Micro	UA	\N
xb56cfe7419179eb303370	1461310875191	0	8047-3	Varicella zoster virus IgG Ab [Units/volume] in Serum	VZV IgG Ser-aCnc	MICRO	\N
vb3f04d59b1b2961503372	1461310875433	0	38476-8	Mullerian inhibiting substance [Mass/volume] in Serum or Plasma	MIS SerPl-mCnc	CHEM	\N
nd0933dd95d01a8ed03374	1461310875658	0	5834-7	Adenovirus Ag [Presence] in Unspecified specimen by Immunofluorescence	HAdV Ag XXX Ql IF	MICRO	\N
Qe571b35a479a400503376	1461310875933	0	6257-0	Strawberry IgE Ab [Units/volume] in Serum	Strawberry IgE Qn	ALLERGY	\N
Ya7ea355aa63f3af603378	1461310876116	0	28009-9	Volume of Urine	Specimen vol Ur	SPEC	\N
E900bd748946dd24703380	1461310876291	0	19111-4	Mother's hospital number	Mother's hospital #	CLIN	\N
r6a311ced1a62945303553	1461310898584	0	19087-6	Collection of urine specimen end time	Collect End Tme Ur	SPEC	\N
eade68eff69d0037c02902	1461310809136	0	9428-4	Benzodiazepines [Mass/volume] in Urine	Benzodiaz Ur-mCnc	DRUG/TOX	\N
Cc240e896d708bde403382	1461310876491	0	13349-6	Leukocytes [#/volume] in Stool by Manual count	WBC # Stl Manual	HEM/BC	\N
id653732deeb2805102958	1461310817137	0	27227-8	Streptococcus pneumoniae 1 IgG Ab [Mass/volume] in Serum by Immunoassay	S pneum1 IgG Ser EIA-mCnc	MICRO	\N
xab971a231e10cd1f02920	1461310811820	0	28545-2	Mucus [#/area] in Urine sediment by Microscopy low power field	Mucous Threads #/area UrnS LPF	UA	\N
t94962a93bd69723f02904	1461310809470	0	31032-6	Baker's yeast IgA Ab [Units/volume] in Serum	Baker's yeast IgA Qn	ALLERGY	\N
ecf39d276e659841b02952	1461310816137	0	15049-0	Creatine kinase.MM/Creatine kinase.total in Serum or Plasma by Electrophoresis	CK MM CFr SerPl Elph	CHEM	\N
M9f4fe29c271e6d9b02944	1461310814737	0	27392-0	Streptococcus pneumoniae 9 IgG Ab [Mass/volume] in Serum	S pneum9 IgG Ser-mCnc	MICRO	\N
F7fa73ce650820f0c02934	1461310813228	0	27228-6	Streptococcus pneumoniae 3 IgG Ab [Mass/volume] in Serum by Immunoassay	S pneum3 IgG Ser EIA-mCnc	MICRO	\N
u9a2256dd6a0dbcab02906	1461310809795	0	47320-7	Baker's yeast IgA Ab [Units/volume] in Serum by Immunoassay	Baker's yeast IgA Qn EIA	ALLERGY	\N
v988ba1483624b7dd02922	1461310812103	0	6113-5	Gum-Tree IgE Ab [Units/volume] in Serum	Gum-Tree IgE Qn	ALLERGY	\N
i67b68af7baec578702908	1461310810103	0	22086-3	Aspergillus niger Ab [Presence] in Serum	A niger Ab Ser Ql	MICRO	\N
g87a26c3f0ae89c9002964	1461310818212	0	41763-4	Rubella virus IgG Ab [Titer] in Serum	RUBV IgG Titr Ser	MICRO	\N
ncc4dbf445cbdf2ce02924	1461310812303	0	27118-9	Streptococcus pneumoniae 26 IgG Ab [Mass/volume] in Serum	S pneum26 IgG Ser-mCnc	MICRO	\N
aa0fb0fb5ac88be8f02910	1461310810420	0	6164-8	Virginia Live Oak IgE Ab [Units/volume] in Serum	Virg Live Oak IgE Qn	ALLERGY	\N
Tcf5a9b506d88f26c02936	1461310813453	0	25296-5	Streptococcus pneumoniae 51 IgG Ab [Mass/volume] in Serum	S pneum51 IgG Ser-mCnc	MICRO	\N
d688b1738b53c4d4e02912	1461310810728	0	33915-0	Anabasine [Mass/volume] in Urine	Anabasine Ur-mCnc	DRUG/TOX	\N
Kcd7f5117aec8b87702946	1461310815112	0	40923-5	Streptococcus pneumoniae 9 IgG Ab [Mass/volume] in Serum by Immunoassay	S pneum9 IgG Ser EIA-mCnc	MICRO	\N
Qd64f50a498ef71c802926	1461310812486	0	40905-2	Streptococcus pneumoniae 26 IgG Ab [Mass/volume] in Serum by Immunoassay	S pneum26 IgG Ser EIA-mCnc	MICRO	\N
g8d7d9d76b0f8dc1102914	1461310811045	0	13358-7	Collection time of Semen	Collect Tme Smn	SPEC	\N
Bda0f09f30c4e994b02938	1461310813695	0	40911-0	Streptococcus pneumoniae 51 IgG Ab [Mass/volume] in Serum by Immunoassay	S pneum51 IgG Ser EIA-mCnc	MICRO	\N
Yb49dfd0be73d3d0202928	1461310812670	0	12856-1	HIV 1 p65 Ab [Presence] in Serum by Immunoblot (IB)	HIV1 p65 Ab Ser Ql IB	MICRO	\N
j969210b8f077aaa702916	1461310811246	0	25507-5	Pregnenolone [Moles/volume] in Serum or Plasma	Preg SerPl-sCnc	CHEM	\N
t8f3a198271504ecf02954	1461310816470	0	9662-8	HIV 1 gp41 Ab [Presence] in Serum by Immunoblot (IB)	HIV1 gp41 Ab Ser Ql IB	MICRO	\N
accfe7c47c43c873002960	1461310817512	0	26019-0	Creatine Kinase.macromolecular type 1/Creatine kinase.total in Serum or Plasma	CK Macro1 CFr SerPl	CHEM	\N
l80b1c134f45f662102918	1461310811478	0	34519-9	HFE gene mutation analysis in Blood or Tissue by Molecular genetics method Narrative	HFE gene Mut Anal Bld/T	MOLPATH.MUT	\N
La3ec93df5ec372d402948	1461310815462	0	15048-2	Creatine kinase.BB/Creatine kinase.total in Serum or Plasma by Electrophoresis	CK BB CFr SerPl Elph	CHEM	\N
H6a09f35bf639a49e02940	1461310813995	0	27113-0	Streptococcus pneumoniae 8 IgG Ab [Mass/volume] in Serum	S pneum8 IgG Ser-mCnc	MICRO	\N
E84e657ed4b6d7c9e02930	1461310812836	0	19077-7	Cells identified in Body fluid	Cells Fld	HEM/BC	\N
E72206ecbbdf9f71d02980	1461310820562	0	18267-5	CD16+CD56+ cells/100 cells in Blood	CD16+CD56+ Cells NFr Bld	CELLMARK	\N
Cb022c9621ac53fe702932	1461310813012	0	27096-7	Streptococcus pneumoniae 3 IgG Ab [Mass/volume] in Serum	S pneum3 IgG Ser-mCnc	MICRO	\N
Y9e377f9f9018202a02978	1461310820262	0	14934-4	Urate [Moles/volume] in Urine	Urate Ur-sCnc	CHEM	\N
Q78a89de662dca55a02976	1461310819929	0	21619-2	APOE gene mutations found [Identifier] in Blood or Tissue by Molecular genetics method Nominal	APOE gene Mut Anal Bld/T	MOLPATH.MUT	\N
U88ecd71730f6a76c02942	1461310814354	0	40920-1	Streptococcus pneumoniae 8 IgG Ab [Mass/volume] in Serum by Immunoassay	S pneum8 IgG Ser EIA-mCnc	MICRO	\N
u7755934c04a3a98e02956	1461310816795	0	27092-6	Streptococcus pneumoniae 1 IgG Ab [Mass/volume] in Serum	S pneum1 IgG Ser-mCnc	MICRO	\N
qc30442414b2a25b002950	1461310815804	0	12187-1	Creatine kinase.MB/Creatine kinase.total in Serum or Plasma by Electrophoresis	CK MB CFr SerPl Elph	CHEM	\N
x752f77907851306d02970	1461310819112	0	6050-9	Brazil Nut IgE Ab [Units/volume] in Serum	Brazil Nut IgE Qn	ALLERGY	\N
j9213314885bb230902966	1461310818487	0	42483-8	Protein.monoclonal/Protein.total in Urine by Electrophoresis	M Protein MFr Ur Elph	CHEM	\N
db2dca1042a403dc102962	1461310817820	0	26020-8	Creatine Kinase.macromolecular type 2/Creatine kinase.total in Serum or Plasma	CK Macro2 CFr SerPl	CHEM	\N
nb820152215ddae5a02974	1461310819687	0	40903-7	Streptococcus pneumoniae 12 IgG Ab [Mass/volume] in Serum by Immunoassay	S pneum12 IgG Ser EIA-mCnc	MICRO	\N
ld21f037ca51d360202968	1461310818820	0	12859-5	HIV 1 p18 Ab [Presence] in Serum by Immunoblot (IB)	HIV1 p18 Ab Ser Ql IB	MICRO	\N
v88b42b4ae235239302972	1461310819412	0	27374-8	Streptococcus pneumoniae 12 IgG Ab [Mass/volume] in Serum	S pneum12 IgG Ser-mCnc	MICRO	\N
C854b8a255fa859bb02982	1461310820796	0	48560-7	Human papilloma virus genotype [Identifier] in Unspecified specimen by Probe and target amplification method	HPV Gentyp XXX PCR	MICRO	\N
F9ca592b991b320c302984	1461310821096	0	33536-4	Miscellaneous allergen IgE Ab RAST class in Serum	Misc Allergen IgE RAST Ql	ALLERGY	\N
Tbfc6ecc8ac8d33e102986	1461310821346	0	14288-5	Carnitine [Moles/volume] in Serum or Plasma	Carnitine SerPl-sCnc	CHEM	\N
B9ee26768acfbaee102988	1461310821759	0	20402-4	CD16+CD56+ cells [#/volume] in Blood	CD16+CD56+ Cells # Bld	CELLMARK	\N
Hb62ccd0b9c648ccd02990	1461310822355	0	2333-3	Gastrin [Mass/volume] in Serum or Plasma	Gastrin SerPl-mCnc	CHEM	\N
Uca0e3ba3e781feee02992	1461310822638	0	11778-8	Delivery date Estimated	Deliv date Clin est	OB.US	\N
M908e45451e015deb02994	1461310822879	0	42810-2	Hemoglobin [Entitic mass] in Reticulocytes	Hgb Retic Qn	HEM/BC	\N
K998bd7714f95d4be02996	1461310823045	0	5191-2	Hepatitis B virus e Ag [Units/volume] in Serum by Immunoassay	HBV e Ag Ser EIA-aCnc	MICRO	\N
Lc871ed01deb57c5902998	1461310823321	0	26458-0	Erythrocytes [#/volume] in Synovial fluid	RBC # Snv	HEM/BC	\N
ja202aa014ba1ecdd03066	1461310832472	0	14573-0	5-Hydroxyindoleacetate [Moles/time] in 24 hour Urine	5OH-indoleacetate 24h Ur-sRate	CHEM	\N
Ya8ed6c31faa0e73d03028	1461310827630	0	6009-5	Protein C Ag [Units/volume] in Platelet poor plasma by Immunologic method	Prot C Ag PPP Imm-aCnc	COAG	\N
Ld568af44980d385903048	1461310830471	0	35452-2	HIV 1 gp40 Ab [Presence] in Serum by Immunoblot (IB)	HIV1 gp40 Ab Ser Ql IB	MICRO	\N
q773a042645fc7b0003000	1461310823621	0	14664-7	Color of Synovial fluid	Color Snv	SPEC	\N
jb439fbf2f6e19e4403016	1461310825937	0	7905-3	Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Neutralization test	HBV surface Ag SerPl Ql Nt	MICRO	\N
ea3ad60ebf97301ce03002	1461310823946	0	8214-9	Opiates [Presence] in Meconium	Opiates Mec Ql	DRUG/TOX	\N
H9e14677174f67dac03040	1461310829413	0	22296-8	Epstein Barr virus nuclear Ab [Presence] in Serum	EBV NA Ab Ser Ql	MICRO	\N
Ebadcf1188c3caa8703030	1461310827846	0	936-5	Blood product unit [Identifier]	Bld Unit Id BPU	BLDBK	\N
l8084dc1c90adf4cf03018	1461310826271	0	19126-2	Bacteria identified in Bone marrow by Aerobe culture	Bacteria Mar Aerobe Cult	MICRO	\N
td4f613c8301d3c9903004	1461310824179	0	14286-9	Carnitine free (C0) [Moles/volume] in Serum or Plasma	Carnitine Free SerPl-sCnc	CHEM	\N
xb774a15f1e852edd03070	1461310832880	0	21525-1	Sodium [Moles/volume] in 24 hour Urine	Sodium 24h Ur-sCnc	CHEM	\N
ud95dff44159670dd03056	1461310831338	0	20999-9	Cell Fractions/Differential [interpretation] in Body fluid	Cell Fract Fld-Imp	HEM/BC	\N
ub8b0cacf10ff0fe403006	1461310824438	0	27939-8	Collagen crosslinked N-telopeptide [Moles/volume] in Urine	Collagen NTx Ur-sCnc	CHEM	\N
xae7e1c9fcbd77bc303020	1461310826546	0	6158-0	Latex IgE Ab [Units/volume] in Serum	Ltx IgE Qn	ALLERGY	\N
Cd6143e665c09f97203032	1461310828105	0	5119-3	Deprecated Cryptococcus neoformans Ag [Titer] in Serum by Latex agglutination	Deprecated C neoform Ag Titr Ser LA	MICRO	\N
icbd069c35d30eae103008	1461310824721	0	16130-7	Herpes simplex virus 1 DNA [Presence] in Unspecified specimen by Probe and target amplification method	HSV1 DNA XXX Ql PCR	MICRO	\N
qd718a894403c0b4403050	1461310830672	0	20449-5	Borrelia burgdorferi Ab [Presence] in Serum by Immunoassay	B burgdor Ab Ser Ql EIA	MICRO	\N
v7a605ef384265ac303022	1461310826854	0	3282-1	Lupus anticoagulant neutralization hexagonal phase phospholipid [Time] in Platelet poor plasma by Coagulation assay	LAC Nt Hex PL Time PPP	COAG	\N
abcc469d6667d0d8a03010	1461310825021	0	32766-8	Trichomonas vaginalis [Presence] in Unspecified specimen by Wet preparation	T vaginalis XXX Ql Wet Prep	MICRO	\N
U849651097d8abf9603042	1461310829746	0	575-1	Fungus identified in Skin by Culture	Fungus Skin Cult	MICRO	\N
Fab048691d4d37cb903034	1461310828388	0	11013-0	DNA double strand Ab [Titer] in Serum	dsDNA Ab Titr Ser	SERO	\N
d917302a9b8e3ac4503012	1461310825338	0	17284-1	Mitochondria Ab [Presence] in Serum by Immunofluorescence	Mitochondria Ab Ser Ql IF	SERO	\N
n81915c69dc269d8a03024	1461310827079	0	32031-7	Phosphatidylserine IgA Ab [Units/volume] in Serum by Immunoassay	PS IgA Ser EIA-aCnc	COAG	\N
d7a3fbe9a192aa29b03062	1461310831955	0	14622-5	Ascorbate [Moles/volume] in Serum or Plasma	Vit C SerPl-sCnc	CHEM	\N
g7cb819ea95157b2303014	1461310825621	0	16268-5	Calcium phosphate crystals [Presence] in Stone by Infrared spectroscopy	Ca Phos Cry Stone Ql IR	CHEM	\N
Qc1c285bb35fda07703026	1461310827446	0	6266-1	Tomato IgE Ab [Units/volume] in Serum	Tomato IgE Qn	ALLERGY	\N
M68bbb067069ca25103044	1461310829988	0	5820-6	WBC casts [#/area] in Urine sediment by Microscopy low power field	WBC Casts #/area UrnS LPF	UA	\N
T85a28e025c4cc75f03036	1461310828638	0	31080-5	Cannabinoids [Presence] in Meconium by Screen method	Cannabinoids Mec Ql Scn	DRUG/TOX	\N
e994493f0233c8a8603052	1461310830947	0	6174-7	Milk IgE Ab [Units/volume] in Serum	Milk IgE Qn	ALLERGY	\N
iaa92a3953aed442f03058	1461310831513	0	70206-8	Codeine [Moles/volume] in Urine by Confirmatory method	Codeine Ur Cfm-sCnc	DRUG/TOX	\N
B9a8cf96070b1d25f03038	1461310828821	0	5909-7	Blood smear finding [Identifier] in Blood by Light microscopy	Bld Smear Interp	HEM/BC	\N
Kb54c72a3295c416103046	1461310830263	0	2999-1	Thiamine [Mass/volume] in Serum or Plasma	Vit B1 SerPl-mCnc	CHEM	\N
nb36f75c85d41a93f03074	1461310833389	0	20112-9	Tidal volume setting Ventilator	VT setting Vent	PULM	\N
lbb1e7aafad54339503068	1461310832713	0	70208-4	Glucose [Moles/volume] in Serum or Plasma --pre 100 g glucose PO	Glucose pre 100 g Glc PO SerPl-sCnc	CHAL	\N
tcf452a23a21ee17303054	1461310831163	0	13047-6	Plasma cells/100 leukocytes in Blood	Plasma Cells NFr Bld	HEM/BC	\N
g872852fe1f9efd9503064	1461310832188	0	40527-4	Cocaine [Presence] in Meconium	Cocaine Mec Ql	DRUG/TOX	\N
ab1678b4aa7bc4af703060	1461310831738	0	15283-5	Silver Birch IgE Ab [Units/volume] in Serum	Silver Birch IgE Qn	ALLERGY	\N
R8feb7417a02b041e03083	1461310834721	0	7983-0	Parvovirus B19 IgG Ab [Units/volume] in Serum	B19V IgG Ser-aCnc	MICRO	\N
ve6d3b7de73d2e62f03072	1461310833122	0	14906-2	Rh [Type] in Cord blood	Rh BldCo	BLDBK	\N
G93c033dbd0441d2c03087	1461310835405	0	781-5	Promyelocytes [#/volume] in Blood by Manual count	Promyelocytes # Bld Manual	HEM/BC	\N
W9c0752908164a32903079	1461310834030	0	6242-2	Sesame Seed IgE Ab [Units/volume] in Serum	Sesame Seed IgE Qn	ALLERGY	\N
A800f72718148102903077	1461310833655	0	8144-8	Amphetamines [Presence] in Meconium	Amphetamines Mec Ql	DRUG/TOX	\N
Dc796dead6fefc9ab03081	1461310834363	0	21023-7	Neutrophil cytoplasmic Ab [Titer] in Serum	ANCA Ab Titr Ser	SERO	\N
Vae54467f21562b0a03085	1461310835138	0	30361-0	HIV 2 Ab [Presence] in Serum by Immunoassay	HIV2 Ab Ser Ql EIA	MICRO	\N
Z7809e14949c68c1d03089	1461310835664	0	51892-8	ABO group [Type] in Cord blood	ABO Group BldCo	BLDBK	\N
N6d931e1ef90a9f2503091	1461310835938	0	42803-7	Bacteria identified in Isolate	Bacteria Islt	MICRO	\N
Ja8d0917fa6fbc65203093	1461310836155	0	25631-3	Parvovirus B19 IgM Ab [Titer] in Serum	B19V IgM Titr Ser	MICRO	\N
I9e86adad1195613503095	1461310836438	0	32787-4	Neutrophil cytoplasmic Ab.perinuclear [Titer] in Serum	p-ANCA Titr Ser	SERO	\N
Od298ecfa46f4381b03097	1461310836721	0	19429-0	Propoxyphene [Presence] in Urine by Screen method	Propoxyph Ur Ql Scn	DRUG/TOX	\N
Pac6c55229201ef4b03099	1461310836980	0	25415-1	Folate [Moles/volume] in Blood	Folate Bld-sCnc	CHEM	\N
hc15a55108472d75e03115	1461310839014	0	48348-7	10-Hydroxycarbazepine [Moles/volume] in Serum or Plasma	10OH-Carbazepine SerPl-sCnc	DRUG/TOX	\N
Wd4c3a95c6568986403129	1461310840747	0	38256-4	Cells Counted Total [#] in Body fluid	Total Cells Counted Fld	HEM/BC	\N
we4fe44530c9c0e4003101	1461310837221	0	70210-0	Morphine [Moles/volume] in Urine by Confirmatory method	Morphine Ur Cfm-sCnc	DRUG/TOX	\N
Pd6aa416cf2a5d84103149	1461310842830	0	30247-1	Cytomegalovirus DNA [#/volume] (viral load) in Serum or Plasma by Probe and target amplification method	CMV DNA # SerPl PCR	MICRO	\N
ka0411eb41ccfc65e03117	1461310839247	0	30173-9	Cortisol Free [Moles/volume] in Urine	Cortis F Ur-sCnc	CHEM	\N
ra5f08579f0dde55803103	1461310837497	0	32585-2	Epstein Barr virus DNA [#/volume] (viral load) in Unspecified specimen by Probe and target amplification method	EBV DNA # XXX PCR	MICRO	\N
sc4972e92dccde38803161	1461310844275	0	5946-9	Activated partial thromboplastin time (aPTT).factor substitution in Platelet poor plasma by Coagulation assay --immediately after addition of normal plasma	aPTT imm NP Time PPP	COAG	\N
D9a8dbe0e425173b903131	1461310840930	0	10587-4	Sexual abstinence duration	Sex Abstin duration Time Patient	FERT	\N
zb7ebabb10caa304903105	1461310837705	0	15410-4	Varicella zoster virus IgG Ab [Presence] in Serum by Immunoassay	VZV IgG Ser Ql EIA	MICRO	\N
yd9261d727ca96d4103119	1461310839514	0	9704-8	Spermatozoa [Morphology] in Semen	Sperm Smn	FERT	\N
Nd17e6f4e62987fa903141	1461310841989	0	6190-3	Oat IgE Ab [Units/volume] in Serum	Oat IgE Qn	ALLERGY	\N
oa9d8b757c756ab3003107	1461310837938	0	5357-9	Smith extractable nuclear Ab [Presence] in Serum by Immune diffusion (ID)	ENA SM Ab Ser Ql ID	SERO	\N
ce738e31bacf1603603121	1461310839780	0	601-5	Fungus identified in Blood by Culture	Fungus Bld Cult	MICRO	\N
pa99301cd63bc169203109	1461310838230	0	5036-9	Streptococcus pyogenes rRNA [Presence] in Unspecified specimen by DNA probe	S pyo rRNA XXX Ql Prb	MICRO	\N
R93a843c18637bafa03133	1461310841130	0	41479-7	BK virus DNA [#/volume] (viral load) in Serum or Plasma by Probe and target amplification method	BKV DNA # SerPl PCR	MICRO	\N
wd0cc89726d6ceb6b03151	1461310843072	0	30165-5	Phosphatidylcholine/Albumin [Mass ratio] in Amniotic fluid	PC/Alb Amn-mRto	CHEM	\N
sd9d3723543fbed3003111	1461310838522	0	40974-8	Streptococcus pneumoniae 57 IgG Ab [Mass/volume] in Serum	S pneum57 IgG Ser-mCnc	MICRO	\N
b6fb4b0a206f1336f03123	1461310840064	0	19803-6	Specimen site Narrative	Specimen site	ENDO.GI	\N
Jacc2601325388ea303143	1461310842272	0	6222-4	Queen Palm IgE Ab [Units/volume] in Serum	Queen Palm IgE Qn	ALLERGY	\N
fc835f9252902100603113	1461310838764	0	40915-1	Streptococcus pneumoniae 57 IgG Ab [Mass/volume] in Serum by Immunoassay	S pneum57 IgG Ser EIA-mCnc	MICRO	\N
Vb6600e228c5fe23c03135	1461310841322	0	21260-5	Epstein Barr virus nuclear Ab [Titer] in Serum by Immunofluorescence	EBV NA Ab Titr Ser IF	MICRO	\N
mdbf8a1e1f68af25c03125	1461310840314	0	14881-7	Phosphate [Moles/time] in 24 hour Urine	Phosphate 24h Ur-sRate	CHEM	\N
o739c88c8d48d9d4603157	1461310843672	0	70217-5	Thyroxine (T4) free [Moles/volume] in Serum or Plasma by Dialysis	T4 Free SerPl Dialy-sCnc	CHEM	\N
bc3e62bf00d45078e03173	1461310846197	0	7287-6	Dog Fennel IgE Ab [Units/volume] in Serum	Dog Fennel IgE Qn	ALLERGY	\N
G99b4bdc5ba30097103137	1461310841572	0	35270-8	Candida sp Ab [Presence] in Serum by Immune diffusion (ID)	Candida Ab Ser Ql ID	MICRO	\N
Adf612263bd96ad5c03127	1461310840563	0	48577-1	Deprecated HFE gene c.845G>A [Presence] in Blood or Tissue by Molecular genetics method	Deprecated HFE c.845G>A Bld/T Ql	MOLPATH.MUT	\N
I897ac3cf264c959003145	1461310842489	0	27820-0	Protein C Ag actual/normal in Platelet poor plasma by Immunologic method	Prot C Ag Act/Nor PPP Imm	COAG	\N
r981591aa554d126903153	1461310843255	0	12782-9	Protein fractions.oligoclonal bands [interpretation] in Cerebral spinal fluid by Electrophoresis	Oligoclonal Bands CSF Elph-Imp	CHEM	\N
Zbc8ee3ffe3bb547e03139	1461310841789	0	14194-5	Spermatozoa Progressive/100 spermatozoa in Semen	Sperm Prog NFr Smn	FERT	\N
f900993f87dd215b003163	1461310844589	0	6230-7	Rice IgE Ab [Units/volume] in Serum	Rice IgE Qn	ALLERGY	\N
Ob605fa68f2fba0a403147	1461310842672	0	10579-1	Leukocytes [#/volume] in Semen	WBC # Smn	FERT	\N
pafc8ed9e8813341e03159	1461310843889	0	6151-5	Italian Cypress IgE Ab [Units/volume] in Serum	Italian Cypress IgE Qn	ALLERGY	\N
z82064b941825cdf603155	1461310843439	0	25361-7	Caffeine [Moles/volume] in Serum or Plasma	Caffeine SerPl-sCnc	DRUG/TOX	\N
kd9e8e1ca08a6267d03167	1461310845414	0	40692-6	Volume of Semen--pre washing	Specimen vol Pre Wash Smn	FERT	\N
c821101a054f5749303171	1461310845939	0	19171-8	Alpha-1-Fetoprotein [Units/volume] in Amniotic fluid	AFP Amn-aCnc	CHEM	\N
h94c8c609ecabbc3a03165	1461310845107	0	10525-4	Microscopic observation [Identifier] in Unspecified specimen by Cyto stain	Cyto XXX	CYTO	\N
Dddb09f854578577003181	1461310847173	0	20473-5	Polymorphonuclear cells [Presence] in Unspecified specimen by Wright stain	Polys XXX Ql Wright Stn	HEM/BC	\N
yd824d4dc98d7219303169	1461310845681	0	11884-4	Gestational age Estimated	GA Clin est	OB.US	\N
Ab977efd0a642694003177	1461310846706	0	12227-5	Leukocytes [#/volume] corrected for nucleated erythrocytes in Blood	WBC nRBC cor # Bld	HEM/BC	\N
m6aa5ad29c502c69303175	1461310846472	0	44528-8	Histoplasma capsulatum M Ab [Presence] in Serum	H capsul M Ab Ser Ql	MICRO	\N
Rd5a188ed4b44c68a03183	1461310847430	0	35732-7	Histoplasma capsulatum H Ab [Presence] in Serum by Immune diffusion (ID)	H capsul H Ab Ser Ql ID	MICRO	\N
W8f4634f1f60cac9803179	1461310846930	0	59960-5	Propoxyphene [Moles/volume] in Urine	Propoxyph Ur-sCnc	DRUG/TOX	\N
V94df1d88ffb0dd8a03185	1461310847764	0	19261-7	Amphetamines [Presence] in Urine by Screen method	Amphetamines Ur Ql Scn	DRUG/TOX	\N
Gcb1c404ba875c03e03187	1461310848056	0	11235-9	Fentanyl [Presence] in Urine	Fentanyl Ur Ql	DRUG/TOX	\N
Zbc29b756c8b3935f03189	1461310848330	0	5221-7	HIV 1 Ab [Presence] in Serum by Immunoblot (IB)	HIV1 Ab Ser Ql IB	MICRO	\N
Nb808a091f2956e0503191	1461310848590	0	6109-3	White Elm IgE Ab [Units/volume] in Serum	White Elm IgE Qn	ALLERGY	\N
J98bf2d9ab59b150203193	1461310848890	0	10353-1	Bacteria identified in Nose by Aerobe culture	Bacteria Nose Aerobe Cult	MICRO	\N
I90f0a7a20043a02303195	1461310849147	0	7124-1	Bayberry Pollen IgE Ab [Units/volume] in Serum	Bayberry Poln IgE Qn	ALLERGY	\N
F6b076e06012fc8ce03384	1461310876733	0	1992-7	Calcitonin [Mass/volume] in Serum or Plasma	Calcit SerPl-mCnc	CHEM	\N
m9c1957624a22b4f703225	1461310853040	0	14802-3	Isopropanol [Moles/volume] in Serum or Plasma	Isopropanol SerPl-sCnc	DRUG/TOX	\N
ra82faf7d8d0db9bd03253	1461310856964	0	27823-4	Protein S Ag actual/normal in Platelet poor plasma by Immunologic method	Prot S Ag Act/Nor PPP Imm	COAG	\N
O9559bc247cd74f2303197	1461310849398	0	8251-1	Service comment	Service Cmnt XXX-Imp	MISC	\N
f842729ed2ae04f1803213	1461310851448	0	10728-4	Trichomonas sp identified in Genital specimen by Organism specific culture	Trichomonas Genital Cult	MICRO	\N
Gc4f656be9c463ab403237	1461310854623	0	7110-0	Groundsel Tree IgE Ab [Units/volume] in Serum	Groundsel Tree IgE Qn	ALLERGY	\N
P6e7211608f5a322003199	1461310849677	0	38996-5	Neutrophils [Presence] in Urine by Light microscopy	Neutrophils Ur Ql Micro	UA	\N
A89c5ca24a862400a03227	1461310853239	0	7816-2	Blastomyces dermatitidis Ab [Presence] in Serum	B dermat Ab Ser Ql	MICRO	\N
h69852cf502074e2f03215	1461310851739	0	8118-2	CD2 cells/100 cells in Blood	CD2 Cells NFr Bld	CELLMARK	\N
w869421decd9a70d803201	1461310849948	0	15197-7	Lymphocytes Fissured/100 leukocytes in Blood by Manual count	Fiss Lymphs NFr Bld Manual	HEM/BC	\N
pd37dcc607670c22303259	1461310857990	0	48038-4	Pathologist interpretation of Synovial fluid tests	Path Interp Snv-Imp	PATH	\N
Ob9498668bf47b8f903247	1461310856098	0	48051-7	Erythrocytes [Presence] in Vaginal fluid	RBC Vag Ql	HEM/BC	\N
rd42c6150e763c7c603203	1461310850165	0	14207-5	Streptococcal DNAse B [Titer] in Serum	Strep DNAse B Titr Ser	MICRO	\N
kbb06b80178e9450c03217	1461310851981	0	38496-6	Retinyl palmitate [Mass/volume] in Serum or Plasma	Retinyl Palmitate SerPl-mCnc	CHEM	\N
W87071734658c774a03229	1461310853489	0	7477-3	Mango Pollen IgE Ab [Units/volume] in Serum	Mango Poln IgE Qn	ALLERGY	\N
zce90a8d724ee2f3103205	1461310850373	0	44547-8	Human papilloma virus DNA [Presence] in Unspecified specimen by Probe and signal amplification method	HPV DNA XXX Ql bDNA	MICRO	\N
Ze049a8cdcfbaf5e103239	1461310854948	0	2464-6	IgG [Mass/volume] in Cerebral spinal fluid	IgG CSF-mCnc	CHEM	\N
yb8fcdf5514c77bdf03219	1461310852239	0	48053-3	Turbidity of Synovial fluid Qualitative	Turbidity Snv Ql	SPEC	\N
oaf40ea65c6c8d27203207	1461310850548	0	28543-7	Basophils/100 leukocytes in Body fluid	Basophils NFr Fld	HEM/BC	\N
Dbad4addd0dbac24403231	1461310853806	0	36913-2	FMR1 gene mutation analysis in Blood or Tissue by Molecular genetics method Narrative	FMR1 gene Mut Anal Bld/T	MOLPATH.MUT	\N
pd8722e29babecd8203209	1461310850790	0	6012-9	von Willebrand factor (vWf) Ag [Units/volume] in Platelet poor plasma by Immunologic method	vWF Ag PPP Imm-aCnc	COAG	\N
c85bf9e8e0c5c06e403221	1461310852473	0	33984-6	Coagulation factor X activity actual/normal in Platelet poor plasma by Chromogenic method	Fact X Act/Nor PPP Chro	COAG	\N
zbcf401c339860c9303255	1461310857315	0	560-3	Chlamydia sp identified in Unspecified specimen by Organism specific culture	Chlamydia XXX Cult	MICRO	\N
s94e4d5ef3bb4b8bd03211	1461310851148	0	7902-0	Helicobacter pylori IgG Ab [Units/volume] in Serum	H pylori IgG Ser-aCnc	MICRO	\N
Nbce02fa246bd409c03241	1461310855248	0	6195-2	Cocksfoot IgE Ab [Units/volume] in Serum	Cocksfoot IgE Qn	ALLERGY	\N
ba85ccc6600cb5e3703223	1461310852723	0	49839-4	Eosinophils [Presence] in Urine sediment by Wright stain	Eosinophil UrnS Ql Wright Stn	HEM/BC	\N
R8d8cd6020f877d0a03233	1461310854056	0	13943-6	Fructose [Presence] in Semen	Fructose Smn Ql	CHEM	\N
Pbf2f9200a1c90c2903249	1461310856406	0	19710-3	Tramadol [Presence] in Urine by Screen method	Tramadol Ur Ql Scn	DRUG/TOX	\N
Wa0b2a641f348586d03279	1461310861440	0	49572-1	Second trimester triple maternal screen [interpretation] in Serum or Plasma Narrative	2nd trimester 3 screen SerPl-Imp	CHEM	\N
haecb2215a89ec62e03265	1461310858998	0	9557-0	CD2 cells [#/volume] in Blood	CD2 Cells # Bld	CELLMARK	\N
Jb91dae441212473203243	1461310855573	0	4059-2	Tobramycin [Mass/volume] in Serum or Plasma --trough	Tobramycin Trough SerPl-mCnc	DRUG/TOX	\N
V96205445ca1bc41203235	1461310854339	0	34441-6	Spermatozoa [Velocity] in Semen	Sperm Smn Qn	FERT	\N
sa42ec814c8b1b48e03261	1461310858339	0	4551-8	Hemoglobin A2/Hemoglobin.total in Blood	Hgb A2 MFr Bld	HEM/BC	\N
w85207a3f9e7c86b503251	1461310856673	0	22297-6	Epstein Barr virus nuclear Ab [Titer] in Serum	EBV NA Ab Titr Ser	MICRO	\N
o71b55cd64777836f03257	1461310857640	0	20427-1	Acetylcholine receptor Ab [Moles/volume] in Serum	AChR Ab Ser-sCnc	SERO	\N
Idf92d1d62b6431ee03245	1461310855831	0	22752-0	Tobramycin [Moles/volume] in Serum or Plasma --trough	Tobramycin Trough SerPl-sCnc	DRUG/TOX	\N
y8441a6e49a0b6f3003269	1461310859832	0	9804-6	Weight of Stone	Wt Stone Qn	PATH	\N
m9c9e8ee06c1e573803275	1461310860765	0	27821-8	Protein S Free Ag actual/normal in Platelet poor plasma by Immunologic method	Prot S Free Ag Act/Nor PPP Imm	COAG	\N
f72dbc86a32341f7203263	1461310858657	0	47383-5	Nuclear Ab [Presence] in Serum by Immunoassay	ANA Ser Ql EIA	SERO	\N
kb89e2b3c8e9db49d03267	1461310859415	0	41476-3	Rickettsia rickettsii IgG Ab [Presence] in Serum by Immunoassay	R rickettsi IgG Ser Ql EIA	MICRO	\N
b976aa55700ff782503273	1461310860456	0	33242-9	Fungi.filamentous [Presence] in Urine by Computer assisted method	Filament Fungi Ur Ql Comp Assist	UA	\N
cb167796f86afb55e03271	1461310860156	0	20468-5	Thiamine [Moles/volume] in Serum or Plasma	Vit B1 SerPl-sCnc	CHEM	\N
Ad02a88204153920103277	1461310861115	0	3175-7	Antithrombin Ag [Units/volume] in Platelet poor plasma by Immunologic method	AT III Ag PPP Imm-aCnc	COAG	\N
Db12edc836de3672803281	1461310861790	0	23301-5	Mycoplasma sp DNA [Presence] in Unspecified specimen by Probe and target amplification method	Mycoplasma DNA XXX Ql PCR	MICRO	\N
Rb871618a66ebe60503283	1461310862032	0	5256-3	Mycoplasma pneumoniae IgM Ab [Units/volume] in Serum by Immunoassay	M pneumo IgM Ser EIA-aCnc	MICRO	\N
V86fd5aedea1f34dc03285	1461310862348	0	21760-4	FRAXE gene CGG repeats [Presence] in Blood or Tissue by Molecular genetics method	FRAXE gene CGG Rpt Bld/T Ql	MOLPATH.TRINUC	\N
Gc1eed1dfa591efb203287	1461310862574	0	16117-4	Babesia microti IgG Ab [Titer] in Serum	Bab microti IgG Titr Ser	MICRO	\N
Z98d4ef2eace4fafa03289	1461310862898	0	41475-5	Rickettsia rickettsii IgM Ab [Presence] in Serum by Immunoassay	R rickettsi IgM Ser Ql EIA	MICRO	\N
Nb77f7fa88d4a617603291	1461310863306	0	21416-3	Neisseria gonorrhoeae DNA [Presence] in Urine by Probe and target amplification method	N gonorrhoea DNA Ur Ql PCR	MICRO	\N
vc50156b4ee30c7c703422	1461310881125	0	42192-5	Nidus [Presence] in Stone	Nidus Stone Ql	PATH	\N
Ma06f09607694e87f03394	1461310877825	0	14721-5	Ethylene glycol [Moles/volume] in Serum or Plasma	Ethylene Glycol SerPl-sCnc	DRUG/TOX	\N
v7195e44bdac1f10e03322	1461310868449	0	22751-2	Tobramycin [Moles/volume] in Serum or Plasma --peak	Tobramycin Peak SerPl-sCnc	DRUG/TOX	\N
Mb04fdcd7da6dd7fb03294	1461310863557	0	24119-0	Cytomegalovirus IgM Ab [Presence] in Serum by Immunoassay	CMV IgM Ser Ql EIA	MICRO	\N
accd40544aaa39bfa03310	1461310866649	0	49580-4	HIV 1+2 Ab [Presence] in Unspecified specimen by Rapid test	HIV1+2 Ab XXX Ql Rapid	MICRO	\N
t8fd91dd37ba0884503404	1461310878957	0	6209-1	Pecan or Hickory Tree IgE Ab [Units/volume] in Serum	Pecan/Hick Tree IgE Qn	ALLERGY	\N
Kcf86cb5c4e317efc03296	1461310863790	0	21582-2	Tryptase [Mass/volume] in Serum or Plasma	Tryptase SerPl-mCnc	CHEM	\N
Tc5a86053222d03ce03386	1461310876958	0	26607-2	Cystathionine [Moles/volume] in Serum or Plasma	Cystathionin SerPl-sCnc	CHEM	\N
Ka7ce2ff8bd275beb03396	1461310878058	0	7917-8	HIV 1 Ab [Presence] in Serum	HIV1 Ab Ser Ql	MICRO	\N
d75acdf1c83c6f6f703312	1461310866957	0	6021-0	Apple IgE Ab [Units/volume] in Serum	Apple IgE Qn	ALLERGY	\N
Le32b8e4ca4c28e2603298	1461310864198	0	5255-5	Mycoplasma pneumoniae IgG Ab [Units/volume] in Serum by Immunoassay	M pneumo IgG Ser EIA-aCnc	MICRO	\N
E77a93f85cebbc0e103430	1461310881883	0	19643-6	Oxycodone [Presence] in Urine by Confirmatory method	Oxycodone Ur Ql Cfm	DRUG/TOX	\N
dc308ea433ee4c8f003412	1461310879969	0	6237-2	Salmon IgE Ab [Units/volume] in Serum	Salmon IgE Qn	ALLERGY	\N
Bd3feb602d2247b0803388	1461310877199	0	16263-6	Calcium oxalate dihydrate crystals [Presence] in Stone by Infrared spectroscopy	COD Cry Stone Ql IR	CHEM	\N
qaec639003770242e03300	1461310864873	0	13947-7	Coccidioides immitis IgG Ab [Presence] in Serum by Immunoassay	C immitis IgG Ser Ql EIA	MICRO	\N
g78892907ba08adb303314	1461310867282	0	26451-5	Eosinophils/100 leukocytes in Cerebral spinal fluid	Eosinophil NFr CSF	HEM/BC	\N
la77b2ab3b09b717703418	1461310880675	0	12308-3	Hydrocodone [Presence] in Urine	Hydrocodone Ur Ql	DRUG/TOX	\N
L81dc2d9e4c1722c603398	1461310878258	0	17122-3	CD19+Kappa+ cells/100 cells in Blood	CD19+Kappa+ Cells NFr Bld	CELLMARK	\N
e8f67f1afb79eca0c03302	1461310865419	0	14716-5	Estriol (E3) [Moles/volume] in Serum or Plasma	Estriol SerPl-sCnc	CHEM	\N
H9e7f32320bd32e0503390	1461310877508	0	47387-6	Neisseria gonorrhoeae DNA [Presence] in Genital specimen by Probe and target amplification method	N gonorrhoea DNA Genital Ql PCR	MICRO	\N
jbc0d705beb63f4b203316	1461310867582	0	5908-9	Platelets Giant [Presence] in Blood by Light microscopy	Giant Platelets Bld Ql Smear	HEM/BC	\N
uac1fbfd17b44038703406	1461310879133	0	4633-4	Hemoglobin F/Hemoglobin.total in Blood by Kleihauer-Betke method	Hgb F MFr Bld Kleih Betke	HEM/BC	\N
te30828dcc22d6bc903304	1461310865874	0	24125-7	Androgen free Index in Serum or Plasma	Androgen FAI SerPl-sRto	CHEM	\N
Ua8d1fe75f96ef52603392	1461310877674	0	698-1	Neisseria gonorrhoeae [Presence] in Unspecified specimen by Organism specific culture	N gonorrhoea XXX Ql Cult	MICRO	\N
ua2b899b8b31d71ef03306	1461310866090	0	13948-5	Coccidioides immitis IgM Ab [Presence] in Serum by Immunoassay	C immitis IgM Ser Ql EIA	MICRO	\N
ld546f679c0f7235203318	1461310867882	0	16118-2	Babesia microti IgM Ab [Titer] in Serum	Bab microti IgM Titr Ser	MICRO	\N
qc685543fcfe489e503400	1461310878550	0	32786-6	Thyroperoxidase Ab [Titer] in Serum or Plasma	Thyroperoxidase Ab Titr SerPl	SERO	\N
id8c1129b57b50d6103308	1461310866382	0	25474-8	Metanephrines [Moles/volume] in Serum or Plasma	MetanephS SerPl-sCnc	CHEM	\N
B7e6d870db761a0ba03438	1461310883016	0	19074-4	Carnitine esters [Moles/volume] in Serum or Plasma	Carn esters SerPl-sCnc	CHEM	\N
g8b9c9fe9ef773f8003414	1461310880291	0	48049-1	Eosinophils [Presence] in Stool by Wright stain	Eosinophil Stl Ql Wright Stn	HEM/BC	\N
ib9b770d07f7aa6c903408	1461310879349	0	4821-5	HLA-B27 [Presence]	HLA-B27 Ql	HLA	\N
xda9b29812fbe327003320	1461310868177	0	4057-6	Tobramycin [Mass/volume] in Serum or Plasma --peak	Tobramycin Peak SerPl-mCnc	DRUG/TOX	\N
eb2470c506bc1d4dd03402	1461310878758	0	25521-6	Selenium [Moles/volume] in Serum or Plasma	Selenium SerPl-sCnc	DRUG/TOX	\N
na3805f02e91a8ae403424	1461310881325	0	70215-9	Oxycodone [Moles/volume] in Urine by Confirmatory method	Oxycodone Ur Cfm-sCnc	DRUG/TOX	\N
x6d82917a1a7828da03420	1461310880950	0	9834-3	Hydromorphone [Presence] in Urine	Hydromorphone Ur Ql	DRUG/TOX	\N
a828b977f3897ae0603410	1461310879558	0	22203-4	Clostridium tetani IgG Ab [Units/volume] in Serum	C tetani IgG Ser-aCnc	MICRO	\N
j8a5167f6e5788e1e03416	1461310880458	0	5202-7	Herpes simplex virus Ab [Units/volume] in Serum by Immunoassay	HSV Ab Ser EIA-aCnc	MICRO	\N
Y9fd7a2037b28ed9003428	1461310881708	0	6035-0	Banana IgE Ab [Units/volume] in Serum	Banana IgE Qn	ALLERGY	\N
Taab73ca83f2e7a0603436	1461310882700	0	17395-5	Oxymorphone [Mass/volume] in Urine by Confirmatory method	Oxymorphone Ur Cfm-mCnc	DRUG/TOX	\N
Qe448980414e8464e03426	1461310881533	0	30437-8	Monocytes+Macrophages/100 leukocytes in Body fluid	Monos+Macros NFr Fld	HEM/BC	\N
C71268d6943b1efeb03432	1461310882091	0	18325-1	Oxymorphone [Presence] in Urine by Confirmatory method	Oxymorphone Ur Ql Cfm	DRUG/TOX	\N
Fa3ac035381d0575503434	1461310882366	0	47226-6	Fetal lung maturity [interpretation] in Amniotic fluid	FLM Amn-Imp	CHEM	\N
U8ef3e2f7ff8a0eba03442	1461310883525	0	17123-1	CD19+Lambda+ cells/100 cells in Blood	CD19+Lambda+ Cells NFr Bld	CELLMARK	\N
H89cc3c9be57c43cf03440	1461310883225	0	12598-9	Fat.neutral [Presence] in Stool	Neutral Fat Stl Ql	CHEM	\N
Ma71f138f6c1a4d9003444	1461310883800	0	36922-3	TPMT gene mutation analysis in Blood or Tissue by Molecular genetics method Narrative	TPMT gene Mut Anal Bld/T	MOLPATH.MUT	\N
K6cf62ca3fd95107503446	1461310884067	0	6194-5	Orange IgE Ab [Units/volume] in Serum	Orange IgE Qn	ALLERGY	\N
La510c886ff2817b503448	1461310884392	0	5170-6	Gliadin IgG Ab [Units/volume] in Serum	Gliadin IgG Ser-aCnc	SERO	\N
q8195fe9930ee9e6203450	1461310884691	0	26536-3	Cortisol [Moles/volume] in Serum or Plasma --1 hour post dose corticotropin	Cortis 1h p ACTH SerPl-sCnc	CHAL	\N
za4ff062d48792f2a03555	1461310898801	0	7558-0	Oyster IgE Ab [Units/volume] in Serum	Oyster IgE Qn	ALLERGY	\N
t898b00ef24eeb78a03454	1461310885316	0	12210-1	Eosinophils/100 leukocytes in Urine sediment by Manual count	Eosinophil NFr UrnS Manual	UA	\N
t707582de9aef09e103504	1461310892042	0	33917-6	Nornicotine [Mass/volume] in Urine	Nornicotine Ur-mCnc	DRUG/TOX	\N
F756b2541a88e396003484	1461310889084	0	59841-7	Vendor name [Identifier] in Unspecified specimen	Vendor name XXX	CHEM	\N
u9e9b9e42a8bb769b03456	1461310885525	0	23925-1	Penicillin [Susceptibility] by Gradient strip (E-test)	Penicillin Islt E-test	ABXBACT	\N
vb87037a1d6944fd603472	1461310887300	0	59412-7	Oxygen saturation in Arterial blood by Pulse oximetry --post exercise	SaO2 p Exc % BldA PulseOx	PULM	\N
b6802eda38ad75e0f03523	1461310893859	0	5877-6	Respiratory syncytial virus Ag [Presence] in Unspecified specimen by Immunofluorescence	RSV Ag XXX Ql IF	MICRO	\N
K9a27056d500011c303496	1461310890934	0	25835-0	HIV 1 RNA [Presence] in Serum or Plasma by Probe and target amplification method	HIV1 RNA SerPl Ql PCR	MICRO	\N
i99407077a1562dd503458	1461310885742	0	29901-6	HTLV 1+2 Ab [Presence] in Serum by Immunoassay	HTLV1+2 Ab Ser Ql EIA	MICRO	\N
Tb18631ae72b047f903486	1461310889367	0	19768-1	Reviewing cytologist of results	Reviewing cytologist	CYTO	\N
na16658933dbd12ed03474	1461310887608	0	6448-5	Legionella pneumophila Ag [Presence] in Urine by Radioimmunoassay (RIA)	L pneumo Ag Ur Ql RIA	MICRO	\N
aaaad1b048cd3054003460	1461310885908	0	22110-1	Bartonella henselae IgG Ab [Titer] in Serum	B henselae IgG Titr Ser	MICRO	\N
dcf9440ec7c9daa6e03512	1461310892817	0	6220-8	Potato IgE Ab [Units/volume] in Serum	Potato IgE Qn	ALLERGY	\N
d8364a73e7d8a4c5103462	1461310886192	0	14251-3	Mitochondria M2 IgG Ab [Units/volume] in Serum	Mitochondria M2 IgG Ser-aCnc	SERO	\N
Qc358b43cc0fdb1f403476	1461310887875	0	6137-4	Hazelnut Pollen IgE Ab [Units/volume] in Serum	Hazelnut Poln IgE Qn	ALLERGY	\N
u867839b8ee9bfcd203506	1461310892267	0	15013-6	Alkaline phosphatase.bone/Alkaline phosphatase.total in Serum or Plasma	ALP Bone CFr SerPl	CHEM	\N
B886cdd1a69f4f2e403488	1461310889775	0	5381-9	Thyroglobulin Ab [Titer] in Serum by Latex agglutination	Thyroglob Ab Titr Ser LA	SERO	\N
gc58d3d89276e6f8203464	1461310886392	0	26535-5	Cortisol [Moles/volume] in Serum or Plasma --30 minutes post dose corticotropin	Cortis 30M p ACTH SerPl-sCnc	CHAL	\N
Laea3b095dffc691603498	1461310891167	0	35051-2	Leukocytes other [#/volume] in Body fluid	WBC Other # Fld	HEM/BC	\N
Yc5e30fa125e5e8ac03478	1461310888167	0	5644-0	Ethanol [Presence] in Urine	Ethanol Ur Ql	DRUG/TOX	\N
ja26aa46cb649b2b403466	1461310886608	0	19593-3	6-Monoacetylmorphine (6-MAM) [Mass/volume] in Urine by Confirmatory method	6MAM Ur Cfm-mCnc	DRUG/TOX	\N
y6d5a4abd815cd3cd03519	1461310893467	0	44533-8	HIV 1+2 Ab [Presence] in Serum from donor	HIV1+2 Ab Ser Donr Ql	MICRO	\N
Ha742d3b69ba9e18903490	1461310890110	0	808-6	Leukocytes [#/volume] in Pleural fluid by Manual count	WBC # Plr Manual	HEM/BC	\N
l86108a4e85fff99b03468	1461310886850	0	70197-9	6-Monoacetylmorphine (6-MAM) [Moles/volume] in Urine by Confirmatory method	6MAM Ur Cfm-sCnc	DRUG/TOX	\N
E8daa3050ae1b63ca03480	1461310888425	0	3093-2	Urea nitrogen [Mass/volume] in Body fluid	Urea nit Fld-mCnc	CHEM	\N
xa57d9484659eb8f303470	1461310887067	0	59417-6	Oxygen saturation in Arterial blood by Pulse oximetry --resting	SaO2 Resting % BldA PulseOx	PULM	\N
qe2fce84c23ed47ed03500	1461310891467	0	7893-1	Gliadin Ab [Units/volume] in Serum	Gliadin Ab Ser-aCnc	SERO	\N
Cb7f09d289b567ac703482	1461310888717	0	1007-4	Direct antiglobulin test.poly specific reagent [Presence] on Red Blood Cells	DAT Poly-Sp Reag RBC Ql	BLDBK	\N
Ucf21fbcb3c31cfff03492	1461310890442	0	25726-1	Oxcarbazepine [Moles/volume] in Serum or Plasma	Oxcarbazepine SerPl-sCnc	DRUG/TOX	\N
Acdcc86019b59c85903527	1461310894326	0	9632-1	Aspergillus fumigatus Ab [Presence] in Serum	A fumigatus Ab Ser Ql	MICRO	\N
i8f522d616b4573ea03508	1461310892451	0	24378-2	Platelet aggregation epinephrine induced [Presence] in Platelet rich plasma	PA Epineph PRP Ql	COAG	\N
gb7d4c70fe3a0558703514	1461310893000	0	6873-4	Beta hydroxybutyrate [Moles/volume] in Serum or Plasma	B-OH-Butyr SerPl-sCnc	CHEM	\N
edf22e909f5e58eb903502	1461310891750	0	15015-1	Alkaline phosphatase.liver/Alkaline phosphatase.total in Serum or Plasma	ALP Liver CFr SerPl	CHEM	\N
Md48ce5db8a5942be03494	1461310890692	0	14862-7	Oxalate [Moles/time] in 24 hour Urine	Oxalate 24h Ur-sRate	CHEM	\N
N93a56e3289d42d7a03541	1461310897310	0	19088-4	Collection of urine specimen start date	Collect Start Date Ur	SPEC	\N
R924f384d1378c68803533	1461310894967	0	47364-5	Hepatitis B virus surface Ag [Presence] in Serum from donor by Immunoassay	HBV surface Ag Ser Donr Ql EIA	MICRO	\N
aa6caca1ae5facefc03510	1461310892659	0	6062-4	Casein IgE Ab [Units/volume] in Serum	Casein IgE Qn	ALLERGY	\N
c9531dbb8111a3b0f03521	1461310893709	0	44538-7	HTLV 1+2 Ab [Presence] in Serum from donor	HTLV1+2 Ab Ser Donr Ql	MICRO	\N
mca3fec7854bc958b03525	1461310894159	0	49846-9	Hepatitis C virus Ag [Presence] in Blood or Marrow from donor	HCV Ag Bld/Mar Donr Ql	MICRO	\N
jd6ff9fa4d7665cd403516	1461310893184	0	47440-3	Hepatitis B virus core Ab [Presence] in Serum from donor	HBV core Ab Ser Donr Ql	MICRO	\N
Daf34b7ac9e156b4703531	1461310894701	0	71791-8	Metanephrines [Moles/volume] in 24 hour Urine	MetanephS 24h Ur-sCnc	CHEM	\N
W7b45a53826046c0503529	1461310894509	0	2032-1	Carboxyhemoglobin/Hemoglobin.total in Venous blood	COHgb MFr BldV	CHEM	\N
V9703854ea644617103535	1461310895726	0	13942-8	Spermatozoa Motile [Presence] in Semen by Light microscopy	Sperm Motile Smn Ql Micro	FERT	\N
Zcc215933c446cf7403539	1461310896984	0	10622-9	Spermatozoa Normal/100 spermatozoa in Semen	Sperm Norm NFr Smn	FERT	\N
G8db3fb3e6c1d422b03537	1461310896476	0	22463-4	Reagin Ab [Presence] in Serum from donor	Reagin Ab Ser Donr Ql	MICRO	\N
Jd4ff0c3ca3f6582303543	1461310897518	0	47441-1	Hepatitis C virus Ab [Presence] in Serum from donor	HCV Ab Ser Donr Ql	MICRO	\N
Ia7904520ae5d5f8a03545	1461310897709	0	19089-2	Collection of urine specimen start time	Collect Start Tme Ur	SPEC	\N
Oc50feebe94e9facf03547	1461310897934	0	15174-6	Cryocrit of Serum by Spun Westergren	Cryocrit Ser Spun Westergren	CHEM	\N
P99cf6ee31f0c85b903549	1461310898126	0	5000-5	Cytomegalovirus DNA [Presence] in Unspecified specimen by Probe and target amplification method	CMV DNA XXX Ql PCR	MICRO	\N
w7cd5cfe0a0c0ecf003551	1461310898350	0	19086-8	Collection of urine specimen end date	Collect End Date Ur	SPEC	\N
bd5926681b07cf7e603573	1461310900709	0	70205-0	Clonazepam [Moles/volume] in Serum or Plasma by Screen method	Clonazepam SerPl Scn-sCnc	DRUG/TOX	\N
o75cdccd045cd7a9403557	1461310899009	0	29280-5	Fibrin D-dimer [Presence] in Platelet poor plasma by Latex agglutination	D Dimer PPP Ql LA	COAG	\N
sb02718cadb72baba03611	1461310905254	0	15388-2	Mycoplasma hominis [Presence] in Unspecified specimen by Organism specific culture	M hominis XXX Ql Cult	MICRO	\N
zaa3d63794515c95103605	1461310904493	0	19287-2	Cannabinoids tested for in Urine by Screen method Nominal	Cannabinoids Tested Ur Scn	DRUG/TOX	\N
Od8ebda5ff5fb01bf03597	1461310903384	0	40464-0	Drugs identified in Urine by Confirmatory method	Drugs Ur Cfm	DRUG/TOX	\N
pcd1677788b2d15cf03559	1461310899267	0	43399-5	JAK2 gene p.V617F [Presence] in Blood or Tissue by Molecular genetics method	JAK2 p.V617F Bld/T Ql	MOLPATH.MUT	\N
G7cf02cf0bea5ea0203587	1461310902218	0	41480-5	BK virus DNA [#/volume] (viral load) in Urine by Probe and target amplification method	BKV DNA # Ur PCR	MICRO	\N
mb22dc9c98baf9f3303575	1461310900960	0	25964-8	Normetanephrine [Moles/volume] in 24 hour Urine	Normetanephrine 24h Ur-sCnc	CHEM	\N
s68b14e853a90888703561	1461310899484	0	13462-7	Apolipoprotein A-I/Apolipoprotein B [Mass ratio] in Serum or Plasma	Apo A-I/Apo B SerPl-mRto	CHEM	\N
Ab315e767d9540e2803577	1461310901226	0	13327-2	Parainfluenza virus Ag [Presence] in Unspecified specimen by Immunofluorescence	HPIV Ag XXX Ql IF	MICRO	\N
fb645a041dce4abb903563	1461310899692	0	49295-9	Protein Fractions [interpretation] in Cerebral spinal fluid by Electrophoresis Narrative	Prot Pattern CSF Elph-Imp	CHEM	\N
c721e22f30e69f14503621	1461310906586	0	9609-9	Hepatitis C virus 22-3 Ab [Presence] in Serum by Immunoblot (IB)	HCV22-3 Ab Ser Ql IB	MICRO	\N
Z9327b950135dc51203589	1461310902468	0	38390-1	Deprecated Cryptococcus neoformans Ag [Presence] in Cerebral spinal fluid	Deprecated C neoform Ag CSF Ql	MICRO	\N
h8bd5cd32c78feb2803565	1461310899926	0	43441-5	Bacteria identified in Bronchoalveolar lavage by Aerobe culture	Bacteria BAL Aerobe Cult	MICRO	\N
k832a5694d69d2b4403617	1461310906127	0	15917-8	Peanut IgE Ab RAST class in Serum	Peanut IgE RAST Ql	ALLERGY	\N
Wb235966aae5a713803579	1461310901451	0	26517-3	Polymorphonuclear cells/100 leukocytes in Cerebral spinal fluid	Polys NFr CSF	HEM/BC	\N
P819923c8c137648f03599	1461310903651	0	13227-4	Corynebacterium diphtheriae IgG Ab [Units/volume] in Serum	C diphtheriae IgG Ser-aCnc	MICRO	\N
k72a89c61a23c4e0003567	1461310900126	0	21482-5	Protein [Mass/volume] in 24 hour Urine	Prot 24h Ur-mCnc	CHEM	\N
N9fff251f3fadec1203591	1461310902751	0	31843-6	Helicobacter pylori Ag [Presence] in Stool	H pylori Ag Stl Ql	MICRO	\N
D98e5419fd8e9b41b03581	1461310901618	0	3193-0	Coagulation factor V activity actual/normal in Platelet poor plasma by Coagulation assay	Fact V Act/Nor PPP	COAG	\N
ya7f0d75792ab913203569	1461310900326	0	2597-3	Magnesium [Moles/volume] in Red Blood Cells	Magnesium RBC-sCnc	CHEM	\N
od603cbe509bae08303607	1461310904718	0	17852-5	Ureaplasma urealyticum [Presence] in Unspecified specimen by Organism specific culture	U urealyticum XXX Ql Cult	MICRO	\N
ca1b42ed9d8e1ac7403571	1461310900526	0	2669-0	Normetanephrine [Mass/volume] in Serum or Plasma	Normetanephrine SerPl-mCnc	CHEM	\N
Rd5e27d0a06d8bfac03583	1461310901793	0	71797-5	Protoporphyrin.zinc [Moles/volume] in Red Blood Cells	ZPP RBC-sCnc	CHEM	\N
wd6160df5d2ceb3c703601	1461310903918	0	58787-3	Corynebacterium diphtheriae IgG Ab [Units/volume] in Serum by Immunoassay	C diphtheriae IgG Ser EIA-aCnc	MICRO	\N
J838e55f2d670a30b03593	1461310902935	0	888-8	Blood group antibodies identified in Serum or Plasma	Blood group antibodies SerPl	BLDBK	\N
f7b62c58a00dcfd3603613	1461310905602	0	31036-7	Gatifloxacin [Susceptibility] by Minimum inhibitory concentration (MIC)	Gatifloxacin Islt MIC	ABXBACT	\N
V848de055d523dec903585	1461310901985	0	6367-7	Clostridium tetani IgG Ab [Units/volume] in Serum by Immunoassay	C tetani IgG Ser EIA-aCnc	MICRO	\N
Zc407a3b3c23f58fa03639	1461310908653	0	12229-1	Macrophages/100 leukocytes in Cerebral spinal fluid by Manual count	Macrophages NFr CSF Manual	HEM/BC	\N
pc76e005e222aeb7203609	1461310904960	0	6078-0	Cockroach IgE Ab [Units/volume] in Serum	Roach IgE Qn	ALLERGY	\N
Iade6bb20fc60225503595	1461310903160	0	25987-9	Testosterone Free [Moles/volume] in Serum or Plasma by Radioimmunoassay (RIA)	Testost Free SerPl RIA-sCnc	CHEM	\N
rb9197aed300696bc03603	1461310904302	0	32284-2	BK virus DNA [Units/volume] (viral load) in Serum or Plasma by Probe and target amplification method	BKV DNA SerPl PCR-aCnc	MICRO	\N
me4ab6cbcbad2cf2c03625	1461310907036	0	43993-5	Age at delivery	Age at delivery	OB.US	\N
y7c6db2ccbabb9dfc03619	1461310906369	0	9610-7	Hepatitis C virus c33c Ab [Presence] in Serum by Immunoblot (IB)	HCV C33c Ab Ser Ql IB	MICRO	\N
he2b162f7bdeadffc03615	1461310905844	0	23871-7	Hepatitis C virus NS5 Ab [Presence] in Serum by Immunoblot (IB)	HCV NS5 Ab Ser Ql IB	MICRO	\N
G7dcfd6169306e23203637	1461310908444	0	19098-3	Erythrocytes [Presence] in Amniotic fluid	RBC Amn Ql	HEM/BC	\N
bdb94202a7c2f606403623	1461310906852	0	3187-2	Coagulation factor IX activity actual/normal in Platelet poor plasma by Coagulation assay	Fact IX Act/Nor PPP	COAG	\N
Dabff2c984f05e0d103631	1461310907735	0	6998-9	Ceftriaxone [Susceptibility] by Gradient strip (E-test)	Ceftriaxone Islt E-test	ABXBACT	\N
W976e50ed839f89d103629	1461310907527	0	3096-5	Urea nitrogen [Mass/time] in 24 hour Urine	UUN 24h Ur-mRate	CHEM	\N
Abdabd95eea1a1aa603627	1461310907261	0	23860-0	Erythrocytes [#/volume] in Body fluid by Automated count	RBC # Fld Auto	HEM/BC	\N
R9b1ed040eb8533b103633	1461310907952	0	25630-5	Parvovirus B19 IgG Ab [Titer] in Serum	B19V IgG Titr Ser	MICRO	\N
V8d218eb5a89ccf2103635	1461310908202	0	15076-3	Glucose [Moles/volume] in Urine	Glucose Ur-sCnc	CHEM	\N
Ne2004112138e746d03641	1461310908861	0	20446-1	Herpes simplex virus IgG Ab [interpretation] in Serum by Immunoassay	HSV IgG Ser EIA-Imp	MICRO	\N
Je531471eba16eba703643	1461310909186	0	6059-0	Candida albicans IgE Ab [Units/volume] in Serum	C albicans IgE Qn	ALLERGY	\N
I9bfdeb1216f5561203645	1461310909411	0	13337-1	CD8+HLA-DR+ cells/100 cells in Blood	CD8+HLA-DR+ Cells NFr Bld	CELLMARK	\N
Oaa6592d792ee894503647	1461310909636	0	21112-8	Birth date	Birth Date	MISC	\N
P8e1ab10246f0f05c03649	1461310909828	0	25435-9	Herpes simplex virus IgM Ab [Presence] in Serum	HSV IgM Ser Ql	MICRO	\N
w6d80e8c56b916f9e03651	1461310910027	0	49835-2	CD19+IgD+ cells/100 cells in Unspecified specimen	CD19+IgD+ cells NFr XXX	CELLMARK	\N
Ddaa52058dfaaaafa03681	1461310913245	0	70240-7	Testosterone Free [Moles/volume] in Serum or Plasma by Detection limit <= 3.47 pmol/L	Testost Free SerPl DL<= 3.47 pmol/L-sCnc	CHEM	\N
r9c337ab3bae93ae303653	1461310910236	0	32632-2	HEXA gene mutations found [Identifier] in Blood or Tissue by Molecular genetics method Nominal	HEXA gene Mut Anal Bld/T	MOLPATH.MUT	\N
y78252f4c97f734e503669	1461310911918	0	40658-7	Parvovirus B19 IgM Ab [Presence] in Serum by Immunoassay	B19V IgM Ser Ql EIA	MICRO	\N
w80cae01102af4b0c03701	1461310915338	0	6138-2	Helminthosporium halodes IgE Ab [Units/volume] in Serum	H halodes IgE Qn	ALLERGY	\N
Jc9a63e2e93d76a5c03693	1461310914503	0	70213-4	Nordiazepam [Moles/volume] in Urine by Confirmatory method	Nordiazepam Ur Cfm-sCnc	DRUG/TOX	\N
z92d4f9320664ae0a03655	1461310910453	0	70239-9	Testosterone [Moles/volume] in Serum or Plasma by Detection limit <= 3.47 pmol/L	Testost SerPl DL<= 3.47 pmol/L-sCnc	CHEM	\N
Rdba51fb16380326e03683	1461310913478	0	10386-1	Albumin given [Volume]	Albumin Gvn Vol	BLDBK	\N
cbfb1e263dc367f6603671	1461310912336	0	32147-1	Reducing substances [Mass/volume] in Urine	Reducing Subs Ur-mCnc	UA	\N
oaf09438f7cd6457d03657	1461310910653	0	5096-3	Coccidioides immitis Ab [Titer] in Serum by Complement fixation	C immitis Ab Titr Ser CF	MICRO	\N
A89c4f9e070b474ab03727	1461310918120	0	21821-4	"t(9;22)(q34.1;q11)(ABL1	BCR) fusion transcript [Presence] in Blood or Tissue by Molecular genetics method"	"t(9;22)(ABL1	\N
p6b9acbf93669d46703659	1461310910836	0	7774-3	Cow whey IgE Ab [Units/volume] in Serum	Cow Whey IgE Qn	ALLERGY	\N
m6e8f971c1f39c58603725	1461310917828	0	33630-5	HIV protease gene mutations detected [Identifier]	HIV PI gene Mut Det Islt	ABXBACT	\N
b8c665a998bf829e903673	1461310912536	0	22111-9	Bartonella henselae IgM Ab [Titer] in Serum	B henselae IgM Titr Ser	MICRO	\N
Vd89c31b8cf45ad7603685	1461310913770	0	13589-7	Activated protein C resistance [Presence] in Blood by Probe and target amplification method	aPCR Bld Ql PCR	COAG	\N
sdfec21fec9cffbfb03661	1461310911003	0	5052-6	Aspergillus sp Ab [Presence] in Serum by Immune diffusion (ID)	Aspergillus Ab Ser Ql ID	MICRO	\N
p75dee00fc5c9b45f03709	1461310916079	0	10580-9	Liquefaction [Time] in Semen	Liquefaction Time Smn	FERT	\N
Id28e06be34d449d003695	1461310914719	0	23876-6	HIV 1 RNA [Units/volume] (viral load) in Plasma by Probe and signal amplification method	HIV1 RNA Plas bDNA-aCnc	MICRO	\N
m9812f2350c77fd2d03675	1461310912695	0	22362-8	HTLV 1+2 Ab [Presence] in Serum	HTLV1+2 Ab Ser Ql	MICRO	\N
fb8f6c7dadad43b1503663	1461310911169	0	29675-6	Parvovirus B19 IgG Ab [Presence] in Serum	B19V IgG Ser Ql	MICRO	\N
Gdab3417da651486703687	1461310913953	0	70214-2	Oxazepam [Moles/volume] in Urine by Confirmatory method	Oxazepam Ur Cfm-sCnc	DRUG/TOX	\N
h85384f0cad8886b603665	1461310911328	0	29660-8	Parvovirus B19 IgG Ab [Presence] in Serum by Immunoassay	B19V IgG Ser Ql EIA	MICRO	\N
Ad21ea3a98c65b86f03677	1461310912894	0	15093-8	Protoporphyrin Free [Moles/volume] in Blood	FEP Bld-sCnc	CHEM	\N
rd06d189a00d6e29603703	1461310915528	0	14703-3	Dopamine [Moles/volume] in Serum or Plasma	Dopamine SerPl-sCnc	CHEM	\N
k980ebb0702e39ddd03667	1461310911578	0	7981-4	Parvovirus B19 IgM Ab [Presence] in Serum	B19V IgM Ser Ql	MICRO	\N
Ob1c1bb45fca800b303697	1461310914928	0	42621-3	Mycoplasma hominis DNA [Presence] in Blood by Probe and target amplification method	M hominis DNA Bld Ql PCR	MICRO	\N
Wd5141dd41544300803679	1461310913103	0	3198-9	Coagulation factor VII activity actual/normal in Platelet poor plasma by Coagulation assay	Fact VII Act/Nor PPP	COAG	\N
Z93da8bf58324bfa803689	1461310914128	0	8087-9	Parietal cell Ab [Units/volume] in Serum	PCA Ab Ser-aCnc	SERO	\N
h97c7a8c6972e2d2a03715	1461310916920	0	13941-0	Lymphocytes/100 leukocytes in Body fluid by Manual count	Lymphocytes NFr Fld Manual	HEM/BC	\N
yce1289f2273ffba303719	1461310917361	0	41487-0	Cryptosporidium parvum Ag [Presence] in Stool by Immunoassay	C parvum Ag Stl Ql EIA	MICRO	\N
ze06bfddeba5f41db03705	1461310915736	0	6037-6	Barley IgE Ab [Units/volume] in Serum	Barley IgE Qn	ALLERGY	\N
Na02b63e31354c70503691	1461310914344	0	8220-6	Opiates [Mass/volume] in Urine	Opiates Ur-mCnc	DRUG/TOX	\N
Pd79550cde1e9702a03699	1461310915153	0	4477-6	Complement C1 esterase inhibitor [Mass/volume] in Serum or Plasma	C1INH SerPl-mCnc	HEM/BC	\N
safc414c1979a1f5903711	1461310916503	0	6460-0	Bacteria identified in Sputum by Culture	Bacteria Spt Cult	MICRO	\N
baa4772125602bdcb03723	1461310917678	0	29539-4	HIV 1 RNA [Log #/volume] (viral load) in Plasma by Probe and signal amplification method	HIV1 RNA Plas bDNA-Log#	MICRO	\N
ob3fceb18b55328c303707	1461310915911	0	7632-3	Privet IgE Ab [Units/volume] in Serum	Privet IgE Qn	ALLERGY	\N
kb03eb8c2352b3c7703717	1461310917070	0	47252-2	Hepatitis C virus RNA [Log #/volume] (viral load) in Serum or Plasma by Probe and target amplification method	HCV RNA SerPl PCR-Log#	MICRO	\N
faf41d5c2edda69d203713	1461310916737	0	20416-4	Hepatitis C virus RNA [#/volume] (viral load) in Serum or Plasma by Probe and target amplification method	HCV RNA # SerPl PCR	MICRO	\N
Wd14c45ffce18cbc103729	1461310918395	0	33893-9	Karyotype [Identifier] in Bone marrow Nominal	Karyotyp Mar	MOLPATH	\N
cd683f68406f2c6b903721	1461310917528	0	14116-8	IgG synthesis rate [Mass/time] in Serum and CSF by calculation	IgG Synth Rate Ser+CSF Calc-mRate	CHEM	\N
Vc595d79e5caebca003735	1461310919178	0	5234-0	Jo-1 extractable nuclear Ab [Presence] in Serum by Immunoassay	ENA Jo1 Ab Ser Ql EIA	SERO	\N
Rc30059a93635696603733	1461310918870	0	15114-2	Arsenic [Moles/volume] in Blood	Arsenic Bld-sCnc	DRUG/TOX	\N
Dd0dba15ccb6fda6603731	1461310918670	0	20398-4	Nuclear Ab Pattern Homogenous [Titer] in Serum	ANA Homogen Titr Ser	SERO	\N
G8c0edbcd221a436f03737	1461310919437	0	16074-7	Walnut IgE Ab RAST class in Serum	Walnut IgE RAST Ql	ALLERGY	\N
Zcc9202ddbbfbb66f03739	1461310919704	0	70212-6	Nordiazepam [Moles/volume] in Serum or Plasma by Screen method	Nordiazepam SerPl Scn-sCnc	DRUG/TOX	\N
Ne40a915f1a99c56103741	1461310919962	0	15014-4	Alkaline phosphatase.intestinal/Alkaline phosphatase.total in Serum or Plasma	ALP Intest CFr SerPl	CHEM	\N
Jb06e888b2e101c6f03743	1461310920145	0	20431-3	Microscopic observation [Identifier] in Unspecified specimen by Smear	Smear XXX	MICRO	\N
I679b022750d917a603745	1461310920486	0	49588-7	First trimester maternal screen with nuchal translucency [interpretation] Narrative	1st trimester scn+NT Patient-Imp	CHEM	\N
Y8c069bd9ee157dff03778	1461310923979	0	20469-3	Acetone [Presence] in Serum or Plasma by Screen method	Acetone SerPl Ql Scn	DRUG/TOX	\N
f9479fd79275c071703763	1461310922671	0	15058-1	Dopamine [Moles/volume] in Urine	Dopamine Ur-sCnc	CHEM	\N
Obc47d4e75c83166503747	1461310920678	0	611-4	Bacteria identified in Body fluid by Culture	Bacteria Fld Cult	MICRO	\N
ub758e540b5f27dd803806	1461310926996	0	2030-5	Carboxyhemoglobin/Hemoglobin.total in Arterial blood	COHgb MFr BldA	CHEM	\N
d945f6fb56ebcc3ba03812	1461310927521	0	24312-1	Treponema pallidum Ab [Presence] in Serum by Agglutination	T pallidum Ab Ser Ql Aggl	MICRO	\N
Ha63e09e5bc412cef03790	1461310925255	0	2749-0	pH of Gastric fluid	pH Gast	CHEM	\N
P71b380f6075b75a603749	1461310920937	0	70211-8	Mycophenolate [Moles/volume] in Serum or Plasma	Mycophenolate SerPl-sCnc	DRUG/TOX	\N
hb1b70cd746898a2f03765	1461310922829	0	24521-7	Epinephrine [Moles/volume] in Urine	Epineph Ur-sCnc	CHEM	\N
E86cea965c54048da03780	1461310924187	0	50970-3	XXX blood group Ab [Titer] in Serum or Plasma by Antihuman globulin	XXX blood group Ab Titr SerPl AHG	BLDBK	\N
w91c863be55444ca703751	1461310921137	0	31112-6	Reticulocytes/100 erythrocytes in Blood by Manual	Retics/100 RBC NFr Manual	HEM/BC	\N
kba7ab0699dac514803767	1461310923004	0	14853-6	Norepinephrine [Moles/volume] in Urine	Norepineph Ur-sCnc	CHEM	\N
rd09c344813ef5c1903753	1461310921371	0	25418-5	Mumps virus IgG Ab [Units/volume] in Serum by Immunoassay	MuV IgG Ser EIA-aCnc	MICRO	\N
q6d4037a67a27a03a03800	1461310926513	0	49700-8	Metanephrine Free [Moles/volume] in Serum or Plasma	Metaneph Free SerPl-sCnc	CHEM	\N
C83b00677521e4c1103782	1461310924379	0	22315-6	Hepatitis A virus IgM Ab [Units/volume] in Serum	HAV IgM Ser-aCnc	MICRO	\N
zc34ac7ac766aeaf103755	1461310921596	0	65757-7	Kidney Pathology biopsy report	Kidney Path Bx report	PATH	\N
yd57ea5be9819b8e403769	1461310923221	0	25383-1	Cow milk IgE Ab RAST class in Serum	Cow Milk IgE RAST Ql	ALLERGY	\N
Udefd877917b92ff003792	1461310925538	0	11559-2	Fractional oxyhemoglobin in Blood	OxyHgb MFr Bld	CHEM	\N
o6f4d1d381ba95a5003757	1461310921795	0	65752-8	Liver Pathology biopsy report	Liver Path Bx report	PATH	\N
vaad0001d259273d703772	1461310923371	0	6234-9	Saltwort IgE Ab [Units/volume] in Serum	Saltwort IgE Qn	ALLERGY	\N
pda8db29ce3a5094d03759	1461310922079	0	65751-0	Muscle Pathology biopsy report	Muscle Path Bx report	PATH	\N
n836d0c1dfbf1100803824	1461310928489	0	12209-3	Eosinophils/100 leukocytes in Body fluid by Manual count	Eosinophil NFr Fld Manual	HEM/BC	\N
F89010a72c5ae7b5603784	1461310924555	0	17713-9	Topiramate [Mass/volume] in Serum or Plasma	Topiramate SerPl-mCnc	DRUG/TOX	\N
i96d1a072febc993e03808	1461310927163	0	11034-6	Acetylcholine receptor binding Ab [Moles/volume] in Serum	AChR Bind Ab Ser-sCnc	SERO	\N
sab9b20402aca343b03761	1461310922429	0	65754-4	Skin Pathology biopsy report	Skin Path Bx report	PATH	\N
nb6b03ab209c80b4603774	1461310923596	0	3786-1	Methaqualone [Presence] in Urine	Methaqualone Ur Ql	DRUG/TOX	\N
e761f2dc89115ab4203802	1461310926713	0	13627-5	Erythrocytes [Presence] in Semen by Light microscopy	RBC Smn Ql Micro	FERT	\N
M78dfe452e7e5feda03794	1461310925788	0	7415-3	Cladosporium sphaerospermum IgE Ab [Units/volume] in Serum	C sphaerospermum IgE Qn	ALLERGY	\N
Tb3d453cb29e5b29f03786	1461310924813	0	19125-4	Meconium [Presence] in Amniotic fluid	Meconium Amn Ql	CHEM	\N
Q84b64d12d8fdfe5b03776	1461310923746	0	11060-1	Reducing substances [Presence] in Stool	Reducing Subs Stl Ql	CHEM	\N
g67be6162443a3f2d03814	1461310927663	0	70198-7	Acetaminophen [Moles/volume] in Serum or Plasma by Screen method	Acetamin SerPl Scn-sCnc	DRUG/TOX	\N
Ba9d80f2ee06a15a003788	1461310925054	0	49578-8	Aminocaproate cutoff [Mass/volume] in Serum or Plasma	Amicaproate CtO SerPl-mCnc	DRUG/TOX	\N
Kbde8fc4287ade9e903796	1461310926004	0	34696-5	Collection method [Type] of Semen	Collection meth0d Smn	SPEC	\N
tcf69ccf40a90ca5903804	1461310926904	0	15192-8	Lymphocytes Variant [Presence] in Blood by Automated count	Variant Lymphs Bld Ql Auto	HEM/BC	\N
a82ac6218d74d14d703810	1461310927380	0	5838-8	Cytomegalovirus [Presence] in Unspecified specimen by Organism specific culture	CMV XXX Ql Cult	MICRO	\N
Lcacc5bc48519594c03798	1461310926260	0	7901-2	Helicobacter pylori IgA Ab [Units/volume] in Serum	H pylori IgA Ser-aCnc	MICRO	\N
l8457054124b96a6003818	1461310928046	0	25148-8	Calcium oxalate crystals [#/area] in Urine sediment by Microscopy high power field	CaOx Cry #/area UrnS HPF	UA	\N
va6855d21d1595cc603822	1461310928346	0	26509-0	Neutrophils.band form/100 leukocytes in Cerebral spinal fluid	Neuts Band NFr CSF	HEM/BC	\N
jb09f596fe347a6d903816	1461310927796	0	550-4	Bordetella pertussis Ag [Presence] in Unspecified specimen by Immunofluorescence	B pert Ag XXX Ql IF	MICRO	\N
xa01c6539852d313003820	1461310928155	0	14117-6	IgG index in Serum and CSF	IgG index Ser+CSF	CHEM	\N
Qdeb4ed53a978937403826	1461310928630	0	666-8	Microscopic observation [Identifier] in Unspecified specimen by India ink prep	India Ink Prep XXX	MICRO	\N
l8c59e76509fd1fd303868	1461310933839	0	44607-0	HIV 1 [interpretation] in Serum by Immunoassay	HIV1 Ser EIA-Imp	MICRO	\N
Yc371bff2a4024f2803828	1461310928772	0	12215-0	Fatty acids.very long chain [Moles/volume] in Serum or Plasma	VLCFA SerPl-sCnc	CHEM	\N
Mc048c90b9370f89e03844	1461310930489	0	20661-5	Valine [Moles/volume] in Serum or Plasma	Valine SerPl-sCnc	CHEM	\N
ideb72c9ece4a0ba003858	1461310931722	0	41163-7	Treponema pallidum DNA [Presence] in Unspecified specimen by Probe and target amplification method	T pallidum DNA XXX Ql PCR	MICRO	\N
Ee235376f0a1cba9c03830	1461310928947	0	19734-3	Chicken droppings IgE Ab [Units/volume] in Serum	Chicken Drop IgE Qn	ALLERGY	\N
K76c747ecc23f4f4c03896	1461310937039	0	17819-4	Albumin/Protein.total in unspecified time Urine by Electrophoresis	Albumin ?Tm MFr Ur Elph	CHEM	\N
Ke5cd1e3f00491ffd03846	1461310930655	0	3861-2	Nordiazepam [Presence] in Urine	Nordiazepam Ur Ql	DRUG/TOX	\N
C9a457408b62ff1f403832	1461310929097	0	2638-5	Myelin basic protein [Mass/volume] in Cerebral spinal fluid	MBP CSF-mCnc	CHEM	\N
Y9732be08f607efd703878	1461310934856	0	22568-0	Streptolysin O Ab [Titer] in Serum	ASO Ab Titr Ser	MICRO	\N
x7156f075d6bd6aff03870	1461310933931	0	8015-0	Rubella virus IgM Ab [Units/volume] in Serum	RUBV IgM Ser-aCnc	MICRO	\N
a9a168703cec222e203860	1461310932151	0	20648-2	Isoleucine [Moles/volume] in Serum or Plasma	Isoleucine SerPl-sCnc	CHEM	\N
Fbeb342340d28490a03834	1461310929330	0	14875-9	Phenylalanine [Moles/volume] in Serum or Plasma	Phe SerPl-sCnc	CHEM	\N
L79caab596127271a03848	1461310930805	0	12361-2	Oxazepam [Presence] in Urine	Oxazepam Ur Ql	DRUG/TOX	\N
Td960245dfd3dfc3c03836	1461310929472	0	20643-3	Glutamine [Moles/volume] in Serum or Plasma	Glutamine SerPl-sCnc	CHEM	\N
Tcf1dfb3727c7346b03886	1461310935756	0	18482-0	Yeast [Presence] in Unspecified specimen by Organism specific culture	Yeast XXX Ql Cult	MICRO	\N
q7ee06cfcdb4e3ac503850	1461310930964	0	15097-9	Vanillylmandelate [Moles/volume] in Urine	VMA Ur-sCnc	CHEM	\N
B7f252177a4ae3bdd03838	1461310929681	0	20636-7	Alanine [Moles/volume] in Serum or Plasma	Alanine SerPl-sCnc	CHEM	\N
dc42f75a5e58e64d503862	1461310932624	0	20649-0	Leucine [Moles/volume] in Serum or Plasma	Leucine SerPl-sCnc	CHEM	\N
v87a4a85b5957ce6503872	1461310934172	0	6239-8	Lenscale IgE Ab [Units/volume] in Serum	Lenscale IgE Qn	ALLERGY	\N
H9d6b5e95c3cf0abf03840	1461310929947	0	5005-4	Epstein Barr virus DNA [Presence] in Unspecified specimen by Probe and target amplification method	EBV DNA XXX Ql PCR	MICRO	\N
ebf9e7652d45155ea03852	1461310931139	0	14121-8	Pyruvate [Moles/volume] in Blood	Pyruvate Bld-sCnc	CHEM	\N
q7d8ff70d086cedb303900	1461310937547	0	17813-7	Alpha 2 globulin/Protein.total in unspecified time Urine by Electrophoresis	Alpha2 Glob ?Tm MFr Ur Elph	CHEM	\N
U82a77e1cbd16f1d003842	1461310930239	0	25473-0	Metanephrine [Moles/volume] in Serum or Plasma	Metaneph SerPl-sCnc	CHEM	\N
Ub84bb270b498c5c203892	1461310936372	0	50927-3	Tobramycin [Moles/volume] in Serum or Plasma	Tobramycin SerPl-sCnc	DRUG/TOX	\N
gcd5843b7f639bb9503864	1461310933039	0	24139-8	Cockroach IgG Ab [Units/volume] in Serum	Roach IgG Qn	ALLERGY	\N
t8d9702966610c92103854	1461310931338	0	46268-9	ABO and Rh group [Type] in Blood from Blood product unit--after transfusion reaction	ABO+Rh Gp p transf rx Bld BPU	BLDBK	\N
E87c8a12f116b16ba03880	1461310935064	0	13538-4	"Carbon dioxide	 total [Moles/volume] in Urine"	CO2 Ur-sCnc	\N
nb7bc30fddcb2556d03874	1461310934422	0	5116-9	Corynebacterium diphtheriae Ab [Units/volume] in Serum by Immunoassay	C diphtheriae Ab Ser EIA-aCnc	MICRO	\N
u94e94bff3ab620b503856	1461310931547	0	3436-3	Carboxy tetrahydrocannabinol [Mass/volume] in Urine	CarboxyTHC Ur-mCnc	DRUG/TOX	\N
je2202d676fc99dfd03866	1461310933556	0	11183-1	Macadamia IgE Ab [Units/volume] in Serum	Macadamia IgE Qn	ALLERGY	\N
Bd71c68021973639603888	1461310935922	0	32789-0	Viscosity of Semen Qualitative	Visc Smn Ql	SPEC	\N
Cb3694babe295622203882	1461310935331	0	14976-5	Lecithin/Sphingomyelin [Ratio] in Amniotic fluid	Lecithin/Sphingomyelin Amn-Rto	CHEM	\N
Q7836160dfb08e87503876	1461310934639	0	1777-2	Alkaline phosphatase.bone [Enzymatic activity/volume] in Serum or Plasma	ALP Bone SerPl-cCnc	CHEM	\N
a9817c1936e5eed6903910	1461310938531	0	34165-1	Granulocytes Immature [Presence] in Blood by Automated count	Imm Granulocytes Bld Ql Auto	HEM/BC	\N
L7587afd26b3aaa4c03898	1461310937256	0	17811-1	Alpha 1 globulin/Protein.total in unspecified time Urine by Electrophoresis	Alpha1 Glob ?Tm MFr Ur Elph	CHEM	\N
M82fa9738d3d5652203894	1461310936781	0	35670-9	Tobramycin [Mass/volume] in Serum or Plasma	Tobramycin SerPl-mCnc	DRUG/TOX	\N
F7c4e238e2043c8f103884	1461310935539	0	19201-3	Prostate Specific Ag Free [Units/volume] in Serum or Plasma	PSA Free SerPl-aCnc	CHEM	\N
Ha153e3471224ae8803890	1461310936156	0	7445-0	Lactalbumin alpha IgE Ab [Units/volume] in Serum	A-Lactalb IgE Qn	ALLERGY	\N
u9800bba8ada6832703906	1461310938122	0	21027-8	Platelet aggregation [interpretation] in Platelet poor plasma	PA PPP-Imp	COAG	\N
t9eb09f0559b11b8b03904	1461310937923	0	17817-8	Gamma globulin/Protein.total in unspecified time Urine by Electrophoresis	Gamma glob ?Tm MFr Ur Elph	CHEM	\N
ea3025312e604a45403902	1461310937756	0	17815-2	Beta globulin/Protein.total in unspecified time Urine by Electrophoresis	B-Globulin ?Tm MFr Ur Elph	CHEM	\N
iac64b81378b7562103908	1461310938373	0	13088-0	Complement total hemolytic CH100 [Units/volume] in Serum or Plasma	CH100 SerPl-aCnc	HEM/BC	\N
dc8f0dc19718e9cb603912	1461310938781	0	8072-1	Insulin Ab [Units/volume] in Serum	Insulin Ab Ser-aCnc	SERO	\N
g8d3c625f48bbd7c603914	1461310938956	0	20660-7	Tyrosine [Moles/volume] in Serum or Plasma	Tyrosine SerPl-sCnc	CHEM	\N
j7dad4e070635033203916	1461310939073	0	20401-6	Nuclear Ab pattern.speckled [Titer] in Serum	ANA Speckled Titr Ser	SERO	\N
lb29747eede83e25c03918	1461310939289	0	533-0	Mycobacterium sp identified in Blood by Organism specific culture	Mycobacterium Bld Cult	MICRO	\N
xc9c2813bc82c199f03920	1461310939456	0	20651-6	Methionine [Moles/volume] in Serum or Plasma	Methionine SerPl-sCnc	CHEM	\N
vbb4a5211e91b6d3103922	1461310939698	0	9360-9	Bartonella quintana IgG Ab [Titer] in Serum	B quintana IgG Titr Ser	MICRO	\N
n7917a3338c9efc3903924	1461310939998	0	23870-9	Hepatitis C virus 100+5-1-1 Ab [Presence] in Serum by Immunoblot (IB)	HCV100+5-1-1 Ab Ser Ql IB	MICRO	\N
jaa2fd7310dbb01a303966	1461310944690	0	17788-1	Large unstained cells/100 leukocytes in Blood by Automated count	LUC NFr Bld Auto	HEM/BC	\N
Qd5a81d2deb2caf0f03926	1461310940306	0	59408-5	Oxygen saturation in Arterial blood by Pulse oximetry	SaO2 % BldA PulseOx	PULM	\N
Ucb76aa468cea173903942	1461310942148	0	9361-7	Bartonella quintana IgM Ab [Titer] in Serum	B quintana IgM Titr Ser	MICRO	\N
Ud85dd9cb3d0284d003992	1461310947133	0	7059-9	Vancomycin [Susceptibility] by Gradient strip (E-test)	Vancomycin Islt E-test	ABXBACT	\N
ue012ba6318f0163203956	1461310943740	0	6029-3	Aureobasidium pullulans IgE Ab [Units/volume] in Serum	A pullulans IgE Qn	ALLERGY	\N
Yb3f321d6cc8e65d603928	1461310940723	0	14678-7	Cortisol [Moles/volume] in Serum or Plasma --PM trough specimen	Cortis PM SerPl-sCnc	CHEM	\N
Cb86ee22fcf3d1fad03982	1461310946182	0	20652-4	Ornithine [Moles/volume] in Serum or Plasma	Ornithine SerPl-sCnc	CHEM	\N
Mbaacfd26aa324ad503944	1461310942432	0	20637-5	Arginine [Moles/volume] in Serum or Plasma	Arginine SerPl-sCnc	CHEM	\N
E8b5d8b26aa2e644003930	1461310940973	0	15086-2	Oxalate [Moles/volume] in Urine	Oxalate Ur-sCnc	CHEM	\N
Bdd6758cfa57afd6003988	1461310946698	0	10853-0	Isospora belli [Presence] in Unspecified specimen by Acid fast stain.Kinyoun modified	I belli XXX Ql Acid fast Mod Kiny Stn	MICRO	\N
ld267164219b1f4f803968	1461310944831	0	14246-3	Phosphatidylserine IgM Ab [Units/volume] in Serum	PS IgM Ser-aCnc	COAG	\N
idc1b88be9c6dc03803958	1461310944006	0	20642-5	Glutamate [Moles/volume] in Serum or Plasma	Glutamate SerPl-sCnc	CHEM	\N
Cd7cd34509a9c674003932	1461310941181	0	4991-6	Borrelia burgdorferi DNA [Presence] in Unspecified specimen by Probe and target amplification method	B burgdor DNA XXX Ql PCR	MICRO	\N
K96f67228967aad7303946	1461310942723	0	20640-9	Citrulline [Moles/volume] in Serum or Plasma	Citrulline SerPl-sCnc	CHEM	\N
F9f0d4a5c089c468203934	1461310941372	0	22070-7	HP gene mutations found [Identifier] in Blood or Tissue by Molecular genetics method Nominal	HP gene Mut Anal Bld/T	MOLPATH.MUT	\N
Qad78a4e78c9c920003976	1461310945657	0	20781-1	Cryptosporidium sp [Presence] in Stool by Acid fast stain	Cryptosp Stl Ql Acid fast Stn	MICRO	\N
Le2cfd65e6c007c9c03948	1461310942831	0	20644-1	Glycine [Moles/volume] in Serum or Plasma	Glycine SerPl-sCnc	CHEM	\N
Tc9d46333c99205cb03936	1461310941548	0	6286-9	Wormwood IgE Ab [Units/volume] in Serum	Wormwood IgE Qn	ALLERGY	\N
a934e71f9f3092f9c03960	1461310944131	0	20645-8	Histidine [Moles/volume] in Serum or Plasma	Histidine SerPl-sCnc	CHEM	\N
Ba7dd5efae285a91803938	1461310941731	0	32220-6	Liver kidney microsomal 1 Ab [Units/volume] in Serum	LKM-1 Ab Ser-aCnc	SERO	\N
xbe0c5c4068f9d87303970	1461310945023	0	3218-5	Coagulation factor X activity actual/normal in Platelet poor plasma by Coagulation assay	Fact X Act/Nor PPP	COAG	\N
q9751e9fc6cffc01f03950	1461310942973	0	20656-5	Serine [Moles/volume] in Serum or Plasma	Serine SerPl-sCnc	CHEM	\N
H93a40fe0e799702903940	1461310941965	0	9326-0	Phosphatidylserine IgG Ab [Presence] in Serum by Immunoassay	PS IgG Ser Ql EIA	COAG	\N
K7662bbb4f6ef82b403996	1461310947556	0	29767-1	Bilirubin.total [Moles/volume] in Body fluid	Bilirub Fld-sCnc	CHEM	\N
d77677fb4d35a1acd03962	1461310944340	0	20655-7	Proline [Moles/volume] in Serum or Plasma	Proline SerPl-sCnc	CHEM	\N
e6ca9b8ce614cc36203952	1461310943189	0	20658-1	Threonine [Moles/volume] in Serum or Plasma	Threonine SerPl-sCnc	CHEM	\N
F83b22fa5ea5dd33403984	1461310946448	0	6733-0	Pigeon serum Ab [Presence] in Serum by Immune diffusion (ID)	Pigeon Serum Ab Ql ID	ALLERGY	\N
Ybe863bf6cf5d4d3203978	1461310945890	0	32217-2	von Willebrand factor (vWf) multimers [Presence] in Platelet poor plasma	vWF multimers PPP Ql	COAG	\N
v6f557ea62ffa0f7c03972	1461310945215	0	49058-1	Activated partial thromboplastin time (aPTT) in Blood drawn from CRRT circuit by Coagulation assay	aPTT Time BldCRRT	COAG	\N
t71abba5483b3568503954	1461310943331	0	20657-3	Taurine [Moles/volume] in Serum or Plasma	Taurine SerPl-sCnc	CHEM	\N
g9f6e803e2d1afe1a03964	1461310944456	0	18903-5	Chloramphenicol [Susceptibility]	Chloramphen Susc Islt	ABXBACT	\N
tcf6c651b42415f1404004	1461310948423	0	50758-2	Herpes simplex virus 1 IgM Ab [Titer] in Serum by Immunofluorescence	HSV1 IgM Titr Ser IF	MICRO	\N
He30a5a94b32b20f303990	1461310946798	0	5869-3	Parainfluenza virus 1 Ag [Presence] in Unspecified specimen by Immunofluorescence	HPIV1 Ag XXX Ql IF	MICRO	\N
E865b9df784f3841103980	1461310946064	0	22412-1	Saccharopolyspora rectivirgula Ab [Presence] in Serum	S rectivirgula Ab Ser Ql	MICRO	\N
n9f1bf8bc4ffe66f003974	1461310945465	0	6061-6	Carrot IgE Ab [Units/volume] in Serum	Carrot IgE Qn	ALLERGY	\N
T7ddb5cd0cb77a23403986	1461310946590	0	20650-8	Lysine [Moles/volume] in Serum or Plasma	Lysine SerPl-sCnc	CHEM	\N
ec799f43067664bbc04002	1461310948285	0	20499-0	Phosphatidylglycerol/Surfactant.total in Amniotic fluid	PG MFr Amn	CHEM	\N
M92bd4f0987e03f8503994	1461310947281	0	15050-8	Creatinine [Moles/volume] in Amniotic fluid	Creat Amn-sCnc	CHEM	\N
qa7d1d904235c794e04000	1461310948031	0	12201-0	Cryoglobulin [Presence] in Serum by 1 day cold incubation	Cryoglob Ser Ql 1D Cold Inc	CHEM	\N
L86f3fae15ec815a103998	1461310947707	0	20638-3	Asparagine [Moles/volume] in Serum or Plasma	Asparagine SerPl-sCnc	CHEM	\N
i88e174cc96b6b96704008	1461310948807	0	16195-0	Benzodiazepines [Presence] in Urine by Confirmatory method	Benzodiaz Ur Ql Cfm	DRUG/TOX	\N
ucfa62e3d8fde264004006	1461310948648	0	26927-4	Herpes simplex virus 2 IgM Ab [Titer] in Serum by Immunofluorescence	HSV2 IgM Titr Ser IF	MICRO	\N
a992c80d371d8851604010	1461310948915	0	6081-4	Coconut IgE Ab [Units/volume] in Serum	Coconut IgE Qn	ALLERGY	\N
dc2888594cbd814a904012	1461310949156	0	721-1	Free Hemoglobin [Mass/volume] in Plasma	Hgb Free Plas-mCnc	HEM/BC	\N
g70e131871cfa437104014	1461310949365	0	31209-0	Islet cell 512 Ab [Units/volume] in Serum	Islet Cell512 Ab Ser-aCnc	SERO	\N
jdace0695525b56e404016	1461310949565	0	1779-8	Alkaline phosphatase.liver [Enzymatic activity/volume] in Serum or Plasma	ALP Liver SerPl-cCnc	CHEM	\N
ld18e7ab26539ce1e04018	1461310949715	0	2334-1	Hemoglobin.gastrointestinal [Presence] in Gastric fluid	Gastrocult Gast Ql	CHEM	\N
x91d1dfc0092e414a04020	1461310949890	0	16085-3	Wheat IgE Ab RAST class in Serum	Wheat IgE RAST Ql	ALLERGY	\N
va7fc13e755540cdb04022	1461310949990	0	29591-5	Enterovirus RNA [Presence] in Unspecified specimen by Probe and target amplification method	EV RNA XXX Ql PCR	MICRO	\N
fe5d883344d63bc9c04063	1461310954257	0	49838-6	Neural tube defect risk in population	Neural tube defect risk pop	CHEM	\N
Bac85cb9f004d937b04038	1461310951524	0	16982-1	HTLV 1+2 Ab [Presence] in Serum by Immunoblot (IB)	HTLV1+2 Ab Ser Ql IB	MICRO	\N
e92a0afcea5481d8e04052	1461310953057	0	5959-2	Prothrombin time (PT) factor substitution in Platelet poor plasma by Coagulation assay --immediately after addition of normal plasma	PT imm NP Time PPP	COAG	\N
nbfb7f9eddcfe944404024	1461310950123	0	24103-4	Plasma cells [#/volume] in Blood by Manual count	Plasma Cells # Bld Manual	HEM/BC	\N
H8f870da2eec3464b04040	1461310951665	0	20420-6	Prostatic acid phosphatase [Mass/volume] in Serum	PACP Ser-mCnc	CHEM	\N
Q7fc8b9ca62a34fed04026	1461310950440	0	6038-4	American Beech IgE Ab [Units/volume] in Serum	Amer Beech IgE Qn	ALLERGY	\N
Ve2408ab0e21a3f8104085	1461310956583	0	1926-5	Base excess in Capillary blood	Base excess BldC-sCnc	CHEM	\N
W7ea2f15bc48299ef04079	1461310955999	0	7797-4	Rouleaux [Presence] in Blood by Light microscopy	Rouleaux Bld Ql Smear	HEM/BC	\N
t9d4a359803a0085604054	1461310953307	0	29559-2	Haemophilus ducreyi DNA [Presence] in Unspecified specimen by Probe and target amplification method	H ducreyi DNA XXX Ql PCR	MICRO	\N
Ye02ac7e1f9102eac04028	1461310950648	0	38168-1	Major crossmatch [interpretation] by Low ionic strenght saline (LISS)	Maj XM SerPl LISS-Imp	BLDBK	\N
Ua77c01bf7657cdf704042	1461310951849	0	6125-9	Gluten IgE Ab [Units/volume] in Serum	Gluten IgE Qn	ALLERGY	\N
Eb9b5b64901ba85ed04030	1461310950859	0	51844-9	Cortisol [Moles/volume] in Saliva	Cortis Sal-sCnc	CHEM	\N
hc97c6bda5f08efb104065	1461310954457	0	6090-5	Cottonwood IgE Ab [Units/volume] in Serum	Cottonwood IgE Qn	ALLERGY	\N
Mb5206e550862ed4404044	1461310952090	0	30374-3	Basophils/100 leukocytes in Cerebral spinal fluid	Basophils NFr CSF	HEM/BC	\N
Ca38fcc832c27cd2704032	1461310950957	0	15568-9	Soybean IgE Ab RAST class in Serum	Soybean IgE RAST Ql	ALLERGY	\N
bc1841dfa32f1247704073	1461310955333	0	4635-9	Free Hemoglobin [Mass/volume] in Serum	Hgb Free Ser-mCnc	HEM/BC	\N
oc8dd44781c386b5f04057	1461310953532	0	18743-5	Autopsy report		ATTACH.CLINRPT	\N
F8be4682a4018c48504034	1461310951107	0	43734-3	Activated partial thromboplastin time (aPTT) in Platelet poor plasma by Coagulation 1:1 saline	aPTT Time PPP 1:1 saline	COAG	\N
K7f6dd90b87c0544c04046	1461310952340	0	14812-2	Lidocaine [Moles/volume] in Serum or Plasma	Lidocain SerPl-sCnc	DRUG/TOX	\N
Td66e249d1b8e202904036	1461310951274	0	43397-9	Dilute Russell viper venom time (dRVVT) factor substitution in Platelet poor plasma by Coagulation assay --immediately after addition of normal plasma	dRVV Tme imm NP Time PPP	COAG	\N
ka8b733af41c7beeb04067	1461310954682	0	30192-9	Acetylcholine receptor modulation Ab/Acetylcholine Ab.total in Serum	AChR Mod Ab/AChR Total SFr Ser	SERO	\N
pa97a2c5dbf242e9704059	1461310953816	0	25447-4	Insulin Free [Moles/volume] in Serum or Plasma	Insulin Free SerPl-sCnc	CHEM	\N
L8a015ed373ba8b2b04048	1461310952607	0	10526-2	Microscopic observation [Identifier] in Sputum by Cyto stain	Cyto Spt	CYTO	\N
Pc72c43b4c0435d1a04099	1461310958250	0	46138-4	Urate crystals [#/area] in Urine sediment by Microscopy high power field	Urate Cry #/area UrnS HPF	UA	\N
D8f40d869a6a578fb04081	1461310956182	0	8277-6	Body surface area	BSA	BDYSURF.ATOM	\N
md06a0e6ed1b3938604075	1461310955507	0	46128-5	Tissue transglutaminase IgA Ab [Units/volume] in Serum by Immunoassay	tTG IgA Ser EIA-aCnc	SERO	\N
qdacc54cbb0245e1104050	1461310952815	0	7796-6	Platelet clump [Presence] in Blood by Light microscopy	Platelet Clump Bld Ql Smear	HEM/BC	\N
sd33eb7bd319c493b04061	1461310954091	0	6121-8	Fusarium moniliforme IgE Ab [Units/volume] in Serum	F moniliforme IgE Qn	ALLERGY	\N
yb7966dd24920ee4a04069	1461310954907	0	6287-7	Baker's yeast IgE Ab [Units/volume] in Serum	Baker's yeast IgE Qn	ALLERGY	\N
Obeab57869cc7e23b04097	1461310958024	0	38995-7	Mixed cellular casts [#/area] in Urine sediment by Microscopy low power field	Mixed Cell Casts #/area UrnS LPF	UA	\N
G993f4911ccc026e904087	1461310956816	0	7795-8	Pappenheimer bodies [Presence] in Blood by Light microscopy	Pappenheimer Bod Bld Ql Smear	HEM/BC	\N
cafeab345c99d616204071	1461310955098	0	6349-5	Chlamydia trachomatis [Presence] in Unspecified specimen by Organism specific culture	C trach XXX Ql Cult	MICRO	\N
Aba2f376683fd0b2304077	1461310955733	0	2711-0	Oxygen saturation in Venous blood	SaO2 % BldV	HEMODYN.MOLEC	\N
Rb3dfaee674e8284704083	1461310956382	0	765-8	Neutrophils.hypersegmented [Presence] in Blood by Light microscopy	Neuts Hyperseg Bld Ql Smear	HEM/BC	\N
N80bf7944ee92c4c804091	1461310957257	0	2716-9	Fractional oxyhemoglobin in Venous blood	OxyHgb MFr BldV	CHEM	\N
Id4d8b7905a15c33104095	1461310957799	0	5807-3	RBC casts [#/area] in Urine sediment by Microscopy low power field	RBC Casts #/area UrnS LPF	UA	\N
Zc7854af2ce6905d304089	1461310957074	0	20456-0	Fungi.yeastlike [Presence] in Urine sediment by Light microscopy	Yeast Like Fungi UrnS Ql Micro	UA	\N
wc93d24ad4a035c7d04101	1461310958491	0	5335-5	Rubella virus IgM Ab [Units/volume] in Serum by Immunoassay	RUBV IgM Ser EIA-aCnc	MICRO	\N
Jc378910b0217641504093	1461310957549	0	5819-8	Waxy casts [#/area] in Urine sediment by Microscopy low power field	Waxy Casts #/area UrnS LPF	UA	\N
ra6c42c4b204dab4d04103	1461310958941	0	25154-6	Unidentified crystals [#/area] in Urine sediment by Microscopy high power field	Unident Crys #/area UrnS HPF	UA	\N
za61511ba5f432d8d04105	1461310959191	0	33215-5	Neutrophils.agranular [Presence] in Blood by Light microscopy	Agran Neuts Bld Ql Smear	HEM/BC	\N
oe66556b5ce3d349504107	1461310959475	0	5788-5	Oval fat bodies (globules) [#/area] in Urine sediment by Microscopy high power field	Oval fat bodies #/area UrnS HPF	UA	\N
pb66cd2c1b4d90b6b04109	1461310959775	0	2272-3	Fat [Presence] in Urine	Fat Ur Ql	CHEM	\N
s7b73882a03c91a2604111	1461310960158	0	10380-4	Stomatocytes [Presence] in Blood by Light microscopy	Stomatocytes Bld Ql Smear	HEM/BC	\N
f7e2dbf63d8a908d204113	1461310960482	0	7817-0	Borrelia burgdorferi IgG Ab [Units/volume] in Serum	B burgdor IgG Ser-aCnc	MICRO	\N
hdde76c69a04047c604115	1461310960816	0	5062-5	Borrelia burgdorferi IgG Ab [Units/volume] in Serum by Immunoassay	B burgdor IgG Ser EIA-aCnc	MICRO	\N
hc0c7aab24644744904165	1461310968869	0	20457-8	Fungi.filamentous [Presence] in Urine sediment by Light microscopy	Filament Fungi UrnS Ql Micro	UA	\N
k999fd9fd3bc13e7c04117	1461310961158	0	5786-9	Epithelial casts [#/area] in Urine sediment by Microscopy low power field	Epith Casts #/area UrnS LPF	UA	\N
Re017689b6560f96804133	1461310963441	0	5773-7	Calcium carbonate crystals [Presence] in Urine sediment by Light microscopy	Ca Carbonate Cry UrnS Ql Micro	UA	\N
o706676e37d279d2904157	1461310967600	0	25158-7	Oval fat bodies (globules) [Presence] in Urine sediment by Light microscopy	Oval fat bodies UrnS Ql Micro	UA	\N
y91d69eacab85d0f004119	1461310961474	0	33216-3	Platelets agranular [Presence] in Blood by Light microscopy	Agran Platelets Bld Ql Smear	HEM/BC	\N
Oc6270158232d2e7f04147	1461310966233	0	5815-6	Tyrosine crystals [Presence] in Urine sediment by Light microscopy	Tyrosine Cry UrnS Ql Micro	UA	\N
Vdfb30262860bcbfa04135	1461310964108	0	25886-3	Creatinine [Moles/volume] in 24 hour Urine	Creat 24h Ur-sCnc	CHEM	\N
c9cead843fbd253b704121	1461310961691	0	18311-1	Pelger Huet cells [Presence] in Blood by Light microscopy	Pelger Huet Cells Bld Ql Smear	HEM/BC	\N
Pa2410a6737df145804199	1461310974083	0	31012-8	Vancomycin [Moles/volume] in Serum or Plasma	Vancomycin SerPl-sCnc	DRUG/TOX	\N
bc30db1024942070704123	1461310961991	0	11281-3	Auer rods [Presence] in Blood by Light microscopy	Auer Bodies Bld Ql Smear	HEM/BC	\N
G686124cac69449a504137	1461310964641	0	14958-3	Microalbumin/Creatinine [Mass ratio] in 24 hour Urine	Microalbumin/Creat 24h Ur-mRto	CHEM	\N
P690daed2cf5dc13504149	1461310966541	0	5766-1	Ammonium urate crystals [Presence] in Urine sediment by Light microscopy	Amm Urate Cry UrnS Ql Micro	UA	\N
m75e92aefe34ed9ac04125	1461310962283	0	30003-8	Microalbumin [Mass/volume] in 24 hour Urine	Microalbumin 24h Ur-mCnc	CHEM	\N
paf460c1f52a4283104159	1461310967908	0	18487-9	Broad casts [#/area] in Urine sediment by Microscopy low power field	Broad Casts #/area UrnS LPF	UA	\N
Zda51b248c4e1df9204139	1461310965172	0	33647-9	Protein.monoclonal/Protein.total in Serum or Plasma by Electrophoresis	M Protein MFr SerPl Elph	CHEM	\N
A9b3c34d8b4ed88cd04127	1461310962533	0	5784-4	Cystine crystals [Presence] in Urine sediment by Light microscopy	Cystine Cry UrnS Ql Micro	UA	\N
N682b4e62eae078a904191	1461310972858	0	27071-0	CD45 (Lymphs) cells [#/volume] in Blood	CD45 Cells # Bld	CELLMARK	\N
Z757865ae68e1360b04189	1461310972558	0	5776-0	Calcium sulfate crystals [Presence] in Urine sediment by Light microscopy	Ca Sulfate Cry UrnS Ql Micro	UA	\N
k6cd6c6bbe89e82ca04167	1461310969233	0	5812-3	Sulfonamide crystals [Presence] in Urine sediment by Light microscopy	Sulfonamide cry UrnS Ql Micro	UA	\N
wa594d9ba5fd8fc0004151	1461310966849	0	30350-3	Hemoglobin [Mass/volume] in Venous blood	Hgb BldV-mCnc	HEM/BC	\N
W88cd061048dbdbdd04129	1461310962808	0	5775-2	Calcium phosphate crystals [Presence] in Urine sediment by Light microscopy	Ca Phos Cry UrnS Ql Micro	UA	\N
Nd075e7a07c7bbd3404141	1461310965466	0	716-1	Heinz bodies [Presence] in Blood by Light microscopy	Heinz Bod Bld Ql Smear	HEM/BC	\N
D9b32c2e3e69e3aca04131	1461310963100	0	5789-3	Fatty casts [#/area] in Urine sediment by Microscopy low power field	Fatty Casts #/area UrnS LPF	UA	\N
s8315a8b0b2d34efc04161	1461310968225	0	24015-0	Influenza virus A+B Ag [Presence] in Unspecified specimen	FLUAV+FLUBV Ag XXX Ql	MICRO	\N
Ja6eab040c35f403704143	1461310965683	0	5798-4	Leucine crystals [Presence] in Urine sediment by Light microscopy	Leucine Cry UrnS Ql Micro	UA	\N
r69959d4757f786dc04153	1461310967125	0	27200-5	Nuclear Ab [Units/volume] in Serum	ANA Ser-aCnc	SERO	\N
b6bf966d55aa3278504173	1461310970100	0	40729-6	Herpes simplex virus IgM Ab [Presence] in Serum by Immunoassay	HSV IgM Ser Ql EIA	MICRO	\N
Rb7128ba938a0111f04183	1461310971708	0	30394-1	Granulocytes [#/volume] in Blood	Granulocytes # Bld	HEM/BC	\N
Ic64141d89e433b9704145	1461310965908	0	2027-1	"Carbon dioxide	 total [Moles/volume] in Venous blood"	CO2 BldV-sCnc	\N
W7e00bf0be55fe84104179	1461310971092	0	20455-2	Leukocytes [Presence] in Urine sediment by Light microscopy	WBC UrnS Ql Micro	UA	\N
y6e8907ed24a3ed9104169	1461310969533	0	5771-1	Bilirubin crystals [Presence] in Urine sediment by Light microscopy	Bilirub Cry UrnS Ql Micro	UA	\N
fe5f401ff0bdec1bb04163	1461310968533	0	6437-8	Influenza virus A+B Ag [Presence] in Unspecified specimen by Immunoassay	FLUAV+FLUBV Ag XXX Ql EIA	MICRO	\N
z7dd1a47f960925c604155	1461310967349	0	25149-6	Calcium phosphate crystals [#/area] in Urine sediment by Microscopy high power field	Ca Phos Cry #/area UrnS HPF	UA	\N
md7447ad6b97b927204175	1461310970375	0	53835-5	"1	5-Anhydroglucitol [Mass/volume] in Serum or Plasma"	"1	\N
cb954f2176ddec06704171	1461310969817	0	25147-0	Calcium carbonate crystals [#/area] in Urine sediment by Microscopy high power field	Ca Carbonate Cry #/area UrnS HPF	UA	\N
G9eea2505be0ae2e204187	1461310972267	0	18312-9	Platelet satellitism [Presence] in Blood by Light microscopy	Platelet Satel Bld Ql Smear	HEM/BC	\N
Dd3857a67c1e5066004181	1461310971408	0	33905-1	Trichomonas sp [#/area] in Urine sediment by Microscopy high power field	Trichomonas #/area UrnS HPF	UA	\N
Ac8c890e4f12e3d2304177	1461310970642	0	5777-8	Cholesterol crystals [Presence] in Urine sediment by Light microscopy	Cholest Cry UrnS Ql Micro	UA	\N
Jd5eb7053bd27fb7f04193	1461310973158	0	11043-7	Cryofibrinogen [Presence] in Plasma	Cryofib Plas Ql	CHEM	\N
V9a3f4aefe7beebf404185	1461310971983	0	5795-0	Hippurate crystals [Presence] in Urine sediment by Light microscopy	Hippurate Cry UrnS Ql Micro	UA	\N
Oada25be3cc20150104197	1461310973717	0	20578-1	Vancomycin [Mass/volume] in Serum or Plasma	Vancomycin SerPl-mCnc	DRUG/TOX	\N
I6a0b524aea217a9504195	1461310973517	0	32033-3	Phosphatidylserine IgM Ab [Units/volume] in Serum by Immunoassay	PS IgM Ser EIA-aCnc	COAG	\N
w6cdf6c7108071ab504201	1461310974342	0	33256-9	Leukocytes [#/volume] corrected for nucleated erythrocytes in Blood by Automated count	WBC nRBC cor # Bld Auto	HEM/BC	\N
rb306e73723f225c404203	1461310974633	0	708-8	Blasts [#/volume] in Blood by Manual count	Blasts # Bld Manual	HEM/BC	\N
zab58417a42d93ce304205	1461310974900	0	18309-5	Nucleated erythrocytes/100 leukocytes [Ratio] in Blood by Manual count	nRBC/100 WBC Bld Manual-Rto	HEM/BC	\N
o85aef8d5de434bda04207	1461310975192	0	5156-5	Epstein Barr virus nuclear IgG Ab [Presence] in Serum by Immunoassay	EBV NA IgG Ser Ql EIA	MICRO	\N
pb642dd4edbc8227804209	1461310975484	0	51928-0	Ribonucleoprotein extractable nuclear Ab [Units/volume] in Serum by Immunoassay	ENA RNP Ab Ser EIA-aCnc	SERO	\N
sda48f627b2bc694604211	1461310975692	0	33569-5	Sjogrens syndrome-A extractable nuclear Ab [Units/volume] in Serum by Immunoassay	ENA SS-A Ab Ser EIA-aCnc	SERO	\N
fdbb4ad84eac6489004213	1461310975884	0	45142-7	Sjogrens syndrome-B extractable nuclear Ab [Units/volume] in Serum by Immunoassay	ENA SS-B Ab Ser EIA-aCnc	SERO	\N
hacda450e072d27d504215	1461310976075	0	43182-5	Smith extractable nuclear Ab [Units/volume] in Serum by Immunoassay	ENA SM Ab Ser EIA-aCnc	SERO	\N
\.


--
-- Data for Name: auf; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY auf (id, lastupdate, deleted, patientid, fallid, briefid, prozent, datumauz, datumvon, datumbis, grund, aufzusatz) FROM stdin;
\.


--
-- Data for Name: bbs; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY bbs (id, lastupdate, deleted, reference, topic, date, "time", authorid, message) FROM stdin;
\.


--
-- Data for Name: behandlungen; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY behandlungen (id, lastupdate, deleted, fallid, mandantid, rechnungsid, datum, diagnosen, leistungen, eintrag) FROM stdin;
\.


--
-- Data for Name: behdl_dg_joint; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY behdl_dg_joint (id, lastupdate, deleted, behandlungsid, diagnoseid) FROM stdin;
\.


--
-- Data for Name: briefe; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY briefe (id, lastupdate, deleted, betreff, datum, modifiziert, gedruckt, geloescht, absenderid, destid, behandlungsid, patientid, typ, mimetype, path) FROM stdin;
\.


--
-- Data for Name: ch_elexis_arzttarife_ch_physio; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY ch_elexis_arzttarife_ch_physio (id, lastupdate, deleted, validfrom, validuntil, tp, ziffer, titel, description) FROM stdin;
VERSION	1461310399786	0	\N	\N	\N	0.0.1	\N	\N
\.


--
-- Data for Name: ch_elexis_eigendiagnosen; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY ch_elexis_eigendiagnosen (id, lastupdate, deleted, parent, code, title, comment, extinfo) FROM stdin;
VERSION	\N	0	\N	\N	0.1.1	\N	\N
\.


--
-- Data for Name: ch_elexis_icpc; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY ch_elexis_icpc (id, lastupdate, deleted, component, short, synonyms, icd10, txt, criteria, inclusion, exclusion, consider, note) FROM stdin;
ver	\N	0	\N	\N	\N	\N	1.2.1	\N	\N	\N	\N	\N
\.


--
-- Data for Name: ch_elexis_icpc_encounter; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY ch_elexis_icpc_encounter (id, lastupdate, deleted, kons, episode, rfe, diag, proc, extinfo) FROM stdin;
1	\N	0	0.2.1	\N	\N	\N	\N	\N
\.


--
-- Data for Name: ch_elexis_icpc_episodes; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY ch_elexis_icpc_episodes (id, lastupdate, deleted, patientid, title, startdate, number, status, extinfo) FROM stdin;
1	\N	0	\N	0.4.2	\N	\N	1	\N
\.


--
-- Data for Name: ch_elexis_icpc_episodes_diagnoses_link; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY ch_elexis_icpc_episodes_diagnoses_link (id, lastupdate, deleted, episode, diagnosis) FROM stdin;
\.


--
-- Data for Name: ch_elexis_messages; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY ch_elexis_messages (id, lastupdate, deleted, origin, destination, datetime, msg) FROM stdin;
VERSION	\N	0	0.2.0	\N	\N	\N
\.


--
-- Data for Name: ch_elexis_privatrechnung; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY ch_elexis_privatrechnung (id, lastupdate, deleted, parent, name, short, cost, price, "time", subsystem, valid_from, valid_until, extinfo) FROM stdin;
VERSION	\N	0	\N	0.3.1	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY config (lastupdate, param, wert) FROM stdin;
\N	ablauf/Trace_default	none
\N	LocalXIDDomains	www.elexis.ch/xid/kontakt/lab/sendingfacility#2#Sendende Institution#ch.elexis.data.Labor,;www.xid.ch/id/ean#2#EAN#ch.elexis.data.Kontakt,;www.elexis.ch/xid#5#UUID#ch.elexis.data.PersistentObject,;www.xid.ch/id/oid#7#OID#ch.elexis.data.PersistentObject,;www.elexis.ch/xid/kontakt/rolle#2#Rolle#;www.ahv.ch/xid#2#AHV#ch.elexis.data.Person,;www.elexis.ch/xid/kontakt/spez#2#Spezialität#ch.elexis.data.Person,;www.elexis.ch/xid/kontakt/kanton#2#Kanton#ch.elexis.data.Person,;www.elexis.ch/xid/kontakt/anrede#2#Anrede#ch.elexis.data.Person,;
\N	ElexisVersion	3.1.0
\N	dbversion	3.1.0
\N	created	01.03.2016, 09:05:40
\.


--
-- Data for Name: dbimage; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY dbimage (id, lastupdate, deleted, datum, prefix, title, bild) FROM stdin;
\.


--
-- Data for Name: diagnosen; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY diagnosen (id, lastupdate, deleted, dg_txt, dg_code, klasse) FROM stdin;
\.


--
-- Data for Name: eigenleistungen; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY eigenleistungen (id, lastupdate, deleted, code, bezeichnung, ek_preis, vk_preis, zeit) FROM stdin;
\.


--
-- Data for Name: ek_preise; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY ek_preise (typ, id, lastupdate, datum_von, datum_bis, multiplikator) FROM stdin;
\.


--
-- Data for Name: etiketten; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY etiketten (id, lastupdate, image, deleted, importance, name, foreground, background, classes) FROM stdin;
\.


--
-- Data for Name: etiketten_objclass_link; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY etiketten_objclass_link (objclass, sticker) FROM stdin;
\.


--
-- Data for Name: etiketten_object_link; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY etiketten_object_link (lastupdate, obj, etikette) FROM stdin;
\.


--
-- Data for Name: faelle; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY faelle (id, lastupdate, deleted, patientid, garantid, kostentrid, versnummer, fallnummer, betriebsnummer, diagnosen, datumvon, datumbis, bezeichnung, grund, gesetz, status, extinfo) FROM stdin;
\.


--
-- Data for Name: heap; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY heap (id, lastupdate, deleted, inhalt, datum) FROM stdin;
\.


--
-- Data for Name: heap2; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY heap2 (id, deleted, datum, lastupdate, contents) FROM stdin;
\.


--
-- Data for Name: iatrix_problem_behdl_joint; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY iatrix_problem_behdl_joint (id, problemid, behandlungsid) FROM stdin;
\.


--
-- Data for Name: iatrix_problem_dauermedikation_joint; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY iatrix_problem_dauermedikation_joint (id, problemid, dauermedikationid) FROM stdin;
\.


--
-- Data for Name: iatrix_problem_dg_joint; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY iatrix_problem_dg_joint (id, problemid, diagnoseid) FROM stdin;
\.


--
-- Data for Name: icd10; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY icd10 (id, lastupdate, deleted, parent, icdcode, encoded, icdtxt, extinfo) FROM stdin;
1	\N	0	\N	\N	\N	1.0.2	\N
\.


--
-- Data for Name: kontakt; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY kontakt (id, lastupdate, deleted, istorganisation, istperson, istpatient, istanwender, istmandant, istlabor, land, geburtsdatum, geschlecht, titel, titelsuffix, bezeichnung1, bezeichnung2, bezeichnung3, strasse, plz, ort, telefon1, telefon2, fax, natelnr, email, website, gruppe, patientnr, anschrift, bemerkung, diagnosen, persanamnese, sysanamnese, famanamnese, risiken, allergien, extinfo) FROM stdin;
ede8f37c868a58d7b02	1456819540503	0	0	0	0	1	0	0	\N	\N	\N	\N	\N	Administrator	\N	Administrator	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
U6caae135e5776d8042	1456819734253	0	0	1	0	1	1	0	\N	\N	m	Dr. med.	\N	Bond	James	\N	10, Baker Street	9999	10, Baker Street	0061 555 55 55	\N	0061 555 55 56	\N	james@bond.invalid	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: kontakt_adress_joint; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY kontakt_adress_joint (id, lastupdate, deleted, myid, otherid, bezug, myrtype, otherrtype) FROM stdin;
\.


--
-- Data for Name: konto; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY konto (id, lastupdate, deleted, patientid, rechnungsid, zahlungsid, betrag, datum, bemerkung) FROM stdin;
\.


--
-- Data for Name: labgroup_item_joint; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY labgroup_item_joint (lastupdate, groupid, itemid, comment) FROM stdin;
\.


--
-- Data for Name: labgroups; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY labgroups (id, lastupdate, deleted, name) FROM stdin;
\.


--
-- Data for Name: laboritems; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY laboritems (id, lastupdate, deleted, kuerzel, titel, laborid, refmann, reffrauortx, einheit, typ, gruppe, prio, billingcode, export, loinccode, visible, digits, formula) FROM stdin;
\.


--
-- Data for Name: laborwerte; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY laborwerte (id, lastupdate, deleted, patientid, datum, zeit, itemid, resultat, flags, origin, unit, analysetime, observationtime, transmissiontime, refmale, reffemale, originid, kommentar, extinfo) FROM stdin;
\.


--
-- Data for Name: leistungen; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY leistungen (id, lastupdate, deleted, behandlung, leistg_txt, leistg_code, klasse, zahl, ek_kosten, vk_tp, vk_scale, vk_preis, scale, scale2, userid, detail) FROM stdin;
\.


--
-- Data for Name: leistungsblock; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY leistungsblock (id, lastupdate, deleted, mandantid, name, macro, leistungen) FROM stdin;
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY logs (id, lastupdate, deleted, oid, datum, typ, userid, station, extinfo) FROM stdin;
\.


--
-- Data for Name: output_log; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY output_log (id, lastupdate, deleted, objectid, objecttype, datum, outputter, extinfo) FROM stdin;
\.


--
-- Data for Name: patient_artikel_joint; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY patient_artikel_joint (id, lastupdate, deleted, patientid, artikelid, artikel, rezeptid, datefrom, dateuntil, dosis, anzahl, bemerkung, presctype, sortorder, prescdate, prescriptor, extinfo) FROM stdin;
\.


--
-- Data for Name: rechnungen; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY rechnungen (id, lastupdate, deleted, rnnummer, fallid, mandantid, rndatum, rnstatus, rndatumvon, rndatumbis, betrag, statusdatum, extinfo) FROM stdin;
\.


--
-- Data for Name: reminders; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY reminders (id, lastupdate, deleted, identid, originid, responsible, datedue, status, typ, params, message) FROM stdin;
\.


--
-- Data for Name: reminders_responsible_link; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY reminders_responsible_link (id, lastupdate, deleted, reminderid, responsibleid) FROM stdin;
\.


--
-- Data for Name: rezepte; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY rezepte (id, lastupdate, deleted, patientid, mandantid, briefid, datum, rptxt, rpzusatz) FROM stdin;
\.


--
-- Data for Name: right_; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY right_ (id, lastupdate, deleted, log_execution, name, parentid, i18n_name) FROM stdin;
root	\N	0	\N	root		\N
b373c30e3705866	1456819544575	0	\N	Leistungen	root	Leistungen
c19734cdf2ca2b8	1456819540917	0	\N	AccountingGlobal	root	Globales Verrechnen
44ef3f0a713e16	1456819540984	0	\N	read	c19734cdf2ca2b8	lesen
1c18d2a479a16ccc	1456819544742	0	\N	Laborparamter vereinen	166c5fbe9a622f	Laborparameter vereinen
166c5fbe9a622f	1456819541234	0	\N	Admin	root	Administration
b57e2605144d75df	1456819541267	0	\N	Reminders	166c5fbe9a622f	Reminders
5f0b9757dcf1ee5	1456819544909	0	\N	Patient	1760d3cd767660	main::Patient
296862557663050	1456819541417	0	\N	createBills	c19734cdf2ca2b8	Rnn_ erstellen
a8696d8a30864f87	1456819541700	0	\N	Aktionen	root	Aktionen
fd1b0cc8a25af715	1456819545075	0	\N	Script	root	Script
9e43a6d32fe6061	1456819541859	0	\N	Rechnungen	root	Rechnungen
710051961b7bc441	1456819545242	0	\N	Beenden	a8696d8a30864f87	beenden
13d8771beb1b	1456819542200	0	\N	Fall	root	main::Fall
9797c8ed2540cd06	1456819542294	0	\N	Specials	13d8771beb1b	Fall-Spezialfelder in der Fall-View
1a463ca163308abe	1456819542358	0	\N	Define_specials	9797c8ed2540cd06	Definieren von Spezialfeldern im Abrechnungssystem
371a57e8a0eb3	1456819545409	0	\N	Über	a8696d8a30864f87	über
79d3a17fc74f5	1456819542508	0	\N	copy	13d8771beb1b	kopieren
199c713ed089b6a	1456819545600	0	\N	Hilfe	a8696d8a30864f87	Hilfe
dc5c457d83e95ed7	1456819542750	0	\N	Löschen	root	Löschen
df86da724914fac	1456819542817	0	\N	Dauermedikation	dc5c457d83e95ed7	Dauermedikation
1567e02bbaf5e8c5	1456819542983	0	\N	Laborwerte	dc5c457d83e95ed7	Laborwerte
1627eaa2f9d37bba	1456819545767	0	\N	Anmelden	a8696d8a30864f87	Anmelden
ca488f5331595492	1456819543208	0	\N	Dokumente	root	Dokumente
5e856339cbdd1b04	1456819543258	0	\N	create	ca488f5331595492	erstellen
9d3df572d800dd93	1456819545925	0	\N	LoadInfoStore	root	LoadInfoStore
185e66bcd74ca01a	1456819543450	0	\N	createCategory	ca488f5331595492	Kategorie erstellen
5c2f42e3bfab5a55	1456819543658	0	\N	delete	ca488f5331595492	Löschen
99a9748ac3d87e0	1456819546092	0	\N	AlleVerrechnen	b373c30e3705866	Für alle Mandanten verrechnen
15101375d93a134a	1456819543825	0	\N	Systemvorlagen ändern	ca488f5331595492	Systemvorlagen ändern
4b504fdd0f26593b	1456819543992	0	\N	Vorlagen ändern	ca488f5331595492	Vorlagen ändern
103a6569184c75dc	1456819546233	0	\N	Verrechnen	b373c30e3705866	verrechnen
1760d3cd767660	1456819544208	0	\N	Daten	root	Daten
5e8504baa3ccbb00	1456819544267	0	\N	Kontakt	1760d3cd767660	Kontakt
11629a6a36aa66c2	1456819546383	0	\N	Anwender	1760d3cd767660	Anwender
19e98dde2b1a45f	1456819544417	0	\N	Konsultation	root	main::Konsultation
11d2973c44cdd88c3	1456819546608	0	\N	Mandant	1760d3cd767660	Mandant
7e4592d8c3c785f	1456819546901	0	\N	Konsultation	166c5fbe9a622f	main::Konsultation
52fa258a537e15ab	1456819546958	0	\N	change_billed	7e4592d8c3c785f	Verrechnete ändern
c91c6da890975fa3	1456819547142	0	\N	Zugriff	166c5fbe9a622f	Zugriff
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY role (id, lastupdate, deleted, extinfo, issystemrole) FROM stdin;
user	\N	0	\N	1
user_external	\N	0	\N	1
executive_doctor	\N	0	\N	1
doctor	\N	0	\N	1
assistant	\N	0	\N	1
patient	\N	0	\N	1
\.


--
-- Data for Name: role_right_joint; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY role_right_joint (id, lastupdate, deleted, role_id) FROM stdin;
44ef3f0a713e16	\N	0	user
b57e2605144d75df	\N	0	user
296862557663050	\N	0	user
a8696d8a30864f87	\N	0	user
9e43a6d32fe6061	\N	0	user
1a463ca163308abe	\N	0	user
79d3a17fc74f5	\N	0	user
df86da724914fac	\N	0	user
1567e02bbaf5e8c5	\N	0	user
5e856339cbdd1b04	\N	0	user
185e66bcd74ca01a	\N	0	user
5c2f42e3bfab5a55	\N	0	user
15101375d93a134a	\N	0	user
4b504fdd0f26593b	\N	0	user
5e8504baa3ccbb00	\N	0	user
19e98dde2b1a45f	\N	0	user
b373c30e3705866	\N	0	user
1c18d2a479a16ccc	\N	0	user
5f0b9757dcf1ee5	\N	0	user
fd1b0cc8a25af715	\N	0	user
710051961b7bc441	\N	0	user
371a57e8a0eb3	\N	0	user
199c713ed089b6a	\N	0	user
1627eaa2f9d37bba	\N	0	user
9d3df572d800dd93	\N	0	user
99a9748ac3d87e0	\N	0	assistant
103a6569184c75dc	\N	0	assistant
11629a6a36aa66c2	\N	0	doctor
11d2973c44cdd88c3	\N	0	doctor
52fa258a537e15ab	\N	0	doctor
c91c6da890975fa3	\N	0	executive_doctor
\.


--
-- Data for Name: tarmed; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY tarmed (id, lastupdate, deleted, parent, digniquanti, digniquali, sparte, gueltigvon, gueltigbis, nickname, tx255, code) FROM stdin;
Version	1461310399286	0	\N	\N	\N	\N	\N	\N	1.2.0	\N	\N
\.


--
-- Data for Name: tarmed_daten; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY tarmed_daten (parameter, datumvon, datumbis, wert) FROM stdin;
\.


--
-- Data for Name: tarmed_definitionen; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY tarmed_definitionen (spalte, kuerzel, titel) FROM stdin;
\.


--
-- Data for Name: tarmed_extension; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY tarmed_extension (code, limits, med_interpret, tech_interpret) FROM stdin;
\.


--
-- Data for Name: traces; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY traces (logtime, workstation, username, action) FROM stdin;
\.


--
-- Data for Name: user_; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY user_ (id, deleted, kontakt_id, lastupdate, hashed_password, salt, is_active, is_administrator, keystore, extinfo) FROM stdin;
Administrator	0	ede8f37c868a58d7b02	1456819540542	b94a0b6fc7be97e0a1585ac85e814d3852668968	1254bb9a05856b9e	1	1	\N	\N
007	0	U6caae135e5776d8042	1456819734104	8831ae6add9a27c6735616293ca78e80f7c27a6e	f80953430e5a220b	1	0	\N	\N
\.


--
-- Data for Name: user_role_joint; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY user_role_joint (id, lastupdate, deleted, user_id) FROM stdin;
user	\N	0	007
executive_doctor	\N	0	007
\.


--
-- Data for Name: userconfig; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY userconfig (lastupdate, userid, param, value) FROM stdin;
\.


--
-- Data for Name: vk_preise; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY vk_preise (typ, id, lastupdate, datum_von, datum_bis, multiplikator) FROM stdin;
\.


--
-- Data for Name: xid; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY xid (id, lastupdate, deleted, type, object, domain, domain_id, quality) FROM stdin;
\.


--
-- Data for Name: zahlungen; Type: TABLE DATA; Schema: public; Owner: elexistest
--

COPY zahlungen (id, lastupdate, deleted, rechnungsid, betrag, datum, bemerkung) FROM stdin;
\.


--
-- Name: artikel_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY artikel
    ADD CONSTRAINT artikel_pkey PRIMARY KEY (id);


--
-- Name: at_medevit_elexis_loinc_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY at_medevit_elexis_loinc
    ADD CONSTRAINT at_medevit_elexis_loinc_pkey PRIMARY KEY (id);


--
-- Name: auf_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY auf
    ADD CONSTRAINT auf_pkey PRIMARY KEY (id);


--
-- Name: bbs_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY bbs
    ADD CONSTRAINT bbs_pkey PRIMARY KEY (id);


--
-- Name: behandlungen_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY behandlungen
    ADD CONSTRAINT behandlungen_pkey PRIMARY KEY (id);


--
-- Name: behdl_dg_joint_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY behdl_dg_joint
    ADD CONSTRAINT behdl_dg_joint_pkey PRIMARY KEY (id);


--
-- Name: briefe_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY briefe
    ADD CONSTRAINT briefe_pkey PRIMARY KEY (id);


--
-- Name: ch_elexis_arzttarife_ch_physio_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY ch_elexis_arzttarife_ch_physio
    ADD CONSTRAINT ch_elexis_arzttarife_ch_physio_pkey PRIMARY KEY (id);


--
-- Name: ch_elexis_eigendiagnosen_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY ch_elexis_eigendiagnosen
    ADD CONSTRAINT ch_elexis_eigendiagnosen_pkey PRIMARY KEY (id);


--
-- Name: ch_elexis_icpc_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY ch_elexis_icpc
    ADD CONSTRAINT ch_elexis_icpc_pkey PRIMARY KEY (id);


--
-- Name: ch_elexis_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY ch_elexis_messages
    ADD CONSTRAINT ch_elexis_messages_pkey PRIMARY KEY (id);


--
-- Name: ch_elexis_privatrechnung_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY ch_elexis_privatrechnung
    ADD CONSTRAINT ch_elexis_privatrechnung_pkey PRIMARY KEY (id);


--
-- Name: config_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY config
    ADD CONSTRAINT config_pkey PRIMARY KEY (param);


--
-- Name: dbimage_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY dbimage
    ADD CONSTRAINT dbimage_pkey PRIMARY KEY (id);


--
-- Name: diagnosen_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY diagnosen
    ADD CONSTRAINT diagnosen_pkey PRIMARY KEY (id);


--
-- Name: eigenleistungen_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY eigenleistungen
    ADD CONSTRAINT eigenleistungen_pkey PRIMARY KEY (id);


--
-- Name: etiketten_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY etiketten
    ADD CONSTRAINT etiketten_pkey PRIMARY KEY (id);


--
-- Name: faelle_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY faelle
    ADD CONSTRAINT faelle_pkey PRIMARY KEY (id);


--
-- Name: heap2_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY heap2
    ADD CONSTRAINT heap2_pkey PRIMARY KEY (id);


--
-- Name: heap_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY heap
    ADD CONSTRAINT heap_pkey PRIMARY KEY (id);


--
-- Name: iatrix_problem_behdl_joint_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY iatrix_problem_behdl_joint
    ADD CONSTRAINT iatrix_problem_behdl_joint_pkey PRIMARY KEY (id);


--
-- Name: iatrix_problem_dauermedikation_joint_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY iatrix_problem_dauermedikation_joint
    ADD CONSTRAINT iatrix_problem_dauermedikation_joint_pkey PRIMARY KEY (id);


--
-- Name: iatrix_problem_dg_joint_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY iatrix_problem_dg_joint
    ADD CONSTRAINT iatrix_problem_dg_joint_pkey PRIMARY KEY (id);


--
-- Name: icd10_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY icd10
    ADD CONSTRAINT icd10_pkey PRIMARY KEY (id);


--
-- Name: kontakt_adress_joint_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY kontakt_adress_joint
    ADD CONSTRAINT kontakt_adress_joint_pkey PRIMARY KEY (id);


--
-- Name: kontakt_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY kontakt
    ADD CONSTRAINT kontakt_pkey PRIMARY KEY (id);


--
-- Name: konto_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY konto
    ADD CONSTRAINT konto_pkey PRIMARY KEY (id);


--
-- Name: labgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY labgroups
    ADD CONSTRAINT labgroups_pkey PRIMARY KEY (id);


--
-- Name: laboritems_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY laboritems
    ADD CONSTRAINT laboritems_pkey PRIMARY KEY (id);


--
-- Name: laborwerte_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY laborwerte
    ADD CONSTRAINT laborwerte_pkey PRIMARY KEY (id);


--
-- Name: leistungen_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY leistungen
    ADD CONSTRAINT leistungen_pkey PRIMARY KEY (id);


--
-- Name: leistungsblock_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY leistungsblock
    ADD CONSTRAINT leistungsblock_pkey PRIMARY KEY (id);


--
-- Name: logs_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: output_log_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY output_log
    ADD CONSTRAINT output_log_pkey PRIMARY KEY (id);


--
-- Name: patient_artikel_joint_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY patient_artikel_joint
    ADD CONSTRAINT patient_artikel_joint_pkey PRIMARY KEY (id);


--
-- Name: rechnungen_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY rechnungen
    ADD CONSTRAINT rechnungen_pkey PRIMARY KEY (id);


--
-- Name: reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY reminders
    ADD CONSTRAINT reminders_pkey PRIMARY KEY (id);


--
-- Name: reminders_responsible_link_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY reminders_responsible_link
    ADD CONSTRAINT reminders_responsible_link_pkey PRIMARY KEY (id);


--
-- Name: rezepte_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY rezepte
    ADD CONSTRAINT rezepte_pkey PRIMARY KEY (id);


--
-- Name: right__pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY right_
    ADD CONSTRAINT right__pkey PRIMARY KEY (id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: role_right_joint_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY role_right_joint
    ADD CONSTRAINT role_right_joint_pkey PRIMARY KEY (id, role_id);


--
-- Name: user__pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY user_
    ADD CONSTRAINT user__pkey PRIMARY KEY (id);


--
-- Name: user_role_joint_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY user_role_joint
    ADD CONSTRAINT user_role_joint_pkey PRIMARY KEY (id, user_id);


--
-- Name: xid_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY xid
    ADD CONSTRAINT xid_pkey PRIMARY KEY (id);


--
-- Name: zahlungen_pkey; Type: CONSTRAINT; Schema: public; Owner: elexistest; Tablespace: 
--

ALTER TABLE ONLY zahlungen
    ADD CONSTRAINT zahlungen_pkey PRIMARY KEY (id);


--
-- Name: aij1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX aij1 ON kontakt_adress_joint USING btree (myid);


--
-- Name: art1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX art1 ON artikel USING btree (subid);


--
-- Name: art2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX art2 ON artikel USING btree (typ);


--
-- Name: art3; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX art3 ON artikel USING btree (codeclass);


--
-- Name: auf1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX auf1 ON auf USING btree (patientid);


--
-- Name: bal_i1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX bal_i1 ON output_log USING btree (objectid);


--
-- Name: bbs1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX bbs1 ON bbs USING btree (reference);


--
-- Name: bdg1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX bdg1 ON behdl_dg_joint USING btree (behandlungsid);


--
-- Name: block1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX block1 ON leistungsblock USING btree (name);


--
-- Name: block2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX block2 ON leistungsblock USING btree (mandantid);


--
-- Name: block3; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX block3 ON leistungsblock USING btree (macro);


--
-- Name: ch_elexis_eigendiagnosen_idx1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX ch_elexis_eigendiagnosen_idx1 ON ch_elexis_eigendiagnosen USING btree (parent, code);


--
-- Name: ch_elexis_icpc_encounter1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX ch_elexis_icpc_encounter1 ON ch_elexis_icpc_encounter USING btree (kons);


--
-- Name: ch_elexis_icpc_encounter2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX ch_elexis_icpc_encounter2 ON ch_elexis_icpc_encounter USING btree (episode);


--
-- Name: ch_elexis_icpc_episodes1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX ch_elexis_icpc_episodes1 ON ch_elexis_icpc_episodes USING btree (patientid);


--
-- Name: ch_elexis_icpc_idx1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX ch_elexis_icpc_idx1 ON ch_elexis_icpc USING btree (component);


--
-- Name: cheacp; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX cheacp ON ch_elexis_arzttarife_ch_physio USING btree (ziffer);


--
-- Name: chelpr_idx1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX chelpr_idx1 ON ch_elexis_privatrechnung USING btree (parent, name);


--
-- Name: chelpr_idx2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX chelpr_idx2 ON ch_elexis_privatrechnung USING btree (valid_from);


--
-- Name: dbimage1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX dbimage1 ON dbimage USING btree (title);


--
-- Name: dg1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX dg1 ON diagnosen USING btree (klasse, dg_code);


--
-- Name: ekp1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX ekp1 ON ek_preise USING btree (typ);


--
-- Name: ekp2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX ekp2 ON ek_preise USING btree (datum_von);


--
-- Name: eol1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX eol1 ON etiketten_objclass_link USING btree (objclass);


--
-- Name: etikette1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX etikette1 ON etiketten USING btree (name);


--
-- Name: etikette2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX etikette2 ON etiketten_object_link USING btree (obj);


--
-- Name: etikette3; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX etikette3 ON etiketten_object_link USING btree (etikette);


--
-- Name: i3; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX i3 ON faelle USING btree (patientid);


--
-- Name: i4; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX i4 ON behandlungen USING btree (fallid);


--
-- Name: i5; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX i5 ON artikel USING btree (name);


--
-- Name: i8; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX i8 ON briefe USING btree (behandlungsid);


--
-- Name: icd1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX icd1 ON icd10 USING btree (parent);


--
-- Name: icd2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX icd2 ON icd10 USING btree (icdcode);


--
-- Name: k0; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX k0 ON kontakt USING btree (bezeichnung1);


--
-- Name: konto1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX konto1 ON konto USING btree (datum);


--
-- Name: konto2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX konto2 ON konto USING btree (patientid);


--
-- Name: labit1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX labit1 ON laboritems USING btree (kuerzel);


--
-- Name: labit2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX labit2 ON laboritems USING btree (laborid);


--
-- Name: labor1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX labor1 ON laborwerte USING btree (patientid);


--
-- Name: labor2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX labor2 ON laborwerte USING btree (datum);


--
-- Name: labor3; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX labor3 ON laborwerte USING btree (itemid);


--
-- Name: loinc1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX loinc1 ON at_medevit_elexis_loinc USING btree (code);


--
-- Name: lst1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX lst1 ON leistungen USING btree (behandlung);


--
-- Name: lst2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX lst2 ON leistungen USING btree (klasse, leistg_code);


--
-- Name: paj1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX paj1 ON patient_artikel_joint USING btree (patientid);


--
-- Name: paj2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX paj2 ON patient_artikel_joint USING btree (rezeptid);


--
-- Name: problembehdl1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX problembehdl1 ON iatrix_problem_behdl_joint USING btree (problemid);


--
-- Name: problemdauermedikation1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX problemdauermedikation1 ON iatrix_problem_dauermedikation_joint USING btree (problemid);


--
-- Name: problemdg1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX problemdg1 ON iatrix_problem_dg_joint USING btree (problemid);


--
-- Name: rem1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX rem1 ON reminders USING btree (identid);


--
-- Name: rem2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX rem2 ON reminders USING btree (datedue);


--
-- Name: rem3; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX rem3 ON reminders USING btree (responsible);


--
-- Name: rn1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX rn1 ON rechnungen USING btree (fallid);


--
-- Name: rn2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX rn2 ON rechnungen USING btree (mandantid);


--
-- Name: rn3; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX rn3 ON rechnungen USING btree (rnstatus);


--
-- Name: rn4; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX rn4 ON rechnungen USING btree (rndatumvon);


--
-- Name: rn5; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX rn5 ON rechnungen USING btree (rndatumbis);


--
-- Name: rp1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX rp1 ON rezepte USING btree (patientid);


--
-- Name: rrl1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX rrl1 ON reminders_responsible_link USING btree (reminderid);


--
-- Name: rrl2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX rrl2 ON reminders_responsible_link USING btree (responsibleid);


--
-- Name: tarmed2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX tarmed2 ON tarmed USING btree (parent);


--
-- Name: tarmed3; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX tarmed3 ON tarmed_definitionen USING btree (spalte);


--
-- Name: tarmed4; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX tarmed4 ON tarmed_extension USING btree (code);


--
-- Name: tarmed5; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX tarmed5 ON tarmed_daten USING btree (parameter);


--
-- Name: tarmed_id; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX tarmed_id ON tarmed USING btree (id);


--
-- Name: trace1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX trace1 ON traces USING btree (logtime);


--
-- Name: trace2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX trace2 ON traces USING btree (username);


--
-- Name: ucfg; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX ucfg ON userconfig USING btree (param);


--
-- Name: ucfg2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX ucfg2 ON userconfig USING btree (userid);


--
-- Name: vkp1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX vkp1 ON vk_preise USING btree (typ);


--
-- Name: vkp2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX vkp2 ON vk_preise USING btree (datum_von);


--
-- Name: xididx1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX xididx1 ON xid USING btree (domain);


--
-- Name: xididx2; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX xididx2 ON xid USING btree (domain_id);


--
-- Name: xididx3; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX xididx3 ON xid USING btree (object);


--
-- Name: zahl1; Type: INDEX; Schema: public; Owner: elexistest; Tablespace: 
--

CREATE INDEX zahl1 ON zahlungen USING btree (rechnungsid);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

