-- 10) Insira um departamento novo na tabela DEPT, com número do departamento igual a 50, nome do departamento “Orçamento” e localização “São Paulo”.
INSERT INTO DEPT
  (DEPTNO, DNAME, LOC) 
VALUES
  (50, 'Orçamento', 'São Paulo');

-- 11) Altere o campo ENAME da tabela EMP, de 10 caracteres para 20 caracteres (manter o mesmo tipo de dado). Verifique, em seguida, a estrutura da tabela com a alteração efetuada.
ALTER TABLE EMP
MODIFY (
  ENAME VARCHAR2(20)
);

-- 12) Insira um novo empregado na tabela EMP dando valores a todos os campos. Para a coluna referente ao código do departamento coloque o valor 15. Ocorreu algum erro? Explique.
INSERT INTO EMP
  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES
  (1712, 'Marin', 'DEVELOPER', NULL, '17/12/2025', 3000, NULL, 15);

-- 13) Qual é o comando para se apagar uma constraint de uma tabela?
ALTER TABLE nome_da_tabela
DROP CONSTRAINT nome_da_constraint

-- 14) Consulte todos os empregados contratados no ano de 87, mostrando seu nome, salário e número do departamento.
SELECT ENAME, SAL, DEPTNO
  FROM EMP
    WHERE HIREDATE LIKE '%/1987'; -- TO_CHAR(HIREDATE, 'YYYY') = '1987'

-- 15) Consulte o nome dos empregados, seu cargo e salário, classificados em ordem crescente por cargo e nome do empregado, nesta ordem.
SELECT ENAME, JOB, SAL
  FROM EMP
    ORDER BY JOB, ENAME;

-- 16) Insira um novo empregado na tabela EMP, sem número do empregado. Verifique a mensagem do Oracle!!!
INSERT INTO EMP
  (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES
  (NULL, 'Kurumi', 'Assassina', NULL, '17/04/2025', 3000, NULL, 20);

  
