ROLLBACK -- desfaz transações pendentes
/
COMMIT -- efetiva transações pendentes
/

-- Os comandos DDL (create, alter, drop, rename, create sequence, etc) não podem ser revertidos com rollback porque possuem o auto-commit ativado.
-- Os comandos DML (insert, update, delete) podem ser revertidos com rollback

-- A ordem de execução dos comandos:
-- 1) FROM
-- 2) WHERE
-- 3) GROUP BY
-- 4) SELECT
-- 5) HAVING
-- 6) ORDER BY

-- ON -> Definir a junção por meio de colunas coincidentes
