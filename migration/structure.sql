DROP SCHEMA IF EXISTS celular_vs_rendimento_escolar CASCADE;

CREATE SCHEMA celular_vs_rendimento_escolar;

SET search_path TO celular_vs_rendimento_escolar;

CREATE TABLE idade_serie (
    id SERIAL PRIMARY KEY,
    idade INT NOT NULL UNIQUE,
    serie VARCHAR(3) NOT NULL UNIQUE CHECK (serie IN ('EF1', 'EF2', 'EM'))
);

CREATE TABLE posse_celular (
    id SERIAL PRIMARY KEY,
    idade INT NOT NULL REFERENCES idade_serie(idade),
    regiao VARCHAR(2) NOT NULL CHECK (regiao IN ('N', 'NE', 'CO', 'SE', 'S', 'BR')),
    ano INT NOT NULL,
    percentual_celular DECIMAL(4,1) NOT NULL,
    sexo VARCHAR(1) NOT NULL CHECK (sexo IN ('M', 'F', 'T'))
);

CREATE TABLE rendimento_escolar (
    id SERIAL PRIMARY KEY,
    serie VARCHAR(3) NOT NULL REFERENCES idade_serie(serie),
    regiao VARCHAR(2) NOT NULL CHECK (regiao IN ('N', 'NE', 'CO', 'SE', 'S', 'BR')),
    ano INT NOT NULL,
    percentual_aprovacao DECIMAL(4,1),
    percentual_reprovacao DECIMAL(4,1),
    percentual_abandono DECIMAL(4,1),
    tipo_localizacao VARCHAR(1) NOT NULL CHECK (tipo_localizacao IN ('U', 'R', 'T')),
    tipo_escola VARCHAR(2) NOT NULL CHECK (tipo_escola IN ('PR', 'PU', 'FE', 'ES', 'MU', 'TO'))
);