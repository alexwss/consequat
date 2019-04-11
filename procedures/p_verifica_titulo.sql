SET TERM ^ ;

create or alter procedure P_VERIFICA_TITULO (
    ID_PEDIDO integer)
returns (
    OLIQUIDADO varchar(1))
as
declare variable VLIQUIDAR varchar(20);
BEGIN
  --
  select 'S' from titulo t where t.id_pedido = :ID_PEDIDO and evento = 'LIQUIDADO' into VLIQUIDAR;
  --
  oliquidado = coalesce(VLIQUIDAR,'N');
  --
END^

SET TERM ; ^