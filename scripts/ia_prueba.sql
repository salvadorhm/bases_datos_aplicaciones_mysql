
-- create database
DROP DATABASE bd_ia;

CREATE DATABASE bd_ia;

USE prueba;

--  create table materias with next columns (id_materia,materia,carrera)
CREATE TABLE materias (
  id_materia INT AUTO_INCREMENT PRIMARY KEY,
  materia VARCHAR(255) NOT NULL,
  carrera VARCHAR(255) NOT NULL
);


--  create table temas with next columns(id_tema,tema,dificultad,id_materia as foreing key)
CREATE TABLE temas (
    id_tema INT AUTO_INCREMENT PRIMARY KEY,
    tema VARCHAR(255),
    dificultad VARCHAR(255), -- [1-5]
    id_materia INT,
    CONSTRAINT fk_materias_temas
    FOREIGN KEY (id_materia) REFERENCES materias(id_materia) 
);

CREATE TABLE preguntas(
	id_pregunta INT AUTO_INCREMENT PRIMARY KEY,
	pregunta VARCHAR(255),
	calidad_prompt VARCHAR(255), -- [1-5]
	id_tema INT,
	CONSTRAINT fk_temas_preguntas
	FOREIGN KEY (id_tema) REFERENCES temas(id_tema)
);

CREATE TABLE respuestas(
	id_respuesta INT AUTO_INCREMENT PRIMARY KEY,
	respuesta TEXT,
	modelo VARCHAR(100),
	calidad_respuesta VARCHAR(50), -- [buena|mala|regular]
	id_pregunta INT,
	CONSTRAINT fk_preguntas_respuestas
	FOREIGN KEY (id_pregunta) REFERENCES preguntas(id_pregunta)	
);
-- show global variables like 'local_infile';

-- set global local_infile=true;

-- mysql --local-infile=1 -u root -p

LOAD DATA LOCAL INFILE "materias.csv"
INTO TABLE materias
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
