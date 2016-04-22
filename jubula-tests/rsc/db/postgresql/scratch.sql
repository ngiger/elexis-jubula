--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
DROP INDEX public.paj2;
DROP INDEX public.paj1;
DROP INDEX public.lst2;
DROP INDEX public.lst1;
DROP INDEX public.labor3;
DROP INDEX public.labor2;
DROP INDEX public.labor1;
DROP INDEX public.labit2;
DROP INDEX public.labit1;
DROP INDEX public.konto2;
DROP INDEX public.konto1;
DROP INDEX public.k0;
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
ALTER TABLE ONLY public.heap DROP CONSTRAINT heap_pkey;
ALTER TABLE ONLY public.heap2 DROP CONSTRAINT heap2_pkey;
ALTER TABLE ONLY public.faelle DROP CONSTRAINT faelle_pkey;
ALTER TABLE ONLY public.etiketten DROP CONSTRAINT etiketten_pkey;
ALTER TABLE ONLY public.eigenleistungen DROP CONSTRAINT eigenleistungen_pkey;
ALTER TABLE ONLY public.diagnosen DROP CONSTRAINT diagnosen_pkey;
ALTER TABLE ONLY public.dbimage DROP CONSTRAINT dbimage_pkey;
ALTER TABLE ONLY public.config DROP CONSTRAINT config_pkey;
ALTER TABLE ONLY public.briefe DROP CONSTRAINT briefe_pkey;
ALTER TABLE ONLY public.behdl_dg_joint DROP CONSTRAINT behdl_dg_joint_pkey;
ALTER TABLE ONLY public.behandlungen DROP CONSTRAINT behandlungen_pkey;
ALTER TABLE ONLY public.bbs DROP CONSTRAINT bbs_pkey;
ALTER TABLE ONLY public.auf DROP CONSTRAINT auf_pkey;
ALTER TABLE ONLY public.artikel DROP CONSTRAINT artikel_pkey;
DROP TABLE public.zahlungen;
DROP TABLE public.xid;
DROP TABLE public.vk_preise;
DROP TABLE public.userconfig;
DROP TABLE public.traces;
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
DROP TABLE public.briefe;
DROP TABLE public.behdl_dg_joint;
DROP TABLE public.behandlungen;
DROP TABLE public.bbs;
DROP TABLE public.auf;
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
-- Name: artikel; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE artikel OWNER TO elexis;

--
-- Name: artikel_details; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE artikel_details (
    article_id character varying(25),
    notes text,
    image bytea
);


ALTER TABLE artikel_details OWNER TO elexis;

--
-- Name: auf; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE auf OWNER TO elexis;

--
-- Name: bbs; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE bbs OWNER TO elexis;

--
-- Name: behandlungen; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE behandlungen OWNER TO elexis;

--
-- Name: behdl_dg_joint; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE behdl_dg_joint (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    behandlungsid character varying(25),
    diagnoseid character varying(25)
);


ALTER TABLE behdl_dg_joint OWNER TO elexis;

--
-- Name: briefe; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE briefe OWNER TO elexis;

--
-- Name: config; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE config (
    lastupdate bigint,
    param character varying(80) NOT NULL,
    wert text
);


ALTER TABLE config OWNER TO elexis;

--
-- Name: dbimage; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE dbimage OWNER TO elexis;

--
-- Name: diagnosen; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE diagnosen (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    dg_txt character varying(255),
    dg_code character varying(25),
    klasse character varying(80)
);


ALTER TABLE diagnosen OWNER TO elexis;

--
-- Name: eigenleistungen; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE eigenleistungen OWNER TO elexis;

--
-- Name: ek_preise; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE ek_preise (
    typ character varying(80),
    id character varying(25),
    lastupdate bigint,
    datum_von character(8),
    datum_bis character(8),
    multiplikator character(8)
);


ALTER TABLE ek_preise OWNER TO elexis;

--
-- Name: etiketten; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE etiketten OWNER TO elexis;

--
-- Name: etiketten_objclass_link; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE etiketten_objclass_link (
    objclass character varying(80),
    sticker character varying(25)
);


