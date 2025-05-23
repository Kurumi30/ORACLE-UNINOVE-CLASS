-- 46. Consulte o nome dos empregados, salário e nome do departamento da tabela EMP e DEPT considerando apenas quem foi contratado em 81. Utilize o comando LIKE.
SELECT A.ENAME, A.SAL, A.DEPTNO
FROM EMP A
LEFT JOIN DEPT B
ON A.DEPTNO = B.DEPTNO
WHERE TO_CHAR(A.HIREDATE, 'YYYY') = 1981;

-- 47. Faça uma consulta que apresente o menor salário, maior salário, média salarial por departamento, porém, traga o nome do departamento no lugar do código.
SELECT B.DNAME, MIN(A.SAL) AS "MENOR SALÁRIO", MAX(A.SAL) AS "MAIOR SALÁRIO", AVG(A.SAL) AS "MÉDIA SALARIAL"
FROM EMP A
INNER JOIN DEPT B
ON A.DEPTNO = B.DEPTNO
GROUP BY A.DEPTNO, B.DNAME;

-- 48. Consulte todos os empregados contratados no ano de 87, mostrando seu nome, salário e seu departamento (nome).
SELECT A.ENAME, A.SAL, B.DNAME
FROM EMP A
LEFT JOIN DEPT B
ON A.DEPTNO = B.DEPTNO
WHERE TO_CHAR(A.HIREDATE, 'YYYY') = 1987;

-- 49. Consulte o nome dos empregados, seu cargo e salário e o nome do seu depto, classificados em ordem crescente por cargo e nome do empregado, nesta ordem.
SELECT A.ENAME, A.JOB, A.SAL, B.DNAME
FROM EMP A
LEFT JOIN DEPT B
ON A.DEPTNO = B.DEPTNO
ORDER BY A.JOB ASC, A.ENAME ASC;

-- 50. Consulte a quantidade de funcionários por departamento (nome).
SELECT COUNT(A.ENAME) AS "QUANTIDADE DE FUNCIONÁRIOS", B.DNAME
FROM EMP A
LEFT JOIN DEPT B
ON A.DEPTNO = B.DEPTNO
GROUP BY B.DNAME;

-- 51. Qual o custo dos empregados por departamento (nome).
SELECT B.DNAME, SUM(A.SAL) AS "CUSTO DOS EMPREGADOS"
FROM EMP A
LEFT JOIN DEPT B
ON A.DEPTNO = B.DEPTNO
GROUP BY B.DNAME;

-- 52. Consulte o número e o nome da categoria do filme e quantos filmes existem na locadora por categoria.
SELECT A.DESCRICAO, COUNT(B.CODCATEG)
FROM CATEGORIA A
LEFT JOIN FILME B
ON A.CODCATEG = B.CODCATEG
GROUP BY A.DESCRICAO;

-- 53. Consulte quantos filmes cada cliente alugou, mostrando o pré-nome do cliente e a quantidade de filmes ao lado.
SELECT B.PRENOME, SUM(A.NUMDVD)
FROM CLIENTE_DVD A
INNER JOIN CLIENTE B
ON A.CODCLI = B.CODCLI
GROUP BY B.PRENOME;

-- 54. Faça uma consulta para mostrar o nome dos empregados, a data de admissão, e seis meses após a data de admissão.
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 6) AS "SEIS MESES APÓS ADMISSÃO" -- HIREDATE + 180
FROM EMP;

-- 55. Faça uma consulta que apresente todos os alunos matriculados no período de 15/03/08 a 30/04/08, mostrando apenas seu Código, Nome e Data de Nascimento, classificados por Nome. Altere os cabeçalhos para Cód.Aluno, Nome Aluno e Data Nasc, respectivamente.
SELECT IDALUNO AS "Cód.Aluno", NOME AS "Nome Aluno", DTNASC AS "Data Nasc"
FROM ALUNO
WHERE DTMATRIC BETWEEN '15/03/2008' AND '30/04/2008'
ORDER BY NOME ASC;

-- 56. Faça uma consulta que traga todos os pagamentos da aluna Paola Moraes, mostrando apenas as colunas correspondentes ao código do professor, nome do professor, data do pagamento e valor, apresentando os cabeçalhos Código, Nome Professor, Data Pagto e Valor Pago, respectivamente.
SELECT A.IDPROF AS "Código", B.NOME AS "Nome Professor", A.DTPAGTO AS "Data Pagto", A.VALLIQ AS "Valor Pago"
FROM PAGTO A
INNER JOIN PROF B
ON A.IDPROF = B.IDPROF
WHERE A.IDALUNO IN (SELECT IDALUNO FROM ALUNO WHERE NOME = 'PAOLA MORAES');

-- 57. Faça uma consulta que apresente o total pago por alunos no ano de 2007 e a média de valores pagos por eles. Apresente seu Nome ao invés do código.
SELECT SUM(VALLIQ) AS "TOTAL PAGO", AVG(VALLIQ) AS "MÉDIA PAGAMENTOS", B.NOME, A.DTPAGTO
FROM PAGTO A
INNER JOIN ALUNO B
ON A.IDALUNO = B.IDALUNO
WHERE TO_CHAR(DTPAGTO, 'YYYY') = 2007
GROUP BY B.NOME;

-- 58. Consulte quantos pagamentos foram feitos para cada professor no 1o semestre de 2008, classificando por professor. Apresente seu nome ao invés do código do professor.
SELECT COUNT(*) AS "QTD DE PAGAMENTOS", B.NOME
FROM PAGTO A
INNER JOIN PROF B
ON A.IDPROF = B.IDPROF
WHERE A.DTPAGTO BETWEEN '01/01/2008' AND '30/06/2008'
GROUP BY B.NOME;
