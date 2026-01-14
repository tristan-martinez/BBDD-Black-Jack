CREATE TABLE region(
id_region NUMBER(9)
);

CREATE TABLE ciudad(
id_ciudad NUMBER(9),
id_region number(9)
);

CREATE TABLE entrenador(
id_entrenador NUMBER(9),
nombre varchar2(20),
num_medallas number(4),
num_pokemons number(5),
id_ciudad number(9)
);

CREATE TABLE pokemon(
cod_pokemon NUMBER(9),
nombre varchar2(30),
nivel number(3),
id_entrenador number(9)
);

CREATE TABLE pokemon_region(
cod_pokemon number(9),
id_region number(9),
);

CREATE TABLE tipo(
nombre varchar2(20)
);

CREATE TABLE no_legendario(
cod_pokemon NUMBER(9),
ruta varchar2 (30)
);

CREATE TABLE legendario(
cod_pokemon NUMBER(9),
lugar_reside varchar2(30)
);

CREATE TABLE gimnasio(
nombre varchar2(20),
tipo_predominante varchar2 (20),
lider varchar2 (20),
id_ciudad number(9)
);

CREATE TABLE centro_pokemon(
nombre varchar2(20),
num_enfermeros_disponible number(4),
id_ciudad number(9)
);


CREATE TABLE posee(
cod_pokemon NUMBER(9),
nombre varchar2(20)
);


ALTER TABLE region ADD CONSTRAINT pk_region PRIMARY KEY (id_region)
ALTER TABLE ciudad ADD CONSTRAINT pk_ciudad PRIMARY KEY (id_ciudad)
ALTER TABLE ciudad ADD CONSTRAINT fk_ciudad FOREIGN KEY (id_region) REFERENCES region(id_region)
ALTER TABLE entrenador ADD CONSTRAINT pk_entrenador PRIMARY KEY (id_entrenador)
ALTER TABLE entrenador ADD CONSTRAINT fk_entrenador FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
ALTER TABLE pokemon ADD CONSTRAINT pk_pokemon PRIMARY KEY (cod_pokemon)
ALTER TABLE pokemon ADD CONSTRAINT fk_pokemon FOREIGN KEY (id_entrenador) REFERENCES entrenador(id_entrenador)
ALTER TABLE pokemon_region ADD CONSTRAINT pk_pokemon_entrenador PRIMARY KEY (cod_pokemon)
ALTER TABLE pokemon_region ADD CONSTRAINT fk_pokemon_region FOREIGN KEY id_region REFERENCES region(id_region)
ALTER TABLE tipo ADD CONSTRAINT pk_tipo PRIMARY KEY (nombre)
ALTER TABLE legendario ADD CONSTRAINT pk_legendario PRIMARY key(cod_pokemon)
ALTER TABLE legendario ADD CONSTRAINT fk_legendario  FOREIGN KEY (cod_pokemon) REFERENCES pokemon(cod_pokemon)
ALTER TABLE no_legendario ADD CONSTRAINT pk_no_legendario PRIMARY key(cod_pokemon)
ALTER TABLE no_legendario ADD CONSTRAINT fk_mp_legendario  FOREIGN KEY (cod_pokemon) REFERENCES pokemon(cod_pokemon)
ALTER TABLE gimnasio ADD CONSTRAINT pk_gimnasio primary key(nombre)
ALTER TABLE gimnasio ADD CONSTRAINT fk_gimasio FOREIGN KEY (id_ciudad) references ciudad(id_ciudad)
ALTER TABLE centro_pokemon ADD CONSTRAINT pk_centro_pokemon PRIMARY key(nombre)
ALTER TABLE centro_pokemon ADD CONSTRAINT fk_centro_pokemon FOREIGN KEY (id_ciudad) references ciudad(id_ciudad)
ALTER TABLE posee ADD CONSTRAINT pk_posee PRIMARY KEY (cod_pokemon,nombre)
ALTER TABLE posee ADD CONSTRAINT fk1_posee FOREIGN KEY (cod_pokemon) REFERENCES pokemon(cod_pokemon)
ALTER TABLE posee ADD CONSTRAINT fk2_posee FOREIGN KEY (nombre) REFERENCES tipo(nombre)


