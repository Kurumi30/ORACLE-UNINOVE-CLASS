CREATE TABLE FUNC (
	IDFUNC NUMBER(2) PRIMARY KEY,
	NOME   VARCHAR2(50) NOT NULL,
	CPF    NUMBER(12)
);

INSERT INTO FUNC
	(IDFUNC, NOME, CPF)
VALUES
	(1, 'Fernando', 12345678901 );

-- Pode omitir os nomes das colunas, seguindo a ordem da tabela
INSERT INTO FUNC VALUES (2, 'Marin', NULL);

-- Pode usar sem a cláusula WHERE
UPDATE FUNC SET CPF = 12345678902;

UPDATE FUNC
	SET CPF = 12345678903 -- Coluna a ser alterado
 	WHERE IDFUNC = 2; -- Linha a ser alterada

-- Deletar sem a cláusula WHERE
DELETE FUNC;

DELETE FROM FUNC
	WHERE IDFUNC = 2;
