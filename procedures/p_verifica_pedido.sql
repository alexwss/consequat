SET TERM ^ ;

CREATE OR ALTER procedure P_VERIFICA_PEDIDO (ID_PEDIDO      integer)
RETURNS (vexiste varchar(1), vexistedevolucao varchar(1))
as
BEGIN
  --
  select 'S' from titulo t where t.id_pedido = :ID_PEDIDO and evento not in ('CANCELADO') into VEXISTE;
  --
  VEXISTE  = coalesce(VEXISTE,'N');
  --
  SELECT 'S' from titulo t where t.id_pedido = :ID_PEDIDO and evento = 'DEVOLVIDO' INTO VEXISTEDEVOLUCAO;
  --
  VEXISTEDEVOLUCAO = coalesce(VEXISTEDEVOLUCAO,'N');
  --
END^

SET TERM ; ^
