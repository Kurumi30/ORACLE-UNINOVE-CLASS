-- Continuação da atividade do dia 27-02-2025, depois de criar as tabelas

-- 2) Insira todas os valores apresentados nas tabelas CONCES, CLIENTE, VEICULO, MODELO e MARCA.
-- Conces
INSERT INTO CONCES VALUES (1, 'Guaíra Veículos - Loja 1', 'Rua Paraíso, 20', 'Paraíso', 'São Paulo');
INSERT INTO CONCES VALUES (2, 'Guaíra Veículos - Loja 2', 'Av. Soares, 10', 'Santana', 'Osasco');
INSERT INTO CONCES VALUES (3, 'Guaíra Veículos - Loja 3', 'Rua Tucuna, 230', 'Vila Sonia', 'São Paulo');

-- Marca
INSERT INTO MARCA VALUES (1, 'Hyundai');
INSERT INTO MARCA VALUES (2, 'Ford');
INSERT INTO MARCA VALUES (3, 'BMW');
INSERT INTO MARCA VALUES (4, 'Jeep');
INSERT INTO MARCA VALUES (5, 'Mitsubishi');
INSERT INTO MARCA VALUES (6, 'Honda');

-- Modelo
INSERT INTO MODELO VALUES (1001, 'Compass Limited 2.0 4x2 Flex 16V Aut.', 4);
INSERT INTO MODELO VALUES (1002, 'HB20 Comfort 1.0 Flex 12V Mec.', 1);
INSERT INTO MODELO VALUES (1003, 'Eclipse Cross GLS 1.5 16V 165cv Aut.', 5);
INSERT INTO MODELO VALUES (1004, 'L200 Triton Sport HPE-S 2.4 CD Dies. Aut.', 5);
INSERT INTO MODELO VALUES (1005, 'Creta Action 1.6 16V Flex Aut.', 1);
INSERT INTO MODELO VALUES (1006, 'Renegade Sport T270 1.3 TB 4x2 Flex Aut.', 5);
INSERT INTO MODELO VALUES (1007, 'HR-V Advance 1.5 Flex TB 16V 5p Aut.', 6);

-- Cliente
INSERT INTO CLIENTE
  (IDCLI, NOME, TELEF, TIPOCLI, CNPJ, CPF)
VALUES
  (101, 'João Silas Moreira', '(11) 91111-2345', 'F', NULL, 31245623223);

INSERT INTO CLIENTE
  (IDCLI, NOME, TELEF, TIPOCLI, CNPJ, CPF)
VALUES
  (220, 'Márcia Ribeiro', '(11) 92121-3131', 'F', NULL, 22111122226);

INSERT INTO CLIENTE
  (IDCLI, NOME, TELEF, TIPOCLI, CNPJ, CPF)
VALUES
  (305, 'Alfa Móveis Ltda', '(19) 91234-0101', 'J', '54.412.111/0001-45', NULL);

INSERT INTO CLIENTE
  (IDCLI, NOME, TELEF, TIPOCLI, CNPJ, CPF)
VALUES
  (128, 'Luís Carlos Soares', '(12) 92223-2368', 'F', NULL, 15849126486);

INSERT INTO CLIENTE
  (IDCLI, NOME, TELEF, TIPOCLI, CNPJ, CPF)
VALUES
  (536, 'Klim Seguradora', '(11) 93434-6556', 'J', '21.111.222/0001-67', NULL);

INSERT INTO CLIENTE
  (IDCLI, NOME, TELEF, TIPOCLI, CNPJ, CPF)
VALUES
  (189, 'Paulo Magalhães', '(11) 95523-0440', 'F', NULL, 65441230168);

-- Veiculo
INSERT INTO VEICULO
  (IDVEIC, CHASSI, PLACA, COR, ANO, IDC, IDMOD)
VALUES
  (921, '123A560', NULL, 'Branco', 2024, 1003, 2);

INSERT INTO VEICULO
  (IDVEIC, CHASSI, PLACA, COR, ANO, IDC, IDMOD)
VALUES
  (902, '654B321', NULL, 'Cinza', 2024, 1001, 1);

INSERT INTO VEICULO
  (IDVEIC, CHASSI, PLACA, COR, ANO, IDC, IDMOD)
VALUES
  (934, '676C869', 'BMK-3F45', 'Vermelho', 2022, 1005, 1);

INSERT INTO VEICULO
  (IDVEIC, CHASSI, PLACA, COR, ANO, IDC, IDMOD)
VALUES
  (968, '343D423', NULL, 'Preto', 2023, 1006, 2);

INSERT INTO VEICULO
  (IDVEIC, CHASSI, PLACA, COR, ANO, IDC, IDMOD)
VALUES
  (937, '987G234', NULL, 'Prata', 2024, 1001, 3);

INSERT INTO VEICULO
(IDVEIC, CHASSI, PLACA, COR, ANO, IDC, IDMOD)
VALUES
(984, '867P234', NULL, 'Azul', 2023, 1007, 1);

INSERT INTO VEICULO
(IDVEIC, CHASSI, PLACA, COR, ANO, IDC, IDMOD)
VALUES
(953, '912P123', NULL, 'Branco', 2023, 1002, 3);

INSERT INTO VEICULO
  (IDVEIC, CHASSI, PLACA, COR, ANO, IDC, IDMOD)
VALUES
  (911, '237B543', 'ABC-1M23', 'Preto', 2021, 1003, 1);

-- Cli_veic
INSERT INTO CLI_VEIC VALUES (101, 921, 123, TO_DATE('2024-02-12', 'YYYY-MM-DD'));
INSERT INTO CLI_VEIC VALUES (128, 934, 666, TO_DATE('2022-12-12', 'YYYY-MM-DD'));
INSERT INTO CLI_VEIC VALUES (128, 454, 999, TO_DATE('2023-01-01', 'YYYY-MM-DD'));
INSERT INTO CLI_VEIC VALUES (220, 902, 321, TO_DATE('2025-08-21', 'YYYY-MM-DD'));

-- 3) Altere o número da marca Hyundai de 1 para 8 na tabela MARCA. A alteração ocorreu com sucesso? Entenda o porquê.
UPDATE MARCA SET IDMARCA = 8 WHERE NOME = 'Hyundai';
-- Ocorreu um erro: restrição de integridade (FERNANDO.MODELO_IDMARCA_FK) violada - registro filho localizado
-- Porque a coluna IDMARCA da tabela MARCA é chave primária e é referenciada pela coluna IDMARCA da tabela MODELO como chave estrangeira.

-- 4) Insira a coluna KM na tabela VEICULO com 7 posições numéricas.
ALTER TABLE VEICULO ADD KM NUMBER(7);

-- 5) Cadastre uma nova categoria de MARCA chamada PEUGEOT.
INSERT INTO MARCA VALUES (7, 'Peugeot');

-- 6) Utilizando um único comando, exclua as marcas FORD e MITSUBISHI da tabela MARCA. A exclusão ocorreu com sucesso? Entenda o porquê.
-- DELETE FROM MARCA
--  WHERE DESCRICAO = 'Ford'
--  OR DESCRICAO = 'Mitsubishi';

DELETE FROM MARCA WHERE DESCRICAO IN ('Ford', 'Mitsubishi'); -- Dessa forma fica mais legível
-- Ocorreu o erro: restrição de integridade (FERNANDO.MODELO_IDMARCA_FK) violada - registro filho localizado
-- Porque a tabela MARCA está referenciada pela tabela MODELO através da chave estrangeira, ou seja os registros na tabela MARCA dependem de registros na tabela MODELO.
