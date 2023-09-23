create table images (
   id int8 generated by default as identity,
   bytes oid, content_type varchar(255),
   name varchar(255),
   original_file_name varchar(255),
   preview_image boolean not null,
   size int8,
   product_id int8,
   primary key (id)
);

create table products (
    id int8 generated by default as identity,
    city varchar(255),
    date_of_crated timestamp,
    description varchar(255),
    name varchar(255),
    preview_image_id int8,
    price int4, user_id int8,
    primary key (id)
);



create table user_role (
    user_id int8 not null,
    roles varchar(255)
);

create table users (
    id int8 generated by default as identity,
    activation_code varchar(255),
    active boolean not null,
    email varchar(255),
    name varchar(255),
    password varchar(255),
    phone_number varchar(255),
    avatar_id int8, primary key (id)
);

alter table if exists users add constraint UK_6dotkott2kjsp8vw4d0m25fb7 unique (email);

alter table if exists images add constraint FKghwsjbjo7mg3iufxruvq6iu3q foreign key (product_id) references products;

alter table if exists products add constraint FKdb050tk37qryv15hd932626th foreign key (user_id) references users;

alter table if exists user_role add constraint FKj345gk1bovqvfame88rcx7yyx foreign key (user_id) references users;

alter table if exists users add constraint FK2lttmx8vn9eecykig5sch3v0h foreign key (avatar_id) references images