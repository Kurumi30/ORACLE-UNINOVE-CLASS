-- Exercício 2

-- Questão 1
CREATE TABLE INSTRUTOR (
  IDINST    NUMBER(2) PRIMARY KEY,
  NOME      VARCHAR2(50) NOT NULL,
  TELEF     VARCHAR2(20),
  DTADM     DATE,
  SALARIO   NUMBER(7, 2)
);

-- Questão 2
-- Dropa a constraint de chave primária, sem especificar o nome da constraint
ALTER TABLE INSTRUTOR
  DROP PRIMARY KEY;

ALTER TABLE INSTRUTOR
  MODIFY IDINST PRIMARY KEY;
-- OU
ALTER TABLE INSTRUTOR
  ADD (
    CONSTRAINT INSTRUTOR_IDINST_PK PRIMARY KEY (IDINST)
  );

-- Questão 3
CREATE TABLE TURMA (
  IDTURMA   NUMBER(3) PRIMARY KEY,
  SALA      NUMBER(2),
  IDINST    NUMBER(2),
  IDCURSO   NUMBER(2) REFERENCES CURSO,

  FOREIGN KEY (IDINST) REFERENCES INSTRUTOR
);

-- Questão 5
CREATE TABLE CURSO (
  IDCURSO   NUMBER(2) PRIMARY KEY,
  NOME      VARCHAR2(50) NOT NULL,
  CARGA_HOR NUMBER(3),
  PRECO     NUMBER(7, 2),
  PREREQ   VARCHAR2(150)
);

-- Questão 4
CREATE TABLE ALUNO (
  MATRIC    NUMBER(4) CONSTRAINT ALUNO_MATRIC_PK PRIMARY KEY,
  NOME      VARCHAR2(25) NOT NULL,
  TELEFONE  VARCHAR2(14) UNIQUE,
  ENDERECO  VARCHAR2(40),
  UF        CHAR(2)
);

-- Questão 6

DROP TABLE ALUNO CASCADE;

CREATE TABLE ALUNO (
  MATRIC    NUMBER(4) PRIMARY KEY,
  NOME      VARCHAR2(25) NOT NULL,
  TELEFONE  VARCHAR2(14),
  ENDERECO  VARCHAR2(40),
  UF        CHAR(2)
);

-- Questão 7
ALTER TABLE ALUNO
  MODIFY (
    MATRIC  PRIMARY KEY,
    NOME    NOT NULL
  );

-- Questão 8
CREATE TABLE HISTORICO (
  CODTURMA    NUMBER(4) CONSTRAINT HISTORICO_CODTURMA_FK REFERENCES TURMA,
  MATRIC      NUMBER(4) CONSTRAINT HISTORICO_MATRIC_FK REFERENCES ALUNO,
  NOTA        NUMBER(2) NOT NULL,

  CONSTRAINT HISTORICO_NOTA_CK CHECK (NOTA BETWEEN 0 AND 10),
  CONSTRAINT HISTORICO_ID_PK PRIMARY KEY (CODTURMA, MATRIC)
);

-- Questão 9
ALTER TABLE INSTRUTOR
  MODIFY (
    NOME    VARCHAR2(60)
  );
