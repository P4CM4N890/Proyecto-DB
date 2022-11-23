PGDMP     0    "            
    z            consultorio    14.5    14.5 -    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    40987    consultorio    DATABASE     h   CREATE DATABASE consultorio WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE consultorio;
             	   visitante    false            ,           0    0    DATABASE consultorio    ACL     �   REVOKE CONNECT,TEMPORARY ON DATABASE consultorio FROM PUBLIC;
REVOKE ALL ON DATABASE consultorio FROM visitante;
GRANT ALL ON DATABASE consultorio TO visitante WITH GRANT OPTION;
GRANT ALL ON DATABASE consultorio TO PUBLIC;
                	   visitante    false    3371            �            1255    57455    pa_eliminados()    FUNCTION     �  CREATE FUNCTION public.pa_eliminados() RETURNS trigger
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
       public          postgres    false            �            1255    57456    pa_sin_actualizar()    FUNCTION     �  CREATE FUNCTION public.pa_sin_actualizar() RETURNS trigger
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
       public          postgres    false            �            1255    41005    registro_p()    FUNCTION     �   CREATE FUNCTION public.registro_p() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	insert into fecha_registro(id_paciente, fecha)
	values (new.id_paciente, now());
	return null;
end;
$$;
 #   DROP FUNCTION public.registro_p();
       public          postgres    false            -           0    0    FUNCTION registro_p()    ACL     8   GRANT ALL ON FUNCTION public.registro_p() TO visitante;
          public          postgres    false    218            �            1259    57512    cita    TABLE     l   CREATE TABLE public.cita (
    id_cita integer NOT NULL,
    fecha date,
    hora time without time zone
);
    DROP TABLE public.cita;
       public         heap 	   visitante    false            �            1259    57515    diagnostico    TABLE     �   CREATE TABLE public.diagnostico (
    id_diagnostico integer NOT NULL,
    sintoma character varying(50),
    nom_enfermedad character varying(50),
    tipo_enfermedad character varying(30),
    etapa_enfermedad character varying(25)
);
    DROP TABLE public.diagnostico;
       public         heap 	   visitante    false            �            1259    57518 	   historial    TABLE     �   CREATE TABLE public.historial (
    id_historial integer NOT NULL,
    nom_medicamentos character varying(50),
    nom_enfermedades character varying(50),
    estado_salud character varying(30)
);
    DROP TABLE public.historial;
       public         heap 	   visitante    false            �            1259    57457 
   inventario    TABLE     �   CREATE TABLE public.inventario (
    id_inventario integer NOT NULL,
    nom_medicina character varying(50),
    cantidad integer
);
    DROP TABLE public.inventario;
       public         heap 	   visitante    false            �            1259    57521    medicamentos    TABLE     �   CREATE TABLE public.medicamentos (
    id_medicamento integer NOT NULL,
    nom_medicamento character varying(50),
    presentacion character varying(30),
    dosis character varying(30),
    tiempo_suministro character varying(30)
);
     DROP TABLE public.medicamentos;
       public         heap 	   visitante    false            �            1259    57524 	   pacientes    TABLE     ?  CREATE TABLE public.pacientes (
    id_paciente integer NOT NULL,
    nombre character varying(30),
    apellido_paterno character varying(30),
    apellido_materno character varying(30),
    genero character(1),
    telefono character varying(10),
    direccion character varying(50),
    edad character varying(2)
);
    DROP TABLE public.pacientes;
       public         heap 	   visitante    false            �            1259    57460    pacientes_copiaup    TABLE     >  CREATE TABLE public.pacientes_copiaup (
    id_paciente integer,
    nombre character varying(30),
    apellido_paterno character varying(30),
    apellido_materno character varying(30),
    genero character(1),
    telefono character varying(10),
    direccion character varying(50),
    edad character varying(2)
);
 %   DROP TABLE public.pacientes_copiaup;
       public         heap 	   visitante    false            �            1259    57463    pacientes_eliminados    TABLE     A  CREATE TABLE public.pacientes_eliminados (
    id_paciente integer,
    nombre character varying(30),
    apellido_paterno character varying(30),
    apellido_materno character varying(30),
    genero character(1),
    telefono character varying(10),
    direccion character varying(50),
    edad character varying(2)
);
 (   DROP TABLE public.pacientes_eliminados;
       public         heap 	   visitante    false            �            1259    57527    pacientes_id_paciente_seq    SEQUENCE     �   CREATE SEQUENCE public.pacientes_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pacientes_id_paciente_seq;
       public       	   visitante    false    216            .           0    0    pacientes_id_paciente_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.pacientes_id_paciente_seq OWNED BY public.pacientes.id_paciente;
          public       	   visitante    false    217            {           2604    57582    pacientes id_paciente    DEFAULT     ~   ALTER TABLE ONLY public.pacientes ALTER COLUMN id_paciente SET DEFAULT nextval('public.pacientes_id_paciente_seq'::regclass);
 D   ALTER TABLE public.pacientes ALTER COLUMN id_paciente DROP DEFAULT;
       public       	   visitante    false    217    216                       0    57512    cita 
   TABLE DATA           4   COPY public.cita (id_cita, fecha, hora) FROM stdin;
    public       	   visitante    false    212   �<       !          0    57515    diagnostico 
   TABLE DATA           q   COPY public.diagnostico (id_diagnostico, sintoma, nom_enfermedad, tipo_enfermedad, etapa_enfermedad) FROM stdin;
    public       	   visitante    false    213   �<       "          0    57518 	   historial 
   TABLE DATA           c   COPY public.historial (id_historial, nom_medicamentos, nom_enfermedades, estado_salud) FROM stdin;
    public       	   visitante    false    214   
=                 0    57457 
   inventario 
   TABLE DATA           K   COPY public.inventario (id_inventario, nom_medicina, cantidad) FROM stdin;
    public       	   visitante    false    209   '=       #          0    57521    medicamentos 
   TABLE DATA           o   COPY public.medicamentos (id_medicamento, nom_medicamento, presentacion, dosis, tiempo_suministro) FROM stdin;
    public       	   visitante    false    215   D=       $          0    57524 	   pacientes 
   TABLE DATA              COPY public.pacientes (id_paciente, nombre, apellido_paterno, apellido_materno, genero, telefono, direccion, edad) FROM stdin;
    public       	   visitante    false    216   a=                 0    57460    pacientes_copiaup 
   TABLE DATA           �   COPY public.pacientes_copiaup (id_paciente, nombre, apellido_paterno, apellido_materno, genero, telefono, direccion, edad) FROM stdin;
    public       	   visitante    false    210   �=                 0    57463    pacientes_eliminados 
   TABLE DATA           �   COPY public.pacientes_eliminados (id_paciente, nombre, apellido_paterno, apellido_materno, genero, telefono, direccion, edad) FROM stdin;
    public       	   visitante    false    211   >       /           0    0    pacientes_id_paciente_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.pacientes_id_paciente_seq', 3, true);
          public       	   visitante    false    217                       2606    57530    cita cita_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT cita_pkey PRIMARY KEY (id_cita);
 8   ALTER TABLE ONLY public.cita DROP CONSTRAINT cita_pkey;
       public         	   visitante    false    212            �           2606    57532    diagnostico diagnostico_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT diagnostico_pkey PRIMARY KEY (id_diagnostico);
 F   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT diagnostico_pkey;
       public         	   visitante    false    213            �           2606    57534    historial historial_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.historial
    ADD CONSTRAINT historial_pkey PRIMARY KEY (id_historial);
 B   ALTER TABLE ONLY public.historial DROP CONSTRAINT historial_pkey;
       public         	   visitante    false    214            }           2606    57468    inventario inventario_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id_inventario);
 D   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_pkey;
       public         	   visitante    false    209            �           2606    57536    medicamentos medicamentos_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT medicamentos_pkey PRIMARY KEY (id_medicamento);
 H   ALTER TABLE ONLY public.medicamentos DROP CONSTRAINT medicamentos_pkey;
       public         	   visitante    false    215            �           2606    57538    pacientes pacientes_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id_paciente);
 B   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_pkey;
       public         	   visitante    false    216            �           2620    57539     pacientes trigger_pac_eliminados    TRIGGER     }   CREATE TRIGGER trigger_pac_eliminados AFTER DELETE ON public.pacientes FOR EACH ROW EXECUTE FUNCTION public.pa_eliminados();
 9   DROP TRIGGER trigger_pac_eliminados ON public.pacientes;
       public       	   visitante    false    219    216            �           2620    57540 $   pacientes trigger_pac_sin_actualizar    TRIGGER     �   CREATE TRIGGER trigger_pac_sin_actualizar AFTER UPDATE ON public.pacientes FOR EACH ROW EXECUTE FUNCTION public.pa_sin_actualizar();
 =   DROP TRIGGER trigger_pac_sin_actualizar ON public.pacientes;
       public       	   visitante    false    220    216            �           2606    57541    cita fk_idCita_idPaciente    FK CONSTRAINT     �   ALTER TABLE ONLY public.cita
    ADD CONSTRAINT "fk_idCita_idPaciente" FOREIGN KEY (id_cita) REFERENCES public.pacientes(id_paciente) NOT VALID;
 E   ALTER TABLE ONLY public.cita DROP CONSTRAINT "fk_idCita_idPaciente";
       public       	   visitante    false    216    212    3207            �           2606    57546 #   diagnostico fk_idDiagnostico_idCita    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT "fk_idDiagnostico_idCita" FOREIGN KEY (id_diagnostico) REFERENCES public.cita(id_cita) NOT VALID;
 O   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT "fk_idDiagnostico_idCita";
       public       	   visitante    false    3199    212    213            �           2606    57551 '   diagnostico fk_idDiagnostico_idPaciente    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT "fk_idDiagnostico_idPaciente" FOREIGN KEY (id_diagnostico) REFERENCES public.pacientes(id_paciente) NOT VALID;
 S   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT "fk_idDiagnostico_idPaciente";
       public       	   visitante    false    213    3207    216            �           2606    57556 &   historial fk_idHistorial_idDiagnostico    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial
    ADD CONSTRAINT "fk_idHistorial_idDiagnostico" FOREIGN KEY (id_historial) REFERENCES public.diagnostico(id_diagnostico) NOT VALID;
 R   ALTER TABLE ONLY public.historial DROP CONSTRAINT "fk_idHistorial_idDiagnostico";
       public       	   visitante    false    3201    213    214            �           2606    57561 &   historial fk_idHistorial_idMedicamento    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial
    ADD CONSTRAINT "fk_idHistorial_idMedicamento" FOREIGN KEY (id_historial) REFERENCES public.medicamentos(id_medicamento) NOT VALID;
 R   ALTER TABLE ONLY public.historial DROP CONSTRAINT "fk_idHistorial_idMedicamento";
       public       	   visitante    false    214    215    3205            �           2606    57566 #   historial fk_idHistorial_idPaciente    FK CONSTRAINT     �   ALTER TABLE ONLY public.historial
    ADD CONSTRAINT "fk_idHistorial_idPaciente" FOREIGN KEY (id_historial) REFERENCES public.pacientes(id_paciente) NOT VALID;
 O   ALTER TABLE ONLY public.historial DROP CONSTRAINT "fk_idHistorial_idPaciente";
       public       	   visitante    false    214    216    3207            �           2606    57571 (   inventario fk_idInventario_idMedicamento    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT "fk_idInventario_idMedicamento" FOREIGN KEY (id_inventario) REFERENCES public.medicamentos(id_medicamento) NOT VALID;
 T   ALTER TABLE ONLY public.inventario DROP CONSTRAINT "fk_idInventario_idMedicamento";
       public       	   visitante    false    209    215    3205            �           2606    57576 +   medicamentos fk_idMedicamento_idDiagnostico    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT "fk_idMedicamento_idDiagnostico" FOREIGN KEY (id_medicamento) REFERENCES public.diagnostico(id_diagnostico) NOT VALID;
 W   ALTER TABLE ONLY public.medicamentos DROP CONSTRAINT "fk_idMedicamento_idDiagnostico";
       public       	   visitante    false    215    213    3201                !   x�3�4202�54�56�44�20 "�=... A\r      !      x������ � �      "      x������ � �            x������ � �      #      x������ � �      $   n   x�3�t+J�K�,N���/ʯR���EE�����Ɔ��&&&&�Ή99�
>��
�y@R�؄�Ȑˈӫ41�3 �(��3hN�k44226j��-8M�b���� |�         �   x���1�0���+
�b�^i:""Z�c�P"�R�����;�r7G8eǰ�	��6�>��^ j-��6�n�}uMKՅ(�#&�ъ�Hѽ�:����_dax��u�f�f`�2��.���o��{�>��!(�l��nj�+�>0dP�         3   x�3��(M����/H��t�����p�鑙�����`ha������� {�#     