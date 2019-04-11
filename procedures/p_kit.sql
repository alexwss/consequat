
SET TERM ^ ;

CREATE OR ALTER PROCEDURE P_KIT (
    id          integer,
    id_prod_kit integer,
    id_prod     integer,
    descricao   varchar(200),
    qtd         integer,
    ind_estado  varchar(1)
    )
AS
BEGIN
  --
  if (ind_estado = 'I') then
  begin
    insert into produto_kit(id, id_prod_kit, id_produto, descricao, quantidade)
      values(:id, :id_prod_kit, :id_prod, :descricao, :qtd);
  end
  else if  (ind_estado = 'U') then
  begin
    update produto_kit p set
           p.descricao   = :descricao,
           p.quantidade  = :qtd 
     where p.id          = :id and 
           p.id_prod_kit = :id_prod; 
  end
  else if (ind_estado = 'D') then
  begin
    delete from produto_kit  p 
     where p.id          = :id and 
           p.id_prod_kit = :id_prod; 
  end
  --
  suspend;
END^

SET TERM ; ^