ALTER TABLE etiketten_objclass_link OWNER TO elexis;

--
-- Name: etiketten_object_link; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE etiketten_object_link (
    lastupdate bigint,
    obj character varying(25),
    etikette character varying(25)
);


ALTER TABLE etiketten_object_link OWNER TO elexis;

--
-- Name: faelle; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE faelle OWNER TO elexis;

--
-- Name: heap; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE heap (
    id character varying(80) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    inhalt bytea,
    datum character(8)
);


ALTER TABLE heap OWNER TO elexis;

--
-- Name: heap2; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE heap2 (
    id character varying(80) NOT NULL,
    deleted character(1) DEFAULT '0'::bpchar,
    datum character(8),
    lastupdate bigint,
    contents bytea
);


ALTER TABLE heap2 OWNER TO elexis;

--
-- Name: kontakt; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE kontakt OWNER TO elexis;

--
-- Name: kontakt_adress_joint; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE kontakt_adress_joint OWNER TO elexis;

--
-- Name: konto; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE konto OWNER TO elexis;

--
-- Name: labgroup_item_joint; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE labgroup_item_joint (
    lastupdate bigint,
    groupid character varying(25),
    itemid character varying(25),
    comment text
);


ALTER TABLE labgroup_item_joint OWNER TO elexis;

--
-- Name: labgroups; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE labgroups (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    name character varying(30)
);


ALTER TABLE labgroups OWNER TO elexis;

--
-- Name: laboritems; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE laboritems OWNER TO elexis;

--
-- Name: laborwerte; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE laborwerte OWNER TO elexis;

--
-- Name: leistungen; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE leistungen OWNER TO elexis;

--
-- Name: leistungsblock; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE leistungsblock OWNER TO elexis;

--
-- Name: logs; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE logs OWNER TO elexis;

--
-- Name: output_log; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE output_log OWNER TO elexis;

--
-- Name: patient_artikel_joint; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE patient_artikel_joint OWNER TO elexis;

--
-- Name: rechnungen; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE rechnungen OWNER TO elexis;

--
-- Name: reminders; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE reminders OWNER TO elexis;

--
-- Name: reminders_responsible_link; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE reminders_responsible_link (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    reminderid character varying(25),
    responsibleid character varying(25)
);


ALTER TABLE reminders_responsible_link OWNER TO elexis;

--
-- Name: rezepte; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE rezepte OWNER TO elexis;

--
-- Name: right_; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE right_ OWNER TO elexis;

--
-- Name: role; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE role (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT '0'::bpchar,
    extinfo bytea,
    issystemrole character(1) DEFAULT '0'::bpchar
);


ALTER TABLE role OWNER TO elexis;

--
-- Name: role_right_joint; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE role_right_joint (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT NULL::bpchar,
    role_id character varying(25) NOT NULL
);


ALTER TABLE role_right_joint OWNER TO elexis;

--
-- Name: rights_per_role; Type: VIEW; Schema: public; Owner: elexis
--

CREATE VIEW rights_per_role AS
 SELECT r.id AS role_id,
    ri.id AS right_id
   FROM ((role r
     LEFT JOIN role_right_joint rrj ON (((r.id)::text = (rrj.role_id)::text)))
     LEFT JOIN right_ ri ON (((rrj.id)::text = (ri.id)::text)))
  ORDER BY r.id;


ALTER TABLE rights_per_role OWNER TO elexis;

--
-- Name: user_; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE user_ OWNER TO elexis;

--
-- Name: user_role_joint; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE user_role_joint (
    id character varying(25) NOT NULL,
    lastupdate bigint,
    deleted character(1) DEFAULT NULL::bpchar,
    user_id character varying(25) NOT NULL
);


ALTER TABLE user_role_joint OWNER TO elexis;

--
-- Name: rights_per_user; Type: VIEW; Schema: public; Owner: elexis
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


ALTER TABLE rights_per_user OWNER TO elexis;

--
-- Name: traces; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE traces (
    logtime bigint,
    workstation character varying(40),
    username character varying(30),
    action text
);


