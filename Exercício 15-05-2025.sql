-- 34) Consulte o nome do empregado, salário e o número do departamento em que trabalha, apresentando dados apenas dos empregados que tem o maior salário por departamento. Faça o comando utilizando uma subquery.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- 35) Consulte os cargos dos empregados da tabela emp apresentando a soma dos salários gastos por cargo. Altere os cabeçalhos para “Cargos” e “Total de Salário” e classifique por cargo o resultado final.
SELECT JOB AS Cargos, SUM(SAL) AS "Total de Salário"
FROM EMP
GROUP BY JOB;

-- 36) Selecione todos os dados dos empregados SMITH e TURNER da tabela EMP.
SELECT *
FROM EMP
WHERE EMPNO IN (7369, 7844);

-- 37) O que está errado no comando abaixo?
SELECT JOB, AVG(SAL) FROM EMP GROUP BY SAL;
-- Tem que agrupar pelo cargo:
-- SELECT JOB, AVG(SAL) FROM EMP GROUP BY JOB;

-- 38) O que está errado no comando abaixo?
UPDATE EMP SAL = 4000 WHERE ENAME = 'SMITH';
-- Faltou colocar o "set":
-- UPDATE EMP SET SAL = 4000 WHERE ENAME = 'SMITH';

-- 39) O empregado “Smith” foi transferido para o departamento ‘OPERATIONS’. Faça essa alteração na tabela EMP.
UPDATE EMP
SET DEPTNO = 40
WHERE EMPNO = 7369;

-- 40) Faça uma consulta que mostre quantos funcionários existem alocados por departamento e a média de salários gastos pelos departamentos.
SELECT
  DEPTNO,
  COUNT(ENAME) AS "QUANTIDADE DE FUNCIONÁRIOS",
  ROUND(AVG(SAL), 2) AS "MÉDIA DE SALÁRIO"
FROM EMP
GROUP BY DEPTNO;

-- 41) Selecione o menor salário, o maior salário e a soma dos salários pagos por cargo dentro de cada departamento. Classifique o resultado por departamento.
SELECT DEPTNO, JOB, MIN(SAL), MAX(SAL), SUM(SAL)
FROM EMP
GROUP BY JOB, DEPTNO
ORDER BY DEPTNO;

-- 42) Apague da tabela EMP os empregados que foram admitidos em 87. Faça um RollBack em seguida.
DELETE FROM EMP WHERE TO_CHAR(HIREDATE, 'YYYY') = 1987;
ROLLBACK

-- 43) O empregado “James foi transferido para o departamento ‘ACCOUNTING’. Faça essa alteração na tabela EMP utilizando uma subquery.
UPDATE EMP
SET DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'ACCOUNTING')
WHERE EMPNO = (SELECT EMPNO FROM EMP WHERE ENAME = 'JAMES');

-- 44) Consulte todos os empregados da tabela EMP que não possuem valores para o campo que representa a comissão. Traga apenas seu nome, no do empregado e salário, classificados em ordem decrescente de Nome. (Verifique a estrutura da tabela para saber o nome correto das colunas)
SELECT ENAME, EMPNO, SAL
FROM EMP
WHERE COMM IS NULL
ORDER BY ENAME DESC;
