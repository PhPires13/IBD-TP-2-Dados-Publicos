SET search_path TO celular_vs_rendimento_escolar;

TRUNCATE TABLE idade_serie, posse_celular, rendimento_escolar;

INSERT INTO idade_serie
    (idade, serie)
VALUES
    (8, 'EF1'),
    (12, 'EF2'),
    (16, 'EM');

COPY posse_celular (idade, regiao, ano, percentual_celular, sexo)
    FROM '../csvs/celular_idade.csv'
    DELIMITER ','
    CSV HEADER;