ALTER TABLE traces OWNER TO elexis;

--
-- Name: userconfig; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE userconfig (
    lastupdate bigint,
    userid character varying(25),
    param character varying(80),
    value text
);


ALTER TABLE userconfig OWNER TO elexis;

--
-- Name: vk_preise; Type: TABLE; Schema: public; Owner: elexis
--

CREATE TABLE vk_preise (
    typ character varying(80),
    id character varying(25),
    lastupdate bigint,
    datum_von character(8),
    datum_bis character(8),
    multiplikator character(8)
);


ALTER TABLE vk_preise OWNER TO elexis;

--
-- Name: xid; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE xid OWNER TO elexis;

--
-- Name: zahlungen; Type: TABLE; Schema: public; Owner: elexis
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


ALTER TABLE zahlungen OWNER TO elexis;

--
-- Data for Name: artikel; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY artikel (id, lastupdate, deleted, ean, subid, lieferantid, klasse, name, name_intern, maxbestand, minbestand, istbestand, ek_preis, vk_preis, typ, codeclass, extid, lastimport, validfrom, validto, atc_code, extinfo) FROM stdin;
\.


--
-- Data for Name: artikel_details; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY artikel_details (article_id, notes, image) FROM stdin;
\.


--
-- Data for Name: auf; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY auf (id, lastupdate, deleted, patientid, fallid, briefid, prozent, datumauz, datumvon, datumbis, grund, aufzusatz) FROM stdin;
\.


--
-- Data for Name: bbs; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY bbs (id, lastupdate, deleted, reference, topic, date, "time", authorid, message) FROM stdin;
\.


--
-- Data for Name: behandlungen; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY behandlungen (id, lastupdate, deleted, fallid, mandantid, rechnungsid, datum, diagnosen, leistungen, eintrag) FROM stdin;
\.


--
-- Data for Name: behdl_dg_joint; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY behdl_dg_joint (id, lastupdate, deleted, behandlungsid, diagnoseid) FROM stdin;
\.


--
-- Data for Name: briefe; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY briefe (id, lastupdate, deleted, betreff, datum, modifiziert, gedruckt, geloescht, absenderid, destid, behandlungsid, patientid, typ, mimetype, path) FROM stdin;
\.


--
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY config (lastupdate, param, wert) FROM stdin;
\N	ablauf/Trace_default	none
\N	LocalXIDDomains	www.elexis.ch/xid/kontakt/lab/sendingfacility#2#Sendende Institution#ch.elexis.data.Labor,;www.xid.ch/id/ean#2#EAN#ch.elexis.data.Kontakt,;www.elexis.ch/xid#5#UUID#ch.elexis.data.PersistentObject,;www.xid.ch/id/oid#7#OID#ch.elexis.data.PersistentObject,;www.elexis.ch/xid/kontakt/rolle#2#Rolle#;www.ahv.ch/xid#2#AHV#ch.elexis.data.Person,;www.elexis.ch/xid/kontakt/spez#2#Spezialität#ch.elexis.data.Person,;www.elexis.ch/xid/kontakt/kanton#2#Kanton#ch.elexis.data.Person,;www.elexis.ch/xid/kontakt/anrede#2#Anrede#ch.elexis.data.Person,;
\N	ElexisVersion	3.1.0
\N	dbversion	3.1.0
\N	created	01.03.2016, 09:05:40
\.


--
-- Data for Name: dbimage; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY dbimage (id, lastupdate, deleted, datum, prefix, title, bild) FROM stdin;
\.


--
-- Data for Name: diagnosen; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY diagnosen (id, lastupdate, deleted, dg_txt, dg_code, klasse) FROM stdin;
\.


--
-- Data for Name: eigenleistungen; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY eigenleistungen (id, lastupdate, deleted, code, bezeichnung, ek_preis, vk_preis, zeit) FROM stdin;
\.


--
-- Data for Name: ek_preise; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY ek_preise (typ, id, lastupdate, datum_von, datum_bis, multiplikator) FROM stdin;
\.


