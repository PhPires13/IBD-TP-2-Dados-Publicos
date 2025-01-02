CREATE TABLE Taxa_reprovacao (
    Ano INT NOT NULL,
    Região VARCHAR(20) NOT NULL,
    Localização	VARCHAR(20) NOT NULL,
    Rede VARCHAR(20) NOT NULL,
    Total_Fundamental DECIMAL(15,4),
    "1_ao_5_Ano_Fundamental" DECIMAL(15,4),
    "6_ao_9_Ano_Fundamental" DECIMAL(15,4),
    "1_Ano_Fundamental" DECIMAL(15,4),
    "2_Ano_Fundamental" DECIMAL(15,4),
    "3_Ano_Fundamental" DECIMAL(15,4),
    "4_Ano_Fundamental" DECIMAL(15,4),
    "5_Ano_Fundamental" DECIMAL(15,4),
    "6_Ano_Fundamental" DECIMAL(15,4),
    "7_Ano_Fundamental" DECIMAL(15,4),
    "8_Ano_Fundamental" DECIMAL(15,4),
    "9_Ano_Fundamental" DECIMAL(15,4),
    Total_Médio DECIMAL(15,4),
    "1_série_Médio" DECIMAL(15,4),
    "2_série_Médio" DECIMAL(15,4),
    "3_série_Médio" DECIMAL(15,4),
    "4_série_Médio" DECIMAL(15,4),
    Total_Medio_Nao_Seriado DECIMAL(15,4),

    CONSTRAINT PK_Taxa_reprovação PRIMARY KEY (Ano, Região, Localização, Rede)
);

COPY Taxa_reprovacao FROM '/home/sarahmenks/ED/Desempenho escolar 2011 - Teste.csv' DELIMITER ',' CSV;