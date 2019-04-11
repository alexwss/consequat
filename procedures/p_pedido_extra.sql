
SET TERM ^ ;

CREATE PROCEDURE P_PEDIDO_EXTRA (
    id_pedido    integer,
    total_b     decimal,
    total_l     decimal
    )
AS
BEGIN
  --
  update pedido 
     set total_b = :total_b,
		 total_l = :total_l
   where id      = :id_pedido;
  --
END^

SET TERM ; ^