--
-- Data for Name: etiketten; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY etiketten (id, lastupdate, image, deleted, importance, name, foreground, background, classes) FROM stdin;
\.


--
-- Data for Name: etiketten_objclass_link; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY etiketten_objclass_link (objclass, sticker) FROM stdin;
\.


--
-- Data for Name: etiketten_object_link; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY etiketten_object_link (lastupdate, obj, etikette) FROM stdin;
\.


--
-- Data for Name: faelle; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY faelle (id, lastupdate, deleted, patientid, garantid, kostentrid, versnummer, fallnummer, betriebsnummer, diagnosen, datumvon, datumbis, bezeichnung, grund, gesetz, status, extinfo) FROM stdin;
\.


--
-- Data for Name: heap; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY heap (id, lastupdate, deleted, inhalt, datum) FROM stdin;
\.


--
-- Data for Name: heap2; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY heap2 (id, deleted, datum, lastupdate, contents) FROM stdin;
\.


--
-- Data for Name: kontakt; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY kontakt (id, lastupdate, deleted, istorganisation, istperson, istpatient, istanwender, istmandant, istlabor, land, geburtsdatum, geschlecht, titel, titelsuffix, bezeichnung1, bezeichnung2, bezeichnung3, strasse, plz, ort, telefon1, telefon2, fax, natelnr, email, website, gruppe, patientnr, anschrift, bemerkung, diagnosen, persanamnese, sysanamnese, famanamnese, risiken, allergien, extinfo) FROM stdin;
ede8f37c868a58d7b02	1456819540503	0	0	0	0	1	0	0	\N	\N	\N	\N	\N	Administrator	\N	Administrator	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
U6caae135e5776d8042	1456819734253	0	0	1	0	1	1	0	\N	\N	m	Dr. med.	\N	Bond	James	\N	10, Baker Street	9999	10, Baker Street	0061 555 55 55	\N	0061 555 55 56	\N	james@bond.invalid	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: kontakt_adress_joint; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY kontakt_adress_joint (id, lastupdate, deleted, myid, otherid, bezug, myrtype, otherrtype) FROM stdin;
\.


--
-- Data for Name: konto; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY konto (id, lastupdate, deleted, patientid, rechnungsid, zahlungsid, betrag, datum, bemerkung) FROM stdin;
\.


--
-- Data for Name: labgroup_item_joint; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY labgroup_item_joint (lastupdate, groupid, itemid, comment) FROM stdin;
\.


--
-- Data for Name: labgroups; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY labgroups (id, lastupdate, deleted, name) FROM stdin;
\.


--
-- Data for Name: laboritems; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY laboritems (id, lastupdate, deleted, kuerzel, titel, laborid, refmann, reffrauortx, einheit, typ, gruppe, prio, billingcode, export, loinccode, visible, digits, formula) FROM stdin;
\.


--
-- Data for Name: laborwerte; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY laborwerte (id, lastupdate, deleted, patientid, datum, zeit, itemid, resultat, flags, origin, unit, analysetime, observationtime, transmissiontime, refmale, reffemale, originid, kommentar, extinfo) FROM stdin;
\.


--
-- Data for Name: leistungen; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY leistungen (id, lastupdate, deleted, behandlung, leistg_txt, leistg_code, klasse, zahl, ek_kosten, vk_tp, vk_scale, vk_preis, scale, scale2, userid, detail) FROM stdin;
\.


--
-- Data for Name: leistungsblock; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY leistungsblock (id, lastupdate, deleted, mandantid, name, macro, leistungen) FROM stdin;
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY logs (id, lastupdate, deleted, oid, datum, typ, userid, station, extinfo) FROM stdin;
\.


--
-- Data for Name: output_log; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY output_log (id, lastupdate, deleted, objectid, objecttype, datum, outputter, extinfo) FROM stdin;
\.


--
-- Data for Name: patient_artikel_joint; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY patient_artikel_joint (id, lastupdate, deleted, patientid, artikelid, artikel, rezeptid, datefrom, dateuntil, dosis, anzahl, bemerkung, presctype, sortorder, prescdate, prescriptor, extinfo) FROM stdin;
\.


