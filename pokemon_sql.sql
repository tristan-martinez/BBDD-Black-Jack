CREATE TABLE region1(
id_region int
);

CREATE TABLE ciudad1(
id_ciudad int,
id_region int
);

CREATE TABLE entrenador(
id_entrenador int,
nombre varchar(20),
num_medallas int,
num_pokemons int,
id_ciudad int
);

CREATE TABLE pokemon(
cod_pokemon int,
nombre varchar(20),
nivel int,
id_entrenador int
);

CREATE TABLE pokemon_region(
cod_pokemon int,
id_region int
);

CREATE TABLE tipo(
nombre varchar(20)
);

CREATE TABLE no_legendario(
cod_pokemon int,
ruta varchar(30)
);

CREATE TABLE legendario(
cod_pokemon int,
lugar_reside varchar(30)
);

CREATE TABLE gimnasio(
nombre varchar(20),
tipo_predominante varchar (20),
lider varchar (20),
id_ciudad int
);

CREATE TABLE centro_pokemon(
nombre varchar(20),
num_enfermeros_disponible int,
id_ciudad int
);


CREATE TABLE posee(
cod_pokemon int,
nombre varchar(20)
);


ALTER TABLE region1 ADD CONSTRAINT pk_region1 PRIMARY KEY (id_region)
ALTER TABLE ciudad1 ADD CONSTRAINT pk_ciudad1 PRIMARY KEY (id_ciudad)
ALTER TABLE ciudad1 ADD CONSTRAINT fk_ciudad1 FOREIGN KEY (id_region) REFERENCES region1(id_region)
ALTER TABLE entrenador ADD CONSTRAINT pk_entrenador PRIMARY KEY (id_entrenador)
ALTER TABLE entrenador ADD CONSTRAINT fk_entrenador FOREIGN KEY (id_ciudad) REFERENCES ciudad1(id_ciudad)
ALTER TABLE pokemon ADD CONSTRAINT pk_pokemon PRIMARY KEY (cod_pokemon)
ALTER TABLE pokemon ADD CONSTRAINT fk_pokemon FOREIGN KEY (id_entrenador) REFERENCES entrenador(id_entrenador)
ALTER TABLE pokemon_region ADD CONSTRAINT pk_pokemon_entrenador PRIMARY KEY (cod_pokemon)
ALTER TABLE pokemon_region ADD CONSTRAINT fk_pokemon_region FOREIGN KEY (id_region) REFERENCES region1(id_region)
ALTER TABLE tipo ADD CONSTRAINT pk_tipo PRIMARY KEY (nombre)
ALTER TABLE legendario ADD CONSTRAINT pk_legendario PRIMARY key(cod_pokemon)
ALTER TABLE legendario ADD CONSTRAINT fk_legendario  FOREIGN KEY (cod_pokemon) REFERENCES pokemon(cod_pokemon)
ALTER TABLE no_legendario ADD CONSTRAINT pk_no_legendario PRIMARY key(cod_pokemon)
ALTER TABLE no_legendario ADD CONSTRAINT fk_mp_legendario  FOREIGN KEY (cod_pokemon) REFERENCES pokemon(cod_pokemon)
ALTER TABLE gimnasio ADD CONSTRAINT pk_gimnasio primary key(nombre)
ALTER TABLE gimnasio ADD CONSTRAINT fk_gimasio FOREIGN KEY (id_ciudad) references ciudad1(id_ciudad)
ALTER TABLE centro_pokemon ADD CONSTRAINT pk_centro_pokemon PRIMARY key(nombre)
ALTER TABLE centro_pokemon ADD CONSTRAINT fk_centro_pokemon FOREIGN KEY (id_ciudad) references ciudad1(id_ciudad)
ALTER TABLE posee ADD CONSTRAINT pk_posee PRIMARY KEY (cod_pokemon,nombre)
ALTER TABLE posee ADD CONSTRAINT fk1_posee FOREIGN KEY (cod_pokemon) REFERENCES pokemon(cod_pokemon)
ALTER TABLE posee ADD CONSTRAINT fk2_posee FOREIGN KEY (nombre) REFERENCES tipo(nombre)


