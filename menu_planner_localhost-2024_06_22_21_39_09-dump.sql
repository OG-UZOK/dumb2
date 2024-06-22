--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 16.0

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

DROP DATABASE IF EXISTS menu_planner;
--
-- Name: menu_planner; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE menu_planner WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE menu_planner OWNER TO postgres;

\connect menu_planner

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: dishes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    date date NOT NULL,
    user_id uuid,
    calories integer NOT NULL,
    proteins integer NOT NULL,
    fats integer NOT NULL,
    carbohydrates integer NOT NULL,
    amountportion integer NOT NULL,
    cookingtime integer NOT NULL
);


ALTER TABLE public.dishes OWNER TO postgres;

--
-- Name: dishes_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes_categories (
    dish_id uuid,
    category_id uuid
);


ALTER TABLE public.dishes_categories OWNER TO postgres;

--
-- Name: dishes_ingridients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes_ingridients (
    ingridient_id uuid NOT NULL,
    dish_id uuid NOT NULL,
    amount real NOT NULL,
    unit character varying(255) NOT NULL,
    id uuid NOT NULL,
    gramm integer NOT NULL
);


ALTER TABLE public.dishes_ingridients OWNER TO postgres;

--
-- Name: dishes_on_date; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes_on_date (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    dish_id uuid NOT NULL,
    date date NOT NULL,
    number integer NOT NULL
);


ALTER TABLE public.dishes_on_date OWNER TO postgres;

--
-- Name: dishes_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes_tags (
    dish_id uuid,
    tag_id uuid
);


ALTER TABLE public.dishes_tags OWNER TO postgres;

--
-- Name: dishes_type_of_meal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes_type_of_meal (
    dish_id uuid,
    type_of_meal_id uuid
);


ALTER TABLE public.dishes_type_of_meal OWNER TO postgres;