--
-- Data for Name: rechnungen; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY rechnungen (id, lastupdate, deleted, rnnummer, fallid, mandantid, rndatum, rnstatus, rndatumvon, rndatumbis, betrag, statusdatum, extinfo) FROM stdin;
\.


--
-- Data for Name: reminders; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY reminders (id, lastupdate, deleted, identid, originid, responsible, datedue, status, typ, params, message) FROM stdin;
\.


--
-- Data for Name: reminders_responsible_link; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY reminders_responsible_link (id, lastupdate, deleted, reminderid, responsibleid) FROM stdin;
\.


--
-- Data for Name: rezepte; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY rezepte (id, lastupdate, deleted, patientid, mandantid, briefid, datum, rptxt, rpzusatz) FROM stdin;
\.


--
-- Data for Name: right_; Type: TABLE DATA; Schema: public; Owner: elexis
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
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: elexis
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
-- Data for Name: role_right_joint; Type: TABLE DATA; Schema: public; Owner: elexis
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
-- Data for Name: traces; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY traces (logtime, workstation, username, action) FROM stdin;
\.


--
-- Data for Name: user_; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY user_ (id, deleted, kontakt_id, lastupdate, hashed_password, salt, is_active, is_administrator, keystore, extinfo) FROM stdin;
Administrator	0	ede8f37c868a58d7b02	1456819540542	b94a0b6fc7be97e0a1585ac85e814d3852668968	1254bb9a05856b9e	1	1	\N	\N
007	0	U6caae135e5776d8042	1456819734104	8831ae6add9a27c6735616293ca78e80f7c27a6e	f80953430e5a220b	1	0	\N	\N
\.


--
-- Data for Name: user_role_joint; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY user_role_joint (id, lastupdate, deleted, user_id) FROM stdin;
user	\N	0	007
executive_doctor	\N	0	007
\.


--
-- Data for Name: userconfig; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY userconfig (lastupdate, userid, param, value) FROM stdin;
\.


--
-- Data for Name: vk_preise; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY vk_preise (typ, id, lastupdate, datum_von, datum_bis, multiplikator) FROM stdin;
\.


--
-- Data for Name: xid; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY xid (id, lastupdate, deleted, type, object, domain, domain_id, quality) FROM stdin;
\.


--
-- Data for Name: zahlungen; Type: TABLE DATA; Schema: public; Owner: elexis
--

COPY zahlungen (id, lastupdate, deleted, rechnungsid, betrag, datum, bemerkung) FROM stdin;
\.


--
-- Name: artikel_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY artikel
    ADD CONSTRAINT artikel_pkey PRIMARY KEY (id);


--
-- Name: auf_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY auf
    ADD CONSTRAINT auf_pkey PRIMARY KEY (id);


--
-- Name: bbs_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY bbs
    ADD CONSTRAINT bbs_pkey PRIMARY KEY (id);


--
-- Name: behandlungen_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY behandlungen
    ADD CONSTRAINT behandlungen_pkey PRIMARY KEY (id);


--
-- Name: behdl_dg_joint_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY behdl_dg_joint
    ADD CONSTRAINT behdl_dg_joint_pkey PRIMARY KEY (id);


--
-- Name: briefe_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY briefe
    ADD CONSTRAINT briefe_pkey PRIMARY KEY (id);


--
-- Name: config_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY config
    ADD CONSTRAINT config_pkey PRIMARY KEY (param);


--
-- Name: dbimage_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY dbimage
    ADD CONSTRAINT dbimage_pkey PRIMARY KEY (id);


--
-- Name: diagnosen_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY diagnosen
    ADD CONSTRAINT diagnosen_pkey PRIMARY KEY (id);


--
-- Name: eigenleistungen_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY eigenleistungen
    ADD CONSTRAINT eigenleistungen_pkey PRIMARY KEY (id);


--
-- Name: etiketten_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY etiketten
    ADD CONSTRAINT etiketten_pkey PRIMARY KEY (id);


