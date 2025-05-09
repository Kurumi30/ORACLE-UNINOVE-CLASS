-- 19) Consulte a quantidade de funcionários por departamento da tabela EMP.
SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO;

-- 20) Qual o custo dos empregados por departamento?
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

-- 21) Consulte o campo DEPTNO da tabela EMP, alterando o cabeçalho para ‘Núm. do depto’, além de apresentar o menor salário, maior salário, média salarial por departamento. Para isso, agrupe pelo número do departamento.
SELECT DEPTNO AS "Núm. do depto", MIN(SAL), MAX(SAL), ROUND(AVG(SAL), 2)
FROM EMP
GROUP BY DEPTNO;

-- 22) Faça uma consulta que apresente o total pago por alunos no ano de 2007 e a média de valores pagos por eles.
SELECT IDALUNO, SUM(VALLIQ), AVG(VALLIQ)
FROM PAGTO
WHERE TO_CHAR(DTPAGTO, 'YYYY') = 2007 -- DTPAGTO LIKE '%07'
GROUP BY IDALUNO;

-- 23) Consulte quantos pagamentos foram feitos para cada professor no 1o semestre de 2008, classificando por professor.
SELECT IDPROF, COUNT(*)
FROM PAGTO
WHERE DTPAGTO BETWEEN '01/01/2008' AND '30/06/2008'
GROUP BY IDPROF
ORDER BY IDPROF ASC;

-- 24) Faça uma consulta que apresente todos os alunos matriculados no período de 15/03/08 a 30/04/08, mostrando apenas seu Código, Nome e Data de Nascimento, classificados por Nome. Altere os cabeçalhos para Cód.Aluno, Nome Aluno e Data Nasc, respectivamente.
SELECT IDALUNO AS "Cód.Aluno", NOME AS "Nome Aluno", DTNASC AS "Data Nasc"
FROM ALUNO
WHERE DTMATRIC BETWEEN '15/03/2008' AND '30/04/2008'
ORDER BY NOME ASC;

-- 25) O aluno Mauro Soares fez o pagamento referente ao mês de Novembro no dia 16/10/08 no valor de R$ 260,00. Seu professor é o Gerson Almeida e o código do registro do pagamento é 78400. Escreva o comando para cadastrar essa informação na tabela PAGTO.
INSERT INTO PAGTO
(IDPAGTO, IDALUNO, DTPAGTO, VALLIQ, IDPROF)
VALUES
(78400, 10443, '16/10/2008', 260, 'GA');

-- 26) Faça uma consulta que traga todos os pagamentos da aluna Paola Moraes, mostrando apenas as colunas correspondentes ao código do professor, data do pagamento e valor, apresentando os cabeçalhos Professor, Data Pagto e Valor Pago, respectivamente.
SELECT IDPROF AS "Professor", DTPAGTO AS "Data Pagto", VALLIQ AS "Valor Pago"
FROM PAGTO
WHERE IDALUNO = 10468;

-- 27) O aluno Pedro Santos saiu da academia e seu registro deve ser eliminado da tabela ALUNO. Para que isso ocorra é necessário excluir primeiro os registros de pagamentos desse aluno. Escreva o comando para executar a ação solicitada referente aos registros de pagamentos da tabela PAGTO.
DELETE FROM PAGTO
WHERE IDALUNO = 10080;

DELETE FROM ALUNO
WHERE IDALUNO = 10080;

-- 28) Será necessário adicionar uma nova coluna na tabela ALUNO para guardar o CPF, que deve ser do tipo VARCHAR2(15). Essa coluna deverá conter uma restrição para não permitir valores duplicados. Escreva o comando necessário para execução dessa tarefa.
ALTER TABLE ALUNO
ADD (CPF VARCHAR2(15) UNIQUE);

-- 29) A data de nascimento do aluno Carlos Lins está incorreta. No cadastro consta 12/11/1977 quando na realidade é 10/11/1977. Escreva o comando para corrigir esse dado na tabela ALUNO.
UPDATE ALUNO
SET DTNASC = '10/11/1977'
WHERE IDALUNO = 10194;

-- 30) Os registros de pagamentos do aluno Pedro Santos foram eliminados, conforme solicitado no exercício 27, porém, houve uma confusão com relação ao nome do aluno. O aluno que saiu da academia foi o Roberto Santos e não o Pedro Santos. Com o objetivo de retornar a situação anterior à exclusão digite o comando abaixo:
ROLLBACK;

-- 31) Verifique o que aconteceu com as operações efetuadas nos exercícios nos 27, 28 e 29 e entenda o porque.
-- O aluno Pedro Santos não foi restaurado, porque teve um comando de alter table depois, o que fez um commit automático. Já o aluno Carlos teve a sua data de nascimento antiga.
