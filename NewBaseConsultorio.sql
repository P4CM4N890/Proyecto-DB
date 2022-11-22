PGDMP                     
    z            Consultorio    14.5    14.5 *    '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            (           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            )           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            *           1262    16802    Consultorio    DATABASE     j   CREATE DATABASE "Consultorio" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE "Consultorio";
                postgres    false            �            1255    16878    pa_eliminados()    FUNCTION     �  CREATE FUNCTION public.pa_eliminados() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
     insert into pacientes_eliminados(ID_paciente, Nombre,
									  Apellido_paterno,
									  Apellido_materno,
									  Genero, Edad,
									  Telefono, Direccion)
	values (old.id_paciente, old.nombre, old.apellido_paterno,
			old.apellido_materno, old.genero, old.edad, old.telefono, 
			old.direccion);
	 return null;
End;
$$;
 &   DROP FUNCTION public.pa_eliminados();
       public          postgres    false            �            1255    16883    pa_sin_actualizar()    FUNCTION     �  CREATE FUNCTION public.pa_sin_actualizar() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
     insert into pacientes_copiaUp(ID_paciente, Nombre,
									  Apellido_paterno,
									  Apellido_materno,
									  Genero, Edad,
									  Telefono, Direccion)
	values (old.id_paciente, old.nombre, old.apellido_paterno,
			old.apellido_materno, old.genero, old.edad, old.telefono, 
			old.direccion);
	 return null;