--
-- Name: faelle_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY faelle
    ADD CONSTRAINT faelle_pkey PRIMARY KEY (id);


--
-- Name: heap2_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY heap2
    ADD CONSTRAINT heap2_pkey PRIMARY KEY (id);


--
-- Name: heap_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY heap
    ADD CONSTRAINT heap_pkey PRIMARY KEY (id);


--
-- Name: kontakt_adress_joint_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY kontakt_adress_joint
    ADD CONSTRAINT kontakt_adress_joint_pkey PRIMARY KEY (id);


--
-- Name: kontakt_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY kontakt
    ADD CONSTRAINT kontakt_pkey PRIMARY KEY (id);


--
-- Name: konto_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY konto
    ADD CONSTRAINT konto_pkey PRIMARY KEY (id);


--
-- Name: labgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY labgroups
    ADD CONSTRAINT labgroups_pkey PRIMARY KEY (id);


--
-- Name: laboritems_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY laboritems
    ADD CONSTRAINT laboritems_pkey PRIMARY KEY (id);


--
-- Name: laborwerte_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY laborwerte
    ADD CONSTRAINT laborwerte_pkey PRIMARY KEY (id);


--
-- Name: leistungen_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY leistungen
    ADD CONSTRAINT leistungen_pkey PRIMARY KEY (id);


--
-- Name: leistungsblock_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY leistungsblock
    ADD CONSTRAINT leistungsblock_pkey PRIMARY KEY (id);


--
-- Name: logs_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: output_log_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY output_log
    ADD CONSTRAINT output_log_pkey PRIMARY KEY (id);


--
-- Name: patient_artikel_joint_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY patient_artikel_joint
    ADD CONSTRAINT patient_artikel_joint_pkey PRIMARY KEY (id);


--
-- Name: rechnungen_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY rechnungen
    ADD CONSTRAINT rechnungen_pkey PRIMARY KEY (id);


--
-- Name: reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY reminders
    ADD CONSTRAINT reminders_pkey PRIMARY KEY (id);


--
-- Name: reminders_responsible_link_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY reminders_responsible_link
    ADD CONSTRAINT reminders_responsible_link_pkey PRIMARY KEY (id);


--
-- Name: rezepte_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY rezepte
    ADD CONSTRAINT rezepte_pkey PRIMARY KEY (id);


