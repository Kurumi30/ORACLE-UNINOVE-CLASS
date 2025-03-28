ROLLBACK -- desfaz transações pendentes
/
COMMIT -- efetiva transações pendentes
/

-- Os comandos DDL (create, alter, drop, rename, create sequence, etc) não podem ser revertidos com rollback porque possuem o auto-commit ativado.
-- Os comandos DML (insert, update, delete) podem ser revertidos com rollback
