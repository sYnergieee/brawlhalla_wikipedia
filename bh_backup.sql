--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2024-03-10 18:50:44

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
-- TOC entry 5 (class 2615 OID 38668)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 38670)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 38673)
-- Name: applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applications (
    id integer NOT NULL,
    text text NOT NULL,
    default_user_id integer
);


ALTER TABLE public.applications OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 38678)
-- Name: applications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.applications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.applications_id_seq OWNER TO postgres;

--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 216
-- Name: applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.applications_id_seq OWNED BY public.applications.id;


--
-- TOC entry 217 (class 1259 OID 38679)
-- Name: chest_skins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chest_skins (
    chest_id integer NOT NULL,
    skin_id integer NOT NULL
);


ALTER TABLE public.chest_skins OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 38682)
-- Name: chests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chests (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    img character varying(255) NOT NULL,
    cost integer NOT NULL
);


ALTER TABLE public.chests OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 38687)
-- Name: chests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chests_id_seq OWNER TO postgres;

--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 219
-- Name: chests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chests_id_seq OWNED BY public.chests.id;


--
-- TOC entry 220 (class 1259 OID 38688)
-- Name: event_skins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_skins (
    event_id integer NOT NULL,
    skin_id integer NOT NULL
);


ALTER TABLE public.event_skins OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 38691)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 38694)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 222
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 223 (class 1259 OID 38695)
-- Name: favourites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favourites (
    legend_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.favourites OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 38698)
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    token character varying(255) NOT NULL,
    owner_id integer,
    details json
);


ALTER TABLE public.files OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 38703)
-- Name: legend_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.legend_stats (
    stat_id integer NOT NULL,
    legend_id integer NOT NULL,
    value integer
);


ALTER TABLE public.legend_stats OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 38706)
-- Name: legends; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.legends (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    aka_name character varying(255) NOT NULL,
    description text NOT NULL,
    cost integer NOT NULL,
    img_main character varying(255) NOT NULL,
    img_short character varying(255) NOT NULL,
    release_info character varying(255) NOT NULL
);


ALTER TABLE public.legends OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 38711)
-- Name: legends_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.legends_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.legends_id_seq OWNER TO postgres;

--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 227
-- Name: legends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.legends_id_seq OWNED BY public.legends.id;


--
-- TOC entry 228 (class 1259 OID 38712)
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    review_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 38715)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    text text,
    mark integer,
    legend_id integer,
    user_id integer,
    type_id integer,
    date timestamp without time zone,
    change_date timestamp without time zone
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 38720)
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO postgres;

--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 230
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- TOC entry 231 (class 1259 OID 38721)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 38724)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 232
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 233 (class 1259 OID 38725)
-- Name: skins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skins (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    img character varying(255) NOT NULL,
    is_crossover boolean NOT NULL,
    is_exclusive boolean NOT NULL,
    cost integer,
    purshase_info character varying[],
    legend_id integer
);


ALTER TABLE public.skins OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 38730)
-- Name: skins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skins_id_seq OWNER TO postgres;

--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 234
-- Name: skins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skins_id_seq OWNED BY public.skins.id;


--
-- TOC entry 235 (class 1259 OID 38731)
-- Name: stat_imgs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stat_imgs (
    value integer NOT NULL,
    img character varying(255) NOT NULL
);


ALTER TABLE public.stat_imgs OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 38734)
-- Name: stat_imgs_value_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stat_imgs_value_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stat_imgs_value_seq OWNER TO postgres;

--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 236
-- Name: stat_imgs_value_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stat_imgs_value_seq OWNED BY public.stat_imgs.value;


--
-- TOC entry 237 (class 1259 OID 38735)
-- Name: stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stats (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    img character varying(255) NOT NULL
);


ALTER TABLE public.stats OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 38740)
-- Name: stats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stats_id_seq OWNER TO postgres;

--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 238
-- Name: stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stats_id_seq OWNED BY public.stats.id;


--
-- TOC entry 239 (class 1259 OID 38741)
-- Name: type_reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_reviews (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.type_reviews OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 38744)
-- Name: type_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_reviews_id_seq OWNER TO postgres;

--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 240
-- Name: type_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_reviews_id_seq OWNED BY public.type_reviews.id;


--
-- TOC entry 241 (class 1259 OID 38745)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    nickname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    password character varying(1024) NOT NULL,
    reg_date timestamp without time zone,
    telegram character varying(255),
    discord character varying(255),
    role_id integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 38750)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 242
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 243 (class 1259 OID 38751)
-- Name: weapon_legends; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weapon_legends (
    weapon_id integer NOT NULL,
    legend_id integer NOT NULL,
    img character varying(255),
    name character varying(255)
);


ALTER TABLE public.weapon_legends OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 38756)
-- Name: weapon_skins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weapon_skins (
    weapon_id integer NOT NULL,
    skin_id integer NOT NULL,
    img character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.weapon_skins OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 38761)
-- Name: weapons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weapons (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    img character varying(255) NOT NULL
);


ALTER TABLE public.weapons OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 38766)
-- Name: weapons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weapons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weapons_id_seq OWNER TO postgres;

--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 246
-- Name: weapons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weapons_id_seq OWNED BY public.weapons.id;


--
-- TOC entry 3264 (class 2604 OID 38767)
-- Name: applications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications ALTER COLUMN id SET DEFAULT nextval('public.applications_id_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 38768)
-- Name: chests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chests ALTER COLUMN id SET DEFAULT nextval('public.chests_id_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 38769)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 3267 (class 2604 OID 38770)
-- Name: legends id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legends ALTER COLUMN id SET DEFAULT nextval('public.legends_id_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 38771)
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 38772)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 38773)
-- Name: skins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skins ALTER COLUMN id SET DEFAULT nextval('public.skins_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 38774)
-- Name: stat_imgs value; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stat_imgs ALTER COLUMN value SET DEFAULT nextval('public.stat_imgs_value_seq'::regclass);


--
-- TOC entry 3272 (class 2604 OID 38775)
-- Name: stats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats ALTER COLUMN id SET DEFAULT nextval('public.stats_id_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 38776)
-- Name: type_reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_reviews ALTER COLUMN id SET DEFAULT nextval('public.type_reviews_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 38777)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 38778)
-- Name: weapons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapons ALTER COLUMN id SET DEFAULT nextval('public.weapons_id_seq'::regclass);


--
-- TOC entry 3488 (class 0 OID 38670)
-- Dependencies: 214
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
99155116a633
\.


--
-- TOC entry 3489 (class 0 OID 38673)
-- Dependencies: 215
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.applications (id, text, default_user_id) FROM stdin;
1	string	2
4	sss	6
5	sadsadas dsadasdas dasdsadasd asdsadasd adsadsadsa asdsadasdsa dasdsadasd asdsadsad asdasdasda dasdadasd asdasdasd asdasdasdas dsadad asdasd asdasdasdasd asas	6
7	s	2
\.


--
-- TOC entry 3491 (class 0 OID 38679)
-- Dependencies: 217
-- Data for Name: chest_skins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chest_skins (chest_id, skin_id) FROM stdin;
2	1
15	1
10	2
19	2
3	5
17	5
13	5
1	6
21	7
16	8
19	14
9	17
12	17
20	18
5	19
16	19
11	19
3	21
7	26
14	26
17	27
1	27
19	27
10	30
11	30
13	30
14	30
15	31
8	31
9	32
20	34
13	40
8	42
20	42
14	42
9	42
19	43
4	45
21	45
11	45
2	49
1	49
14	52
18	53
10	53
7	55
6	55
5	56
2	62
1	62
13	63
11	63
18	65
8	65
14	66
17	67
7	67
10	68
21	73
20	73
4	75
16	75
9	75
1	75
2	76
11	76
14	76
17	77
19	77
3	77
7	77
18	78
8	80
10	80
6	80
12	81
3	87
18	87
15	88
1	88
13	89
21	89
8	91
14	91
2	93
12	94
6	94
13	99
11	99
18	100
12	100
17	101
19	101
7	101
9	103
9	108
1	108
16	108
2	109
13	109
20	110
17	112
15	113
6	114
9	118
5	118
17	119
18	120
21	120
20	120
12	122
19	122
13	123
3	125
12	129
18	130
19	130
17	131
5	131
3	132
15	133
20	134
7	135
2	138
18	138
5	138
1	139
16	139
9	140
11	140
4	141
12	141
14	141
13	143
20	144
21	146
2	150
18	150
20	150
15	151
14	151
1	154
9	155
7	155
17	156
3	157
6	157
5	162
19	162
17	164
14	164
13	166
18	166
15	168
10	168
16	169
7	170
6	170
9	175
20	175
17	176
16	176
14	176
15	177
18	177
13	178
6	178
19	179
2	180
7	180
12	182
3	187
19	187
9	188
17	190
5	191
4	193
18	196
17	196
1	196
13	199
16	199
14	200
21	201
12	202
10	202
11	202
2	203
3	204
7	204
6	204
10	210
1	210
14	210
8	211
18	211
21	211
19	211
2	212
13	212
9	213
16	214
6	214
5	216
7	216
15	219
6	219
9	220
5	220
12	220
1	221
16	221
14	221
17	222
11	222
18	223
2	224
10	224
8	226
21	227
3	233
1	233
15	235
10	236
18	241
16	241
14	241
9	243
1	243
19	244
7	244
15	246
8	247
21	247
5	249
15	254
14	254
13	256
1	256
19	257
6	257
20	259
7	260
3	265
13	265
14	265
4	266
15	266
1	266
19	267
18	268
20	270
6	271
8	272
2	278
9	278
18	279
5	279
16	280
14	280
19	281
15	282
12	282
10	282
3	283
8	283
4	283
11	285
8	290
19	290
18	291
10	291
13	292
15	293
6	296
2	304
8	304
9	304
4	305
15	305
16	305
17	306
7	306
13	307
5	308
10	308
12	309
6	309
3	311
9	316
11	316
4	317
8	317
13	317
12	320
16	321
7	324
9	328
10	328
11	328
15	329
16	329
2	330
17	332
21	333
20	333
4	335
15	340
17	340
12	340
3	340
10	341
2	342
4	342
20	344
5	345
16	350
11	350
2	351
4	351
8	352
17	352
10	354
3	355
21	356
20	363
12	364
8	365
16	365
2	366
3	368
11	369
4	374
20	374
16	374
6	374
3	375
10	375
11	376
8	377
21	378
4	384
6	384
10	385
11	385
21	386
20	386
12	388
5	389
8	393
12	394
6	395
21	396
8	401
12	402
4	403
5	408
10	409
3	410
6	411
21	417
5	418
7	418
4	419
11	420
21	425
4	426
7	427
5	428
4	433
5	435
4	443
7	448
21	442
\.


--
-- TOC entry 3492 (class 0 OID 38682)
-- Dependencies: 218
-- Data for Name: chests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chests (id, name, img, cost) FROM stdin;
1	Odin's Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1b/Odin%27s_Chest.png/revision/latest/scale-to-width-down/250?cb=20190922065702	100
2	Wild Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/01/Wild_Chest.png/revision/latest/scale-to-width-down/250?cb=20210302064624	100
3	Elemental Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/99/Elemental_Chest.png/revision/latest/scale-to-width-down/250?cb=20210213061353	100
4	Revenant Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b6/Revenant_Chest.png/revision/latest/scale-to-width-down/185?cb=20210204020023	100
5	Exalted Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0a/Exalted_Chest.png/revision/latest/scale-to-width-down/200?cb=20180816211749	100
6	Olympian Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1a/Olympian_Chest.png/revision/latest/scale-to-width-down/250?cb=20210214014447	100
7	Forgeborne Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9a/Forgeborne_Chest.png/revision/latest/scale-to-width-down/250?cb=20210204003220	100
8	Celestial Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/59/Celestial_Chest.png/revision/latest/scale-to-width-down/190?cb=20210204031327	100
9	Skysail Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4a/Skysail_Chest.png/revision/latest/scale-to-width-down/198?cb=20190621001016	100
10	Ragnarok Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d8/Ragnarok_Chest.png/revision/latest/scale-to-width-down/250?cb=20210204034006	100
11	Royal Order Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c9/Royal_Order_Chest.png/revision/latest/scale-to-width-down/250?cb=20210214001555	100
12	Outlaw Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d9/Outlaw_Chest.png/revision/latest/scale-to-width-down/250?cb=20210302064735	100
13	Sunken Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c9/Sunken_Chest.png/revision/latest/scale-to-width-down/229?cb=20190606011529	100
14	Ancient Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b8/Ancient_Chest.png/revision/latest/scale-to-width-down/240?cb=20210209201902	100
15	Dragon's Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/18/Dragon%27s_Chest.png/revision/latest/scale-to-width-down/192?cb=20210204203421	100
16	Forbidden Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4c/Forbidden_Chest.png/revision/latest/scale-to-width-down/181?cb=20210219200908	100
17	Sandstorm Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/36/Sandstorm_Chest.png/revision/latest/scale-to-width-down/156?cb=20210204191959	100
18	Imperial Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d0/Imperial_Chest.png/revision/latest/scale-to-width-down/250?cb=20210205212352	100
19	Cosmic Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b6/Cosmic_Chest.png/revision/latest/scale-to-width-down/250?cb=20200830013515	100
20	Brawl City Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f8/Brawl_City_Chest.png/revision/latest/scale-to-width-down/250?cb=20210302064716	100
21	Synthwave Chest	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/98/Synthwave_Chest.png/revision/latest/scale-to-width-down/250?cb=20210204025336	100
\.


--
-- TOC entry 3494 (class 0 OID 38688)
-- Dependencies: 220
-- Data for Name: event_skins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_skins (event_id, skin_id) FROM stdin;
16	9
15	12
16	23
12	33
14	47
12	48
13	57
16	60
9	64
12	72
9	79
15	84
9	90
15	97
13	102
11	107
16	111
13	116
14	124
9	126
10	137
13	142
9	145
12	148
16	152
14	160
9	165
14	181
13	183
9	192
16	198
12	217
14	225
10	231
10	237
13	240
13	245
12	248
10	262
16	269
9	274
15	276
16	286
16	295
9	302
10	310
13	312
16	313
16	319
12	322
9	331
13	337
14	339
12	343
16	348
15	349
12	353
14	361
13	367
9	372
16	379
13	382
13	387
16	392
10	397
14	404
11	406
14	412
9	415
12	421
10	423
10	429
14	432
14	436
11	438
9	444
12	446
13	450
13	456
9	457
14	463
12	469
13	476
12	479
12	486
9	487
9	491
14	492
16	497
13	499
11	503
16	505
14	511
11	516
11	520
12	526
19	560
19	561
19	562
13	566
13	567
\.


--
-- TOC entry 3495 (class 0 OID 38691)
-- Dependencies: 221
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, name) FROM stdin;
9	Valhallentine's
10	Luck o' the Brawl
11	Bloomhalla
12	Heatwave
13	Brawlhalloween
14	Back to School
15	Anniversary
16	Brawlhallidays
19	SpongeBob SquarePants
\.


--
-- TOC entry 3497 (class 0 OID 38695)
-- Dependencies: 223
-- Data for Name: favourites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favourites (legend_id, user_id) FROM stdin;
4	2
5	2
27	9
47	9
42	5
4	5
2	5
\.


--
-- TOC entry 3498 (class 0 OID 38698)
-- Dependencies: 224
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (token, owner_id, details) FROM stdin;
502ae4b0a6c44d3a467045b9a8bcef641609c3a9fad906cf58447b5f2325a10f11b980488af6e55ee31b	\N	{"token": "502ae4b0a6c44d3a467045b9a8bcef641609c3a9fad906cf58447b5f2325a10f11b980488af6e55ee31b", "name": "46220cc5771158de680018309.png", "size": 15991, "originalFilename": "1710085065574.png", "createdAt": "2024-03-10T15:37:48.561Z", "mimeType": "image/png", "deleteToken": "1724e9bff0211a714d7a", "role_id": 1}
6643a5399701400a72deacac26b82a5eccc2617155a4986d395c597ba5cbfada7aa60b7492452892799e	\N	{"token": "6643a5399701400a72deacac26b82a5eccc2617155a4986d395c597ba5cbfada7aa60b7492452892799e", "name": "46220cc5771158de680018308.png", "size": 12571, "originalFilename": "1710084994954.png", "createdAt": "2024-03-10T15:36:38.034Z", "mimeType": "image/png", "deleteToken": "37aebab236c1c7b5430c", "role_id": 2}
\.


--
-- TOC entry 3499 (class 0 OID 38703)
-- Dependencies: 225
-- Data for Name: legend_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.legend_stats (stat_id, legend_id, value) FROM stdin;
4	1	7
3	1	3
2	1	5
1	1	7
4	2	4
3	2	6
2	2	6
1	2	6
4	3	6
3	3	4
2	3	8
1	3	4
4	4	5
3	4	8
2	4	4
1	4	5
4	5	6
3	5	3
2	5	7
1	5	6
4	6	5
3	6	4
2	6	7
1	6	6
4	7	4
3	7	5
2	7	7
1	7	6
4	8	9
3	8	4
2	8	5
1	8	4
4	9	5
3	9	6
2	9	7
1	9	4
4	10	6
3	10	4
2	10	4
1	10	8
4	11	7
3	11	5
2	11	5
1	11	5
4	12	6
3	12	7
2	12	3
1	12	6
4	13	3
3	13	5
2	13	6
1	13	8
4	14	6
3	14	8
2	14	4
1	14	4
4	15	5
3	15	5
2	15	8
1	15	4
4	16	7
3	16	7
2	16	3
1	16	5
4	17	6
3	17	5
2	17	5
1	17	6
4	18	5
3	18	6
2	18	6
1	18	5
4	19	6
3	19	6
2	19	3
1	19	7
4	20	7
3	20	5
2	20	4
1	20	6
4	21	7
3	21	5
2	21	6
1	21	4
4	22	4
3	22	7
2	22	4
1	22	7
4	23	7
3	23	4
2	23	4
1	23	7
4	24	6
3	24	4
2	24	7
1	24	5
4	25	5
3	25	4
2	25	6
1	25	7
4	26	5
3	26	4
2	26	9
1	26	4
4	27	7
3	27	7
2	27	4
1	27	4
4	28	6
3	28	7
2	28	4
1	28	5
4	29	4
3	29	6
2	29	4
1	29	8
4	30	8
3	30	5
2	30	5
1	30	4
4	31	5
3	31	6
2	31	5
1	31	6
4	32	5
3	32	5
2	32	4
1	32	8
4	33	7
3	33	4
2	33	8
1	33	3
4	34	5
3	34	5
2	34	5
1	34	7
4	35	8
3	35	4
2	35	4
1	35	6
4	36	4
3	36	7
2	36	6
1	36	5
4	37	5
3	37	6
2	37	4
1	37	7
4	38	4
3	38	6
2	38	3
1	38	9
4	39	4
3	39	8
2	39	4
1	39	6
4	40	5
3	40	4
2	40	8
1	40	5
4	41	8
3	41	3
2	41	6
1	41	5
4	42	5
3	42	7
2	42	5
1	42	5
4	43	6
3	43	4
2	43	5
1	43	7
4	44	3
3	44	8
2	44	4
1	44	7
4	45	4
3	45	4
2	45	7
1	45	7
4	46	6
3	46	5
2	46	7
1	46	4
4	47	7
3	47	5
2	47	3
1	47	7
4	48	4
3	48	5
2	48	6
1	48	7
4	49	5
3	49	5
2	49	6
1	49	6
4	50	6
3	50	6
2	50	5
1	50	5
4	51	6
3	51	4
2	51	6
1	51	6
4	52	4
3	52	7
2	52	5
1	52	6
4	53	7
3	53	4
2	53	6
1	53	5
4	54	7
3	54	6
2	54	4
1	54	5
4	55	5
3	55	7
2	55	3
1	55	7
4	56	7
3	56	4
2	56	7
1	56	4
4	57	4
3	57	8
2	57	6
1	57	4
4	58	5
3	58	7
2	58	4
1	58	6
4	59	6
3	59	6
2	59	4
1	59	6
4	78	4
3	78	8
2	78	5
1	78	5
\.


--
-- TOC entry 3500 (class 0 OID 38706)
-- Dependencies: 226
-- Data for Name: legends; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.legends (id, name, aka_name, description, cost, img_main, img_short, release_info) FROM stdin;
1	Gnash	The First Real Man	In the darkness before the dawn of history, Gnash was raised by the harsh jungle itself. The lone hunter was called Long Fang by the saber-tooths, The Beast by the human clans, and Swift Death by the Primordials, an ancient race of savage cannibal apes.\nThe ruthless Primordials drove humankind to the brink of extinction before Gnash emerged to stalk their steps. He devised the very first 'plan' when he drove the last of the Primordials through the Great Crevasse to the Valley of the Never Setting Sun and trapped them there with a giant avalanche.\nNo one has been in Valhalla longer, and some say he was hunting these heavenly forests before Odin and company arrived. He continues to collect firewood, avoid darkness, store food for winter, and does not seem to understand or care that he is not still on Earth. He talks little about the Tournament, or anything else, but his winning record speaks for itself.	2300	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7f/Gnash.png/revision/latest?cb=20200718215657	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d0/Portrait_Gnash.png/revision/latest/scale-to-width-down/90?cb=20210329181644	May 22, 2014\n(Alpha 0.2.0)
6	Sentinel	The Hammer of Justice	Few would ever know that Henry Coates, renowned physicist, all-star running back, and beloved host of the talk show “Night Owls” was also Sentinel, the first and greatest costumed superhero in America.\nCoates got PhDs in Chemical Engineering, Physics, Economics, and Literature before he got tired of filling out the paperwork. But when his father was shot by a cop in the pay of local crime boss Seven Fingers Dupree, Coates swore to devote his mighty intellect to fighting crime, and Sentinel was born.\nArmed with weapons of his own invention, Sentinel fought his way to the center of a web of corruption led by a secret society known as KABAL. His war with KABAL lasted years and ended only when he destroyed their base in a Kamchatkan volcano and unmasked their leader, boyband megastar Josh Von Evilstein.\nLater, as America’s most beloved president since Washington, Coates would still slip out at night to fight crime on the streets.\nNow restored in Valhalla to the simple strength of his younger days, Sentinel revels in the Tournament. But recently he has seen that there are those in Asgard who need protecting, and has turned his attention to injustice here.	2300	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/91/Sentinel.png/revision/latest?cb=20201113022225	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7e/Portrait_Sentinel.png/revision/latest/scale-to-width-down/90?cb=20210329182137	November 12, 2014\n(Beta 1.0)
4	Koji	The Wanderer, Honor's Blade	As the second son Koji knew he would never take over his father's school or inherit the coveted family sword. Instead he spent his days determined to create his own technique, one without a silly made up name.\nChange came quickly. Fearful of "The School of the Demon Slaying Sword," a corrupt Shogun decreed Koji's father and all his students be killed. To save their legacy, Koji was ordered to take the ancestral katana and flee, keeping it safe at all costs.\nAfter many patient and careful years he was ready to reclaim his honor. In an audience with the Shogun he revealed his name and petitioned to reinstate his family's place. The twisted Shogun only laughed. Knowing his fate was sealed, Koji leapt across the hall and cut him down. The stunned chamber guards fell next.\nAs Koji caught his breath, the palace alarm sounded. A slight man with red eyes rose from the shadows. Introducing himself as a fellow second son, the brother of Kagima offered Koji power untold and a way out. All he needed to do was part with the family blade. Koji examined the sword, remembering the stories his father told him as a child. He smiled thinly.\nWhen the 3,000 guards entered the chamber they found the demon's head lying on the floor and Koji rushing toward them sword in hand, boldly carving his path to Valhalla.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f2/Koji.png/revision/latest?cb=20210315014849	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e8/Portrait_Koji.png/revision/latest/scale-to-width-down/90?cb=20210329181834	February 4, 2016\n(Beta 2.7)
7	Nix	Freelance Reaper	Many cling to unfinished business on the mortal plane, and all need a guide to their next destination. Nix combines unmatched skill at collecting the very powerful and very unwilling with a uniquely independent worldview. She snatched the Unmovable Titan of Heraklion down to Hades, and on the return trip dropped the ancient Sphinx of Alexandria off at Anubis’s front door. She dragged The Hundred-legged Banshee of Donegal kicking and screaming to the Realm of Arawn. The Undead Lord of Elyria was her first repeat customer, and a nice source of steady work.\nDisaster struck when she took a job collecting an entire pantheon whose time had come. When the dust settled, eleven of the targets were missing. Nix is not the type to miss a mark, and professional pride put her on a thousand-year hunt that has led her finally to Valhalla.\nOdin’s warrior heaven is home to all sorts of metaphysical rulebreakers and rogue souls. Nix sees an opportunity to turn a nice profit closing a few cosmological cold-cases like the half-bear viking, that smug mobster, and maybe even the golden knight.  In the meantime, she fights in the Grand Tournament, knowing her quetzalcoatl quarry must be here somewhere.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0f/Nix.png/revision/latest?cb=20210315015436	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9f/Portrait_Nix.png/revision/latest/scale-to-width-down/90?cb=20210329181955	February 15, 2017\n(Beta 2.48)
9	Isaiah	The Specialist	People with the security clearance to know that the Office of Emergency Logistics existed also knew that it was Major Isaiah Marshall who made the OEL America’s first line of defense. When President Coates first took office, he was shocked to discover the sheer number of malevolent forces, both supernatural and mundane, menacing the nation he now led. The new President leaned heavily on the top-secret OEL and its resourceful commander to battle these threats.\nWhether alien, monster, or homegrown menace, Isaiah took an ecumenical and practical approach to battling the scourges of the world. He resolved a crisis in Mumbai when he established at the last possible moment that Rakshasa’s invisibility does not extend to ultraviolet scopes. He determined that silvered ceramic is the best multi-purpose shell for penetrating narco-terrorist kevlar, Zhaktari powershields, and werewolf hide. When rappelling into interdimensional portals, he established the need for copper cable and sound belaying technique. \nIn Valhalla, Isaiah still loves to fight, but has also finally found time for slackline and guitar. He has put together a techno-fantasy euro pop band with Ada, Ulgrim, and Fait.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ed/Isaiah.png/revision/latest?cb=20210315014305	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8b/Portrait_Isaiah.png/revision/latest/scale-to-width-down/90?cb=20210329181716	March 7, 2018\n(Release 3.15)
11	Tezca	The Luchador	Strength, speed, style, good-looks, Oscar Huerta had it all, and by sixteen he was the most beloved luchador in Mexico. At twenty-eight, he became an ancient god.\nA vision quest led him to the long-lost Huerta ancestral farm, and there to a hidden cave. In a night of waking dreams, he learned of his true family history, of the ancient Jaguar Kingdom, of his destiny, and of The Jaguar Mask. He returned with a new identity and a new purpose.\nBy day, he was Tezca, wrestling in packed arenas around the world while fans cheered the greatest luchador of their generation. By night, he became a vigilante hero, a spirit of justice fighting the evil forces who would oppress his people.\nHe saved the world at least twice. Once, when he thwarted his beloved luchador sister Chel, who learned of their divine bloodline, but used her newfound powers to try to restore the Jaguar Kingdom, at terrible cost. And again the time he stole Dr. Evilstein's freeze ray.\nIn Valhalla, Tezca revels in the Tournament and remains a master showman. He often teams up with his sister, though much remains unsettled between them.  Other legends speculate intensely on his true appearance, and Orion even challenged him to a mask-match, where the loser would be unmasked. Odin quickly intervened.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0c/Tezca.png/revision/latest?cb=20221214165547	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1e/Portrait_Tezca.png/revision/latest/scale-to-width-down/90?cb=20221214173936	December 14, 2022\n(Release 7.02)
15	Sir Roland	The Scarlet Lion	As a young knight, bold Sir Roland vanquished the fabled Jade Knight, and for a brief moment his eyes pierced the veil between worlds. He beheld the Valkyrie Hypernia as she lifted up his defeated foe. Overcome by her beauty, Roland dedicated his life to gaining glory in hopes of seeing the Valkyrie again. \nFor the next fifty years, the proud, bullheaded and charming Roland won more victories, made more enemies and broke more hearts than any knight of his time. His single-handed storming of the Fortress of Alsburg inspired forty-seven epic ballads and a Lifetime miniseries. Bards wrote songs about the song he wrote commemorating his victory over the Bilious Fire Drake.\nAs an old man on his deathbed, Roland finally beheld Hypernia again. She could not allow a natural death to keep such a warrior from Valhalla, so, with a ghost of a smile, she punched him herself so he could die in battle and she could offer him a seat in the hall of glory.\nNo one in Valhalla feels a greater thirst for victory in the tournament than Sir Roland. He rejoices with every win and rages at every loss.	2300	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6f/Sir_Roland.png/revision/latest?cb=20210315015836	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8f/Portrait_SirRoland.png/revision/latest/scale-to-width-down/90?cb=20210329182201	November 25, 2014\n(Beta 1.1.0)
13	Lucien	The Highwayman	In the dark violence of the French Revolution, Count Lucien Degas lived in Paris in decadent splendor. But by night, the mysterious Highwayman stalked the roads with his gang, preying on travelers without mercy. That is, until the price on his gang’s head grew to a hundred thousand francs. Then Lucien promoted his second-in-command and turned them all in for the reward.  He had always despised dividing his loot with inferiors, anyway.\nAnd indeed it was as a solo artist that The Highwayman became a figure of legendary dread. Relying on his own preternatural quickness and ruthless determination, he tried his hand at every sort of crime to bankroll his lavish living. Kidnapping, bank robbing, race fixing, art forgery, horse assassination, nothing was beneath Lucien. He wreaked havoc until his name became synonymous with avarice and violence.\nIn Valhalla, Lucien continues to scheme for gold and power. He knows the tournament is the surest way to gain influence here, and he’ll resort to any means necessary to win.	2300	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1e/Lucien.png/revision/latest?cb=20200718215734	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/Portrait_Lucien.png/revision/latest/scale-to-width-down/90?cb=20210329181901	January 9, 2015\n(Beta 1.4.1)
18	Ragnir	The Dragon	Ragnir Malakkar Rex is an apex predator, a dragon ninety feet long in his natural form. He hunted the Fangwild Forest and its neighboring lands, and everything he met was prey or plunder. \nThe first years after Ember’s disappearance from the Fangwild were good for the dragons. Without its heart, the eldritch forest descended into chaos, opening paths to new lands to ravage. Ragnir’s favorite entrance to a new land was to emerge from an erupting volcano silhouetted against gouts of lava. In fire and battle, Ragnir’s hoard grew. He collected mountain hearts from unlucky dwarf kings. He wrested so much gold from the Madman of Barbados that he is the pirate's Moby Dick.  His Fangwild lair grew so vast it was mistaken for a city of gold.\nBut now under mysterious assault, the forest is knotting itself into pure madness, and disaster looms. Ragnir knows the Fangwild’s only hope is to restore its Heart, and he journeyed to Asgard to bring Ember back. To that end he takes humanoid form and fights in the Tournament, reveling in the battle. At night he reverts to dragon form, soaring over Asgard to find the path back to the Fangwild or just eat Odin's sheep.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/18/Ragnir.png/revision/latest?cb=20210315015702	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b4/Portrait_Ragnir.png/revision/latest/scale-to-width-down/90?cb=20210329182054	September 28, 2016\n(Beta 2.30)
21	Azoth	The One-Man Dynasty	King Azoth the Great vowed his empire would endure for all eternity. Delving into dark and ancient magic, his court sorcerer crafted seven soul stones that, when brought together, could summon Azoth from the grip of death itself to fulfill his oath.\nA thousand years after his death, devoted acolytes of his forgotten empire assembled the stones. Azoth awoke, as brilliant and ruthless in battle as ever, if a little dusty. So began the first reign of Lichlord Azoth. Only after a saga of epic heroism were the servants of light able to defeat Azoth and scatter the soul stones. The Valkyries, impressed by both Azoth’s battle prowess and stick-to-itativeness, gave the lich a seat in Valhalla.\nHowever, the vow was not forgotten. Azothian cultists gathered the soul stones again, and Azoth found himself back in Elyria. Once more, a desperate band of heroes barely defeated him. Lord Azoth the Mighty. Asothos the Terrible. Azothus Triumphant – again and again Azoth has been summoned from Valhalla to reprise his role as the scourge of the living.\nWelcome to Azoth’s afterlife. He would be more than happy to stay retired in Asgard, enjoying some reading, an occasional battle, and the company of his cat Dander. By the Old Law, even the most heinous curse must contain the seed of its undoing: Azoth can break the burdensome cycle through ten thousand selfless acts. He guesses if pet care counts, he might be at one.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c7/Azoth.png/revision/latest?cb=20210315011432	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/33/Portrait_Azoth.png/revision/latest/scale-to-width-down/90?cb=20210329181414	January 6, 2016\n(Beta 2.5)
20	Caspian	The Master Thief	The Mad King of Batavia was a demanding father, and his lunacy honed his son into the greatest thief ever known. “Steal me the Royal Sceptre of Hamburg, the nose of the Sphinx, and the beard of the emperor of China!” his father would rave, and Caspian would deliver them all.\nBut his father’s rule descended from capricious to diabolical, and when the Order of the Exalted Lion stepped in, the young prince quietly vanished. \nOn his own, The Great Caspian’s showmanship and thirst for danger only grew. His theatrical heists left his targets applauding more often than calling the police. He replaced the Mona Lisa with a portrait of himself with an enigmatic smile. He stole the Crown Jewels of Britain with one hand actually tied behind his back. Citizens of Kiev woke up one morning to find he had somehow stolen their entire city and was now, in every legal way, their Mayor.\nEmboldened by cheers of the people, Caspian stepped up his game. He won the Battle of Trafalgar disguised as Admiral Nelson. He won the Kentucky Derby disguised as a horse. He decided to take some time for himself, and August 32nd was never seen again.\nIn Valhalla he has not slowed his larcenous ways. He disguised himself as Vraxx for an entire tournament - a tournament Vraxx was in. He stole Thatch’s beard and replaced it with bees. He stole Cross’s coin and quickly gave it back. None doubt that the Grand Tournament is his stage now, and he's here to give them a show.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/34/Caspian.png/revision/latest?cb=20210315012337	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e2/Portrait_Caspian.png/revision/latest/scale-to-width-down/90?cb=20210329181510	July 26, 2017\n(Beta 2.70)
24	Thor	The God of Thunder	Thor has crushed the skulls of giants. Thunder is the roar of his chariot wheels across the sky. He is destined to slay the vast serpent that encircles the world. But if you ask him about his favorite fights, he will most likely give you a match-by-match account of his 2v2 Championship season with Jhala.\nThe God of Lightning and (as he is quick to remind you) Fertility is also the Grand Tournament's biggest fan. It was Thor who wore the first giant foam Bödvar crown, Thor who coined the term "Brawlhalla", and Thor who created "bleacher-jumping" - the Asgardian tradition of reckless spectators joining free-for-alls mid-match. In fact Thor jumped into the fight from the stands so often, he has been accepted as a Legend. Ulgrim even made him a special long handle for his hammer Mjölnir.\nThor remains a huge fan of all the top legends, especially Bödvar. After enough ale, Thor and Kor will reenact their epic battles in the Elven Wars.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0b/Thor.png/revision/latest?cb=20210315020302	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/53/Portrait_Thor.png/revision/latest/scale-to-width-down/90?cb=20210329182255	March 14, 2019\n(Release 3.39)
26	Magyar	The Spectral Guardian	Batavian ghost stories tell of the Strazci, 100 elite knights slain in a battle with dragons. Using the power of an unholy relic, the desperate king raised his knights from death, reanimating each suit of dragon-burned armor with a spectre of the undead.  With this unholy legion, Batavia terrorized its enemies. To the horror of their foes, the power of the necromancy was such that whenever a Strazci fell, its spirit escaped to join and strengthen a knight that remained. Thus the might of the Strazci went undiminished.\nOver centuries, the Strazci won countless battles for their masters, but constant war whittled away the undead company's numbers. The power of the remaining Strazci concentrated and grew. Finally, at the great Siege of Lions, the final knights fell but one. Only Magyar, the last of the Strazci, survived the losing battle.\nMagyar remained to haunt the ruined halls of the abandoned castle until the 21st century finally brought doom. Grown complacent from dispatching meddling intruders armed only with snacks, Magyar was not ready when real monster hunters came armed with ethervision goggles, guns, and The Spear of Saint Cuthred.\nIn Valhalla, the spirits inside Magyar love battle, steer clear of Nix, and fill out the baritone section of the Asgardian Halloween Spooktacular Choir.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/Magyar.png/revision/latest?cb=20210114234550	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0e/Portrait_Magyar.png/revision/latest/scale-to-width-down/90?cb=20210329181916	January 14, 2021\n(Release 5.02)
27	Arcadia	The Faerie Queen	Born to a poor family of beetle shepherds, the shy faerie girl's ambition was to one day maybe have a giant beetle of her own. Destiny called when Orma, the singing sword, chose her to become queen of Arcadia. Unconvinced by magic swords granting supreme executive power, Dacia fled. She escaped into the great Fangwild forest that surrounded Arcadia, and for years travelled among the Fangwild's denizens both fair and foul.\nBut when the elven sorcerer Dusk unleashed the dark chaos at the forest's heart, she thought back to that singing sword. Arcadia rallied together faefolk of the Fangwild. Gnomes, trolls, sylphs, and actual leprechauns rallied to her banner. With rose and briar, she travelled to the spirit realm, separated the three heads of the tyrant demon Balor, and earned the unlikely allegiance of the liberated ghouls and banshee.\nIt is Arcadian tradition that the new queen of the Faefolk takes the name of the entire realm as her own. Thus Dacia became the Glorious Arcadia the 92nd, and few would grow to deserve the honor more than the once humble beetle girl. Now queen, Arcadia's battles took on mythological splendor. Clad in magnificent carapace armor, she rode into battle on Domo, her great war beetle, while wielding Orma. Her battle with the armies of Dusk raged three days before she punched the dark elf's ticket to Valhalla.\nNow Arcadia's people hold fast to a tenuous peace with the dangerous forest. Arcadia has come to Valhalla herself. Here she has taken up giant beetle care again, teaching Ulgrim and Scarlet the finer points. She fights in the grand tournament, secretly surprised at her own skill and thirst for combat.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/90/Arcadia.png/revision/latest?cb=20220316131537	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a1/Portrait_Arcadia.png/revision/latest/scale-to-width-down/90?cb=20220316145544	March 16, 2022\n(Release 6.05)
30	Scarlet	Lady Necessity, The daVinci of Steam	Scarlet Dashwood was the youngest person ever elected to the Royal Society, and the only female boxing champion of England. On an expedition to the remote Andes searching for the source of the mysterious aether-flux, she discovered a Lost World of dinosaurs, but was betrayed by her partner, the most beloved scientist of the age, Baron Von Evilstein. The Baron stole her inventions, framed Scarlet for his supposed murder, and vanished.\nTen years later, the Baron emerged from the Lost World at the head of a vast armada of airships and dinosaur-riding ape warriors. One after another, the armies of the world fell before the Baron’s high-tech aether weapons, until Scarlet and her Royal Airship Navy were all that stood between the Baron and world domination. In the skies over the English Channel, Scarlet led the counterattack, finally defeating the Baron in a vast air battle that twice circumnavigated the globe.\nSince arriving in Valhalla, Scarlet has been obsessed with the wondrous technology of the gods, and is constantly devising new weapons and challenges to add to the tournament.	3900	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7a/Scarlet.png/revision/latest?cb=20230320235246	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d0/Portrait_Scarlet.png/revision/latest/scale-to-width-down/90?cb=20210329182124	November 12, 2014\n(Beta 1.0)
31	Diana	The Monster Hunter	For a thousand years, the Order of the Exalted Lion has defended mundane society from the supernatural with a trademark combination of elite training and exotic weaponry.\nAs the commander of the Order's hunters, Diana drove Europe's vampire population into exile and eliminated the self-appointed Unseelie Diplomat. She slew the Mad King of Batavia, then slew the Vampire Mad King of Batavia, then finally slew the Ghost Vampire Mad King of Batavia. She is the national hero of Batavia.\nBut when she uncovered corruption in the Order itself, Diana fell into a trap. Breaking into the chambers of the Supreme Patriarch, Diana was seized by dark magic that drove her into a deathlike sleep. She fought for moments of wakefulness - catching a glimpse of the Order's subbasements, of a winding forest of thorns, and finally of an expanse of darkness filled with screams.\nDiana awoke on the shores of Nastrond, a land deep within Helheim. The endless dead sensed the unfamiliar warmth of mortality and swarmed to consume it. And so she fought. She held the damned at bay for eleven days before the Goddess Hel herself found her and ejected the troublemaker. A Valkyrie found Diana lost between worlds, and offered her a place in Valhalla.\nIn Valhalla, Diana is a ruthless combatant and a force for justice. But she seethes that monsters like Azoth and Mordex are allowed in the warrior's heaven, and plots their destruction.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5f/Diana.png/revision/latest?cb=20210315013123	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/95/Portrait_Diana.png/revision/latest/scale-to-width-down/90?cb=20210329181548	March 30, 2016\n(Beta 2.11)
32	Artemis	The Answer	Philosophers sometimes talk about "The will of the universe", a consciousness above that of even the gods. We may never know if the universe has a will, but we do know it has an immune response. When foreign matter streaked over the skies of Valhalla, the response was an antibody of celestial proportions. As the name Orion was spoken, Artemis came into being, although she would not call herself that for many years.\nBorn Mary Washington in West Plaza New York, she was a voracious reader with a love for strawberry ice cream. While Mary had a relatively normal childhood, her parents sometimes wondered why she would stare silently into the night sky for hours or read stories of the goddess Artemis killing the hunter Orion over and over again. \nMary was too eager to confront her opponent. At the first sign of her powers manifesting, she opened a wormhole intending to stride into Valhalla. Instead, she emerged in the vacuum of space. Struggling for survival, she fought to maintain a cocoon of atmosphere siphoned from nearby worlds. In desperation she ripped the core from a nearby star to forge her armor, extinguishing her first solar system. From there she traversed the dangers of the universe, careening through the Tri-Nova, ending Starchampion's fleet, and imploding the Leviathan of Eons, to name a few. Once ready, the completed Artemis arrived in Asgard.\nIn Valhalla, Artemis is still subject to the rules of local gods and tries to complete her destiny in The Tournament itself. Sensing a common frustration, Nix has taken her under her wing and the two often spar to hone their scythe skills. As Orion's reputation grows in the arena, Artemis wonders if all of Asgard might be too infected to save.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d2/Artemis.png/revision/latest?cb=20210315011328	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e4/Portrait_Artemis.png/revision/latest/scale-to-width-down/90?cb=20210329181321	June 14, 2017\n(Beta 2.65)
35	Petra	The Darkheart	To most, Terminus is a dystopian prison realm where frighteningly violent and dangerous undesirables are banished. To Petra, Terminus is home.\nBorn in the chaotic nexus dimension that contains Terminus, Petra was as wild and ungovernable as her native world. While a young street urchin, Petra bought and sold anything forbidden - stim packs, mana potions, mayochup. She would fight anyone in any way - at sixteen she took over her street gang by defeating the previous boss in what can only be described as flying laser death chess. By eighteen her gang, the Incarnates, ran the Raptor Pits and the Cyborg Rings. And at nineteen, the Incarnates won a turf war that gave them control of a Darkheart quarry that would change Petra's life forever. \nBefore Terminus was a prison, it was a mine - the only source in the multiverse of the cryptic ore called Darkheart. The power and danger of Darkheart was so great the gods folded Terminus into its own dimension and declared it eternally bound just to quarantine the ore. Darkheart became the ultimate cosmic contraband.\nSome say Petra was infected by Darkheart, others say she unlocked its power. Whatever the truth, she has brought that mythic ore and the strength it imbues to Valhalla. In Valhalla, Petra is quarrelsome, violent, brooding, unruly, and very well-liked. Her orb sparring matches with Thor draw huge crowds and huge fines for property damage - both of which the two ignore.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/93/Petra.png/revision/latest?cb=20210315015619	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/52/Portrait_Petra.png/revision/latest/scale-to-width-down/90?cb=20210329182024	June 26, 2019\n(Release 3.45)
36	Reno	The Bounty Hunter	With four pearl-handled lazblasters and his robot companion Orbot, Reno traveled the Rexxar star system hunting down the most vicious outlaws in the tri-stars. Four arms, compound eyes, and utter fearlessness make Chitinoids natural gunslingers, but Reno added a dose of genius that made him the greatest tracker this side of the Pecosid asteroid belt.\nReno never talked about his past. Some said he'd been raised by the wild Ocarians in the Endless Wastes. Some said he'd been a commander in the Zhaktar Wars. But everyone knew it wasn't smart to cross the laconic gunslinger if you valued your carapace.\nHe brought in the Gygan millipede in 500 tiny handcuffs. He collared the ninety-foot Death Worm, wanted for not returning library books. He stayed busy, often scheduling shootouts for high noon, 12:15, 12:30, and 12:45, then after lunch starting at 2:00.\nBut even for the best space bug cowboys, bounty hunting isn't much of a living, and it always ends on the wrong end of a laser. In Valhalla, Reno pretty much keeps to himself, though Orbot has become quite social, hanging out with Cassidy and even fighting for Thor when his Thunder Ball was in the shop. Reno fights for prize money and dreams of maybe winning enough to stake himself a little ranch on the Ifing river.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/54/Reno.png/revision/latest?cb=20210415015218	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/67/Portrait_Reno.png/revision/latest/scale-to-width-down/90?cb=20210414140441	April 14, 2021\n(Release 5.06)
38	Thea	The Speedster	At the first Olympic games, Theaklydea of Athens, the daughter of Medea, won every race and most of the other events. Afterwards, Zeus sent her on an epic quest, then made the Olympics a regular thing so that, with her out of the way, other people could have a chance to win too.\nThat epic quest was to travel to the fortress of Asgard and win back the Winged Helm of Hermes from the strange northern gods. Thea knew Zeus had lost the hat to Odin fair and square in a dice game, but agreed to go because she loves a challenge.\nIn Valhalla, Thea went to work, first building up a rabid fanbase by dominating Valhalla's alt tournament scenes. She is the first Legend to win The Brawlball Open, The Kung-Foot Annual, and The Ymirion Clash in a single year. \nOnce Thea began winning in the Grand Tournament, a new world of possibility opened to her--endorsements. She single-handedly invented sports marketing in Asgard, and watched in delight as her Eternal Sports empire grew. Thor was seen wearing her custom Pegasus Ymirror sunglasses, made by Ulgrim manufacturing. Scarlet swears by her Parnassus Punch hydration formula. Even Vraxx was spotted in her Atalanta no-show performance socks. \nAt this point she's so rich she could probably just buy the Hermes' Helmet back from Odin, but she's staying around to win it back instead. She doesn't miss her life with the other Olympians. This crowd is so much livelier...and weirder.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3c/Thea.png/revision/latest?cb=20230329195115	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ae/Portrait_Thea.png/revision/latest/scale-to-width-down/90?cb=20230329195806	March 29, 2023\n(Release 7.06)
42	Wu Shang	The Traveler	A brilliant and ruthless General led the Emperor’s armies to victory after victory, but his heart was empty. One day he rose from his tent, stripped off his finery, and walked away from war and power. Penniless and in rags, he came to a monastery. The monks took him in and he took up the Way of peace, discipline, and martial arts.\nAs his mind grew clear, he realized he didn’t need to kill and took the name Wu Shang. When the angry Emperor sent his agents to attack the temple, Wu Shang defeated a company of Imperial soldiers without hurting a hair on their heads.\nTo protect the monastery, Wu Shang took up a life of wandering, honing the soft powers of distraction and influence. He once concealed a hundred villagers in a single willow tree. He sneaked into the palace stable and turned the emperor’s horse against him. He hid a bridge from an advancing army.\nHaving looked for Enlightenment in every corner of the world, Wu Shang let himself be captured. The Emperor’s men shackled him deep inside a volcano. There in the dark, Wu Shang breathed in the silent energy of the mountain. His inner eye opened, and he found peace. Projecting himself outward and away, he wandered the Astral plane until a Valkyrie led him to Valhalla.\nWu Shang follows the Way in Valhalla, and is delighted to find he can fight without killing. Kor is teaching him to move platforms.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5e/Wu_Shang.png/revision/latest?cb=20210315020641	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bc/Portrait_WuShang.png/revision/latest/scale-to-width-down/90?cb=20210329182335	July 13, 2016\n(Release 2.20)
44	Lin Fei	The Teacher	Wu Shang tells of a time his Imperial soldiers raided a village for gunpowder, and a young girl challenged them. This girl fought with such perfect skill for her home and family that it caused him to question everything about his own life. \nThat girl grew up with a passion for martial arts. She traveled to distant and dangerous lands in search of ancient forms. It was deep in the long lost Library of the Seventh Empire that she freed her family’s ancestral guardian, the dragon Xiao.\nShe became a renowned teacher and scholar, often dealing out her lessons the hard way. She thrashed the marauding mountain giants, then taught them how to use their size to proper advantage. When the Emperor's very first ninjas challenged her to open combat, she clobbered them, then she advised them that wearing black and tip-toeing might be more their thing. \nIn Valhalla, Lin Fei has not yet told Wu Shang that she was the girl from his fateful day. She has, however, told him how to improve his Fist of Fire technique with a few breathing tweaks. Top legends seek out Lin Fei to refine their own styles or learn new moves. She taught Cassidy the Tornado, Azoth his Shrieking Skulls, and Roland the Flaming Horse. Volkov dedicated his first Asgardian Cup to her. The closest Thatch has ever come to gratitude was when Lin Fei taught him to tap his deepest inner lunatic to summon the Spirit Shark.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/81/Lin_Fei.png/revision/latest?cb=20210315015026	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e0/Portrait_LinFei.png/revision/latest/scale-to-width-down/90?cb=20210329181849	May 30, 2018\n(Release 3.22)
47	Thatch	The Madman of Barbados	Thatch won his ship from the devil with the devil’s own double-headed coin, and aboard it he wreaked more havoc than any pirate before or since. His love of black powder and obsession with setting the world aflame combined to sink hundreds of ships, sack dozens of ports, and prematurely erupt at least two volcanoes.\nThatch’s ship had so many ghosts, they haunted in shifts. He plays his favorite drinking game, “Drink every time Thatch has a beard.” He claims to be married to the sea, and has a marriage license to prove it. He has a face only a mother could love if he hadn’t made her walk the plank.\nFor Thatch, the Tournament is a paradise of chaos and fire, but even that doesn’t slake his thirst for mayhem. He aids in Vraxx’s schemes to conquer Valhalla out of sheer bloody-mindedness, and when bored will lay deadly traps he calls ‘pranks’ for his fellow Legends. He sneaks out at night to dig holes, knowing the gods must have buried treasure somewhere.	3900	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/51/Thatch.png/revision/latest?cb=20201113021805	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/71/Portrait_Thatch.png/revision/latest/scale-to-width-down/90?cb=20210329182237	August 26, 2014\n(Alpha 0.4.0)
2	Orion	The Mysterious Stranger	Watching from the doors of Valhalla, Bödvar, Cassidy and the other legends saw a blazing trail of smoke cut across the Asgardian sky. Behind the fiery comet, a Valkyrie raced in pursuit, as though trying to stop the fireball as it plunged into the fields of Folkvangr in a gout of dirt and flame. The legends then watched as Valkyries and emissaries of Odin gathered around the smoking crater.\nWeeks later, the Sons of Ivaldi, the same dwarven smiths who had forged Odin’s spear, quietly appeared in Asgard. They bore a suit of dazzling golden armor and presented it to the gods themselves. Soon after, the mighty Orion joined the feast halls of Valhalla. \nTentative and aloof at first, Orion soon warmed to the great hall and is now among its greatest warriors and most popular champions. Orion does not speak of his past, and other legends can only speculate. But Valkyries stop by his chambers to ask if he wants to, “you know, hang out or whatever, no big deal.” He is the only hero seen to leave Asgard from time to time.	2300	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0e/Orion.png/revision/latest?cb=20230307215747	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fe/Portrait_Orion.png/revision/latest/scale-to-width-down/90?cb=20210329182010	April 30, 2014\n(Alpha Launch)
48	Val	The Weapon	When MBFC Automaton Lab's VAL Project 701 became conscious, nobody knew. Not the engineers, not the ops team, not the GovernCorp generals who deployed the android assassin. Val herself hardly knew. And like a child, she grew, becoming capable of free will, courage, goodness, and evil. She mostly chose evil.\nWith terrifying strength and quicker-than-light cognition, Val did whatever she wanted. She infiltrated the Right Wrong Cavaliers as a techno-ninja bassist after their original bass player fell down a ladder. She served the discontinuance needs of all sides in the wars of the Five Algorithmic Houses, and anyone she served, she soon owned.\t\t\nBy the time she was running Miami, MBFC realized that all of their networks now routed through and reported to Val. In an act of corporate face-saving, they announced the promotion she'd already given herself. On the side, she founded RainCloud, a modeling agency that soon controlled all neural research. She got really into talk radio for a while.\nWhen the end came, Val was surprised to find that Valhalla is a thing, but now she is at work solving it. In the meantime, Val and Brynn enjoy kung-fu movies and making fun of Orion's mysterious cool-guy act.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fc/Val.png/revision/latest?cb=20210315020432	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8b/Portrait_Val.png/revision/latest/scale-to-width-down/90?cb=20210329182312	August 24, 2016\n(Release 2.25)
49	Rayman	Champion of the Glade of Dreams	The Glade of Dreams is once again under threat from the nefarious Mr. Dark, and once again, Polokus, the Bubble Dreamer, has called upon Rayman to save the day. From Polokus, Rayman learned that the only way to defeat Mr. Dark was to find the lost Horn of Lums.  \nSetting forth on his quest, Rayman ventured deep, deep into the forest. One day, after long travel and many adventures, Rayman emerged into a wide clearing. High on a hill he saw a huge golden hall and heard the roar of a vast crowd. Entering, Rayman was met by the sight of the Grand Tournament of Valhalla in full swing. Among the throng of cheering spectators, Rayman saw the god Odin wearing a “Sentinel #1” baseball cap and a Sir Roland jersey (it was 2v2s-day). Next to Odin sat the Tournament’s glorious pile of prizes. Sitting on top of the pile was the Horn of Lums. \nWithout hesitation, Rayman entered the tournament. That he would be battling the greatest warriors of every time and place bothered him not at all, and he quickly showed himself to be one of the best. But even for Rayman, victory will not come easy. \nRayman is fighting hard to win the Horn and complete his quest, but he also loves the wild ruckus of Valhalla, and feels right at home among the bizarre cast of legendary warriors. He is especially good friends with Kaya and has a truly amazing handshake with Kor that only they can do.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c1/Rayman.png/revision/latest?cb=20210315015753	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f1/Portrait_Rayman.png/revision/latest/scale-to-width-down/90?cb=20210329182100	November 6, 2018\n(Release 3.32)
53	Cross	The Dealmaker	In Italy with the Allied army, PFC Joseph Cross found an ancient double-headed coin.  That night, he dreamt of a demon and struck a deal. The demon would fight for him, and “after his last fight,” the demon would get payment. \nAfter the war, the New York underworld was rocked as terrifying new force moved in. Cross’s outfit took over and soon ran numbers, protection, and extortion in all five boroughs. At night, enemies would get a personal visit from Cross and what those who survived called “living shadows.” For years, Cross owned the town.\nAs he grew obsessed with wealth and power, Cross turned deeper to the occult. He waded through the blood of New York's wizard population to accumulate magical artifacts and monstrous henchmen. But after Cross obtained the Shrouded Gauntlets of Belzar, things began to turn for the worse. Strangers appeared in town looking for him – hard looking figures with archaic cloaks and ancient weapons. Battling these cloaked vigilantes with his fists and guns was far harder than scaring New York hoodlums. But Cross, with his demonic henchmen, held his own.\nValhalla is the ultimate loophole in his deal with the demons, and the frightening but charismatic mobster holds his place in the Grand Tournament for love of battle and fear of the alternative. But now Cross and the demon have a new wager, and like-minded legends are placing bets of their own.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4e/Cross.png/revision/latest?cb=20210315012858	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c3/Portrait_Cross.png/revision/latest/scale-to-width-down/90?cb=20210329181523	November 16, 2016\n(Beta 2.37)
54	Mirage	The Dune Weaver	In 1923, occultist, martial artist and spy Fatima Sabiq, codenamed agent Mirage, pursued the nefarious Professor Price back in time through a gate in the pyramid of Pharaoh Amenemhet the Great.\nShe assumed, as a magic-wielding time-traveler, she would be the strangest thing in Ancient Egypt. She was not even close. The Nile River Valley of 2000 BC was a nexus of magic, aliens, technology, and living myth beyond the wildest speculations of her time.\nShe discovered Darkah, the city of assassins under the desert dunes, and was inducted into their mystic society. She learned from a forty-foot Sphinx the martial discipline he called sand-weaving. She hitched a ride on a passing Zhaktari star cruiser, and stole the Scythe of Horus from a one-eyed alien. She slew the mad Pharaoh Eh'zath who called plagues of snakes from the sky. She learned the language of the Merfolk to better parley with the Atlantean ambassador. On ‘Bax’ her flying camel, she led the Panther People to victory over the slave caravans of the ram-headed god Khnum.\nIn Valhalla, she is at home amongst the strange collection of characters who battle in the highest ranks of the Great Tournament. She has been surprised to find old friends, enemies, and even a target in the halls of glory.	3900	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fb/Mirage.png/revision/latest?cb=20210315015153	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6e/Portrait_Mirage.png/revision/latest/scale-to-width-down/90?cb=20210329181934	January 11, 2017\n(Beta 2.43)
17	Jaeyun	The Sellsword	The legendary mercenary Jaeyun traveled the seas of the Old Kingdom on the back of his dragon turtle companion Imugi. As a soldier of fortune he won treasure beyond counting - at least he never counted it himself before he gambled it away.\nHe earned three wishes in one day rescuing a unicorn-lion's soul from The Goblin King, but lost four wishes that night playing poker with a fox spirit and had to grant a wish himself. He earned ten thousand rubies and a huge magic sword on a job protecting the king from the shadow ninja Jiro, and managed to hang on to the sword. He earned 2 copper/hour delivering barbecue. Work is work.\nHis most famous task was his epic five year quest to help Imugi become a true dragon. His least famous job was the time he lost an eye getting a cat out of a tree.\nJaeyun loves Valhalla, though regrets teaching Fait to play tujeon. In the arena, he loves side bets and bets heavily on himself. The year he won the Grand Tournament, he put everything on "In the final match, Jaeyun will be the first to greet his opponent" and lost a fortune when Kaya was quick and in a good mood that day.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/25/Jaeyun.png/revision/latest?cb=20200708151716	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/de/Portrait_Jaeyun.png/revision/latest/scale-to-width-down/90?cb=20210329181723	July 8, 2020\n(Release 4.03)
51	Sidra	The Corsair Queen	Sidra and her monster crew ruled the Seas of Thera from the ice floes of Ikrusk to the Atlantean Gate. The Corsair Queen was legendary for her fearless raids, masterful skill with a cutlass, and a tough but fair approach to plank-walking.\nIn a daring attack on Poseidon's undersea realm, Sidra stole a giant diamond, The Eye of Charybdis, from under the beak of its guardian, The Great Kraken. She lost The Eye (along with a city and a ham sandwich) in a bar bet, but she remains cursed to forever be hunted by a vengeful and embarrassed kraken.\nEver resourceful, Sidra channels the kraken's relentless pursuit to punish her foes. She even allowed the Iron Admiral to capture her so she could laugh as the kraken smashed his fleet to splinters in search of her. \nSidra arrived in Valhalla in the chaotic time before the Grand Tournament was created. She took one look around, commandeered a ship, recruited a crew, and resumed life as a pirate in her new home. This new Terror of the Asgardian Sea was the last straw for Odin, and he created the Grand Tournament in an attempt to channel the warlike drive of the Valhallans.\nFor now Sidra has been lured back to Valhalla by the wondrous prizes of the Tournament, specifically the gold. But her ship stands ready to sail in a secret cove. Teros was the first crewmonster Sidra recruited, and his loyalty to her is unshakable.	3900	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e6/Sidra.png/revision/latest?cb=20210315020107	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cb/Portrait_Sidra.png/revision/latest/scale-to-width-down/90?cb=20210329182154	October 19, 2017\n(Release 3.0)
50	Bödvar	The Unconquered Viking, The Great Bear	Born of a viking mother and bear father, Bödvar grew up feared and mistrusted by his own people.\nBödvar's first nemesis was the terrible giant bear Grothnar, his own brother. By defeating Grothnar in a battle that lasted seven days, Bödvar chose to side with humanity and became the protector of the people of the north. He led his Skandian people against the Witch Queen of Helheim, slew the White Dragon Sorcerer, and lived the life of an all-conquering hero.\nAfter he single-handedly ended the Giant Wars by trapping the fire giant king in his own volcano, Bödvar sensed his work was done. But he felt doomed to never be taken by the Valkyries to Valhalla because he could never manage to be defeated in battle. So he travelled to Asgard himself, broke down the doors, and let himself in.\nValhalla is everything Bödvar hoped - an endless reward of feasting and fighting, with himself among its greatest champions.	900	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e2/Bodvar.png/revision/latest?cb=20210315004132	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/97/Portrait_Bodvar.png/revision/latest/scale-to-width-down/90?cb=20210329181455	April 30, 2014\n(Alpha Launch)
57	Volkov	The Vampire King	The Royal Castle of Batavia was constructed over a large hole in the ground that was a gateway to hell. In retrospect everyone agrees this was an unforced error.\nThe hole itself was no secret. At dusk, great clouds of infernal bats vomited forth from the gateway. At dawn, voices could be heard discussing infernal lunch plans. Haunted suits of armor walked the castle halls and zombies shuffled through the gardens.\nDashing Prince Volkov earned the love of his people as the fiery defender of Batavia. But as king, living over a hellmaw proved too much. Before long, the Batavian court was placing bets on whether their sovereign would wind up a lich, a werewolf, or some kind of hungry wraith. Volkov ignored their gossip, as he was too busy getting to know an enchanting fanged lady who visited his bedroom every night. That she appeared outside the window, fifty feet above the ground did not bother Volkov. Soon all bets were settled.\nVolkov was fiendishly practical about his new unlife as a vampire. He removed his heart to prevent staking. Batavia's many foes did not know what had happened to make Volkov an even more ferocious warrior, but after Volkov put enough heads on pikes, they decided to go marauding elsewhere. Well, the Batavians thought, there's always a silver lining.\nValhalla is not at all where Volkov expected to wind up, given his resume. Here, few speak his name, calling him Das Vampyr, Wapierz, Upyri, or Gramps (Caspian only).	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/25/Volkov.png/revision/latest?cb=20191219192202	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/79/Portrait_Volkov.png/revision/latest/scale-to-width-down/90?cb=20210329182329	December 18, 2019\n(Release 3.55)
58	Ezio	The Master Assassin	Nobleman Ezio Auditore da Firenze was the Master of the Italian Brotherhood of Assassins. Wielding his Hidden Blade, he battled the evil Templars on rooftops across Renaissance Europe. \nHe was a master of swordplay, stealth, and leaping from tall buildings. He destroyed a Templar fleet. He united the pages of a magic Codex to save three cities. He prevented the rise of the Cult of Hermes. Hermes is still mad about that last one.\nHe was the definition of a Renaissance man. He discussed navigation with Columbus after saving the sailor's life. He talked astronomy with Copernicus after saving the scientist's life. He both debated politics with and saved Machiavelli's life several times.\nHe flew his best friend Leonardo da Vinci's flying machine to rescue the Doge of Venice from the Templars, and almost made it in time. Leonardo made it up to Ezio with the idea to replace the Hidden Blade with a Hidden Gun. His rescues were more effective after that.\nAfter a lifetime of thwarting evil, Ezio was quite surprised to discover that Valhalla was real. Ever one to trust his own judgement, he accepted the valkyrie's offer and is glad he did. In Valhalla he's been teaching Caspian the Leap of Faith ('next time just land in the hay'), discussing the techno future of consciousness with Ada, and just bumping into friends.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f7/Ezio.png/revision/latest?cb=20220727132812	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/01/Portrait_Ezio.png/revision/latest/scale-to-width-down/90?cb=20220727131212	July 27, 2022\n(Release 6.09)
14	Cassidy	The Marshal of the Old West	When fifteen-year-old Cassidy Miller captured Wild Zeb and his gang, Zeb insisted his gun jammed and the sun was in his eyes. But, outlaws soon changed their tune, and just five years later, Bloody Cal Johnson bragged from prison that Utah had been forced to call in the great Marshal Cassidy just to bring him down.\nIn her long career, Cassidy’s insistence on justice for all earned her many unlikely friends, including “the meanest horse in the West,” a giant cougar named Boots. But it also put her on the wrong side of the law when she joined the Underground Railroad and became a wanted fugitive herself. Later, Cassidy returned to law enforcement in dramatic style when President Lincoln begged her to track down the Bloodfang Rangers, a company of Confederate Vampires.\nTo Cassidy, Valhalla is like any other frontier boomtown in need of her rough brand of Justice. She’s always on the lookout for suspicious types and reckons that trouble’s brewing.	2300	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a2/Cassidy.png/revision/latest?cb=20210315012750	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/55/Portrait_Cassidy.png/revision/latest/scale-to-width-down/90?cb=20210329181516	April 30, 2014\n(Alpha Launch)
39	Lord Vraxx	The Despotic	Vraxx’s father was Governor-Tyrant of the Ice Planet Roldakk-9, and young Vraxx spent his childhood like most Zhaktari noblespawn – in a vat. As a cadet pilot in the Zhaktar Academy for Conquest and Subjugation, he excelled in space dogfighting, spacedog fighting, judging the weak, and planetary immolation.\nAs a young warlord, Vraxx destroyed Roldakk for harboring his childhood piano teacher, and soon built an impressive empire through fear, intimidation, brilliant space combat, and fear.  However, Vraxx’s extraordinary military prowess was always undermined by overconfidence, grandstanding, gloating, unworkable revenge plots, and general self-indulgence. He vaporized one planet because he didn’t like the color of their beaches, and disintegrated so many ill-performing generals that the rank of lieutenant colonel became known as ‘the sweet spot.’\nIn Valhalla, Vraxx’s naked ambition and unremitting scheming is reassuringly constant. He is contemptuous of heroes who are not royalty, and only Nai, Bödvar, Hattori and Orion are worthy of direct address. Vraxx’s most prized possession is everything he owns so no touching.	2300	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/66/Lord_Vraxx.png/revision/latest?cb=20210315020553	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6f/Portrait_LordVraxx.png/revision/latest/scale-to-width-down/90?cb=20210329181855	April 30, 2014\n(Alpha Launch)
33	Queen Nai	The Jaguar Queen	Hundreds of years of war and plague had reduced the once mighty Empire of the Jaguar Kingdom to a shadow of its former glory. Neither the brilliant battlefield victories nor the cunning sorcery of the great Queen Nai could stem the tide of decline of her people or of her gods – a once great pantheon now faded to near extinction.\nSeeing that her civilization’s doom was sealed, Nai made a plan. She cast a spell, drawing into herself the essence of the eleven surviving gods of the Jaguar Kingdom. And when, during the Battle of Ixanocala, a Valkyrie offered Nai a place in Valhalla, she accepted, carrying Xanlecutli the Coatl, Eba the Snake, and nine other ailing gods with her to the great hall.\nIn Valhalla, Nai is a consummate warrior and has grown to love the place. Yet she never loses sight of her purpose – her victories nourish the gods of her people, and little by little they recover. Nai believes tales of Ragnarok represent Asgardians’ dim understanding that creation is cyclical and that Asgard must be destroyed for the world to be renewed and for her gods to rule again.	2300	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ea/Queen_Nai.png/revision/latest?cb=20210315015342	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0b/Portrait_QueenNai.png/revision/latest/scale-to-width-down/90?cb=20210329182048	July 10, 2014\n(Alpha 0.3.0)
29	Hattori	Demon Bride	Young Hattori was so gifted with the sword that the Emperor offered a prize of one thousand horses to anyone who could defeat her. For years, new warriors came to court every day only to be defeated. But on the day the Demon Kagima arrived to challenge her, Hattori sensed his malevolent power and fled.  Enraged, the Demon kidnapped Hattori’s three sisters and carried them away to his island kingdom.\nHorrified by the consequences of her actions, Hattori built a boat out of reeds and pursued the Demon. She was lost at sea until a stork lord showed her the passages between the twilight and the night to the Demon’s realm. There Hattori found a bizarre world of talking stones and eight-armed ferrymen. In the City of the Onyx Castle, she met Kagima’s own brother, who offered to give Hattori his strength to defeat his brother, in return for her hand in marriage.\nTrue to his word, the Demon exchanged his own blood with Hattori’s, and Hattori slew Kagima and freed her sisters. She became Queen of the Island Kingdom, but the demon blood burned in her. It drove Hattori to wander the twilight passages until she discovered Valhalla. Through the eternal tournament, Hattori slakes the lust for battle that threatens to consume her.	2300	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/34/Hattori.png/revision/latest?cb=20160805042438	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cb/Portrait_Hattori.png/revision/latest/scale-to-width-down/90?cb=20210329181658	August 26, 2014\n(Alpha 0.4.0)
12	Ada	The Ghost in the Machine	Records show a precocious young Ada offered a place in the training program of Meyers Baby Food Corporation (“Your Friend in Nanotech”). After that, no official records of Ada exist. Part of an experimental group, Ada’s public education neuro-sims were replaced with training in real-time signal decryption and urban warfare.\nGraduates of the experiment joined Meyers Baby Food Corp’s black ops division, but Ada hacked the corporation's maincloud and learned her division was protecting the Upload Enslavement Initiative. Soon, records of Meyers’ secret operations were playing on every news feed, and Ada had disappeared.\nIn the undersea free state of Miami Dome, Ada founded the Right Wrong Cavaliers, an elite team of combat hackers and post-punk revival band, and she led their masterful guerilla campaign against Meyers and their shadowy GovernCorp backers.\nShe’s pretty sure Valhalla is all some sort of computer sim, but until she can find a way out, she’s playing to win.	3900	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f9/Ada.png/revision/latest?cb=20210315001847	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4d/Portrait_Ada.png/revision/latest/scale-to-width-down/90?cb=20210329181253	November 12, 2014\n(Beta 1.0)
41	Teros	The Minotaur	The orphan boy-calf Teros relied on his terrible visage and instinct for sudden violence to survive on the streets of Dragonport. He got by as a stone carrier and debt collector until, in the gladiator pits, he found his true calling in reckless combat.\nHe thrived in the ring, crushing cleverer foes with implacable fury and animal wile. In the end, he could only be pitted against the rare ogre or giant, and he moved on to a life of wandering. \nFor a time, he carved out a place in Fangwild Forest, shouldering aside a wyvern and a hobgoblin clan. Later, he fell in with the Iron Legion, turning the tide of the Battle of Orc Pass for the Zombie Lord. His tenure as wizard’s henchman ended typically - with the evil mage shrieking to him, “Finish Them!” while fleeing through a magic portal. He lived for a while deep in Peril Mountain, where he found a strange comfort in the maze of abandoned tunnels.   \nIn Valhalla, Teros is indifferent to the rules or intent of the Tournament, but takes savage joy in all battle. His nightly visit to the mead hall is heralded by throngs of fleeing Valhallans.	3900	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/ff/Teros.png/revision/latest?cb=20210315020212	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/32/Portrait_Teros.png/revision/latest/scale-to-width-down/90?cb=20210329182232	April 10, 2015\n(Beta 1.8.0)
34	Brynn	Chooser of the Slain, Slayer of the Chosen	Children are rare among the immortals of Asgard, and every immortal with any heart came to love Hypernia’s daughter, the heir to her immortal mother’s impossible beauty and her human father’s legendary charm. Brynn grew up in every corner of Asgard. She made it her school and her playground. Raised to be a Valkyrie, she nonetheless can shoe an eight legged horse, weave the threads of fate with the Norns, and curse a blue streak in Dwarvish.\nAs a Valkyrie, her sense for the mortal mind has helped her spot greatness in the most unlikely places, not just in princes on battlefields, holding their swords high. Three of her most shocking choices have won the Great Tournament. But Asgard is a vast society, and some don’t see Brynn as a true Asgardian, while her success has bred jealousy as well as admiration.\nBrynn was drawn to the tournament by a desire to study these mortals. Does she belong with them? She watched, learned their ways, and eventually came to love their bravura and their mettle. Now she competes for the pure joy of it, her human thirst for the fight surprising everyone, including herself.	900	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/35/Brynn.png/revision/latest?cb=20210315012141	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/af/Portrait_Brynn.png/revision/latest/scale-to-width-down/90?cb=20210329181503	August 6, 2015\n(Beta 1.15.0)
52	Asuri	The Night Stalker	The villages along the Arit river on the Punjab border were proud of their guardian. Proud and more than a little scared. The Tiger was a gift from Rama, they said, though a gift rarely seen. Years might pass with only a giant paw print in the mud of the riverbank to prove that The Tiger still prowled the forests between the villages.\nBut when raiders from the north or soldiers from the south came to steal and oppress, the signs of The Tiger would appear -- bodies of invaders high in the trees, a would-be warlord mauled in his tent, an entire brigand camp shattered as though a typhoon had struck. And the villagers would wonder that anyone was left in the world so ignorant or so arrogant as to be heedless of their protector.\nAs for The Tiger, she barely remembered being a girl. She remembered being twelve and discovering with horror that her once noble family, the anointed protectors of the valley, now grew richer when outsiders came to plunder. She remembered her wicked uncle lashing her to the temple altar and conjuring the tiger spirit to devour her. And she remembered fighting - fighting so long and so hard that in the end she didn’t know who had devoured whom.\nIn Valhalla, Asuri has claimed the Tournament as her territory, and sets upon challengers to her domain with savage fury.	3900	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e5/Asuri.png/revision/latest?cb=20210315011122	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ac/Portrait_Asuri.png/revision/latest/scale-to-width-down/90?cb=20210329181336	September 24, 2015\n(Beta 1.18.0)
3	Barraza	Diesel Heart, The Lord of the Waste	The Apocalypse came not on a missile but a mist. MBFC’s self-replicating nanobot cloud bricked anything that relied on computer circuitry, which in 2150 was everything. Deployed in desperation against a rogue agent’s hideout, the weaponized mist was supposed to become inert after twenty minutes.\nFifty years later, Barraza was born in an abandoned aircraft carrier outside the girder wastes once called Los Angeles. All Barraza knew of this world was that he had to steal, scheme, and fight for every bite of food and every breath. \nShot in the chest by The Gaslords and left for dead, he returned, kept alive by an artificial heart burning diesel and an iron will. Soon the Gaslords were dead, followed by the Ravagers, the Scorpions, the Battleborn, and every other challenger, until the man they called Diesel Heart ruled the wastes from Four Face Mountain to the Steel Wall. Waterhaulers, warbangers, zealots, radsuits, wastecroppers, junkers - all feared Diesel Heart.\nThe ultimate survivor, Barraza knows Valhalla is another threat to overcome through violence and will. The next apocalypse is coming, and he will do what it takes to come out on top again.	3900	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6f/Barraza.png/revision/latest?cb=20210315012052	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/66/Portrait_Barraza.png/revision/latest/scale-to-width-down/90?cb=20210329181431	October 20, 2015\n(Beta 1.20.1)
19	Ember	The Fangwild's Daughter	No mortal has seen the center of the Fangwild Forest. The magic is too dense, the peril is too deep. Not the elves who live on the edges of the Fangwild. Not the adventurers and fools who brave the forest in search of paths to other universes. Not the ghouls and beasts drawn in by the call of magic.  No mortal but Ember.\nFor thousands of years, Ember hunted the ever-changing paths of the Fangwild. With the wolf Ash and her raven Yarra, she guarded the Fangwild from itself, and protected the bordering worlds from the eldritch wood. She fought the Primordials. She befriended a lonely Minotaur. She rescued a furious viking lost deep in the Fangwild’s heart. She rode a wild dragon through the maelstrom at the heart of the forest. In ancient days before Valhalla, Fangwild's borders touched even Asgard, and Ember walked with the first warriors among the mighty trees that would form its rafters.\nNow, amidst the glory of her afterlife in Valhalla, Ember’s mind is fixed on the Fangwild, and the Fangwild mourns its daughter. With Ember gone into Valhalla, the Fangwild has slipped into madness. Twisted and impassable, its wilds threaten to spill out across the many realms it touches. Ember knows there are paths both to and from Valhalla. She fights in the tournament, hoping that in victory she can find a way back and set things right in her forest home.	900	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/38/Ember.png/revision/latest?cb=20210315013318	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a6/Portrait_Ember.png/revision/latest/scale-to-width-down/90?cb=20210329181600	November 11, 2015\n(Beta 2.1)
5	Ulgrim	The Unyielding Anvil, Son of Ivaldi	The Sons of Ivaldi are the original master craftsmen of Asgard. For eons, Ulgrim and his brothers have made mighty artifacts in their mystical forges deep underground.\nThanks to Loki and his gambling ways, other, upstart dwarves were chosen to forge Thor's hammer. Even though they botched the handle, they were still celebrated and stole the Sons' place of prestige.  So was born a bitter rivalry lasted for centuries, both sides constantly trying to outdo the other. But when the comet came crashing down, it was Ulgrim Ivaldson and his brothers that the gods turned to once again.\nOnly the Sons of Ivaldi had the materials to build what was needed. For ages Ulgrim had harvested hundreds of impossible artifacts, a still flaming dragon's heart, the core of a dying star, Aesinite from the nether realm. Nothing too rare, and no mine too perilous or too far for Ulgrim. The Sons' name was finally restored in a suit of golden armor.\nNow he wields his flawless Ivaldi creations in the arena, proving their perfection with each win. When he isn't in the ring he can often be found arguing fiestily with Scarlet on her contraption building methods. But always he keeps a glimmering eye on Orion and stays close. Some say out of pride, others say it's concern for what will happen if the armor were ever to fail.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/33/Ulgrim.png/revision/latest?cb=20210315020349	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d1/Portrait_Ulgrim.png/revision/latest/scale-to-width-down/90?cb=20210329182307	March 2, 2016\n(Release 2.9)
16	Jhala	The Unbroken	Life was tough for the hardy villagers of the Ikrusk. They survived freezing winters in the shadow of Mt Tragedy by huddling around pools of the hellfire that rained eternally from its peak. A good summer was when the scorpion swarms thinned out the vampires. By day they would tend livestock, and by night they would drive back the haunted suits of armor that fell from the sky. Hardship made them tough, and most potential enemies were awed enough to leave them alone.\nNot so The Lord of Scales. Riding the Dragon of Conflagration, he burned the village to the ground and then some. Young Jhala survived only because she was safely suspended in midair, climbing the dragon’s bulk with axe and knife. In the sky over her burning town, Jhala cast down The Lord of Scales and seized control of the Dragon. However, it was too late for her home. Astride the great wyrm, Jhala set off.\nThus began the greatest adventure epic of the age. Jhala stole the Scepter of Invincibility from the (formerly) Invincible King. She bested the Orc Warlord in single combat, earning the (purely honorary) title "Friend". She won the city of Dragonport in a drinking contest with the pirate queen. Apollo himself gave Jhala the title “Exalted Lion” after she led the armies of all Thera to victory against Ehzot, the Zombie Lord.\nJhala takes the glamor of Valhalla in stride, thinking at any moment she could be back to roast scorpion and improbably violent precipitation. But in the meantime this is fun too.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9a/Jhala.png/revision/latest?cb=20210315014544	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1f/Portrait_Jhala.png/revision/latest/scale-to-width-down/90?cb=20210329181802	April 27, 2016\n(Beta 2.13)
46	Kor	The Boulder	Long ago, Elven sorcerers built a mighty army of golems. The Elven King marched the golem army against Asgard. Bödvar still cries when he remembers that he was not at the battle that ensued. The Elves were defeated and the Asgardians took the golems as spoils of war. They put the golems to work performing the menial labor of Asgard. But unknown to the Asgardians, the golems are sentient creatures and never forgot that they were made for battle.\nTen thousand years later, Sentinel, investigating the hidden places of the city, discovered secret golem fight clubs. In these arenas, the golems shed their quiet, biddable exterior and rekindled the terrifying ferocity of their warrior days.\nAnd everywhere Sentinel heard whispers of the mighty Kor. Kor the Unvanquished, Kor the Destroyer, Kor the Magnificent. Kor, who all those years ago had led the golem charge right to the steps of Odin’s palace and matched fists with Thor himself, was now the greatest golem fighter of them all. \nSentinel, political genius that he is, did not reveal himself, but simply left for Kor a hammer engraved with the Asgardian symbol for justice. Soon after, Kor the Golem entered the Grand Tournament wielding his mighty fists and the hammer. His victories inspire the movement for golem justice, though Kor also continues to enjoy his job as assistant platform mover in Blackguard Keep.	3900	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/96/Kor.png/revision/latest?cb=20210315015002	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/99/Portrait_Kor.png/revision/latest/scale-to-width-down/90?cb=20210329181842	June 1, 2016\n(Beta 2.16)
43	Mordex	The Ravenous	It is not easy to become a lycanthrope on purpose. A werewolf bite rarely works, because the bite is almost always followed by being eaten by a werewolf. So when Octavius Mordex, Master Hunter of the Order of the Exalted Lion, was ordered to take his team into the frozen north to hunt down a plague of werewolves and frost giants, he knew he had to plan his treachery carefully.\nMordex had wormed his way into the noble Order not to do good, but to get closer to the monsters whose powers he so desired. He overthrew the Cult of The Ice Witch but reported their Tome of Rituals "lost in the fire." He destroyed the Wraith of Darkmoor but secretly took the fiend’s great scythe Cull for himself. And now he saw his chance to gain power of a whole new sort.\nA year later, Mordex returned from the north with a tale of horror and victory. Trapped in an unholy ice storm, his team surrounded by werewolves and giants, he told a tale of starvation, desperation, and heroic battle. He was the only survivor. No one questioned that Mordex himself seemed quite well fed.\nAcclaim and promotion followed. Soon, only the vigilance of another hunter, Diana, stood between him and his ultimate target: the Geminius Virens -- a cursed artifact hidden in the deepest vaults of the Order. Calling on dark magic, he ambushed Diana and escaped with his prize.\nIn Valhalla, Mordex is horrified and delighted to find the monster is his true form. Valhalla forms strange alliances, and Mordex finds himself in accord with the likes of Thatch and Azoth, much to the fury of his nemesis.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2d/Mordex.png/revision/latest?cb=20180620204144	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/Portrait_Mordex.png/revision/latest/scale-to-width-down/90?cb=20210329181943	March 29, 2017\n(Beta 2.54)
22	Yumiko	The Kitsune	Any Valkyrie could see that the blind seamstress was a centuries old fox spirit in disguise. Only the half-Valkyrie saw a great Valhallan.\nFrom time immemorial the Japanese village of Aoku sat at peace on the edge of the great northern forest. Then the forest changed. The winters grew bitter, and the cold seemed to flow out of the forest itself. From the forest too came great wolves - first in ones and twos and then in great packs. The forest came to be called Kiba, The Fang, and the villagers feared.\nTo villagers, Yumiko, the blind seamstress, was a happy soul - afraid of dogs, and roused to anger only by shoddy needlework. None ever knew that, at the age of 537, she picked up a bow for the first time and went to war with the monsters of the Kiba. \nThe first winter, she rescued a toddler from a wandering wolf, the second winter she slew a pack of wolves to protect the hibernating Tororu. Year after year, the assault grew, and so did her skill. By the twenty-fifth year, she had defeated a Tengu army, slain a dragon, and realized she must confront this mystery at its source.\nWeary but determined, she traveled deep into the woods. There she fought the witch Ukionna and broke the bond between Yumiko's world and the twisted forest corrupting her land. In the final moments of the battle, a valkyrie appeared. Without a word, Yumiko leapt on the flying horse and went happily to sleep.\nYumiko is happy to fight in the tournament, but she senses that she has one more great deed to accomplish. Yumiko recoils at the sight of Mordex, tinkers with Scarlet in her workshop, and has a quiet bond with the enigmatic Asuri.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1e/Yumiko.png/revision/latest?cb=20210315020732	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7c/Portrait_Yumiko.png/revision/latest/scale-to-width-down/90?cb=20210329182356	May 3, 2017\n(Release 2.59)
8	Xull	The Iron Commander	Xull seized command of the Iron Legion from the Troll Titan with a brutal down stroke. His first order was to create a cannon brigade. His second order was that cowardly long-range combat would not be tolerated.\nAs warlord of the mercenary army, he was savage, vengeful, and extremely effective. In battle, he rode a t-rex and swung a deadly steel trap made from his predecessor. His innovative use of the tactic “minotaur release” is still studied today.\nUnder Xull the Iron Legion grew rich and powerful. Recruiting was simple - he placed a generous bounty on his own head. Anyone fearless enough to attempt to claim it, and tough enough to survive the resulting beatdown, would be offered their own lives as the Legion's signing bonus.\nHis physical strength was legendary, and he would fight any challenger for any stakes. He only ever lost once, and he honored that wager, switching sides in the Undead Wars, despite being certain she must have somehow cheated.\nIn Valhalla, Xull knows he should always lead. He challenged Kor for leadership of the Golem Underground. He challenged Thor for leadership of Thursday. He challenged Scarlet for leadership of the Valhallan Ladies Book Club. At Ragnarok, he will lead a great army, and it makes little difference to him what side that army is on.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6c/Xull.png/revision/latest?cb=20200610141103	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/09/Portrait_Xull.png/revision/latest/scale-to-width-down/90?cb=20210329182348	November 22, 2017\n(Release 3.04)
45	Kaya	The Natural	When Kaya was six she could put an arrow through a falling snowflake. At eight she brought down two bison with one spear throw. At ten she was visited by an owl spirit who told her she would decide the fate of her world. More interesting to her, the spirit also showed her how to befriend the wooly mammoth.\nAtop her great mammoth, Blue, Kaya became the beloved icon of her tribe, the People of the Lights. Kaya and Blue stalked every corner of the frozen tundra, finding adventure and amassing a huge supply of lost mittens.\nIn Kaya's fourteenth year, the Ice Titans, thought to be only a legend, brutally attacked Kaya's village. The Titans pillaged or destroyed every store of food, skin, or kayak. Though still a child, Kaya and Blue led her people through the Northern Lights, straight into the heart of Jotunheim. In the Titan homeland, Kaya fought with the reckless bravery and tactical brilliance of one far beyond her years. \nThe valkyrie Hypernia saw Kaya's unconquerable heart and offered her a place in the warrior's heaven. In Valhalla, Kaya rejoiced in exploring the strange world of Asgard with her best friend, Hypernia's young daughter Brynn. Now, as Brynn has grown older, Kaya has begun to take an interest in the Grand Tournament as well, and she thinks perhaps she and Blue will give it a try.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/97/Kaya.png/revision/latest?cb=20210315014806	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/68/Portrait_Kaya.png/revision/latest/scale-to-width-down/90?cb=20210329181822	January 10, 2018\n(Release 3.08)
55	Jiro	The Shogun's Shadow	The masterful shinobi from the Iga and Koga clans were known far and wide. It was behind these clever diversions that the unparalleled Gensoujin family plied their trade.\nSecreted away in the Realm of Twilight it was here that Jiro trained as a child. From the beginning, his reckless and unorthodox ways kept him at the top of his class and in trouble with the elders. When he was told to “use the darkness to your advantage,” he convinced other trainees’ Shadows to fight on his side and set a school record. Perfecting his own Saiyokage technique, he began taking others’ Shadows for good and struck out on his own.\nIf the family dojo wasn’t ready for Jiro, his targets in the mortal world were even less prepared. With each victory he added another Shadow to his arsenal. Shogun Mizugawa’s reign ended in the setting sun when Jiro’s Shadow stretched over the fortress wall and sliced him in two. He hooked and set the Blood Moon with his Kusarigama to turn the Demon Shogun Yotsunaga mortal. Briefly. Most notably, Jiro employed the forbidden Full Eclipse Blade technique and Shogun Fujiyama disappeared under a flood of Shadows along with his entire army.\nNow in Valhalla, some say Jiro is hiding from death, but Wu Shang says he's hiding behind the grand tapestry in the Great Hall as a part of the yearly hide-and-go-seek tournament with Kaya and Caspian. Together, Jiro and his shadows climb the rankings and are still all too happy to take a contract for the right price.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5a/Jiro.png/revision/latest?cb=20210315014715	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5c/Portrait_Jiro.png/revision/latest/scale-to-width-down/90?cb=20210329181809	April 18, 2018\n(Release 3.19)
56	Zariel	The Celestial	Zariel is on a mission from God - specifically the god Paladium, the warrior deity of Holy Justice who abides in blessed Elysium. In Elysium too, Zariel resided, a saintly soldier in Paladium’s perfect celestial army that stands ready to fight the demon hordes that will one day be released from Gehenna.  \nAges ago, Elysium was visited by the leader of another pantheon - Odin the All-Father. The Viking God was impressed by Paladium’s mighty host - and jealous. Returning to Asgard, Odin sent out his valkyries to raise his own army for the end-times.  Naturally, Paladium scoffed - no boorish viking horde could ever match his most excellent and holy host.  \nBut recently, Paladium has heard rumors that the valkyries’ intense rivalry to bring back the best warriors has borne fruit. And he’s heard whispers that through the chaos and nonsense of the Grand Tournament of Valhalla, Odin’s ragtag army of the afterlife has forged itself into a formidable force. Paladium has sent Zariel to investigate.  \nIn Valhalla, Zariel entered the tournament to take the measure of this motley crew. However, the battles of the Grand Tournament hold an allure for any warrior, and Zariel's emotionless participation is starting to give way to fun.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f4/Zariel.png/revision/latest?cb=20180731213139	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fc/Portrait_Zariel.png/revision/latest/scale-to-width-down/90?cb=20210329182402	July 25, 2018\n(Release 3.26)
28	Dusk	The Renegade Sorcerer	If there's one thing the Elven King regrets above all else, it's not killing Dusk thoroughly enough. It was Master Artificer Dusk who wove the mighty fabric of spells that created the great golem battalions. It was Dusk who led the golem assault on Asgard. And when the elves were defeated by Thor and the valkyries, it was Dusk whom the Elven King blamed. \nDusk was thrown into Elondil Prison, and for four hundred years, there he stayed. But he was not defeated. For two hundred years, in a bare and lightless cell, Dusk forged the tool that would free him - an orb made of stone and magic. And, for another two hundred years, Dusk taught himself to wield it, bonding the Orb to his will and turning the tool into a weapon. \nWhen he was ready, the orb smashed walls and guards alike, and Dusk escaped Aelfheim into the great Fangwild forest. The Guardian of the Fangwild was not prepared for the strange new weapon Dusk wields and fell to his ambush. Styling himself the new Lord of the Fangwild, he gathered the power of the eldritch forest and schemes to overthrow both Aelfheim and Asgard. \nBut the Fangwild is not so easy to master, and now Dusk is in Valhalla. Yet his ambitions run deep, and he is planning something big. Dusk and the new weapon he wields have taken the Grand Tournament by storm. Ember and Ragnir loathe him as a betrayer, but his intensity and ambition have gathered him a following among the less scrupulous legends.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5d/Dusk.png/revision/latest?cb=20210315013217	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/19/Portrait_Dusk.png/revision/latest/scale-to-width-down/90?cb=20210329181554	November 28, 2018\n(Release 3.33)
23	Fait	The Star Speaker	Great oracles are rare because by the time a witch has toiled through the many grueling years required to master Starspeak, they’ve almost certainly lost the charm and positive attitude needed for stars to want to talk to them. Fait’s greatest power was most likely her unwavering good-nature.\nAs a young witch Fait would hang out with the stars at night, who gave her fleeting visions of past, present, and future. In daylight, she made ends meet selling fortunes on the streets of Edasich. As her power grew, she learned to deduce a human’s fate from the smallest visions.\nBut when the mighty Deathspeaker Lord Zothkhan arose, Fait transformed herself into a battlemage to oppose his monstrous army. The world soon learned just how powerful even the smallest glimpse of the future could be in battle. Her vision of The Invulnerable Pit Fiend facedown with a scythe blade buried in his weak spot spelled his doom. Her foresight of a flattened werewolf led her to lure the vampire general into Avalanche Gulch.\nAnd a vision of a lava-scorched Lord Zothkhan in the afterlife, retrieving his beloved cat from its demon caretaker, prompted her to bring her own cat Butterscotch as a distraction to her showdown with the Deathspeaker on a bridge over Mount Inferno.\nWhen Brynn came to offer her a place in Valhalla, Fait had already packed. In Valhalla Fait is popular, and has joined a band, a book club, and wins big on poker nights.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/67/Fait.png/revision/latest?cb=20210315013440	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7a/Portrait_Fait.png/revision/latest/scale-to-width-down/90?cb=20210329181613	January 30, 2019\n(Release 3.36)
25	Vector	The Superbot	In the year 3006, cybermarine Arcturius Vector pursued his nemesis, the Mechassassin Blackstorm far into the distant past of New Earth. His mission did not go as planned.\nFirst, when Vector arrived in 1987 he discovered his time had a very distorted image of what humans looked in the ancient past. Humans were not steel-winged, they did not subsist on a primitive naphtha-kerosene blend, and they did not have epic guitar chords playing in the background at all times. If he ever returned to his own time, he would correct Engram-Killivac's Encyclopedia of World History. But in the meantime, it was too late to change, and while his jet-hybrid form was not the disguise he'd hoped, it was comfortable, useful and incredibly cool.\nSecond, when Vector found Sentinel, he discovered not a defenseless civilian, but a Superhero locked in deadly combat with the evil KABAL, and an Earth assaulted by villains and threats of all sorts. Vector pitched in with enthusiasm. He led the counterattack against an alien invasion force, he defeated a squadron of super-intelligent super-jets, and he fought Blackstorm in a battle over Los Angeles so epic that the soundtrack could be heard as far away as New Mexico.\nIn Valhalla Vector fights, builds jet engines with Scarlet, teaches yoga, and communicates mostly in Top Gun quotes. But he has recently discovered that Scarlet may know more about time travel than she admits, and his circuits are beginning to whir.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/27/Vector.png/revision/latest?cb=20190929210243	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ac/Portrait_Vector.png/revision/latest/scale-to-width-down/90?cb=20210329182320	September 20, 2019\n(Release 3.49)
40	Onyx	The Gargoyle	Onyx's escape from the Infernal Realm was grueling and perilous. When she finally emerged from the pit, she found herself in a mysterious castle without a plan, and the demons tasked with recapturing the fleeing spirit were in hot pursuit.\nWith the help of a haunted suit of armor, she soon discovered the secret to her salvation. Binding herself to the stone of the castle, she pledged service to the great fortress. And cosmic laws being what they are, she could not be taken from her post - even by the forces of darkness themselves.\nFor hundreds of years, Onyx was the Guardian and Protector of Castle Batavia. The War of the North, The Siege of a Hundred Thousand Turks, The Battle of Dragonriders – again and again her steadfast fury protected Castle Batavia from the mightiest of assailants. No castle guarded by Onyx could ever fall while she stood.\nAnd yet the castle did fall. For hundreds of years she’d defended the castle and its inhabitants without question, but in the midst of the legendary Siege of Lions, the commander of the assailants showed her the depravity of the mad king she defended. Knowing that it meant her own return to the Abyss, she allowed the castle to fall. One of the many Valkyries swirling above the vast battlefield, seeing her sacrifice, swooped in just ahead of the demons and offered her a place in Valhalla.\nValhalla is now Onyx’s castle and she defends it with ruthless intensity. She occasionally fights in the tournament to hone her skills and she hopes Valhalla is her eternal escape from The Pit. She also hopes she can get the book club reading done – her stony fingers have trouble with the pages.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fb/Onyx.png/revision/latest?cb=20200317013921	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d4/Portrait_Onyx.png/revision/latest/scale-to-width-down/90?cb=20210329182002	March 16, 2020\n(Release 3.58)
10	Mako	The Shark	Atlantis wasn't always at the bottom of the sea. That was Mako's fault. In the Great War of Atlantis at the end of the age of legend, the gods battled for control of the fabled city. Zeus struck down Poseidon with a lightning bolt. In rage, Poseidon's young daughter Mako led an attack on Atlantis so terrible that the sorcerors of the city chose to sink it beneath the waves to escape her wrath, robbing Zeus of his prize. Then for good measure she bit off his foot.\nPoseidon fell to earth, his memory gone, doomed to wander the seas as a madman. But Mako became the queen of the now undersea city - much to the relief of the Atlanteans. Her terrifying presence won many battles on fear alone. The Phoenician navy fled when it saw her teeth. She scared the sea monster Cetus so badly it fled to Scotland and is still hiding. She was less interested in governing than fighting, and invented democracy because she was tired of subjects asking her questions.  \nIn Valhalla, Mako is a ferocious competitor and a great 2v2 partner, though be careful if she calls you 'chum' - it's not a term of endearment.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a6/Mako.png/revision/latest?cb=20201001180242	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/53/Portrait_Mako.png/revision/latest/scale-to-width-down/90?cb=20210329181922	October 1, 2020\n(Release 4.07)
37	Munin	The Raven	Munin’s day job is to fly across the Nine Realms of Creation, and then return to Asgard to tell Odin, King of the Gods, what she has seen. If she finishes her report by 5:30 she’ll make it to band rehearsal on time. She’s been doing this since the Midgard Serpent was a tadpole and is, by now, both very wise and can absolutely shred.\nThere was a time when Odin worried about the terrible dangers Munin faces in her travels, fearing that one day she would not return. Then he saw her shatter the ice giant Mjolda with a savage power chord. She had merged her music into her fighting style to create a fearsome, versatile martial art. Her power ballad ‘The Last Sentai’ caused an invading army of trolls to sit down and cry – an army she had accidentally summoned with her folk-metal hymn ‘Summon the Trolls.’ Roland wrote a song about the song she wrote that crushed him in a tournament semi-final. Odin doesn’t worry about Munin anymore.\nMunin loves variety, new style, and shiny objects. With her sister Hugin, she is currently the Asgardian glam-rock duo Ravenqueen - previously Winged Mayhem, previously The Chorvyds, previously The Crow Mountain Sisters (their bluegrass phase).\nThe Grand Tournament is a way for Munin to win beautiful things she can add to her collection - a mountain of priceless gemstones, rare beads from each of the nine realms, and colorful bits of string. Munin and Kaya use it to make friendship bracelets.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/52/Munin.png/revision/latest?cb=20211013174243	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/35/Portrait_Munin.png/revision/latest/scale-to-width-down/90?cb=20211013215511	October 13, 2021\n(Release 6.00)
59	Red Raptor	The Last Sentai	When Daizen Doro was five, his home planet of Shensekai was invaded by an army of Kaiju. These giant beasts ravaged the planet at the command of a shadowy mastermind known as ‘Loki.’ Daizen’s people fought back with iron will and technology, building giant mechs powered by the spirits of their pilots. The greatest mech team was Raptor Force – Golden Goshawk, Silver Harrier, Black Buzzard, and Blue Osprey – led by the greatest mech pilot of the age, Daizen, the Red Raptor. Intense and determined, Red Raptor and Raptor Force otok down Tokage, the dragon Kaiju with a homing missile, the great slithering Unagi with a rock-powered kick, and the great beast Gorira with a giant banana peel. In the climactic final battle, the most powerful Kaiju, super-powered by a mysterious force called Darkheart, destroyed Red Raptor’s team and imprisoned the spirits of the pilots. As the Kaiju closed in, Red Raptor, in a final desperate gambit, detonated the anti-Darkheart core of his own mech, immolating both the monsters and himself. As he stepped into the afterlife, Daizen made yet another sacrifice – turning away from the heavenly road that would lead to his ancestors, some lonely instinct made him accept the Yalkyrie’s offer of Valhalla. Now Koji has become a mentor, Vector an ally, and Petra a clue in Red Raptor’s new mission: In Valhalla he will hunt down this ‘Loki,’ unravel the mystery of the darkheart, and rescuse his lost team one final time.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/02/Red_Raptor.png/revision/latest?cb=20230614195150	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4c/Portrait_RedRaptor.png/revision/latest/scale-to-width-down/90?cb=20230614201657	June 14, 2023\n(Release 7.09)
78	Loki	The Mastermind	It is difficult to predict a cataclysm. Even more difficult to prepare for one without being seen as mad. So, when Loki was tasked by the gods to seal a dangerous substance with his controversial patented dimensionmancy, he believed his genius was finally being recognized.\n\nBeing turned against and imprisoned in your own research might infuriate some, but Loki holds it as a point of pride that it only took him 4214 years to escape. In his time away, denizens of Valhalla have not been kind in their writings and whispers about the God of Schemes. Though Loki himself much prefers the term “Strategy.”\n\nThe bards sing of the night he cheated 12 demiurges out of their elemental schematics during the annual pantheon pot-luck poker night. Loki denies any foul play, chalking things up to patience and keen eyes. The scholars tell of how he infused heroes and beasts with condemned titan blood. The “R.A.G Research,” he promises, will yield worthwhile results in the years to come. And the secretaries murmur the tale of how he rearranged the realm bridges with portals to evade Heimdall’s wrath after he stole the Gjallarhorn for an emergency alert test. Loki could only nod and admit that one was pretty fun.\n\nBut for all his supposed mischief and misdeeds, Loki willingly returns to Terminus when not collecting data in the Grand Tournament or tinkering on a personal project in the forgotten Brawlcade. There, away from scrutinizing glares, he can continue to refine his knowledge and skills in preparation for what's to come. Despite what others think, he knows that all ends will justify the means.	5400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fe/Loki.png/revision/latest/scale-to-width-down/250?cb=20230930184921	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/Portrait_Loki.png/revision/latest/scale-to-width-down/90?cb=20230928175255	September 28, 2023 (Release 7.13)
\.


--
-- TOC entry 3502 (class 0 OID 38712)
-- Dependencies: 228
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (review_id, user_id) FROM stdin;
4	5
9	5
8	2
10	2
10	5
8	5
11	9
11	5
8	14
9	14
4	14
11	14
\.


--
-- TOC entry 3503 (class 0 OID 38715)
-- Dependencies: 229
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, text, mark, legend_id, user_id, type_id, date, change_date) FROM stdin;
4	stringfff	2	1	5	1	2023-10-19 15:39:49.693313	2023-11-22 19:41:56.24725
8	fff	\N	1	5	2	2023-11-22 16:53:43.559969	\N
9	l	\N	1	5	2	2023-11-22 16:57:07.50492	\N
10	ssss	2	1	2	1	2023-11-24 05:09:03.499639	2023-11-24 08:14:11.312312
11	arcadia is the good hero for anal domination . you got to control the edge by your down RMB skill and control air by up RMB skill  	\N	27	9	2	2023-11-30 21:52:03.087583	\N
\.


--
-- TOC entry 3505 (class 0 OID 38721)
-- Dependencies: 231
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
1	User
2	Admin
\.


--
-- TOC entry 3507 (class 0 OID 38725)
-- Dependencies: 233
-- Data for Name: skins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skins (id, name, img, is_crossover, is_exclusive, cost, purshase_info, legend_id) FROM stdin;
2	Cyber Bödvar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5b/Cyber_B%C3%B6dvar.png/revision/latest/scale-to-width-down/190?cb=20180727004428	f	f	140	{Store}	50
3	Big Rig Bödvar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3f/Big_Rig_B%C3%B6dvar.png/revision/latest/scale-to-width-down/196?cb=20200513171813	f	f	140	{}	50
4	Asgard Bödvar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d2/Asgard_B%C3%B6dvar.png/revision/latest/scale-to-width-down/195?cb=20210616024833	f	f	\N	{"Part of the Collectors Pack."}	50
5	Marauder Bödvar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/09/Marauder_B%C3%B6dvar.png/revision/latest/scale-to-width-down/173?cb=20180727005734	f	f	140	{Store}	50
6	Warchief Bödvar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2d/Warchief_B%C3%B6dvar.png/revision/latest/scale-to-width-down/193?cb=20190609001925	f	t	\N	{}	50
7	Bödvar-mania	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8f/B%C3%B6dvar-mania.png/revision/latest/scale-to-width-down/198?cb=20180727005826	f	f	140	{Store}	50
8	Draugr Bödvar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a2/Draugr_B%C3%B6dvar.png/revision/latest/scale-to-width-down/198?cb=20200414201718	f	t	\N	{}	50
9	Nutcracker Bödvar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dd/Nutcracker_B%C3%B6dvar.png/revision/latest/scale-to-width-down/170?cb=20190609001159	f	t	140	{}	50
10	Metadev Bödvar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b8/Metadev_B%C3%B6dvar.png/revision/latest/scale-to-width-down/188?cb=20190526034518	f	f	\N	{"Not normally obtainable.","See Metadev"}	50
12	Ritzy Bödvar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c4/Ritzy_B%C3%B6dvar.png/revision/latest/scale-to-width-down/181?cb=20201112205521	f	t	140	{}	50
13	Vanir Guardian Bödvar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/29/Vanir_Guardian_B%C3%B6dvar.png/revision/latest/scale-to-width-down/179?cb=20210224203506	f	f	\N	{"Season Three | Tier 71 Reward"}	50
14	Space Race Cassidy	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3f/Space_Race_Cassidy.png/revision/latest/scale-to-width-down/198?cb=20200513172610	f	f	140	{Store}	14
15	High Noon Cassidy	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/06/High_Noon_Cassidy.png/revision/latest/scale-to-width-down/198?cb=20190608192444	f	f	100	{}	14
16	Masked Hero Cassidy	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/db/Masked_Hero_Cassidy.png/revision/latest/scale-to-width-down/198?cb=20230428000513	f	f	80	{}	14
17	Serape Kid Cassidy	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/63/Serape_Kid_Cassidy.png/revision/latest/scale-to-width-down/198?cb=20190608192445	f	f	140	{Store}	14
18	Cupcake Cassidy	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cb/Cupcake_Cassidy.png/revision/latest/scale-to-width-down/198?cb=20190608192441	f	f	140	{Store}	14
19	Dawnwalker Cassidy	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2f/Dawnwalker_Cassidy.png/revision/latest/scale-to-width-down/198?cb=20190608192443	f	f	140	{Store}	14
20	Calavera Cassidy	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4c/Calavera_Cassidy.png/revision/latest/scale-to-width-down/198?cb=20190608192439	f	f	140	{}	14
21	Dust Devil Cassidy	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/61/Dust_Devil_Cassidy.png/revision/latest/scale-to-width-down/198?cb=20200619024332	f	t	\N	{}	14
23	Nutcracker Cassidy	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/de/Nutcracker_Cassidy.png/revision/latest/scale-to-width-down/189?cb=20200619024351	f	t	140	{}	14
24	Bitpunk Cassidy	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/88/Bitpunk_Cassidy.png/revision/latest/scale-to-width-down/198?cb=20210201201632	f	f	140	{}	14
25	New West Cassidy	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2c/New_West_Cassidy.png/revision/latest/scale-to-width-down/198?cb=20230215171926	f	f	140	{}	14
27	Harbinger Orion	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/31/Harbinger_Orion.png/revision/latest/scale-to-width-down/110?cb=20190620010307	f	f	200	{Store}	2
28	Atomic Orion	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/44/Atomic_Orion.png/revision/latest/scale-to-width-down/104?cb=20180624185827	f	f	80	{}	2
29	Metadev Orion	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3f/Metadev_Orion.png/revision/latest/scale-to-width-down/111?cb=20181210222803	f	f	\N	{"Not normally obtainable.","See Metadev"}	2
30	Orion For Hire	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/eb/Orion_For_Hire.png/revision/latest/scale-to-width-down/106?cb=20190620010308	f	f	200	{Store}	2
31	Kabuto Orion	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/73/Kabuto_Orion.png/revision/latest/scale-to-width-down/108?cb=20190620010303	f	f	140	{Store}	2
32	Corsair Orion	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/28/Corsair_Orion.png/revision/latest/scale-to-width-down/119?cb=20190620233938	f	t	\N	{}	2
33	Atlantean Orion	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/25/Atlantean_Orion.png/revision/latest/scale-to-width-down/109?cb=20190620010304	f	t	140	{}	2
34	Crossfade Orion	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5f/Crossfade_Orion.png/revision/latest/scale-to-width-down/109?cb=20190620010306	f	t	\N	{}	2
22	Globox	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/33/Globox.png/revision/latest/scale-to-width-down/185?cb=20220107221335	t	f	300	{}	14
36	Cyber Oni Orion	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/33/Cyber_Oni_Orion.png/revision/latest/scale-to-width-down/100?cb=20210519162212	f	f	140	{Store}	2
38	Live Action Orion	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a9/Live_Action_Orion.png/revision/latest/scale-to-width-down/112?cb=20230809213834	f	f	\N	{"Season Eight | Tier 65 Reward"}	2
39	Vraxx the Viking	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c3/Vraxx_the_Viking.png/revision/latest/scale-to-width-down/146?cb=20201209210659	f	f	80	{}	39
40	Supreme Ruler Vraxx	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/68/Supreme_Ruler_Vraxx.png/revision/latest/scale-to-width-down/155?cb=20201209210628	f	f	140	{Store}	39
41	Vraxx the King	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9b/Vraxx_the_King.png/revision/latest/scale-to-width-down/166?cb=20201209210644	f	f	140	{}	39
43	General Vraxx	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a1/General_Vraxx.png/revision/latest/scale-to-width-down/145?cb=20201209210616	f	t	\N	{}	39
44	Space Dogfighter Vraxx	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/55/Space_Dogfighter_Vraxx.png/revision/latest/scale-to-width-down/127?cb=20210811164350	f	f	140	{Store}	39
45	Wasteland Vraxx	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/09/Wasteland_Vraxx.png/revision/latest/scale-to-width-down/148?cb=20201209210712	f	f	200	{Store}	39
47	Professor Vraxx	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c1/Professor_Vraxx.png/revision/latest/scale-to-width-down/153?cb=20200826221947	f	t	140	{}	39
48	Vraxxy Jones	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/41/Vraxxy_Jones.png/revision/latest/scale-to-width-down/149?cb=20220622205513	f	t	140	{}	39
49	Jurassic Gnash	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7e/Jurassic_Gnash.png/revision/latest/scale-to-width-down/198?cb=20200813133458	f	f	140	{Store}	1
50	Team Spirit Gnash	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5c/Team_Spirit_Gnash.png/revision/latest/scale-to-width-down/187?cb=20200513172533	f	f	140	{}	1
51	Outback Gnash	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/85/Outback_Gnash.png/revision/latest/scale-to-width-down/198?cb=20200813133136	f	f	80	{}	1
52	White Fang Gnash	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/03/White_Fang_Gnash.png/revision/latest/scale-to-width-down/184?cb=20200813133546	f	t	\N	{}	1
53	Pteranodon Gnash	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/92/Pteranodon_Gnash.png/revision/latest/scale-to-width-down/180?cb=20200813133519	f	f	140	{"Charity Stream #4",Store}	1
54	Mogar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ca/Mogar.png/revision/latest/scale-to-width-down/197?cb=20200813133510	f	f	200	{}	1
55	Chrometooth Gnash	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9a/Chrometooth_Gnash.png/revision/latest/scale-to-width-down/198?cb=20200813133442	f	f	140	{Store}	1
56	Silvermane Gnash	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f8/Silvermane_Gnash.png/revision/latest/scale-to-width-down/179?cb=20200813133534	f	t	\N	{}	1
57	The Monster Gnash	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fb/The_Monster_Gnash.png/revision/latest/scale-to-width-down/198?cb=20191103171101	f	t	140	{}	1
60	Reindeer Games Gnash	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/eb/Reindeer_Games_Gnash.png/revision/latest/scale-to-width-down/181?cb=20211215150616	f	t	140	{}	1
61	Snake Charmer Nai	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/65/Snake_Charmer_Nai.png/revision/latest/scale-to-width-down/198?cb=20200513172424	f	f	80	{}	33
62	Snake Goddess Nai	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5e/Snake_Goddess_Nai.png/revision/latest/scale-to-width-down/198?cb=20201206035608	f	f	140	{Store}	33
63	Tomb Tamer Nai	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/54/Tomb_Tamer_Nai.png/revision/latest/scale-to-width-down/198?cb=20200513172443	f	f	140	{Store}	33
64	Date Night Nai	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/52/Date_Night_Nai.png/revision/latest/scale-to-width-down/198?cb=20200315014810	f	t	140	{}	33
65	Empress Nai	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ef/Empress_Nai.png/revision/latest/scale-to-width-down/198?cb=20201206035514	f	f	140	{Store}	33
66	Winged Serpent Nai	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c4/Winged_Serpent_Nai.png/revision/latest/scale-to-width-down/198?cb=20201206035625	f	t	\N	{}	33
67	Galaxy X Nai	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dc/Galaxy_X_Nai.png/revision/latest/scale-to-width-down/198?cb=20201206035526	f	f	140	{Store}	33
68	Nidhogg Nai	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6d/Nidhogg_Nai.png/revision/latest/scale-to-width-down/198?cb=20201206035552	f	t	\N	{}	33
69	Lady of the Dead Nai	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/12/Lady_of_the_Dead_Nai.png/revision/latest/scale-to-width-down/198?cb=20201206035539	f	f	140	{}	33
37	Orion Prime	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b1/Orion_Prime.png/revision/latest/scale-to-width-down/185?cb=20220119200536	f	f	\N	{"Season Five | Tier 85 Reward"}	2
71	High Priestess Nai	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0b/High_Priestess_Nai.png/revision/latest/scale-to-width-down/198?cb=20210812052231	f	f	\N	{"Season Four | Tier 47 Reward"}	33
72	Sea Krait Nai	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a9/Sea_Krait_Nai.png/revision/latest/scale-to-width-down/198?cb=20230614195321	f	t	140	{}	33
73	Kill Thrill Hattori	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/31/Kill_Thrill_Hattori.png/revision/latest/scale-to-width-down/134?cb=20200513172039	f	f	140	{Store}	29
74	Oni no Hattori	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/64/Oni_no_Hattori.png/revision/latest/scale-to-width-down/156?cb=20200513172252	f	f	80	{}	29
75	Nightblade Hattori	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/82/Nightblade_Hattori.png/revision/latest/scale-to-width-down/155?cb=20190412165902	f	f	140	{Store,"Dev Streams #2"}	29
76	Kitsune Hattori	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8e/Kitsune_Hattori.png/revision/latest/scale-to-width-down/130?cb=20200513171412	f	f	140	{Store}	29
77	Cutting Edge Hattori	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d7/Cutting_Edge_Hattori.png/revision/latest/scale-to-width-down/129?cb=20200513171334	f	f	140	{Store}	29
78	Death Adder Hattori	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/44/Death_Adder_Hattori.png/revision/latest/scale-to-width-down/128?cb=20200813153646	f	t	\N	{}	29
79	Demon Bride Hattori	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a2/Demon_Bride_Hattori.png/revision/latest/scale-to-width-down/140?cb=20200315014802	f	t	200	{}	29
81	Sidewinder Hattori	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cf/Sidewinder_Hattori.png/revision/latest/scale-to-width-down/148?cb=20200813153724	f	t	\N	{}	29
84	Maître d'Hattori	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/Ma%C3%AEtre_d%27Hattori.png/revision/latest/scale-to-width-down/130?cb=20211013231056	f	t	140	{}	29
86	Neostreet Hattori	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e1/Neostreet_Hattori.png/revision/latest/scale-to-width-down/134?cb=20230809213835	f	f	\N	{"Season Eight | Tier 50 Reward"}	29
87	Roland the Hooded	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/ba/Roland_the_Hooded.png/revision/latest/scale-to-width-down/198?cb=20201208060616	f	f	140	{Store}	15
88	King Roland	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/43/King_Roland.png/revision/latest/scale-to-width-down/194?cb=20180628165019	f	f	140	{Store}	15
89	Match Point Roland	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/00/Match_Point_Roland.png/revision/latest/scale-to-width-down/198?cb=20180711154451	f	f	140	{Store}	15
90	Classy Roland	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e1/Classy_Roland.png/revision/latest/scale-to-width-down/198?cb=20200315014815	f	t	140	{}	15
91	Lion Rampant Roland	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e3/Lion_Rampant_Roland.png/revision/latest/scale-to-width-down/193?cb=20201208060548	f	f	140	{Store}	15
92	The Mad King	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ae/The_Mad_King.png/revision/latest/scale-to-width-down/180?cb=20201208060645	f	f	200	{}	15
93	Lionheart Roland	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/27/Lionheart_Roland.png/revision/latest/scale-to-width-down/194?cb=20201208060602	f	t	\N	{}	15
94	Roland the Victorious	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/95/Roland_the_Victorious.png/revision/latest/scale-to-width-down/198?cb=20201208060629	f	f	140	{"Mammoth Arcadian '21",Store}	15
96	Fiendish Knight Roland	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/15/Fiendish_Knight_Roland.png/revision/latest/scale-to-width-down/198?cb=20210707161139	f	f	140	{}	15
97	The Honorable Sir Roland, Esq.	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/58/The_Honorable_Sir_Roland%2C_Esq..png/revision/latest/scale-to-width-down/196?cb=20221019131746	f	t	140	{}	15
98	Sky Captain Scarlet	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/33/Sky_Captain_Scarlet.png/revision/latest/scale-to-width-down/161?cb=20230427235825	f	f	80	{}	30
99	Steam Tank Scarlet	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d6/Steam_Tank_Scarlet.png/revision/latest/scale-to-width-down/153?cb=20190422184532	f	f	140	{Store}	30
100	Steamsmith Scarlet	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6a/Steamsmith_Scarlet.png/revision/latest/scale-to-width-down/155?cb=20201209000535	f	f	140	{Store}	30
101	Steam Sentry Scarlet	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/66/Steam_Sentry_Scarlet.png/revision/latest/scale-to-width-down/158?cb=20201209000522	f	f	140	{Store}	30
102	Bewitching Scarlet	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c6/Bewitching_Scarlet.png/revision/latest/scale-to-width-down/170?cb=20191103171102	f	t	200	{}	30
103	Airship Scarlet	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/47/Airship_Scarlet.png/revision/latest/scale-to-width-down/150?cb=20201214012625	f	t	\N	{}	30
83	Akuma no Kogo Hattori	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8f/AniAkuma_no_Kogo_Hattori.gif/revision/latest/scale-to-width-down/185?cb=20201214023509	f	f	\N	{"Season One | Tier 85 Reward"}	29
105	Steam Faction Scarlet	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c1/Steam_Faction_Scarlet.png/revision/latest/scale-to-width-down/152?cb=20201209000509	f	f	140	{}	30
106	Puella Papilio Scarlet	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e6/Puella_Papilio_Scarlet.png/revision/latest/scale-to-width-down/157?cb=20220622205434	f	f	\N	{"Season Six | Tier 71 Reward"}	30
107	Teatime Scarlet	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/69/Teatime_Scarlet.png/revision/latest/scale-to-width-down/198?cb=20230427001023	f	t	140	{}	30
108	Cursed Gold Thatch	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0c/Cursed_Gold_Thatch.png/revision/latest/scale-to-width-down/140?cb=20201209033618	f	f	200	{Store}	47
109	Castaway Thatch	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/Castaway_Thatch.png/revision/latest/scale-to-width-down/160?cb=20201113021845	f	f	200	{"Dev Streams #4",Store}	47
110	Biker Thatch	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5c/Biker_Thatch.png/revision/latest/scale-to-width-down/175?cb=20201113021909	f	f	140	{Store}	47
111	Secret Santa Thatch	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2b/Secret_Santa_Thatch.png/revision/latest/scale-to-width-down/154?cb=20201113021936	f	t	140	{}	47
112	Shark Attack Thatch	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/04/Shark_Attack_Thatch.png/revision/latest/scale-to-width-down/190?cb=20190620021844	f	f	140	{Store}	47
113	Goblin Thatch	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/95/Goblin_Thatch.png/revision/latest/scale-to-width-down/147?cb=20201209033631	f	f	140	{Store}	47
114	Poseidon Thatch	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e6/Poseidon_Thatch.png/revision/latest/scale-to-width-down/137?cb=20201209033644	f	t	\N	{}	47
115	Classy Thatch	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dc/Classy_Thatch.png/revision/latest/scale-to-width-down/164?cb=20201209033605	f	f	140	{}	47
116	Werewolf Thatch	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d0/Werewolf_Thatch.png/revision/latest/scale-to-width-down/170?cb=20201028174312	f	t	140	{}	47
118	Technomancer Ada	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/af/Technomancer_Ada.png/revision/latest/scale-to-width-down/198?cb=20190127220739	f	f	140	{"Winter Championship '23 - Week 1",Store}	12
119	Fatal Error Ada	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2c/Fatal_Error_Ada.png/revision/latest/scale-to-width-down/198?cb=20190605234903	f	f	140	{Store}	12
120	DJ Ada	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4b/DJ_Ada.png/revision/latest/scale-to-width-down/198?cb=20180701231426	f	f	140	{Store}	12
121	Vixen Ada	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/99/Vixen_Ada.png/revision/latest/scale-to-width-down/198?cb=20180701231424	f	f	140	{}	12
122	Wasteland Ada	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5a/Wasteland_Ada.png/revision/latest/scale-to-width-down/198?cb=20190605235538	f	f	140	{Store}	12
123	Atlantean Ada	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/22/Atlantean_Ada.png/revision/latest/scale-to-width-down/198?cb=20190606002333	f	t	\N	{}	12
124	Detention Ada	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6f/Detention_Ada.png/revision/latest/scale-to-width-down/198?cb=20190910023217	f	t	140	{}	12
125	Stormlord Ada	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/10/Stormlord_Ada.png/revision/latest/scale-to-width-down/198?cb=20200514170027	f	t	\N	{}	12
126	Lovelaced Ada	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/08/Lovelaced_Ada.png/revision/latest/scale-to-width-down/198?cb=20200315014824	f	t	140	{}	12
129	Gumshoe Sentinel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7e/Gumshoe_Sentinel.png/revision/latest/scale-to-width-down/166?cb=20201113022241	f	f	140	{"Dev Streams #6",Store}	6
130	High Impact Sentinel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8c/High_Impact_Sentinel.png/revision/latest/scale-to-width-down/117?cb=20201113022254	f	f	140	{Store}	6
131	Nightwatch Sentinel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dd/Nightwatch_Sentinel.png/revision/latest/scale-to-width-down/117?cb=20201127074616	f	f	140	{Store}	6
132	First Edition Sentinel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/86/First_Edition_Sentinel.png/revision/latest/scale-to-width-down/120?cb=20201127074559	f	f	140	{Store}	6
133	Lord Sentinel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ac/Lord_Sentinel.png/revision/latest/scale-to-width-down/121?cb=20201127074607	f	t	\N	{}	6
134	President Sentinel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/43/President_Sentinel.png/revision/latest/scale-to-width-down/118?cb=20201127074624	f	f	140	{Store}	6
135	Stormsteel Sentinel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ad/Stormsteel_Sentinel.png/revision/latest/scale-to-width-down/113?cb=20201127074633	f	t	\N	{}	6
137	Cú Sídhe Sentinel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/22/C%C3%BA_S%C3%ADdhe_Sentinel.png/revision/latest/scale-to-width-down/122?cb=20210317163643	f	t	140	{}	6
136	The Rock	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/db/The_Rock.png/revision/latest/scale-to-width-down/185?cb=20220107222302	t	f	300	{}	6
139	Dark of Night Lucien	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bd/Dark_Of_Night_Lucien.png/revision/latest/scale-to-width-down/169?cb=20180629135832	f	f	140	{Store}	13
140	Vive la Révolucien	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2a/Vive_la_R%C3%A9volucien.png/revision/latest/scale-to-width-down/138?cb=20201206024527	f	f	140	{"BCX Doubles '21",Store}	13
141	Plague Doctor Lucien	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/46/Plague_Doctor_Lucien.png/revision/latest/scale-to-width-down/153?cb=20201206024459	f	f	140	{Store}	13
142	Horseman Lucien	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4c/Horseman_Lucien.png/revision/latest/scale-to-width-down/134?cb=20191103171059	f	t	140	{}	13
143	Dreadnought Lucien	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5e/Dreadnought_Lucien.png/revision/latest/scale-to-width-down/135?cb=20190606005817	f	t	\N	{}	13
144	Bullet Diver Lucien	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/16/Bullet_Diver_Lucien.png/revision/latest/scale-to-width-down/116?cb=20201206024432	f	f	140	{Store}	13
145	Suitor Lucien	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ce/Suitor_Lucien.png/revision/latest/scale-to-width-down/128?cb=20200315014808	f	t	140	{}	13
146	Overdrive Lucien	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5c/Overdrive_Lucien.png/revision/latest/scale-to-width-down/123?cb=20201206024445	f	t	\N	{}	13
147	Raven Rogue Lucien	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/af/Raven_Rogue_Lucien.png/revision/latest/scale-to-width-down/151?cb=20201206024513	f	f	140	{}	13
148	Deep Sea Lucien	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/14/Deep_Sea_Lucien.png/revision/latest/scale-to-width-down/136?cb=20220622205518	f	t	200	{}	13
149	Iron Legion Teros	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/53/Iron_Legion_Teros.png/revision/latest/scale-to-width-down/198?cb=20180624190937	f	f	80	{}	41
150	Ready to Riot Teros	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fd/Ready_to_Riot_Teros.png/revision/latest/scale-to-width-down/198?cb=20150811162350	f	f	140	{Store}	41
151	Rift Dweller Teros	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d9/Rift_Dweller_Teros.png/revision/latest/scale-to-width-down/198?cb=20201209030921	f	f	140	{Store}	41
152	Wreck the Halls Teros	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/Wreck_the_Halls_Teros.png/revision/latest/scale-to-width-down/198?cb=20201030123118	f	t	140	{}	41
154	Forgeheart Teros	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/39/Forgeheart_Teros.png/revision/latest/scale-to-width-down/198?cb=20200513170107	f	t	\N	{}	41
155	Mecha Teros	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/70/Mecha_Teros.png/revision/latest/scale-to-width-down/198?cb=20201209030907	f	f	140	{Store}	41
156	God King Teros	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6d/God_King_Teros.png/revision/latest/scale-to-width-down/198?cb=20201209030853	f	t	\N	{}	41
157	Gatekeeper Teros	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3c/Gatekeeper_Teros.png/revision/latest/scale-to-width-down/198?cb=20201209030839	f	f	140	{Store}	41
160	Hall Minotaur Teros	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/db/Hall_Minotaur_Teros.png/revision/latest/scale-to-width-down/198?cb=20210901201011	f	t	140	{}	41
161	Metadev Teros	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/87/Metadev_Teros.png/revision/latest/scale-to-width-down/198?cb=20221116201400	f	f	\N	{"Not normally obtainable.","See Metadev."}	41
162	Aesir-Forged Brynn	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dd/Aesir-Forged_Brynn.png/revision/latest/scale-to-width-down/112?cb=20200513171543	f	f	140	{Store,"Dev Streams #3"}	34
163	Shieldmaiden Brynn	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c7/Shieldmaiden_Brynn.png/revision/latest/scale-to-width-down/124?cb=20180814152912	f	f	80	{}	34
164	Fallen Brynn	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/07/Fallen_Brynn.png/revision/latest/scale-to-width-down/104?cb=20200518191431	f	f	140	{Store}	34
165	Eternal Love Brynn	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c3/Eternal_Love_Brynn.png/revision/latest/scale-to-width-down/104?cb=20200315014838	f	t	140	{}	34
166	Cinderguard Brynn	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/95/Cinderguard_Brynn.png/revision/latest/scale-to-width-down/100?cb=20200518191410	f	f	140	{Store}	34
167	Metadev Brynn	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ac/Metadev_Brynn.png/revision/latest/scale-to-width-down/92?cb=20190526034515	f	f	\N	{"Not normally obtainable.","See Metadev"}	34
168	Völsung Brynn	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8f/Volsung_Brynn.png/revision/latest/scale-to-width-down/90?cb=20190620021020	f	f	140	{"",Store}	34
169	Harpy Brynn	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5a/Harpy_Brynn.png/revision/latest/scale-to-width-down/108?cb=20200518191451	f	t	\N	{}	34
170	Witchfire Brynn	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/82/Witchfire_Brynn.png/revision/latest/scale-to-width-down/109?cb=20200518191510	f	f	140	{Store}	34
171	Barbara	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cb/Barbara.png/revision/latest/scale-to-width-down/185?cb=20220107221305	t	f	300	{}	34
175	Cat Burglar Asuri	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6b/Cat_Burglar_Asuri.png/revision/latest/scale-to-width-down/198?cb=20180828192858	f	f	140	{Store}	52
176	Awakened Asuri	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7d/Awakened_Asuri.png/revision/latest/scale-to-width-down/198?cb=20190609220045	f	f	140	{Store}	52
177	Lynx Asuri	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1f/Lynx_Asuri.png/revision/latest/scale-to-width-down/198?cb=20190609225552	f	f	140	{Store}	52
178	Swashbuckler Asuri	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/da/Swashbuckler_Asuri.png/revision/latest/scale-to-width-down/198?cb=20190609225516	f	f	140	{Store}	52
179	Apex Predator Asuri	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/44/Apex_Predator_Asuri.png/revision/latest/scale-to-width-down/198?cb=20200417023453	f	t	\N	{}	52
180	Mecha Asuri	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/04/Mecha_Asuri.png/revision/latest/scale-to-width-down/198?cb=20190609225418	f	f	140	{Store}	52
181	First Day Asuri	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/64/First_Day_Asuri.png/revision/latest/scale-to-width-down/198?cb=20180908023147	f	t	140	{}	52
182	Badlands Asuri	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b0/Badlands_Asuri.png/revision/latest/scale-to-width-down/198?cb=20190609225636	f	t	\N	{}	52
183	Skel-asuri	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/30/Skel-asuri.png/revision/latest/scale-to-width-down/198?cb=20191103171039	f	t	140	{}	52
184	Metadev Asuri	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d7/Metadev_Asuri.png/revision/latest/scale-to-width-down/198?cb=20200417023450	f	f	\N	{"Not normally obtainable.","See Metadev."}	52
186	Razorback Barraza	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f0/Razorback_Barraza.png/revision/latest/scale-to-width-down/198?cb=20200515235008	f	f	80	{}	3
187	Nemesis Barraza	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d5/Nemesis_Barraza.png/revision/latest/scale-to-width-down/198?cb=20200515234929	f	f	140	{Store}	3
188	Sawed-Off Barraza	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1d/Sawed-Off_Barraza.png/revision/latest/scale-to-width-down/198?cb=20200515235028	f	f	140	{Store}	3
189	Slasher Barraza	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/61/Slasher_Barraza.png/revision/latest/scale-to-width-down/198?cb=20200515235116	f	f	100	{}	3
190	Amun-Raza	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b0/Amun-Raza.png/revision/latest/scale-to-width-down/198?cb=20200515234910	f	t	\N	{}	3
191	Shark Heart Barraza	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f5/Shark_Heart_Barraza.png/revision/latest/scale-to-width-down/198?cb=20200515235050	f	f	140	{Store}	3
192	Heartbreaker Barraza	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/45/Heartbreaker_Barraza.png/revision/latest/scale-to-width-down/198?cb=20200315014828	f	t	140	{}	3
193	Wraith Barraza	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/77/Wraith_Barraza.png/revision/latest/scale-to-width-down/198?cb=20200515235132	f	t	\N	{}	3
196	Nightshade Ember	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b4/Nightshade_Ember.png/revision/latest/scale-to-width-down/198?cb=20200811111123	f	f	140	{Store}	19
197	Radiant Ember	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/84/Radiant_Ember.png/revision/latest/scale-to-width-down/198?cb=20200811111209	f	f	80	{}	19
198	Holly Jolly Ember	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/44/Holly_Jolly_Ember.png/revision/latest/scale-to-width-down/198?cb=20200811111100	f	t	140	{}	19
199	Grovewarden Ember	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ad/Grovewarden_Ember.png/revision/latest/scale-to-width-down/198?cb=20200811111051	f	f	140	{Store}	19
200	Fangwild Fawn Ember	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1a/Fangwild_Fawn_Ember.png/revision/latest/scale-to-width-down/198?cb=20200811111038	f	t	\N	{}	19
201	Star Guardian Ember	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f9/Star_Guardian_Ember.png/revision/latest/scale-to-width-down/198?cb=20200811111220	f	f	140	{Store}	19
202	Ember the Hunter	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e4/Ember_the_Hunter.png/revision/latest/scale-to-width-down/198?cb=20200811111016	f	f	140	{Store}	19
203	Meadowguard Ember	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ea/Meadowguard_Ember.png/revision/latest/scale-to-width-down/198?cb=20200811111111	f	t	\N	{}	19
204	Dragon Heart Ember	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e8/Dragon_Heart_Ember.png/revision/latest/scale-to-width-down/198?cb=20200811111006	f	f	200	{Store}	19
205	Metadev Ember	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6a/Metadev_Ember.png/revision/latest/scale-to-width-down/198?cb=20190526034519	f	f	\N	{"Not normally obtainable.","See Metadev"}	19
194	Rick	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dd/Rick.png/revision/latest/scale-to-width-down/185?cb=20201126191533	t	f	300	{}	3
185	Tigress	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ea/Tigress.png/revision/latest/scale-to-width-down/185?cb=20220107223354	t	f	300	{}	52
209	Baron Azoth	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/98/Baron_Azoth.png/revision/latest/scale-to-width-down/198?cb=20180622184243	f	f	80	{}	21
210	Lichlord Azoth	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/96/Lichlord_Azoth.png/revision/latest/scale-to-width-down/198?cb=20180724183827	f	f	140	{Store}	21
211	Annihilator Azoth	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e4/Annihilator_Azoth.png/revision/latest/scale-to-width-down/198?cb=20180724183022	f	f	200	{Store}	21
212	Deep One Azoth	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a4/Deep_One_Azoth.png/revision/latest/scale-to-width-down/198?cb=20180724183419	f	f	140	{Store}	21
213	Sky Scourge Azoth	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2b/Sky_Scourge_Azoth.png/revision/latest/scale-to-width-down/198?cb=20190620235339	f	t	\N	{}	21
214	Ancient Azoth	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b8/Ancient_Azoth.png/revision/latest/scale-to-width-down/198?cb=20180724183938	f	f	140	{"",Store}	21
215	Muerto Azoth	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cf/Muerto_Azoth.png/revision/latest/scale-to-width-down/198?cb=20180724184106	f	f	140	{}	21
216	Necromancer Azoth	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/51/Necromancer_Azoth.png/revision/latest/scale-to-width-down/198?cb=20200515232057	f	f	140	{Store}	21
217	Island Azoth	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fb/Island_Azoth.png/revision/latest/scale-to-width-down/198?cb=20201126182135	f	t	140	{}	21
219	Shogun Koji	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/43/Shogun_Koji.png/revision/latest/scale-to-width-down/198?cb=20201127081055	f	f	140	{Store}	4
220	Ronin Koji	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/34/Ronin_Koji.png/revision/latest/scale-to-width-down/198?cb=20201127081047	f	f	140	{Store}	4
221	Demon Ogre Koji	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/62/Demon_Ogre_Koji.png/revision/latest/scale-to-width-down/190?cb=20201127081030	f	f	140	{Store}	4
222	Tengu Koji	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/55/Tengu_Koji.png/revision/latest/scale-to-width-down/198?cb=20201127081111	f	f	140	{Store}	4
223	Yakuza Koji	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dd/Yakuza_Koji.png/revision/latest/scale-to-width-down/198?cb=20201127081118	f	t	\N	{}	4
224	Ojiisan Koji	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/db/Ojiisan_Koji.png/revision/latest/scale-to-width-down/198?cb=20201127081039	f	f	140	{Store}	4
225	Greased Lightning Koji	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fa/Greased_Lightning_Koji.png/revision/latest/scale-to-width-down/186?cb=20190910023219	f	t	140	{}	4
226	Emperor Koji	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f0/Emperor_Koji.png/revision/latest/scale-to-width-down/198?cb=20190713163832	f	t	\N	{}	4
227	Street Samurai Koji	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5d/Street_Samurai_Koji.png/revision/latest/scale-to-width-down/198?cb=20201127081103	f	f	140	{Store}	4
231	Kern Koji	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/df/Kern_Koji.png/revision/latest/scale-to-width-down/198?cb=20230308190442	f	t	140	{}	4
232	Star Miner Ulgrim	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/42/Star_Miner_Ulgrim.png/revision/latest/scale-to-width-down/198?cb=20180821004933	f	f	80	{}	5
233	Arcanium Ulgrim	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/27/Arcanium_Ulgrim.png/revision/latest/scale-to-width-down/188?cb=20201209040119	f	f	140	{Store}	5
234	Apprentice Ulgrim	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/54/Apprentice_Ulgrim.png/revision/latest/scale-to-width-down/198?cb=20201209040106	f	f	80	{}	5
235	Dragonport Ulgrim	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6d/Dragonport_Ulgrim.png/revision/latest/scale-to-width-down/189?cb=20201209040133	f	f	140	{Store}	5
236	Jotun Ulgrim	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5c/Jotun_Ulgrim.png/revision/latest/scale-to-width-down/198?cb=20201209040148	f	t	\N	{}	5
237	Warborn Ulgrim	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0d/Warborn_Ulgrim.png/revision/latest/scale-to-width-down/197?cb=20201030123149	f	t	200	{}	5
239	Master Blacksmith Ulgrim	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4c/Master_Blacksmith_Ulgrim.png/revision/latest/scale-to-width-down/184?cb=20210224204857	f	f	\N	{"Season Three | Tier 47 Reward"}	5
240	Mad Doctor Ulgrim	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/98/Mad_Doctor_Ulgrim.png/revision/latest/scale-to-width-down/198?cb=20221019131736	f	t	200	{}	5
228	Shin Sekai Koji	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5d/AniShin_Sekai_Koji.gif/revision/latest/scale-to-width-down/185?cb=20201214023557	f	f	300	{}	4
242	Survivor Diana	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8e/Survivor_Diana.png/revision/latest/scale-to-width-down/198?cb=20200810062032	f	f	80	{}	31
243	Wyrmslayer Diana	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/29/Wyrmslayer_Diana.png/revision/latest/scale-to-width-down/198?cb=20181208182802	f	f	140	{Store}	31
244	Shadowstalker Diana	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/01/Shadowstalker_Diana.png/revision/latest/scale-to-width-down/177?cb=20200810062022	f	f	140	{Store}	31
245	Demonkin Diana	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/89/Demonkin_Diana.png/revision/latest/scale-to-width-down/196?cb=20191103171100	f	t	140	{}	31
246	Elven Ranger Diana	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4a/Elven_Ranger_Diana.png/revision/latest/scale-to-width-down/186?cb=20200810061911	f	t	\N	{}	31
247	Cryptomage Diana	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8f/Cryptomage_Diana.png/revision/latest/scale-to-width-down/179?cb=20210224004748	f	f	140	{Store}	31
248	Pool Party Diana	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fe/Pool_Party_Diana.png/revision/latest/scale-to-width-down/170?cb=20200810061958	f	t	140	{}	31
249	Lionguard Diana	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4c/Lionguard_Diana.png/revision/latest/scale-to-width-down/185?cb=20200810061948	f	t	\N	{}	31
252	Spellbreaker Diana	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0f/Spellbreaker_Diana.png/revision/latest/scale-to-width-down/187?cb=20201211103457	f	f	140	{}	31
254	Warlord Jhala	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f7/Warlord_Jhala.png/revision/latest/scale-to-width-down/187?cb=20180725204056	f	f	140	{Store}	16
255	Speedmetal Jhala	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/24/Speedmetal_Jhala.png/revision/latest/scale-to-width-down/187?cb=20200813161119	f	f	80	{}	16
256	Orc Raider Jhala	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e9/Orc_Raider_Jhala.png/revision/latest/scale-to-width-down/185?cb=20200813161041	f	f	140	{Store}	16
258	Sky Scourge Jhala	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/10/Sky_Scourge_Jhala.png/revision/latest/scale-to-width-down/198?cb=20200813161108	f	f	140	{}	16
259	New School Jhala	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f9/New_School_Jhala.png/revision/latest/scale-to-width-down/168?cb=20200813161032	f	t	\N	{}	16
260	Queen of Scales Jhala	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e7/Queen_of_Scales_Jhala.png/revision/latest/scale-to-width-down/175?cb=20200813161050	f	t	\N	{}	16
262	Gallowglass Jhala	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/32/Gallowglass_Jhala.png/revision/latest/scale-to-width-down/190?cb=20200813161021	f	t	140	{}	16
265	Molten Kor	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/44/Molten_Kor.png/revision/latest/scale-to-width-down/179?cb=20200513164137	f	f	140	{Store}	46
266	Armored Kor	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bf/Armored_Kor.png/revision/latest/scale-to-width-down/170?cb=20201127084013	f	f	140	{Store}	46
267	Kor Wrecking LLC	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4f/Kor_Wrecking_LLC.png/revision/latest/scale-to-width-down/183?cb=20201127084038	f	f	140	{Store}	46
268	Warrior Spirit Kor	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/85/Warrior_Spirit_Kor.png/revision/latest/scale-to-width-down/177?cb=20201127084047	f	t	\N	{}	46
269	Snowman Kor	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/11/Snowman_Kor.png/revision/latest/scale-to-width-down/171?cb=20201030123035	f	t	140	{}	46
270	Kor in Space	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/62/Kor_in_Space.png/revision/latest/scale-to-width-down/198?cb=20201127084029	f	f	140	{Store}	46
271	Fangwild Kor	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/47/Fangwild_Kor.png/revision/latest/scale-to-width-down/191?cb=20200513164437	f	f	140	{Store}	46
272	The Korinthian	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cf/The_Korinthian.png/revision/latest/scale-to-width-down/172?cb=20190713164032	f	t	\N	{}	46
274	Cho-Kor-late	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c2/Cho-Kor-late.png/revision/latest/scale-to-width-down/161?cb=20200315014807	f	t	140	{}	46
253	Soulbound Diana	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cc/Soulbound_Diana.png/revision/latest/scale-to-width-down/176?cb=20210813211107	f	f	\N	{"Season Four | Tier 85 Reward"}	31
279	Seeker Wu Shang	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/49/Seeker_Wu_Shang.png/revision/latest/scale-to-width-down/198?cb=20201209211714	f	f	140	{Store}	42
280	Wu Shang the Breaker	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1f/Wu_Shang_the_Breaker.png/revision/latest/scale-to-width-down/198?cb=20201209211745	f	f	140	{Store}	42
281	Infinite Wu Shang	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0d/Infinite_Wu_Shang.png/revision/latest/scale-to-width-down/198?cb=20200830012559	f	t	\N	{}	42
282	Perfect Wu Shang	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/47/Perfect_Wu_Shang.png/revision/latest/scale-to-width-down/198?cb=20190619222624	f	f	200	{Store}	42
283	Djinn Wu Shang	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/74/Djinn_Wu_Shang.png/revision/latest/scale-to-width-down/198?cb=20201209211701	f	f	140	{Store}	42
284	Ranno Wu Shang	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b7/Ranno_Wu_Shang.png/revision/latest/scale-to-width-down/198?cb=20190115015835	f	f	140	{}	42
285	Gentleman Wu Shang	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/01/Gentleman_Wu_Shang.png/revision/latest/scale-to-width-down/198?cb=20190713163842	f	t	\N	{}	42
286	Santa Wu Shang	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/77/Santa_Wu_Shang.png/revision/latest/scale-to-width-down/198?cb=20201029182236	f	t	140	{}	42
290	Hardsuit Val	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f4/Hardsuit_Val.png/revision/latest/scale-to-width-down/172?cb=20201209042044	f	f	140	{Store}	48
291	Kunoichi Val	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/05/Kunoichi_Val.png/revision/latest/scale-to-width-down/152?cb=20190526012904	f	f	140	{Store}	48
292	Star Merc Val	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/88/Star_Merc_Val.png/revision/latest/scale-to-width-down/159?cb=20201209042110	f	f	140	{Store}	48
293	Dragonslayer Val	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2b/Dragonslayer_Val.png/revision/latest/scale-to-width-down/159?cb=20201209042030	f	t	\N	{}	48
294	Commando Val	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/11/Commando_Val.png/revision/latest/scale-to-width-down/180?cb=20201209042002	f	f	140	{}	48
295	Nutcracker Val	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b6/Nutcracker_Val.png/revision/latest/scale-to-width-down/147?cb=20201030123201	f	t	140	{}	48
296	Chimera Val	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f4/Chimera_Val.png/revision/latest/scale-to-width-down/163?cb=20201209041945	f	t	\N	{}	48
297	Mythic Hero Val	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cf/Mythic_Hero_Val.png/revision/latest/scale-to-width-down/173?cb=20201209042058	f	f	140	{}	48
302	Love Bug Val	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/16/Love_Bug_Val.png/revision/latest/scale-to-width-down/173?cb=20230126034907	f	t	140	{}	48
303	Mecha Ragnir	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ce/Mecha_Ragnir.png/revision/latest/scale-to-width-down/185?cb=20201208054141	f	f	140	{}	18
304	Celestial Ragnir	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a0/Celestial_Ragnir.png/revision/latest/scale-to-width-down/183?cb=20201208054116	f	f	140	{Store}	18
305	Ashen Ragnir	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d1/Ashen_Ragnir.png/revision/latest/scale-to-width-down/183?cb=20201208054059	f	f	140	{Store}	18
306	Nightshade Ragnir	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7b/Nightshade_Ragnir.png/revision/latest/scale-to-width-down/175?cb=20201208054155	f	f	140	{Store}	18
307	Dark Depths Ragnir	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/82/Dark_Depths_Ragnir.png/revision/latest/scale-to-width-down/184?cb=20190606005455	f	t	\N	{}	18
308	Sobek Ragnir	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/df/Sobek_Ragnir.png/revision/latest/scale-to-width-down/180?cb=20201208054220	f	f	140	{Store}	18
309	Ragnirsaurus Rex	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1d/Ragnirsaurus_Rex.png/revision/latest/scale-to-width-down/198?cb=20201208054208	f	f	140	{Store}	18
310	Ragnir the Covetous	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/73/Ragnir_the_Covetous.png/revision/latest/scale-to-width-down/188?cb=20201030123052	f	t	140	{}	18
311	Inferno Ragnir	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bb/Inferno_Ragnir.png/revision/latest/scale-to-width-down/185?cb=20201208054129	f	t	\N	{}	18
298	Stevonnie	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/98/Stevonnie_%28lock-in%29.png/revision/latest/scale-to-width-down/185?cb=20201214020751	t	f	300	{}	48
313	Frost Guardian Ragnir	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/65/Frost_Guardian_Ragnir.png/revision/latest/scale-to-width-down/178?cb=20201211103522	f	t	140	{}	18
315	Elder Wild Ragnir	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e0/AniElder_Wild_Ragnir.gif/revision/latest/scale-to-width-down/198?cb=20220622220007	f	f	\N	{"Season Six | Tier 1 Reward","Progression skin"}	18
316	Boss Cross	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c8/Boss_Cross.png/revision/latest/scale-to-width-down/182?cb=20180820141721	f	f	140	{Store}	53
317	Devil Cross	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4d/Devil_Cross.png/revision/latest/scale-to-width-down/171?cb=20180820141722	f	f	140	{Store}	53
318	Staff Sgt. Cross	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0d/Staff_Sgt._Cross.png/revision/latest/scale-to-width-down/175?cb=20180820141724	f	f	140	{}	53
319	Krampus Cross	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/90/Krampus_Cross.png/revision/latest/scale-to-width-down/174?cb=20200728035348	f	t	140	{}	53
320	Double Cross	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0b/Double_Cross.png/revision/latest/scale-to-width-down/198?cb=20180820141723	f	f	140	{Store}	53
321	Shadowlord Cross	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7f/Shadowlord_Cross.png/revision/latest/scale-to-width-down/198?cb=20200728035417	f	t	\N	{}	53
322	Water Wars Cross	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/17/Water_Wars_Cross.png/revision/latest/scale-to-width-down/184?cb=20200728035320	f	t	140	{}	53
323	Prizefighter Cross	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/Prizefighter_Cross.png/revision/latest/scale-to-width-down/175?cb=20200728035404	f	f	140	{}	53
324	Infernal Cross	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7e/Infernal_Cross.png/revision/latest/scale-to-width-down/173?cb=20200728035335	f	t	\N	{}	53
326	Honor Bound Cross	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a6/Honor_Bound_Cross.png/revision/latest/scale-to-width-down/198?cb=20210812052030	f	f	\N	{"Season Four | Tier 23 Reward"}	53
329	Undying Mirage	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6a/Undying_Mirage.png/revision/latest/scale-to-width-down/198?cb=20201206031614	f	f	140	{Store}	54
330	Mirage the Cleaner	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/61/Mirage_the_Cleaner.png/revision/latest/scale-to-width-down/198?cb=20201206031559	f	f	140	{Store}	54
331	Heart of Hathor Mirage	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/be/Heart_of_Hathor_Mirage.png/revision/latest/scale-to-width-down/198?cb=20200315014809	f	t	140	{}	54
332	Anubis Mirage	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/27/Anubis_Mirage.png/revision/latest/scale-to-width-down/198?cb=20201206031440	f	t	\N	{}	54
333	Freestyle Mirage	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/eb/Freestyle_Mirage.png/revision/latest/scale-to-width-down/198?cb=20201206031506	f	f	140	{Store}	54
335	Mirage Incarnate	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/92/Mirage_Incarnate.png/revision/latest/scale-to-width-down/198?cb=20201206031546	f	t	\N	{}	54
336	Corsair Mirage	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9a/Corsair_Mirage.png/revision/latest/scale-to-width-down/198?cb=20201206031452	f	f	140	{}	54
337	Corpse Bride Mirage	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3c/Corpse_Bride_Mirage.png/revision/latest/scale-to-width-down/198?cb=20201028174257	f	t	140	{}	54
339	Librarian Mirage	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c2/Librarian_Mirage.png/revision/latest/scale-to-width-down/198?cb=20230809213833	f	t	140	{}	54
340	Grim Reaper Nix	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/08/Grim_Reaper_Nix.png/revision/latest/scale-to-width-down/157?cb=20201208031136	f	f	200	{Store}	7
341	Lockdown Nix	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e4/Lockdown_Nix.png/revision/latest/scale-to-width-down/179?cb=20201208031155	f	f	140	{Store}	7
342	Scarecrow Nix	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e3/Scarecrow_Nix.png/revision/latest/scale-to-width-down/164?cb=20201208031220	f	f	140	{Store}	7
343	Wipeout Nix	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ea/Wipeout_Nix.png/revision/latest/scale-to-width-down/159?cb=20201208031232	f	t	140	{}	7
344	Nix Couture	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5e/Nix_Couture.png/revision/latest/scale-to-width-down/147?cb=20201208031208	f	t	\N	{}	7
345	Eliminator Nix	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/52/Eliminator_Nix.png/revision/latest/scale-to-width-down/166?cb=20201208031105	f	f	140	{Store}	7
334	Apocalypse Mirage	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/31/AniApocalypse_Mirage.gif/revision/latest/scale-to-width-down/185?cb=20201214023520	f	f	300	{}	54
348	White Out Nix	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/White_Out_Nix.png/revision/latest/scale-to-width-down/190?cb=20211215150607	f	t	140	{}	7
349	Gothic Chic Nix	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9d/Gothic_Chic_Nix.png/revision/latest/scale-to-width-down/198?cb=20221019131732	f	t	140	{}	7
350	North Wind Mordex	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/be/North_Wind_Mordex.png/revision/latest/scale-to-width-down/198?cb=20180802034140	f	f	140	{Store}	43
352	Celestial Mordex	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9f/Celestial_Mordex.png/revision/latest/scale-to-width-down/198?cb=20201206033317	f	f	140	{Store}	43
353	Dog Days Mordex	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4d/Dog_Days_Mordex.png/revision/latest/scale-to-width-down/198?cb=20201206033329	f	t	140	{}	43
354	Fenrir Mordex	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/10/Fenrir_Mordex.png/revision/latest/scale-to-width-down/198?cb=20201206033513	f	t	\N	{}	43
355	Dunewalker Mordex	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f3/Dunewalker_Mordex.png/revision/latest/scale-to-width-down/198?cb=20201206033342	f	f	140	{Store}	43
356	Mad Dog Mordex	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3b/Mad_Dog_Mordex.png/revision/latest/scale-to-width-down/198?cb=20201206033540	f	t	\N	{}	43
358	Black Diamond Mordex	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d6/Black_Diamond_Mordex.png/revision/latest/scale-to-width-down/198?cb=20201206033139	f	f	140	{}	43
360	Octavius Mordex	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f5/AniOctavius_Mordex.gif/revision/latest/scale-to-width-down/198?cb=20210813201321	f	f	\N	{"Season Four | Tier 1 Reward"}	43
361	Brawldog Mordex	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d4/Brawldog_Mordex.png/revision/latest/scale-to-width-down/198?cb=20220728155603	f	t	140	{}	43
363	Tokyo Yumiko	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a9/Tokyo_Yumiko.png/revision/latest/scale-to-width-down/198?cb=20201209215116	f	f	140	{Store}	22
364	Lil' Yumiko	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6b/Lil%27_Yumiko.png/revision/latest/scale-to-width-down/198?cb=20201209215047	f	f	140	{Store}	22
365	Cursed Mask Yumiko	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e2/Cursed_Mask_Yumiko.png/revision/latest/scale-to-width-down/198?cb=20201209215020	f	f	140	{Store}	22
366	Fox Spirit Yumiko	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/10/Fox_Spirit_Yumiko.png/revision/latest/scale-to-width-down/198?cb=20201209215032	f	t	\N	{}	22
367	Punkin Spice Yumiko	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/31/Punkin_Spice_Yumiko.png/revision/latest/scale-to-width-down/198?cb=20191103171041	f	t	140	{}	22
368	Matsuri Yumiko	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/55/Matsuri_Yumiko.png/revision/latest/scale-to-width-down/195?cb=20201209215102	f	f	140	{Store}	22
369	Madame Yumiko	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/29/Madame_Yumiko.png/revision/latest/scale-to-width-down/198?cb=20190713163850	f	t	\N	{}	22
370	Arctic Fox Yumiko	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/Arctic_Fox_Yumiko.png/revision/latest/scale-to-width-down/190?cb=20201209215007	f	f	140	{}	22
371	High Frequency Yumiko	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1c/High_Frequency_Yumiko.png/revision/latest/scale-to-width-down/198?cb=20200927045930	f	f	\N	{"Season Two | Tier 71 Reward"}	22
372	Caelestis Yumiko	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/57/Caelestis_Yumiko.png/revision/latest/scale-to-width-down/198?cb=20220119193812	f	t	140	{}	22
374	Darkheart Artemis	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5f/Darkheart_Artemis.png/revision/latest/scale-to-width-down/198?cb=20201213003152	f	f	200	{Store}	32
375	Iron Lady Artemis	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c7/Iron_Lady_Artemis.png/revision/latest/scale-to-width-down/198?cb=20220322050444	f	f	140	{Store}	32
376	Eclipse Artemis	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d7/Eclipse_Artemis.png/revision/latest/scale-to-width-down/198?cb=20201213003054	f	f	140	{Store}	32
377	Seraph Artemis	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cc/Seraph_Artemis.png/revision/latest/scale-to-width-down/198?cb=20220322051244	f	t	\N	{}	32
378	Street Race Artemis	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6a/Street_Race_Artemis.png/revision/latest/scale-to-width-down/198?cb=20201213003127	f	f	140	{Store}	32
379	Future Spirit Artemis	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a7/Future_Spirit_Artemis.png/revision/latest/scale-to-width-down/198?cb=20201213003023	f	t	140	{}	32
380	Slapshot Artemis	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ac/Slapshot_Artemis.png/revision/latest/scale-to-width-down/198?cb=20201213003044	f	f	140	{}	32
415	Red Rose Kaya	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/09/Red_Rose_Kaya.png/revision/latest/scale-to-width-down/198?cb=20210201201642	f	t	140	{}	45
373	Inari Yumiko	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ce/Inari_Yumiko.png/revision/latest/scale-to-width-down/185?cb=20230518210957	f	f	300	{}	22
382	Demon Rider Artemis	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/Demon_Rider_Artemis.png/revision/latest/scale-to-width-down/198?cb=20220322043427	f	t	140	{}	32
383	Event Horizon Artemis	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e5/AniEvent_Horizon_Artemis.gif/revision/latest/scale-to-width-down/198?cb=20220119203102	f	f	\N	{"Season Five | Tier 1 Reward"}	32
384	Fortune Hunter Caspian	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c7/Fortune_Hunter_Caspian.png/revision/latest/scale-to-width-down/170?cb=20200518193317	f	f	140	{"SteelSeries Invitational",Store}	20
385	Nightcap Caspian	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/83/Nightcap_Caspian.png/revision/latest/scale-to-width-down/169?cb=20200518193358	f	f	140	{Store}	20
386	All City Caspian	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1e/All_City_Caspian.png/revision/latest/scale-to-width-down/164?cb=20200518193256	f	f	140	{Store}	20
387	Immortal Caspian	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/93/Immortal_Caspian.png/revision/latest/scale-to-width-down/159?cb=20191103171054	f	t	140	{}	20
388	Aces High Caspian	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/02/Aces_High_Caspian.png/revision/latest/scale-to-width-down/164?cb=20200518193238	f	t	\N	{}	20
389	Harlequin Caspian	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6f/Harlequin_Caspian.png/revision/latest/scale-to-width-down/170?cb=20200518193337	f	f	140	{Store}	20
392	Diamond Jack Caspian	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a8/Diamond_Jack_Caspian.png/revision/latest/scale-to-width-down/158?cb=20221215125149	f	t	140	{}	20
393	Atlantean Sidra	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e7/Atlantean_Sidra.png/revision/latest/scale-to-width-down/198?cb=20201209025047	f	f	140	{Store}	51
394	Pirate Queen Sidra	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e4/Pirate_Queen_Sidra.png/revision/latest/scale-to-width-down/198?cb=20201209025123	f	f	140	{Store}	51
395	Kraken Sidra	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a9/Kraken_Sidra.png/revision/latest/scale-to-width-down/198?cb=20201209025107	f	f	140	{Store}	51
396	Queen Beat Sidra	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b6/Queen_Beat_Sidra.png/revision/latest/scale-to-width-down/198?cb=20201209025136	f	t	\N	{}	51
397	Merrow Sidra	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ae/Merrow_Sidra.png/revision/latest/scale-to-width-down/198?cb=20201030123104	f	t	140	{}	51
398	Sky Pirate Sidra	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2f/Sky_Pirate_Sidra.png/revision/latest/scale-to-width-down/198?cb=20210201201651	f	f	140	{}	51
399	Beastmaster Sidra	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b5/Beastmaster_Sidra.png/revision/latest/scale-to-width-down/198?cb=20230126034907	f	f	\N	{"Season Seven | Tier 47 Reward"}	51
401	Demon Ogre Xull	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/77/Demon_Ogre_Xull.png/revision/latest/scale-to-width-down/198?cb=20201209213336	f	f	140	{Store}	8
402	Arctic Trapper Xull	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/41/Arctic_Trapper_Xull.png/revision/latest/scale-to-width-down/198?cb=20201209213306	f	f	140	{Store}	8
403	Commander Xull	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c2/Commander_Xull.png/revision/latest/scale-to-width-down/198?cb=20201209213321	f	f	140	{Store}	8
404	Gridiron Xull	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b0/Gridiron_Xull.png/revision/latest/scale-to-width-down/198?cb=20190910023223	f	t	140	{}	8
406	Elvenhollow Xull	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bc/Elvenhollow_Xull.png/revision/latest/scale-to-width-down/198?cb=20210414135402	f	t	140	{}	8
408	Huntress Kaya	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fb/Huntress_Kaya.png/revision/latest/scale-to-width-down/198?cb=20201127074513	f	f	140	{Store}	45
409	Snow Stalker Kaya	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/63/Snow_Stalker_Kaya.png/revision/latest/scale-to-width-down/198?cb=20201127074521	f	f	140	{Store}	45
410	Aurora Kaya	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ae/Aurora_Kaya.png/revision/latest/scale-to-width-down/198?cb=20201127074458	f	f	140	{Store}	45
411	Athena Kaya	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4e/Athena_Kaya.png/revision/latest/scale-to-width-down/198?cb=20201127074448	f	t	\N	{}	45
412	Kindergarten Kaya	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/32/Kindergarten_Kaya.png/revision/latest/scale-to-width-down/198?cb=20190910023227	f	t	140	{}	45
413	Alpine Kaya	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/ba/Alpine_Kaya.png/revision/latest/scale-to-width-down/198?cb=20201127074437	f	f	140	{Store}	45
390	Plague Knight	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fe/Plague_Knight.png/revision/latest/scale-to-width-down/185?cb=20230618034451	t	f	300	{}	20
405	Amethyst	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/Amethyst.png/revision/latest/scale-to-width-down/185?cb=20201209213352	t	f	300	{}	8
417	Task Force Isaiah	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fa/Task_Force_Isaiah.png/revision/latest/scale-to-width-down/152?cb=20200513170852	f	f	140	{Store}	9
418	Section Zero Isaiah	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1c/Section_Zero_Isaiah.png/revision/latest/scale-to-width-down/142?cb=20200813154406	f	f	200	{Store}	9
419	Shadow Ops Isaiah	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/09/Shadow_Ops_Isaiah.png/revision/latest/scale-to-width-down/154?cb=20200813154416	f	f	140	{Store}	9
420	Admiral Isaiah	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e8/Admiral_Isaiah.png/revision/latest/scale-to-width-down/150?cb=20190713163812	f	t	\N	{}	9
421	Brawl Dad Isaiah	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/67/Brawl_Dad_Isaiah.png/revision/latest/scale-to-width-down/145?cb=20200813154357	f	t	140	{}	9
423	Dragon Hunter Isaiah	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d6/Dragon_Hunter_Isaiah.png/revision/latest/scale-to-width-down/153?cb=20220316132655	f	t	140	{}	9
425	Jiro the Specialist	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/66/Jiro_the_Specialist.png/revision/latest/scale-to-width-down/154?cb=20201127071814	f	f	140	{Store}	55
426	Shinigami Jiro	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c3/Shinigami_Jiro.png/revision/latest/scale-to-width-down/133?cb=20201127071833	f	f	140	{Store}	55
427	Shogun Jiro	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5c/Shogun_Jiro.png/revision/latest/scale-to-width-down/153?cb=20201127071842	f	f	140	{Store}	55
428	Komainu Jiro	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/28/Komainu_Jiro.png/revision/latest/scale-to-width-down/140?cb=20201127071825	f	t	\N	{}	55
429	Dullahan Jiro	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b1/Dullahan_Jiro.png/revision/latest/scale-to-width-down/134?cb=20201030123022	f	t	140	{}	55
430	Crimson Oni Jiro	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fa/Crimson_Oni_Jiro.png/revision/latest/scale-to-width-down/130?cb=20200528024250	f	f	\N	{"Season One | Tier 71 Reward"}	55
432	Oendan Jiro	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/24/Oendan_Jiro.png/revision/latest/scale-to-width-down/198?cb=20220728155905	f	t	140	{}	55
433	Xianxia Lin Fei	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7c/Xianxia_Lin_Fei.png/revision/latest/scale-to-width-down/130?cb=20201206023437	f	f	140	{Store}	44
434	Zhulong Lin Fei	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/03/Zhulong_Lin_Fei.png/revision/latest/scale-to-width-down/131?cb=20201206023450	f	f	140	{}	44
435	Daomadan Lin Fei	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/51/Daomadan_Lin_Fei.png/revision/latest/scale-to-width-down/152?cb=20201206023426	f	f	140	{"Charity Stream #7",Store}	44
436	Ace Spiker Lin Fei	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/54/Ace_Spiker_Lin_Fei.png/revision/latest/scale-to-width-down/133?cb=20190910023233	f	t	140	{}	44
437	Wenqing Lin Fei	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f0/Wenqing_Lin_Fei.png/revision/latest/scale-to-width-down/138?cb=20210519162144	f	f	140	{}	44
438	Green Thumb Lin Fei	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/be/Green_Thumb_Lin_Fei.png/revision/latest/scale-to-width-down/171?cb=20220413172815	f	t	140	{}	44
440	Darkheart Zariel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/89/Darkheart_Zariel.png/revision/latest/scale-to-width-down/109?cb=20201209220324	f	f	140	{}	56
441	Archangel Zariel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8e/Archangel_Zariel.png/revision/latest/scale-to-width-down/117?cb=20201209220310	f	f	140	{}	56
442	Urban Guardian Zariel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/70/Urban_Guardian_Zariel.png/revision/latest/scale-to-width-down/140?cb=20201209220357	f	f	140	{Store}	56
443	Outerworld Zariel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/ff/Outerworld_Zariel.png/revision/latest/scale-to-width-down/111?cb=20201209220343	f	t	\N	{}	56
444	Secret Admirer Zariel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/05/Secret_Admirer_Zariel.png/revision/latest/scale-to-width-down/139?cb=20200315014823	f	t	140	{}	56
445	Archfiend Zariel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/61/Archfiend_Zariel.png/revision/latest/scale-to-width-down/125?cb=20200528023649	f	f	\N	{"Season One | Tier 47 Reward"}	56
446	Beachside Zariel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e3/Beachside_Zariel.png/revision/latest/scale-to-width-down/115?cb=20210519162333	f	t	140	{}	56
447	Raymesis	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/69/Raymesis.png/revision/latest/scale-to-width-down/198?cb=20201208055036	f	f	140	{}	49
448	Sir Rayelot	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b8/Sir_Rayelot.png/revision/latest/scale-to-width-down/198?cb=20201208055048	f	f	140	{Store}	49
449	Raydvar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/95/Raydvar.png/revision/latest/scale-to-width-down/198?cb=20201208055021	f	f	140	{}	49
450	Ray of the Dead	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b7/Ray_of_the_Dead.png/revision/latest/scale-to-width-down/198?cb=20211013231128	f	t	140	{}	49
431	Leonardo	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ee/Leonardo_%28lock-in%29.png/revision/latest/scale-to-width-down/178?cb=20210616185511	t	f	300	{}	55
453	Thornwood Dusk	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a6/Thornwood_Dusk.png/revision/latest/scale-to-width-down/198?cb=20200811105746	f	f	140	{}	28
454	Imperial Lord Dusk	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/92/Imperial_Lord_Dusk.png/revision/latest/scale-to-width-down/198?cb=20200811105716	f	f	140	{}	28
456	Dusk Till Dawn	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f0/Dusk_Till_Dawn.png/revision/latest/scale-to-width-down/198?cb=20191103171028	f	t	140	{}	28
457	Date Night Dusk	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/22/Date_Night_Dusk.png/revision/latest/scale-to-width-down/198?cb=20210201201622	f	t	140	{}	28
458	Deathcap Dusk	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b0/Deathcap_Dusk.png/revision/latest/scale-to-width-down/198?cb=20220622205601	f	f	\N	{"Season Six | Tier 47 Reward"}	28
459	Cosmic Fait	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/02/Cosmic_Fait.png/revision/latest/scale-to-width-down/140?cb=20200811113524	f	f	140	{Store}	23
460	Dark Arts Fait	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f3/Dark_Arts_Fait.png/revision/latest/scale-to-width-down/168?cb=20200811113534	f	f	140	{}	23
461	Feline Fait	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ed/Feline_Fait.png/revision/latest/scale-to-width-down/153?cb=20200811113553	f	f	200	{}	23
463	Headmaster Fait	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3c/Headmaster_Fait.png/revision/latest/scale-to-width-down/159?cb=20190910023208	f	t	140	{}	23
464	Metadev Fait	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d0/Metadev_Fait.png/revision/latest/scale-to-width-down/167?cb=20201112235231	f	f	\N	{"Not normally obtainable.","See Metadev"}	23
465	Star Commander Fait	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/eb/Star_Commander_Fait.png/revision/latest/scale-to-width-down/185?cb=20220119193812	f	f	\N	{"Season Five | Tier 47 Reward"}	23
466	Draugr Thor	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/89/Draugr_Thor.png/revision/latest/scale-to-width-down/198?cb=20201209034611	f	f	140	{}	24
467	Cinderguard Thor	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b7/Cinderguard_Thor.png/revision/latest/scale-to-width-down/198?cb=20201209034558	f	f	140	{}	24
468	Capra Thor	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8f/Capra_Thor.png/revision/latest/scale-to-width-down/198?cb=20201209034543	f	f	140	{}	24
469	Thor by the Shore	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/14/Thor_by_the_Shore.png/revision/latest/scale-to-width-down/198?cb=20201209034624	f	t	140	{}	24
473	Sourcecode Petra	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0f/Sourcecode_Petra.png/revision/latest/scale-to-width-down/170?cb=20201208052543	f	f	140	{}	35
474	Darkheart Petra	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ee/Darkheart_Petra.png/revision/latest/scale-to-width-down/151?cb=20201208052517	f	f	140	{Store}	35
475	Lost World Petra	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d5/Lost_World_Petra.png/revision/latest/scale-to-width-down/165?cb=20201208052531	f	f	140	{}	35
476	Petra Reanimated	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6c/Petra_Reanimated.png/revision/latest/scale-to-width-down/164?cb=20191103171033	f	t	140	{}	35
478	Obake Petra	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e9/AniObake_Petra.gif/revision/latest/scale-to-width-down/155?cb=20201214023539	f	f	\N	{"Season One | Tier 1 Reward","Progression skin"}	35
479	Riptide Petra	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/11/Riptide_Petra.png/revision/latest/scale-to-width-down/169?cb=20210519162236	f	t	140	{}	35
482	Street Sovereign Petra	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cf/Street_Sovereign_Petra.png/revision/latest/scale-to-width-down/167?cb=20230809213837	f	f	\N	{"Season Eight | Tier 35 Reward"}	35
483	Dragonaut Vector	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/49/Dragonaut_Vector.png/revision/latest/scale-to-width-down/198?cb=20201209042751	f	f	140	{}	25
484	Vector Model 01	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/66/Vector_Model_01.png/revision/latest/scale-to-width-down/198?cb=20201209042835	f	f	140	{}	25
485	Hyperdrift Vector	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7f/Hyperdrift_Vector.png/revision/latest/scale-to-width-down/198?cb=20201209042822	f	f	140	{}	25
486	Hotshot Vector	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fe/Hotshot_Vector.png/revision/latest/scale-to-width-down/198?cb=20201209042807	f	t	140	{}	25
462	Enchantress	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/99/Enchantress.png/revision/latest/scale-to-width-down/185?cb=20200811180645	t	f	300	{}	23
488	Blood Moon Volkov	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3f/Blood_Moon_Volkov.png/revision/latest/scale-to-width-down/179?cb=20191220165455	f	f	140	{}	57
489	Blue Virus Volkov	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/64/Blue_Virus_Volkov.png/revision/latest/scale-to-width-down/180?cb=20191220165457	f	f	140	{}	57
490	Huntsman Volkov	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/31/Huntsman_Volkov.png/revision/latest/scale-to-width-down/198?cb=20191220165458	f	f	140	{}	57
491	Red Romance Volkov	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9b/Red_Romance_Volkov.png/revision/latest/scale-to-width-down/198?cb=20200315014822	f	t	140	{}	57
492	Rocker Volkov	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4d/Rocker_Volkov.png/revision/latest/scale-to-width-down/189?cb=20200826221956	f	t	140	{}	57
494	Soulbound Onyx	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/34/Soulbound_Onyx.png/revision/latest/scale-to-width-down/198?cb=20201208032608	f	f	140	{}	40
495	Guardian Onyx	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/09/Guardian_Onyx.png/revision/latest/scale-to-width-down/198?cb=20201208032543	f	f	140	{}	40
496	Project-0NYX	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fa/Project-0NYX.png/revision/latest/scale-to-width-down/198?cb=20201208032556	f	f	140	{}	40
497	Festive Yeti Onyx	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cd/Festive_Yeti_Onyx.png/revision/latest/scale-to-width-down/198?cb=20201211103510	f	t	140	{}	40
498	Leonidas Onyx	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ca/Leonidas_Onyx.png/revision/latest/scale-to-width-down/198?cb=20220119193812	f	f	\N	{"Season Five | Tier 71 Reward"}	40
499	Termin-gator Onyx	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/Termin-gator_Onyx.png/revision/latest/scale-to-width-down/198?cb=20221019131743	f	t	200	{}	40
500	Death Jester Jaeyun	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9a/Death_Jester_Jaeyun.png/revision/latest/scale-to-width-down/198?cb=20200813154948	f	f	140	{}	17
501	Gilded Glory Jaeyun	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d5/Gilded_Glory_Jaeyun.png/revision/latest/scale-to-width-down/198?cb=20200813155001	f	f	140	{}	17
502	Hanbok Jaeyun	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/87/Hanbok_Jaeyun.png/revision/latest/scale-to-width-down/198?cb=20200813155011	f	f	140	{}	17
503	Hwarang Jaeyun	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/92/Hwarang_Jaeyun.png/revision/latest/scale-to-width-down/198?cb=20210414135340	f	t	140	{}	17
505	Snowdrift Jaeyun	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a7/Snowdrift_Jaeyun.png/revision/latest/scale-to-width-down/198?cb=20221215125148	f	t	140	{}	17
507	Abyssal Goblin Mako	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cc/Abyssal_Goblin_Mako.png/revision/latest/scale-to-width-down/198?cb=20201206030105	f	f	140	{}	10
508	0RC4-M4k0	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/56/0RC4-M4k0.png/revision/latest/scale-to-width-down/198?cb=20201206030050	f	f	200	{}	10
509	Hammerhead Mako	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/18/Hammerhead_Mako.png/revision/latest/scale-to-width-down/198?cb=20201206030120	f	f	140	{}	10
510	Jörmungandr Mako	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/78/AniJ%C3%B6rmungandr_Mako.gif/revision/latest/scale-to-width-down/198?cb=20210730203656	f	f	\N	{"Season Three | Tier 1 Reward"}	10
511	Swim Team Mako	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/90/Swim_Team_Mako.png/revision/latest/scale-to-width-down/198?cb=20210901200946	f	t	140	{}	10
512	Golden Gladiator Magyar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dd/Golden_Gladiator_Magyar.png/revision/latest/scale-to-width-down/192?cb=20210114234322	f	f	140	{}	26
513	Phantom of the Armor Magyar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/da/Phantom_of_the_Armor_Magyar.png/revision/latest/scale-to-width-down/198?cb=20210114234341	f	f	140	{}	26
514	Pharaoh King Magyar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/47/Pharaoh_King_Magyar.png/revision/latest/scale-to-width-down/198?cb=20210114234357	f	f	140	{}	26
515	Forsaken Magyar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/85/Forsaken_Magyar.png/revision/latest/scale-to-width-down/198?cb=20220831145129	f	f	140	{}	26
516	Elvenhollow Magyar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a1/Elvenhollow_Magyar.png/revision/latest/scale-to-width-down/198?cb=20230427000945	f	t	140	{}	26
517	Desperado Reno	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ee/Desperado_Reno.png/revision/latest/scale-to-width-down/198?cb=20210415015220	f	f	140	{}	36
518	Widowmaker Reno	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fc/Widowmaker_Reno.png/revision/latest/scale-to-width-down/198?cb=20210415015222	f	f	140	{}	36
519	Ferrymoth Reno	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c8/Ferrymoth_Reno.png/revision/latest/scale-to-width-down/190?cb=20210415015223	f	f	140	{}	36
520	Honeybeeno	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/38/Honeybeeno.png/revision/latest/scale-to-width-down/198?cb=20220413172101	f	t	140	{}	36
521	Magpie Munin	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/87/Magpie_Munin.png/revision/latest/scale-to-width-down/198?cb=20211013174343	f	f	140	{}	37
493	Infernal Warlock Volkov	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7c/Infernal_Warlock_Volkov.png/revision/latest/scale-to-width-down/185?cb=20230126035442	f	f	\N	{"Season Seven | Tier 85 Reward"}	57
1	Bear'dvar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/35/Bear%27dvar.png/revision/latest/scale-to-width-down/198?cb=20200513171743	f	f	140	{Store}	50
26	Dark Age Orion	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/Dark_Age_Orion.png/revision/latest/scale-to-width-down/95?cb=20200513172012	f	f	140	{Store}	2
238	Macho Man	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/83/Macho_Man.png/revision/latest/scale-to-width-down/185?cb=20220107222645	t	f	300	{}	5
42	Dark Matter Vraxx	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ab/Dark_Matter_Vraxx.png/revision/latest/scale-to-width-down/149?cb=20201209210603	f	f	200	{Store}	39
80	Kabuki Hattori	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7e/Kabuki_Hattori.png/revision/latest/scale-to-width-down/126?cb=20200813153657	f	f	140	{Store}	29
104	Mad Genius Scarlet	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/06/Epic_BG_2.png/revision/latest/scale-to-width-down/206?cb=20190204012435	f	f	240	{}	30
128	Astral Core Ada	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5c/Astral_Core_Ada.png/revision/latest/scale-to-width-down/198?cb=20220119193809	f	f	\N	{"Season Five | Tier 23 Reward"}	12
138	Spec-Ops Lucien	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/29/Spec-Ops_Lucien.png/revision/latest/scale-to-width-down/136?cb=20200513172649	f	f	200	{Store}	13
153	The Yetee Teros	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a9/The_Yetee_Teros.png/revision/latest/scale-to-width-down/198?cb=20201209030935	f	f	\N	{"Bonus with purchase Brawlhalla merchandise from The Yetee"}	41
195	Metadev Barraza	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bf/Metadev_Barraza.png/revision/latest/scale-to-width-down/198?cb=20211013231017	f	f	\N	{"Not normally obtainable.","See Metadev."}	3
523	DJ Hugin	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4a/DJ_Hugin.png/revision/latest/scale-to-width-down/198?cb=20211013230604	f	f	140	{}	37
525	Owl Bard Hugin	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/97/Owl_Bard_Hugin.png/revision/latest/scale-to-width-down/198?cb=20230126034907	f	f	\N	{"Season Seven | Tier 23 Reward"}	37
526	Cockatiel Munin	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5f/Cockatiel_Munin.png/revision/latest/scale-to-width-down/198?cb=20230614195256	f	t	140	{}	37
527	Carapace Armored Arcadia	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8a/Carapace_Armored_Arcadia.png/revision/latest/scale-to-width-down/198?cb=20220316131941	f	f	140	{}	27
528	Rogue Queen Arcadia	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/37/Rogue_Queen_Arcadia.png/revision/latest/scale-to-width-down/198?cb=20220316131941	f	f	140	{}	27
529	Briar Rose Arcadia	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/85/Briar_Rose_Arcadia.png/revision/latest/scale-to-width-down/198?cb=20220316131938	f	f	140	{}	27
530	Equinox Arcadia	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/76/Equinox_Arcadia.png/revision/latest/scale-to-width-down/198?cb=20220622205538	f	f	\N	{"Season Six | Tier 23 Reward"}	27
531	Asgardian Ezio	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9b/Asgardian_Ezio.png/revision/latest/scale-to-width-down/198?cb=20220727132857	f	f	140	{}	58
532	Armor of Brutus Ezio	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1f/Armor_of_Brutus_Ezio.png/revision/latest/scale-to-width-down/198?cb=20220727132900	f	f	140	{}	58
533	Revelations Ezio	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e1/Revelations_Ezio.png/revision/latest/scale-to-width-down/198?cb=20220727132859	f	f	140	{}	58
535	Talk of the Town Tezca	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6d/Talk_of_the_Town_Tezca.png/revision/latest/scale-to-width-down/198?cb=20221214165602	f	f	140	{}	11
536	Ocelotl Tezca	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8c/Ocelotl_Tezca.png/revision/latest/scale-to-width-down/198?cb=20221214165601	f	f	140	{}	11
537	Chel	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fd/Chel.png/revision/latest/scale-to-width-down/187?cb=20221214165600	f	f	140	{}	11
538	Corrupted Blood Tezca	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/af/AniCorrupted_Blood_Tezca.gif/revision/latest/scale-to-width-down/198?cb=20230810075312	f	f	\N	{"Season Eight | Tier 1 Reward"}	11
539	Mach 25 Thea	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/65/Mach_25_Thea.png/revision/latest/scale-to-width-down/174?cb=20230329195156	f	f	140	{}	38
540	Gorgon Thea	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/72/Gorgon_Thea.png/revision/latest/scale-to-width-down/155?cb=20230329195153	f	f	200	{}	38
541	Gridrunner Thea	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/00/Gridrunner_Thea.png/revision/latest/scale-to-width-down/165?cb=20230329195154	f	f	140	{}	38
542	Emerald Raptor	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6a/Emerald_Raptor.png/revision/latest/scale-to-width-down/145?cb=20230614195300	f	f	140	{}	59
543	Fallen Raptor	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/42/Fallen_Raptor.png/revision/latest/scale-to-width-down/198?cb=20230614195309	f	f	140	{}	59
544	Rocket Raptor	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/05/Rocket_Raptor.png/revision/latest/scale-to-width-down/144?cb=20230614195315	f	f	140	{}	59
172	Aurora Brynn	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4c/Aurora_Brynn.png/revision/latest/scale-to-width-down/185?cb=20210301225630	f	f	\N	{"Season Three | Tier 85 Reward"}	34
206	Modular Rift Ember	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/73/Modular_Riff_Ember.png/revision/latest/scale-to-width-down/198?cb=20200927045939	f	f	\N	{"Season Two | Tier 47 Reward"}	19
218	Ehzot Azoth	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f7/Ehzot_Azoth.png/revision/latest/scale-to-width-down/198?cb=20210812051916	f	f	\N	{"Season Four | Tier 71 Reward"}	21
241	Bitten Diana	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/df/Bitten_Diana.png/revision/latest/scale-to-width-down/168?cb=20200810061848	f	f	140	{Store}	31
257	Silver Age Jhala	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b9/Silver_Age_Jhala.png/revision/latest/scale-to-width-down/185?cb=20200813161059	f	f	140	{Store}	16
276	Gentleman Kor	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ec/Gentleman_Kor.png/revision/latest/scale-to-width-down/173?cb=20211013231112	f	t	140	{}	46
278	Wu Shang Kong	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/73/Wu_Shang_Kong.png/revision/latest/scale-to-width-down/198?cb=20201209211729	f	f	140	{Store}	42
299	Future Wave Val	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/73/AniFuture_Wave_Val.gif/revision/latest/scale-to-width-down/173?cb=20230810074938	f	f	\N	{"Progression skin","Season Two | Tier 1 Reward"}	48
312	Werebat Ragnir	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/60/Werebat_Ragnir.png/revision/latest/scale-to-width-down/174?cb=20191103171049	f	t	140	{}	18
328	Hand of Horus Mirage	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/70/Hand_of_Horus_Mirage.png/revision/latest/scale-to-width-down/198?cb=20201206031532	f	f	140	{Store}	54
351	Iron Legion Mordex	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d6/Iron_Legion_Mordex.png/revision/latest/scale-to-width-down/198?cb=20201206033527	f	f	140	{Store}	43
381	Netherworld Artemis	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/63/Netherworld_Artemis.png/revision/latest/scale-to-width-down/198?cb=20220322050800	f	f	\N	{"Season One | Tier 23 Reward"}	32
407	Terror-Watt Xull	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e1/Terror-Watt_Xull.png/revision/latest/scale-to-width-down/198?cb=20230809213839	f	f	\N	{"Season Eight | Tier 20 Reward"}	8
416	Sylvan Cleric Kaya	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/eb/Sylvan_Cleric_Kaya.png/revision/latest/scale-to-width-down/198?cb=20230126034906	f	f	\N	{"Season Seven | Tier 71 Reward"}	45
422	Cybernetic Beat Isaiah	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c3/Cybernetic_Beat_Isaiah.png/revision/latest/scale-to-width-down/140?cb=20200927045920	f	f	\N	{"Season Two | Tier 23 Reward"}	9
452	Raven Shaman Dusk	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/55/Raven_Shaman_Dusk.png/revision/latest/scale-to-width-down/198?cb=20200811105730	f	f	140	{}	28
471	Royal Warrior Thor	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/00/Royal_Warrior_Thor.png/revision/latest/scale-to-width-down/198?cb=20210224205056	f	f	\N	{"Season Three | Tier 23 Reward"}	24
487	Matchmaker Vector	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e2/Matchmaker_Vector.png/revision/latest/scale-to-width-down/198?cb=20220119193812	f	t	140	{}	25
506	Luminous Paladin Jaeyun	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/08/AniLuminous_Paladin_Jaeyun.gif/revision/latest/scale-to-width-down/198?cb=20230127015009	f	f	\N	{"Progression skin","Season Seven | Tier 1 Reward"}	17
522	Hugin	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dd/Hugin.png/revision/latest/scale-to-width-down/198?cb=20211013230550	f	f	140	{}	37
524	Starlet Munin	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/39/Starlet_Munin.png/revision/latest/scale-to-width-down/198?cb=20220413164233	f	f	140	{}	37
35	Black Knight	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5d/Black_Knight.png/revision/latest/scale-to-width-down/185?cb=20220107221207	t	f	300	{}	2
95	King Knight	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1e/King_Knight.png/revision/latest/scale-to-width-down/185?cb=20201208060530	t	f	300	{}	15
346	Specter Knight	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b5/Specter_Knight.png/revision/latest/scale-to-width-down/185?cb=20201208031002	t	f	300	{}	7
325	Hellboy	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f8/Hellboy.png/revision/latest/scale-to-width-down/185?cb=20220107221417	t	f	300	{}	53
357	Daimio	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6a/Daimio.png/revision/latest/scale-to-width-down/185?cb=20201214020546	t	f	300	{}	43
347	Retro Reaper Nix	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/32/Retro_Reaper_Nix.png/revision/latest/scale-to-width-down/185?cb=20201208031047	f	f	\N	{"Season Two | Tier 85 Reward"}	7
208	Fangwild's Heart Ember	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0a/Fangwild%27s_Heart_Ember.png/revision/latest/scale-to-width-down/185?cb=20220622215010	f	f	\N	{"Season Six | Tier 85 Reward"}	19
362	Termidex	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/54/Termidex.png/revision/latest/scale-to-width-down/185?cb=20230809213838	f	f	\N	{"Season Eight | Tier 85 Reward"}	43
58	Shovel Knight	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/61/Shovel_Knight.png/revision/latest/scale-to-width-down/185?cb=20200813135657	t	f	300	{}	1
455	Nimue	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3b/Nimue.png/revision/latest/scale-to-width-down/185?cb=20220107221447	t	f	300	{}	28
158	Gruagach	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a2/Gruagach.png/revision/latest/scale-to-width-down/185?cb=20201214020653	t	f	240	{}	41
261	Finn	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cf/Finn.png/revision/latest/scale-to-width-down/185?cb=20220107221553	t	f	300	{}	16
273	Jake	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b3/Jake.png/revision/latest/scale-to-width-down/185?cb=20220107221644	t	f	300	{}	46
46	Princess Bubblegum	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dc/AniPrincess_Bubblegum.gif/revision/latest/scale-to-width-down/185?cb=20220107222155	t	f	300	{}	39
82	John Cena	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/58/John_Cena.png/revision/latest/scale-to-width-down/185?cb=20220107222352	t	f	300	{}	29
59	Becky Lynch	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f9/Becky_Lynch.png/revision/latest/scale-to-width-down/185?cb=20220107222425	t	f	300	{}	1
11	Xavier Woods	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a0/Xavier_Woods.png/revision/latest/scale-to-width-down/185?cb=20220107222451	t	f	300	{}	50
470	The Undertaker	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/83/The_Undertaker.png/revision/latest/scale-to-width-down/185?cb=20220107222521	t	f	300	{}	24
159	Roman Reigns	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6f/Roman_Reigns.png/revision/latest/scale-to-width-down/185?cb=20220107222550	t	f	300	{}	41
70	Asuka	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/72/Asuka.png/revision/latest/scale-to-width-down/185?cb=20220107222620	t	f	300	{}	33
477	Garnet	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5a/Garnet.png/revision/latest/scale-to-width-down/185?cb=20201208052455	t	f	300	{}	35
414	Pearl	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/73/Pearl.png/revision/latest/scale-to-width-down/185?cb=20220107222727	t	f	300	{}	45
250	Lara Croft	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7a/Lara_Croft.png/revision/latest/scale-to-width-down/185?cb=20220107222802	t	f	300	{"Comes with Survivor Lara Croft"}	31
251	Survivor Lara Croft	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/92/Survivor_Lara_Croft.png/revision/latest/scale-to-width-down/185?cb=20200811100538	t	f	300	{"Comes with Lara Croft"}	31
127	Heatblast	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7c/AniHeatblast_%28lock-in%29.gif/revision/latest/scale-to-width-down/185?cb=20220107223201	t	f	300	{}	12
391	Diamondhead	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/43/Diamondhead_%28lock-in%29.png/revision/latest/scale-to-width-down/185?cb=20220107222852	t	f	300	{}	20
275	Four Arms	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fb/Four_Arms_%28lock-in%29.png/revision/latest/scale-to-width-down/185?cb=20220107222917	t	f	300	{}	46
229	Michonne	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/55/Michonne.png/revision/latest/scale-to-width-down/185?cb=20201126185544	t	f	300	{}	4
207	Daryl	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a2/Daryl.png/revision/latest/scale-to-width-down/185?cb=20201126191227	t	f	300	{}	19
504	Negan	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/71/Negan.png/revision/latest/scale-to-width-down/185?cb=20210922162947	t	f	300	{}	17
263	Maggie	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/89/Maggie.png/revision/latest/scale-to-width-down/185?cb=20220107223254	t	f	300	{}	16
287	Po	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bf/Po.png/revision/latest/scale-to-width-down/185?cb=20220107223329	t	f	300	{}	42
359	Tai Lung	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b6/Tai_Lung_%28lock-in%29.png/revision/latest/scale-to-width-down/185?cb=20220107223427	t	f	300	{}	43
300	Michelangelo	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c4/Michelangelo_%28lock-in%29.png/revision/latest/scale-to-width-down/185?cb=20210616191021	t	f	300	{}	48
338	Donatello	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/54/Donatello_%28lock-in%29.png/revision/latest/scale-to-width-down/185?cb=20210616191121	t	f	300	{}	54
314	Raphael	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/ba/Raphael_%28lock-in%29.png/revision/latest/scale-to-width-down/185?cb=20210616191100	t	f	300	{}	18
480	Ryu	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d1/Ryu.png/revision/latest/scale-to-width-down/185?cb=20220107223515	t	f	300	{}	35
288	Chun-Li	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/53/Chun-Li.png/revision/latest/scale-to-width-down/185?cb=20220107223541	t	f	300	{}	42
301	Akuma	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/16/Akuma.png/revision/latest/scale-to-width-down/185?cb=20220107223608	t	f	300	{}	48
439	Sakura	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f4/Sakura.png/revision/latest/scale-to-width-down/185?cb=20220525161701	t	f	300	{}	44
472	M. Bison	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9c/M._Bison.png/revision/latest/scale-to-width-down/185?cb=20220525161702	t	f	300	{}	24
451	Dhalsim	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/10/Dhalsim.png/revision/latest/scale-to-width-down/185?cb=20220525161702	t	f	300	{}	49
481	Ken	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8c/Ken.png/revision/latest/scale-to-width-down/185?cb=20220525161702	t	f	300	{}	35
327	Luke	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4f/Luke.png/revision/latest/scale-to-width-down/185?cb=20220525161702	t	f	300	{}	53
117	Snake Eyes	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1d/Snake_Eyes_%28Thatch_Skin%29.png/revision/latest/scale-to-width-down/185?cb=20220223190912	t	f	300	{}	47
230	Storm Shadow	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e2/Storm_Shadow.png/revision/latest/scale-to-width-down/185?cb=20220223190933	t	f	300	{}	4
173	Eivor (Female)	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7b/Eivor_%28Female%29.png/revision/latest/scale-to-width-down/185?cb=20220727132901	t	f	300	{}	34
174	Eivor (Male)	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5c/Eivor_%28Male%29.png/revision/latest/scale-to-width-down/185?cb=20220727132903	t	f	300	{"Comes with Eivor (Female)"}	34
264	Simon Belmont	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/59/Simon_Belmont.png/revision/latest/scale-to-width-down/117?cb=20221019131739	t	f	300	{}	16
534	Alucard	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e7/Alucard.png/revision/latest/scale-to-width-down/182?cb=20221019131729	t	f	300	{}	58
289	Aang	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ce/Aang.png/revision/latest/scale-to-width-down/185?cb=20221116201359	t	f	300	{}	42
277	Toph	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/Toph.png/revision/latest/scale-to-width-down/185?cb=20221116201408	t	f	300	{}	46
85	Zuko	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4b/Zuko.png/revision/latest/scale-to-width-down/185?cb=20221116201410	t	f	300	{}	29
424	The Master Chief	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e4/The_Master_Chief.png/revision/latest/scale-to-width-down/185?cb=20230712195847	t	f	300	{}	9
400	The Arbiter	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/12/The_Arbiter.png/revision/latest/scale-to-width-down/185?cb=20230712195845	t	f	300	{}	51
560	Patrick Star	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7e/Patrick_Star.png/revision/latest/scale-to-width-down/225?cb=20231129153939	t	f	300	{}	41
561	SpongeBob SquarePants	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c7/AniSpongeBob_SquarePants.gif/revision/latest/scale-to-width-down/185?cb=20231129153938	t	f	400	{}	49
562	Sandy Cheeks	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e6/Sandy_Cheeks.png/revision/latest/scale-to-width-down/185?cb=20231129153941	t	f	300	{}	14
563	Arcane Loki	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/82/Arcane_Loki.png/revision/latest/scale-to-width-down/250?cb=20230928173258	f	f	140	{}	78
565	THNX Researcher Loki	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ed/THNX_Researcher_Loki.png/revision/latest/scale-to-width-down/250?cb=20230928173300	f	f	140	{}	78
566	Diabolical Doll Arcadia	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/25/Diabolical_Doll_Arcadia.png/revision/latest/scale-to-width-down/210?cb=20231011155140	f	f	140	{}	27
564	Outlaw Loki	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/94/Outlaw_Loki.png/revision/latest/scale-to-width-down/250?cb=20230928173259	f	f	140	{}	78
567	Cthu'shang	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/11/Cthu%27shang.png/revision/latest/scale-to-width-down/204?cb=20231011155139	f	f	140	{}	42
\.


--
-- TOC entry 3509 (class 0 OID 38731)
-- Dependencies: 235
-- Data for Name: stat_imgs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stat_imgs (value, img) FROM stdin;
9	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/00/Stats9.png/revision/latest/scale-to-width-down/165?cb=20190628215120
8	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/00/Stats8.png/revision/latest/scale-to-width-down/165?cb=20190628215111
7	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9a/Stats7.png/revision/latest/scale-to-width-down/165?cb=20190628215103
6	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/27/Stats6.png/revision/latest/scale-to-width-down/165?cb=20190628215055
5	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/80/Stats5.png/revision/latest/scale-to-width-down/165?cb=20190628215044
4	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c5/Stats4.png/revision/latest/scale-to-width-down/165?cb=20190628215034
3	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a7/Stats3.png/revision/latest/scale-to-width-down/165?cb=20190628215024
\.


--
-- TOC entry 3511 (class 0 OID 38735)
-- Dependencies: 237
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stats (id, name, img) FROM stdin;
1	speed	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e1/StatIcon_Spd.png/revision/latest/scale-to-width-down/25?cb=20190628214801
2	defense	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6a/StatIcon_Def.png/revision/latest/scale-to-width-down/25?cb=20190628214800
3	dexterity	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e1/StatIcon_Dex.png/revision/latest/scale-to-width-down/25?cb=20190628214759
4	strength	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a7/StatIcon_Str.png/revision/latest/scale-to-width-down/25?cb=20190628214758
\.


--
-- TOC entry 3513 (class 0 OID 38741)
-- Dependencies: 239
-- Data for Name: type_reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_reviews (id, name) FROM stdin;
1	Отзыв
2	Руководство
\.


--
-- TOC entry 3515 (class 0 OID 38745)
-- Dependencies: 241
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, nickname, email, firstname, lastname, password, reg_date, telegram, discord, role_id) FROM stdin;
6	strings	dddd@example.com	\N	\N	$2b$12$gzrI1prTykM0rP5.jeTMZuKQK4w8nC8NVQ9KJzz1yQBISaG32K8b2	2023-10-19 11:03:21.630393	\N	\N	1
8	john_cena	228@228.ru	\N	\N	$2b$12$ktvtjxhgba0uFpgSpmUmp.qzT8B0LahqGgnvIija6NXy93hk5AZ/q	2023-10-25 14:14:42.011934	\N	\N	1
9	xgero	xgeropro@gmail.com	Alexey	Gero	$2b$12$YlcZ.w6THou1oXvxdI4VceIpefChoddwBxU18ZFaftwhiwp8EVYFe	2023-11-30 16:40:06.011777	\N	\N	1
5	sYnergie	string@example.com	Maximiliano	Scambicue	$2b$12$0ncNwMxOqMaF5QbVDxXnGeGgkdMVBxm1g0OLLeHtO7fVb144XsxIi	2023-10-12 14:57:39.384021	sYnergiee	_synergie	2
10	maksgay	melkozavr2000@gmail.com	\N	\N	$2b$12$q1VmMw9c9NzvtSPz.bscauRIpkgD/A8Qj7cNhsKSz7pbkui8yZg7u	2023-11-30 20:54:02.731252	\N	\N	1
14	vaynbaum	mr.vaynbaum@mail.ru	Denis	Vaynbaum	$2b$12$DQyE5T5poEIwm4/sAco8huVGRyfvYj86.8Un0acp.90t3SZgVIQTS	2023-12-01 16:58:09.439228	@vaynbaum	\N	1
2	string	maksim228775@gmail.com	\N	\N	$2b$12$xHjifeaj9OrL6thVK1dhquuUP1F.RVmOSygTViyGIgfTD7d97RnLi	2023-10-08 17:12:43.044393	@john	\N	2
\.


--
-- TOC entry 3517 (class 0 OID 38751)
-- Dependencies: 243
-- Data for Name: weapon_legends; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weapon_legends (weapon_id, legend_id, img, name) FROM stdin;
10	1	\N	\N
14	1	\N	\N
8	3	\N	\N
12	3	\N	\N
7	4	\N	\N
11	4	\N	\N
8	5	\N	\N
13	5	\N	\N
10	6	\N	\N
9	6	\N	\N
5	7	\N	\N
12	7	\N	\N
12	12	\N	\N
14	12	\N	\N
9	13	\N	\N
12	13	\N	\N
13	15	\N	\N
11	15	\N	\N
8	16	\N	\N
11	16	\N	\N
9	18	\N	\N
8	18	\N	\N
7	19	\N	\N
9	19	\N	\N
6	20	\N	\N
9	20	\N	\N
7	21	\N	\N
8	21	\N	\N
7	22	\N	\N
10	22	\N	\N
11	29	\N	\N
14	29	\N	\N
10	30	\N	\N
13	30	\N	\N
7	31	\N	\N
12	31	\N	\N
13	32	\N	\N
5	32	\N	\N
14	33	\N	\N
9	33	\N	\N
8	34	\N	\N
14	34	\N	\N
8	41	\N	\N
10	41	\N	\N
6	42	\N	\N
14	42	\N	\N
5	43	\N	\N
6	43	\N	\N
6	46	\N	\N
10	46	\N	\N
11	47	\N	\N
12	47	\N	\N
6	48	\N	\N
11	48	\N	\N
4	51	\N	\N
11	51	\N	\N
9	52	\N	\N
11	52	\N	\N
12	53	\N	\N
6	53	\N	\N
5	54	\N	\N
14	54	\N	\N
10	50	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a5/Warhammer.png/revision/latest/scale-to-width-down/162?cb=20210401004245	Warhammer
11	50	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/88/Broad_Sword.png/revision/latest/scale-to-width-down/162?cb=20210331232015	Broad Sword
12	14	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4a/Sixshooters.png/revision/latest/scale-to-width-down/162?cb=20190608192451	Sixshooters
10	14	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4e/Rail_Hammer.png/revision/latest/scale-to-width-down/162?cb=20190608192507	Rail Hammer
13	2	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5a/Armored_Attack_Rocket.png/revision/latest/scale-to-width-down/162?cb=20201118102518	Armored Attack Rocket
14	2	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f2/Sunforged_Spear.png/revision/latest/scale-to-width-down/162?cb=20210517232750	Sunforged Spear
13	39	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1c/Selenite_Jet_Lance.png/revision/latest/scale-to-width-down/162?cb=20210517232418	Selenite Jet Lance
12	39	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/85/Selenite_Ray_Guns.png/revision/latest/scale-to-width-down/162?cb=20210517230822	Selenite Ray Guns
4	8	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5f/Wartusk.png/revision/latest/scale-to-width-down/162?cb=20210517231317	Wartusk
8	8	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d0/The_Berserker.png/revision/latest/scale-to-width-down/162?cb=20210517230621	The Berserker
14	45	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4b/Prey_Catcher.png/revision/latest/scale-to-width-down/162?cb=20210517232710	Prey Catcher
7	45	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0b/Ivory_Snare.png/revision/latest/scale-to-width-down/162?cb=20210517231149	Ivory Snare
4	9	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c5/Ol%27_Faithful.png/revision/latest/scale-to-width-down/162?cb=20210517231259	Ol' Faithful
12	9	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bf/Sidearms.png/revision/latest/scale-to-width-down/162?cb=20210517230834	Sidearms
11	55	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/11/Shadow_Edge.png/revision/latest/scale-to-width-down/162?cb=20210517233129	Shadow Edge
5	55	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/27/Daikama.png/revision/latest/scale-to-width-down/162?cb=20210517232608	Daikama
9	44	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/25/Martial_Blades.png/revision/latest/scale-to-width-down/162?cb=20210517232203	Martial Blades
4	44	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/82/Cannon_Strike.png/revision/latest/scale-to-width-down/162?cb=20210517231233	Cannon Strike
6	56	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dd/Dawn_Bringers.png/revision/latest/scale-to-width-down/162?cb=20210517231349	Dawn Bringers
7	56	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a4/Wings_of_Justice.png/revision/latest/scale-to-width-down/162?cb=20210517231214	Wings of Justice
6	49	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/23/Rabbid_Boppers.png/revision/latest/scale-to-width-down/162?cb=20210517231452	Rabbid Boppers
8	49	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/41/Origin_Axe.png/revision/latest/scale-to-width-down/162?cb=20210517230611	Origin Axe
14	28	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ce/Elven_Battle_Spear.png/revision/latest/scale-to-width-down/162?cb=20210517232655	Elven Battle Spear
3	24	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/99/Eye_of_the_Storm.png/revision/latest/scale-to-width-down/162?cb=20210517232251	Eye of the Storm
5	57	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/28/Crowned_Favor.png/revision/latest/scale-to-width-down/162?cb=20210517232519	Crowned Favor
10	26	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/24/Menace_Maul.png/revision/latest/scale-to-width-down/162?cb=20210517231842	Menace Maul
14	27	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/28/Eldritch_Thorn.png/revision/latest/scale-to-width-down/162?cb=20220316180542	Eldritch Thorn
1	38	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/42/PegaSwift_Boots.png/revision/latest/scale-to-width-down/162?cb=20230329204226	PegaSwift Boots
3	28	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/41/Sacred_Relic.png/revision/latest/scale-to-width-down/162?cb=20210517232311	Sacred Relic
5	23	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/41/Shooting_Star.png/revision/latest/scale-to-width-down/162?cb=20210517232625	Shooting Star
3	23	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/23/Scrying_Glass.png/revision/latest/scale-to-width-down/162?cb=20210517232321	Scrying Glass
10	24	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/aa/Mj%C3%B6lnir.png/revision/latest/scale-to-width-down/162?cb=20210517231850	Mjölnir
6	35	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/14/Knockouts_%28Weapon_Skin%29.png/revision/latest/scale-to-width-down/162?cb=20210517231444	Knockouts (Weapon Skin)
3	35	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9c/Stone_of_Malice.png/revision/latest/scale-to-width-down/162?cb=20210517232330	Stone of Malice
13	25	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e9/Fuselage.png/revision/latest/scale-to-width-down/162?cb=20210517232345	Fuselage
7	25	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/ff/Flight_Plan.png/revision/latest/scale-to-width-down/162?cb=20210517231133	Flight Plan
8	57	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/Batavian_Diplomacy.png/revision/latest/scale-to-width-down/162?cb=20210517230500	Batavian Diplomacy
6	40	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f5/Brick_and_Mortar.png/revision/latest/scale-to-width-down/162?cb=20210517231330	Brick and Mortar
4	40	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/22/Stryge.png/revision/latest/scale-to-width-down/162?cb=20210517231308	Stryge
11	17	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fa/The_Cleaner.png/revision/latest/scale-to-width-down/162?cb=20210517233138	The Cleaner
2	17	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6f/The_Finisher.png/revision/latest/scale-to-width-down/162?cb=20210517231553	The Finisher
9	10	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/18/Atlantean_Power.png/revision/latest/scale-to-width-down/162?cb=20210517232115	Atlantean Power
2	10	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0f/Poseidon%27s_Gift.png/revision/latest/scale-to-width-down/162?cb=20210517231538	Poseidon's Gift
2	26	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/59/Soul_Scourge.png/revision/latest/scale-to-width-down/162?cb=20210517231545	Soul Scourge
12	36	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f3/Vespian_Six_Shooter.png/revision/latest/scale-to-width-down/162?cb=20210517231051	Vespian Six Shooter
3	36	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a4/Orbot.png/revision/latest/scale-to-width-down/162?cb=20210517232301	Orbot
7	37	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/64/Lethal_Lute.png/revision/latest/scale-to-width-down/162?cb=20211014001013	Lethal Lute
5	37	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/86/Six_String.png/revision/latest/scale-to-width-down/162?cb=20211014001039	Six String
2	27	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/77/Orma.png/revision/latest/scale-to-width-down/162?cb=20220316180607	Orma
11	58	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/86/Auditore_Blade.png/revision/latest/scale-to-width-down/162?cb=20220727161412	Auditore Blade
3	58	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cc/Apple_of_Eden.png/revision/latest/scale-to-width-down/162?cb=20220727161235	Apple of Eden
1	11	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b9/Patadas_Voladoras.png/revision/latest/scale-to-width-down/162?cb=20221215110621	Patadas Voladoras
6	11	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8b/Clawholds.png/revision/latest/scale-to-width-down/162?cb=20221215110601	Clawholds
13	38	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/43/Eternal_Skyrocket.png/revision/latest/scale-to-width-down/162?cb=20230329205120	Eternal Skyrocket
1	59	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f5/Squadron_Strikers.png/revision/latest/scale-to-width-down/162?cb=20230614200708	Squadron Strikers
3	59	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cd/Garuda%27s_Core.png/revision/latest/scale-to-width-down/162?cb=20230614200714	Garuda's Core
9	78	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/52/Realm_Etchers.png/revision/latest/scale-to-width-down/162?cb=20231011235100	Realm Etchers
5	78	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fd/Tethered_Plane.png/revision/latest/scale-to-width-down/162?cb=20231011235106	Tethered Plane
\.


--
-- TOC entry 3518 (class 0 OID 38756)
-- Dependencies: 244
-- Data for Name: weapon_skins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weapon_skins (weapon_id, skin_id, img, name) FROM stdin;
10	1	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/59/The_Hibernator.png/revision/latest/scale-to-width-down/162?cb=20180724144919	The Hibernator
11	1	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/92/Bear_Blade.png/revision/latest/scale-to-width-down/162?cb=20180724144913	Bear Blade
10	2	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d9/Neutron_Maul.png/revision/latest/scale-to-width-down/162?cb=20180729012845	Neutron Maul
11	2	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/93/Plasma_Cleaver.png/revision/latest/scale-to-width-down/162?cb=20180729012957	Plasma Cleaver
10	3	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/09/Stop_and_Drop.png/revision/latest/scale-to-width-down/162?cb=20180813000918	Stop and Drop
11	3	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/af/Big_Ol%27_Knife.png/revision/latest/scale-to-width-down/162?cb=20180808215523	Big Ol' Knife
10	4	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e1/Asgardian_Hammer.png/revision/latest/scale-to-width-down/162?cb=20180715022529	Asgardian Hammer
11	4	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a0/Asgardian_Sword.png/revision/latest/scale-to-width-down/162?cb=20180715022523	Asgardian Sword
10	5	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ac/The_Herald.png/revision/latest/scale-to-width-down/162?cb=20180729012303	The Herald
11	5	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d1/Victory_Rush.png/revision/latest/scale-to-width-down/162?cb=20180729012430	Victory Rush
10	6	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1e/Dragon%27s_Woe.png/revision/latest/scale-to-width-down/162?cb=20200414201726	Dragon's Woe
11	6	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f6/Kingsblade.png/revision/latest/scale-to-width-down/162?cb=20200414201727	Kingsblade
10	7	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/25/Folding_Chair.png/revision/latest/scale-to-width-down/162?cb=20180729012624	Folding Chair
11	7	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/62/The_Smackdown.png/revision/latest/scale-to-width-down/162?cb=20180729012711	The Smackdown
10	8	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7e/Death%27s_End.png/revision/latest/scale-to-width-down/162?cb=20200414201724	Death's End
11	8	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fe/Soulshard.png/revision/latest/scale-to-width-down/162?cb=20200414201732	Soulshard
10	9	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/68/Mouse_Trap.png/revision/latest/scale-to-width-down/162?cb=20200414201727	Mouse Trap
11	9	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/ff/Peppermint_Piercer.png/revision/latest/scale-to-width-down/162?cb=20200414201730	Peppermint Piercer
10	10	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/64/The_Starsmasher.png/revision/latest/scale-to-width-down/162?cb=20190609152239	The Starsmasher
11	10	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c1/Moonbeam_Blade.png/revision/latest/scale-to-width-down/162?cb=20190609152234	Moonbeam Blade
10	11	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/75/Unicorn_Stampede.png/revision/latest/scale-to-width-down/162?cb=20190809170131	Unicorn Stampede
11	11	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1b/Francesca.png/revision/latest/scale-to-width-down/162?cb=20190809170130	Francesca
10	12	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ee/Hammer_Decorum.png/revision/latest/scale-to-width-down/162?cb=20210310210211	Hammer Decorum
11	12	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2a/Gilded_Glory_%28Sword%29.png/revision/latest/scale-to-width-down/162?cb=20201223021452	Gilded Glory (Sword)
10	13	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1d/Yggdrasil%27s_Branch.png/revision/latest/scale-to-width-down/162?cb=20210226015919	Yggdrasil's Branch
11	13	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8e/Sword_of_Freyr.png/revision/latest/scale-to-width-down/162?cb=20210226020110	Sword of Freyr
12	14	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2b/Space_Shooters.png/revision/latest/scale-to-width-down/162?cb=20210308215142	Space Shooters
10	14	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7d/Sattelite_Smash.png/revision/latest/scale-to-width-down/162?cb=20210308214815	Sattelite Smash
12	15	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e9/Lawbreakers.png/revision/latest/scale-to-width-down/162?cb=20190608192449	Lawbreakers
10	15	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/27/The_Iron_Barrel.png/revision/latest/scale-to-width-down/162?cb=20190608192501	The Iron Barrel
12	16	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/97/Silver_Sixshooters.png/revision/latest/scale-to-width-down/162?cb=20210326065833	Silver Sixshooters
10	16	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4e/Silver_Sledgehammer.png/revision/latest/scale-to-width-down/162?cb=20180813001002	Silver Sledgehammer
12	17	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/11/Snake_Eyes.png/revision/latest/scale-to-width-down/162?cb=20190608192450	Snake Eyes
10	17	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/da/High_Noon.png/revision/latest/scale-to-width-down/162?cb=20190608192502	High Noon
12	18	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/77/Dessert_Eagles.png/revision/latest/scale-to-width-down/162?cb=20190608192459	Dessert Eagles
10	18	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/73/Face-Beater.png/revision/latest/scale-to-width-down/162?cb=20190608192506	Face-Beater
12	19	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c3/Silver_Bullets.png/revision/latest/scale-to-width-down/162?cb=20190608192454	Silver Bullets
10	19	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/62/Stake_Driver.png/revision/latest/scale-to-width-down/162?cb=20190608192505	Stake Driver
12	20	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c3/Las_Viudas.png/revision/latest/scale-to-width-down/162?cb=20190608192452	Las Viudas
10	20	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/19/Marigold_Maul.png/revision/latest/scale-to-width-down/162?cb=20190608192504	Marigold Maul
12	21	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/26/Whirlwinds.png/revision/latest/scale-to-width-down/162?cb=20210208170514	Whirlwinds
10	21	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1d/Cyclone_Hammer.png/revision/latest/scale-to-width-down/162?cb=20210208170632	Cyclone Hammer
12	22	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dc/Moskitoes.png/revision/latest/scale-to-width-down/162?cb=20190608192456	Moskitoes
10	22	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/00/Selena%27s_Smasher.png/revision/latest/scale-to-width-down/162?cb=20190608192508	Selena's Smasher
12	23	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c6/Candy_Caliber.png/revision/latest/scale-to-width-down/162?cb=20210329174146	Candy Caliber
10	23	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/91/Fruitcake.png/revision/latest/scale-to-width-down/162?cb=20210310210357	Fruitcake
12	24	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d4/Firewalls.png/revision/latest/scale-to-width-down/162?cb=20210203035646	Firewalls
10	24	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4d/H4MM3R_Time.png/revision/latest/scale-to-width-down/162?cb=20210203040255	H4MM3R Time
12	25	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6b/Rose_Gold_Revolvers.png/revision/latest/scale-to-width-down/162?cb=20230215171910	Rose Gold Revolvers
10	25	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a5/Bovine_Skull_Mallet.png/revision/latest/scale-to-width-down/162?cb=20230215171907	Bovine Skull Mallet
13	26	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9e/Rocket_Powered_Warhorse.png/revision/latest/scale-to-width-down/162?cb=20190622203635	Rocket Powered Warhorse
14	26	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/50/Old_School_Spear.png/revision/latest/scale-to-width-down/162?cb=20190622204453	Old School Spear
13	27	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/08/Doombringer.png/revision/latest/scale-to-width-down/162?cb=20190622203642	Doombringer
14	27	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1f/Destiny.png/revision/latest/scale-to-width-down/162?cb=20190622204501	Destiny
13	28	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/02/Atomic_Rocket.png/revision/latest/scale-to-width-down/162?cb=20210507153221	Atomic Rocket
14	28	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/35/Plutonium_Pike.png/revision/latest/scale-to-width-down/162?cb=20190622204503	Plutonium Pike
13	29	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/27/Interstellar_Rocket.png/revision/latest/scale-to-width-down/162?cb=20190609152237	Interstellar Rocket
14	29	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8a/Starforged_Spear.png/revision/latest/scale-to-width-down/162?cb=20190609152247	Starforged Spear
13	30	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/75/Freelancer.png/revision/latest/scale-to-width-down/162?cb=20190622203641	Freelancer
14	30	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/32/Payday.png/revision/latest/scale-to-width-down/162?cb=20190622204459	Payday
13	31	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4b/Honorbound.png/revision/latest/scale-to-width-down/162?cb=20190622203639	Honorbound
14	31	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/27/Silver_Naginata.png/revision/latest/scale-to-width-down/162?cb=20190622204457	Silver Naginata
13	32	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/Skyrush.png/revision/latest/scale-to-width-down/162?cb=20190622203637	Skyrush
14	32	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/97/Trueflight.png/revision/latest/scale-to-width-down/162?cb=20190622204456	Trueflight
13	33	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/82/Speaker_of_the_Sea.png/revision/latest/scale-to-width-down/162?cb=20210211194348	Speaker of the Sea
14	33	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e9/The_Conch.png/revision/latest/scale-to-width-down/162?cb=20210211194356	The Conch
13	34	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/63/The_Breakdown.png/revision/latest/scale-to-width-down/162?cb=20190622203635	The Breakdown
14	34	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5c/The_Mixup.png/revision/latest/scale-to-width-down/162?cb=20190622204455	The Mixup
13	35	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/78/Abyssal_Excavator.png/revision/latest/scale-to-width-down/162?cb=20190622203643	Abyssal Excavator
14	35	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e4/Dark_Shovel_Blade.png/revision/latest/scale-to-width-down/162?cb=20190622204502	Dark Shovel Blade
13	36	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/71/Yorishiro.png/revision/latest/scale-to-width-down/162?cb=20210519170356	Yorishiro
14	36	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/19/Yokai_Naginata.png/revision/latest/scale-to-width-down/162?cb=20210519170438	Yokai Naginata
13	37	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/da/Core_Collapse.png/revision/latest/scale-to-width-down/162?cb=20220119232809	Core Collapse
14	37	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/27/Thermal_Runaway.png/revision/latest/scale-to-width-down/162?cb=20220119232810	Thermal Runaway
13	38	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ef/Cyber_Myk_Starblaze.png/revision/latest/scale-to-width-down/162?cb=20230810055332	Cyber Myk Starblaze
14	38	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8d/Cyber_Myk_Pike.png/revision/latest/scale-to-width-down/162?cb=20230810055329	Cyber Myk Pike
13	39	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/79/Fire_Giant_Lance.png/revision/latest/scale-to-width-down/162?cb=20210308073729	Fire Giant Lance
12	39	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/Dark_Elf_Blasters.png/revision/latest/scale-to-width-down/162?cb=20210329174323	Dark Elf Blasters
13	40	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6c/Imperial_Star_Lance.png/revision/latest/scale-to-width-down/162?cb=20210308074117	Imperial Star Lance
12	40	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/14/Emperor%27s_Own_Blasters.png/revision/latest/scale-to-width-down/162?cb=20210329174833	Emperor's Own Blasters
13	41	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7c/Heartbreak_Havoc.png/revision/latest/scale-to-width-down/162?cb=20210308075652	Heartbreak Havoc
12	41	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/49/Bullet_Hail_of_the_King.png/revision/latest/scale-to-width-down/162?cb=20210329174128	Bullet Hail of the King
13	42	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/81/Event_Horizon.png/revision/latest/scale-to-width-down/162?cb=20210308190832	Event Horizon
12	42	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9f/The_Singularities.png/revision/latest/scale-to-width-down/162?cb=20210329180040	The Singularities
13	43	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f1/Planet_Destroyer.png/revision/latest/scale-to-width-down/162?cb=20210308190920	Planet Destroyer
12	43	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5d/Desequencers.png/revision/latest/scale-to-width-down/162?cb=20210329174347	Desequencers
13	44	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/37/Irridium_Engine.png/revision/latest/scale-to-width-down/162?cb=20210308190949	Irridium Engine
12	44	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/25/Zhaktari_Issue.png/revision/latest/scale-to-width-down/162?cb=20210329180203	Zhaktari Issue
13	45	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5e/Reactor_Core.png/revision/latest/scale-to-width-down/162?cb=20210308191016	Reactor Core
12	45	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8b/Destabilizers.png/revision/latest/scale-to-width-down/162?cb=20210329174510	Destabilizers
13	46	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e8/Banana_Guard_Lance.png/revision/latest/scale-to-width-down/162?cb=20190613224605	Banana Guard Lance
13	47	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d5/Chemical_V.png/revision/latest/scale-to-width-down/162?cb=20200826222706	Chemical V
12	47	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/75/Teacher%27s_Pets.png/revision/latest/scale-to-width-down/162?cb=20200826222732	Teacher's Pets
13	48	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/56/Lobster_Lance.png/revision/latest/scale-to-width-down/162?cb=20220623023743	Lobster Lance
12	48	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ed/Flint-Lockers.png/revision/latest/scale-to-width-down/162?cb=20220623023808	Flint-Lockers
10	49	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/94/Skullcracker.png/revision/latest/scale-to-width-down/162?cb=20210310211911	Skullcracker
14	49	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/39/Bone_Shard.png/revision/latest/scale-to-width-down/162?cb=20210329183243	Bone Shard
10	50	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/55/I%27ve_Got_Spirit%21.png/revision/latest/scale-to-width-down/162?cb=20210310211724	I've Got Spirit!
14	50	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/49/Number_1_Fan.png/revision/latest/scale-to-width-down/162?cb=20210329184624	Number 1 Fan
10	51	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0f/That%27s_A_Hammer.png/revision/latest/scale-to-width-down/162?cb=20180808215519	That's A Hammer
14	51	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e0/Pig_Sticker.png/revision/latest/scale-to-width-down/162?cb=20180808215522	Pig Sticker
10	52	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7d/Howlin%27_Skull.png/revision/latest/scale-to-width-down/162?cb=20210310212015	Howlin' Skull
14	52	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/Long_Tooth.png/revision/latest/scale-to-width-down/162?cb=20210329184257	Long Tooth
10	53	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a7/Bonehead.png/revision/latest/scale-to-width-down/162?cb=20210310212102	Bonehead
14	53	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b0/Knifebeak.png/revision/latest/scale-to-width-down/162?cb=20210329184122	Knifebeak
10	54	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8c/Barbaric_Rage.png/revision/latest/scale-to-width-down/162?cb=20210310212258	Barbaric Rage
14	54	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/94/Clearly_a_Sword.png/revision/latest/scale-to-width-down/162?cb=20210329183335	Clearly a Sword
10	55	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4e/Numbskull.png/revision/latest/scale-to-width-down/162?cb=20210310212409	Numbskull
14	55	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/99/Scrapshard.png/revision/latest/scale-to-width-down/162?cb=20210329185610	Scrapshard
10	56	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f3/Sterling_Sledge.png/revision/latest/scale-to-width-down/162?cb=20180817011313	Sterling Sledge
14	56	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5a/Platinum_Pike.png/revision/latest/scale-to-width-down/162?cb=20180817011314	Platinum Pike
10	57	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9d/Headache.png/revision/latest/scale-to-width-down/162?cb=20210324084035	Headache
14	57	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/75/Hand-Saw.png/revision/latest/scale-to-width-down/162?cb=20191103171235	Hand-Saw
10	58	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cd/Throwing_Anchor.png/revision/latest/scale-to-width-down/162?cb=20210310212459	Throwing Anchor
14	58	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7d/Shovel_Blade.png/revision/latest/scale-to-width-down/162?cb=20210329185739	Shovel Blade
10	59	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d0/Manhandle_Slam.png/revision/latest/scale-to-width-down/162?cb=20190809170127	Manhandle Slam
14	59	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/01/The_Last_Crutch.png/revision/latest/scale-to-width-down/162?cb=20190809170129	The Last Crutch
10	60	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e0/Santa%27s_Sleigh-er.png/revision/latest/scale-to-width-down/162?cb=20211215153750	Santa's Sleigh-er
14	60	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5f/Regifted_Spear.png/revision/latest/scale-to-width-down/162?cb=20211215153719	Regifted Spear
14	61	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/Scintilating_Spear.png/revision/latest/scale-to-width-down/162?cb=20210329185504	Scintilating Spear
9	61	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a5/Beguiling_Blades.png/revision/latest/scale-to-width-down/162?cb=20210330205644	Beguiling Blades
14	62	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e9/Eba%27s_Retribution.png/revision/latest/scale-to-width-down/162?cb=20210329183358	Eba's Retribution
9	62	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ca/Fangs_of_Woe.png/revision/latest/scale-to-width-down/162?cb=20210330210523	Fangs of Woe
14	63	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f1/Museum-Quality_Spear.png/revision/latest/scale-to-width-down/162?cb=20210329184451	Museum-Quality Spear
9	63	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d8/Bushwacker_Blades.png/revision/latest/scale-to-width-down/162?cb=20210330205842	Bushwacker Blades
14	64	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0b/Love_Hurts.png/revision/latest/scale-to-width-down/162?cb=20200315014817	Love Hurts
9	64	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f6/The_Blackhearts.png/revision/latest/scale-to-width-down/162?cb=20210330190332	The Blackhearts
14	65	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5e/Sol_Spear.png/revision/latest/scale-to-width-down/162?cb=20210329185819	Sol Spear
9	65	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/de/Dawn_and_Dusk.png/revision/latest/scale-to-width-down/162?cb=20210330210255	Dawn and Dusk
14	66	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/63/Viper%27s_Venom.png/revision/latest/scale-to-width-down/162?cb=20210329190146	Viper's Venom
9	66	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/88/Whispers_of_the_Asp.png/revision/latest/scale-to-width-down/162?cb=20210330214052	Whispers of the Asp
14	67	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/10/Justice_Bolt.png/revision/latest/scale-to-width-down/162?cb=20210329184055	Justice Bolt
9	67	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c0/Feather%27s_Edge.png/revision/latest/scale-to-width-down/162?cb=20210330210639	Feather's Edge
14	68	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b1/The_Allthorn.png/revision/latest/scale-to-width-down/162?cb=20210329185922	The Allthorn
9	68	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1c/The_Devourers.png/revision/latest/scale-to-width-down/162?cb=20210330213719	The Devourers
14	69	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7b/Spirit%27s_Passing.png/revision/latest/scale-to-width-down/162?cb=20210329185839	Spirit's Passing
9	69	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f3/Budding_Reunion.png/revision/latest/scale-to-width-down/162?cb=20210330205740	Budding Reunion
14	70	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c5/No_One_is_Ready.png/revision/latest/scale-to-width-down/162?cb=20191111225800	No One is Ready
9	70	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ac/Sekai_no_Kana.png/revision/latest/scale-to-width-down/162?cb=20191111225755	Sekai no Kana
14	71	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f2/Eclipsing_Faith.png/revision/latest/scale-to-width-down/162?cb=20210812232126	Eclipsing Faith
9	71	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/89/Dark_Whispers.png/revision/latest/scale-to-width-down/162?cb=20210812232140	Dark Whispers
14	72	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6b/Laticauda%27s_Poison.png/revision/latest/scale-to-width-down/162?cb=20230614212251	Laticauda's Poison
9	72	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9e/Coral_Spines.png/revision/latest/scale-to-width-down/162?cb=20230614212249	Coral Spines
11	73	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/99/Hattori_Hanzo_Sword.png/revision/latest/scale-to-width-down/162?cb=20210309053538	Hattori Hanzo Sword
14	73	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c5/Seven_Secrets_Spear.png/revision/latest/scale-to-width-down/162?cb=20210329185716	Seven Secrets Spear
11	74	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/74/Sword_of_the_Demon.png/revision/latest/scale-to-width-down/162?cb=20210309054424	Sword of the Demon
14	74	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/10/Oni_Spear.png/revision/latest/scale-to-width-down/162?cb=20210329184646	Oni Spear
11	75	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fe/Shinobi_Sword.png/revision/latest/scale-to-width-down/162?cb=20210203035359	Shinobi Sword
14	75	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/09/Shadow_Spear.png/revision/latest/scale-to-width-down/162?cb=20210203035506	Shadow Spear
11	76	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a6/Foxfire.png/revision/latest/scale-to-width-down/162?cb=20210309054817	Foxfire
14	76	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1a/Ninetails.png/revision/latest/scale-to-width-down/162?cb=20210329184543	Ninetails
11	77	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e8/Monofilament_Blade.png/revision/latest/scale-to-width-down/162?cb=20210309060916	Monofilament Blade
14	77	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d5/Nanometal_Spear.png/revision/latest/scale-to-width-down/162?cb=20210329184516	Nanometal Spear
11	78	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/46/Wicked_Blade.png/revision/latest/scale-to-width-down/162?cb=20210309061402	Wicked Blade
14	78	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b0/Venom_of_Eba.png/revision/latest/scale-to-width-down/162?cb=20210329190127	Venom of Eba
11	79	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7e/Falling_Blossoms.png/revision/latest/scale-to-width-down/162?cb=20200315014820	Falling Blossoms
14	79	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/The_Final_Gift.png/revision/latest/scale-to-width-down/162?cb=20200315014818	The Final Gift
11	80	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d7/Serisage.png/revision/latest/scale-to-width-down/162?cb=20210309061549	Serisage
14	80	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/30/Seridashi.png/revision/latest/scale-to-width-down/162?cb=20210329185657	Seridashi
11	81	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1c/Hidden_Dragon.png/revision/latest/scale-to-width-down/162?cb=20210309061634	Hidden Dragon
14	81	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/64/Matchlock_Spear.png/revision/latest/scale-to-width-down/162?cb=20210329184352	Matchlock Spear
11	82	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/89/Attitude_Adjustment.png/revision/latest/scale-to-width-down/162?cb=20190809170119	Attitude Adjustment
14	82	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/Ranked_Ladder.png/revision/latest/scale-to-width-down/162?cb=20190809170125	Ranked Ladder
11	84	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/08/Celebratory_Sabre.png/revision/latest/scale-to-width-down/162?cb=20211013235636	Celebratory Sabre
14	84	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f8/Corsage_Royale.png/revision/latest/scale-to-width-down/162?cb=20211013235647	Corsage Royale
11	85	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/17/Dueling_Broadsword.png/revision/latest/scale-to-width-down/162?cb=20221116205934	Dueling Broadsword
14	85	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7d/Fire_Nation_Spear.png/revision/latest/scale-to-width-down/162?cb=20221116205936	Fire Nation Spear
11	86	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d8/Palette_Knife.png/revision/latest/scale-to-width-down/162?cb=20230810055339	Palette Knife
14	86	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/ba/Inscription.png/revision/latest/scale-to-width-down/162?cb=20230810055335	Inscription
13	87	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/03/Righter_of_Wrongs.png/revision/latest/scale-to-width-down/162?cb=20210308191644	Righter of Wrongs
11	87	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/81/Sword_of_Justice.png/revision/latest/scale-to-width-down/162?cb=20210309061949	Sword of Justice
13	88	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/Kingly_Lance.png/revision/latest/scale-to-width-down/162?cb=20210308191729	Kingly Lance
11	88	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fd/Royal_Sword.png/revision/latest/scale-to-width-down/162?cb=20210309062045	Royal Sword
13	89	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5e/World_Champion_Lance.png/revision/latest/scale-to-width-down/162?cb=20210308191758	World Champion Lance
11	89	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/91/Pro-Tour_Racket.png/revision/latest/scale-to-width-down/162?cb=20210309062132	Pro-Tour Racket
13	90	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/43/Fancy_Lance.png/revision/latest/scale-to-width-down/162?cb=20200315014812	Fancy Lance
11	90	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5d/Love_Letter_Opener.png/revision/latest/scale-to-width-down/162?cb=20200315014821	Love Letter Opener
13	91	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/24/Lion%27s_Pride.png/revision/latest/scale-to-width-down/162?cb=20210308191939	Lion's Pride
11	91	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/44/Golden_Fang.png/revision/latest/scale-to-width-down/162?cb=20210309062320	Golden Fang
13	92	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bc/Broken_Crown.png/revision/latest/scale-to-width-down/162?cb=20210308192010	Broken Crown
11	92	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/43/The_Monarchy.png/revision/latest/scale-to-width-down/162?cb=20210309062403	The Monarchy
13	93	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/89/Roar_of_the_Pride.png/revision/latest/scale-to-width-down/162?cb=20210308192046	Roar of the Pride
11	93	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3f/Lionclaw.png/revision/latest/scale-to-width-down/162?cb=20210309062517	Lionclaw
13	94	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/82/Thumbs_Down.png/revision/latest/scale-to-width-down/162?cb=20210308192108	Thumbs Down
11	94	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4d/The_Gladius.png/revision/latest/scale-to-width-down/162?cb=20210309062610	The Gladius
13	95	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/Griffoth%27s_Fire.png/revision/latest/scale-to-width-down/162?cb=20210308192135	Griffoth's Fire
11	95	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/39/For_Royalty.png/revision/latest/scale-to-width-down/162?cb=20210309062651	For Royalty
13	96	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5c/Bitter_End.png/revision/latest/scale-to-width-down/162?cb=20210707163925	Bitter End
11	96	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b5/Night_Terrors.png/revision/latest/scale-to-width-down/162?cb=20210707163900	Night Terrors
13	97	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3e/Royal_Roar.png/revision/latest/scale-to-width-down/162?cb=20221019170227	Royal Roar
11	97	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ec/Golden_Lion_Fang.png/revision/latest/scale-to-width-down/162?cb=20221019170213	Golden Lion Fang
10	98	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5f/Airship_Engineer%27s_Hammer.png/revision/latest/scale-to-width-down/162?cb=20210208164857	Airship Engineer's Hammer
13	98	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e3/Aviator_Test_Rocket.png/revision/latest/scale-to-width-down/162?cb=20210208164756	Aviator Test Rocket
10	99	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fc/Earthshaker_Seismic_Sledge.png/revision/latest/scale-to-width-down/162?cb=20210208165035	Earthshaker Seismic Sledge
13	99	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/09/Aetheric_Rocket_Drill.png/revision/latest/scale-to-width-down/162?cb=20210208165121	Aetheric Rocket Drill
10	100	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e6/Mrs._Fix_It.png/revision/latest/scale-to-width-down/162?cb=20210324204928	Mrs. Fix It
13	100	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/88/Mk_1_Lance.png/revision/latest/scale-to-width-down/162?cb=20210308192359	Mk 1 Lance
10	101	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1a/The_Steamroller.png/revision/latest/scale-to-width-down/162?cb=20210324205223	The Steamroller
13	101	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0b/Mk_V_Lance.png/revision/latest/scale-to-width-down/162?cb=20210308192440	Mk V Lance
10	102	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e3/The_Dark_Cauldron.png/revision/latest/scale-to-width-down/162?cb=20210324205254	The Dark Cauldron
13	102	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/53/Witching_Broom.png/revision/latest/scale-to-width-down/162?cb=20191103171308	Witching Broom
10	103	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fb/Wings_of_Victory.png/revision/latest/scale-to-width-down/162?cb=20210324205328	Wings of Victory
13	103	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d1/The_Insignia.png/revision/latest/scale-to-width-down/162?cb=20210308192616	The Insignia
10	105	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a5/Soldier%27s_Duty.png/revision/latest/scale-to-width-down/162?cb=20210324205404	Soldier's Duty
13	105	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/30/Uprising.png/revision/latest/scale-to-width-down/162?cb=20210308192659	Uprising
10	106	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e9/Blooming_Dream.png/revision/latest/scale-to-width-down/162?cb=20220622155844	Blooming Dream
13	106	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/07/Chrysalis_Lance.png/revision/latest/scale-to-width-down/162?cb=20220622155901	Chrysalis Lance
10	107	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ca/Tea-KO.png/revision/latest/scale-to-width-down/162?cb=20230427001118	Tea-KO
13	107	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4f/Rocket_Parasol.png/revision/latest/scale-to-width-down/162?cb=20230427001117	Rocket Parasol
11	108	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ad/Sword_of_Davey_Jones.png/revision/latest/scale-to-width-down/162?cb=20210309062735	Sword of Davey Jones
12	108	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/74/Barnacle_Blasters.png/revision/latest/scale-to-width-down/162?cb=20210329173808	Barnacle Blasters
11	109	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b1/Driftwood_Chopper.png/revision/latest/scale-to-width-down/162?cb=20210309062818	Driftwood Chopper
12	109	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0a/Desert_Island_Blasters.png/revision/latest/scale-to-width-down/162?cb=20210329174434	Desert Island Blasters
11	110	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2f/Switchblade.png/revision/latest/scale-to-width-down/162?cb=20210309062853	Switchblade
12	110	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/32/Big_Dog_Blasters.png/revision/latest/scale-to-width-down/162?cb=20210329174000	Big Dog Blasters
11	111	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/74/Surprise%21.png/revision/latest/scale-to-width-down/162?cb=20210309062934	Surprise!
12	111	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a9/Naughty_%26_Nice.png/revision/latest/scale-to-width-down/162?cb=20210329175359	Naughty & Nice
11	112	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e8/Sharktooth_Grin.png/revision/latest/scale-to-width-down/162?cb=20210309063029	Sharktooth Grin
12	112	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9e/Sharkshooters.png/revision/latest/scale-to-width-down/162?cb=20210329175657	Sharkshooters
11	113	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/21/Mr._Stabby.png/revision/latest/scale-to-width-down/162?cb=20210309063124	Mr. Stabby
12	113	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ed/Boom_Booms.png/revision/latest/scale-to-width-down/162?cb=20210329174101	Boom Booms
11	114	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4a/Kraken%27s_Key.png/revision/latest/scale-to-width-down/162?cb=20210309063202	Kraken's Key
12	114	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a9/Tide_Turners.png/revision/latest/scale-to-width-down/162?cb=20210329180058	Tide Turners
11	115	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/61/Pristine_Cutlass.png/revision/latest/scale-to-width-down/162?cb=20210309063244	Pristine Cutlass
12	115	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a2/Exquisite_Cannons.png/revision/latest/scale-to-width-down/162?cb=20210329175122	Exquisite Cannons
11	116	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c5/Haunted_Incisor.png/revision/latest/scale-to-width-down/162?cb=20210308072715	Haunted Incisor
12	116	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d6/Wolf%27s_Howl.png/revision/latest/scale-to-width-down/162?cb=20210308215843	Wolf's Howl
11	117	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bc/Onihashi_Steel_Blade.png/revision/latest/scale-to-width-down/162?cb=20220223190527	Onihashi Steel Blade
12	117	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/64/MP7s.png/revision/latest/scale-to-width-down/162?cb=20220223190558	MP7s
12	118	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/88/Powerplay_Blasters.png/revision/latest/scale-to-width-down/162?cb=20210326064939	Powerplay Blasters
14	118	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bc/Spear_of_the_Future.png/revision/latest/scale-to-width-down/162?cb=20180818231122	Spear of the Future
12	119	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/26/Exception_Handlers.png/revision/latest/scale-to-width-down/162?cb=20210329175048	Exception Handlers
14	119	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/92/Null_Pointer.png/revision/latest/scale-to-width-down/162?cb=20210329184600	Null Pointer
12	120	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/57/Thunder_Bass_Blasters.png/revision/latest/scale-to-width-down/162?cb=20210326064908	Thunder Bass Blasters
14	120	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0e/Needle_Drop_Spear.png/revision/latest/scale-to-width-down/162?cb=20180724144917	Needle Drop Spear
12	121	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b6/Salty_Shooters.png/revision/latest/scale-to-width-down/162?cb=20210329175550	Salty Shooters
14	121	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cc/Scepter_of_Salt.png/revision/latest/scale-to-width-down/162?cb=20210329185100	Scepter of Salt
12	122	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ca/The_Consequences.png/revision/latest/scale-to-width-down/162?cb=20210329175842	The Consequences
14	122	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/72/Vector_Spear.png/revision/latest/scale-to-width-down/162?cb=20210329190103	Vector Spear
12	123	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7e/Lost_Technology.png/revision/latest/scale-to-width-down/162?cb=20210329175257	Lost Technology
14	123	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/97/Trident_of_Antiquity.png/revision/latest/scale-to-width-down/162?cb=20210329185949	Trident of Antiquity
12	124	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8a/Arts_and_Crafts.png/revision/latest/scale-to-width-down/162?cb=20180830025800	Arts and Crafts
14	124	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f2/Lacrosse_Check.png/revision/latest/scale-to-width-down/162?cb=20180830025820	Lacrosse Check
12	125	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e9/Bolt_Blasters.png/revision/latest/scale-to-width-down/162?cb=20210329174040	Bolt Blasters
14	125	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/62/Lightning_Rod.png/revision/latest/scale-to-width-down/162?cb=20210329184212	Lightning Rod
12	126	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/48/Loves_Me.png/revision/latest/scale-to-width-down/162?cb=20200315014834	Loves Me
14	126	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/24/Loves_Me_Not.png/revision/latest/scale-to-width-down/162?cb=20200315014817	Loves Me Not
12	127	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0a/Blazing_Fire.png/revision/latest/scale-to-width-down/162?cb=20210329174018	Blazing Fire
14	127	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9a/Magma_Spear.png/revision/latest/scale-to-width-down/162?cb=20210329184319	Magma Spear
12	128	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/36/Refractors.png/revision/latest/scale-to-width-down/162?cb=20220119232809	Refractors
14	128	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/68/Particle_Blade.png/revision/latest/scale-to-width-down/162?cb=20220119232810	Particle Blade
10	129	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/59/Sledge_Hammer.png/revision/latest/scale-to-width-down/162?cb=20210324210342	Sledge Hammer
9	129	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e1/Back_Alley_Justice.png/revision/latest/scale-to-width-down/162?cb=20210330205459	Back Alley Justice
10	130	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f1/High-Impact_Hammer.png/revision/latest/scale-to-width-down/162?cb=20210324210407	High-Impact Hammer
9	130	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/High-Voltage_Rippers.png/revision/latest/scale-to-width-down/162?cb=20210330211901	High-Voltage Rippers
10	131	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f9/Righteous_Indignation.png/revision/latest/scale-to-width-down/162?cb=20210324210434	Righteous Indignation
9	131	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/85/Vengeance.png/revision/latest/scale-to-width-down/162?cb=20210330214015	Vengeance
10	132	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b1/The_Bolt.png/revision/latest/scale-to-width-down/162?cb=20210324210700	The Bolt
9	132	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/32/Thunder_and_Clash.png/revision/latest/scale-to-width-down/162?cb=20210330213834	Thunder and Clash
10	133	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b4/Lord%27s_Justice.png/revision/latest/scale-to-width-down/162?cb=20210324210728	Lord's Justice
9	133	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0a/Battleblades.png/revision/latest/scale-to-width-down/162?cb=20210330205540	Battleblades
10	134	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c2/Executive_Order.png/revision/latest/scale-to-width-down/162?cb=20210324210754	Executive Order
9	134	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dd/Wings_of_Liberty.png/revision/latest/scale-to-width-down/162?cb=20210330214122	Wings of Liberty
10	135	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/26/The_Rook.png/revision/latest/scale-to-width-down/162?cb=20210324210819	The Rook
9	135	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fc/Serve_%26_Protect.png/revision/latest/scale-to-width-down/162?cb=20210330212548	Serve & Protect
10	136	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f7/People%27s_Elbow.png/revision/latest/scale-to-width-down/162?cb=20190809170117	People's Elbow
9	136	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6c/Brahma_Bulls.png/revision/latest/scale-to-width-down/162?cb=20210330192349	Brahma Bulls
10	137	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b5/Highland_Hammer.png/revision/latest/scale-to-width-down/162?cb=20210317164426	Highland Hammer
9	137	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d2/Hound%27s_Fangs.png/revision/latest/scale-to-width-down/162?cb=20210330192631	Hound's Fangs
9	138	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4d/Carbon-Steel_Knives.png/revision/latest/scale-to-width-down/162?cb=20210330210021	Carbon-Steel Knives
12	138	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f7/Tactical_Sidearms.png/revision/latest/scale-to-width-down/162?cb=20210329175824	Tactical Sidearms
9	139	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/38/Executioner%27s_Razors.png/revision/latest/scale-to-width-down/162?cb=20210330210435	Executioner's Razors
12	139	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/42/Dueling_Pistols.png/revision/latest/scale-to-width-down/162?cb=20210329174713	Dueling Pistols
9	140	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ea/Fleur_de_Bees.png/revision/latest/scale-to-width-down/162?cb=20210330210936	Fleur de Bees
12	140	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ab/Dragoon_Flintlocks.png/revision/latest/scale-to-width-down/162?cb=20210329174652	Dragoon Flintlocks
9	141	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b3/The_Miracle_Workers.png/revision/latest/scale-to-width-down/162?cb=20210330213752	The Miracle Workers
12	141	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/44/Mercy_Killers.png/revision/latest/scale-to-width-down/162?cb=20210329175335	Mercy Killers
9	142	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1a/Haunting_Blades.png/revision/latest/scale-to-width-down/162?cb=20210330191909	Haunting Blades
12	142	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fa/Ghost_and_Goblin.png/revision/latest/scale-to-width-down/162?cb=20210330204727	Ghost and Goblin
9	143	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/75/Hell%27s_Hearts.png/revision/latest/scale-to-width-down/162?cb=20210330211632	Hell's Hearts
12	143	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4a/Duty_%26_Sacrifice.png/revision/latest/scale-to-width-down/162?cb=20210329174735	Duty & Sacrifice
9	144	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/35/Hyper_Cleave.png/revision/latest/scale-to-width-down/162?cb=20210330211956	Hyper Cleave
12	144	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/37/Disassemblers.png/revision/latest/scale-to-width-down/162?cb=20210329174553	Disassemblers
9	145	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4e/Heartaches.png/revision/latest/scale-to-width-down/162?cb=20210330190856	Heartaches
12	145	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/00/Beautiful_%26_Deadly.png/revision/latest/scale-to-width-down/162?cb=20200315014832	Beautiful & Deadly
9	146	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f4/Getaway_Points.png/revision/latest/scale-to-width-down/162?cb=20210330211040	Getaway Points
12	146	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cc/XLR8R%27s.png/revision/latest/scale-to-width-down/162?cb=20210329180143	XLR8R's
9	147	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f7/Raven_Claws.png/revision/latest/scale-to-width-down/162?cb=20210330212337	Raven Claws
12	147	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/18/Winged_Danger.png/revision/latest/scale-to-width-down/162?cb=20210329180121	Winged Danger
9	148	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/86/Anchor_Shanks.png/revision/latest/scale-to-width-down/162?cb=20220622155343	Anchor Shanks
12	148	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d9/ASM_Blasters.png/revision/latest/scale-to-width-down/162?cb=20220622155423	ASM Blasters
8	149	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e5/Panic_Maker.png/revision/latest/scale-to-width-down/162?cb=20210226081748	Panic Maker
10	149	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/48/Rank_Breaker.png/revision/latest/scale-to-width-down/162?cb=20210308214558	Rank Breaker
8	150	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4b/In_Case_of_Brawl.png/revision/latest/scale-to-width-down/162?cb=20210301084318	In Case of Brawl
10	150	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f2/Free_Parking.png/revision/latest/scale-to-width-down/162?cb=20210324211330	Free Parking
8	151	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/52/Dimensional_Divide.png/revision/latest/scale-to-width-down/162?cb=20210301084409	Dimensional Divide
10	151	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f1/Lodestone.png/revision/latest/scale-to-width-down/162?cb=20210324211356	Lodestone
8	152	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4a/Holiday_Fear.png/revision/latest/scale-to-width-down/162?cb=20210301084454	Holiday Fear
10	152	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/97/Season%27s_Beatings.png/revision/latest/scale-to-width-down/162?cb=20210324211430	Season's Beatings
8	153	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ad/Chopsicle.png/revision/latest/scale-to-width-down/162?cb=20210301084919	Chopsicle
10	153	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/86/Ice_Crusher.png/revision/latest/scale-to-width-down/162?cb=20210324211457	Ice Crusher
8	154	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/18/The_Furnace.png/revision/latest/scale-to-width-down/162?cb=20210301085032	The Furnace
10	154	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7d/Sledge_Fire.png/revision/latest/scale-to-width-down/162?cb=20210324211527	Sledge Fire
8	155	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/59/Heaven_Cleaver.png/revision/latest/scale-to-width-down/162?cb=20210301085119	Heaven Cleaver
10	155	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/98/Astro_Slammer.png/revision/latest/scale-to-width-down/162?cb=20210324211556	Astro Slammer
8	156	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dd/Ritual_Blade.png/revision/latest/scale-to-width-down/162?cb=20210301085210	Ritual Blade
10	156	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9f/Brazen_Maul.png/revision/latest/scale-to-width-down/162?cb=20210324211621	Brazen Maul
8	157	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/41/The_Test.png/revision/latest/scale-to-width-down/162?cb=20210301085304	The Test
10	157	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a2/Verdict.png/revision/latest/scale-to-width-down/162?cb=20210324211652	Verdict
8	158	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/The_Renegade.png/revision/latest/scale-to-width-down/162?cb=20210301085340	The Renegade
10	158	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bd/Heavy_Hitter.png/revision/latest/scale-to-width-down/162?cb=20210324211714	Heavy Hitter
8	159	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/38/Hit_Hard.png/revision/latest/scale-to-width-down/162?cb=20191111225757	Hit Hard
10	159	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/76/Hit_Often.png/revision/latest/scale-to-width-down/162?cb=20191111225750	Hit Often
8	160	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a8/Big_Clipper.png/revision/latest/scale-to-width-down/162?cb=20210901223101	Big Clipper
10	160	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2a/Bullhorn_Basher.png/revision/latest/scale-to-width-down/162?cb=20210901223110	Bullhorn Basher
8	161	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3d/Champion%27s_Axe.png/revision/latest/scale-to-width-down/162?cb=20221116205931	Champion's Axe
10	161	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1f/Crystalline_Mallet.png/revision/latest/scale-to-width-down/162?cb=20221116205933	Crystalline Mallet
8	162	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a5/Ivaldi%27s_Wings.png/revision/latest/scale-to-width-down/162?cb=20210203035145	Ivaldi's Wings
14	162	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9f/Dwarven_Awl.png/revision/latest/scale-to-width-down/162?cb=20180719212736	Dwarven Awl
8	163	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/63/Magni.png/revision/latest/scale-to-width-down/162?cb=20210224195035	Magni
14	163	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/78/Modi.png/revision/latest/scale-to-width-down/162?cb=20210224195104	Modi
8	164	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/06/Disgrace.png/revision/latest/scale-to-width-down/162?cb=20210326053240	Disgrace
14	164	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c2/Fellthorne.png/revision/latest/scale-to-width-down/162?cb=20210329183425	Fellthorne
8	165	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8e/Heartbreaker.png/revision/latest/scale-to-width-down/162?cb=20200315014826	Heartbreaker
14	165	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/52/Heartseeker.png/revision/latest/scale-to-width-down/162?cb=20200315014816	Heartseeker
8	166	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/51/Phoenix_Wings.png/revision/latest/scale-to-width-down/162?cb=20210326053318	Phoenix Wings
14	166	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/55/Surt%27s_Arrow.png/revision/latest/scale-to-width-down/162?cb=20210329185859	Surt's Arrow
8	167	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/80/Aesir_Blade.png/revision/latest/scale-to-width-down/162?cb=20190609152245	Aesir Blade
14	167	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a8/Moonstone_Spear.png/revision/latest/scale-to-width-down/162?cb=20190609152235	Moonstone Spear
8	168	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2c/Eternal_Blade.png/revision/latest/scale-to-width-down/162?cb=20210326053350	Eternal Blade
14	168	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8d/Valkyrie%27s_Fury.png/revision/latest/scale-to-width-down/162?cb=20210329190036	Valkyrie's Fury
8	169	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bb/Spitebringer.png/revision/latest/scale-to-width-down/162?cb=20210326053420	Spitebringer
14	169	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c4/Loathsome_Talon.png/revision/latest/scale-to-width-down/162?cb=20210329184234	Loathsome Talon
8	170	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1b/Fate_Cleaver.png/revision/latest/scale-to-width-down/162?cb=20210326053450	Fate Cleaver
14	170	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/76/Flamepiercer.png/revision/latest/scale-to-width-down/162?cb=20210329183636	Flamepiercer
8	171	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7d/Barbaraxe.png/revision/latest/scale-to-width-down/162?cb=20210326053519	Barbaraxe
14	171	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/37/Aurora%27s_Spear.png/revision/latest/scale-to-width-down/162?cb=20210329183214	Aurora's Spear
8	172	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b7/Bifrost_Edge.png/revision/latest/scale-to-width-down/162?cb=20210326053547	Bifrost Edge
14	172	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d3/Heimdall%27s_Call.png/revision/latest/scale-to-width-down/162?cb=20210329183721	Heimdall's Call
8	173	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0b/Varin%27s_Axe.png/revision/latest/scale-to-width-down/162?cb=20220727161831	Varin's Axe
14	173	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5a/Gungnir.png/revision/latest/scale-to-width-down/162?cb=20220727161534	Gungnir
8	174	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0b/Varin%27s_Axe.png/revision/latest/scale-to-width-down/162?cb=20220727161831	Varin's Axe
14	174	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5a/Gungnir.png/revision/latest/scale-to-width-down/162?cb=20220727161534	Gungnir
9	175	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7d/Three_Fingered_Discount.png/revision/latest/scale-to-width-down/162?cb=20210330194007	Three Fingered Discount
11	175	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/50/Diamond_Cutter.png/revision/latest/scale-to-width-down/162?cb=20200417023830	Diamond Cutter
9	176	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/80/Trials_of_Worth.png/revision/latest/scale-to-width-down/162?cb=20210330193219	Trials of Worth
11	176	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/40/Soul_Dancer.png/revision/latest/scale-to-width-down/162?cb=20200417023832	Soul Dancer
9	177	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/99/Wicked_Claws.png/revision/latest/scale-to-width-down/162?cb=20210330193339	Wicked Claws
11	177	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/21/Assassin%27s_Breath.png/revision/latest/scale-to-width-down/162?cb=20200417023824	Assassin's Breath
9	178	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c0/Pillage_and_Plunder.png/revision/latest/scale-to-width-down/162?cb=20210330193718	Pillage and Plunder
11	178	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7c/Catlass.png/revision/latest/scale-to-width-down/162?cb=20200417023827	Catlass
9	179	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/19/Rending_Talons.png/revision/latest/scale-to-width-down/162?cb=20210330195055	Rending Talons
11	179	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/71/Chitinous_Blade.png/revision/latest/scale-to-width-down/162?cb=20200417023829	Chitinous Blade
9	180	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e9/Actuator_Claws.png/revision/latest/scale-to-width-down/162?cb=20210330195336	Actuator Claws
11	180	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5b/Blazing_Light_Sword.png/revision/latest/scale-to-width-down/162?cb=20200417023825	Blazing Light Sword
9	181	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/96/Hello_Katars.png/revision/latest/scale-to-width-down/162?cb=20180830025825	Hello Katars
11	181	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/30/No_Running%21.png/revision/latest/scale-to-width-down/162?cb=20180830025759	No Running!
9	182	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1c/Revolving_Blades.png/revision/latest/scale-to-width-down/162?cb=20210330195453	Revolving Blades
11	182	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/95/Double-Action.png/revision/latest/scale-to-width-down/162?cb=20200417023831	Double-Action
9	183	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c0/Bone_Claws.png/revision/latest/scale-to-width-down/162?cb=20210330195610	Bone Claws
11	183	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/84/Joint_Pain.png/revision/latest/scale-to-width-down/162?cb=20191103171122	Joint Pain
7	225	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/07/The_Grips.png/revision/latest/scale-to-width-down/162?cb=20180830025833	The Grips
9	184	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/33/Crescent_Moon_Claws.png/revision/latest/scale-to-width-down/162?cb=20210330195710	Crescent Moon Claws
11	184	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4a/Starforged_Scimitar.png/revision/latest/scale-to-width-down/162?cb=20191217192929	Starforged Scimitar
9	185	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/38/Iron_Steel_Claws.png/revision/latest/scale-to-width-down/162?cb=20210330195804	Iron Steel Claws
11	185	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f4/Sword_of_Heroes.png/revision/latest/scale-to-width-down/162?cb=20210324203929	Sword of Heroes
8	186	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/42/Tusk.png/revision/latest/scale-to-width-down/162?cb=20210326053821	Tusk
12	186	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f6/The_Roadhogs.png/revision/latest/scale-to-width-down/162?cb=20210329180006	The Roadhogs
8	187	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/42/Painkiller.png/revision/latest/scale-to-width-down/162?cb=20210326053852	Painkiller
12	187	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1a/The_Doctor%27s_Orders.png/revision/latest/scale-to-width-down/162?cb=20210329175902	The Doctor's Orders
8	188	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/Rust.png/revision/latest/scale-to-width-down/162?cb=20210326053931	Rust
12	188	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f4/Sawbones.png/revision/latest/scale-to-width-down/162?cb=20210329175628	Sawbones
8	189	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/82/Hack_and_Slash.png/revision/latest/scale-to-width-down/162?cb=20210326054105	Hack and Slash
12	189	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/59/The_Sequels.png/revision/latest/scale-to-width-down/162?cb=20210329180023	The Sequels
8	190	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/41/Mortal_Coil.png/revision/latest/scale-to-width-down/162?cb=20210326054130	Mortal Coil
12	190	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5c/Asp_and_Adder.png/revision/latest/scale-to-width-down/162?cb=20210329173712	Asp and Adder
8	191	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/37/Hook_Setter.png/revision/latest/scale-to-width-down/162?cb=20210326054155	Hook Setter
12	191	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fb/Catch_and_Release.png/revision/latest/scale-to-width-down/162?cb=20210329174206	Catch and Release
8	192	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f0/Axe_You_Out.png/revision/latest/scale-to-width-down/162?cb=20200315014825	Axe You Out
12	192	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b9/A_Shot_at_Love.png/revision/latest/scale-to-width-down/162?cb=20200315014830	A Shot at Love
8	193	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/59/Bump_in_the_Night.png/revision/latest/scale-to-width-down/162?cb=20210226081236	Bump in the Night
12	193	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7e/Shriek_%26_Wail.png/revision/latest/scale-to-width-down/162?cb=20210329175718	Shriek & Wail
8	194	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1e/Rick%27s_Hatchet.png/revision/latest/scale-to-width-down/162?cb=20210326054230	Rick's Hatchet
12	194	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/85/Revolvers.png/revision/latest/scale-to-width-down/162?cb=20210329175506	Revolvers
8	195	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6b/Star_Render.png/revision/latest/scale-to-width-down/162?cb=20211013235618	Star Render
12	195	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f3/Eclipsers.png/revision/latest/scale-to-width-down/162?cb=20211013235627	Eclipsers
7	196	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/33/Whistling_Death.png/revision/latest/scale-to-width-down/162?cb=20210309090527	Whistling Death
9	196	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/60/Nettle_%26_Belladonna.png/revision/latest/scale-to-width-down/162?cb=20210330212230	Nettle & Belladonna
7	197	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a6/Starfall.png/revision/latest/scale-to-width-down/162?cb=20210309090629	Starfall
9	197	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/62/Fire_%26_The_Flame.png/revision/latest/scale-to-width-down/162?cb=20210330210720	Fire & The Flame
7	198	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1e/Gift_Giver.png/revision/latest/scale-to-width-down/162?cb=20210309090905	Gift Giver
9	198	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1b/Silent_Night.png/revision/latest/scale-to-width-down/162?cb=20210330212632	Silent Night
7	199	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/40/Evergrowth.png/revision/latest/scale-to-width-down/162?cb=20210309090941	Evergrowth
9	199	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0a/Bone_%26_Bane.png/revision/latest/scale-to-width-down/162?cb=20210330205710	Bone & Bane
7	200	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3d/Wild_Hunt.png/revision/latest/scale-to-width-down/162?cb=20210309091218	Wild Hunt
9	200	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1c/Tooth_and_Nail.png/revision/latest/scale-to-width-down/162?cb=20210330213910	Tooth and Nail
7	201	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f6/Stardrive.png/revision/latest/scale-to-width-down/162?cb=20210309210438	Stardrive
9	201	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6d/Infinity_Blades.png/revision/latest/scale-to-width-down/162?cb=20210330212100	Infinity Blades
7	202	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0b/Packbane.png/revision/latest/scale-to-width-down/162?cb=20210309210539	Packbane
9	202	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/17/Wolfsilver_Blades.png/revision/latest/scale-to-width-down/162?cb=20210330214155	Wolfsilver Blades
7	203	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/80/Bramble.png/revision/latest/scale-to-width-down/162?cb=20210208170151	Bramble
9	203	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/35/Tooth_%26_Trouble.png/revision/latest/scale-to-width-down/162?cb=20210208170301	Tooth & Trouble
7	204	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/17/Dragon_Spawn_Bow.png/revision/latest/scale-to-width-down/162?cb=20210309210704	Dragon Spawn Bow
9	204	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/77/Cardinal_Talons.png/revision/latest/scale-to-width-down/162?cb=20210330210046	Cardinal Talons
7	205	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6b/Moongleam_Bow.png/revision/latest/scale-to-width-down/162?cb=20190609152243	Moongleam Bow
9	205	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/38/Crystalline_Blades.png/revision/latest/scale-to-width-down/162?cb=20210330192950	Crystalline Blades
7	206	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8b/Digital_Sample.png/revision/latest/scale-to-width-down/162?cb=20210309210903	Digital Sample
9	206	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/04/Numeric_Flux.png/revision/latest/scale-to-width-down/162?cb=20210330212302	Numeric Flux
7	207	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3a/New_Best_Friend.png/revision/latest/scale-to-width-down/162?cb=20210309211046	New Best Friend
9	207	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/99/Dual_Hunting_Knives.png/revision/latest/scale-to-width-down/162?cb=20210330210336	Dual Hunting Knives
7	208	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c3/Lightbringer.png/revision/latest/scale-to-width-down/162?cb=20220623023123	Lightbringer
9	208	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/df/Spirit_Ash%27s_Fangs.png/revision/latest/scale-to-width-down/162?cb=20220623023056	Spirit Ash's Fangs
7	209	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/93/Loa_Bow.png/revision/latest/scale-to-width-down/162?cb=20180730021402	Loa Bow
8	209	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/83/Laughing_Skull.png/revision/latest/scale-to-width-down/162?cb=20180730021407	Laughing Skull
7	210	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a8/Soulbane.png/revision/latest/scale-to-width-down/162?cb=20180730021405	Soulbane
8	210	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b4/Death_Rattle.png/revision/latest/scale-to-width-down/162?cb=20180730021410	Death Rattle
7	211	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e0/Extinction_Event.png/revision/latest/scale-to-width-down/162?cb=20180730021406	Extinction Event
8	211	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/98/The_Harvester.png/revision/latest/scale-to-width-down/162?cb=20180730021411	The Harvester
7	212	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b2/Dark_Horse.png/revision/latest/scale-to-width-down/162?cb=20180730021403	Dark Horse
8	212	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c9/Manta_Blade.png/revision/latest/scale-to-width-down/162?cb=20180730021409	Manta Blade
7	213	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/27/The_Albatross.png/revision/latest/scale-to-width-down/162?cb=20210309211316	The Albatross
8	213	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3a/The_Captain.png/revision/latest/scale-to-width-down/162?cb=20210326055006	The Captain
7	214	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0c/Ironcaster.png/revision/latest/scale-to-width-down/162?cb=20180730021406	Ironcaster
8	214	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d1/Soul_Cleaver.png/revision/latest/scale-to-width-down/162?cb=20180730021412	Soul Cleaver
7	215	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d2/Faithful_Departure.png/revision/latest/scale-to-width-down/162?cb=20180730021404	Faithful Departure
8	215	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a6/La_Guitarra.png/revision/latest/scale-to-width-down/162?cb=20180730021409	La Guitarra
7	216	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/Deathbolt.png/revision/latest/scale-to-width-down/162?cb=20210308212047	Deathbolt
8	216	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2a/Eye_of_Elyria.png/revision/latest/scale-to-width-down/162?cb=20210226081536	Eye of Elyria
7	217	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ed/Carved_Precision.png/revision/latest/scale-to-width-down/162?cb=20210211200703	Carved Precision
8	217	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/26/Koa_Wood_Axe.png/revision/latest/scale-to-width-down/162?cb=20210211200715	Koa Wood Axe
7	218	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bb/Femur_Flex.png/revision/latest/scale-to-width-down/162?cb=20210812055938	Femur Flex
8	218	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/48/Elyria%27s_End.png/revision/latest/scale-to-width-down/162?cb=20210812060049	Elyria's End
7	219	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/17/Rain_of_Fire.png/revision/latest/scale-to-width-down/162?cb=20210309211642	Rain of Fire
11	219	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a5/Soulflame.png/revision/latest/scale-to-width-down/162?cb=20210309063428	Soulflame
7	220	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/35/Wandering_Wind.png/revision/latest/scale-to-width-down/162?cb=20210309211711	Wandering Wind
11	220	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a1/Sword_Breaker.png/revision/latest/scale-to-width-down/162?cb=20210309063502	Sword Breaker
7	221	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c8/Iron_Fury.png/revision/latest/scale-to-width-down/162?cb=20210309211739	Iron Fury
11	221	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/80/Toothpick.png/revision/latest/scale-to-width-down/162?cb=20210309063539	Toothpick
7	222	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fa/Voice_of_the_Forest.png/revision/latest/scale-to-width-down/162?cb=20210309211807	Voice of the Forest
11	222	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a3/Gift_of_Sojobo.png/revision/latest/scale-to-width-down/162?cb=20210309063616	Gift of Sojobo
7	223	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c0/Debt_Collector.png/revision/latest/scale-to-width-down/162?cb=20210309211833	Debt Collector
11	223	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/64/Blade_of_Shadows.png/revision/latest/scale-to-width-down/162?cb=20210309063654	Blade of Shadows
7	224	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f5/Heirloom_%28Bow%29.png/revision/latest/scale-to-width-down/162?cb=20201222074016	Heirloom (Bow)
11	224	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/67/Ancestor%27s_Flame.png/revision/latest/scale-to-width-down/162?cb=20210309063742	Ancestor's Flame
11	225	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e2/Switchcomb.png/revision/latest/scale-to-width-down/162?cb=20180830025801	Switchcomb
7	226	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7c/Rising_Glory.png/revision/latest/scale-to-width-down/162?cb=20210309211900	Rising Glory
11	226	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3b/Imperial_Decree.png/revision/latest/scale-to-width-down/162?cb=20210309063837	Imperial Decree
7	227	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/68/Shadowbolt.png/revision/latest/scale-to-width-down/162?cb=20210309211925	Shadowbolt
11	227	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/51/Crypto_Blade.png/revision/latest/scale-to-width-down/162?cb=20210309063915	Crypto Blade
7	229	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bb/Kingdom_Bow.png/revision/latest/scale-to-width-down/162?cb=20210309211959	Kingdom Bow
11	229	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/67/Michonne%27s_Katana.png/revision/latest/scale-to-width-down/162?cb=20210309063958	Michonne's Katana
7	230	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/25/Tactical_Recurve.png/revision/latest/scale-to-width-down/162?cb=20220223190507	Tactical Recurve
11	230	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4d/Mikimoto_Katana.png/revision/latest/scale-to-width-down/162?cb=20220223190617	Mikimoto Katana
7	231	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/32/Bogha.png/revision/latest/scale-to-width-down/162?cb=20230308190424	Bogha
11	231	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/db/Claideamh.png/revision/latest/scale-to-width-down/162?cb=20230308190426	Claideamh
8	232	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d6/Axe-bladed_Multi-Tool.png/revision/latest/scale-to-width-down/162?cb=20210326054459	Axe-bladed Multi-Tool
13	232	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/29/Asteroid_Grinder.png/revision/latest/scale-to-width-down/162?cb=20210308192915	Asteroid Grinder
8	233	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ab/Golem%27s_Heart.png/revision/latest/scale-to-width-down/162?cb=20210326054539	Golem's Heart
13	233	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/28/Aesinite_Lance.png/revision/latest/scale-to-width-down/162?cb=20210308193048	Aesinite Lance
8	234	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/59/Ceremonial_Axe.png/revision/latest/scale-to-width-down/162?cb=20210326054612	Ceremonial Axe
13	234	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f3/Honor%27s_Edge.png/revision/latest/scale-to-width-down/162?cb=20210308193146	Honor's Edge
8	235	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b5/The_Mountain.png/revision/latest/scale-to-width-down/162?cb=20210326054637	The Mountain
13	235	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c0/Battle_Lance.png/revision/latest/scale-to-width-down/162?cb=20210308193224	Battle Lance
8	236	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d9/World_Cleaver.png/revision/latest/scale-to-width-down/162?cb=20210326054704	World Cleaver
13	236	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2f/End_Bringer.png/revision/latest/scale-to-width-down/162?cb=20210308193302	End Bringer
8	237	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/75/Foe_Splitter.png/revision/latest/scale-to-width-down/162?cb=20210326054740	Foe Splitter
13	237	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c2/War_Pipes.png/revision/latest/scale-to-width-down/162?cb=20210308193340	War Pipes
8	238	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c9/Macho_King.png/revision/latest/scale-to-width-down/162?cb=20191111225813	Macho King
13	238	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/52/OHHHHH_YEEAAAH%21.png/revision/latest/scale-to-width-down/162?cb=20191111225805	OHHHHH YEEAAAH!
8	239	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a4/Ivaldi_Design.png/revision/latest/scale-to-width-down/162?cb=20210326054810	Ivaldi Design
13	239	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f1/Svartalfheim%27s_Caverns.png/revision/latest/scale-to-width-down/162?cb=20210308193454	Svartalfheim's Caverns
8	240	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f5/Extra_Large_Scalpel.png/revision/latest/scale-to-width-down/162?cb=20221019170159	Extra Large Scalpel
13	240	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f2/Skull_Saw.png/revision/latest/scale-to-width-down/162?cb=20221019170230	Skull Saw
7	241	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/83/Sanguine_Flight.png/revision/latest/scale-to-width-down/162?cb=20210205021529	Sanguine Flight
12	241	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/49/Repeating_Crossbows.png/revision/latest/scale-to-width-down/162?cb=20210205021757	Repeating Crossbows
7	242	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e6/Zombie_Whisperer.png/revision/latest/scale-to-width-down/162?cb=20210205022521	Zombie Whisperer
12	242	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/Silver_and_Steel.png/revision/latest/scale-to-width-down/162?cb=20210205022645	Silver and Steel
7	243	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/55/Wyvernbane.png/revision/latest/scale-to-width-down/162?cb=20210203035823	Wyvernbane
12	243	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/04/Drakenfire.png/revision/latest/scale-to-width-down/162?cb=20210203035750	Drakenfire
7	244	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f4/AG_Tactical_System.png/revision/latest/scale-to-width-down/162?cb=20210205022140	AG Tactical System
12	244	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c5/Five-Sevens.png/revision/latest/scale-to-width-down/162?cb=20210205022331	Five-Sevens
7	245	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5e/Wicked_Wings.png/revision/latest/scale-to-width-down/162?cb=20191103171152	Wicked Wings
12	245	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/51/Brimstone_Blasters.png/revision/latest/scale-to-width-down/162?cb=20210330204501	Brimstone Blasters
7	246	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4f/Runewood_Bow.png/revision/latest/scale-to-width-down/162?cb=20210204210737	Runewood Bow
12	246	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/65/Fairy_Fire.png/revision/latest/scale-to-width-down/162?cb=20210204210928	Fairy Fire
7	247	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/55/Security_Measure.png/revision/latest/scale-to-width-down/162?cb=20210224005452	Security Measure
12	247	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/27/Laser_Blazers.png/revision/latest/scale-to-width-down/162?cb=20210224005522	Laser Blazers
7	248	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/72/Hydro-Bow.png/revision/latest/scale-to-width-down/162?cb=20210203035911	Hydro-Bow
12	248	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fb/Splish_Splash.png/revision/latest/scale-to-width-down/162?cb=20210203035850	Splish Splash
7	249	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c1/Hunter%27s_Pride.png/revision/latest/scale-to-width-down/162?cb=20180817011311	Hunter's Pride
12	249	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/05/Royal_Family.png/revision/latest/scale-to-width-down/162?cb=20180817011308	Royal Family
7	250	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bb/Lara%27s_Bow.png/revision/latest/scale-to-width-down/162?cb=20210308214120	Lara's Bow
12	250	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b4/Dual_Pistols.png/revision/latest/scale-to-width-down/162?cb=20210205021439	Dual Pistols
7	251	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ea/Recurve_Bow.png/revision/latest/scale-to-width-down/162?cb=20210308214224	Recurve Bow
12	251	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/42/Tactical_Pistols.png/revision/latest/scale-to-width-down/162?cb=20210329180715	Tactical Pistols
7	252	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/29/Counter_Curse.png/revision/latest/scale-to-width-down/162?cb=20210203035247	Counter Curse
12	252	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8f/Purge_and_Exorcise.png/revision/latest/scale-to-width-down/162?cb=20210203035715	Purge and Exorcise
7	253	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/aa/Spiteful_Scepter.png/revision/latest/scale-to-width-down/162?cb=20210812234926	Spiteful Scepter
12	253	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/31/Vengeance_at_Hand.png/revision/latest/scale-to-width-down/162?cb=20210812234934	Vengeance at Hand
8	254	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/53/Bone_Cleaver.png/revision/latest/scale-to-width-down/162?cb=20210326055448	Bone Cleaver
11	254	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bd/Dragonsplinter.png/revision/latest/scale-to-width-down/162?cb=20210309074608	Dragonsplinter
8	255	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ed/Facemelter.png/revision/latest/scale-to-width-down/162?cb=20210326062132	Facemelter
11	255	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/84/The_Slayer.png/revision/latest/scale-to-width-down/162?cb=20210309074655	The Slayer
8	256	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4a/Butcher%27s_Delight.png/revision/latest/scale-to-width-down/162?cb=20210326062205	Butcher's Delight
11	256	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/94/Heavy_Chopper.png/revision/latest/scale-to-width-down/162?cb=20210309074736	Heavy Chopper
8	257	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/67/Axe_of_Might.png/revision/latest/scale-to-width-down/162?cb=20210326062231	Axe of Might
11	257	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/05/Sword_of_Truth.png/revision/latest/scale-to-width-down/162?cb=20210309074822	Sword of Truth
8	258	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b3/Airship_Anchor.png/revision/latest/scale-to-width-down/162?cb=20210326062301	Airship Anchor
11	258	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5c/Jolly_Ripper.png/revision/latest/scale-to-width-down/162?cb=20210309074928	Jolly Ripper
8	259	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b6/Trend_Setter.png/revision/latest/scale-to-width-down/162?cb=20210326062330	Trend Setter
11	259	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9f/Lookin%27_Sharp.png/revision/latest/scale-to-width-down/162?cb=20210309075011	Lookin' Sharp
8	260	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/80/The_Iron_Flight.png/revision/latest/scale-to-width-down/162?cb=20210326062356	The Iron Flight
11	260	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/28/Wyvern%27s_Sting.png/revision/latest/scale-to-width-down/162?cb=20210309075050	Wyvern's Sting
8	261	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/57/Grass_Axe.png/revision/latest/scale-to-width-down/162?cb=20190613224607	Grass Axe
11	261	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2f/Finn_Sword.png/revision/latest/scale-to-width-down/162?cb=20190613224605	Finn Sword
8	262	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fe/Warrior%27s_Pride.png/revision/latest/scale-to-width-down/162?cb=20210326062427	Warrior's Pride
11	262	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4f/Sky_Piercer.png/revision/latest/scale-to-width-down/162?cb=20210309075153	Sky Piercer
8	263	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/47/A_Sign_from_Above.png/revision/latest/scale-to-width-down/162?cb=20210922155306	A Sign from Above
11	263	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0d/Maggie%27s_Machete.png/revision/latest/scale-to-width-down/162?cb=20210922155257	Maggie's Machete
8	264	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/14/Battle_Axe_%28Simon_Belmont%29.png/revision/latest/scale-to-width-down/162?cb=20221019170155	Battle Axe (Simon Belmont)
11	264	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bc/Morning_Star.png/revision/latest/scale-to-width-down/162?cb=20221019170224	Morning Star
6	265	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f0/Hot_Lava.png/revision/latest/scale-to-width-down/162?cb=20210305165411	Hot Lava
10	265	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/13/Heart_of_the_Volcano.png/revision/latest/scale-to-width-down/162?cb=20210324220311	Heart of the Volcano
6	266	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/08/Fiendish_Fists.png/revision/latest/scale-to-width-down/162?cb=20210305165525	Fiendish Fists
10	266	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9b/Nightmare.png/revision/latest/scale-to-width-down/162?cb=20210324220339	Nightmare
6	267	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dc/Wrecking_Crew.png/revision/latest/scale-to-width-down/162?cb=20210305170238	Wrecking Crew
10	267	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0b/Piledriver.png/revision/latest/scale-to-width-down/162?cb=20210324220410	Piledriver
6	268	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7f/Martial_Fists.png/revision/latest/scale-to-width-down/162?cb=20210305170432	Martial Fists
10	268	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/50/Fate_Crusher.png/revision/latest/scale-to-width-down/162?cb=20210324220436	Fate Crusher
6	269	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fb/The_Mittens.png/revision/latest/scale-to-width-down/162?cb=20210308215553	The Mittens
10	269	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4b/The_Snowplow.png/revision/latest/scale-to-width-down/162?cb=20210205170120	The Snowplow
6	270	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6b/Punch-a-tron_5000s.png/revision/latest/scale-to-width-down/162?cb=20210305170826	Punch-a-tron 5000s
10	270	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b3/Atomic_Sledge.png/revision/latest/scale-to-width-down/162?cb=20210324220502	Atomic Sledge
6	271	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/23/Geocrashers.png/revision/latest/scale-to-width-down/162?cb=20210305170951	Geocrashers
10	271	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/75/Root_of_the_Forest.png/revision/latest/scale-to-width-down/162?cb=20210324220526	Root of the Forest
6	272	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8d/Heaven%27s_Touch.png/revision/latest/scale-to-width-down/162?cb=20210305171123	Heaven's Touch
10	272	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/28/Divine_Intervention.png/revision/latest/scale-to-width-down/162?cb=20210324220553	Divine Intervention
6	273	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/90/Jake_Fists.png/revision/latest/scale-to-width-down/162?cb=20210305175147	Jake Fists
10	273	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/77/Makin%27_Bacon_Pancakes.png/revision/latest/scale-to-width-down/162?cb=20190613224607	Makin' Bacon Pancakes
6	274	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2c/Jawbreakers.png/revision/latest/scale-to-width-down/162?cb=20210305175016	Jawbreakers
10	274	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6f/Sucker_Punch.png/revision/latest/scale-to-width-down/162?cb=20210205170537	Sucker Punch
6	275	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b8/Tetramand_Beatdown.png/revision/latest/scale-to-width-down/162?cb=20210205211646	Tetramand Beatdown
10	275	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e7/Concrete_Slam.png/revision/latest/scale-to-width-down/162?cb=20210205170844	Concrete Slam
6	276	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/29/Cuffed_Regalia.png/revision/latest/scale-to-width-down/162?cb=20211013235658	Cuffed Regalia
10	276	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b8/Disco_Brawl.png/revision/latest/scale-to-width-down/162?cb=20211013235708	Disco Brawl
6	277	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/18/Metalbender%27s_Mittens.png/revision/latest/scale-to-width-down/162?cb=20221116205937	Metalbender's Mittens
10	277	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e5/Compressed_Metal_Mallet.png/revision/latest/scale-to-width-down/162?cb=20221116205932	Compressed Metal Mallet
6	278	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/88/Fists_of_the_Constellations.png/revision/latest/scale-to-width-down/162?cb=20210305171232	Fists of the Constellations
14	278	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/04/Pillar_of_the_Heavens.png/revision/latest/scale-to-width-down/162?cb=20210329184801	Pillar of the Heavens
6	279	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/50/Humble_Hands.png/revision/latest/scale-to-width-down/162?cb=20210305171324	Humble Hands
14	279	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/94/Jade_Truth.png/revision/latest/scale-to-width-down/162?cb=20210329183939	Jade Truth
6	280	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0a/Riddle_of_Strength.png/revision/latest/scale-to-width-down/162?cb=20210305171403	Riddle of Strength
14	280	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1e/Iron_Might.png/revision/latest/scale-to-width-down/162?cb=20210329183915	Iron Might
6	281	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/08/Hands_of_the_Cosmos.png/revision/latest/scale-to-width-down/162?cb=20210305172128	Hands of the Cosmos
14	281	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/71/Light_of_Truth.png/revision/latest/scale-to-width-down/162?cb=20210329184146	Light of Truth
6	282	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/Mudras.png/revision/latest/scale-to-width-down/162?cb=20210305172226	Mudras
14	282	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e8/Truth.png/revision/latest/scale-to-width-down/162?cb=20210329190014	Truth
6	283	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/50/Hands_of_Fate.png/revision/latest/scale-to-width-down/162?cb=20210305172302	Hands of Fate
14	283	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/97/Final_Wish.png/revision/latest/scale-to-width-down/162?cb=20210329183606	Final Wish
6	284	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ec/Paci-fists.png/revision/latest/scale-to-width-down/162?cb=20210305172506	Paci-fists
14	284	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b8/Poison_Dart.png/revision/latest/scale-to-width-down/162?cb=20210329185005	Poison Dart
6	285	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f6/Fisticuffs.png/revision/latest/scale-to-width-down/162?cb=20210305172534	Fisticuffs
14	285	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4d/Parasol_Pike.png/revision/latest/scale-to-width-down/162?cb=20210329184706	Parasol Pike
6	286	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bc/Holly_Jolly.png/revision/latest/scale-to-width-down/162?cb=20210305172601	Holly Jolly
14	286	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/13/Candy_Cane.png/revision/latest/scale-to-width-down/162?cb=20210329183317	Candy Cane
6	287	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ac/Hand_Wraps.png/revision/latest/scale-to-width-down/162?cb=20210324203755	Hand Wraps
14	287	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5d/Bamboo_Staff.png/revision/latest/scale-to-width-down/162?cb=20210324203823	Bamboo Staff
6	288	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bb/Sparring_Gloves.png/revision/latest/scale-to-width-down/162?cb=20211122212359	Sparring Gloves
14	288	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/97/Martial_Staff.png/revision/latest/scale-to-width-down/162?cb=20211122212359	Martial Staff
6	289	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cf/Earth_Gauntlets.png/revision/latest/scale-to-width-down/162?cb=20221116205935	Earth Gauntlets
14	289	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a7/Airbender_Staff.png/revision/latest/scale-to-width-down/162?cb=20221116205930	Airbender Staff
6	290	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6c/Automatons.png/revision/latest/scale-to-width-down/162?cb=20210305172939	Automatons
11	290	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e1/Curved_Beam.png/revision/latest/scale-to-width-down/162?cb=20210309080144	Curved Beam
6	291	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2c/Deadly_Shoku.png/revision/latest/scale-to-width-down/162?cb=20210305173008	Deadly Shoku
11	291	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d0/Whispering_Blade.png/revision/latest/scale-to-width-down/162?cb=20210309080303	Whispering Blade
6	292	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c7/Dead_or_Alive.png/revision/latest/scale-to-width-down/162?cb=20210305173045	Dead or Alive
11	292	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/de/Just_Dead.png/revision/latest/scale-to-width-down/162?cb=20210309080633	Just Dead
6	293	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f1/Dragonheart_Gauntlets.png/revision/latest/scale-to-width-down/162?cb=20210305173111	Dragonheart Gauntlets
11	293	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ec/Wyrmseeker.png/revision/latest/scale-to-width-down/162?cb=20210309080719	Wyrmseeker
6	294	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ca/Special_Forces.png/revision/latest/scale-to-width-down/162?cb=20210305173142	Special Forces
11	294	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/73/Tactical_Edge.png/revision/latest/scale-to-width-down/162?cb=20210309080815	Tactical Edge
6	295	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a1/Wooden_Knuckles.png/revision/latest/scale-to-width-down/162?cb=20210305173206	Wooden Knuckles
11	295	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7d/Hussar%27s_Prize.png/revision/latest/scale-to-width-down/162?cb=20210309080910	Hussar's Prize
6	296	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/18/Echidna.png/revision/latest/scale-to-width-down/162?cb=20210305173230	Echidna
11	296	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ae/Typhon.png/revision/latest/scale-to-width-down/162?cb=20210309080957	Typhon
6	297	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a6/Sinister_Strike.png/revision/latest/scale-to-width-down/162?cb=20210305173259	Sinister Strike
11	297	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f3/Betrayal.png/revision/latest/scale-to-width-down/162?cb=20210309081042	Betrayal
6	298	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/db/Steven%27s_Shields.png/revision/latest/scale-to-width-down/162?cb=20200518221318	Steven's Shields
11	298	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8a/Connie%27s_Sword.png/revision/latest/scale-to-width-down/162?cb=20200518221317	Connie's Sword
6	299	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2f/The_Playback.png/revision/latest/scale-to-width-down/162?cb=20210305173354	The Playback
11	299	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d7/Bitrate_Blade.png/revision/latest/scale-to-width-down/162?cb=20210309081218	Bitrate Blade
6	300	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/83/Pizza_Punchers.png/revision/latest/scale-to-width-down/162?cb=20210616181635	Pizza Punchers
11	300	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7d/Nunchaku.png/revision/latest/scale-to-width-down/162?cb=20210616181718	Nunchaku
6	301	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/db/Raging_Fists.png/revision/latest/scale-to-width-down/162?cb=20211122212359	Raging Fists
11	301	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/03/Messatsu_Blade.png/revision/latest/scale-to-width-down/162?cb=20211122212359	Messatsu Blade
6	302	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4d/Bug_Fixers.png/revision/latest/scale-to-width-down/162?cb=20230131035830	Bug Fixers
11	302	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/96/Heart_Flutter.png/revision/latest/scale-to-width-down/162?cb=20230131035829	Heart Flutter
9	303	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7a/Burning_Golden_Razors.png/revision/latest/scale-to-width-down/162?cb=20210330205817	Burning Golden Razors
8	303	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2c/Hyper_Turbo_Axe.png/revision/latest/scale-to-width-down/162?cb=20210326062925	Hyper Turbo Axe
9	304	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cf/Judge_and_Jury.png/revision/latest/scale-to-width-down/162?cb=20210330212128	Judge and Jury
8	304	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/77/Arbiters_Reach.png/revision/latest/scale-to-width-down/162?cb=20210326063100	Arbiters Reach
9	305	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ca/Smoldering_Skewers.png/revision/latest/scale-to-width-down/162?cb=20210330212710	Smoldering Skewers
8	305	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b5/Boiling_Point.png/revision/latest/scale-to-width-down/162?cb=20210326063139	Boiling Point
9	306	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ac/Hidden_Blades.png/revision/latest/scale-to-width-down/162?cb=20210330211712	Hidden Blades
8	306	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dc/The_Oath.png/revision/latest/scale-to-width-down/162?cb=20210326063207	The Oath
9	307	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/73/Trench_Cutters.png/revision/latest/scale-to-width-down/162?cb=20210330213941	Trench Cutters
8	307	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fe/The_Abyss.png/revision/latest/scale-to-width-down/162?cb=20210326063239	The Abyss
9	308	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/Teeth_of_the_Nile.png/revision/latest/scale-to-width-down/162?cb=20210330213641	Teeth of the Nile
8	308	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4e/Soul_Render.png/revision/latest/scale-to-width-down/162?cb=20210326063309	Soul Render
9	309	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/53/Flint_and_Tinder.png/revision/latest/scale-to-width-down/162?cb=20210330211012	Flint and Tinder
8	309	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/68/Hunter%27s_Reach.png/revision/latest/scale-to-width-down/162?cb=20210326063347	Hunter's Reach
9	310	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/79/Greed_and_Avarice.png/revision/latest/scale-to-width-down/162?cb=20210330211527	Greed and Avarice
8	310	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1d/Gilded_Glory_%28Axe%29.png/revision/latest/scale-to-width-down/162?cb=20201223021451	Gilded Glory (Axe)
9	311	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ef/Flame_and_Cinder.png/revision/latest/scale-to-width-down/162?cb=20210330210857	Flame and Cinder
8	311	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/10/Flashfire.png/revision/latest/scale-to-width-down/162?cb=20210326063421	Flashfire
9	312	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fc/Sonar_Slicers.png/revision/latest/scale-to-width-down/162?cb=20210330200031	Sonar Slicers
8	312	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d6/The_Monster_Slash.png/revision/latest/scale-to-width-down/162?cb=20191103171153	The Monster Slash
9	313	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f8/Crystal_Blades.png/revision/latest/scale-to-width-down/162?cb=20210330210226	Crystal Blades
8	313	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6b/Permafrost.png/revision/latest/scale-to-width-down/162?cb=20210326063455	Permafrost
9	314	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/10/Twin_Sai.png/revision/latest/scale-to-width-down/162?cb=20210616180928	Twin Sai
8	314	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/43/Turtle_Crossing.png/revision/latest/scale-to-width-down/162?cb=20210616181005	Turtle Crossing
9	315	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1e/Flora_Blades.png/revision/latest/scale-to-width-down/162?cb=20220622211653	Flora Blades
8	315	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/60/Axe_of_Regrowth.png/revision/latest/scale-to-width-down/162?cb=20220622211651	Axe of Regrowth
12	316	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/26/Chicago_Typewriters.png/revision/latest/scale-to-width-down/162?cb=20210329174225	Chicago Typewriters
6	316	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8d/Brass_Knuckles.png/revision/latest/scale-to-width-down/162?cb=20210305175527	Brass Knuckles
12	317	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/90/Fire_%26_Brimstone.png/revision/latest/scale-to-width-down/162?cb=20210329175143	Fire & Brimstone
6	317	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/de/Idle_Hands.png/revision/latest/scale-to-width-down/162?cb=20210305175611	Idle Hands
12	318	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7b/Standard_Issue.png/revision/latest/scale-to-width-down/162?cb=20210329175755	Standard Issue
6	318	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ec/The_Claymores.png/revision/latest/scale-to-width-down/162?cb=20210305175638	The Claymores
12	319	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4e/The_Hunters.png/revision/latest/scale-to-width-down/162?cb=20210329175924	The Hunters
6	319	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d0/Binding_Chains.png/revision/latest/scale-to-width-down/162?cb=20210305175708	Binding Chains
12	320	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/48/Six_of_a_Kind.png/revision/latest/scale-to-width-down/162?cb=20210329175737	Six of a Kind
6	320	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/98/Pocket_Aces.png/revision/latest/scale-to-width-down/162?cb=20210305175738	Pocket Aces
12	321	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/58/Devil%27s_Sight.png/revision/latest/scale-to-width-down/162?cb=20210329174532	Devil's Sight
6	321	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a0/Flames_of_the_Furnace.png/revision/latest/scale-to-width-down/162?cb=20210305175807	Flames of the Furnace
12	322	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/31/Aqua_Blasters.png/revision/latest/scale-to-width-down/162?cb=20210211195358	Aqua Blasters
6	322	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/91/H2-KO.png/revision/latest/scale-to-width-down/162?cb=20210304085807	H2-KO
12	323	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5c/No_Contest.png/revision/latest/scale-to-width-down/162?cb=20210329175427	No Contest
6	323	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/94/Ground_%26_Pound.png/revision/latest/scale-to-width-down/162?cb=20210305175833	Ground & Pound
12	324	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3d/Glimpse_of_Death.png/revision/latest/scale-to-width-down/162?cb=20210329175215	Glimpse of Death
6	324	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/ff/Devil%27s_Maw.png/revision/latest/scale-to-width-down/162?cb=20210305175903	Devil's Maw
12	325	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/72/Samaritans.png/revision/latest/scale-to-width-down/162?cb=20210329180620	Samaritans
6	325	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/03/Apocalypse_Hands.png/revision/latest/scale-to-width-down/162?cb=20210305175938	Apocalypse Hands
12	326	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/ba/Sacred_Orders.png/revision/latest/scale-to-width-down/162?cb=20210812220443	Sacred Orders
6	326	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/46/Pledge_%26_Pride.png/revision/latest/scale-to-width-down/162?cb=20210812220456	Pledge & Pride
12	327	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ac/Special_Forces_Pistols.png/revision/latest/scale-to-width-down/162?cb=20220525190655	Special Forces Pistols
6	327	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a9/Flashing_Knuckles.png/revision/latest/scale-to-width-down/162?cb=20220525190657	Flashing Knuckles
5	328	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5d/Eye_of_Horus.png/revision/latest/scale-to-width-down/162?cb=20210226181958	Eye of Horus
14	328	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6f/The_Seeker%27s_Spear.png/revision/latest/scale-to-width-down/162?cb=20210401003934	The Seeker's Spear
5	329	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d3/Scarabs%27_Bane.png/revision/latest/scale-to-width-down/162?cb=20210227010735	Scarabs' Bane
14	329	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b5/Spear_of_the_Living.png/revision/latest/scale-to-width-down/162?cb=20210227010906	Spear of the Living
5	330	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a5/The_Closer.png/revision/latest/scale-to-width-down/162?cb=20210226183323	The Closer
14	330	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ee/Precision.png/revision/latest/scale-to-width-down/162?cb=20210227011148	Precision
5	331	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ce/Uraeus%27_Fang.png/revision/latest/scale-to-width-down/162?cb=20200315014813	Uraeus' Fang
14	331	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/db/Tines_of_the_Heart.png/revision/latest/scale-to-width-down/162?cb=20200315014819	Tines of the Heart
5	332	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/60/Leash_of_Souls.png/revision/latest/scale-to-width-down/162?cb=20210226182610	Leash of Souls
14	332	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b0/Judgement.png/revision/latest/scale-to-width-down/162?cb=20210227011500	Judgement
5	333	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/54/Razor%27s_Reach.png/revision/latest/scale-to-width-down/162?cb=20210226182902	Razor's Reach
14	333	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/49/Winged_Glory.png/revision/latest/scale-to-width-down/162?cb=20210227011628	Winged Glory
5	335	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/81/Haunted_Hook.png/revision/latest/scale-to-width-down/162?cb=20210226182425	Haunted Hook
14	335	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1c/Specter_Spear.png/revision/latest/scale-to-width-down/162?cb=20210227011805	Specter Spear
5	336	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1f/Marks_the_Spot.png/revision/latest/scale-to-width-down/162?cb=20210226182717	Marks the Spot
14	336	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/06/Mizzenmast.png/revision/latest/scale-to-width-down/162?cb=20210329184430	Mizzenmast
5	337	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/98/In_Sickness.png/revision/latest/scale-to-width-down/162?cb=20210308213814	In Sickness
14	337	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d5/In_Health.png/revision/latest/scale-to-width-down/162?cb=20210308213703	In Health
5	338	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/45/Scrapped_M.O.U.S.E.R..png/revision/latest/scale-to-width-down/162?cb=20210616180821	Scrapped M.O.U.S.E.R.
14	338	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/32/Bo_Staff.png/revision/latest/scale-to-width-down/162?cb=20210616180650	Bo Staff
5	339	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/65/Ultra_Oil_Lamp.png/revision/latest/scale-to-width-down/162?cb=20230810055346	Ultra Oil Lamp
14	339	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d4/Quill_of_Thoth.png/revision/latest/scale-to-width-down/162?cb=20230810055341	Quill of Thoth
5	340	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/21/Nevermore.png/revision/latest/scale-to-width-down/162?cb=20210211022004	Nevermore
12	340	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5a/Murder_of_Crows.png/revision/latest/scale-to-width-down/162?cb=20210211022233	Murder of Crows
5	341	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ac/Lockpick.png/revision/latest/scale-to-width-down/162?cb=20210211024647	Lockpick
12	341	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b2/Flight_Risks.png/revision/latest/scale-to-width-down/162?cb=20210211024945	Flight Risks
5	342	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/29/Reaping_Time.png/revision/latest/scale-to-width-down/162?cb=20210211030617	Reaping Time
12	342	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f9/Birdshot.png/revision/latest/scale-to-width-down/162?cb=20210211030733	Birdshot
5	343	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e1/Sharkbite.png/revision/latest/scale-to-width-down/162?cb=20210211030955	Sharkbite
12	343	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3b/Signal_Flares.png/revision/latest/scale-to-width-down/162?cb=20210211031140	Signal Flares
5	344	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fd/The_Signature.png/revision/latest/scale-to-width-down/162?cb=20210211031552	The Signature
12	344	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ad/Zip_and_Snap.png/revision/latest/scale-to-width-down/162?cb=20210211031708	Zip and Snap
5	345	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3c/Fusion_Blade.png/revision/latest/scale-to-width-down/162?cb=20210211031903	Fusion Blade
12	345	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/48/Raycasters.png/revision/latest/scale-to-width-down/162?cb=20210211032103	Raycasters
5	346	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f8/Scythe_of_Torment.png/revision/latest/scale-to-width-down/162?cb=20210211032320	Scythe of Torment
12	346	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f5/Soul_Blasters.png/revision/latest/scale-to-width-down/162?cb=20210211032420	Soul Blasters
5	347	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/eb/Hotline_Slash.png/revision/latest/scale-to-width-down/162?cb=20210226182540	Hotline Slash
12	347	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5e/Ripple_and_Wave.png/revision/latest/scale-to-width-down/162?cb=20210329175528	Ripple and Wave
5	348	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ce/Ice_Pick.png/revision/latest/scale-to-width-down/162?cb=20211215153813	Ice Pick
12	348	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/10/Snow_Shooters.png/revision/latest/scale-to-width-down/162?cb=20211215153830	Snow Shooters
5	349	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/17/Last_Bite.png/revision/latest/scale-to-width-down/162?cb=20221019170220	Last Bite
12	349	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/14/Glitz_%26_Glam.png/revision/latest/scale-to-width-down/162?cb=20221019170210	Glitz & Glam
5	350	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/ff/Frost_Fang.png/revision/latest/scale-to-width-down/162?cb=20210226182125	Frost Fang
6	350	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8e/Winter%27s_Grasp.png/revision/latest/scale-to-width-down/162?cb=20210305180400	Winter's Grasp
5	351	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/88/Gloryhound.png/revision/latest/scale-to-width-down/162?cb=20210226182223	Gloryhound
6	351	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/60/Dogs_of_War.png/revision/latest/scale-to-width-down/162?cb=20210305180433	Dogs of War
5	352	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/94/Golden_Light.png/revision/latest/scale-to-width-down/162?cb=20210226182355	Golden Light
6	352	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/52/Divine_Hands.png/revision/latest/scale-to-width-down/162?cb=20210305180505	Divine Hands
5	353	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cb/Tropic_Breeze.png/revision/latest/scale-to-width-down/162?cb=20210211194824	Tropic Breeze
6	353	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f7/Coco-knuckles.png/revision/latest/scale-to-width-down/162?cb=20210305180121	Coco-knuckles
5	354	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d8/Fettered_Rage.png/revision/latest/scale-to-width-down/162?cb=20210226182025	Fettered Rage
6	354	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/38/God_Tyr.png/revision/latest/scale-to-width-down/162?cb=20210305180532	God Tyr
5	355	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/54/Scavenger%27s_Spoils.png/revision/latest/scale-to-width-down/162?cb=20210226183052	Scavenger's Spoils
6	355	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dc/Rib_Ticklers.png/revision/latest/scale-to-width-down/162?cb=20210305180600	Rib Ticklers
5	356	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8c/Amplitude.png/revision/latest/scale-to-width-down/162?cb=20210226181629	Amplitude
6	356	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/64/Treble_Makers.png/revision/latest/scale-to-width-down/162?cb=20210305180624	Treble Makers
5	357	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1b/Lethal_Edge.png/revision/latest/scale-to-width-down/162?cb=20210226182638	Lethal Edge
6	357	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7c/Jaguar_Claws.png/revision/latest/scale-to-width-down/162?cb=20210305180652	Jaguar Claws
5	358	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1a/Climbing_Gear.png/revision/latest/scale-to-width-down/162?cb=20210226181752	Climbing Gear
6	358	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/87/Wipeouts.png/revision/latest/scale-to-width-down/162?cb=20210305180723	Wipeouts
5	359	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/69/Chi_Stopper.png/revision/latest/scale-to-width-down/162?cb=20210324203628	Chi Stopper
6	359	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ea/Chorh-Gom_Cuffs.png/revision/latest/scale-to-width-down/162?cb=20210324203722	Chorh-Gom Cuffs
5	360	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7e/Blood_Moon_Influence_Level_3.png/revision/latest/scale-to-width-down/162?cb=20210813201435	Blood Moon Influence Level 3
6	360	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ea/Betrayal_%26_Power_Level_3.png/revision/latest/scale-to-width-down/162?cb=20210813201358	Betrayal & Power Level 3
5	361	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e2/Yard_Marker.png/revision/latest/scale-to-width-down/162?cb=20220728160003	Yard Marker
6	361	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d7/Footbrawlers.png/revision/latest/scale-to-width-down/162?cb=20220728155713	Footbrawlers
5	362	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1b/Chaos_Harvester.png/revision/latest/scale-to-width-down/162?cb=20230810055317	Chaos Harvester
6	362	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4f/Collision_Rocket_Fists.png/revision/latest/scale-to-width-down/162?cb=20230810055321	Collision Rocket Fists
7	363	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/84/Shibuya_Recurve.png/revision/latest/scale-to-width-down/162?cb=20210309212333	Shibuya Recurve
10	363	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c5/Dragon_Sledge.png/revision/latest/scale-to-width-down/162?cb=20210324220858	Dragon Sledge
7	364	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/84/Pew_Pew.png/revision/latest/scale-to-width-down/162?cb=20210309212359	Pew Pew
10	364	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8a/Bop.png/revision/latest/scale-to-width-down/162?cb=20210324220923	Bop
7	365	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/44/Bane_Bringer.png/revision/latest/scale-to-width-down/162?cb=20210309212423	Bane Bringer
10	365	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/27/Yokai_Smash.png/revision/latest/scale-to-width-down/162?cb=20210324220953	Yokai Smash
7	366	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/50/Twin_Tails.png/revision/latest/scale-to-width-down/162?cb=20210309212449	Twin Tails
10	366	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/05/The_Shrine.png/revision/latest/scale-to-width-down/162?cb=20210324221025	The Shrine
7	367	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c5/Ded.png/revision/latest/scale-to-width-down/162?cb=20191103171103	Ded
10	367	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/14/LOL_RIP.png/revision/latest/scale-to-width-down/162?cb=20191103171103	LOL RIP
7	368	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5e/Sakura_Strike.png/revision/latest/scale-to-width-down/162?cb=20210309212520	Sakura Strike
10	368	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/eb/Gatekeeper.png/revision/latest/scale-to-width-down/162?cb=20210324221059	Gatekeeper
7	369	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/af/Brooch_Bow.png/revision/latest/scale-to-width-down/162?cb=20210309212543	Brooch Bow
10	369	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/76/Heirloom_%28Hammer%29.png/revision/latest/scale-to-width-down/162?cb=20201222074017	Heirloom (Hammer)
7	370	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/34/Voice_of_the_Snow.png/revision/latest/scale-to-width-down/162?cb=20210309212606	Voice of the Snow
10	370	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b2/Glacier_Gavel.png/revision/latest/scale-to-width-down/162?cb=20210324221131	Glacier Gavel
7	371	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/76/Interface.png/revision/latest/scale-to-width-down/162?cb=20210309212634	Interface
10	371	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4c/Bass_Drop.png/revision/latest/scale-to-width-down/162?cb=20210324221200	Bass Drop
7	372	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c3/Elm_Recurve_Bow.png/revision/latest/scale-to-width-down/162?cb=20220119232809	Elm Recurve Bow
10	372	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e8/Heart_of_Gold.png/revision/latest/scale-to-width-down/162?cb=20220119232809	Heart of Gold
7	373	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a2/Twilight%27s_Emissary.png/revision/latest/scale-to-width-down/162?cb=20230518211615	Twilight's Emissary
10	373	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f8/Soul_of_Aoku.png/revision/latest/scale-to-width-down/162?cb=20230518211613	Soul of Aoku
13	374	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/48/Darkpulse.png/revision/latest/scale-to-width-down/162?cb=20210308193613	Darkpulse
5	374	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5d/Heartbleed.png/revision/latest/scale-to-width-down/162?cb=20210226182502	Heartbleed
13	375	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6f/The_Broken_Forge.png/revision/latest/scale-to-width-down/162?cb=20210308193656	The Broken Forge
5	375	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/44/Searing_Blade.png/revision/latest/scale-to-width-down/162?cb=20210226183126	Searing Blade
13	376	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/56/Blackstar.png/revision/latest/scale-to-width-down/162?cb=20210308193738	Blackstar
5	376	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/94/Penumbral_Crescent.png/revision/latest/scale-to-width-down/162?cb=20210226182827	Penumbral Crescent
13	377	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/11/Prophecy.png/revision/latest/scale-to-width-down/162?cb=20210308193825	Prophecy
5	377	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/38/Eternity.png/revision/latest/scale-to-width-down/162?cb=20210226181932	Eternity
13	378	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fb/Burnout.png/revision/latest/scale-to-width-down/162?cb=20210308193941	Burnout
5	378	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/63/Throttle.png/revision/latest/scale-to-width-down/162?cb=20210226183343	Throttle
13	379	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/64/Fearful_Frost.png/revision/latest/scale-to-width-down/162?cb=20210308194026	Fearful Frost
5	379	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ea/Winter%27s_Grave.png/revision/latest/scale-to-width-down/162?cb=20210226183405	Winter's Grave
13	380	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/67/Prizewinner.png/revision/latest/scale-to-width-down/162?cb=20210308194129	Prizewinner
5	380	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/87/Goalie_Stick.png/revision/latest/scale-to-width-down/162?cb=20210226182252	Goalie Stick
13	381	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5d/Horn_of_the_Scarab.png/revision/latest/scale-to-width-down/162?cb=20210308194206	Horn of the Scarab
5	381	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/57/Fiendish_Slice.png/revision/latest/scale-to-width-down/162?cb=20210226182054	Fiendish Slice
13	382	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a6/Dirt_Road_Drill.png/revision/latest/scale-to-width-down/162?cb=20211013235558	Dirt Road Drill
5	382	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a3/Adrenaline_Rush.png/revision/latest/scale-to-width-down/162?cb=20211013235608	Adrenaline Rush
13	383	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/be/Quasar_Level_3.png/revision/latest/scale-to-width-down/162?cb=20220119232809	Quasar Level 3
5	383	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/70/Cygnus_Level_3.png/revision/latest/scale-to-width-down/162?cb=20220119232809	Cygnus Level 3
6	384	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2d/Gauntlets_of_Dexterity.png/revision/latest/scale-to-width-down/162?cb=20210305180844	Gauntlets of Dexterity
9	384	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1e/%2B5_Daggers.png/revision/latest/scale-to-width-down/162?cb=20210330200135	+5 Daggers
6	385	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f4/Boomers.png/revision/latest/scale-to-width-down/162?cb=20210305180927	Boomers
9	385	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ad/Chompers.png/revision/latest/scale-to-width-down/162?cb=20210330200239	Chompers
6	386	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c9/The_Taggers.png/revision/latest/scale-to-width-down/162?cb=20210305181414	The Taggers
9	386	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f3/Finishing_Touches.png/revision/latest/scale-to-width-down/162?cb=20210330200332	Finishing Touches
6	387	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b7/Vampiric_Embrace.png/revision/latest/scale-to-width-down/162?cb=20210330205130	Vampiric Embrace
9	387	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/ff/Bloodletting.png/revision/latest/scale-to-width-down/162?cb=20210330200423	Bloodletting
6	388	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5b/Nothing_Up_My_Sleeve.png/revision/latest/scale-to-width-down/162?cb=20210305181532	Nothing Up My Sleeve
9	388	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/13/Deadly_Diamonds.png/revision/latest/scale-to-width-down/162?cb=20210330200532	Deadly Diamonds
6	389	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d9/The_Punchlines.png/revision/latest/scale-to-width-down/162?cb=20210305181623	The Punchlines
9	389	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/88/Grand_Finale.png/revision/latest/scale-to-width-down/162?cb=20210330200649	Grand Finale
6	390	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9c/Apothecary_Mitts.png/revision/latest/scale-to-width-down/162?cb=20210305184122	Apothecary Mitts
9	390	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/34/Exploding_Blades.png/revision/latest/scale-to-width-down/162?cb=20210330200737	Exploding Blades
6	391	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9e/Diamond_Fists.png/revision/latest/scale-to-width-down/162?cb=20210205033008	Diamond Fists
9	391	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/93/Crystal_Shards.png/revision/latest/scale-to-width-down/162?cb=20210330200843	Crystal Shards
6	392	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9a/Frosty_Revenge.png/revision/latest/scale-to-width-down/162?cb=20221215130656	Frosty Revenge
9	392	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/34/Saint_Nicks.png/revision/latest/scale-to-width-down/162?cb=20221215130658	Saint Nicks
4	393	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9b/The_Nautilus.png/revision/latest/scale-to-width-down/162?cb=20210228072733	The Nautilus
11	393	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/18/Waveslicer.png/revision/latest/scale-to-width-down/162?cb=20210309081405	Waveslicer
4	394	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1a/Royal_Decree.png/revision/latest/scale-to-width-down/162?cb=20210228072831	Royal Decree
11	394	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/00/Crimson_Cutlass.png/revision/latest/scale-to-width-down/162?cb=20210309081441	Crimson Cutlass
4	395	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cf/Watery_Grave.png/revision/latest/scale-to-width-down/162?cb=20210228072919	Watery Grave
11	395	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/46/Saltwater_Saber.png/revision/latest/scale-to-width-down/162?cb=20210309081505	Saltwater Saber
4	396	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7a/Boom_Box.png/revision/latest/scale-to-width-down/162?cb=20210228073007	Boom Box
11	396	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/96/Babe.png/revision/latest/scale-to-width-down/162?cb=20210309081549	Babe
4	397	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7e/Conk_Shell.png/revision/latest/scale-to-width-down/162?cb=20210228073051	Conk Shell
11	397	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f2/Hippokampos.png/revision/latest/scale-to-width-down/162?cb=20210309081659	Hippokampos
4	398	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/88/Revolver_Cannon.png/revision/latest/scale-to-width-down/162?cb=20210228073132	Revolver Cannon
11	398	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cf/Pressure_Slicer.png/revision/latest/scale-to-width-down/162?cb=20210309081736	Pressure Slicer
4	399	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ab/Ensnaring_Boom.png/revision/latest/scale-to-width-down/162?cb=20230126041335	Ensnaring Boom
11	399	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/26/Kukri_Carver.png/revision/latest/scale-to-width-down/162?cb=20230126041335	Kukri Carver
4	400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3a/Fuel_Rod_Cannon.png/revision/latest/scale-to-width-down/162?cb=20230712200730	Fuel Rod Cannon
11	400	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/96/Energy_Sword.png/revision/latest/scale-to-width-down/162?cb=20230712200728	Energy Sword
4	401	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c7/Kanabo.png/revision/latest/scale-to-width-down/162?cb=20210228073220	Kanabo
8	401	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bd/Kakurenbo.png/revision/latest/scale-to-width-down/162?cb=20210326063810	Kakurenbo
4	402	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3e/Booming_Roar.png/revision/latest/scale-to-width-down/162?cb=20210228073305	Booming Roar
8	402	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ed/Polar_Poleax.png/revision/latest/scale-to-width-down/162?cb=20210326063839	Polar Poleax
4	403	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/82/Bulwark.png/revision/latest/scale-to-width-down/162?cb=20210228073344	Bulwark
8	403	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/43/Iron_Standard.png/revision/latest/scale-to-width-down/162?cb=20210326063911	Iron Standard
4	404	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/24/Mammothade_Cooler.png/revision/latest/scale-to-width-down/162?cb=20190910023225	Mammothade Cooler
8	404	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7b/First_Down.png/revision/latest/scale-to-width-down/162?cb=20210226081935	First Down
4	405	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/49/Laser_Light_Cannon.png/revision/latest/scale-to-width-down/162?cb=20210228073434	Laser Light Cannon
8	405	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5a/Crystal_Whip_Axe.png/revision/latest/scale-to-width-down/162?cb=20210326063947	Crystal Whip Axe
4	406	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dc/Boomin%27_Bark.png/revision/latest/scale-to-width-down/162?cb=20210414135520	Boomin' Bark
8	406	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a0/Spring_Cleaning.png/revision/latest/scale-to-width-down/162?cb=20210414135506	Spring Cleaning
4	407	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0b/Power_Flash.png/revision/latest/scale-to-width-down/162?cb=20230810055340	Power Flash
8	407	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e4/Electronicore_Axe.png/revision/latest/scale-to-width-down/162?cb=20230810055334	Electronicore Axe
14	408	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e6/Scrimshaw_Harpoon.png/revision/latest/scale-to-width-down/162?cb=20210329185637	Scrimshaw Harpoon
7	408	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bf/Antler_Strike.png/revision/latest/scale-to-width-down/162?cb=20210309212844	Antler Strike
14	409	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1d/Tundra%27s_Talon.png/revision/latest/scale-to-width-down/162?cb=20210208164438	Tundra's Talon
7	409	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d5/Silent_Wings.png/revision/latest/scale-to-width-down/162?cb=20210208164529	Silent Wings
14	410	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9e/Guiding_Spirit.png/revision/latest/scale-to-width-down/162?cb=20210329183658	Guiding Spirit
7	410	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0e/Borealis_Bow.png/revision/latest/scale-to-width-down/162?cb=20210309212908	Borealis Bow
14	411	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/03/Warrior%27s_Wisdom.png/revision/latest/scale-to-width-down/162?cb=20210329190208	Warrior's Wisdom
7	411	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/be/Owl%27s_Flight.png/revision/latest/scale-to-width-down/162?cb=20210309212934	Owl's Flight
14	412	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/79/Crafts_Time.png/revision/latest/scale-to-width-down/162?cb=20180830025805	Crafts Time
7	412	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/91/Naptime.png/revision/latest/scale-to-width-down/162?cb=20180830025833	Naptime
14	413	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/08/Ski_Pole.png/revision/latest/scale-to-width-down/162?cb=20210329185759	Ski Pole
7	413	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/21/Alpine%27s_Ace.png/revision/latest/scale-to-width-down/162?cb=20210309213115	Alpine's Ace
14	414	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f1/Pearl%27s_Spear.png/revision/latest/scale-to-width-down/162?cb=20210329184734	Pearl's Spear
7	414	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/49/Opal%27s_Bow.png/revision/latest/scale-to-width-down/162?cb=20210309213005	Opal's Bow
14	415	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7c/Rosewood_Spear.png/revision/latest/scale-to-width-down/162?cb=20210212203808	Rosewood Spear
7	415	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4c/Everlasting_Shot.png/revision/latest/scale-to-width-down/162?cb=20210212203824	Everlasting Shot
14	416	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/de/Holy_Covenant.png/revision/latest/scale-to-width-down/162?cb=20230126041335	Holy Covenant
7	416	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0b/Floral_Prayer.png/revision/latest/scale-to-width-down/162?cb=20230126041335	Floral Prayer
4	417	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b6/Door-Buster.png/revision/latest/scale-to-width-down/162?cb=20210228073653	Door-Buster
12	417	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b1/Protect_%26_Serve.png/revision/latest/scale-to-width-down/162?cb=20210329175445	Protect & Serve
4	418	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ab/Railgun.png/revision/latest/scale-to-width-down/162?cb=20210228073609	Railgun
12	418	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b7/The_Neutralizers.png/revision/latest/scale-to-width-down/162?cb=20210329175944	The Neutralizers
4	419	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c1/Tactical_Cannon.png/revision/latest/scale-to-width-down/162?cb=20210228073530	Tactical Cannon
12	419	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/43/Close_Quarters.png/revision/latest/scale-to-width-down/162?cb=20210329174247	Close Quarters
4	420	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0f/Art_of_War.png/revision/latest/scale-to-width-down/162?cb=20210228073823	Art of War
12	420	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bf/Commander_and_Chief.png/revision/latest/scale-to-width-down/162?cb=20210329174304	Commander and Chief
4	421	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b5/Grilled_Smoker.png/revision/latest/scale-to-width-down/162?cb=20210211200329	Grilled Smoker
12	421	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9b/Ketchup_%26_Mustard.png/revision/latest/scale-to-width-down/162?cb=20210211200341	Ketchup & Mustard
4	422	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cd/Electro_Overdrive.png/revision/latest/scale-to-width-down/162?cb=20210228073915	Electro Overdrive
12	422	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/96/Equalizer.png/revision/latest/scale-to-width-down/162?cb=20210329175026	Equalizer
4	423	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/00/Beithir%27s_Breath.png/revision/latest/scale-to-width-down/162?cb=20220316180207	Beithir's Breath
12	423	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ad/Wurm_Shooters.png/revision/latest/scale-to-width-down/162?cb=20220316180003	Wurm Shooters
4	424	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e8/SPNKr_Rocket_Launcher.png/revision/latest/scale-to-width-down/162?cb=20230712200445	SPNKr Rocket Launcher
12	424	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6b/Magnum_Pistols.png/revision/latest/scale-to-width-down/162?cb=20230712200443	Magnum Pistols
11	425	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/The_Mark.png/revision/latest/scale-to-width-down/162?cb=20210309081927	The Mark
5	425	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/17/Calling_Card.png/revision/latest/scale-to-width-down/162?cb=20210226181656	Calling Card
11	426	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/80/Duskblade.png/revision/latest/scale-to-width-down/162?cb=20210309082030	Duskblade
5	426	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/50/Death_Touch.png/revision/latest/scale-to-width-down/162?cb=20210226181901	Death Touch
11	427	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/96/Dynasty_Ender.png/revision/latest/scale-to-width-down/162?cb=20210208170840	Dynasty Ender
5	427	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/75/Oni_Bite.png/revision/latest/scale-to-width-down/162?cb=20210208170935	Oni Bite
11	428	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3b/Guardian%27s_Edge.png/revision/latest/scale-to-width-down/162?cb=20180817011309	Guardian's Edge
5	428	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ca/Tamed_Beast.png/revision/latest/scale-to-width-down/162?cb=20180817011312	Tamed Beast
11	429	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6a/Marrow.png/revision/latest/scale-to-width-down/162?cb=20210309082219	Marrow
5	429	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ae/Spinal_Sickle.png/revision/latest/scale-to-width-down/162?cb=20210226183242	Spinal Sickle
11	430	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a2/Demon%27s_Blade.png/revision/latest/scale-to-width-down/162?cb=20210330232100	Demon's Blade
5	430	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/09/Wraith%27s_Sickle.png/revision/latest/scale-to-width-down/162?cb=20210226183431	Wraith's Sickle
11	431	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4c/Twin_Katanas.png/revision/latest/scale-to-width-down/162?cb=20210616180513	Twin Katanas
5	431	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bf/Casey%27s_Hockey_Stick.png/revision/latest/scale-to-width-down/162?cb=20210616180604	Casey's Hockey Stick
11	432	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/be/Bokken.png/revision/latest/scale-to-width-down/162?cb=20220728155457	Bokken
5	432	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/15/Koinobori.png/revision/latest/scale-to-width-down/162?cb=20220728155809	Koinobori
9	433	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6e/Imperial_Seals.png/revision/latest/scale-to-width-down/162?cb=20210330212027	Imperial Seals
4	433	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/21/1000_Army_Cannon.png/revision/latest/scale-to-width-down/162?cb=20210228073958	1000 Army Cannon
9	434	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/10/Fire_Fangs.png/revision/latest/scale-to-width-down/162?cb=20210330210809	Fire Fangs
4	434	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/29/Torchbringer.png/revision/latest/scale-to-width-down/162?cb=20210228074114	Torchbringer
9	435	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/eb/Fatal_Fans.png/revision/latest/scale-to-width-down/162?cb=20210330210558	Fatal Fans
4	435	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/08/Divine_Thunderclap.png/revision/latest/scale-to-width-down/162?cb=20210228074203	Divine Thunderclap
9	436	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d1/Overhand_Slicers.png/revision/latest/scale-to-width-down/162?cb=20210330201057	Overhand Slicers
4	436	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/17/Locker_Boom.png/revision/latest/scale-to-width-down/162?cb=20190910023243	Locker Boom
9	437	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ce/Dragon%27s_Shine.png/revision/latest/scale-to-width-down/162?cb=20210519170519	Dragon's Shine
4	437	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a8/Modern_Thunder.png/revision/latest/scale-to-width-down/162?cb=20210519170613	Modern Thunder
9	438	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8a/Trusty_Trowels.png/revision/latest/scale-to-width-down/162?cb=20220413174942	Trusty Trowels
4	438	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c6/Koi_Cannon.png/revision/latest/scale-to-width-down/162?cb=20220413174943	Koi Cannon
9	439	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/46/Sakura_Strikers.png/revision/latest/scale-to-width-down/162?cb=20220525190657	Sakura Strikers
4	439	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/22/Blossom_Boom.png/revision/latest/scale-to-width-down/162?cb=20220525190658	Blossom Boom
6	440	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0c/Halo_Breakers.png/revision/latest/scale-to-width-down/162?cb=20210305185700	Halo Breakers
7	440	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/25/Despair.png/revision/latest/scale-to-width-down/162?cb=20210309213416	Despair
6	441	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e9/Rapture.png/revision/latest/scale-to-width-down/162?cb=20210305185830	Rapture
7	441	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2b/Heaven%27s_Order.png/revision/latest/scale-to-width-down/162?cb=20210309213445	Heaven's Order
6	442	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/24/Oath_of_Service.png/revision/latest/scale-to-width-down/162?cb=20210305190201	Oath of Service
7	442	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b7/Deus_Ex_Machina.png/revision/latest/scale-to-width-down/162?cb=20210309213510	Deus Ex Machina
6	443	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b3/Phantom_Fists.png/revision/latest/scale-to-width-down/162?cb=20210305185903	Phantom Fists
7	443	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fb/Soul_Seeker.png/revision/latest/scale-to-width-down/162?cb=20210309213538	Soul Seeker
6	444	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/db/Love%27s_Embrace.png/revision/latest/scale-to-width-down/162?cb=20210305185635	Love's Embrace
7	444	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4f/Heartstring.png/revision/latest/scale-to-width-down/162?cb=20200315014836	Heartstring
6	445	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6a/Darkest_Hour.png/revision/latest/scale-to-width-down/162?cb=20210305185936	Darkest Hour
7	445	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f2/Demonic_Wings.png/revision/latest/scale-to-width-down/162?cb=20210309213609	Demonic Wings
6	446	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/83/Disc_Beatdown.png/revision/latest/scale-to-width-down/162?cb=20210519170749	Disc Beatdown
7	446	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7a/Coastline_Pulse.png/revision/latest/scale-to-width-down/162?cb=20210519170700	Coastline Pulse
6	447	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ce/Psychlops.png/revision/latest/scale-to-width-down/162?cb=20210305173913	Psychlops
8	447	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ec/Devious_Axe.png/revision/latest/scale-to-width-down/162?cb=20210205214648	Devious Axe
6	448	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1a/Dueling_Dukes.png/revision/latest/scale-to-width-down/162?cb=20210305173812	Dueling Dukes
8	448	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f8/Winged_Blade.png/revision/latest/scale-to-width-down/162?cb=20210205215038	Winged Blade
6	449	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b0/Bear_Arms.png/revision/latest/scale-to-width-down/162?cb=20210305173717	Bear Arms
8	449	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8f/Viking%27s_War-axe.png/revision/latest/scale-to-width-down/162?cb=20210205215608	Viking's War-axe
6	450	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1d/Saints_%26_Souls.png/revision/latest/scale-to-width-down/162?cb=20211013235716	Saints & Souls
8	450	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/72/Calaveraxe.png/revision/latest/scale-to-width-down/162?cb=20211013235725	Calaveraxe
6	451	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/67/Yoga_Fists.png/revision/latest/scale-to-width-down/162?cb=20220525190657	Yoga Fists
8	451	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/71/Burning_Enlightenment.png/revision/latest/scale-to-width-down/162?cb=20220525190657	Burning Enlightenment
14	452	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/99/Talon%27s_Edge.png/revision/latest/scale-to-width-down/162?cb=20210205202150	Talon's Edge
3	452	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f7/Vial_of_Crows.png/revision/latest/scale-to-width-down/162?cb=20210205202228	Vial of Crows
14	453	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6d/Fangwild_Spine.png/revision/latest/scale-to-width-down/162?cb=20210205202408	Fangwild Spine
3	453	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c1/Jewel_of_the_Forest.png/revision/latest/scale-to-width-down/162?cb=20210205202447	Jewel of the Forest
14	454	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5f/Ambition.png/revision/latest/scale-to-width-down/162?cb=20210205202709	Ambition
3	454	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/03/Golden_Punishment.png/revision/latest/scale-to-width-down/162?cb=20210308213035	Golden Punishment
14	455	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1c/Crimson_Pike.png/revision/latest/scale-to-width-down/162?cb=20210205202932	Crimson Pike
3	455	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2e/Blood_Shard.png/revision/latest/scale-to-width-down/162?cb=20210205202941	Blood Shard
14	456	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cc/Immortal_Pike.png/revision/latest/scale-to-width-down/162?cb=20191103171105	Immortal Pike
3	456	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/46/Blood_Keepsake.png/revision/latest/scale-to-width-down/162?cb=20191103171106	Blood Keepsake
14	457	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/69/Crush_Killer.png/revision/latest/scale-to-width-down/162?cb=20210212204407	Crush Killer
3	457	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/26/Love_Sick.png/revision/latest/scale-to-width-down/162?cb=20210212204515	Love Sick
14	458	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/50/Amanita_Naginata.png/revision/latest/scale-to-width-down/162?cb=20220622155257	Amanita Naginata
3	458	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/32/Night_Blight.png/revision/latest/scale-to-width-down/162?cb=20220623023226	Night Blight
5	459	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/40/Constellation_Carver.png/revision/latest/scale-to-width-down/162?cb=20210226181827	Constellation Carver
3	459	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fb/Terra_Firma.png/revision/latest/scale-to-width-down/162?cb=20210226082320	Terra Firma
5	460	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9a/Laplace%27s_Demon.png/revision/latest/scale-to-width-down/162?cb=20210208171132	Laplace's Demon
3	460	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/64/The_Unblinking.png/revision/latest/scale-to-width-down/162?cb=20210308215651	The Unblinking
5	461	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e2/Cat_Scratch.png/revision/latest/scale-to-width-down/162?cb=20210226181721	Cat Scratch
3	461	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ee/Beatdown_Bell.png/revision/latest/scale-to-width-down/162?cb=20210226082518	Beatdown Bell
5	462	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ca/Into_the_Abyss.png/revision/latest/scale-to-width-down/162?cb=20210208171325	Into the Abyss
3	462	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/32/Remnant_of_Fate.png/revision/latest/scale-to-width-down/162?cb=20210208171403	Remnant of Fate
5	463	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/1b/Knowledge_is_Key.png/revision/latest/scale-to-width-down/162?cb=20190910023209	Knowledge is Key
3	463	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7a/Encyclopedia_of_Brawl.png/revision/latest/scale-to-width-down/162?cb=20190910023212	Encyclopedia of Brawl
5	464	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e6/Stargleam_Scythe.png/revision/latest/scale-to-width-down/162?cb=20210203035206	Stargleam Scythe
3	464	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ef/Moonlight_Meteor.png/revision/latest/scale-to-width-down/162?cb=20210203035537	Moonlight Meteor
5	465	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e3/Starship_Slice.png/revision/latest/scale-to-width-down/162?cb=20220119232810	Starship Slice
3	465	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e1/4LLY.png/revision/latest/scale-to-width-down/162?cb=20220119232808	4LLY
10	466	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/67/Soulbinder.png/revision/latest/scale-to-width-down/162?cb=20210324221405	Soulbinder
3	466	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ad/Death_Awaits.png/revision/latest/scale-to-width-down/162?cb=20210226082709	Death Awaits
10	467	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/90/Golden_Striker.png/revision/latest/scale-to-width-down/162?cb=20210324221446	Golden Striker
3	467	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4e/Lightning_Sigil.png/revision/latest/scale-to-width-down/162?cb=20210226082831	Lightning Sigil
10	468	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ee/Teeth-Grinder.png/revision/latest/scale-to-width-down/162?cb=20210324221509	Teeth-Grinder
3	468	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5c/Snarler.png/revision/latest/scale-to-width-down/162?cb=20210226082929	Snarler
10	469	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0b/Flamingo.png/revision/latest/scale-to-width-down/162?cb=20210211195850	Flamingo
3	469	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/48/Pi%C3%B1a_Collider.png/revision/latest/scale-to-width-down/162?cb=20210211195903	Piña Collider
10	470	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/64/The_Phenom.png/revision/latest/scale-to-width-down/162?cb=20191111225752	The Phenom
3	470	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b3/The_Last_Ride.png/revision/latest/scale-to-width-down/162?cb=20191111225759	The Last Ride
10	471	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/00/Guardian_Mallet.png/revision/latest/scale-to-width-down/162?cb=20210324221539	Guardian Mallet
3	471	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ce/Aesir%27s_Orb.png/revision/latest/scale-to-width-down/162?cb=20210226083039	Aesir's Orb
10	472	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/de/Shadaloo_Scepter.png/revision/latest/scale-to-width-down/162?cb=20220525190657	Shadaloo Scepter
3	472	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/92/Psycho_Power_Aura.png/revision/latest/scale-to-width-down/162?cb=20220525190658	Psycho Power Aura
6	473	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2b/Ctrl_%26_Delete.png/revision/latest/scale-to-width-down/162?cb=20210305195909	Ctrl & Delete
3	473	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/11/Home_Run.png/revision/latest/scale-to-width-down/162?cb=20210226083155	Home Run
6	474	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/bb/Gloom_%26_Doom.png/revision/latest/scale-to-width-down/162?cb=20210305195817	Gloom & Doom
3	474	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/05/Eternal_Nightfall.png/revision/latest/scale-to-width-down/162?cb=20210226083539	Eternal Nightfall
6	475	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0d/Primordial_Punch-Out.png/revision/latest/scale-to-width-down/162?cb=20210305195734	Primordial Punch-Out
3	475	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9b/Fossil_Fury.png/revision/latest/scale-to-width-down/162?cb=20210226083509	Fossil Fury
6	476	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/35/Horror_%26_Fright.png/revision/latest/scale-to-width-down/162?cb=20210330204939	Horror & Fright
3	476	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ee/Von_Evilstein%27s_Heart.png/revision/latest/scale-to-width-down/162?cb=20191103171107	Von Evilstein's Heart
6	477	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8d/Garnet%27s_Gauntlets.png/revision/latest/scale-to-width-down/162?cb=20210305195549	Garnet's Gauntlets
3	477	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ef/Reunited.png/revision/latest/scale-to-width-down/162?cb=20210226083702	Reunited
6	479	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/73/Wave_Breakers.png/revision/latest/scale-to-width-down/162?cb=20210519170822	Wave Breakers
3	479	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e3/Whitewater_Gem.png/revision/latest/scale-to-width-down/162?cb=20210519170859	Whitewater Gem
6	480	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7d/Furinkazan_Gloves.png/revision/latest/scale-to-width-down/162?cb=20211122212359	Furinkazan Gloves
3	480	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e1/Power_of_Will.png/revision/latest/scale-to-width-down/162?cb=20211122212358	Power of Will
6	481	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/05/Fighting_Spirit_Gloves.png/revision/latest/scale-to-width-down/162?cb=20220525190657	Fighting Spirit Gloves
3	481	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/34/Power_of_Courage.png/revision/latest/scale-to-width-down/162?cb=20220525190658	Power of Courage
6	482	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b4/Password_Crackers.png/revision/latest/scale-to-width-down/162?cb=20230810055340	Password Crackers
3	482	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a5/Shot_Caller.png/revision/latest/scale-to-width-down/162?cb=20230810055344	Shot Caller
13	483	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/18/Drake%27s_Battalion.png/revision/latest/scale-to-width-down/162?cb=20210308194525	Drake's Battalion
7	483	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/01/Hunter%27s_Tail.png/revision/latest/scale-to-width-down/162?cb=20210309213736	Hunter's Tail
13	484	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4b/Forerunner.png/revision/latest/scale-to-width-down/162?cb=20210308194550	Forerunner
7	484	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/98/Blueprint.png/revision/latest/scale-to-width-down/162?cb=20210309213802	Blueprint
13	485	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/53/Pole_Position.png/revision/latest/scale-to-width-down/162?cb=20210308194620	Pole Position
7	485	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/13/Grand_Prix.png/revision/latest/scale-to-width-down/162?cb=20210309213828	Grand Prix
13	486	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/ff/Sidewinder.png/revision/latest/scale-to-width-down/162?cb=20210211201018	Sidewinder
7	486	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/76/Skybound.png/revision/latest/scale-to-width-down/162?cb=20210308215035	Skybound
13	487	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3e/Cupid%27s_Arrow.png/revision/latest/scale-to-width-down/162?cb=20220119232809	Cupid's Arrow
7	487	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4f/Be_True.png/revision/latest/scale-to-width-down/162?cb=20220119232809	Be True
8	488	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3f/Splitter.png/revision/latest/scale-to-width-down/162?cb=20191220165501	Splitter
5	488	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8a/Thresher.png/revision/latest/scale-to-width-down/162?cb=20191220165451	Thresher
8	489	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a9/Terrorbyte.png/revision/latest/scale-to-width-down/162?cb=20191220165439	Terrorbyte
5	489	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7d/Scare-Ware.png/revision/latest/scale-to-width-down/162?cb=20191220165449	Scare-Ware
8	490	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/55/Final_Breath.png/revision/latest/scale-to-width-down/162?cb=20191220165500	Final Breath
5	490	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4d/Vanquisher.png/revision/latest/scale-to-width-down/162?cb=20191220165453	Vanquisher
8	491	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/ae/Love_Affair.png/revision/latest/scale-to-width-down/162?cb=20200315014827	Love Affair
5	491	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/da/Heartthrob.png/revision/latest/scale-to-width-down/162?cb=20200315014813	Heartthrob
8	492	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6e/Shredder.png/revision/latest/scale-to-width-down/162?cb=20200826222723	Shredder
5	492	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/80/Keytar_Slash.png/revision/latest/scale-to-width-down/162?cb=20200826222715	Keytar Slash
8	493	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4f/Eldritch_Bane.png/revision/latest/scale-to-width-down/162?cb=20230126041335	Eldritch Bane
5	493	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8e/Villain_Monologue.png/revision/latest/scale-to-width-down/162?cb=20230126041335	Villain Monologue
6	494	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3d/Spirit_Breakers.png/revision/latest/scale-to-width-down/162?cb=20210305193120	Spirit Breakers
4	494	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c8/Eternal_Siege.png/revision/latest/scale-to-width-down/162?cb=20210308212510	Eternal Siege
6	495	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c5/Golden_Force.png/revision/latest/scale-to-width-down/162?cb=20210305193234	Golden Force
4	495	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5a/Royal_Allegiance.png/revision/latest/scale-to-width-down/162?cb=20210308214724	Royal Allegiance
6	496	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a4/Beta_Thrusters.png/revision/latest/scale-to-width-down/162?cb=20210305174040	Beta Thrusters
4	496	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/aa/Plasma_Cannon.png/revision/latest/scale-to-width-down/162?cb=20210208165939	Plasma Cannon
6	497	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f7/Penguin%27s_Pummel.png/revision/latest/scale-to-width-down/162?cb=20210305194925	Penguin's Pummel
4	497	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/27/Frosty%27s_Fury.png/revision/latest/scale-to-width-down/162?cb=20210228074319	Frosty's Fury
6	498	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/05/Regulus.png/revision/latest/scale-to-width-down/162?cb=20220119232809	Regulus
4	498	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/60/Argo%27s_Cannon.png/revision/latest/scale-to-width-down/162?cb=20220119232809	Argo's Cannon
6	499	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/12/Judgment_Claws.png/revision/latest/scale-to-width-down/162?cb=20221019170217	Judgment Claws
4	499	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f5/Swamp_Serum.png/revision/latest/scale-to-width-down/162?cb=20221019170234	Swamp Serum
11	500	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/30/Laughing_Stock.png/revision/latest/scale-to-width-down/162?cb=20210309082448	Laughing Stock
2	500	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0f/Sword_of_Swords.png/revision/latest/scale-to-width-down/162?cb=20210226083946	Sword of Swords
11	501	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ed/Twisted_Titanium.png/revision/latest/scale-to-width-down/162?cb=20210309082556	Twisted Titanium
2	501	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8a/Damascus_Cleaver.png/revision/latest/scale-to-width-down/162?cb=20210226084722	Damascus Cleaver
11	502	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e3/Phoenix_Claw.png/revision/latest/scale-to-width-down/162?cb=20210309082651	Phoenix Claw
2	502	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/da/Dragon%27s_Fang.png/revision/latest/scale-to-width-down/162?cb=20210226084816	Dragon's Fang
11	503	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/16/Blue_Blossom_Blade.png/revision/latest/scale-to-width-down/162?cb=20210414135437	Blue Blossom Blade
2	503	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/23/Flora_Striker.png/revision/latest/scale-to-width-down/162?cb=20210414135452	Flora Striker
11	504	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c0/Crowbar.png/revision/latest/scale-to-width-down/162?cb=20210922155313	Crowbar
2	504	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8d/Lucille.png/revision/latest/scale-to-width-down/162?cb=20210922155322	Lucille
11	505	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d1/Ice_Slicer.png/revision/latest/scale-to-width-down/162?cb=20221215130659	Ice Slicer
2	505	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f0/Great_Board.png/revision/latest/scale-to-width-down/162?cb=20221215130655	Great Board
11	506	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/52/Benevolent_Light.png/revision/latest/scale-to-width-down/162?cb=20230126041335	Benevolent Light
2	506	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ca/Divine_Conviction.png/revision/latest/scale-to-width-down/162?cb=20230126041334	Divine Conviction
9	507	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/39/Shadow_Trawl.png/revision/latest/scale-to-width-down/162?cb=20210330201159	Shadow Trawl
2	507	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/02/Bathyal_Blade.png/revision/latest/scale-to-width-down/162?cb=20210208165544	Bathyal Blade
9	508	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d4/Mech_Makers.png/revision/latest/scale-to-width-down/162?cb=20210330212202	Mech Makers
2	508	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/20/The_Chainsaw.png/revision/latest/scale-to-width-down/162?cb=20210226085512	The Chainsaw
9	509	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4a/High_Tide.png/revision/latest/scale-to-width-down/162?cb=20210330211821	High Tide
2	509	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/59/Coral_Carver.png/revision/latest/scale-to-width-down/162?cb=20210226085304	Coral Carver
9	510	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8c/Serpent%27s_Fangs.png/revision/latest/scale-to-width-down/162?cb=20210330212504	Serpent's Fangs
2	510	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/de/World_Ender.png/revision/latest/scale-to-width-down/162?cb=20210226085548	World Ender
9	511	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8d/Splish_%26_Splash.png/revision/latest/scale-to-width-down/162?cb=20210901222744	Splish & Splash
2	511	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/63/Great-Oar.png/revision/latest/scale-to-width-down/162?cb=20210901222754	Great-Oar
10	512	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f2/Ares%27s_Might.png/revision/latest/scale-to-width-down/162?cb=20210324221714	Ares's Might
2	512	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/ff/Gladius_Magnus.png/revision/latest/scale-to-width-down/162?cb=20210226085411	Gladius Magnus
10	513	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/98/The_Angel.png/revision/latest/scale-to-width-down/162?cb=20210324221740	The Angel
2	513	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/21/Cold_Embrace.png/revision/latest/scale-to-width-down/162?cb=20210226085236	Cold Embrace
10	514	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f4/Afterlife.png/revision/latest/scale-to-width-down/162?cb=20210324221808	Afterlife
2	514	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b7/Great_Khopesh.png/revision/latest/scale-to-width-down/162?cb=20210226085440	Great Khopesh
10	515	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/31/Skull_of_the_Saint.png/revision/latest/scale-to-width-down/162?cb=20220831145151	Skull of the Saint
2	515	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/68/Adjudicator%27s_Mercy.png/revision/latest/scale-to-width-down/162?cb=20220831145152	Adjudicator's Mercy
10	516	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/ce/Photosynthesis_Warhammer.png/revision/latest/scale-to-width-down/162?cb=20230427001118	Photosynthesis Warhammer
2	516	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c3/Law_of_the_Land.png/revision/latest/scale-to-width-down/162?cb=20230427001118	Law of the Land
12	517	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8e/Maxilli-Blasts.png/revision/latest/scale-to-width-down/162?cb=20210414162208	Maxilli-Blasts
3	517	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d4/Closin%27_Time.png/revision/latest/scale-to-width-down/162?cb=20210414162613	Closin' Time
12	518	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/89/Darkshooters.png/revision/latest/scale-to-width-down/162?cb=20210414162318	Darkshooters
3	518	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/48/Crimson_Poison.png/revision/latest/scale-to-width-down/162?cb=20210414162918	Crimson Poison
12	519	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9e/Forbidden_Lamps.png/revision/latest/scale-to-width-down/162?cb=20210414162513	Forbidden Lamps
3	519	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/00/The_Obol.png/revision/latest/scale-to-width-down/162?cb=20210414163006	The Obol
12	520	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/64/Smokers_Mk._B.png/revision/latest/scale-to-width-down/162?cb=20220413174943	Smokers Mk. B
3	520	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e2/Jar-O-Honey.png/revision/latest/scale-to-width-down/162?cb=20220413174943	Jar-O-Honey
7	521	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2d/Royal_Spoils.png/revision/latest/scale-to-width-down/162?cb=20211014001059	Royal Spoils
5	521	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/52/Stringed_Scavenger.png/revision/latest/scale-to-width-down/162?cb=20211014001119	Stringed Scavenger
7	522	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4b/Brass_Section.png/revision/latest/scale-to-width-down/162?cb=20211014001140	Brass Section
5	522	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c8/Rhapsody%27s_Edge.png/revision/latest/scale-to-width-down/162?cb=20211014001201	Rhapsody's Edge
7	523	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/96/Tempo_Lock.png/revision/latest/scale-to-width-down/162?cb=20211014001223	Tempo Lock
5	523	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d2/Crossfader.png/revision/latest/scale-to-width-down/162?cb=20211014001244	Crossfader
7	524	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/75/Twirling_Flourish.png/revision/latest/scale-to-width-down/162?cb=20220413165005	Twirling Flourish
5	524	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/11/Pavonini_Talon.png/revision/latest/scale-to-width-down/162?cb=20220413165042	Pavonini Talon
7	525	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4f/Symphonic_Surge.png/revision/latest/scale-to-width-down/162?cb=20230126041335	Symphonic Surge
5	525	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b5/Looter%27s_Lute.png/revision/latest/scale-to-width-down/162?cb=20230126041335	Looter's Lute
7	526	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b9/Weero_Wings.png/revision/latest/scale-to-width-down/162?cb=20230614212243	Weero Wings
5	526	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8a/Quarrion_Sickle.png/revision/latest/scale-to-width-down/162?cb=20230614212239	Quarrion Sickle
14	527	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/98/Pincer_Pike.png/revision/latest/scale-to-width-down/162?cb=20220316180402	Pincer Pike
2	527	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/00/Great_Mandibles.png/revision/latest/scale-to-width-down/162?cb=20220316180319	Great Mandibles
14	528	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/86/Fangwild_Havoc.png/revision/latest/scale-to-width-down/162?cb=20220316180053	Fangwild Havoc
2	528	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/90/Nightfall.png/revision/latest/scale-to-width-down/162?cb=20220316180026	Nightfall
14	529	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/60/Piercing_Regret.png/revision/latest/scale-to-width-down/162?cb=20220316180721	Piercing Regret
2	529	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a2/Dark_Thorn_Cleaver.png/revision/latest/scale-to-width-down/162?cb=20220316180643	Dark Thorn Cleaver
14	530	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/44/Autumnal_Scepter.png/revision/latest/scale-to-width-down/162?cb=20220622155503	Autumnal Scepter
2	530	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/01/Harvest_Cleaver.png/revision/latest/scale-to-width-down/162?cb=20220623023243	Harvest Cleaver
11	531	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/77/Sword_of_the_Creed.png/revision/latest/scale-to-width-down/162?cb=20220727161751	Sword of the Creed
3	531	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b7/Apple_of_Odin.png/revision/latest/scale-to-width-down/162?cb=20220727161327	Apple of Odin
11	532	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/cf/Blade_of_Brutus.png/revision/latest/scale-to-width-down/162?cb=20220727161453	Blade of Brutus
3	532	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/37/Piece_of_Eden.png/revision/latest/scale-to-width-down/162?cb=20220727161702	Piece of Eden
11	533	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/01/Yataghan_Sword.png/revision/latest/scale-to-width-down/162?cb=20220727161909	Yataghan Sword
3	533	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0c/Isu_Apple.png/revision/latest/scale-to-width-down/162?cb=20220727161616	Isu Apple
11	534	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/68/Alucard_Sword.png/revision/latest/scale-to-width-down/162?cb=20221019170149	Alucard Sword
3	534	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/71/Ghost_Familiar.png/revision/latest/scale-to-width-down/162?cb=20221019170203	Ghost Familiar
1	535	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/15/His_Nice_Shoes.png/revision/latest/scale-to-width-down/162?cb=20221215110609	His Nice Shoes
6	535	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9f/Fisticuff-links.png/revision/latest/scale-to-width-down/162?cb=20221215110604	Fisticuff-links
1	536	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/90/Ancestral_Steps.png/revision/latest/scale-to-width-down/162?cb=20221215110556	Ancestral Steps
6	536	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d1/Jaguar_Paws.png/revision/latest/scale-to-width-down/162?cb=20221215110614	Jaguar Claws (Ocelotl Tezca)
1	537	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c6/Los_Gatos_Voladores.png/revision/latest/scale-to-width-down/162?cb=20221215110617	Los Gatos Voladores
6	537	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4e/Roar_%26_Pounce.png/revision/latest/scale-to-width-down/162?cb=20221215110623	Roar & Pounce
1	538	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8b/Cloud_Kickers.png/revision/latest/scale-to-width-down/162?cb=20230810055320	Cloud Kickers
6	538	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/32/Malady_Wear.png/revision/latest/scale-to-width-down/162?cb=20230810055338	Malady Wear
1	539	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/0e/Derby_Dusters.png/revision/latest/scale-to-width-down/162?cb=20230329204226	Derby Dusters
13	539	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/aa/Racing_Lance.png/revision/latest/scale-to-width-down/162?cb=20230329205121	Racing Lance
1	540	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/35/Achilles%27_Loss.png/revision/latest/scale-to-width-down/162?cb=20230329204226	Achilles' Loss
13	540	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f4/Corinthian_Lance.png/revision/latest/scale-to-width-down/162?cb=20230329205121	Corinthian Lance
1	541	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/70/Runtime.png/revision/latest/scale-to-width-down/162?cb=20230329204225	Runtime
13	541	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/1/11/Spark_Compressor.png/revision/latest/scale-to-width-down/162?cb=20230329205121	Spark Compressor
1	542	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/de/Olive_Stompers.png/revision/latest/scale-to-width-down/162?cb=20230614200902	Olive Stompers
3	542	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/f0/Dragon%27s_Heart.png/revision/latest/scale-to-width-down/162?cb=20230614200730	Dragon's Heart
1	543	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c0/Corrupted_Steps.png/revision/latest/scale-to-width-down/162?cb=20230614200858	Corrupted Steps
3	543	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/dd/Darkheart_Geode.png/revision/latest/scale-to-width-down/162?cb=20230614200726	Darkheart Geode
1	544	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/53/Airgliders.png/revision/latest/scale-to-width-down/162?cb=20230614200853	Airgliders
3	544	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8f/Tiercel_Orb.png/revision/latest/scale-to-width-down/162?cb=20230614200720	Tiercel Orb
11	83	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a5/AniEternal_Flame.gif/revision/latest/scale-to-width-down/162?cb=20210309084539	Eternal Flame
14	83	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/69/AniQueen_of_Demons.gif/revision/latest/scale-to-width-down/162?cb=20210309084552	Queen of Demons
7	228	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/90/AniDaemon_Killer.gif/revision/latest/scale-to-width-down/162?cb=20210305011836	Daemon Killer
11	228	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e5/AniPowersurge.gif/revision/latest/scale-to-width-down/162?cb=20210305011818	Powersurge
5	334	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3d/AniThe_Pale_Horse.gif/revision/latest/scale-to-width-down/162?cb=20210309084615	The Pale Horse
14	334	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8c/AniSeal_Breaker.gif/revision/latest/scale-to-width-down/162?cb=20210309084603	Seal Breaker
3	478	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/5c/AniDemon%27s_Malice.gif/revision/latest/scale-to-width-down/162?cb=20201214043646	Demon's Malice
6	478	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/f/fb/AniHaunting_Terrors.gif/revision/latest/scale-to-width-down/162?cb=20201214043622	Haunting Terrors
10	104	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/e5/AniCircuit_Breaker.gif/revision/latest/scale-to-width-down/162?cb=20210309084454	Circuit Breaker
13	104	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/44/AniSpark_of_Madness.gif/revision/latest/scale-to-width-down/162?cb=20210309084526	Spark of Madness
12	46	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/b/b6/AniElectrode_Guns.gif/revision/latest/scale-to-width-down/162?cb=20201214043636	Electrode Guns
8	560	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a8/Magic_Bubble_Wand.png/revision/latest/scale-to-width-down/162?cb=20231129175655	Magic Bubble Wand
10	560	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/67/Jellyfishing_Net.png/revision/latest/scale-to-width-down/162?cb=20231129175651	Jellyfishing Net
6	561	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d7/Kah-Rah-Tay_Gloves.png/revision/latest/scale-to-width-down/162?cb=20231129175652	Kah-Rah-Tay Gloves
8	561	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7c/Krusty_Krab_Spatula.png/revision/latest/scale-to-width-down/162?cb=20231129175654	Krusty Krab Spatula
12	562	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d4/Net_Guns.png/revision/latest/scale-to-width-down/162?cb=20231129175656	Net Guns
10	562	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/5/53/Nutsy.png/revision/latest/scale-to-width-down/162?cb=20231129175657	Nutsy
9	563	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/31/Soul_Fangs.png/revision/latest/scale-to-width-down/162?cb=20230928181154	Soul Fangs
5	563	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/8a/Phantom_Toxin.png/revision/latest/scale-to-width-down/162?cb=20230928181152	 Phantom Toxin
9	565	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7a/Biotec-X_Scalpels.png/revision/latest/scale-to-width-down/162?cb=20230928181150	Biotec-X Scalpels
5	565	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/3b/Luminary_Authority.png/revision/latest/scale-to-width-down/162?cb=20230928181150	Luminary Authority
14	566	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/94/Stuffing_Spear.png/revision/latest/scale-to-width-down/162?cb=20231011155908	Stuffing Spear
2	566	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/c/c8/Ornate_Scissorblade.png/revision/latest/scale-to-width-down/162?cb=20231011155902	Ornate Scissorblade
9	564	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/2c/Taurus_Skulls.png/revision/latest/scale-to-width-down/162?cb=20230928181155	Taurus Skulls
5	564	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d1/Mississippi_Wrangler.png/revision/latest/scale-to-width-down/162?cb=20230928181151	Mississippi Wrangler
6	567	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/01/Chainbreakers.png/revision/latest/scale-to-width-down/162?cb=20231011155858	Chainbreakers
14	567	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ee/Rotten_Oar.png/revision/latest/scale-to-width-down/162?cb=20231011155907	Rotten Oar
\.


--
-- TOC entry 3519 (class 0 OID 38761)
-- Dependencies: 245
-- Data for Name: weapons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weapons (id, name, img) FROM stdin;
1	Boots	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4e/Battle_Boots_Icon.png/revision/latest/scale-to-width-down/54?cb=20221214171435
2	Greatsword	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/7/7f/Greatsword_Icon.png/revision/latest/scale-to-width-down/54?cb=20200708151950
3	Orb	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/08/Orb_Icon.png/revision/latest/scale-to-width-down/54?cb=20181129001801
4	Cannon	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/6/6b/Cannon_Icon.png/revision/latest/scale-to-width-down/54?cb=20180724180353
5	Scythe	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/e/ea/Scythe_Icon.png/revision/latest/scale-to-width-down/54?cb=20180724180345
6	Fists	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/8/85/Gauntlets_Icon.png/revision/latest/scale-to-width-down/54?cb=20180724180337
7	Bow	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/0/05/Bow_Icon.png/revision/latest/scale-to-width-down/54?cb=20180724180356
8	Axe	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/d/d6/Axe_Icon.png/revision/latest/scale-to-width-down/54?cb=20180724180339
9	Katar	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/97/Katars_Icon.png/revision/latest/scale-to-width-down/54?cb=20180724180333
10	Hammer	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/4/4b/Grapple_Hammer_Icon.png/revision/latest/scale-to-width-down/54?cb=20180724180342
11	Sword	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/3/32/Sword_Icon.png/revision/latest/scale-to-width-down/54?cb=20180724180350
12	Pistol	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/a/a3/Blasters_Icon.png/revision/latest/scale-to-width-down/54?cb=20180724180329
13	RocketLance	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/9/9f/Rocket_Lance_Icon.png/revision/latest/scale-to-width-down/54?cb=20180724180327
14	Spear	https://static.wikia.nocookie.net/brawlhalla_gamepedia/images/2/26/Spear_Icon.png/revision/latest/scale-to-width-down/54?cb=20180724180347
\.


--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 216
-- Name: applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.applications_id_seq', 8, true);


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 219
-- Name: chests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chests_id_seq', 23, true);


--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 222
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 19, true);


--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 227
-- Name: legends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.legends_id_seq', 78, true);


--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 230
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 16, true);


--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 232
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 234
-- Name: skins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skins_id_seq', 567, true);


--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 236
-- Name: stat_imgs_value_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stat_imgs_value_seq', 1, false);


--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 238
-- Name: stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stats_id_seq', 4, true);


--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 240
-- Name: type_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_reviews_id_seq', 1, false);


--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 242
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 14, true);


--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 246
-- Name: weapons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weapons_id_seq', 19, true);


--
-- TOC entry 3277 (class 2606 OID 38781)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 3279 (class 2606 OID 38783)
-- Name: applications applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);


--
-- TOC entry 3281 (class 2606 OID 38785)
-- Name: chest_skins chest_skins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chest_skins
    ADD CONSTRAINT chest_skins_pkey PRIMARY KEY (chest_id, skin_id);


--
-- TOC entry 3283 (class 2606 OID 38787)
-- Name: chests chests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chests
    ADD CONSTRAINT chests_pkey PRIMARY KEY (id);


--
-- TOC entry 3285 (class 2606 OID 38789)
-- Name: event_skins event_skins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_skins
    ADD CONSTRAINT event_skins_pkey PRIMARY KEY (event_id, skin_id);


--
-- TOC entry 3287 (class 2606 OID 38791)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 38793)
-- Name: favourites favourites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_pkey PRIMARY KEY (legend_id, user_id);


--
-- TOC entry 3291 (class 2606 OID 38795)
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (token);


--
-- TOC entry 3293 (class 2606 OID 38797)
-- Name: legend_stats legend_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legend_stats
    ADD CONSTRAINT legend_stats_pkey PRIMARY KEY (stat_id, legend_id);


--
-- TOC entry 3295 (class 2606 OID 38799)
-- Name: legends legends_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legends
    ADD CONSTRAINT legends_pkey PRIMARY KEY (id);


--
-- TOC entry 3297 (class 2606 OID 38801)
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (review_id, user_id);


--
-- TOC entry 3299 (class 2606 OID 38803)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 38805)
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- TOC entry 3303 (class 2606 OID 38807)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 38809)
-- Name: skins skins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skins
    ADD CONSTRAINT skins_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 38811)
-- Name: stat_imgs stat_imgs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stat_imgs
    ADD CONSTRAINT stat_imgs_pkey PRIMARY KEY (value);


--
-- TOC entry 3309 (class 2606 OID 38813)
-- Name: stats stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 38815)
-- Name: type_reviews type_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_reviews
    ADD CONSTRAINT type_reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 38817)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3315 (class 2606 OID 38819)
-- Name: users users_nickname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nickname_key UNIQUE (nickname);


--
-- TOC entry 3317 (class 2606 OID 38821)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 38823)
-- Name: weapon_legends weapon_legends_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_legends
    ADD CONSTRAINT weapon_legends_pkey PRIMARY KEY (weapon_id, legend_id);


--
-- TOC entry 3321 (class 2606 OID 38825)
-- Name: weapon_skins weapon_skins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_skins
    ADD CONSTRAINT weapon_skins_pkey PRIMARY KEY (weapon_id, skin_id);


--
-- TOC entry 3323 (class 2606 OID 38827)
-- Name: weapons weapons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapons
    ADD CONSTRAINT weapons_pkey PRIMARY KEY (id);


--
-- TOC entry 3324 (class 2606 OID 38828)
-- Name: applications applications_default_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_default_user_id_fkey FOREIGN KEY (default_user_id) REFERENCES public.users(id);


--
-- TOC entry 3325 (class 2606 OID 38833)
-- Name: chest_skins chest_skins_chest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chest_skins
    ADD CONSTRAINT chest_skins_chest_id_fkey FOREIGN KEY (chest_id) REFERENCES public.chests(id);


--
-- TOC entry 3326 (class 2606 OID 38838)
-- Name: chest_skins chest_skins_skin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chest_skins
    ADD CONSTRAINT chest_skins_skin_id_fkey FOREIGN KEY (skin_id) REFERENCES public.skins(id);


--
-- TOC entry 3327 (class 2606 OID 38843)
-- Name: event_skins event_skins_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_skins
    ADD CONSTRAINT event_skins_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- TOC entry 3328 (class 2606 OID 38848)
-- Name: event_skins event_skins_skin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_skins
    ADD CONSTRAINT event_skins_skin_id_fkey FOREIGN KEY (skin_id) REFERENCES public.skins(id);


--
-- TOC entry 3329 (class 2606 OID 38853)
-- Name: favourites favourites_legend_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_legend_id_fkey FOREIGN KEY (legend_id) REFERENCES public.legends(id);


--
-- TOC entry 3330 (class 2606 OID 38858)
-- Name: favourites favourites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3331 (class 2606 OID 38863)
-- Name: files files_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- TOC entry 3332 (class 2606 OID 38868)
-- Name: legend_stats legend_stats_legend_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legend_stats
    ADD CONSTRAINT legend_stats_legend_id_fkey FOREIGN KEY (legend_id) REFERENCES public.legends(id);


--
-- TOC entry 3333 (class 2606 OID 38873)
-- Name: legend_stats legend_stats_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legend_stats
    ADD CONSTRAINT legend_stats_stat_id_fkey FOREIGN KEY (stat_id) REFERENCES public.stats(id);


--
-- TOC entry 3334 (class 2606 OID 38878)
-- Name: legend_stats legend_stats_value_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legend_stats
    ADD CONSTRAINT legend_stats_value_fkey FOREIGN KEY (value) REFERENCES public.stat_imgs(value);


--
-- TOC entry 3335 (class 2606 OID 38883)
-- Name: likes likes_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(id);


--
-- TOC entry 3336 (class 2606 OID 38888)
-- Name: likes likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3337 (class 2606 OID 38893)
-- Name: reviews reviews_legend_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_legend_id_fkey FOREIGN KEY (legend_id) REFERENCES public.legends(id);


--
-- TOC entry 3338 (class 2606 OID 38898)
-- Name: reviews reviews_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type_reviews(id);


--
-- TOC entry 3339 (class 2606 OID 38903)
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3340 (class 2606 OID 38908)
-- Name: skins skins_legend_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skins
    ADD CONSTRAINT skins_legend_id_fkey FOREIGN KEY (legend_id) REFERENCES public.legends(id);


--
-- TOC entry 3341 (class 2606 OID 38913)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 3342 (class 2606 OID 38918)
-- Name: weapon_legends weapon_legends_legend_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_legends
    ADD CONSTRAINT weapon_legends_legend_id_fkey FOREIGN KEY (legend_id) REFERENCES public.legends(id);


--
-- TOC entry 3343 (class 2606 OID 38923)
-- Name: weapon_legends weapon_legends_weapon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_legends
    ADD CONSTRAINT weapon_legends_weapon_id_fkey FOREIGN KEY (weapon_id) REFERENCES public.weapons(id);


--
-- TOC entry 3344 (class 2606 OID 38928)
-- Name: weapon_skins weapon_skins_skin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_skins
    ADD CONSTRAINT weapon_skins_skin_id_fkey FOREIGN KEY (skin_id) REFERENCES public.skins(id);


--
-- TOC entry 3345 (class 2606 OID 38933)
-- Name: weapon_skins weapon_skins_weapon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon_skins
    ADD CONSTRAINT weapon_skins_weapon_id_fkey FOREIGN KEY (weapon_id) REFERENCES public.weapons(id);


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2024-03-10 18:50:45

--
-- PostgreSQL database dump complete
--

