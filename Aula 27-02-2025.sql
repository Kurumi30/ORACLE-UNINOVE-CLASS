CREATE TABLE CURSO (
	IDCURSO NUMBER(3) PRIMARY KEY,
	NOME    VARCHAR(50) NOT NULL,
	PRIMARY KEY ( IDCURSO,
	              NOME ) -- PRIMÁRIA COMPOSTA
);

CREATE TABLE ALUNO (
	RA      NUMBER(10),
	NOME    VARCHAR2(50)
		CONSTRAINT ALUNO_NOME_NN NOT NULL,
	END     VARCHAR2(70),
	CPF     NUMBER(12),
	IDCURSO NUMBER(3), -- IDCURSO NUMBER(3) REFERENCES CURSO [caso não queira escrever longe da coluna]
	SEXO    CHAR(1), -- CONSTRAINT ALUNO_SEXO_CH CHECK(SEXO IN ('F', 'f', 'M', 'm'))

	CONSTRAINT ALUNO_RA_PK PRIMARY KEY ( RA ),
	CONSTRAINT ALUNO_CPF_UU UNIQUE ( CPF ),
	CONSTRAINT ALUNO_ID_CURSO_FK FOREIGN KEY ( IDCURSO )
		REFERENCES CURSO,
	CONSTRAINT ALUNO_SEXO_CH
		CHECK ( SEXO IN ( 'F',
		                  'f',
		                  'M',
		                  'm' ) )
    -- CONSTRAINT ALUNO_SEXO_CH CHECK(SEXO = 'F' OR SEXO = 'f' OR SEXO = 'M' OR SEXO = 'm')
);

CREATE SEQUENCE MINHA_SEQ START WITH 1 INCREMENT BY 1;
DROP SEQUENCE MINHA_SEQ