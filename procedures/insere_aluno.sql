SET TERM ^ ;

create or alter procedure INSERE_ALUNO (
    NOME varchar(200),
    DATA_NASCIMENTO date,
    COD_ALUNO varchar(100),
    RA varchar(100),
    OBSERVACAO varchar(4000),
    ID_TURMA integer,
    SEQUENCIAL integer)
as
declare variable VISEQUENCE integer;
begin
  --
  viSequence = NEXT VALUE FOR s_aluno;
  --
  insert into aluno(id, nome, data_nascimento, id_turma, cod_aluno, ra, observacao, sequencial)
    values(:viSequence, :nome, :data_nascimento, :id_turma, :cod_aluno, :ra, :observacao, :sequencial);
  --
end^

SET TERM ; ^