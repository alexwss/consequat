SET TERM ^ ;

CREATE OR ALTER procedure P_TITULO (
    ID_PEDIDO      integer,
    VALOR          decimal,
    ID_FORMA_PAGTO integer)
as
declare variable VLIQUIDAR varchar(20);
declare variable VEXISTE  varchar(1);
BEGIN
  --
  select 'S' from titulo t where t.id_pedido = :ID_PEDIDO into VEXISTE;
  --
  select 'LIQUIDADO' from forma_pagamento where id = :id_forma_pagto and ind_liquidar_direto = 'S' into :vliquidar;
  --
  if (VEXISTE is not null) then
  begin
    --
    update titulo
       set valor           = :valor,
           data_lancamento = current_date,
           id_forma_pagto  = :id_forma_pagto,
           evento          = coalesce(:vliquidar,'PENDENTE')
     where id_pedido       = :id_pedido;
    --
  end
  else
  begin
    --
    insert into titulo(id, id_pedido, valor , data_lancamento, id_forma_pagto, evento)
      values(NEXT VALUE FOR S_TITULO, :id_pedido, :valor, current_date, :id_forma_pagto, coalesce(:vliquidar,'PENDENTE'));
    --  
  end


END^

SET TERM ; ^

