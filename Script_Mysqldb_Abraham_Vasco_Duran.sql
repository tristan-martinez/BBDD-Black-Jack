CREATE TABLE region(
id_region varchar (10) NOT NULL
);

CREATE TABLE centro_pokemon(
nombre varchar (20) NOT NULL,
num_enfermeros_disponible int (3),
id_ciudad varchar (10)
);

CREATE TABLE gimnasio(
nombre varchar (20) NOT NULL,
tipo_predominante varchar (20),
lider varchar (20),
id_ciudad varchar (10)
);

CREATE TABLE legendario(
cod_pokemon varchar (5) NOT NULL,
nombre varchar (20),
nivel int (3),
lugar_reside varchar (50)
);

CREATE TABLE no_legendario(
cod_pokemon varchar (5) NOT NULL,
nombre varchar (20),
nivel int (3)
);

CREATE TABLE ruta_pokemon_no_legendario(
cod_pokemon varchar (5) NOT NULL,
ruta varchar (50)
);

CREATE TABLE tipo(
nombre varchar (20) NOT NULL
);

CREATE TABLE entrenador(
id_entrenador varchar (10) NOT NULL,
id_ciudad varchar (10) NOT NULL,
nombre varchar (20),
num_medallas int (2),
num_pokemons int (8)
);

CREATE TABLE ciudad(
id_ciudad varchar (10) NOT NULL,
id_region varchar (10) NOT NULL
);

CREATE TABLE pokemon(
cod_pokemon varchar (5) NOT NULL,
nombre varchar (20),
nivel int (3),
id_entrenador varchar (10) NOT NULL
);

CREATE TABLE pokemon_region(
cod_pokemon varchar (5) NOT NULL,
id_region varchar (10) NOT NULL
);

CREATE TABLE posee(
cod_pokemon varchar (5) NOT NULL,
id_entrenador varchar (10) NOT NULL
);

CREATE TABLE captura(
cod_pokemon varchar (5) NOT NULL,
nombre varchar (20)
);



ALTER TABLE region ADD CONSTRAINT pk_region PRIMARY KEY (id_region);

ALTER TABLE centro_pokemon ADD CONSTRAINT pk_centro_pokemon PRIMARY KEY (nombre);
ALTER TABLE centro_pokemon ADD CONSTRAINT fk_centro_pokemon FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad);

ALTER TABLE gimnasio ADD CONSTRAINT pk_gimnasio PRIMARY KEY (nombre);
ALTER TABLE gimnasio ADD CONSTRAINT fk_gimnasio FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad);

ALTER TABLE legendario ADD CONSTRAINT pk_legendario PRIMARY KEY (cod_pokemon);
ALTER TABLE legendario ADD CONSTRAINT fk_legendario FOREIGN KEY (cod_pokemon) REFERENCES pokemon(cod_pokemon);

ALTER TABLE no_legendario ADD CONSTRAINT pk_no_legendario PRIMARY KEY (cod_pokemon);
ALTER TABLE no_legendario ADD CONSTRAINT fk_no_legendario FOREIGN KEY (cod_pokemon) REFERENCES pokemon(cod_pokemon);

ALTER TABLE ruta_pokemon_no_legendario ADD CONSTRAINT pk_ruta_pokemon_no_legendario PRIMARY KEY (cod_pokemon);
ALTER TABLE ruta_pokemon_no_legendario ADD CONSTRAINT fk_ruta_pokemon_no_legendario FOREIGN KEY (cod_pokemon) REFERENCES pokemon(cod_pokemon);

ALTER TABLE tipo ADD CONSTRAINT pk_tipo PRIMARY KEY (nombre);

ALTER TABLE entrenador ADD CONSTRAINT pk_entrenador PRIMARY KEY (id_entrenador);
ALTER TABLE entrenador ADD CONSTRAINT fk_entrenador FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad);

ALTER TABLE ciudad ADD CONSTRAINT pk_ciudad PRIMARY KEY (id_ciudad);
ALTER TABLE ciudad ADD CONSTRAINT fk_ciudad FOREIGN KEY (id_region) REFERENCES region(id_region);

ALTER TABLE pokemon ADD CONSTRAINT pk_pokemon PRIMARY KEY (cod_pokemon);
ALTER TABLE pokemon ADD CONSTRAINT fk_pokemon FOREIGN KEY (id_entrenador) REFERENCES entrenador(id_entrenador);

ALTER TABLE pokemon_region ADD CONSTRAINT pk_pokemon_region PRIMARY KEY (cod_pokemon);
ALTER TABLE pokemon_region ADD CONSTRAINT fk_pokemon_region FOREIGN KEY (id_region) REFERENCES region(id_region);

ALTER TABLE posee ADD CONSTRAINT pk_posee PRIMARY KEY (cod_pokemon);
ALTER TABLE posee ADD CONSTRAINT fk1_posee FOREIGN KEY (cod_pokemon) REFERENCES pokemon(cod_pokemon);
ALTER TABLE posee ADD CONSTRAINT fk2_posee FOREIGN KEY (id_entrenador) REFERENCES entrenador(id_entrenador);

ALTER TABLE captura ADD CONSTRAINT pk_captura PRIMARY KEY (cod_pokemon,nombre);
ALTER TABLE captura ADD CONSTRAINT fk1_captura FOREIGN KEY (cod_pokemon) REFERENCES pokemon(cod_pokemon);
ALTER TABLE captura ADD CONSTRAINT fk2_captura FOREIGN KEY (nombre) REFERENCES tipo(nombre);