End;
$$;
 *   DROP FUNCTION public.pa_sin_actualizar();
       public          postgres    false            �            1259    16830    cita    TABLE     l   CREATE TABLE public.cita (
    id_cita integer NOT NULL,
    fecha date,
    hora time without time zone
);
    DROP TABLE public.cita;
       public         heap    postgres    false            �            1259    16810    diagnostico    TABLE     �   CREATE TABLE public.diagnostico (
    id_diagnostico integer NOT NULL,
    sintoma character varying(50),
    nom_enfermedad character varying(50),
    tipo_enfermedad character varying(30),
    etapa_enfermedad character varying(25)
);
    DROP TABLE public.diagnostico;
       public         heap    postgres    false            �            1259    16820 	   historial    TABLE     �   CREATE TABLE public.historial (
    id_historial integer NOT NULL,
    nom_medicamentos character varying(50),
    nom_enfermedades character varying(50),
    estado_salud character varying(30)
);
    DROP TABLE public.historial;
       public         heap    postgres    false            �            1259    16825 
   inventario    TABLE     �   CREATE TABLE public.inventario (
    id_inventario integer NOT NULL,
    nom_medicina character varying(50),
    cantidad integer
);
    DROP TABLE public.inventario;
       public         heap    postgres    false            �            1259    16815    medicamentos    TABLE     �   CREATE TABLE public.medicamentos (
    id_medicamento integer NOT NULL,
    nom_medicamento character varying(50),
    presentacion character varying(30),
    dosis character varying(30),
    tiempo_suministro character varying(30)
);
     DROP TABLE public.medicamentos;
       public         heap    postgres    false            �            1259    16804 	   pacientes    TABLE     2  CREATE TABLE public.pacientes (
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
       public         heap    postgres    false            �            1259    16880    pacientes_copiaup    TABLE     1  CREATE TABLE public.pacientes_copiaup (
    id_paciente integer,
    nombre character varying(30),
    apellido_paterno character varying(30),
    apellido_materno character varying(30),
    genero character(1),
    edad integer,
    telefono character varying(10),
    direccion character varying(50)
);
 %   DROP TABLE public.pacientes_copiaup;
       public         heap    postgres    false            �            1259    16875    pacientes_eliminados    TABLE     4  CREATE TABLE public.pacientes_eliminados (
    id_paciente integer,
    nombre character varying(30),
    apellido_paterno character varying(30),
    apellido_materno character varying(30),
    genero character(1),
    edad integer,
    telefono character varying(10),
    direccion character varying(50)
);
 (   DROP TABLE public.pacientes_eliminados;
       public         heap    postgres    false            �            1259    16803    pacientes_id_paciente_seq    SEQUENCE     �   CREATE SEQUENCE public.pacientes_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pacientes_id_paciente_seq;
       public          postgres    false    210            +           0    0    pacientes_id_paciente_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.pacientes_id_paciente_seq OWNED BY public.pacientes.id_paciente;
          public          postgres    false    209            z           2604    16807    pacientes id_paciente    DEFAULT     ~   ALTER TABLE ONLY public.pacientes ALTER COLUMN id_paciente SET DEFAULT nextval('public.pacientes_id_paciente_seq'::regclass);
 D   ALTER TABLE public.pacientes ALTER COLUMN id_paciente DROP DEFAULT;
       public          postgres    false    209    210    210            "          0    16830    cita 
   TABLE DATA           4   COPY public.cita (id_cita, fecha, hora) FROM stdin;
    public          postgres    false    215   �8                 0    16810    diagnostico 
   TABLE DATA           q   COPY public.diagnostico (id_diagnostico, sintoma, nom_enfermedad, tipo_enfermedad, etapa_enfermedad) FROM stdin;
    public          postgres    false    211   9                  0    16820 	   historial 
   TABLE DATA           c   COPY public.historial (id_historial, nom_medicamentos, nom_enfermedades, estado_salud) FROM stdin;
    public          postgres    false    213   -9       !          0    16825 
   inventario 
   TABLE DATA           K   COPY public.inventario (id_inventario, nom_medicina, cantidad) FROM stdin;
    public          postgres    false    214   J9                 0    16815    medicamentos 
   TABLE DATA           o   COPY public.medicamentos (id_medicamento, nom_medicamento, presentacion, dosis, tiempo_suministro) FROM stdin;
    public          postgres    false    212   g9                 0    16804 	   pacientes 
   TABLE DATA              COPY public.pacientes (id_paciente, nombre, apellido_paterno, apellido_materno, genero, edad, telefono, direccion) FROM stdin;
    public          postgres    false    210   �9       $          0    16880    pacientes_copiaup 
   TABLE DATA           �   COPY public.pacientes_copiaup (id_paciente, nombre, apellido_paterno, apellido_materno, genero, edad, telefono, direccion) FROM stdin;
    public          postgres    false    217   �9       #          0    16875    pacientes_eliminados 
   TABLE DATA           �   COPY public.pacientes_eliminados (id_paciente, nombre, apellido_paterno, apellido_materno, genero, edad, telefono, direccion) FROM stdin;
    public          postgres    false    216   
:       ,           0    0    pacientes_id_paciente_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.pacientes_id_paciente_seq', 2, true);
          public          postgres    false    209            �           2606    16834    cita cita_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT cita_pkey PRIMARY KEY (id_cita);
 8   ALTER TABLE ONLY public.cita DROP CONSTRAINT cita_pkey;
       public            postgres    false    215            ~           2606    16814    diagnostico diagnostico_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT diagnostico_pkey PRIMARY KEY (id_diagnostico);
 F   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT diagnostico_pkey;
       public            postgres    false    211            �           2606    16824    historial historial_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.historial
    ADD CONSTRAINT historial_pkey PRIMARY KEY (id_historial);
 B   ALTER TABLE ONLY public.historial DROP CONSTRAINT historial_pkey;
       public            postgres    false    213            �           2606    16829    inventario inventario_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id_inventario);
 D   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_pkey;
       public            postgres    false    214            �           2606    16819    medicamentos medicamentos_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT medicamentos_pkey PRIMARY KEY (id_medicamento);
 H   ALTER TABLE ONLY public.medicamentos DROP CONSTRAINT medicamentos_pkey;
       public            postgres    false    212            |           2606    16809    pacientes pacientes_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id_paciente);
 B   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_pkey;
       public            postgres    false    210            �           2620    16879     pacientes trigger_pac_eliminados    TRIGGER     }   CREATE TRIGGER trigger_pac_eliminados AFTER DELETE ON public.pacientes FOR EACH ROW EXECUTE FUNCTION public.pa_eliminados();
 9   DROP TRIGGER trigger_pac_eliminados ON public.pacientes;
       public          postgres    false    218    210            �           2620    16884 $   pacientes trigger_pac_sin_actualizar    TRIGGER     �   CREATE TRIGGER trigger_pac_sin_actualizar AFTER UPDATE ON public.pacientes FOR EACH ROW EXECUTE FUNCTION public.pa_sin_actualizar();
 =   DROP TRIGGER trigger_pac_sin_actualizar ON public.pacientes;
       public          postgres    false    219    210            �           2606    16835    cita fk_idCita_idPaciente    FK CONSTRAINT     �   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT "fk_idCita_idPaciente" FOREIGN KEY (id_cita) REFERENCES public.pacientes(id_paciente) NOT VALID;
 E   ALTER TABLE ONLY public.cita DROP CONSTRAINT "fk_idCita_idPaciente";
       public          postgres    false    215    3196    210            �           2606    16845 #   diagnostico fk_idDiagnostico_idCita    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT "fk_idDiagnostico_idCita" FOREIGN KEY (id_diagnostico) REFERENCES public.cita(id_cita) NOT VALID;
 O   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT "fk_idDiagnostico_idCita";
       public          postgres    false    215    211    3206            �           2606    16840 '   diagnostico fk_idDiagnostico_idPaciente    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT "fk_idDiagnostico_idPaciente" FOREIGN KEY (id_diagnostico) REFERENCES public.pacientes(id_paciente) NOT VALID;
 S   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT "fk_idDiagnostico_idPaciente";
       public          postgres    false    3196    211    210            �           2606    16860 &   historial fk_idHistorial_idDiagnostico    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial
    ADD CONSTRAINT "fk_idHistorial_idDiagnostico" FOREIGN KEY (id_historial) REFERENCES public.diagnostico(id_diagnostico) NOT VALID;
 R   ALTER TABLE ONLY public.historial DROP CONSTRAINT "fk_idHistorial_idDiagnostico";
       public          postgres    false    213    3198    211            �           2606    16865 &   historial fk_idHistorial_idMedicamento    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial
    ADD CONSTRAINT "fk_idHistorial_idMedicamento" FOREIGN KEY (id_historial) REFERENCES public.medicamentos(id_medicamento) NOT VALID;
 R   ALTER TABLE ONLY public.historial DROP CONSTRAINT "fk_idHistorial_idMedicamento";
       public          postgres    false    213    3200    212            �           2606    16855 #   historial fk_idHistorial_idPaciente    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial
    ADD CONSTRAINT "fk_idHistorial_idPaciente" FOREIGN KEY (id_historial) REFERENCES public.pacientes(id_paciente) NOT VALID;
 O   ALTER TABLE ONLY public.historial DROP CONSTRAINT "fk_idHistorial_idPaciente";
       public          postgres    false    213    3196    210            �           2606    16870 (   inventario fk_idInventario_idMedicamento    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT "fk_idInventario_idMedicamento" FOREIGN KEY (id_inventario) REFERENCES public.medicamentos(id_medicamento) NOT VALID;
 T   ALTER TABLE ONLY public.inventario DROP CONSTRAINT "fk_idInventario_idMedicamento";
       public          postgres    false    3200    214    212            �           2606    16850 +   medicamentos fk_idMedicamento_idDiagnostico    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT "fk_idMedicamento_idDiagnostico" FOREIGN KEY (id_medicamento) REFERENCES public.diagnostico(id_diagnostico) NOT VALID;
 W   ALTER TABLE ONLY public.medicamentos DROP CONSTRAINT "fk_idMedicamento_idDiagnostico";
       public          postgres    false    212    3198    211            "   !   x�3�4202�54�56�44�20 "�=... A\r            x������ � �             x������ � �      !      x������ � �            x������ � �         Y   x�3��(M����/H��t����fƜ�p�鑙�����`ha�e��U����ZT�����`d
�`hhddllbR������� ,}`      $      x������ � �      #      x������ � �     