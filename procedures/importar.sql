SET TERM ^ ;

create or alter procedure importar(
  id_escola    integer,
  ano_letivo   integer,
  hash         BLOB SUB_TYPE TEXT SEGMENT SIZE 100,
  nome_arquivo varchar(500)
)
returns(
  oId     integer,
  oExiste varchar(1)
)
as
  --
begin
  --
  select 'S' from importacao i
   where ((i.HASH = hash(:hash)) or (i.nome_arquivo = :nome_arquivo) ) into :oExiste;
  --
  if (oExiste is null) then
  begin
    oId = NEXT VALUE FOR s_importacao;
    --
    insert into importacao(id, id_escola, ano_letivo, hash, nome_arquivo)
      values(:oId, :id_escola, :ano_letivo, hash(:hash), :nome_arquivo);
    --
    oExiste = 'N';
  end
  --
end^

SET TERM ; ^