--
-- Name: right__pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY right_
    ADD CONSTRAINT right__pkey PRIMARY KEY (id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: role_right_joint_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY role_right_joint
    ADD CONSTRAINT role_right_joint_pkey PRIMARY KEY (id, role_id);


--
-- Name: user__pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY user_
    ADD CONSTRAINT user__pkey PRIMARY KEY (id);


--
-- Name: user_role_joint_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY user_role_joint
    ADD CONSTRAINT user_role_joint_pkey PRIMARY KEY (id, user_id);


--
-- Name: xid_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY xid
    ADD CONSTRAINT xid_pkey PRIMARY KEY (id);


--
-- Name: zahlungen_pkey; Type: CONSTRAINT; Schema: public; Owner: elexis
--

ALTER TABLE ONLY zahlungen
    ADD CONSTRAINT zahlungen_pkey PRIMARY KEY (id);


--
-- Name: aij1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX aij1 ON kontakt_adress_joint USING btree (myid);


--
-- Name: art1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX art1 ON artikel USING btree (subid);


--
-- Name: art2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX art2 ON artikel USING btree (typ);


--
-- Name: art3; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX art3 ON artikel USING btree (codeclass);


--
-- Name: auf1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX auf1 ON auf USING btree (patientid);


--
-- Name: bal_i1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX bal_i1 ON output_log USING btree (objectid);


--
-- Name: bbs1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX bbs1 ON bbs USING btree (reference);


--
-- Name: bdg1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX bdg1 ON behdl_dg_joint USING btree (behandlungsid);


--
-- Name: block1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX block1 ON leistungsblock USING btree (name);


--
-- Name: block2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX block2 ON leistungsblock USING btree (mandantid);


--
-- Name: block3; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX block3 ON leistungsblock USING btree (macro);


--
-- Name: dbimage1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX dbimage1 ON dbimage USING btree (title);


--
-- Name: dg1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX dg1 ON diagnosen USING btree (klasse, dg_code);


--
-- Name: ekp1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX ekp1 ON ek_preise USING btree (typ);


--
-- Name: ekp2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX ekp2 ON ek_preise USING btree (datum_von);


--
-- Name: eol1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX eol1 ON etiketten_objclass_link USING btree (objclass);


--
-- Name: etikette1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX etikette1 ON etiketten USING btree (name);


--
-- Name: etikette2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX etikette2 ON etiketten_object_link USING btree (obj);


--
-- Name: etikette3; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX etikette3 ON etiketten_object_link USING btree (etikette);


--
-- Name: i3; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX i3 ON faelle USING btree (patientid);


--
-- Name: i4; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX i4 ON behandlungen USING btree (fallid);


--
-- Name: i5; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX i5 ON artikel USING btree (name);


--
-- Name: i8; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX i8 ON briefe USING btree (behandlungsid);


--
-- Name: k0; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX k0 ON kontakt USING btree (bezeichnung1);


--
-- Name: konto1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX konto1 ON konto USING btree (datum);


--
-- Name: konto2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX konto2 ON konto USING btree (patientid);


--
-- Name: labit1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX labit1 ON laboritems USING btree (kuerzel);


--
-- Name: labit2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX labit2 ON laboritems USING btree (laborid);


--
-- Name: labor1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX labor1 ON laborwerte USING btree (patientid);


--
-- Name: labor2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX labor2 ON laborwerte USING btree (datum);


--
-- Name: labor3; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX labor3 ON laborwerte USING btree (itemid);


--
-- Name: lst1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX lst1 ON leistungen USING btree (behandlung);


--
-- Name: lst2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX lst2 ON leistungen USING btree (klasse, leistg_code);


--
-- Name: paj1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX paj1 ON patient_artikel_joint USING btree (patientid);


--
-- Name: paj2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX paj2 ON patient_artikel_joint USING btree (rezeptid);


--
-- Name: rem1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX rem1 ON reminders USING btree (identid);


--
-- Name: rem2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX rem2 ON reminders USING btree (datedue);


--
-- Name: rem3; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX rem3 ON reminders USING btree (responsible);


--
-- Name: rn1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX rn1 ON rechnungen USING btree (fallid);


--
-- Name: rn2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX rn2 ON rechnungen USING btree (mandantid);


--
-- Name: rn3; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX rn3 ON rechnungen USING btree (rnstatus);


--
-- Name: rn4; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX rn4 ON rechnungen USING btree (rndatumvon);


--
-- Name: rn5; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX rn5 ON rechnungen USING btree (rndatumbis);


--
-- Name: rp1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX rp1 ON rezepte USING btree (patientid);


--
-- Name: rrl1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX rrl1 ON reminders_responsible_link USING btree (reminderid);


--
-- Name: rrl2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX rrl2 ON reminders_responsible_link USING btree (responsibleid);


--
-- Name: trace1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX trace1 ON traces USING btree (logtime);


--
-- Name: trace2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX trace2 ON traces USING btree (username);


--
-- Name: ucfg; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX ucfg ON userconfig USING btree (param);


--
-- Name: ucfg2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX ucfg2 ON userconfig USING btree (userid);


--
-- Name: vkp1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX vkp1 ON vk_preise USING btree (typ);


--
-- Name: vkp2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX vkp2 ON vk_preise USING btree (datum_von);


--
-- Name: xididx1; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX xididx1 ON xid USING btree (domain);


--
-- Name: xididx2; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX xididx2 ON xid USING btree (domain_id);


--
-- Name: xididx3; Type: INDEX; Schema: public; Owner: elexis
--

CREATE INDEX xididx3 ON xid USING btree (object);


--
-- Name: zahl1; Type: INDEX; Schema: public; Owner: elexis
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

