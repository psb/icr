PGDMP                         x           icr_psb_genedb    11.5    12.0     r           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            s           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            t           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            u           1262    40954    icr_psb_genedb    DATABASE     �   CREATE DATABASE icr_psb_genedb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE icr_psb_genedb;
                postgres    false            �            1259    41047    features    TABLE     �   CREATE TABLE public.features (
    id integer NOT NULL,
    is_druggable boolean NOT NULL,
    is_enzyme boolean NOT NULL,
    gene_id character varying(255) NOT NULL
);
    DROP TABLE public.features;
       public            postgres    false            �            1259    41045    features_id_seq    SEQUENCE     �   CREATE SEQUENCE public.features_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.features_id_seq;
       public          postgres    false    198            v           0    0    features_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.features_id_seq OWNED BY public.features.id;
          public          postgres    false    197            �            1259    41037    genes    TABLE     R  CREATE TABLE public.genes (
    id character varying(255) NOT NULL,
    family character varying(255) NOT NULL,
    num_structures integer NOT NULL,
    num_compounds integer NOT NULL,
    description text NOT NULL,
    full_name character varying(255) NOT NULL,
    short_name character varying(255) NOT NULL,
    image text NOT NULL
);
    DROP TABLE public.genes;
       public            postgres    false            �            1259    41060    publications    TABLE     �   CREATE TABLE public.publications (
    id integer NOT NULL,
    year integer NOT NULL,
    number_of_publications integer NOT NULL,
    gene_id character varying(255) NOT NULL
);
     DROP TABLE public.publications;
       public            postgres    false            �            1259    41058    publications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.publications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.publications_id_seq;
       public          postgres    false    200            w           0    0    publications_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.publications_id_seq OWNED BY public.publications.id;
          public          postgres    false    199            �           2604    41050    features id    DEFAULT     j   ALTER TABLE ONLY public.features ALTER COLUMN id SET DEFAULT nextval('public.features_id_seq'::regclass);
 :   ALTER TABLE public.features ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    198    197    198            �           2604    41063    publications id    DEFAULT     r   ALTER TABLE ONLY public.publications ALTER COLUMN id SET DEFAULT nextval('public.publications_id_seq'::regclass);
 >   ALTER TABLE public.publications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    199    200            m          0    41047    features 
   TABLE DATA           H   COPY public.features (id, is_druggable, is_enzyme, gene_id) FROM stdin;
    public          postgres    false    198   �       k          0    41037    genes 
   TABLE DATA           u   COPY public.genes (id, family, num_structures, num_compounds, description, full_name, short_name, image) FROM stdin;
    public          postgres    false    196   j       o          0    41060    publications 
   TABLE DATA           Q   COPY public.publications (id, year, number_of_publications, gene_id) FROM stdin;
    public          postgres    false    200   >e       x           0    0    features_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.features_id_seq', 25, true);
          public          postgres    false    197            y           0    0    publications_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.publications_id_seq', 369, true);
          public          postgres    false    199            �           2606    41052    features features_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.features DROP CONSTRAINT features_pkey;
       public            postgres    false    198            �           2606    41044    genes genes_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.genes
    ADD CONSTRAINT genes_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.genes DROP CONSTRAINT genes_pkey;
       public            postgres    false    196            �           2606    41065    publications publications_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.publications DROP CONSTRAINT publications_pkey;
       public            postgres    false    200            �           2606    41053    features gene_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.features
    ADD CONSTRAINT gene_id FOREIGN KEY (gene_id) REFERENCES public.genes(id) ON UPDATE CASCADE ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.features DROP CONSTRAINT gene_id;
       public          postgres    false    196    3051    198            �           2606    41066    publications gene_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.publications
    ADD CONSTRAINT gene_id FOREIGN KEY (gene_id) REFERENCES public.genes(id) ON UPDATE CASCADE ON DELETE CASCADE;
 >   ALTER TABLE ONLY public.publications DROP CONSTRAINT gene_id;
       public          postgres    false    196    200    3051            m   �   x�M�A� ���T^cxD���[�yA��:���#�x�l�<�T���NhR;ₗ�ֈ6�n���%���O�j9)zi��BOm�vc�e�
�s�F5p��Ι�����e7�57�,V]*��u�_�$]Ġw6Q�Ŋ7��άn�U�*t:�4����zB�� ~�Dm      k      x����r"׶.|��yg)�2��Pg�\v��#�HAJJ�"���ӟ��~N��ub��ˎB4�3g;�o�1�[�F�l������>/�ѷb��y������Y������Y�,7ѷ���:������$���yLG��v8��^&�������MY�����5�G�|_bKY4ϗ�jy�=g�<���|���g����^7�֋h|w[�7�e�����,���Ȗ�n��#x��5���|�ٮ�h�嫧��f]̣�Y9?,��a�W��]�����/��/��%_�eQV�ct�{�=[����eG�W�U6�m�����a=�/��j��������l=�w|o����U��c�FC���d���C����\X�0�=�A˯�S�/�/Q��Z�{a֗�s�S��׋�y�����Q: �A�s�g����	����lqX�_7��e� +'���o~�Q��2�o���7��m�G�6����2s�J\��*_�>_|`h��r���͗��X��鰏�e�٫	�ZXov+x�s��<-�z�^�w������{�{�^���({~.���M�d��]���]�E������(���O����,���rY���%�1�e�⽀<[m|
�wyntd��C���
�S�^�=�hП\F��[��(��� ������,��u������mVYAd��]7D��7��#�F��"�o���/���a�,p��8�1{���}���n�(V9���ؿ�1��c�Жy���F�3�����V�>J�-r8#�u�xػ�[�%\��w�7tyg4����[x��|Y�����a*�@'��!�4*��~W�����Q�~��}Ӄi��QF|�f�����aP��Ń�a���E�=�b�TݩW��
X�����f=_ �(��<[����?�7��vÏ�x�n&�E����c�&|%�Y��iMV�%I�8���1YЇ�G��z3����F͐���
���9�,i��+�"�`�?M�]�Ѫ�t���l��n�A�ڊ^�,�wp��*�����	N5l�9L{n��
= 6]m���@���W9pA&D�����cdk8x���ԅ6�5�ޝd��0<`�Ѕ'�M�.x�t��-ozu�>�4di�`4K�IҠ;~��5�'Y�^����]�z�A%��taC�z��T�j���f��s<���){Z"{���Q�pѤ�M�$��/�2?��xk4߬����zL����˳/,��,�����KA�B6����e����~[��V�/֗�y�t�ٽԊH2emwؿ �=/k��rO/���S5i^]��}����U�^?%1��gq��2#J�Rd���:�v�f��eƉ�ZѸ"�D�չ���sY,4.<Nґ��7k�y��2E����r[�v��I�s؁���������I�sչ������U���J�ꋤ7���5���8��ÂP�f��k�R͖@L+Q:���o��j7�;���W{�����n�g��\�����^�5�f�b]�s��t�ǭ�V'�j�����hvb��ӈ;��Pܼ��VG�$��U��Yqծ����#�{�ݦw�+�*����-�d�E�|�o<z�0��o�Hf+�a���9���=����fw@([d[x��� �D�=��Z�d�t�[�=�@� ��dq{��>j _��~�N�G�$7I��Iz[}�To����tT��z�V��:0���Y	�ǂ�sK>J�&�D�V���Ϫ]�S������
�l�����
�$��:��ư=�Êp7�"��>LB��v)g��Z@�E!��ɧU�&s���z�W�5�����e��K/"���UI�q�M�rCo6uc:�Ud�k�4�Q�v�����Ƭ�*�5_��:"d�ݚ�l�=@�1m���rYQ�?a�d�'� O�>{��$y��;��?��>!c(��9}}��Rh��ҍ�c�C�@��`����\`7����e`/Ų��Lᴐp �kg�up3���q�hT�����jo�F��$�m��rCe��iy3fS�(χR<�> �(N�x�N��<B�|#7�e�tJt�i��Z�+q���Qn� ��W�=&z	s�7���C�I�P��b��G��zX��q݈�a�lG�ʑE�s�N^�AG����$������D��a�ۧ^O��JQ����>H���w��MFK|l&��HF렑���{�]�l��� �����j5ȒR�urd��E`xӳ������(����|��ܛ6?�+Ԉ�,5��m/����=:���4��њf�-(FS��Ǔ�Yg{��f<���<@Q侶�+8Wt�qD���"߂茦B_E���a����ϦB�!6�]�H��l���$�� ������#�ߟ�6�<�dv�Y������s6��޿��hS���6��}�����t�NG��7J?E[���r�w��Ox���z����p{�"w��L�ɣ��-��9FA�Ӷy2ᣫ�Z��{�E��D��B�V�hZ��IpA>��;����oI��Ln��gAm�t4���zZ����heݵ#qJY ��k��H������~�Ơa�����p���1_��u��f�W��+���-#���$��1*z���ӟ������&�Zd�7b����1���)��':d����4�q�j��vn��v�{d��I_�'X7͠6m�gN����;qҸ��{1Lǳǆݍ�fG6�\�y���R�VۍV��n��Ng������U3	l�^��0:	�j�n]\��l�EN��Y���!��b]��ыcTh�
y6�i���^�:gI3n:�P��7
���%6U��0��wQ�e�����y��'���YYn���&�TZJ�.ILC�K����t�~�9�.�Q�b������)��3��E>/J�V+���fQ<�bM�E���2�K���l�s<�pj��(i�����c��F�hU�BH�q��9���Ri�Qh�4QQ��� g�*I�C��JM�h��ƓA\%��5}N�sr�V���|V��ya5f����"h4 ��H�s��&�i�z��Z7��T�؏�A|�*�ݴ_�ΗI�V�h�9��0�j�䙨aN�o�7$��%�Q��}��|�;P��{��^�0/�Β.����q<�Av�n��E�:��o�^c�ϒ�<ۡ�#ZJ��`�m�x���yD��|��M��[(pN�J���N.Qx9�|�}alwZ���YK�b��3X���/��{�O�|ҍ/T7�ȌYu$�L?��'��Կ�f��!��Y��n֋����h�G��ސ5�EQ��dc�}T2�����<HPоi���J���+��?�v���}�)�}�0��u[X��9�.guZo��ϒ,TP� J��G���=l����s�_ɤ�(���!�M���U�]�EI��>����<Ф�ڶ�kK�.�Z�/a�aƘ�������+�n%TZ��0h.i.�7T���K��w��xXF��O���@v471� -����:��\l��|$��	�Gq�h���=C8Qa�WܱҐ���_!q����'�4�5�62�čj�Z���@Ӛ��4��b�MO�s�/���7f2�U�<���ؔ��|K^n�pH��	�0w �?���$����%Z�E��A�K U����=�·�����v'ȃ����,��_կ�����%�4�NH��'/��av�V��B����7�_%��ؓ�GB�?H%
���m��+����< �{�kvo���Ư~��tt��}��b��ۅ�{�+oƿ<H`_�-l�5Z+����R���U��?���z��٫D���ϗ�Jr����{�A��e��)T-'�^,�u�=���V�������a��?��o��fZ�m����A�h�̀]M�����&���2��#�HR�s���n&��d��# �!D�%ivĦ���}�OP����?��_M��O� t��W��?�B�����,����U�487ݡ�F!V�<�d�ğ�ZI��� ȏw4d���N�����1bw�xs@6x�$T�i�M����P,�7]ؚ�����D���Bl.J�+    9���hD'�|$��1����hǁcJ�)���p{�(���=r����5e�w����$�B_�l�����I\�?p-�e�?���`��e�ۭ���ƭ�Ӽj��V�j4�+��vtt�N�YO�[:���*�6����u����L:"l�`��{���.4�jw�V+�i8�R���I`VP{OY��H�m��!�a����L1{���4+�7�:I'`�x��O�ƃ�0���~qy���zSp��I��18�<�����^��u��SԯϒN�8���T�)��	�K���SlP��	@�`�N`���w���%���T�O w�3+�XQQj���.:� �
�>���W�f�RćH�;�M��s1���&����WzdT�IX�]l�ܮw+�*�G��-���t7��ļܼ�U�I9:����AZ2�%Yak� �5�K�p�����n���&����V���̖�V3�����D���j����Q�7��Ԉ;���R�*��DX@�`%��h�J���te�a�J6�qm���[�Kj;�b��6�i{��lN���$�Z5Yw�3�l�Ԭ�#!ׯD��;��T�����0���z�'�5/�ѡ��q�Ѳ؂zY��"� :������dWV��0�N�4�w��O,�`C�����:�G�3Bxʐۋi/�zX6�*>L����<�7e�=ep��^�6jw�_ff&���;���2W��(}� �/5H�o�o�w��ÖD?&N���-�r�����b��gA�i�=D���M�+�1�}N�_��2�� K.>��?�`��bo+������?����e�GĘ�o�H�o?�v�M��u�	F��̴���Z�GaҤ����V�ϓ^ ��n�LJ�Q��Yp��c��Ԗ0��kf'����4����yPX��Cgk�?��8%1
�1���P#��fR.7R��%�N��y��m^qQ�$Ylzls7"9
φN����TꙒ(�J������b��`��QQp������R�A�,O2���8�y��0��+��ꌶ-�zVd]/�r�JZ)A����}}{����O*��.�<��W�FT�n~��4QZ�j��r��qn�*���AOΜ��_�B�Ő�'�/�>�������]",��}湶;�������Ú�MV�*rݮ����3}h����x;�R�Q{u���. �H�#��������xcf�n55�Y�F#"t�1�tc�.���P��7�@Ѝ��b���`�1���ĵ�l�q~v#JJtz���4�o��
ژyj��M�/(�@�k�����'6�J��>�:����^�� �&] ^�%����{��%��Akl�C��1g�D�m�����m�DSB�#�T$#κ��Cߔ�T�@\5�{P�r�CW��mb<����S�|H
[nRsT��
�=
��$�#�+Z�Κ�k�����dB�����j_Gi*�����r�xl�Օ���W1���4�z�s�ܔ��A����Rs��v�w�*i��^���>���)��2�J1yxh���9ꐫmap-���������8n7+�]G��\]�|4T/�K�W�m/`w'��
Q3���~
H���wL�����]�H|@�=���M�!��F�.�D�h�I�^q8�.g�_@���hM�O�j|�z�D��4Fʪ�!�������8뉓!�$��T�	�#��<?ޡ7�%�L(A��G�q��R����!�n�{��z����wlE��V��֛yL�3�i�����h7��NGR��&	B�����'7�"!��N�q�$�	�&�7�.�0`������O�����0��4��������ׯנ�a�g�9B'J����*8�V�@���������� T�ݲ��3P�#L�����X�ν�W�۬�@���j�:n5cv���gة�L_�Z���Ћg2mħL�WgI��5��~��_G��h��j�h��m��*[�t^�� ]pϜ���^g\���*�-P���ma�
�W��Q~˗ P!$b�Y��2z$4�Z��1����@O^ł�H`����"�A� y�q�q3
4Ϡoh�����F�AZ��4ּM�Q��=qrD�+Pٞ��%:4��vp��y��#���V����J��Ab�$�=�()�':7C~.T,�sX$�'�sd=C	i�S\�2�Ӱ6��N�qq��?{ �K��ZBM_zUgF���"ԧ���ypS���0�����q$ż�
댋�b�'��|��Y�3/;Ú��D�
�`�0�~���^Vѹ�[CL��b�g=�U��:�85��CH]�3���ы1x�Ln�,j�&�޵�Z燝E?ON�IE�R��v�-c�N��K���������+,��E�Ssz��r�p2H+1��j�,8�%j�ؔ���40����*����Z���{���{�ڿ�@l 高U������imQܢ����7��uG	������d�ۖ����Agx>Jɦ7�3x�8��w�����:�Β��Ԍ�2��D��e*��΂]���$0���=�[��H���
�+P�0D�����
��ї�/"a����V�ؑ>y��}/�Wt�D�B���4�`ouҿ���N������WS�>�M�T5��}8�һs�}T�������ǿ��E�g��a�x뫢��}�;o�*��͘�LX�
��̺�L�w>���ou�f~X��>mS@�j��.�q�e��!�  ��$�u(��Q��JXhT�P��\*IQy��o�����j�Q����5�.��]��~�{?��v��@C��כͫ ��?����g��ݾ�π|H;ɮjqv��K;�?W�v��vr}_7����@�9f�Jt�8�Dï�F-�����;��C��;��)�:i�*Fv&�1NG3h��(�̱�����h ~�t��h/���vLǽ�� ȼI��w'�rO�	kpLj�E\���w��kC�4�Iȩe7*��M���}��E������|�P2剩���Vj��G�@G�V�cҪ���ɣ�/yv0��mh(�95@�9,+�c�<t�yqX�iT�y���W�3����$����6�]� ��E�q`gC��~F���EI�3�&�����_�Y��O��6Lg�0㰆=D��`7��N���U�P�/	�@��<lb{
�<J�+�-f�{x���A|#n�2�U��W�#z���릙�&�n'I�S�$q+i&m��nO��$VI������K^��C�0��YZ�p���F1Vf�z�Ҁ��.�?����q���U-lG���/p'r��gxG�� Z+T:^��x��px}����a�>
J1_�� �k����Dx�i�L,�480$%}�����������y�6�����_����*��:׾���I�Ѩ_��������FM `0�{!���數�=��`9�����Bz�A�4`�;�;L�P�u.�m@�2� ']s����a̠r��^s���dIC��,��~Z��Y��(GD@��BL�'I+f�G#f�͸d�DMW�Q�h�����r`��� ȣ F� �Z1x��ݹ�!��S  '$��t�P�*��U\/�TS�@�0��;J&�k��y#�=ʹ���ª�
f��.ooR`Q)B|���� �˳[�(���؅��QK�{�ݴO��6��.�%)��w;�{kӸ�ȫw�'�o9&A�,����$K��IV:���F��N����G@�*	��X9)�����A���kv�eAi(7���順����Q�_�I�=*O��,5g����V��s�AXx=I�\��rqz�'7Qyr%)W�Y���!��ׄEQp
J��'S�<)�Na��>�2�y�c��2c��"7��� ����w$�lӢ��1�ب1(_��Rn�Q0�ǰ7��)υ�Hr�*����?���@��g@�4*L� ^:<�7���2�v	H@�B�x�U������7������(D:��s@�g�!�)d:���ǎ�	�?|�<P]�	���Ǿ����4u8�    �H��V{�av�~��v�(M��k��� ŝf��Fnפތ[N�s�ms��1�{W2��m:�i ���NR��56$��i�.ևt��/;zqt�w�\4�`TG%j���D?����\Td[3#�_ݪw!�mK����ͼ�e�XcF1_�x�ؽ�@S6�M�5-t
c :����ds*5�ROF���N�F�lEy/�R6����qؓ*��K)]s�h�OP�U A�h�"°�ؤ}��-F��!����+��< cLD��~"b���>㿲Lݠۺ��tvu;{�g�\������cPO:��	-Uh��b����]��^aW*���&� %������n0~��w7I�OWφ"�4¹e������h�ן�GC_1�i�Y���y70Q#��LY�6�ڱ���-MIk�`���)�"�Z�{x+�Pn[1���B1��-_b�Q+D�r9��!x���Sܙ��#i������ LdV��C�T?�[a,U���7iX5L;G�>A�x6���69�I��m��N�~	d3�)%�\Lӑ\'�9����9�ː���a�ý��i�@��v�ۋ��h+�=<^S���+E���phM�V:���8�6�W�@���'���>|�@��sV�j�]�$��z��;����7��M�3y*�W=��(�<ȭ�;�u&����������pҭ�|8��O��F����cn������NW��>L�i�L��&D�z�j����
hdq�]�P�@�7wiT�D�.�1�3��2w��|�D炤0�� X
O0�4�e#�S��\J�?�A*Zv��_��N"�h���#\�b�H��S5r4�/�B2vrw��bL�n�7[��$����w�c*GJ���v�瑑�����iN���͠p����Ԓﬕ�t�I0�#Ǭ������r��Ãg�=t��pV���3P�Q�"�(T�_"!CH����A4�#oHŻ֍�!w�����$�R�ɤ'rpzXǭGvN`��_�& �"Ö2��t��hDi���c��
�2٤��������V�e�ҿR(}�!��}�~����5,��|�Mǎ&� VOK���hJ��g�4�2{D�������n����@�v���W�">D�	��I�j�Y��!�+�i�0��
s��
)쨰$�;�;�7���ߟ�i��q̿I��N�Ä�RP�|���u��ՋmcW8�#�(:�" 8��}�Z}�L�M�����툗os��c�LV��ny�X���,jC�:y?ɠ|"��'Q�0�b��'��6���#(�~�ڟx��Q���m}6� J�G\����b���f��<a�i�5ڮAA�-UB
?���A�G�Sգد��P���9�v?T9��H�{�J$�,�DM!)e��3�v	�Ϙj�4�YU�
�~Jb&-ڀ�X��>mv
'B����hy�)fD<��3#%�G�3�{�G��9��N��1�cgJa ��t�I1��P����&^�nvW3b��P`��5��0��i�Q��.�*4.9�U?���a�H�{��{���[S�T)/��GRn!:(�D�S1]�P��B�Vd;LL�-��-�H��ۭ�o#���:�6�TD�v�Q�I��S ����t{�K�����#�|����z���f�p�=#�E���K��,�WD�F!���$.���逬ID�U���)T���ի}ya��P����a�
������Y��T^U�J�Z���j�A�t�q�����<>��T�0u,�<�d2I�XŠ��� ��m5�}o�ф}�^��Z��z�-��U+9�j��gI�����R�k�sM{X^�C������0S�&A�û�k��u��~���X��9�P	�0F��k<�����^W�^a}7��ۀS+3���ʂ��Ԙ/��l����]BR��N�����d�D'&Ψ�c�ʦ��O=b��7i3����%�'7?���A.�tjdܵm��^��wm
0,X��/e�#l���c���(s@j�{ù��,|I�g���I.D)67_��|cQ"2��]ۨS�
�#��K�=a4���
��x��K�LL��r�,�+�����K\Ao����p!<��6�>N� '�y���:�*y�����י�����äjy��ᶞ�H���5���t��I�1m9Z@H�yDf�,3@^)��?C9�J���Bxk���ц��!�=nq{R�M��A�w?x?Qigmy3��f�/�ϻ��_!� �����~��~t�gaAu�j#Vi�<E�x�(��@��Mzc�S��+nKwj�����J� ѳe~ ^P��M;�J
/�`�o�涴�_�����#<��Ł#Ֆ��n����V���^�ŭ�t�\�
'��5�ą�SaF�*������p����P��ݐ#5���$�QO��F���t�C�E�-V� ��:���Y��҂�_F7JlS*�9��s.v\u��"�������J:�=�44��%h��+�F���x����l8��i��̀�\W����Wl_i���X5b��~A%E�T��J�7������sZ�?����ĕ�6�����Ȉmc&��n:�w1�Ǌ|C��J�nnNǢ��T����A�r#�Gg������T-�e�06Ə��[�u�.�gd6<}Ƅ�ߒ��[$����bʜH�􌮓�:�J���O�Y/M�٬W����I>��M�Z��o@a�@dA�E��T�3+���%[8��#i�W�1"���̊'=?�-L�b2JE6e,� _rn��z��kZh
3:�|��h���1����s_�C��7�V�����7pi����4�����z�D�ZUU�3���kC'eQ�P��@�D��* .z;�F�cԐP��v��`����і���%,���?��)��,у�%/�t?�3
T$�z��d�?�����Y�|�l��l�?P_�:l����R�р}H�0u�,਋D��&Eq�(q�Y�(�S����J��ʶ[���'&�4��>���c�l6�R��ɠ�v�Zwx���w�R�%��J$���Ǯ	��G7���Je���G[���:'�'[�Q�+�g��
D+P����)/��±���^��6.[�P�B��I �������3�=u��5�!9n�\�W�/��HZק�<�ͳ�};r���F�q��A���D_{�����tt7Fՙ��BGo�f�0Fy�
E��BpḎ� b�]��f�B@�|fk�byF��:S��jHv!����J��� GH2�"�ҏ��-䡌�"C��ZErH�}a�0�&�kϴ��@u�a���}Zn6�J_��ҁ"�
|V�A�>ȑE��|��������Vc�M���Q��� �P9�bG��X{-��iB7HS)�SԤ1k�,S��^N�̛�c/����^:�� h��j$��K��G�p��#[�v��H�����qQ���]o�4J���'�uİw����R5�
,
��7I�	�H��-�����]N����¨�kv�^
	+�N�g�y��e��Rg8��W�|���<�3�ޏJ(���;�R�#����}8�)3��C�k�-C�>?o��NH| �uz�&+H0�PA�v�9�NL`nOŵ>R��18JB��SQ�2�n�kI���NQ�]�l�[cv��d����l�<�7�2;ӌm�:'��1Y��x)P��"�䈎���A�8~{[˸'r���BW�~����E��o�l�I{O ;�k]p���?����
���C�'m%ġ+��'�����p
�h�cA�d9ĐL{Eũ�.e�`���!��R�6��K�\
�e�U�>F��	�����U�3GS|�u����
+jr�6�-D���� _��jJ��4����8���V�l�g����F$l�	���k��������u�u6�ݼS�~v]w}ɏ�������� _A�zD�n�,�
���Q�

����� K���%���`�ʻ塊���p�"҆��>U�ŉ�Y�
���]����wg���4�fP��L�a� ��J���%L�ʻ�ş�g�c�a:������    �i�̏־:k&��=�($�=�ҡw�ފ�;q줥Q�zzS�~{ͷ c��o�����[�3�fbJ�}}+Og�v�l`;a�C��n�j��R��3�*�T�dU�h��՛�L�\��QT�^,r]%O9������X2h�)�ڤH_"�e	p�
����l�B��Lb�@�f&NgH�H��É*m�c���I:����b'V��/����!��A��q�S"�Hά&E�3	#�0��,Œw�F'�iVAZ��Q�T'�^�M�90|N��K�"�L%���
�B	�J*ņ?�+���*(�*G���ZF�H�A�K�kU�7���n��
]F����,��X��w qy?�0��f���ȏF�3���٘"��\�%����O�n<3�B�r�()�j�#%bC��a�az�݊QA�<����"=S3�US�\��h73D��y�)}.4b���F�� =�ڀ��|Zlж�P��K;;x�� y��؏{C$s�vQ��)Zy�@Hûƻ�;�e	1��@��\o^{���t��Bg.0Ao�++���0���~_����Zb@L��R%z�~�p��(r1�-�(0�ZV*\{&�!���]�~�?�<�5��Tny?��H�V"�?�Û�>w,�m���4{�X�E���D��e�$�`	Z�O����~�P}d�l}L6��mG/�\�����"�j�m�����DI���u�F1 ��`�>�����	H�!����H]�C��P0~�� g[��[�֜���58tY����������Z�xX���o66���<Q{ܝә�S�8��ȥ��Uo�nw
�_;��q����S�H�#@��?�5�]>0���[Yj��������p�@5�i)�2бу�o֎��0ح��������>��b�b&��K&86�������S�q/�wTރ��tw�g���*@�	����@\�$�b蘗c�j�s�t���OVOʞ��F��g�ZU'��Ʒ���{j�12���+�Ơy� �5'� O�0�$N�ԉ	4���^[�ڦ��������O��y�.Ա3-Tʋa�"C���gWL(MA�$���# ���g �����9X�^?.Uuژ�);���3/�΍n����Z<�p��)B�p�2ܶk�-�f55/>�Xϡ�����83Y��|Ψ���|S�|����L3q�����������N��7�@�)�j%p2�vc���Yryv{d�Z�H��<}H�Z�^�����HP�z�:!A]���f�A5��ibF5">����hFb��xƿ��&�7���v;Jca`dr�R�iq���.D��K�cA'ܻd�_z�@�X�i��v�b�	�iv3s&v����9�d��[�h�f����%&V��gNJne�)9��!�.^���}I��p�	���ceϲ��7��f
`�\�(�aq���$��FI:'�Ґ랩R3���$��+0{K���_a�~�&�B:��=�'z�Z�B���жS��dq�o�/@��m�f�crW�1k���		yP�f[idP*,/)�w����d{'���ͷj��e�+�hٛ�z��rߐ]ͨ�'�{@e�#��!-��]�0���Q��� ���傓�I��fftA�:m\���d�fa���yy����o��ް?�n8�����M4� ����"}"g��7Jr�k�vZ7��u~J�[��ކ��P<
@��~A[��.�r���n*���2���D�r'��O �lq����V5S�łe��m��!�0�d��� �m�S�4
c^T�p{Rt�(����j�<r+��;�A����w7��5����w3|��|��]�f��)�3O��n|r��� Yb|��2��?��8�'#}��d�8�~��v��0�s���җ�-^ze������c�	Eh`��Z����x5�NL���N�˩�H{3P�A�B�w�vǌnYi�!-Bj���>��u�jmȩÆ����H�,r�l_�R�W�-k`غ7Q����v,W�G�>Bh'#;����M���<������
JRɍ�D�O��d@�=�j�:�&���V��b�́�¹r�N
`���CxM�Y�i���}�Y���p�g��,XL��Q�a�${��%F�-:��S =ON�A}��Aj�̰.c��?�=�j�5O�F'J���1�� ��y�bHŸr/k��jC%�8�ZR�l&w:���F@u~~2��:�����+�����x����>И+��F��>�^0�uo���wTF� q�z8Y7������0ڈVTǉ���d�sR�.C�QU1��E�?��Ca[T��x��$�b�8�����%g��2n�s�DE�bC�������b��lJNV�pe�?Vu�L#.��lAj�����T��$��m�lo����p���:�>��`<Uo:2b6�F�%/j�f^�����R�ug��7�`���:Y�Y~/ӄ�ig ��8[#ޜa�vT8�X�Xؙ(|)]�\R@�/vwo�ӓ�����w��&m䈨�O��?5�?�[k4��Qz��4�C&�
ǯ�~�ͻ��n�?�ʔ��������X����K�w9����	A�U/��1h��O�vpl�M�Y��I�t��B�0^1�� 9�I5^LΕ]n��5���e�Oƿ������c9���I�1nbtk�*�/M�~��L��+T�ԥ�d�7���JG�`n���gx3�`�{F��ǢE��҉��ֵ���Ud���e�{��wN}��Sd��$���noxj�F��G�1���X���Z���A/��&�:U��u֪�U�QO����7T�yF	�)B���s�����?���仹�q,�̉%���G��@�X��d�:l�2�w�[Ǝ����4e����@m��EM[�aUu_��cD�o����@���JX1��<?��g�rIz��i$({%�ɘ�Dg�d���Rd��-����T	��I�	<r�}^��"����� 4�� ���A-'���<�:S�^Tq��W%�S���W*fK�y�����|�!n�~&E�62���V��-h&���k�� MN&;��zr*j�D�d�d����P�cC?�7�;y`0�Ot7����:��f/e-y)����f�F�T��z��h��͟�A,���ה�t�	X6&���.���6Ax�U	bN��k� K�
��ں���U ���\����]������ 'J �t.L��w#�y��$���ր�gX�'��X��h]B�`��$�j5;�f��;#(Kܹ�����a��z q<�������*o���{&�.���a|5I�ȯ��8�%j96S�7��	�q3���G�x�V��o/�b�q���S�В3X����46����g����Hl���ߚ=|�)	E�1U��{iśf):��c�/�6$I����x]L����t����b��̳�VHb��e2Mq97/9�b�vB3 �n�ǵ�X����ߜ��TR�Q�,�a��h�6+A#=0!5�c�}G��.�s7�N��X����'�ek��aÀ�,S^���aT5���Ҭ �q�)���JI�݌����7}/�1	�IF�c	��Z�K���n�ۧ$��Y����XmH�1��׏�M�0�(�����HF�R:p|���u#���b&��?]1P� ִ?���T?�.%t�T�8�Qq��IK=I�Q&���h?	�Y.�鰃�Ӧ��FM7;��
�%�j�b��X.��y�H�<;�TW-#���S�V��>�q�����Q��� �!S�Fi�;����,���y�~(�����Ù��ׂ��!l�X���R��ۻ	V��t��P%���ֿ1rv�n@��6��b�M��Տ�����|F/�c�����O�b�d:�<�N�d�����t8�t�^F#�액t��*�̒��d�.i��9��I5�R�/�A�[�������� ��g�@��$R��m �@E	jD>�{7��/4�؉�ʖ$� !+	�,��\����y_���_����~�Xg�E!�FE�� �
  �c$UŮ��c� ~�UN:�båf1*u6�d�Bʝ�"T�X{<��b�	Tx��+O�Y��+�}Y�Ee�VLhJJYr�p0JK��kd�D1I��M�)(e�<�@���(�כ#�p���X�&�t�
��9.ꅙHｽ[��-/xkE�ӡ-��S�G5����G��o�K�ڵ��3ժ��3&D��"�5��FV�p�fPS���q��m����t�a���s#3u�������Sbɷ�P	R��oR�wy�:�l��6O�F��L�D���ho8]�ZÏbB����aK/�0��\��G��qҾv��3�zП������䃒tvB�ƆRn��=�����a;�A凴���[�h�\$�dZ��N^K-�+N}�eHEf��QЎ�*��D�\�F��Y#�壥�ֆ4՝�/�\\�����1S�Q�m����ݨƃc�V�j�{�e�|[m_�L-�W��R�Vp�L<��2{�3�j�3�)��@�X�߃�"�~p��Y�Fr�A2�VrBQ�V!��;���\�t���)�o��>��7�A}<-p@�V1,�����y�Y��Û������_�Ƶ��s䜏>_p�Oy��ѹQ)C�ZEtO��X�#���Z$3ֹMa$u���'JF������zO������`<�5�V���$��p�¡1^)�s�@:9|8�zf;�E����<���=���*|��U����7{ϘT*�k��3K��b*�������}�O��l��e2�ǯ�o�xK0�^��3"�rK�-�f2�ZA	����T�m"�o�q��,�E��-o�]��8/�<�)�>V�p�ͤs_]\�}y�FpL��5�X�}�Ћ���:�wN�kͳF;�;�ڰ�lC���nӿ]#�_	o���`�͒$e!A�UyU������H�$�\qNq�Ʀ|��ԳgǪ*�z��*g鈆�g��Pg��3=�(˘��^��7z��bT��,}��	`+���=�d���z��)���pl�Og$(�]-���">h�o�T���kEITz`��]&��w̠�jL�^_�3.鞽����`�������=�������%���ϊeit���~J!W��K�O��b/�*�p��gd3��SQK�R���v����U���H�+������0tB�Is���d���h}  4
���^�좑�ܐH�f�"x�4.�xbg�����V�H�i$bW�Y�]"�4�(9����P9)[��"
禈$��P�2lR`:��(�0^;AS��4f����ONI5lP!��(Ӿ��CiXZQFc�i?oڷ�׹�^7�����WU�!�/P+D�>C��u��EFʷ�x!��2E�)'��~���׭�����fUU�j�IO@��U�t�b��~����nb�k6�y�Y�4�
&�r]�zp����-�_��Ҧ�����"N�ٞ�c�O� ����Cc@!�T�g�0l��t6b"]+���^s��
���Q�Ք�d��9fc�`���ʧ��H�n��}ݔ+�d�*ڃ�:��O�Ӹ���٭I)U�r��5)W�����~�����}+�ӱ��c 1=�]������ܲ��g�gyt|�
��K0y��F���W\RE� �"��[���^o<$���/�J��3�r8���/�B�f�Q/�;�������T����͞��G!��]�Q^�D��#0][���yHL$vF���@�E��s�+j5��z 7����8�l8�v�����Z��^����[��)!?n���`6�y��-Ұ�ۘ���*�1�~i���;W2(χR�V9HT�\��+®r/���ŋPg�b��t�Lj�fh�_t��E�.	�ޙ]Ps�rٰ7߾aZc$4�8�hd���
<e�Lf��T�4�bm䊞��Yp{�6�9��Ί�Ǔ���rF�KS���]9nLr � L���)z�I��bF�����-��������S�a
�9�$����EU!�a�{��3�+dl��jg�R�O��c�+���-�H�
�7�<?�0
��E�fk��$:�/1���N�c|W�u?�  �3S�@������p��+���k�{�����k�S"��t���bϧ����?���ݠ���V=d�l*2衻����(�lp��q�8m+L�t~wa��&��\`�G5��d�5l%�5�]b�X�-��k���cv~��O�1�fJ@��WB��E�y��G�R�q��aWJn�.�܍��rr��MS�������H[�F1�I���qS[r�n')�����Ӻj"vi��IC����������`��}�-7K���*AdU`�e�v�q}�i���N��n__�T�R�H��-�ѸTe�IϿ��$��O&G>��2���Bݙ�sp�xe��i�0��kX�vZg��9�N3�`ԅ�ȉ�ۛɣ��R��D��X�:�m����ly����^V�k�t�������v�dҠ��9hߊw� ��l#�����Wq�ٺ���a����\��%$Ț���5h�����6��M����l��h:��N��H��_(-E��'�����"���l���?�~kdFi�f������Ppօu2N^��-F�iD���BD����/�T�IF+HC<
IOPW�@i�i�����3�0+Ʀ���8��	ZQ�I�?�|0'��Z��vA/�N��]������C}%      o   r  x�M��,'��;����o��;����0�n��~;M#$1��O~��Xu~��R��]J3���?��Z����-�wW������|��o��,}}�����O�s�7����{�|RB�O(r�挢��R,5�9�pD��f�}Ҩ
*���ڵruJ�+t=�V(waz���R�Jzu����05�񏔡�����Rm���~C�)J
�:��a�c��W���R��;������㇙;V�ÎR�'0R���c�v��ߊis�!l�A�:j�W�~T�xrǪ�F�Ҋ���U��X�������QJ��Y�Ҋ8�����&��F�(ݱ��4H]Ҫ�5�:9o���������fD�;�_�����u������Һ�li���!�7��Ii�g�_i q���G\l_xdR�8j��m�چ��(�u�·g;��k���|�Fu�#�t��g΍��3GuG�~c�s��"�n���V7ai�Nu� ���'��D(X�y��_�D,��a���Vy̼b�x�Z���n^D�2_c�w��S��V����żA���Ђh���ph��K�X��yz/���^�ݕb��0P
��؎,_��%�á� ?������������`�=d��P�F�hT	�[$W��U��8�"��Ӳ
����6M�MNG���-��)%O��fah���Enz������P/t��ҝ��\���C�B�^EY�bB�Q��=h�C�1+;��]_n��CE�u<SR�����=�-_K��-�����X�ȪR�x҄j�}p/�oΗ[�k5��B�;|u�R��'T��VJ@l�aᘦ/M�������!\nQ<�Pp��1�bɍ��x7���յ'!�:2�sk�Y	tS6���V��tR��h&��3������v�Ǉ|Q�td2�x��e�2�v�8���xI��V6AN���<3�����Y m������ޱb�j��;ǋ���hy�Ґz-��60H@��8��	�/��-�2��Qa�����{�Φa�[A�a��#/�������r�t[��^J�M�/������V����򄕟���!�Q�B��}iu�}��~߰r�%� AenIx�*�X�5���s����=�t�
I8�@�$��C?�XߩdGy�~���і� �;~��A�}(�'-��,�o[9!���
�bTs���9V���{�%��l�����N�ƊIf�$Z�D�Y1�z��EZ�u��:��,���&2�Ͱ�n�;�'V�����A�����nE�9�?�xI��7�������|L4� E{<��J�"s��+\9�h���4��H"�r�	=���@+y�����k��3��Hx[N�A:כE/�`��F�ԇ,,v�XA �D� h$�1��Ӡa0�f �?y���j�O4%Ëm����v������j��Fj�n� �DF%Y?|U �[�x�b"+�g����r�Mp������l%���:2MTQ2Pp/��#��Ɍ%K;������D��D_�V�����؛pcN�,�Ɋ��_1�9N ���$/�Q���j!�"Q}H��6F2�I�פ���=�l�k �Iax������CZ�ݚ�t*(H7{8���%�&T���JhP��x?��|�,�u�L2$�-4�p��
NB�����(z.ɇ=Wb���
��,����V����6��3����$7��kٻ��UAV|����Do�;˳D+Z'� 'c��N�)��$��� �x�U�-H�K�+5
�>��dg�[�E;����R���x]�D=�'�"/O��C_���7Ϡz��{@{��$���N,z���d�ƍ�:?W�@%���&�Z5�b��XVx[�My��D�I o��#�*zcm�f������}��Ny�     