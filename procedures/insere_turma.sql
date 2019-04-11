SET TERM ^ ;

create or alter procedure INSERE_TURMA (
    SERIE varchar(100),
    TURMA varchar(100),
    ANO_LETIVO integer,
    ID_ESCOLA integer)
returns (
    POIDTURMA integer)
as
declare variable VISEQUENCE integer;
begin
  --
  viSequence = NEXT VALUE FOR s_turma;
  --
  insert into turma(id, serie, turma, ano_letivo, id_escola)
   values(:viSequence, :serie, :turma, :ano_letivo, :id_escola);
  --
  poIdTurma = viSequence;
  --
end^

SET TERM ; ^