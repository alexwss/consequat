CREATE trigger tr_biu_titulo for titulo
active before insert or update position 0
AS
begin
  if (new.evento = 'LIQUIDADO') then
  begin
    new.data_pagamento = current_date;
  end
end