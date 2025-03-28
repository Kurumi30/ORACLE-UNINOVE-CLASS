CREATE TABLE FUNC (
	IDFUNC NUMBER(2) PRIMARY KEY,
	NOME   VARCHAR2(50) NOT NULL,
	CPF    NUMBER(12)
);

INSERT INTO FUNC
	(IDFUNC, NOME, CPF)
VALUES
	(1, 'Fernando', 12345678901);

-- Pode omitir os nomes das colunas, seguindo a ordem da tabela
INSERT INTO FUNC VALUES (2, 'Marin', NULL);

INSERT INTO CLIENTE
(IDCLI, NOME, TELEF, TIPOCLI, CNPJ, CPF)
VALUES
(7, 'John Doe', '123456789', NULL, '12.345.678/0001-95', 12345678900);

/ -- Ou pode omitir o campo que não vai usar

INSERT INTO CLIENTE
(IDCLI, NOME, TELEF, CNPJ, CPF)
VALUES
(7, 'John Doe', '123456789', '12.345.678/0001-95', 12345678900);

-- Conceito de parâmetros no Oracle

INSERT INTO CLIENTE
(IDCLI, NOME, TELEF, TIPOCLI, CNPJ, CPF)
VALUES
(&IDCLI, '&NOME', '&TELEF', '&TIPOCLI', '&CNPJ', &CPF);

-- Pode usar sem a cláusula WHERE
UPDATE FUNC SET CPF = 12345678902;

UPDATE FUNC
	SET CPF = 12345678903 -- Coluna a ser alterado
 	WHERE IDFUNC = 2; -- Linha a ser alterada

-- Deletar sem a cláusula WHERE
DELETE FUNC;

DELETE FROM FUNC
	WHERE IDFUNC = 2;
-- Campo, operador, valor	
