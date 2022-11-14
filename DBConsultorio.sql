PGDMP     .    4            
    z            consultorio    14.5    14.5     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    40987    consultorio    DATABASE     h   CREATE DATABASE consultorio WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE consultorio;
                postgres    false            �           0    0    DATABASE consultorio    ACL     0   GRANT ALL ON DATABASE consultorio TO visitante;
                   postgres    false    3323            �            1255    41005    registro_p()    FUNCTION     �   CREATE FUNCTION public.registro_p() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	insert into fecha_registro(id_paciente, fecha)
	values (new.id_paciente, now());
	return null;
end;
$$;
 #   DROP FUNCTION public.registro_p();
       public          postgres    false            �            1259    41001    fecha_registro    TABLE     p   CREATE TABLE public.fecha_registro (
    id_paciente integer NOT NULL,
    fecha timestamp without time zone
);
 "   DROP TABLE public.fecha_registro;
       public         heap    postgres    false            �            1259    41000    fecha_registro_id_paciente_seq    SEQUENCE     �   CREATE SEQUENCE public.fecha_registro_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.fecha_registro_id_paciente_seq;
       public          postgres    false    212            �           0    0    fecha_registro_id_paciente_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.fecha_registro_id_paciente_seq OWNED BY public.fecha_registro.id_paciente;
          public          postgres    false    211            �            1259    40989    paciente    TABLE     .  CREATE TABLE public.paciente (
    id_paciente integer NOT NULL,
    nombre character varying(20),
    apellido_paterno character varying(20),
    apellido_materno character varying(20),
    telefono character(10),
    edad character(3),
    genero character(1),
    direccion character varying(50)
);
    DROP TABLE public.paciente;
       public         heap    postgres    false            �           0    0    TABLE paciente    ACL     1   GRANT ALL ON TABLE public.paciente TO visitante;
          public          postgres    false    210            �            1259    40988    paciente_id_paciente_seq    SEQUENCE     �   CREATE SEQUENCE public.paciente_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.paciente_id_paciente_seq;
       public          postgres    false    210            �           0    0    paciente_id_paciente_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.paciente_id_paciente_seq OWNED BY public.paciente.id_paciente;
          public          postgres    false    209            c           2604    41004    fecha_registro id_paciente    DEFAULT     �   ALTER TABLE ONLY public.fecha_registro ALTER COLUMN id_paciente SET DEFAULT nextval('public.fecha_registro_id_paciente_seq'::regclass);
 I   ALTER TABLE public.fecha_registro ALTER COLUMN id_paciente DROP DEFAULT;
       public          postgres    false    212    211    212            b           2604    40992    paciente id_paciente    DEFAULT     |   ALTER TABLE ONLY public.paciente ALTER COLUMN id_paciente SET DEFAULT nextval('public.paciente_id_paciente_seq'::regclass);
 C   ALTER TABLE public.paciente ALTER COLUMN id_paciente DROP DEFAULT;
       public          postgres    false    209    210    210            �          0    41001    fecha_registro 
   TABLE DATA           <   COPY public.fecha_registro (id_paciente, fecha) FROM stdin;
    public          postgres    false    212   �       �          0    40989    paciente 
   TABLE DATA           ~   COPY public.paciente (id_paciente, nombre, apellido_paterno, apellido_materno, telefono, edad, genero, direccion) FROM stdin;
    public          postgres    false    210   )                   0    0    fecha_registro_id_paciente_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.fecha_registro_id_paciente_seq', 1, false);
          public          postgres    false    211                       0    0    paciente_id_paciente_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.paciente_id_paciente_seq', 5, true);
          public          postgres    false    209            e           2606    40994    paciente paciente_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (id_paciente);
 @   ALTER TABLE ONLY public.paciente DROP CONSTRAINT paciente_pkey;
       public            postgres    false    210            f           2620    41006    paciente trigger_registro    TRIGGER     s   CREATE TRIGGER trigger_registro AFTER INSERT ON public.paciente FOR EACH ROW EXECUTE FUNCTION public.registro_p();
 2   DROP TRIGGER trigger_registro ON public.paciente;
       public          postgres    false    213    210            �   E   x�M��	�@D�s�bp��UkI�uB�z�\�䄓�7���sz�v4��&����.���f� ��>      �   �   x�m��
�@E�_�_ �ˬ�h�F1��G�6(��w:�Nsν�Fe�����"&n���1�:�=����QJ��]k�i��ؿ8��x��3�:��k���4�R���d���%��6��G��O1�ҡ��RJ} �12=     