SET TERM ^ ;

CREATE OR ALTER procedure P_BAIXA_TITULO (
    ID_TITULO  integer,
    EVENTO     varchar(10),
    OBSERVACAO varchar(4000))
as
BEGIN
  --
  update titulo
      set data_pagamento  = current_date,
          evento          = :EVENTO,
          observacao      = :OBSERVACAO
    where id              = :ID_TITULO;
    --
END^

SET TERM ; ^

