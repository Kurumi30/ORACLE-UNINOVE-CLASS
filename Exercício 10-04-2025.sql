-- 1) Faça uma consulta que apresente todos os modelos de veículos cadastrados na base de dados, mostrando apenas seu código e nome, classificada pelo modelo.
SELECT IDMOD, DESCRICAO
  FROM MODELO
    ORDER BY DESCRICAO;

-- 2) O modelo Renegate foi cadastrado para a marca Mitsubishi. A marca correta é Jeep. Faça a alteração na base de dados.
UPDATE MODELO
  SET IDMARCA = 4
    WHERE IDMOD = 1006;

-- 3) As informações dos clientes estão incompletas, pois não consta o endereço. Será necessário acrescentar a coluna END – VARCHAR2(70). Execute o comando para resolver esse problema.
ALTER TABLE CLIENTE
ADD (
  END VARCHAR2(70)
);

-- 4) Selecione todos os modelos da marca Mitsubishi, apresentando apenas seu código e nome.
SELECT IDMOD, DESCRICAO
  FROM MODELO
    WHERE IDMARCA = 5;

-- 5) Faça uma consulta que traga todos os veículos das cores preto e branco que não tenham sido vendidos, classificada pela sua cor. Apresente o número do chassi, o ano de fabricação, sua cor e modelo.
SELECT CHASSI, ANO, COR, IDMOD
  FROM VEICULO
    WHERE (COR = 'Preto' OR COR = 'Branco')
      AND VENDIDO = 'N'
        ORDER BY COR ASC;

-- 6) O cliente Klim Seguradora comprou um carro cujo chassi é o 867P234. A nota fiscal foi emitida no dia 12/09/24 e seu número é 6420. Escreva o comando para cadastrar as informações dessa venda na tabela apropriada para isso.

INSERT INTO CLI_VEIC
  (IDCLI, IDVEIC, NF, DTCOMPRA)
VALUES
  (536, 984, 6420, '12/09/2024');

-- 7) É preciso alterar o status do carro que a empresa Klim Seguradora comprou para ‘Vendido’. Faça essa alteração no cadastro de veículos para que não ocorra duplicidade na venda.
UPDATE VEICULO
  SET VENDIDO = 'S'
    WHERE IDVEIC = 984;

-- 8) Efetive todas as transações pendentes no banco.
COMMIT;

-- 9) As marcas FORD e BMW devem ser excluídas do B.D.. Execute o comando para realização dessa tarefa.
DELETE FROM MARCA
  WHERE IDMARCA = 2 OR IDMARCA = 3;

-- 10) A coluna DESCRICAO da tabela MODELO precisa ser aumentada de 50 para 70 posições. Faça essa alteração na base de dados.
ALTER TABLE MODELO
MODIFY (
  DESCRICAO VARCHAR2(70)
);

-- 11) O exercício no 9 excluiu as marcas FORD e BMW da tabela Marcas, porém, essa operação não deveria ter acontecido. Execute o comando que desfaz as transações pendentes no banco e verifique se os registros excluídos foram recuperados.
ROLLBACK;