--
-- Name: ingridients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingridients (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    is_liquid boolean,
    name character varying(255) NOT NULL,
    protein real NOT NULL,
    fat real NOT NULL,
    carbohydrates real NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.ingridients OWNER TO postgres;

--
-- Name: physiological_characteristics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.physiological_characteristics (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    gender character varying(255) NOT NULL,
    age integer NOT NULL,
    height integer NOT NULL,
    weight integer NOT NULL,
    daily_activity character varying(255) NOT NULL,
    target character varying(255) NOT NULL,
    body_mass_index real NOT NULL,
    calories integer NOT NULL,
    proteins real NOT NULL,
    fats real NOT NULL,
    carbohydrates real NOT NULL
);


ALTER TABLE public.physiological_characteristics OWNER TO postgres;

--
-- Name: saved_dishes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.saved_dishes (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    dish_id uuid NOT NULL
);


ALTER TABLE public.saved_dishes OWNER TO postgres;

--
-- Name: steps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.steps (
    dish_id uuid,
    number integer NOT NULL,
    title character varying(255) NOT NULL,
    image character varying(255),
    description text,
    step_id uuid NOT NULL
);


ALTER TABLE public.steps OWNER TO postgres;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: type_of_meal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_of_meal (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.type_of_meal OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    role character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (id, name) VALUES ('9305fe49-029f-4659-b198-ebdb8e670b40', 'Первые блюда');
INSERT INTO public.categories (id, name) VALUES ('f7bd3b60-b27f-4c45-a50d-aea968ec055a', 'Вторые блюда');
INSERT INTO public.categories (id, name) VALUES ('dd65ae0a-84f5-440c-b071-f412a83ef4d7', 'Салаты');
INSERT INTO public.categories (id, name) VALUES ('f0f52882-8415-40b6-a5a6-15fcb0db6858', 'Закуски');
INSERT INTO public.categories (id, name) VALUES ('37e7b790-f73f-4f3a-9aa5-caa78b39588e', 'Выпечка');
INSERT INTO public.categories (id, name) VALUES ('bf68ae6e-e8cb-48a0-8afb-6b96f0b7fe68', 'Соусы и маринады');
INSERT INTO public.categories (id, name) VALUES ('298d51a8-fa70-4b5a-9a86-1a9346e77a48', 'Заготовки');
INSERT INTO public.categories (id, name) VALUES ('51f5a690-f384-4a03-be60-26e54b737cf6', 'Напитки');
INSERT INTO public.categories (id, name) VALUES ('2ab7ab96-707f-4481-9896-fc836c1099e5', 'Десерты');
INSERT INTO public.categories (id, name) VALUES ('fd1687e7-185f-4f63-8d47-9bc8cbb868c8', 'Гарниры');


--
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dishes (id, name, date, user_id, calories, proteins, fats, carbohydrates, amountportion, cookingtime) VALUES ('cab89d17-a89e-477a-a3f3-e53860bb1835', 'adfgsf', '2024-06-20', '78660791-4b10-4077-9bae-a414f7ea0c0e', 207, 36, 3, 9, 5, 45);
INSERT INTO public.dishes (id, name, date, user_id, calories, proteins, fats, carbohydrates, amountportion, cookingtime) VALUES ('23e16ece-f8b5-4ebb-9ebd-c2c0aeebac8f', 'adfgsf', '2024-06-20', '78660791-4b10-4077-9bae-a414f7ea0c0e', 207, 36, 3, 9, 5, 45);
INSERT INTO public.dishes (id, name, date, user_id, calories, proteins, fats, carbohydrates, amountportion, cookingtime) VALUES ('a70dbdf4-8a0f-4ca8-9a85-7c771715f2cf', 'adfgsf', '2024-06-22', '78660791-4b10-4077-9bae-a414f7ea0c0e', 0, 0, 0, 0, 5, 45);


--
-- Data for Name: dishes_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: dishes_ingridients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dishes_ingridients (ingridient_id, dish_id, amount, unit, id, gramm) VALUES ('c5eb22f8-cb1e-446e-9844-0d31ed0c5364', 'a70dbdf4-8a0f-4ca8-9a85-7c771715f2cf', 6, 'Kg', '3a6dc2f7-7b42-43f1-8bdb-43ba4f7a3e5d', 300);


--
-- Data for Name: dishes_on_date; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dishes_on_date (id, user_id, dish_id, date, number) VALUES ('43b54066-8188-4da9-ad9b-14839648e500', '78660791-4b10-4077-9bae-a414f7ea0c0e', '23e16ece-f8b5-4ebb-9ebd-c2c0aeebac8f', '2024-06-18', 1);


--
-- Data for Name: dishes_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dishes_tags (dish_id, tag_id) VALUES ('cab89d17-a89e-477a-a3f3-e53860bb1835', '32bb3ea7-d836-4926-a545-8b0667117419');
INSERT INTO public.dishes_tags (dish_id, tag_id) VALUES ('cab89d17-a89e-477a-a3f3-e53860bb1835', '626f7e0a-90d0-43da-b781-1354c127b744');
INSERT INTO public.dishes_tags (dish_id, tag_id) VALUES ('23e16ece-f8b5-4ebb-9ebd-c2c0aeebac8f', '32bb3ea7-d836-4926-a545-8b0667117419');
INSERT INTO public.dishes_tags (dish_id, tag_id) VALUES ('23e16ece-f8b5-4ebb-9ebd-c2c0aeebac8f', '626f7e0a-90d0-43da-b781-1354c127b744');
INSERT INTO public.dishes_tags (dish_id, tag_id) VALUES ('a70dbdf4-8a0f-4ca8-9a85-7c771715f2cf', '32bb3ea7-d836-4926-a545-8b0667117419');
INSERT INTO public.dishes_tags (dish_id, tag_id) VALUES ('a70dbdf4-8a0f-4ca8-9a85-7c771715f2cf', '626f7e0a-90d0-43da-b781-1354c127b744');


--
-- Data for Name: dishes_type_of_meal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dishes_type_of_meal (dish_id, type_of_meal_id) VALUES ('cab89d17-a89e-477a-a3f3-e53860bb1835', '08759405-cb6d-4aec-ae21-eb11316cce61');
INSERT INTO public.dishes_type_of_meal (dish_id, type_of_meal_id) VALUES ('cab89d17-a89e-477a-a3f3-e53860bb1835', '31d25dd9-b29c-4332-9652-de4f93046177');
INSERT INTO public.dishes_type_of_meal (dish_id, type_of_meal_id) VALUES ('23e16ece-f8b5-4ebb-9ebd-c2c0aeebac8f', '08759405-cb6d-4aec-ae21-eb11316cce61');
INSERT INTO public.dishes_type_of_meal (dish_id, type_of_meal_id) VALUES ('23e16ece-f8b5-4ebb-9ebd-c2c0aeebac8f', '31d25dd9-b29c-4332-9652-de4f93046177');
INSERT INTO public.dishes_type_of_meal (dish_id, type_of_meal_id) VALUES ('a70dbdf4-8a0f-4ca8-9a85-7c771715f2cf', '08759405-cb6d-4aec-ae21-eb11316cce61');
INSERT INTO public.dishes_type_of_meal (dish_id, type_of_meal_id) VALUES ('a70dbdf4-8a0f-4ca8-9a85-7c771715f2cf', '31d25dd9-b29c-4332-9652-de4f93046177');


--
-- Data for Name: ingridients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ingridients (id, is_liquid, name, protein, fat, carbohydrates, user_id) VALUES ('c5eb22f8-cb1e-446e-9844-0d31ed0c5364', false, 'banan', 20, 9, 30, 'dab557d4-0c3d-47eb-a19a-b6f414a67830');


--
-- Data for Name: physiological_characteristics; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.physiological_characteristics (id, user_id, gender, age, height, weight, daily_activity, target, body_mass_index, calories, proteins, fats, carbohydrates) VALUES ('fae7ce3a-3e31-45ac-83a8-1dcc63c00af6', '78660791-4b10-4077-9bae-a414f7ea0c0e', 'Male', 22, 190, 67, 'Низкая', 'Набрать вес', 18.6, 2771, 173.19, 67.74, 367.16);


--
-- Data for Name: saved_dishes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.saved_dishes (id, user_id, dish_id) VALUES ('f1112285-c1ab-41b4-b76c-222e3cd3d75c', '78660791-4b10-4077-9bae-a414f7ea0c0e', 'cab89d17-a89e-477a-a3f3-e53860bb1835');


--
-- Data for Name: steps; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.steps (dish_id, number, title, image, description, step_id) VALUES ('cab89d17-a89e-477a-a3f3-e53860bb1835', 1, 'Попросить их у папы', '9ef4068a-96f2-4537-8cdd-d8d16720db0f.png', '2 масло в сковороду', '43ac6a02-a8d3-40b0-b368-1233177a549e');
INSERT INTO public.steps (dish_id, number, title, image, description, step_id) VALUES ('cab89d17-a89e-477a-a3f3-e53860bb1835', 2, 'Попросить их у мамы', '9ef4068a-96f2-4537-8cdd-d8d16720db0f.png', '1 масло в сковороду', '7f222efb-dbed-4ed4-9450-14c70b0e5db4');
INSERT INTO public.steps (dish_id, number, title, image, description, step_id) VALUES ('cab89d17-a89e-477a-a3f3-e53860bb1835', 3, 'пойти на работу', '9ef4068a-96f2-4537-8cdd-d8d16720db0f.png', '3 масло в сковороду', 'c3046e96-c74a-4771-b78f-c65df8c93ac3');
INSERT INTO public.steps (dish_id, number, title, image, description, step_id) VALUES ('23e16ece-f8b5-4ebb-9ebd-c2c0aeebac8f', 1, 'Попросить их у папы', '9ef4068a-96f2-4537-8cdd-d8d16720db0f.png', '2 масло в сковороду', '626a8be2-4dff-4c21-8f84-cebcddeb451d');
INSERT INTO public.steps (dish_id, number, title, image, description, step_id) VALUES ('23e16ece-f8b5-4ebb-9ebd-c2c0aeebac8f', 2, 'Попросить их у мамы', '9ef4068a-96f2-4537-8cdd-d8d16720db0f.png', '1 масло в сковороду', '768fe503-9708-47d7-b701-238d6d156358');
INSERT INTO public.steps (dish_id, number, title, image, description, step_id) VALUES ('23e16ece-f8b5-4ebb-9ebd-c2c0aeebac8f', 3, 'пойти на работу', '9ef4068a-96f2-4537-8cdd-d8d16720db0f.png', '3 масло в сковороду', '54039d7f-8f7e-4e23-97d7-140a7745d68a');
INSERT INTO public.steps (dish_id, number, title, image, description, step_id) VALUES ('a70dbdf4-8a0f-4ca8-9a85-7c771715f2cf', 1, 'Попросить их у папы', '9ef4068a-96f2-4537-8cdd-d8d16720db0f.png', '2 масло в сковороду', 'd084937f-1006-44b9-95cd-494dddbcaa74');
INSERT INTO public.steps (dish_id, number, title, image, description, step_id) VALUES ('a70dbdf4-8a0f-4ca8-9a85-7c771715f2cf', 2, 'Попросить их у мамы', '9ef4068a-96f2-4537-8cdd-d8d16720db0f.png', '1 масло в сковороду', 'fdac673d-5324-4e9c-b0ab-c5b6507279d3');
INSERT INTO public.steps (dish_id, number, title, image, description, step_id) VALUES ('a70dbdf4-8a0f-4ca8-9a85-7c771715f2cf', 3, 'пойти на работу', '9ef4068a-96f2-4537-8cdd-d8d16720db0f.png', '3 масло в сковороду', '376abb7f-5a73-458b-9b95-8a8854e463f7');


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tags (id, name) VALUES ('32bb3ea7-d836-4926-a545-8b0667117419', 'fruit');
INSERT INTO public.tags (id, name) VALUES ('626f7e0a-90d0-43da-b781-1354c127b744', 'post');


--
-- Data for Name: type_of_meal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.type_of_meal (id, name) VALUES ('08759405-cb6d-4aec-ae21-eb11316cce61', 'Завтрак');
INSERT INTO public.type_of_meal (id, name) VALUES ('3750f7e5-1959-43ef-bd48-161e13849588', 'Обед');
INSERT INTO public.type_of_meal (id, name) VALUES ('3ea917e8-fee4-4ca5-823a-1b2bed253368', 'Подник');
INSERT INTO public.type_of_meal (id, name) VALUES ('660a0083-e4fa-4caf-8f55-fb26aa4f4267', 'Ужин');
INSERT INTO public.type_of_meal (id, name) VALUES ('31d25dd9-b29c-4332-9652-de4f93046177', 'Перекус');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, name, surname, password, email, role) VALUES ('78660791-4b10-4077-9bae-a414f7ea0c0e', 'Arthur', 'Isahanian', '$2a$10$PBYpaE7UwrCiDDxGQ5wsg.Dpma1Zi/t9qdlTKEuWnxeDbd1ULgQm6', 'karla-an@mail.ru', 'ROLE_USER');
INSERT INTO public.users (id, name, surname, password, email, role) VALUES ('dab557d4-0c3d-47eb-a19a-b6f414a67830', 'Arthur', 'Isahanian', '$2a$10$.p4RAMNO650HMbpZNrYeYeG5oSf.RsqyiSBPTouz7O/FYQShUy39m', 'karlaan@mail.ru', 'ADMIN');


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: dishes_ingridients dishes_ingridients_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_ingridients
    ADD CONSTRAINT dishes_ingridients_pk PRIMARY KEY (id);


--
-- Name: dishes_on_date dishes_on_date_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_on_date
    ADD CONSTRAINT dishes_on_date_pk PRIMARY KEY (id);


--
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id);


