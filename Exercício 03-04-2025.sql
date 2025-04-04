-- 1) Consulte todos os empregados da tabela EMP, mostrando todos os campos.
SELECT * FROM EMP;

-- 2) Consulte os empregados (todos os campos) que ganham acima de 3000 (inclusive 3000).
SELECT * FROM EMP
  WHERE SAL >= 3000;

-- 3) Consulte os cargos da tabela EMP sem repetição, alterando o cabeçalho de JOB para CARGOS.
SELECT DISTINCT JOB AS CARGO
  FROM EMP;

-- 4) Consulte todos os departamentos existentes na tabela DEPT, mostrando todos os campos.
SELECT * FROM DEPT;

-- 5) Consulte o nome do departamento da tabela DEPT cujo número seja igual a 30.
SELECT DNAME
  FROM DEPT
    WHERE DEPTNO = 30;

-- 6) O empregado chamado “SMITH” recebeu um aumento de salário. Altere seu salário de 800 para 1300.
UPDATE EMP
  SET SAL = 1300
    WHERE EMPNO = 7369;

-- 7) Consulte o nome dos empregados, seu cargo e salário, mostrando os salários em ordem crescente.
SELECT ENAME, JOB, SAL
  FROM EMP
    ORDER BY SAL;

-- 8) Um novo empregado foi contratado, sendo que seus dados deverão ser cadastrados na tabela EMP. Seu código é 1200, seu nome é Antônio e ele trabalha como mecânico. Foi contratado na data de hoje, por um salário de R$ 2.500,00. Ele trabalha no departamento SALES e não recebe comissão. Insira esse registro.
INSERT INTO EMP
  (EMPNO, ENAME, JOB, HIREDATE, SAL, DEPTNO)
VALUES
  (1200, 'Antônio', 'Mecânico', SYSDATE, 2500, 30);
