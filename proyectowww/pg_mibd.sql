--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO root;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO root;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: deporte_evento; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE deporte_evento (
    id integer NOT NULL,
    titulo character varying(200) NOT NULL,
    imagen character varying(200) NOT NULL,
    "fechaInicio" date NOT NULL,
    restriccion character varying(200) NOT NULL,
    encargado character varying(200) NOT NULL,
    hora time without time zone NOT NULL,
    costo integer NOT NULL,
    participante character varying(200) NOT NULL,
    lugar character varying(200) NOT NULL,
    ciudad character varying(200) NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE public.deporte_evento OWNER TO root;

--
-- Name: deporte_evento_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE deporte_evento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deporte_evento_id_seq OWNER TO root;

--
-- Name: deporte_evento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE deporte_evento_id_seq OWNED BY deporte_evento.id;


--
-- Name: deporte_noticia; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE deporte_noticia (
    id integer NOT NULL,
    titulo character varying(200) NOT NULL,
    copete character varying(200) NOT NULL,
    cuerpo text NOT NULL,
    autor character varying(200) NOT NULL,
    fecha timestamp with time zone NOT NULL,
    imagen character varying(100),
    estado boolean NOT NULL
);


ALTER TABLE public.deporte_noticia OWNER TO root;

--
-- Name: deporte_noticia_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE deporte_noticia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deporte_noticia_id_seq OWNER TO root;

--
-- Name: deporte_noticia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE deporte_noticia_id_seq OWNED BY deporte_noticia.id;


--
-- Name: deporte_usuario; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE deporte_usuario (
    user_ptr_id integer NOT NULL,
    foto character varying(100),
    "fechaNacimiento" timestamp with time zone NOT NULL,
    genero character varying(200) NOT NULL,
    rol character varying(200) NOT NULL
);


ALTER TABLE public.deporte_usuario OWNER TO root;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO root;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY deporte_evento ALTER COLUMN id SET DEFAULT nextval('deporte_evento_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY deporte_noticia ALTER COLUMN id SET DEFAULT nextval('deporte_noticia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add noticia	7	add_noticia
20	Can change noticia	7	change_noticia
21	Can delete noticia	7	delete_noticia
22	Can add evento	8	add_evento
23	Can change evento	8	change_evento
24	Can delete evento	8	delete_evento
25	Can add user	9	add_usuario
26	Can change user	9	change_usuario
27	Can delete user	9	delete_usuario
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_permission_id_seq', 27, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
18	pbkdf2_sha256$24000$nSvW5W7fQHIi$7oUrEf/QREDc6UwXFT95nm3WMsHed1L6iqV2US3Gg4w=	2017-11-17 08:21:21.592199+00	t	Gerente				t	t	2017-11-17 08:15:33+00
17	pbkdf2_sha256$24000$1JKmyc5Nfjwm$W0xV2elpaCXVUG9nrhvXEU0alTDen94/8Yfc4BcKcv0=	2017-11-22 18:37:34.560312+00	t	Operador				t	t	2017-11-17 08:14:30+00
1	pbkdf2_sha256$24000$Rbb6ds66FqXJ$pMLx18gaivTuZvJeu+xkVQqwL1L95io69EsIiIiS6d4=	2017-11-29 01:54:45.675202+00	t	root			alejomm0404@gmail.com	t	t	2017-11-17 01:53:00.249349+00
19	pbkdf2_sha256$24000$Nar5JbdGvDpI$YrA7RbTfY5WYgwYALluNcfGIqLag/bHg1IY+yNh9UtM=	2017-11-29 02:00:38.163849+00	t	Administrador				t	t	2017-11-17 08:16:22+00
20	pbkdf2_sha256$24000$TKtRjkxYq66d$ZDxNY15tNVxN4cYMgw9ks0+/6slNwBQiWL9AD2Xc6S8=	2017-11-29 02:01:18.56712+00	t	Participante				t	t	2017-11-17 08:17:43+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_user_id_seq', 20, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: deporte_evento; Type: TABLE DATA; Schema: public; Owner: root
--

COPY deporte_evento (id, titulo, imagen, "fechaInicio", restriccion, encargado, hora, costo, participante, lugar, ciudad, estado) FROM stdin;
1	Davivienda Golf Tour	igor-ovsyannykov-270958.jpg	2017-12-27	Sólo miembros de los clubes inscritos	David Belmont	10:00:30	200000	40	Country Club	Barranquilla	t
2	Sóftbol para niños	m	2018-01-25	Solo niños entre los 7 y 13 años	Pablo Astiazaran	17:20:00	50000	Esmeralda Espronceda	Diamante de Sóftbol	Cali	t
3	Danza Contemporánea	.	2017-12-09	Ninguna	David Belmont	14:14:15	3000	Esmeralda Espronceda	Escuela de Baile Azúcar	Cali	t
\.


--
-- Name: deporte_evento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('deporte_evento_id_seq', 3, true);


--
-- Data for Name: deporte_noticia; Type: TABLE DATA; Schema: public; Owner: root
--

COPY deporte_noticia (id, titulo, copete, cuerpo, autor, fecha, imagen, estado) FROM stdin;
1	Ciclismo Femenino	Cuida de tu salud mientras disfrutas	Todos recordamos a los grandes pedalistas colombianos en ciclismo de ruta y pista. Hombres como Lucho Herrera, Cochise Rodríguez, Fabio Parra, Nairo Quintana o Rigoberto Urán, son ampliamente conocidos por todas las personas, casi como si fuera conocimiento de cultura general. Por otro lado, el ciclismo femenino, con algunas excepciones del ciclismo de pista gracias a María Luisa Calle o Mariana Pajón, ha pasado desapercibido por los ojos de los colombianos. \r\nEn el pasado, por ejemplo, existía un interés más importante por parte de las mujeres en hacer parte de equipos de ciclismo. Ver caravanas de mujeres entrenando al lado de hombres por las carreteras era algo común en el país. Sin embargo, el ciclismo femenino durante los 90 y el inicio de los años 2000, se había estancado a causa de las bajas oportunidades para convertir el ciclismo en profesión. En muy pocas situaciones, solo logradas por María Luisa Calle en pista, el ciclismo femenino era nombrado en los medios.\r\nDurante el final de los años 2000 y entrando al 2010, los logros de algunas pocas deportistas han abierto el camino de participación de las mujeres en todas las modalidades de ciclismo. Medallas olímpicas, victorias en mundiales de pista y buenas participaciones en competencias de ciclismo de ruta, han llevado al ciclismo femenino a ir creciendo poco a poco.\r\nExisten ligas de ciclomontañismo femenino, en Bogotá, Antioquia, Cundinamarca y Valle, que llevan esta modalidad, que es una de las más exigentes, a las mujeres de la mano de excelentes escenarios para practicar en senderos o pasajes rurales. Durante el 2011 se llevaron a cabo los Juegos Panamericanos de Ciclomontañismo en Cundinamarca. Aún esta modalidad es una de las menos practicadas en Colombia por las mujeres. Por ejemplo, solo un hombre, Leonardo Páez, ha logrado cupo para los Olímpicos de Rio 2016 en ciclomontañismo.	Pablo Astiazaran	2017-11-14 00:00:00+00	img/blubel-103318.jpg	t
2	Media maratón de Cali	El evento de recreación más importante de la región	Esta será la versión número 17 del evento recreativo que se podrá disfrutar recorriendo en tres diferentes distancias, los 21K, 10K ó 5K.\r\n\r\nSegún los organizadores, esta nueva versión que se correrá el próximo domingo 28 de mayo, tendrá como novedad la premiación económica para las distancias 21K y 10K, además de rifas para todos los participantes.\r\n\r\nEl valor es de $60.000 por personas para cualquiera de los recorridos. Los interesados pueden inscribirse en www.juanchocorrelon.com/inscripciones o en el local 244 del Centro Comercial Centenario en los horarios de lunes a viernes de 8:00 a. m. a 7:00 p. m. y sábados de 10:00 a. m. a 5:00 p. m. \r\n\r\nTodos los participantes de 21K, deben haber cumplido 16 años, en 10K deben ser mayores de 12 años y los de 5K mayores de 7 años. Los menores de edad deben estar autorizados por sus padres y acompañados por un adulto responsable.\r\n\r\nLa salida y llegada de la Media Maratón 2017 será en las Canchas Panamericanas, ubicadas en el sur de Cali. La competencia se iniciará a las 7:00 a. m.\r\n\r\nEl lanzamiento oficial de la Media Maratón se realizó el pasado 10 de mayo en el hotel City Express, donde además se presentó el grupo de Trotagonistas y el proyecto "Mis mompitas". Este último consiste en la participación de 200 niños de diferentes escuelas de las comunas de Cali en la carrera.\r\n\r\nDurante el evento, Juancho Correlón, la organización encargada de la carrera, también hizo una presentación de las próximas carreras que llegarán a la capital del Valle del Cauca.	David Belmont	2017-11-03 00:00:00+00	img/martins-zemlickis-57243.jpg	t
3	Renovación de parques	Proyecto organizado por la Alcaldía	Queremos crear una cultura de amor y respeto al medio ambiente sembrando vida en nuestras ciudades por medio de la renovación de parques.\r\nQué es Inspira Vida? Un proyecto de voluntariado ecológico del movimiento humanista Inspira\r\nObjetivo\r\n\r\nCrear una cultura de amor y respeto al medio ambiente y a los seres vivos, a través de la formación humana de los voluntarios, sembrando vida en nuestras ciudades por medio de la renovación y embellecimiento de parques con elementos ecológicos, recreativos y educativos.\r\n \r\nBeneficios sociales de los parques: \r\nPropician el encuentro y la sana convivencia social\r\nContribuyen al bienestar físico, emocional y mental  de la población\r\nDesarrollan un sentido de pertenencia y cooperación en la comunidad\r\nIncrementan la plusvalía de la colonia\r\nGeneran seguridad en la zona, al estar bien iluminados y cuidados\r\n \r\nBeneficios ecológicos de los parques\r\nConstituyen los principales espacios verdes de una ciudad, beneficiando al medio ambiente\r\nContribuyen en la generación de oxígeno y  la estabilidad del clima reduciendo el efecto invernadero y mejorando la calidad del aire.\r\nAyudan a evitar inundaciones, absorbiendo las corrientes de agua.\r\nContribuyen al equilibrio ecológico entre plantas y animales.\r\n \r\nParque a intervenir\r\nSe llevará a cabo la renovación del parque "Mirador del Sol" durante el mes de Marzo con la colaboración de los voluntarios de Inspira, vecinos de la zona y todos los que decidan unirse al proyecto.\r\n\r\n¿Quiénes forman parte de Inspira Vida?\r\nVoluntarios permanentes del movimiento Inspira\r\nVoluntarios eventuales que participan en la renovación de un parque: niños, jóvenes y adultos.\r\nInstituciones públicas y privadas que apoyan y promueven nuestra causa con: aportaciones económicas, aportaciones en especie o mano de obra\r\n \r\n¿Cómo lo hacemos?\r\nHacemos contacto con los colonos y las autoridades correspondientes\r\nConvocamos a los vecinos y voluntarios\r\nConseguimos patrocinadores y apoyos económicos\r\nImpartimos un taller de capacitación técnica y concientización ecológica\r\nRealizamos el embellecimiento y renovación del parque\r\nPromovemos la conformación de un equipo de responsables para el mantenimiento\r\nOrganizamos el evento inaugural con la comunidad, donantes y voluntarios\r\nDamos seguimiento al proyecto\r\n \r\n¿Que haremos con el dinero recaudado? Compra de insumos necesarios ($2,600)  \r\nEscobas, podadora, rastrillos, palas, bolsas de basura, guantes\r\n  Pintura de bardas ($4,300)  \r\nCubetas de pintura, brochas\r\n  Plantacion ($6,000)  \r\nPlantas, carretilla, talache, palas, baldes, mangueras, tierra de vivero, nutrientes, agrogel\r\n  Poda y retiro de ramas secas ($1,500)  \r\nTijeras, machete, cerruchos, rastrillos, costales\r\n  Pintura de bancas y lamparas de herrería ($3,800)  \r\nAndamios, pintura, brochas, thinner, estopa, espátulas, lijas, cubetas, franelas, fibras, jabon en polvo, botes para pintura\r\n  Juego "Salta la llanta" ($5,400)  \r\nFlete para conseguir 50 llantas, pintura, palas pinzones, marros, varillas, cemento, cal\r\n  Punto de encuentro ($2,600)  \r\nFleta para conseguir 15 llantas y una grande, pintura, brochas, tubo doble varilla, llana y espatula, gava, cemento, cal, tierra de relleno\r\n  Placa de reconocimiento ($2,500)	David Belmont	2017-11-11 00:00:00+00	img/jordan-whitfield-278131.jpg	t
4	Deportes Extremos	Desafía tus capacidades	Los deportes extremos son todas aquellas actividades o disciplinas en su mayoría ya existentes, pero que debido a circunstancias especiales o situaciones partículares implícitas como el peligro y la dificultad para realizarlos, se les consideran extremos o peligrosos.\r\nBajo este concepto se agrupan muchos deportes ya existentes que implican cierta dosis de exigencia física y sobre todo mental. Para preparar al cuerpo se necesita una gran concentración ya que es un deporte donde se pone en riesgo la integridad física en todo momento. Se incluyen los deportes más exigentes dentro del paracaidismo, aviación, Aladeltismo, parapentismo, kayak, automovilismo, motociclismo, ciclismo (downhill) estos deportes son los más extremos del mundo. también esta excursionismo (escalada en hielo, escalada en roca, etc.), y otros de reciente creación (Puenting, snowboarding, canopy, etc.).\r\nUn deporte, no considerado extremo, se puede definir así si se practica bajo condiciones especiales o circunstancias particulares no habituales en él. Por ejemplo, la escalada en roca a unos centímetros del suelo (bulder) no se considera “deporte extremo”, pero si se realiza en una pared vertical rocosa a varios cientos de metros de altura, entonces sí se le aplica el término.\r\nSe puede considerar que una persona practica un “deporte extremo” cuando lo hace por primera vez. Por ejemplo, el rafting de clase IV es bastante extremo para quienes nunca antes se habían subido a una balsa y lo sentirán como muy por encima de sus capacidades personales.\r\nEl término “deporte extremo” no es adecuado aplicarlo cuando se realiza simplemente una actividad recreativa o turismo no de masas, turismo cultural, turismo histórico, turismo arqueológico, etc. Tampoco debe estar definido por las condiciones medioambientales, algo bastante subjetivo y dependiente del grado de preparación. En cambio, el término puede aplicarse cuando se practica un deporte en los límites actuales de desarrollo, sea montañismo, atletismo, gimnasia o cualquier otro.\r\nActualmente, en algunos países se empieza a utilizar el término “deporte de aventura” cuando se practican deportes de más alto riesgo de lo normal sin ser profesionales. Un ejemplo de esto es la diferencia que existe entre “espeleología” y “espeleísmo”: el primero se refiere a una actividad científica, mientras que el segundo hace referencia a aquellas personas que lo practican por deporte.	David Belmont	2017-10-26 00:00:00+00	img/pexels-photo-382177.jpeg	t
5	Entrenar con amigos	Comprueba su efectividad	Uno de los motivos por los que muchos de mis pacientes empiezan a practicar un deporte es el conocer gente nueva. Sí, a partir de una edad, los 30, es más complicado hacer amigos nuevos. La gente tiene su vida montada, su pandilla, su pareja, sus compañeros de trabajo, y es difícil introducirte en un grupo al que no conoces.\r\n\r\nTambién han cambiado los valores, las costumbres y la forma de relacionarnos. Ya no tienes un matrimonio para toda la vida, por lo que los amigos que eran de la pareja que pasa a ser expareja, a veces se pierden. La movilidad laboral también dificultad las relaciones en el propio trabajo. Un día estás en una empresa en España, y al año siguiente estás trabajando en China. Así que la forma de hacer amigos también tiene que adaptarse a lo nuevo.\r\n\r\nSin duda, mucho son los que a través de las redes sociales consiguen ampliar su círculo. Pero muchos otros prefieren seguir métodos más tradicionales y estar en contacto directo con gente. Ambas maneras de relacionarse son compatibles y además, se complementan.\r\nCuando un paciente me pregunta que qué puede hacer para poder hacer amigos, le invito siempre a practicar sus aficiones, un curso de fotografía, aprender un idioma, apuntarse a un curso de cocina y como no, a apuntarse a un deporte que le facilite estar con otras personas y genere ocasiones en las que hablar, compartir y estar con gente. Ejemplos de ellos son el pádel, deportes de equipo, las clases guiadas en el gimnasio o meterte en grupos de running o senderismo.\r\n\r\nUna vez dentro del grupo tienes que poner de tu parte para relacionarte con gente. Las personas no suelen venir a ti. Eres tú el que tiene que provocar la oportunidad. ¿Cómo?\r\n\r\n1.Sonríe. La sonrisa hará que parezcas amigable. Las personas que de entrada sonríen, tienden a caernos bien. Interpretamos que no son peligrosas, que se esfuerzan por agradar y que están abiertas a comunicarse. La sonrisa es una puerta abierta a la comunicación.\r\n\r\n2. Al entrar en una clase de ejercicio o en un grupo nuevo, saluda. Basta con decir buenos días, buenas tardes, qué tal, cómo estáis. Algo tan básico como saludar hay muchas personas que han dejado de hacerlo. Cuanto más grande es la ciudad, menos se saluda la gente. Cuando yo salgo a correr cada mañana le doy los buenos días a todos los que me encuentro corriendo. Muchos se sorprenden, deben pensar que qué hace una desconocida dándoles los buenos días, otros te devuelven encantados el saludo y la mayoría, sonríe. La gente se siente bien cuando deja de ser invisible a los ojos de los demás. Un simple buenos días es una muestra de educación e interés sincero hacia el otro. Así será más fácil poder entablar una futura conversación.\r\nAcércate a la gente y trata de compartir temas sencillos, que no sean conflictivos. Puedes hablar de la afición que compartís, de los motivos por los que os habéis apuntado a esta actividad, qué deportes os gustan y a qué os dedicáis. No toques temas que puedan generar controversia, sobre todo al principio: política, religión, etc., salvo que sea un tema que ha sacado ya la otra persona.\r\n\r\n3. Trata de ser comedido cuando te relaciones. Huye de los juicios de valor, de las críticas, de utilizar palabras como siempre, nunca, etc.\r\n\r\n4. Sé prudente. No preguntes por temas personales que puedan ser incómodos para otra persona. Hay personas inseguras, susceptibles, miedosas, a las que no les gusta que se les pregunte por su edad, por su pareja, etc. Ten cuidado con según qué temas, salvo que te inviten a hablar de ello.\r\n\r\n5. Interésate por la persona. Si ya has cogido algo de confianza con la persona y conoces a qué se dedica o cómo es su día a día, pregúntale cómo le va, qué tal fue la reunión o por un hijo que haya tenido enfermo. A las personas les gusta hablar de sí mismas y cuando alguien se interesa por sus prioridades, se sienten bien.\r\n\r\n6. Escucha, escucha y escucha. Y escucha con atención, manteniendo el contacto ocular, asintiendo con la cabeza mientras te hablan y sonriendo de vez en cuando.\r\n\r\n7. Llama a la persona por su nombre. Decía Dalee Carnegie que el nombre de uno es una de las palabras que más agradan a las personas.\r\n\r\n8. Apúntate a los planes o pregunta si puedes participar. No esperes a ser invitado. Si ves que la gente está diciendo de quedar, pregunta si puedes unirte. Que no te dé vergüenza. El no ya lo tienes.\r\n\r\nLas relaciones personales pueden ser una gran fuente de satisfacción. Disfrutar de ellas depende de nosotros. Si carecemos de la habilidad para hacerlo, podemos entrenarla igual que entrenamos nuestro deporte. Tener un soporte de amigos y apoyo es parte del bienestar y de la salud mental de las personas.	Pablo Astiazaran	2017-11-07 00:00:00+00	img/curtis-macnewton-12711.jpg	t
6	Yoga como práctica diaria	Conoce sobre sus beneficios	El yoga mejora la salud de quienes lo practican, gracias a sus múltiples beneficios. Las posturas de yoga no dejan de sorprender por los beneficios físicos, mentales y espirituales que se consiguen en las clases de yoga. Siéntete en el aire por dentro y por fuera. El yoga aporta una expansión en todos los campos de la existencia humana. Su práctica garantiza un cuerpo firme, una mente estable y un espiritu benevolente. Consulta los distintos tipos de beneficios del yoga.\r\n\r\nBeneficios físicos del yoga:\r\nFortaleza: las asanas tonifican cada parte del cuerpo.\r\nResistencia: la práctica regular incrementa la capacidad de trabajo.\r\nFlexibilidad: un cuerpo joven es mantenido y restablecido a través de un correcto estiramiento.\r\nPostura: mientras el tono y la flexibilidad se equilibran, se establece una postura erguida y sin esfuerzo.\r\nEnergía: la mejora del funcionamiento glandular y la relajación profunda dejan a uno fresco y calmado.\r\nSalud: Un estado de bienestar consistente es experimentado cuando la mente y el cuerpo están equilibrados.\r\nMejora de la circulación sanguínea.\r\nBeneficios mentales del yoga:\r\n\r\nConcentración: la penetración de las posturas de yoga profundiza y extiende la concentración, la memoria y la atención.\r\nEstabilidad emocional: el contacto con el yo interno nos da perspectiva sobre la vida y aisla la mente de las alteraciones.\r\nPaz: tranquilidad en el mente, tolerancia en la mente y la absorción en el yo interno genera un estado permanente de paz y tranquilidad.\r\nAutoreconocimiento: desarrolla las habilidades necesarias para comprender el funcionamiento de la mente a través de la observación de la actividad del propio cuerpo y de la respiración.\r\nDesarrollo integral y progresivo de mente y cuerpo: facilitando la expresión de los potenciales del practicante y fortaleciendo el autoestima.\r\n\r\n\r\nBeneficios espirituales del yoga:\r\nSabiduría: una práctica persistente desarrolla el conocimiento que florece como sabiduría.\r\nLibertad: la equanimidad y la sabiduría conducen a la experiencia de libertad en la vida diaria.\r\nIntegración: la exploración regular y la conexión de las capas mentales, espirituales, físicas y emocionales conducen a un estado íntegro de armonía.\r\nDescanso mayor durante la noche.\r\nCalma: otra forma de afrontar los problemas.	David Belmont	2017-10-14 00:00:00+00	img/aral-tasher-132714.jpg	t
7	Historia del atletismo	Conoce todos los detalles de este lindo deporte	El atletismo es un deporte que abarca numerosas disciplinas agrupadas en carreras, saltos, lanzamientos, pruebas combinadas y marcha. Es el arte de superar el rendimiento de los adversarios en velocidad o en resistencia, en distancia o en grandes alturas.\r\n \r\nEl número de pruebas, ya sean individuales o en equipo, ha variado con el tiempo y las mentalidades. El atletismo es uno de los pocos deportes practicados universalmente, ya sea entre aficionados o en competiciones de todos los niveles. La simplicidad y los pocos medios necesarios para su práctica explican este éxito.\r\n \r\nLos primeros vestigios de las competencias atléticas se remontan a las civilizaciones antiguas. La disciplina fue desarrollándose a lo largo de los siglos, desde las primeras pruebas hasta su reglamentación.\r\n \r\nEl calendario está dominado por cuatro tipos de eventos: reuniones, reuniones entre clubes, nacionales y los principales eventos internacionales. Los Juegos Olímpicos son el evento internacional más prestigioso. Se celebran cada cuatro años desde 1896 y el atletismo es la disciplina más importante en ellos. Desde 1982, la Asociación Internacional de Federaciones de Atletismo (IAAF), el organismo responsable de la regulación de la disciplina, ha flexibilizado sus normas para acabar con el periodo amateur de la disciplina. El primer Campeonato Mundial de Atletismo se organizó en 1983 y tienen lugar cada dos años desde 1991.\r\n \r\nHistoria\r\n \r\nCorrer, caminar, lanzar y saltar son movimientos naturales en el hombre y, de hecho, el concepto de atletismo se remonta a tiempos muy lejanos, como lo confirman algunas pinturas rupestres del Paleolítico Inferior (6000 a. C.-5500 a. C) al Neolítico que demuestran rivalidad entre varios corredores y lanzadores.1 Las fuentes se hacen más precisas en Egipto en el siglo XV antes de nuestra era, con la referencia escrita más antigua, referida a la carrera a pie, hallada en la tumba de Amenhotep II (c. 1438-1412 a. C.)1 En la misma época, la civilización minoica (Creta), también practicaba las carreras, así como el lanzamiento de jabalina y de disco.\r\n \r\nLos primeros encuentros en Grecia se llevaron a cabo en el siglo VIII a. C. En ellos destacaba la prueba llamada stadion, que era una carrera pedestre de 197,27 metros, equivalentes a 200 veces el pie de Heracles. Esta es la prueba más antigua de la que se tiene registro,2 aunque se supone que se practicaba con anterioridad. Poco tiempo después aparecieron más pruebas, como el doble stadion o duálico, la carrera de medio fondo o hípico y la carrera de fondo o dólico. Todas estas pruebas son múltiplos de la distancia del stadion.\r\n \r\nEl pentatlón, que combina la carrera, el salto, los lanzamientos y la lucha, es otra disciplina del atletismo introducida en el programa olímpico antes del final del siglo VIII a. C.\r\n \r\nAparte de los Juegos Olímpicos,existieron otros encuentros deportivos en diferentes polis griegas, que fueron eclipsados por los primeros. No menos de 38 ciudades griegas celebraron sus propios juegos olímpicos (llamados isolímpicos para diferenciarlos de los celebrados en Olimpia) y 33 llevaban a cabo Juegos Píticos.\r\n \r\nLa civilización romana practicó el atletismo en dos versiones diferentes a partir del año 186 a. C. La primera es de inspiración etrusca (cursores), mientras que la segunda es una adaptación de las disciplinas griegas (athletae).5 El Estadio de Domiciano fue construido en el año 86 y se dedicó al atletismo en su variante griega.\r\n \r\nIrlanda organizó entre los años 632 y 1169 juegos que incluían pruebas desconocidas para los griegos, como el salto con pértiga, lanzamiento de martillo y una forma de cross-country. Estas disciplinas se introdujeron en Escocia en el siglo IV y se modificaron hasta transformarse en los Juegos de la montaña.\r\n \r\nPeríodo Clásico (de la Edad Media al siglo XIX)\r\n \r\nExisten fuentes que nos informan de que ya se realizaban carreras en Inglaterra desde el siglo XI.1 El entusiasmo era tal que las autoridades locales reservaron un espacio dedicado solo a estos concursos en 1154 en Lord.1 En las historias de Havelock el danés en 1275 figura la descripción de un lanzador de piedras. Por otra parte, según los historiadores, el rey Enrique II de Inglaterra hizo construir campos de deportes en las cercanías de Londres6 para la práctica de lanzar el martillo, la barra y la pica y también para juegos de pelota. Al mismo tiempo, la juventud de Londres se desafiaba en largas carreras a través de la ciudad.\r\n \r\n \r\nEn 1365, el rey Eduardo III promulgó la primera de una serie de leyes para prohibir prácticamente todas las actividades deportivas, excepto el tiro con arco que se pudo seguir practicando por razones militares.1 Las carreras y los saltos figuraban en la lista de los deportes prohibidos.1 No obstante las competiciones continuaron, como lo demuestra la renovación de las prohibiciones, por lo que Enrique VIII finalmente permitió las carreras a pie en Londres en 1510.\r\n \r\nEnrique VIII fomentó la práctica de ejercicio diario, mientras que los teóricos de la época, como Thomas Elyot, concedieron mucha importancia a los deportes en los planes de estudios. En el siglo XVI, se describen por primera vez reuniones atléticas en los Juegos de Cotswold (Cotswold Games), una especie de «mitin deportivo» organizado en Gloucestershire e inspirado directamente en los héroes de la antigua Grecia.\r\n \r\nLa competición atlética se desarrolló bastante en el Reino Unido en el siglo XVII. Los deportes más populares eran entonces el lanzamiento de martillo, el salto de altura, el salto de longitud y la carrera a pie. Con la aparición del puritanismo, la Iglesia Anglicana quiso abolir el deporte, alegando que las competiciones de atletismo realizadas por toda Inglaterra terminaban, por lo general, en peleas y borracheras. En reacción al puritanismo, el rey Jacobo I alentó a sus súbditos a que practicasen deporte después de los oficios del domingo por la tarde.8 También promovió el deporte mediante la publicación del Book of Sports.9\r\n \r\nLos primeros corredores profesionales aparecieron en Inglaterra a finales del siglo XVII. Estos corredores eran ambulantes y se medían a los campeones locales en concursos remunerados.1\r\n \r\nEn España, el Korrikolaris, ha venido siendo practicado desde la Edad Media. Es una carrera a pie de larga distancia, realizada entre dos corredores\r\n \r\nEn el resto del mundo, una de las carreras medievales más antiguas fuera de las islas británicas era la que se celebraba en Roma a mediados del siglo XV. El Papa Andres II autorizó la celebración del festival deportivo anual que se celebró durante dos siglos. El programa reproducía el de los atletas griegos y los atletas competían a la griega, es decir, desnudos.\r\n \r\nLa Olimpiada de la República fue una competición deportiva celebrada en 1796, 1797 y 1798 en París. La prueba reina de este intento de rehabilitación de los Juegos Olímpicos era una carrera a pie.\r\n \r\nEste evento marcó la transición entre el deporte del Antiguo Régimen y el deporte moderno, como lo demuestra el uso del sistema métrico en el deporte por primera vez. Además, por primera vez también en el deporte, las carreras fueron cronometradas utilizando dos relojes marinos de guerra.	Pablo Astiazaran	2017-10-30 00:00:00+00	img/relay-race-competition-stadium-sport.jpg	t
\.


--
-- Name: deporte_noticia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('deporte_noticia_id_seq', 7, true);


--
-- Data for Name: deporte_usuario; Type: TABLE DATA; Schema: public; Owner: root
--

COPY deporte_usuario (user_ptr_id, foto, "fechaNacimiento", genero, rol) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-11-17 03:14:41.488498+00	2	Edward Buckley	1	Añadido.	9	1
2	2017-11-17 03:45:39.627286+00	3	Pablo Astiazaran	1	Añadido.	9	1
3	2017-11-17 03:48:27.85685+00	4	Vladimir Rocabado	1	Añadido.	9	1
4	2017-11-17 03:50:11.322309+00	5	Pamela Maialen	1	Añadido.	9	1
5	2017-11-17 03:53:53.558702+00	6	Esmeralda Espronceda	1	Añadido.	9	1
6	2017-11-17 03:57:41.105397+00	7	Luisa Sevillano	1	Añadido.	9	1
7	2017-11-17 03:59:31.199119+00	8	Samael Ruiz	1	Añadido.	9	1
8	2017-11-17 04:01:36.473692+00	9	David Belmont	1	Añadido.	9	1
9	2017-11-17 04:04:49.474786+00	1	Davivienda Golf Tour	1	Añadido.	8	1
10	2017-11-17 04:13:13.733039+00	2	Sóftbol para niños	1	Añadido.	8	1
11	2017-11-17 04:14:45.248058+00	3	Danza Contemporánea	1	Añadido.	8	1
12	2017-11-17 05:47:39.894612+00	9	David Belmont	3		9	1
13	2017-11-17 05:47:39.903019+00	8	Samael Ruiz	3		9	1
14	2017-11-17 05:47:39.906405+00	7	Luisa Sevillano	3		9	1
15	2017-11-17 05:47:39.908254+00	6	Esmeralda Espronceda	3		9	1
16	2017-11-17 05:47:39.911567+00	5	Pamela Maialen	3		9	1
17	2017-11-17 05:47:39.914327+00	4	Vladimir Rocabado	3		9	1
18	2017-11-17 05:47:39.91617+00	3	Pablo Astiazaran	3		9	1
19	2017-11-17 05:47:39.919933+00	2	Edward Buckley	3		9	1
20	2017-11-17 05:51:35.501195+00	10	Alejandro Mejia	1	Añadido.	9	1
21	2017-11-17 06:13:22.005565+00	10	Alejandro Mejia	3		9	1
22	2017-11-17 06:16:54.964327+00	11	Alejandro Mejia	1	Añadido.	9	1
23	2017-11-17 06:30:37.885078+00	11	Operador	2	Modificado/a is_staff.	3	1
24	2017-11-17 06:43:07.198014+00	11	Operador	2	Modificado/a is_superuser.	3	1
25	2017-11-17 06:45:12.894113+00	12	Miguel lerma	1	Añadido.	9	1
26	2017-11-17 06:48:17.822429+00	13	Derly Garzon	1	Añadido.	9	1
27	2017-11-17 06:50:17.831593+00	14	Jessica lorena	1	Añadido.	9	1
28	2017-11-17 07:44:29.89325+00	15	Alejandro Garzon	1	Añadido.	9	1
29	2017-11-17 07:52:34.347536+00	16	Operador2	1	Añadido.	3	1
30	2017-11-17 07:53:15.997519+00	16	Operador2	2	Modificado/a first_name,is_staff,is_superuser y last_login.	3	1
37	2017-11-17 08:14:30.511108+00	17	Operador	1	Añadido.	3	1
38	2017-11-17 08:14:54.292006+00	17	Operador	2	Modificado/a is_staff,is_superuser y last_login.	3	1
39	2017-11-17 08:15:33.316922+00	18	Gerente	1	Añadido.	3	1
40	2017-11-17 08:15:51.650559+00	18	Gerente	2	Modificado/a is_staff,is_superuser y last_login.	3	1
41	2017-11-17 08:16:22.784195+00	19	Administrador	1	Añadido.	3	1
42	2017-11-17 08:16:46.653327+00	19	Administrador	2	Modificado/a is_staff,is_superuser y last_login.	3	1
43	2017-11-17 08:17:43.862836+00	20	Participante	1	Añadido.	3	1
44	2017-11-17 08:18:03.139547+00	20	Participante	2	Modificado/a is_staff,is_superuser y last_login.	3	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 44, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	user
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	deporte	noticia
8	deporte	evento
9	deporte	usuario
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_content_type_id_seq', 9, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-11-17 01:51:53.800176+00
2	auth	0001_initial	2017-11-17 01:51:53.911034+00
3	admin	0001_initial	2017-11-17 01:51:53.948048+00
4	admin	0002_logentry_remove_auto_add	2017-11-17 01:51:53.967107+00
5	contenttypes	0002_remove_content_type_name	2017-11-17 01:51:54.024135+00
6	auth	0002_alter_permission_name_max_length	2017-11-17 01:51:54.034076+00
7	auth	0003_alter_user_email_max_length	2017-11-17 01:51:54.051926+00
8	auth	0004_alter_user_username_opts	2017-11-17 01:51:54.063524+00
9	auth	0005_alter_user_last_login_null	2017-11-17 01:51:54.07877+00
10	auth	0006_require_contenttypes_0002	2017-11-17 01:51:54.081997+00
11	auth	0007_alter_validators_add_error_messages	2017-11-17 01:51:54.094662+00
12	auth	0008_alter_user_username_max_length	2017-11-17 01:51:54.10874+00
13	deporte	0001_initial	2017-11-17 01:51:54.153959+00
14	sessions	0001_initial	2017-11-17 01:51:54.17931+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_migrations_id_seq', 14, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
7r12e0elwe79hcee36yrjrfxy3tm44t7	YzBkZWRiZDhlODI1Y2IxZWRkNGEyNjM5YjM5MTFkMmUzNWU2NTc0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-12-01 03:43:35.24821+00
n3azih2o0gxd1xsfyalhlli3pckvor24	NTY1ZDhlNGQ1YTAwY2YyNTBiZWU4MGMwOWQ2M2Y5OWZmOTEwZjZmOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-12-01 05:55:35.887938+00
9mis6powe7nz2n3llueo5jqsepsufhyd	NTY1ZDhlNGQ1YTAwY2YyNTBiZWU4MGMwOWQ2M2Y5OWZmOTEwZjZmOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-12-01 05:55:52.688498+00
zhmlxziyph207ss7g0ex5wys5khqohvg	NTY1ZDhlNGQ1YTAwY2YyNTBiZWU4MGMwOWQ2M2Y5OWZmOTEwZjZmOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-12-01 05:56:23.883997+00
yuq4kdf6qob0mtff4kr3boj45565knac	NTY1ZDhlNGQ1YTAwY2YyNTBiZWU4MGMwOWQ2M2Y5OWZmOTEwZjZmOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-12-01 05:56:42.252637+00
skfyit2r61khfn9lu86y9g7xe32vfj8h	YzBkZWRiZDhlODI1Y2IxZWRkNGEyNjM5YjM5MTFkMmUzNWU2NTc0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-12-01 06:24:20.094663+00
693nuwxuabuz2kiyu6744nimvkcbqrtx	YzBkZWRiZDhlODI1Y2IxZWRkNGEyNjM5YjM5MTFkMmUzNWU2NTc0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-12-01 06:32:12.937478+00
96e37e4eymqivsh8aj9voeziywjddatp	YzBkZWRiZDhlODI1Y2IxZWRkNGEyNjM5YjM5MTFkMmUzNWU2NTc0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-12-01 06:32:31.689685+00
hayfv9t9jkrg2dkputzfzjvd0ttalai0	YzBkZWRiZDhlODI1Y2IxZWRkNGEyNjM5YjM5MTFkMmUzNWU2NTc0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-12-01 06:32:43.891404+00
mxru8dia3j2zqf1ei7qbesz6iuuuhfcd	YzBkZWRiZDhlODI1Y2IxZWRkNGEyNjM5YjM5MTFkMmUzNWU2NTc0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-12-01 06:33:29.162541+00
28u776o7pgnp2tavtx76uzz4ozhn0prm	YzBkZWRiZDhlODI1Y2IxZWRkNGEyNjM5YjM5MTFkMmUzNWU2NTc0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-12-01 06:34:13.294304+00
p8l3ql7oe2bs6gjhhacnkvqvi4jbosub	MGZhYzZhYzFlYjFmYjg5YzA0NTYxMmI2Y2ExNjcyMDllMjNkMWM1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWY0MGU3OWYxMDczYzI5ZGU3MzE5OTEyYThjYTExYTg3OWRhZjUyIn0=	2017-12-01 06:35:06.747735+00
9btrfho9094omwp0p5ik4kr7fnegb9pd	MGZhYzZhYzFlYjFmYjg5YzA0NTYxMmI2Y2ExNjcyMDllMjNkMWM1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWY0MGU3OWYxMDczYzI5ZGU3MzE5OTEyYThjYTExYTg3OWRhZjUyIn0=	2017-12-01 06:35:40.287366+00
vtdn92v0hyt9m5ta9xd5c6ob9s3thy3r	ZWNlZGVjNzZiYjYyNDExZjRjZTEzZThiZThiYTY1ZTBmYTNlNzgzNTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc5ZjQwZTc5ZjEwNzNjMjlkZTczMTk5MTJhOGNhMTFhODc5ZGFmNTIiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-12-01 06:36:42.723433+00
l9r4u8n701ond6c5icmowrb5meeb0xsc	ZWNlZGVjNzZiYjYyNDExZjRjZTEzZThiZThiYTY1ZTBmYTNlNzgzNTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc5ZjQwZTc5ZjEwNzNjMjlkZTczMTk5MTJhOGNhMTFhODc5ZGFmNTIiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-12-01 06:37:50.890457+00
i9xbg1s10u029oev2dalbsrjsnmhehsh	NTY1ZDhlNGQ1YTAwY2YyNTBiZWU4MGMwOWQ2M2Y5OWZmOTEwZjZmOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-12-01 06:52:52.866557+00
8ta2h6yokd5dk9bcomj7bso12fompqve	NTY1ZDhlNGQ1YTAwY2YyNTBiZWU4MGMwOWQ2M2Y5OWZmOTEwZjZmOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-12-01 06:54:53.090621+00
1fdimz9w7osk3irpfyvxrjr0d3bmtgln	NTY1ZDhlNGQ1YTAwY2YyNTBiZWU4MGMwOWQ2M2Y5OWZmOTEwZjZmOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-12-01 06:55:28.116651+00
qy2ucf7a47l7ec15p16gfcpmvtis897h	MGZhYzZhYzFlYjFmYjg5YzA0NTYxMmI2Y2ExNjcyMDllMjNkMWM1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWY0MGU3OWYxMDczYzI5ZGU3MzE5OTEyYThjYTExYTg3OWRhZjUyIn0=	2017-12-01 06:57:14.694046+00
s06rehg0g6hmn31vajcr8fixpafzz5e4	NTY1ZDhlNGQ1YTAwY2YyNTBiZWU4MGMwOWQ2M2Y5OWZmOTEwZjZmOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-12-01 07:09:51.238523+00
e7fti9k8cvoq1vlypop6ohlxyyxrl2bo	NTY1ZDhlNGQ1YTAwY2YyNTBiZWU4MGMwOWQ2M2Y5OWZmOTEwZjZmOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-12-01 07:15:45.295007+00
d56lhnpebevwfui80g5yruadv6qf567p	YWE3NWJkYmVlNzZjYzRhNjZiYmNiYTI3MmUzZWEyOGY2NDAxYjc1NTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI3OWY0MGU3OWYxMDczYzI5ZGU3MzE5OTEyYThjYTExYTg3OWRhZjUyIn0=	2017-12-01 07:17:57.144195+00
zg5424z4i976qxbxwo8aarjk30xiaong	YWE3NWJkYmVlNzZjYzRhNjZiYmNiYTI3MmUzZWEyOGY2NDAxYjc1NTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI3OWY0MGU3OWYxMDczYzI5ZGU3MzE5OTEyYThjYTExYTg3OWRhZjUyIn0=	2017-12-01 07:21:03.284677+00
hhv1laqy67t35hmbimu2z2qiqsg46y6q	NTY1ZDhlNGQ1YTAwY2YyNTBiZWU4MGMwOWQ2M2Y5OWZmOTEwZjZmOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-12-01 07:29:15.879552+00
v173c5b359ra492icd26knu7nzr95n5z	NTY1ZDhlNGQ1YTAwY2YyNTBiZWU4MGMwOWQ2M2Y5OWZmOTEwZjZmOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-12-01 07:29:59.095018+00
x6y428eyy41kc0b6jjrf38h9nb8fffw7	NTY1ZDhlNGQ1YTAwY2YyNTBiZWU4MGMwOWQ2M2Y5OWZmOTEwZjZmOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmNDBlNzlmMTA3M2MyOWRlNzMxOTkxMmE4Y2ExMWE4NzlkYWY1MiIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-12-01 07:30:47.53288+00
iu9xpepon41n3ca3nopa6mc0zt3fsel3	MWQ0ZDlhODkxNTNhMmMyZjRlNDcyYmM5NjNiNzM2YTA3ODk1NjYyNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5NDZmY2MxOWYzNzg3OTgxYjM2NTVmNGYyYjI0NmY5ZTllNDhhY2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOCJ9	2017-12-01 08:21:21.693826+00
yk70dgy8epkheh8urcq695xgeo7urstb	MTQwZjNmYzM2ZDUyNDYwZDIxMTNhMzJmNDE2MTE0M2M5NzEyYWJiMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmEyNDE1N2VmOGI1OWE1OThlYmExMmJiYWIyNWY0ZDZhZGJjYmJhMCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9	2017-12-01 08:37:37.094898+00
8zthcrfq81zbubc4jo2dy8i8lm5zsjfy	YWE3NWJkYmVlNzZjYzRhNjZiYmNiYTI3MmUzZWEyOGY2NDAxYjc1NTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI3OWY0MGU3OWYxMDczYzI5ZGU3MzE5OTEyYThjYTExYTg3OWRhZjUyIn0=	2017-12-13 01:51:33.58235+00
ncq1itlwvl5vn0c19fokcdzdrqpfjcwh	MWYxNjEyOTk5ODUzZTAwY2IxZGE4NDc0NzFmMWZkZjBmNWMxNWViYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIwIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDY2MjM0ZjA5YmM0MDBkMjkwYTFjYWNiZjhmMjkzZDc2ZWVlYWY3ZCJ9	2017-12-13 02:01:18.576078+00
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: deporte_evento_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY deporte_evento
    ADD CONSTRAINT deporte_evento_pkey PRIMARY KEY (id);


--
-- Name: deporte_noticia_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY deporte_noticia
    ADD CONSTRAINT deporte_noticia_pkey PRIMARY KEY (id);


--
-- Name: deporte_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY deporte_usuario
    ADD CONSTRAINT deporte_usuario_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: deporte_usuario_user_ptr_id_345015ac_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY deporte_usuario
    ADD CONSTRAINT deporte_usuario_user_ptr_id_345015ac_fk_auth_user_id FOREIGN KEY (user_ptr_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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

