SET search_path TO celular_vs_rendimento_escolar;

INSERT INTO idade_serie
    (idade, serie)
VALUES
    (6, 'EF1'),
    (7, 'EF1'),
    (8, 'EF1'),
    (9, 'EF1'),
    (10, 'EF1'),

    (11, 'EF2'),
    (12, 'EF2'),
    (13, 'EF2'),
    (14, 'EF2'),

    (15, 'EM'),
    (16, 'EM'),
    (17, 'EM');

COPY posse_celular (idade, regiao, ano, percentual_celular, sexo)
    FROM '../csvs/celular_idade_regiao.csv'
    DELIMITER ','
    CSV HEADER;

