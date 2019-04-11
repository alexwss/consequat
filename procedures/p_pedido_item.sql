
SET TERM ^ ;

CREATE OR ALTER PROCEDURE P_PEDIDO_ITEM (
    id            integer,
    id_pedido     integer,
    id_produto    integer,
    desc_produto  varchar(500),
    valor_produto decimal,
    quantidade    integer,
    ind_extra     varchar(1),
    id_kit        integer
    )
AS
BEGIN
  --
  insert into pedido_item(id, id_pedido, id_produto, descricao_produto, valor_produto, quantidade, ind_extra, id_kit)
    values(:id, :id_pedido, :id_produto, :desc_produto, :valor_produto, :quantidade, :ind_extra, case when :id_kit = -1 then null else :id_kit end);
  --
END^

SET TERM ; ^
