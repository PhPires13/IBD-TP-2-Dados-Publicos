SET search_path TO celular_vs_rendimento_escolar;

-- Q1
SELECT ano, regiao, serie, percentual_celular, percentual_aprovacao
FROM idade_serie JOIN posse_celular USING (idade)
                 JOIN rendimento_escolar USING (serie, regiao, ano)
WHERE  tipo_localizacao = 'T' AND tipo_escola = 'TO'
ORDER BY regiao, serie, ano;

-- Q2
WITH max_values AS (
    SELECT
        MAX(percentual_celular) AS max_percentual_celular,
        MAX(percentual_aprovacao) AS max_percentual_aprovacao
    FROM idade_serie
             JOIN posse_celular USING (idade)
             JOIN rendimento_escolar USING (serie, regiao, ano)
    WHERE tipo_localizacao = 'T' AND tipo_escola = 'TO'
),
data AS (
SELECT ano, regiao, serie,
       (percentual_celular / max_values.max_percentual_celular)*100 AS percentual_celular_norm,
       (percentual_aprovacao / max_values.max_percentual_aprovacao)*100 as percentual_aprovacao_norm
FROM idade_serie
       JOIN posse_celular USING (idade)
       JOIN rendimento_escolar USING (serie, regiao, ano)
       CROSS JOIN max_values
WHERE tipo_localizacao = 'T'
AND tipo_escola = 'TO'
AND ano IN (2008, 2015)
ORDER BY regiao, serie, ano
)
SELECT
    d1.regiao,
    d1.serie,
    (d2.percentual_celular_norm - d1.percentual_celular_norm) as delta_celular,
    (d2.percentual_aprovacao_norm - d1.percentual_aprovacao_norm) as delta_aprovacao,
    ((d2.percentual_aprovacao_norm - d1.percentual_aprovacao_norm) / (d2.percentual_celular_norm - d1.percentual_celular_norm))*100 as ratio
FROM data d1
         JOIN data d2 ON d1.regiao = d2.regiao AND d1.serie = d2.serie
WHERE d1.ano = 2008 AND d2.ano = 2015
ORDER BY d1.regiao, d1.serie;
