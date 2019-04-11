SET TERM ^ ;

create procedure p_log(mensagem varchar(4000))
as
begin
  in autonomous transaction
  do
  begin
    insert into log (mensagem) values (:mensagem);
  end
end^

SET TERM ; ^