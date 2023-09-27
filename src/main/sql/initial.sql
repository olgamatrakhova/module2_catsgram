create
user kitty superuser; -- создать пользователя для проекта
alter
user kitty password 'purrrrrr'; -- задать пароль пользователя
create
database cats with owner kitty; -- создать базу данных проекта и её владельца

-- предыдущие шаги вы выполнили в визуальном клиенте. Попробуйте выполнить дальнейшие шаги в консольном клиенте после нажатия на кнопку >_

create table "cat_user"
(
    id       varchar(64) not null, -- идентификатор текстовый, соответствует логину
    username varchar(255) default 'noname cat',
    nickname varchar(255)
); -- создайте таблицу пользователей Catsgram

create unique index user_id_uindex
    on "cat_user" (id);
-- индекс, чтобы базе данных было легче искать пользователей


-- наполните таблицу пользователей первыми тестовыми записями
INSERT INTO public.cat_user (id, username, nickname)
VALUES ('tom', 'Thomas C. Andersun', 'neoc@t');
INSERT INTO public.cat_user (id, username, nickname)
VALUES ('grumpy', 'Альфред Хичкот', 'sca_a_a_ry');
INSERT INTO public.cat_user (id, username, nickname)
VALUES ('puss_in_boots', 'Basileus Felis F.', 'under_wood');

create table cat_post
(
    id            int generated by default as identity primary key, -- идентификатор целочисленный, автоинкрементный
    author_id     varchar(64) not null,
    description   varchar(500),
    photo_url     varchar(1000),
    creation_date timestamp,
    CONSTRAINT fk_post_author
        FOREIGN KEY (author_id)
            REFERENCES cat_user (id)
); -- затем создайте таблицу с постами пользователей — это то место, где будут храниться все котики