CREATE TABLE "user" (
  "user_id" SERIAL PRIMARY KEY,
  "nombre" varchar,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "edad" int
);

CREATE TABLE "entradas" (
  "entrada_id" SERIAL PRIMARY KEY,
  "titulo" varchar,
  "descripcion" varchar,
  "autor_id" int,
  "contenido" varchar,
  "categoria_id" int
);

CREATE TABLE "categorias" (
  "categoria_id" SERIAL PRIMARY KEY,
  "nombre" varchar
);

CREATE TABLE "comentario" (
  "comentario_id" SERIAL PRIMARY KEY,
  "comentario" varchar,
  "user_id" int
);

CREATE TABLE "autores" (
  "autor_id" SERIAL PRIMARY KEY,
  "nombre" varchar,
  "descripcion" varchar
);

CREATE TABLE "entradas_comentarios" (
  "id" SERIAL PRIMARY KEY,
  "entrada_id" int,
  "comentario_id" int
);

ALTER TABLE "entradas_comentarios" ADD FOREIGN KEY ("entrada_id") REFERENCES "entradas" ("entrada_id");

ALTER TABLE "entradas_comentarios" ADD FOREIGN KEY ("comentario_id") REFERENCES "comentario" ("comentario_id");

ALTER TABLE "entradas" ADD FOREIGN KEY ("autor_id") REFERENCES "autores" ("autor_id");

ALTER TABLE "comentario" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

ALTER TABLE "entradas" ADD FOREIGN KEY ("categoria_id") REFERENCES "categorias" ("categoria_id");


insert into "user" (nombre, email, "password", edad) values ('cristhian', 'cris@gmail.com', '123456', 25);
insert into "user" (nombre, email, "password", edad) values ('cris2', 'cris2@gmail.com', '123we', 15);

insert into categorias (nombre) values ('comida');
insert into categorias (nombre) values ('autos');

insert into autores (nombre, descripcion) values ('cristhian', 'autor del blog de comida');
insert into autores (nombre, descripcion) values ('cris2', 'autor del blog de autos');

insert into comentario (comentario, user_id) values ('que bonito auto', 1);
insert into comentario (comentario, user_id) values ('que lindo auto', 1);
insert into comentario (comentario, user_id) values ('que rica comida', 2);

insert into entradas (titulo, descripcion, autor_id, contenido, categoria_id) values ('Mi auto', 'presentacion de mi auto', 2, 'autos', 2);
insert into entradas (titulo, descripcion, autor_id, contenido, categoria_id) values ('Comida', 'presentacion de mi menu', 1, 'comida', 1);

insert into entradas_comentarios (entrada_id, comentario_id) values (1, 1);
insert into entradas_comentarios (entrada_id, comentario_id) values (2, 2);
insert into entradas_comentarios (entrada_id, comentario_id) values (1, 3);


-- seleccionar que usuarios comentaron en que entrada

select u.nombre, ec.entrada_id, c.comentario  from "user" u
inner join comentario c 
on u.user_id = c.user_id
inner join entradas_comentarios ec 
on c.comentario_id = ec.comentario_id
where u.user_id = 1;
