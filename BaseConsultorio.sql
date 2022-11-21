PGDMP          !            
    z            consultorio    14.5    14.5 /               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    16555    consultorio    DATABASE     h   CREATE DATABASE consultorio WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE consultorio;
                postgres    false            !           0    0    DATABASE consultorio    ACL     0   GRANT ALL ON DATABASE consultorio TO visitante;
                   postgres    false    3360            �            1259    16564    cita    TABLE     l   CREATE TABLE public.cita (
    id_cita integer NOT NULL,
    fecha date,
    hora time without time zone
);
    DROP TABLE public.cita;
       public         heap    postgres    false            �            1259    16563    cita_id_cita_seq    SEQUENCE     �   CREATE SEQUENCE public.cita_id_cita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.cita_id_cita_seq;
       public          postgres    false    212            "           0    0    cita_id_cita_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.cita_id_cita_seq OWNED BY public.cita.id_cita;
          public          postgres    false    211            �            1259    16571    diagnostico    TABLE     �   CREATE TABLE public.diagnostico (
    id_diagnostico integer NOT NULL,
    sintoma character varying(80),
    nom_enfermedad character varying(50),
    tipo_enfermedad character varying(50),
    etapa_enefermedad character varying(30)
);
    DROP TABLE public.diagnostico;
       public         heap    postgres    false            �            1259    16570    diagnostico_id_diagnostico_seq    SEQUENCE     �   CREATE SEQUENCE public.diagnostico_id_diagnostico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.diagnostico_id_diagnostico_seq;
       public          postgres    false    214            #           0    0    diagnostico_id_diagnostico_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.diagnostico_id_diagnostico_seq OWNED BY public.diagnostico.id_diagnostico;
          public          postgres    false    213            �            1259    16626 	   historial    TABLE     �   CREATE TABLE public.historial (
    id_historial integer NOT NULL,
    fecha_actualizada date,
    medicamentos character varying(50),
    enfermedades character varying(50),
    estado_salud character varying(20)
);
    DROP TABLE public.historial;
       public         heap    postgres    false            �            1259    16625    historial_id_historial_seq    SEQUENCE     �   CREATE SEQUENCE public.historial_id_historial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.historial_id_historial_seq;
       public          postgres    false    218            $           0    0    historial_id_historial_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.historial_id_historial_seq OWNED BY public.historial.id_historial;
          public          postgres    false    217            �            1259    16557    medicamentos    TABLE     �   CREATE TABLE public.medicamentos (
    id_medicamento integer NOT NULL,
    nom_medicamento character varying(50),
    presentacon character varying(30),
    dosis character varying(30),
    tiempo_suministro character varying(20)
);
     DROP TABLE public.medicamentos;
       public         heap    postgres    false            �            1259    16556    medicamentos_id_medicamento_seq    SEQUENCE     �   CREATE SEQUENCE public.medicamentos_id_medicamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.medicamentos_id_medicamento_seq;
       public          postgres    false    210            %           0    0    medicamentos_id_medicamento_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.medicamentos_id_medicamento_seq OWNED BY public.medicamentos.id_medicamento;
          public          postgres    false    209            �            1259    16609 	   pacientes    TABLE     2  CREATE TABLE public.pacientes (
    id_paciente integer NOT NULL,
    nombre character varying(30),
    apellido_paterno character varying(30),
    apellido_materno character varying(30),
    genero character(1),
    edad integer,
    telefono character varying(10),
    direccion character varying(50)
);
    DROP TABLE public.pacientes;
       public         heap    postgres    false            �            1259    16608    pacientes_id_paciente_seq    SEQUENCE     �   CREATE SEQUENCE public.pacientes_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pacientes_id_paciente_seq;
       public          postgres    false    216            &           0    0    pacientes_id_paciente_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.pacientes_id_paciente_seq OWNED BY public.pacientes.id_paciente;
          public          postgres    false    215            q           2604    16567    cita id_cita    DEFAULT     l   ALTER TABLE ONLY public.cita ALTER COLUMN id_cita SET DEFAULT nextval('public.cita_id_cita_seq'::regclass);
 ;   ALTER TABLE public.cita ALTER COLUMN id_cita DROP DEFAULT;
       public          postgres    false    211    212    212            r           2604    16574    diagnostico id_diagnostico    DEFAULT     �   ALTER TABLE ONLY public.diagnostico ALTER COLUMN id_diagnostico SET DEFAULT nextval('public.diagnostico_id_diagnostico_seq'::regclass);
 I   ALTER TABLE public.diagnostico ALTER COLUMN id_diagnostico DROP DEFAULT;
       public          postgres    false    213    214    214            t           2604    16629    historial id_historial    DEFAULT     �   ALTER TABLE ONLY public.historial ALTER COLUMN id_historial SET DEFAULT nextval('public.historial_id_historial_seq'::regclass);
 E   ALTER TABLE public.historial ALTER COLUMN id_historial DROP DEFAULT;
       public          postgres    false    218    217    218            p           2604    16560    medicamentos id_medicamento    DEFAULT     �   ALTER TABLE ONLY public.medicamentos ALTER COLUMN id_medicamento SET DEFAULT nextval('public.medicamentos_id_medicamento_seq'::regclass);
 J   ALTER TABLE public.medicamentos ALTER COLUMN id_medicamento DROP DEFAULT;
       public          postgres    false    209    210    210            s           2604    16612    pacientes id_paciente    DEFAULT     ~   ALTER TABLE ONLY public.pacientes ALTER COLUMN id_paciente SET DEFAULT nextval('public.pacientes_id_paciente_seq'::regclass);
 D   ALTER TABLE public.pacientes ALTER COLUMN id_paciente DROP DEFAULT;
       public          postgres    false    216    215    216                      0    16564    cita 
   TABLE DATA           4   COPY public.cita (id_cita, fecha, hora) FROM stdin;
    public          postgres    false    212   v9                 0    16571    diagnostico 
   TABLE DATA           r   COPY public.diagnostico (id_diagnostico, sintoma, nom_enfermedad, tipo_enfermedad, etapa_enefermedad) FROM stdin;
    public          postgres    false    214   �9                 0    16626 	   historial 
   TABLE DATA           n   COPY public.historial (id_historial, fecha_actualizada, medicamentos, enfermedades, estado_salud) FROM stdin;
    public          postgres    false    218   �9                 0    16557    medicamentos 
   TABLE DATA           n   COPY public.medicamentos (id_medicamento, nom_medicamento, presentacon, dosis, tiempo_suministro) FROM stdin;
    public          postgres    false    210   �9                 0    16609 	   pacientes 
   TABLE DATA              COPY public.pacientes (id_paciente, nombre, apellido_paterno, apellido_materno, genero, edad, telefono, direccion) FROM stdin;
    public          postgres    false    216    :       '           0    0    cita_id_cita_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.cita_id_cita_seq', 5, true);
          public          postgres    false    211            (           0    0    diagnostico_id_diagnostico_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.diagnostico_id_diagnostico_seq', 1, false);
          public          postgres    false    213            )           0    0    historial_id_historial_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.historial_id_historial_seq', 1, false);
          public          postgres    false    217            *           0    0    medicamentos_id_medicamento_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.medicamentos_id_medicamento_seq', 1, false);
          public          postgres    false    209            +           0    0    pacientes_id_paciente_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.pacientes_id_paciente_seq', 1, false);
          public          postgres    false    215            x           2606    16569    cita cita_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT cita_pkey PRIMARY KEY (id_cita);
 8   ALTER TABLE ONLY public.cita DROP CONSTRAINT cita_pkey;
       public            postgres    false    212            z           2606    16576    diagnostico diagnostico_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT diagnostico_pkey PRIMARY KEY (id_diagnostico);
 F   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT diagnostico_pkey;
       public            postgres    false    214            ~           2606    16631    historial historial_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.historial
    ADD CONSTRAINT historial_pkey PRIMARY KEY (id_historial);
 B   ALTER TABLE ONLY public.historial DROP CONSTRAINT historial_pkey;
       public            postgres    false    218            v           2606    16562    medicamentos medicamentos_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT medicamentos_pkey PRIMARY KEY (id_medicamento);
 H   ALTER TABLE ONLY public.medicamentos DROP CONSTRAINT medicamentos_pkey;
       public            postgres    false    210            |           2606    16614    pacientes pacientes_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id_paciente);
 B   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_pkey;
       public            postgres    false    216            �           2606    16615    cita fk_cita_id_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT fk_cita_id_paciente FOREIGN KEY (id_cita) REFERENCES public.pacientes(id_paciente) NOT VALID;
 B   ALTER TABLE ONLY public.cita DROP CONSTRAINT fk_cita_id_paciente;
       public          postgres    false    216    212    3196            �           2606    16598 "   diagnostico fk_diagnostico_id_cita    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT fk_diagnostico_id_cita FOREIGN KEY (id_diagnostico) REFERENCES public.cita(id_cita) NOT VALID;
 L   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT fk_diagnostico_id_cita;
       public          postgres    false    212    214    3192            �           2606    16620 &   diagnostico fk_diagnostico_id_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT fk_diagnostico_id_paciente FOREIGN KEY (id_diagnostico) REFERENCES public.pacientes(id_paciente) NOT VALID;
 P   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT fk_diagnostico_id_paciente;
       public          postgres    false    3196    214    216            �           2606    16642 %   historial fk_historial_id_diagnostico    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial
    ADD CONSTRAINT fk_historial_id_diagnostico FOREIGN KEY (id_historial) REFERENCES public.diagnostico(id_diagnostico) NOT VALID;
 O   ALTER TABLE ONLY public.historial DROP CONSTRAINT fk_historial_id_diagnostico;
       public          postgres    false    218    3194    214            �           2606    16637 %   historial fk_historial_id_medicamento    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial
    ADD CONSTRAINT fk_historial_id_medicamento FOREIGN KEY (id_historial) REFERENCES public.medicamentos(id_medicamento) NOT VALID;
 O   ALTER TABLE ONLY public.historial DROP CONSTRAINT fk_historial_id_medicamento;
       public          postgres    false    218    3190    210            �           2606    16632 "   historial fk_historial_id_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial
    ADD CONSTRAINT fk_historial_id_paciente FOREIGN KEY (id_historial) REFERENCES public.pacientes(id_paciente) NOT VALID;
 L   ALTER TABLE ONLY public.historial DROP CONSTRAINT fk_historial_id_paciente;
       public          postgres    false    216    218    3196                       2606    16603 *   medicamentos fk_medicamento_id_diagnostico    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT fk_medicamento_id_diagnostico FOREIGN KEY (id_medicamento) REFERENCES public.diagnostico(id_diagnostico) NOT VALID;
 T   ALTER TABLE ONLY public.medicamentos DROP CONSTRAINT fk_medicamento_id_diagnostico;
       public          postgres    false    214    210    3194               #   x�3�4202�54�52�44�26�20������ B+}            x������ � �            x������ � �            x������ � �            x������ � �     