--
-- Name: ingridients ingridients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingridients
    ADD CONSTRAINT ingridients_pkey PRIMARY KEY (id);


--
-- Name: physiological_characteristics physiological_characteristics_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physiological_characteristics
    ADD CONSTRAINT physiological_characteristics_pk PRIMARY KEY (id);


--
-- Name: saved_dishes saved_dishes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_dishes
    ADD CONSTRAINT saved_dishes_pk PRIMARY KEY (id);


--
-- Name: steps steps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_pkey PRIMARY KEY (step_id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: type_of_meal type_of_meal_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_of_meal
    ADD CONSTRAINT type_of_meal_pk PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: dishes_categories dishes_categories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_categories
    ADD CONSTRAINT dishes_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: dishes_categories dishes_categories_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_categories
    ADD CONSTRAINT dishes_categories_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dishes(id);


--
-- Name: dishes_ingridients dishes_ingridients_ingridient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_ingridients
    ADD CONSTRAINT dishes_ingridients_ingridient_id_fkey FOREIGN KEY (ingridient_id) REFERENCES public.ingridients(id);


--
-- Name: dishes_on_date dishes_on_date_dishes_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_on_date
    ADD CONSTRAINT dishes_on_date_dishes_id_fk FOREIGN KEY (dish_id) REFERENCES public.dishes(id);


--
-- Name: dishes_on_date dishes_on_date_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_on_date
    ADD CONSTRAINT dishes_on_date_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: dishes_tags dishes_tags_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_tags
    ADD CONSTRAINT dishes_tags_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dishes(id);


--
-- Name: dishes_tags dishes_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_tags
    ADD CONSTRAINT dishes_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: dishes_type_of_meal dishes_type_of_meal_dishes_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_type_of_meal
    ADD CONSTRAINT dishes_type_of_meal_dishes_id_fk FOREIGN KEY (dish_id) REFERENCES public.dishes(id);


--
-- Name: dishes_type_of_meal dishes_type_of_meal_type_of_meal_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_type_of_meal
    ADD CONSTRAINT dishes_type_of_meal_type_of_meal_id_fk FOREIGN KEY (type_of_meal_id) REFERENCES public.type_of_meal(id);


--
-- Name: dishes dishes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: ingridients ingridients_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingridients
    ADD CONSTRAINT ingridients_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: physiological_characteristics physiological_characteristics_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physiological_characteristics
    ADD CONSTRAINT physiological_characteristics_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: saved_dishes saved_dishes_dishes_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_dishes
    ADD CONSTRAINT saved_dishes_dishes_id_fk FOREIGN KEY (dish_id) REFERENCES public.dishes(id);


--
-- Name: saved_dishes saved_dishes_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_dishes
    ADD CONSTRAINT saved_dishes_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

