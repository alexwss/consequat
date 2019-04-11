
SET TERM ^ ;

CREATE OR ALTER PROCEDURE P_PEDIDO (
    id_aluno    integer,
    data_pedido date,
    data_vencto date,
    data_entreg date,
    total_b     decimal,
    desconto    decimal,
    total_l     decimal,
    observacao  varchar(4000),
    cpf_contato varchar(14),
    telefone    varchar(15),
    nome_contato varchar(200)
    )
RETURNS (oid integer)
AS
BEGIN
  --
  oid = NEXT VALUE FOR S_PEDIDO;
  --
  insert into pedido(id, id_aluno, data_pedido, data_vencto, data_entreg, total_b, desconto, total_l, observacao, cpf_contato, telefone, nome_contato)
    values(:oid, :id_aluno, :data_pedido, :data_vencto, :data_entreg, :total_b, :desconto, :total_l, :observacao, :cpf_contato, :telefone, :nome_contato);
  --
END^

SET TERM ; ^
