PGDMP  -    8                |            CaloApp    16.2    16.2 "    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16481    CaloApp    DATABASE     |   CREATE DATABASE "CaloApp" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "CaloApp";
                postgres    false                        3079    16482 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1259    16493    excercises_image    TABLE     p   CREATE TABLE public.excercises_image (
    id integer NOT NULL,
    url text NOT NULL,
    "exerciseId" uuid
);
 $   DROP TABLE public.excercises_image;
       public         heap    postgres    false            �            1259    16498    excercises_image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.excercises_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.excercises_image_id_seq;
       public          postgres    false    216            �           0    0    excercises_image_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.excercises_image_id_seq OWNED BY public.excercises_image.id;
          public          postgres    false    217            �            1259    16499    exercise    TABLE       CREATE TABLE public.exercise (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title text NOT NULL,
    "Explain" text,
    "GrupoMuscular" text,
    "Series" integer DEFAULT 0 NOT NULL,
    "Repeticiones" double precision DEFAULT '0'::double precision NOT NULL
);
    DROP TABLE public.exercise;
       public         heap    postgres    false    2            �            1259    16507    food    TABLE     !  CREATE TABLE public.food (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title text NOT NULL,
    "Calorias" double precision DEFAULT '0'::double precision NOT NULL,
    "Description" text,
    "Gramos" integer DEFAULT 0 NOT NULL,
    "Proteina" double precision NOT NULL
);
    DROP TABLE public.food;
       public         heap    postgres    false    2            �            1259    16515    foods_image    TABLE     g   CREATE TABLE public.foods_image (
    id integer NOT NULL,
    url text NOT NULL,
    "foodId" uuid
);
    DROP TABLE public.foods_image;
       public         heap    postgres    false            �            1259    16520    foods_image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.foods_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.foods_image_id_seq;
       public          postgres    false    220            �           0    0    foods_image_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.foods_image_id_seq OWNED BY public.foods_image.id;
          public          postgres    false    221            �            1259    16521    users    TABLE     G  CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "fullName" text NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    roles text[] DEFAULT '{user}'::text[] NOT NULL,
    "Edad" integer DEFAULT 0 NOT NULL,
    "Peso" integer DEFAULT 0 NOT NULL,
    "Altura" double precision DEFAULT '0'::double precision NOT NULL,
    "Actividad" text DEFAULT 'Sedentario'::text NOT NULL,
    "Objetivo" text DEFAULT 'Aumento'::text NOT NULL,
    "Nivel" text DEFAULT 'Principiante'::text NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    2            6           2604    16535    excercises_image id    DEFAULT     z   ALTER TABLE ONLY public.excercises_image ALTER COLUMN id SET DEFAULT nextval('public.excercises_image_id_seq'::regclass);
 B   ALTER TABLE public.excercises_image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            =           2604    16536    foods_image id    DEFAULT     p   ALTER TABLE ONLY public.foods_image ALTER COLUMN id SET DEFAULT nextval('public.foods_image_id_seq'::regclass);
 =   ALTER TABLE public.foods_image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            �          0    16493    excercises_image 
   TABLE DATA           A   COPY public.excercises_image (id, url, "exerciseId") FROM stdin;
    public          postgres    false    216   �)       �          0    16499    exercise 
   TABLE DATA           c   COPY public.exercise (id, title, "Explain", "GrupoMuscular", "Series", "Repeticiones") FROM stdin;
    public          postgres    false    218   k?       �          0    16507    food 
   TABLE DATA           Z   COPY public.food (id, title, "Calorias", "Description", "Gramos", "Proteina") FROM stdin;
    public          postgres    false    219   �D       �          0    16515    foods_image 
   TABLE DATA           8   COPY public.foods_image (id, url, "foodId") FROM stdin;
    public          postgres    false    220   �_       �          0    16521    users 
   TABLE DATA           �   COPY public.users (id, email, password, "fullName", "isActive", roles, "Edad", "Peso", "Altura", "Actividad", "Objetivo", "Nivel") FROM stdin;
    public          postgres    false    222   jh       �           0    0    excercises_image_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.excercises_image_id_seq', 3587, true);
          public          postgres    false    217            �           0    0    foods_image_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.foods_image_id_seq', 68, true);
          public          postgres    false    221            N           2606    16538 #   food PK_26d12de4b6576ff08d30c281837 
   CONSTRAINT     c   ALTER TABLE ONLY public.food
    ADD CONSTRAINT "PK_26d12de4b6576ff08d30c281837" PRIMARY KEY (id);
 O   ALTER TABLE ONLY public.food DROP CONSTRAINT "PK_26d12de4b6576ff08d30c281837";
       public            postgres    false    219            H           2606    16540 /   excercises_image PK_2dbb0408afe4492bf8d8c37d7a2 
   CONSTRAINT     o   ALTER TABLE ONLY public.excercises_image
    ADD CONSTRAINT "PK_2dbb0408afe4492bf8d8c37d7a2" PRIMARY KEY (id);
 [   ALTER TABLE ONLY public.excercises_image DROP CONSTRAINT "PK_2dbb0408afe4492bf8d8c37d7a2";
       public            postgres    false    216            R           2606    16542 *   foods_image PK_572bca8c7384af77e5ae7fb0a05 
   CONSTRAINT     j   ALTER TABLE ONLY public.foods_image
    ADD CONSTRAINT "PK_572bca8c7384af77e5ae7fb0a05" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.foods_image DROP CONSTRAINT "PK_572bca8c7384af77e5ae7fb0a05";
       public            postgres    false    220            J           2606    16544 '   exercise PK_a0f107e3a2ef2742c1e91d97c14 
   CONSTRAINT     g   ALTER TABLE ONLY public.exercise
    ADD CONSTRAINT "PK_a0f107e3a2ef2742c1e91d97c14" PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.exercise DROP CONSTRAINT "PK_a0f107e3a2ef2742c1e91d97c14";
       public            postgres    false    218            T           2606    16546 $   users PK_a3ffb1c0c8416b9fc6f907b7433 
   CONSTRAINT     d   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.users DROP CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433";
       public            postgres    false    222            V           2606    16548 $   users UQ_97672ac88f789774dd47f7c8be3 
   CONSTRAINT     b   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "UQ_97672ac88f789774dd47f7c8be3" UNIQUE (email);
 P   ALTER TABLE ONLY public.users DROP CONSTRAINT "UQ_97672ac88f789774dd47f7c8be3";
       public            postgres    false    222            P           2606    16550 #   food UQ_b7a0d38d77b190a661453b205f8 
   CONSTRAINT     a   ALTER TABLE ONLY public.food
    ADD CONSTRAINT "UQ_b7a0d38d77b190a661453b205f8" UNIQUE (title);
 O   ALTER TABLE ONLY public.food DROP CONSTRAINT "UQ_b7a0d38d77b190a661453b205f8";
       public            postgres    false    219            L           2606    16552 '   exercise UQ_dbed6498729abb89d076525c1fa 
   CONSTRAINT     e   ALTER TABLE ONLY public.exercise
    ADD CONSTRAINT "UQ_dbed6498729abb89d076525c1fa" UNIQUE (title);
 S   ALTER TABLE ONLY public.exercise DROP CONSTRAINT "UQ_dbed6498729abb89d076525c1fa";
       public            postgres    false    218            X           2606    16553 *   foods_image FK_479bc8af37825802674c60f1c6d    FK CONSTRAINT     �   ALTER TABLE ONLY public.foods_image
    ADD CONSTRAINT "FK_479bc8af37825802674c60f1c6d" FOREIGN KEY ("foodId") REFERENCES public.food(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.foods_image DROP CONSTRAINT "FK_479bc8af37825802674c60f1c6d";
       public          postgres    false    219    4686    220            W           2606    16558 /   excercises_image FK_6d66421a4262da8e0df15de9c0f    FK CONSTRAINT     �   ALTER TABLE ONLY public.excercises_image
    ADD CONSTRAINT "FK_6d66421a4262da8e0df15de9c0f" FOREIGN KEY ("exerciseId") REFERENCES public.exercise(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.excercises_image DROP CONSTRAINT "FK_6d66421a4262da8e0df15de9c0f";
       public          postgres    false    4682    216    218            �      x���I�%)�E�{!� {�	m���ꊅ{��ȁgD���y��[��ʹs���e�����B6��������7�l��F9=��F�X�-�9j����[��8Z�԰-:l�ad-!�SK�����|V��|R��x�.���^��Ub?/��+�՘Z
g�bkaJ�᮸z��G^/���7�'�^����qKc�]�i��� �/�xW� �d{ee��l���Q��}]��Ģ�^5(�ߜ��RE��ݟ���[�@���d�SE���I��x�b����%͐VcfԹ���-c�4�� ڗ5�r�	�*l�B?R�>E��d�D�߈i�)%X�+�[xƱ%�Hm[��%� �Ow�y��&sO�"�z�Y���L��|%��Gb��7�3%�e5�}(�4���y��e�K[� &�y�q�j	�v�c���15
r��V������r+m�g�Yk��æ�z�`qS��v��Rg��ڱē�C���Ҳ�3�}��?���Z��H�O��[�0��©J#j��K4�j-�s��o����W_LѪ��2h�^�
}6�!�o�H�2���e=z�2����_�yZ�7�I�	2}g���O�'}y�b!�����$7畞 )�Z@�Ԧ聂�+'���e�'���1�髇��n�gї�´���C����s%�Rt�Mr�B���8w�,O��9�;]�lVl�`WQ�.7ժ����!�9k�*��e�.>�8S����ޖG���A�PL �; [���(���]� ����:���;����J{R�+�-?A�=���m9�m9%/��,�I���x�]�%AW�d7�S	�(�v�*'?A&J=5Y0�8�)\��y��l8=ꜿ��A}i�і���l��[C^K�E��|R��ݵg�N����g&oP�g��7EY��I1ŗ�AAo�K+�4���Q!6Lc�f�K�m��|4������?_՝�Vg_9L=ޔi](4σ�d����75���)&R6\�$����Lw>�bǣV��}(���4'��z�|�o%Y>IE�7��ZCv�{T(Q�}��d����^�U:�HC���c�BY�`�� �Ӓ��o�*.:���O<{�m?4N�K79�����,�,>u�ކy���'6��o�|sv=�Z����^q:$f:o�9�Pe=LV%��2dc�-��~���.�'w�	7}�^�ڸ���$ޅ� m��d>�z���F�� W@F�t/M!(�U5z��A&{�K�|D�Ŕ6��RrF<�l+��K�~�N�9�H[�X�%Ǎ��!��P�=0/�鋉Tkt�Ta�GT��<N�E��^�y�A,7��Z��E:�!�A�X/�c�%~�����6+^��30��W	�`�'��4N(�����ԞWY��r�	�c	ӟv=ېb#�T�Jj�7#1��x�Ȣ�t82�!Ĩ'H撨C�O�7�$��J"�z#����ǡ�
^S�7�;�ռ(}�$)��Ћ;"�<Qe�ΠXv����H��� �����9o��+Rxs^��;��������|�0�Z����+s��
��B��m���������C[ǵdx¦ؘ��^�I3�#_K?IN�T%���e��i�D��OZ��5����Xa��u%�KA$�҉ݎ�.|2	:TQ�����'��I5���K�w#B$���(����h_64.2��<87bV�����y@�/νz�x���Q[��7�����Ef�g"ƧTY�[LR�Z(�����պǓ<!B��~��o�W�������5�]cP��5�~��C�ɖ�����X>�u����\!nX|c�ɫg��Q��g�*�O	�K���YH���p�q�5��Xt<�u����ye����D?&_k�h�D�HS�@��;6�����)�W]=�X�;�$4t(��E��o���|�jS1S}�fRL��ՓT���,	�!�������ٍ�$��k΂+ҭo�X?�f�RE��ԁڰ�|����P��};��`���uSP�ˍi�����V�	�}�K�F�g��Z�]й26AGmOF�����1}��t L���S�|��m� �#��1Jmo��Ґ��WO#��hO��T��H�I��C����s��b�����A�[Ȅ�flPQ8J/�-�N�wͧ�j*�	R�X����پ��F��t3�U����'���.{��zg�����Z����S��Ǯ�TuS�//���u[Z�Q��I��V�y��)#���/�[n�D���St"�b��ۡ������}��v��M��OnS9W�]����'m��c擩3��2B����ױ����c�d3rtm��/_n�wzJ��_H���*ԺX'#������&���Ʉx2�hH�oz��y�_A�Nc!
m��G&,�D��4�~Z���H��l�#�uqΘ�Î���9R��b$���/
9fD��loYwz���X�I�G4����a�P�k[�SR���ng���}�YrL� M�r֮�7%� �d��1�$ ��Lf�c�V�d�J<eC!MN��c�Ɛ!�<�my(�b��*��H&�n����VrZ����?�?���׭A�1�-�C����P}��oܼ��IK��B�nJ~���<k|�˄s��׆Շ4��j֢�5uz���o~�Ld������-�'+Y�q�G� 图7��l����kӼ:Vݬ>A�/7Z:����ʲ���K�ʔ5",֟ �WU���t���9����
��Q���'�����v�Fߖ�����O*D�O��Wa��>���D��b���;���P0�n�n%��i4������������C�~�v%��0Ċ�26+��Ğ8v|
����{X˻�{ƭ톳�i� ��<A�冷��u��Y���F�$�/��O��C#��,��o/�\��Mпi얟 ��J��*�����جu�q�~{J�:a����֝�|��|��&П?�����[Xn�`��Ƿ$�^���q)��g�����_{C�q�ؖ�ǬkDDQ�i�?Wq~Yb��eu��A�u��X-�Hx�m�Q�����;���H��3�_zԷt� �6��p�㑹h�$+�q�+2� �W�@y��moh�v�8!�*�Z��	�|w��n)�h��ll#�:��n�/�[����p�R�h�zǉ�FEFl�ؖ)ؾ��M�h?���`sm�C�1x�H�#�������Td��n�ی��ny]��f�Nfp'?�$�Mw]�"����֓5�ϑ
?�I=� @]1�Y�%���� �w�D���,_�$��g��\3S����/����I�C(�w������761?Y�_mu?3��ɭN�)�يT���e�RK��x��:Տ9"��ݠ7��緐��	�t�FeB��k���qwr?U�ٱO���qHJ}þ�әz�[]bY��k�� ��$|79���g�|r9~�0��	fp2�?��&]�����z����Y��=^��Xa�e߳�}{|J�l����_6T�K���������˜�ٗ��{ʢ��ra�k�3s4}
|�F�<��(U���� S�G�HG>A�/�:�,�9�ܩ@-(�LR!��;��'����B�s�)���W��V���|jȬIb������j��l�wm����h��~�m�=dJ�ěΆ�|�4�ۭU��z���%E�Y�5-�B	�=ALKK���|��i^N9P�r��1O�h��L��ջ�����$��&���1�\��-�|}��1�m�ee�G�A*�O�1=A����g�u��n����f�?�-� ˗5C��=�_�`B�d������詧�)�S�t��]P�R��o.�8���پam	2ZvY=�6"�������@87z<��s�s��I�>���_�L��'3ذ�fgW�
�~��,��O`�W��)J��BF<�U�9:�f݆��l�旍� �w����x����ވ��_��%����Wt5�L�4�A�$V�Sg�k��b�2��Y�lq��|�)�]���n�K*,�d���|�LM~��vVsX5-��3�[H�����auϦ~�?v">?�gHg��~{�݂/���,2@/u� �  ��F�]�S���T) �,���BI�uO����T�#������hD�;���#� >8����@���$���}�O�U}���������.ɵ��f�|���F�U��jYk3dkΗ,v��KM��?<~�˚�)~Q�,��k�cϾ���ɘ��S��+Ϥd==TN�z���j���/O!����2`/���j�)�NԒ��]z��]��\�f~�˼���b5.Έ�eU{iѯ_�)�H
$^���o�5�����z�Ï�y4�g�����j'<�dƹ���d���+��p�pFOGǨ8�'HDW[Ǉ;�o���Ž�m��{��2�[���!�ml�����ꦇ�Y�W՝� ������뷧�'
k�y�YS�L��S*I׷��)�?<<0m~�b-�Y��O��H*�~��~��g~����%��)�	Ҿ�Hl1��/��D)õ߅ah\�O+���:3(~u�7��L�N����S�#g��f�i;?Iׯu�؆;��Q�'H�����d���g�i�;>�~7�	2���Q0K�wk��~�x��jJu���I�[rF��C�}���ٷ:ԏ5�-B8z��ܚ��+��~���ǯ@�"j�z�s��[��S���nۭ~�4��X#EZ�9c����')��Z�L��~�T�b�_�!�N�|��򷐘�cs�2���_�!��ν䄓_o�nƹ*c����oZe���k��y������#������=CBB(�W�r�gf��������]Jz����G���=��X�N�v��^���\`�4��V<���R>]�w�����۾UC�3xO<NK����)~sN|�����2�$R��	Y>�=˾(?�<ɐ�Y��R�얞 �7RoGzY���`��@!μD��� �;yP�❤��P1�9ݫm��o��O���~H�_k1�������_Bv߿\ˆ�a����w`����1;������F��t���B�$Z��ҳ�,F��O�S��#�~07�mA�-��Ϯ�o!�g�	���y��%�x��O�����Z�/!���M�2GS�N�C�r��[���KG��s��Y>=���~�S��
Cv�ol]�o�T�]�g��}��t��5���3�a��}B/�n/p4�E�nѦߛ% <t���H�~ތc�9;�-	���qߏ����/�B��gFZ�υ�.��M~Nj��Z<�<A�Wmi�O�|g��&�v�]Zm�Ǒ'�%���"�ߘ���o��Y_y/�{֓5���F�IL��7KT߱�����ԋ)z���gR���5�U@v�f��=�k޿|�[H�h�5�wWϐ��cc!)����O6K�3��n���ƿ��K��m��#�^� �׆�L�W=n�#��[��#�ڟ ��}��/z��>��/P�U�Q?���T��ѧ�9��]⷗�өP���d�10�4zQ�����Fc�w������
3�{����?���w��      �   Q  x������6���S���!Y�eӴAI�ͭ�!9�e@�%-��M�9��[�~�ΐ�%�&m��W��!��a	�%��^���d��3U�bo��u�z�G��^�^�[�jK�' ]���h�`����{�n�:�@���ޞ�t� ��� ����[��g��7�9؊W��������=�����+p�i� �	=b8��x�!x~ǉ��G���� ��1Z=
�;Mч`5m�7����F�U�(��b�@�R�=���*18����HW�.�*������o�$2i4dp�M��K���ya������Њx�WϜ(xK�q`=�����AE�G��jϻ�y��
�?�R�w�PF�ʻ��t^D6���ϟzΝ?���>����,��z�5��q�ten�f	���]�>��F#e��Xd�J��]�5X�L��a� ��b��?���"�O�o(i��N�N���m� 1@Yg�����p�@kڗ�ќ��@��͙^��i�v��IG���ҡ��M�KL��A.eڊ?�����,�ȗ��2���,yV�W�D��i1a���QH�����A.��n S-����Ҋ6�^b��@yҫ������qCI��ٓG4��s�������az�6ӳw<~8��*�td7��QD�&gU��]"^�ܟ�|��V�]�ϰ�}&�,Ib�̠���4�.�^��&�-�:�0*tHXO��D��Q=������"�e��"����*�|�8Q�$
[�f����9�au:L�����|���|X8����:�J"U-B�zs�b�L(q.�'��uQVh��][��li�t��ZЅ��r�_���zS��P�9�٘I"��-��x��4Ƅ:<��|�(��Z0,I�����ܑ]%u�K�pD��G���-_�X�]UAV��.�eI��Y�Z�jgt�V?����E�X��I���S���Cl��\Y;A�gd�ޤ���L��@��Do����a�i��?��t�����u:c���1;E8�]$L��wD���8�cO��O�N�c�n�f-����1rW �]��$��T���6�̱��?�W�_�|F��uC���s���i���^g)jjnJ�2��C��>�$w�"#�J���?%�{pr�k�>�9.C�2�\L�*�R��R.j�/l.����.9б���-�W��}�}�2�+�<5���l����fߐM(�i͕xt򤥁o��iD������]���!&=�?k"�<���U�������:�`"ef��`��c��(�������S�j��ϥ%f�؊߼x�L'�Y�r]{K�26s�����>�u�*W�Z��]�����P�      �      x��\ɒ�H�=�_�˘U�������,6U=����\&� ���S��A�:�PV���O�K�G`!��*Y�J	�=ܟ?_ ��ATe������0)��*/P��}K_'·�i:'H�}���Ճ;�­&ݎ�=�C/\��Sߍ���Ý��k�Z��T����A���^(��֕��$z!��tѺ݈{\)�V{��Ӥ�/|�P�?�o��v'�A4�e������ײ�;ın��gY��<�#���]��{����	|߉�]*�U䥑̽8Ҿ����¨(�@�Q��G}��+@By�"�8O����p��;tf����+���B;{��K���PR��V��r�"�e}���u ��D��a߯[�L��U�kE��Ww��Ew����Ϥ�gwz��"m=b��8��]�WN�>�ad?��Ǿk��n\q�c=vV�]��ց�����Z�^硧
f"�¢οL��$����=]�SUt%�Q�.�I��պcGr7��=s�neM��Z�A�5�%[#d�e}�c� m�W3T���G^I����OV� ����
��^�F�W~�	- o��:��4�K�ٰ�d%Ơi�^W����PE�F/gߡ{����v{�:������n��K�{'黽��h��o��d���u�����ﬡ���-�;���e��.��2RxY%c(�^
hD��UȤ��z�BuN� ���
�Y��=��x��5�2����Yc_������0���S��
�j	��Z|��>]�^��=�0ܕi��WF2\V�W�y�E"D^�J��󗮚p�1	;��,�z���GAXz��X$�I��Y2��7vhn�kA�H�����]���WJhgk_�(ȏEY7���W��ȟ����e�kOH�xqk����KD��̊����������ƾ�{�jGoP��<V@'vf�{�#���5tq������.�J�9��d�qҰ�R��+�UZdq"J�?���äj}�<�ܼ5�s�H���o#&N�N��a�#���ɐ��{} ��ȼ�����t�9a���&a,�ǡ�_G��wh��2�`�xЊ� �+�H~�B/�!������WDQA�i�!�V�8'�
�1�c����	G7� �����D��&x{���jY��d�Vȿ^��K�;@� u�;�n��4�׹�X7����B��/�n�� I-﵉PV.�NF��S`a����YE�'5Ee*�!�Q�OC�EH?��q�|���-�ban»D�����I�EnXΠ��za��	�fJ�5�^�!�K�걦@�tǊa�yUƺ��" �J}��a�q�u��ʯ���F8A��?��=zR�/p�9˘�`�tK<Y��+�`��u�P��@C���wB%�O�~D�zY�@�U��\V�����2�I�:?��'��x��V�+�A �y����q��j�*��	'a@&q��ۮ� �&:�Mon�,*���F ��)h��0���(�2O]/���V,K��G5^�;~�E>@�#h	�U�3wPX�i�ag�E�	�K/�eU�~���A��4Y�@s��%�l��Y].`�n�/�5dߪIކ����ϐK t2����UMwa�Ù�Y`�]߂8�����;�P�bp�[΂r�c�r�뜻��S�E�Kr)�XD��4Wy�]U��56�_A4E,� ����Y�1R=���5�s�� � E�	���,�V����~�1��n����8��R�Rr�4G��]Z���CW�d��
����v�f ҰK�L�tI�((`��V�J"K�VZK$�ef� �Ӫ� �Ż�1�����0����+@��y�P̈�$f������F������V!G�3T4�;mw����J�f��A��(<�� �I�E2�E��@�$����aE\2�������Ӝ��8u�4�*/�m��f;��5:sa����'���n`޲@���H�8�h�-���bfJքw��E��W�Q@t?�
Y!�G:*A�B_h�.���G3��w �h�-R�o��ߍ�Ͽ���;�C���0�N�P�3vrC
�Ϙ��Ƥ�Y�t�]��dD���S��3/KP�=�.�Z�~:oň�[_*�
g8Ή���6ZJ����r�����޼j�����l�6�Z�R���_	��uIFERx�6�a	�9�3�����Ƒp�<��8iN6)��%�Z �U�5t�d6�-h�ߌ���4�E��B� ��nw� �4���1�*|:�/SU���"z����^VEH�Tdi�9LB"p�`K�zqZ�n�L��m�����y��Δ�6j\2�W��M�p���kQ�5�˂���`զ�c(��v�@�%(1��xe���WE9o������!�2��?���s��W�y��7�����s"�85��kB"��-�j�z!�9n���b�G��̪�הpQ%���y�I���B���|��Ch.!p,�Z'H�R��y����&1cX˗���/���L��I-o�^�p�o��Q��k��,�|k9�+f�m�uVI�܅�r�qVx��zq�U�M��+D*�E�TΏ��9�@m�s�uME���%�y�ן3�WO��������
���D,���]�i?΁%�V��1�0-����"��a�?�*�*N�M��^Z���Q�O������š+��w�����P���
�{��FI������3YC�Y��N�BK�����_��K��.ݕ��c/�����t3)���Ν��@�V#9�v����0{΋g����5H� `{��1v�T���:3a�R�f+߅UU��� V��;F꒔~$��z��	��/:a�R���g� s�b=�7/�ۏ��:����1�2>��*`5��Ȇ/	�I�u����I� �
���0�E��B�w\f˗�;,�R�f��i�jac܎x�o����Rl�T.�����
�&+1|�H����(Kc/.0�L���H������9Uο;L������&�_>�%�s�f���+'��þ^ţ�ֵ5���ƕ�M�<k#��*�Q�"O�L{1,�M�xi�i����"GL��(�(d��.��F��ÌyO��襪�w˚οST��)p�T�;�Н���k.��H�b8��W������P�����=s�&O���6T+⵬���Y����t����>�u��;?��,����8V�e���@e~�����sݑb�e���ݙjs�q�~+�{�oe�������sþW�`��=��=lV��� *�j����ta4�Vth�	�.f7wvW��*8���m'���N/�Q�G`����jї>o���1��v���5���2e���t��ϟ~�}�׆�����7�Gk��+��s=o�b�A��vΠ'��6���'���x��BBo�w��mMg��e�5��C���0:��Z?����F�j��
̆���o����}���	Bi� ��S�`E�^X�<SY�U�� ǁs:)�ۏ��5~����x�2��Aj1	����6�,�Vιn�C������R��3���idq���I�W|��^Z���L;��b1\�y2c�W�"v%uk�c�t��^��3z���	�<��&Ҷ�0�� �D1B���s�3�<����D�Nnp�h�u�uN�L�`%�p�����ȅ�a!3K�;��\�ަB���$w�o�tP׆}���qX��3�]
��J�a� �pɆ��?'8�`տ�Q�O�u�
��t�r�@�_Hz_�.���c�#K6�����'f7;�="�m�J?R*�HÓLz�N#/��<�QD�;?����pL:��91}L*n-� ���(�Smb7G��x�tB7A{!�!��ְǎ�T�;�WG�8�����2�> �L��K�IfA��?O�A��7��TXG�K���G�#��K�و�Q!Ƶ�l�[3Y��|��z��Ȟ(� ��"5�_D������qS�ydy.k����S�EkS�� ���]�����i�
�MY r��#[�[�?��A�����6 �
  i^���H����L�&�7�́�hS#��f��yffo؇�H�
x�r�'k��Ue!���
�)Nt�,L�,!�S�T�;ﰆšò��P4R$�>���"]�m����x�5>�Cč> �L ��?i���z,u��l��0�Qx�p�w�m��h�@s(�	hu��1��M]gob��������h.�t[Da��7t�[<�:�:�~/H�BuW{����}k�v�&J�,�O9K���Lc�Ue)s�H>yM���'�tў?��0��1���Iu�]�m��HG���#�3ё�``��i��m� ����-$���Bs	�
���БS���SK๐��<�~m-�=��&t��؇����j�"�t4�mJPR�jQea���P?襺;�'���ϔ��������")r/PyA�zE�k W,�(��(���Z���~��?�)�%l�+a�P��e���a4j��ܦ/�BN}rM�@�FhE{��s�k�{��ɨ�C��h�uV$3�޻��^5�e�hN���֪�BDE� YI���+E�z
Ix�=Y��6��;�o���
�ϴD�f9��Ԗ:�|���\3��6{<����֍6(67�E�ӂ��7`~�w�Y����e#[�gI���'�s�H��BȎ{�]�P��.$b蹐g���,�t���O��������tmk�<�6�J_�1��Ƀ�m:���m��P�87�k������fY�3�N����d�YTF�*!�yH;h8t��4vn�A���j�kƞ+�s��u�4C�B�Y�<_�|�\#��i�}`k�"B����c�[������[z�б��3��D��Q�$�������fX`���8�s�{�n����$[+e�@�� ���d�3^��t"g�Mfn⁩]D�V6����n(�ԛ��iK����M���5���nSCvI��H�Ǝ�̙o���5^�fZ$j�.��1�4	"?�/�q�Ţ*�ҏ

�I�gy����'�c@S�MA����3�
өsߺ�
�ۭ�My��f�����d2�L�o��%�`���k9��Hk�4R=H�����s��m����`�´)�&�9Ұ�It_��"�Uz;L�lk擟�Z�e�*	D����(�8Mr���|�A.���H�	��D�	��f��1[b��%�R"׌��oؘ�`�jSd��U8�z�j�H<�~4��q��i𲱴u{������x����{�J�@�����yRࡹ(��X�`J\�lD�#3\�����H=.��F�{3�N�������R*��\�8���0FZ�E�$�<�
��<M���"~�Q�����M����#B�b��xl��������A?��ǅz����<7���O���jP�I��X�K-53�2���m��kqNM����^�㳤�����5|i��6�����]7�B�������C@;|����e?�b�!�1k�����X:d[;�����Hi�P쿓�/qæ̳��pً�L8`�B%��8��x�Q��U�3�6D�y��� ���h�� �r)�A��_�(�����#w�	�_9_�n���?�����&䝄�e�B��U���9�e��� �l!Z��߄W�ꂽ_�<[���"�[5E�Ɣ�i.���b3�śS���d�N����'��V��6~�:P�J���nP�8J�8�+����yǍD3'��!�k�����z%�)f.k~$��6���Y`���-�a��� Ѹ�u�S�e��\'�=��՜*�����t��+&d��k�g���@�.6��KE�;����m�A&��f��V�Lp��i-6e!S(���U�2�9�k"eЅ����G�E>l�5�FQ�3i}���!�����<Ld&"_xZ���~K��eo�� �y3��%��]�+˰�q�{i�S���a =��0�e�|U8���Q�5u�-so�}=�3j��=��>�W�L��ӑ|t��n�a?�vm��[�i(�sP���$�7�֋��E���r"5}6��o{�3[���Y[Q�ۋreǬ����7&+���)E�L�$�<�I�E�yE@ő
�*Υ���A��k��r�����)�E��M���QF�8���<���g�l�īY�>�M.L���+]�后������+���UZ��� �f3��O�¬x������������z	~�}��<BlE��P��.cE�(#�\��r�d;�Lql�7��x_�����?\��U�y��#u�4M��*��r����K"UQU�:��?C��2�O&H0��}�axK��y�~��lj�Ӄ6զ�[2д��a�������O쯑�Y�
��L���(冗?b@P���b�!�f.��n�4��,�g���ק�<�[ȁ�yxp�3�"�`�*WܪE0��;E9�~C�Rkֲ^�e�ǯ�b����^�¶�9��� t<a+�!����N�[c�ތq�o��29��60�(K�6O�(.R(���O =+�#��]x:.��P�
��yo�G�U��K�j��#�"a��i��)
N=��8���2��~3�@�0E�i
X��K�H�	n )�l�v�k&s�f
�u�U6!^�S�$G�)�����dW�aU����d꧞�*��8� ]5��;��1��'�L�Y�0�h�l���C4��MH[LOs`,=��Xe0����e���?Ȱ�>1I(i�h��T����w�}������o�      �   �  x�=�I�����^x�؋'������㦮UU�D��;R}�y�p�֠]4��R�ٲ䳋-��?���~��$��Q-1h��iҲ����9>��4O��sW�h��5�sL��흶X�xrwMk��\z9��������ҹ���j)��tD��'�8K�c��r��XC�<�j[%{����i#��b
�U�<R+�O^+٤��;�k�C9�'�α�Ϩ��iC�,�dI޵*��g���q�&m�r~'�1��Ð���м� ̭��ԨO)e�,;���]o!V�m�gk��Z�-���6��F���o��6�lO�+w�z���l�MYaz�&�J�;�쵼r�̶����Y'����V�:5�#q��(C�LD�<l�0�W;h�]��c��43������Hі<g?o.S(c�,u0�s�q�����7��8ź:�52��x��fٴ�l�7�'��Y������c�iX3/�Cx�g�>;���\<�Bֶw�u��c���z���e�,+�Y���;O�?�/��`>+�P'�SbC�����3�-�u�a�,Adk������(ldfϡe���G�ΐ�0�����Jz��)�=���F�b)�<V�#��뺌��V�
  ��몺�>���J~��t,7�y���C\�4Ȕq����Fy�b�u��% '���H��"Ϯi�ʚˌL\3GHPa{�=��+x˔Ze��D{<iv�_��[�%�S�]��^w�zF޿Ϯ�0���to.p����+�0���@B����mS~�S$R�*��Ե�`��
��\;,ݺ�Ƒ_�Y���-������1�
`"��N�������ai�E���U�+&4Ƴ�Z�3j���G����u�������� UE���N*ή�S$^z�}Pc�F����s `Ͽ9��~�˭<��[_��W�s��3��Pcm�/3�nm�*����3B�m���*�7��� ��W㣀�`!�m��I�Bkq�H?f�o��.��8��{�bݯzC�^M��]-�s.'>R=����7>����=G�ˬ�T)�u���K�������@}�΀lh���2��D+;*i��:��WP,k4���>�u9-I��%�-}^#K�9���|K���'\�t�h؈)��۫�LƧ^g�V�n�Įs�(Gk���no�30�/�8���+�P�_��z�%�f���Ԋ���� �x���;�e^��0삤�����ǫ�Y%W }�p"@xQ�WV�� i�-~>�� ��*6��3<"�� ���ڞ��G�c�~4V�M�DD�@�>��St7�ȝ�g^jrߢC����ƙ0k��'(W�q֊}�����6҉�3G]3���7]�a�9��'��	�O��H�tH)��Ǵ�W��^�w�J�&�؀@�kax1��Z&��P�@��"L�j�E�d�c�o��3�mXպY� D�.�Ȩ5�n�5r��$�FQ���M!z�A
�Jd\��=�����Y��g����b�ʽ��cH�	a3�|�I��Ez�h��\�I��:�#��q�%!�C��k�s����2z�f���b�%��=�g)�ǋp�;�!�������ɓ��ʮ]jC���~W����D�xk���tk,d�V7]c]"5Jꯕ�eX��ծ>�)�gΰ����wb�Ƚ1�>�5]���-(Xaܜ�9�GsCA�	l��ïz�0<WH���6���M�U�|5�6鰃�F6��E�o��$��+`%�7|][���L
T���!��Y,�h���$�T�z�4�ή�@q��><�`>��ۆ�mCZl�9�ɊXMW䡿��<�VX�qCP�����W)���u��q�1%MdI�澞Q3Ki#�t�Y
BB\"v��d�o��Xr�E8��#�f!�I9�˳r���;3�@�j\ %"
�
��)�(�.���ra�gܣ�,Ԩ��::j�;.�O.y=�����{�ȣ1��3��9ͰA~���j�������U��G��t�^�C/]a�*���$M��x��'�1���p�a��vcd��
!�2����qG�U.X��h�@1QB6��������c�1E�=a�T�������3q�;��(yr������8'���Ӹ*7^q����S^�ˁ�,D�θGl"O2G���+R!�������� |
�8      �   �  x�m�Ms�0��s|zMH�p����ZW���K�(
D�ξ��v�t'��~��kB��#8!�b�%!����|A��j�jz��v���m�n\uC�M�8�{����0���`�x��y���1=��cd�8���FǗ^�?�hTiY��{(,�ѯ}�oD>��,S�:���Z�Z��N��,jh�<���̕X�1x�6��U!��2-L�k]Ģu!�B4�o��;��83�D���}�HR��c��#)���^�C� ���A,s0�Agil��S��X�,ĜK� k�$���xCY��cw� ^k6�������t0،��lg��.%d�����Â�On�2���S�M1��2��W� �C�괾���.�����IL�U���&��̒��dm��
t=���}���E��a;tG�>ͺ�W�2G:y�Y/��/�l�y����m��,̗���⿉��:�V���ޡ     