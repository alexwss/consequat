SET TERM ^ ;

CREATE OR ALTER procedure p_baixa_titulo_devolucao (
    ID_PEDIDO  integer,
    EVENTO     varchar(10),
    valor      decimal,
    OBSERVACAO varchar(4000))
as
BEGIN
  --
  insert into titulo(id, id_pedido, valor, data_pagamento, data_lancamento, evento, observacao)  
  values (NEXT VALUE FOR s_titulo, :id_pedido, :valor, current_date, current_date, :evento, :observacao);
    --
END^

SET TERM ; ^


