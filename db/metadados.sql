create table escola(
  id          integer  not null primary key,
  nome_escola varchar(500),
  endereco    varchar(200),
  numero      varchar(50),
  telefone    varchar(20),
  email       varchar(100),
  celular     varchar(20),
  cnpj        varchar(20),
  observacao  varchar(4000)
);
--
create table turma(
  id           integer not null primary key,
  serie        varchar(100),
  turma        varchar(100),
  ano_letivo   integer,
  id_escola    integer
);
--Foreign Key
alter table turma
add foreign key(id_escola)
references escola(id);
--
create table aluno(
  id              integer not null primary key,
  nome            varchar(200),
  data_nascimento date,
  id_turma        integer,
  cod_aluno       varchar(100),
  ra              varchar(100),
  observacao      varchar(4000),
  sequencial      integer
);
--
alter table aluno
add foreign key(id_turma)
references turma(id);
--
create table titulo(
  id              integer not null primary key,
  id_pedido       integer not null,
  valor           float,
  data_pagamento  date,
  data_lancamento date,
  evento          varchar(10) check( evento in ('PENDENTE','LIQUIDADO','DEVOLVIDO','CANCELADO')),
  observacao      varchar(4000),
  id_forma_pagto  integer
);
--
alter table titulo
add FOREIGN KEY(id_forma_pagto)
REFERENCES forma_pagamento(id);
--
alter table titulo
add foreign key(id_pedido)
references pedido(id);
--
create table importacao(
  id           integer not null primary key,
  id_escola    integer,
  ano_letivo   integer,
  hash         varchar(100),
  nome_arquivo varchar(500)
);
--
create table log(
  mensagem varchar(10000)
);
--
alter table importacao
add foreign key(id_escola)
references escola(id);
--
create table produto(
  id             integer not null primary key,
  descricao      varchar(200),
  valor          DECIMAL(18,4),
  observacao     varchar(4000),
  ind_desativado varchar(1),
  ind_kit        varchar(1)
);
--
create table produto_kit(
  id             integer not null,
  id_prod_kit    integer not null,
  id_produto     integer not null,
  descricao      varchar(200),
  quantidade     integer 
);
--
alter table produto_kit
add PRIMARY key (id, id_prod_kit);
--
alter table produto_kit
add foreign key(id_produto)
references produto(id);
--
alter table produto_kit
add foreign key(id_prod_kit)
references produto(id);
--
create table pedido(
  id          integer not null primary key,
  id_aluno    integer not null,
  data_pedido date,
  data_vencto date,
  data_entreg date,
  total_b     DECIMAL(18,4),
  desconto    DECIMAL(3,2) ,
  total_l     DECIMAL(18,4),
  observacao  varchar(4000),
  cpf_contato varchar(14),
  telefone    varchar(15),
  nome_contato varchar(200)
);
--
create table pedido_item(
  id                integer not null,
  id_pedido         integer not null,
  id_produto        integer not null,
  descricao_produto varchar(200),
  valor_produto     decimal(18, 4),
  quantidade        integer,
  ind_extra         varchar(1),
  dt_inclusao       date default current_date,
  id_kit            integer
);
--
alter table pedido_item
add primary key(id, id_pedido);
--
alter table pedido_item
add foreign key(id_pedido)
references pedido(id);
--
alter table pedido_item
add FOREIGN key(id_produto)
references produto(id);
--
alter table pedido_item
add FOREIGN key(id_kit)
references produto(id);
--
create table forma_pagamento(
id        integer not null primary key, 
descricao varchar(100),
ind_ativo varchar(1),
ind_liquidar_direto varchar(1)
);
--
create sequence s_escola;
create sequence s_turma;
create sequence s_aluno;
create sequence s_titulo;
create sequence s_importacao;
create sequence s_produto;
create sequence s_pedido;
create sequence s_forma_pagamento;
--
insert into forma_pagamento values(gen_id(s_forma_pagamento,1),'DINHEIRO','S','S');
insert into forma_pagamento values(gen_id(s_forma_pagamento,1),'CARTÃO','S','S');
insert into forma_pagamento values(gen_id(s_forma_pagamento,1),'BOLETO','S','N');
insert into forma_pagamento values(gen_id(s_forma_pagamento,1),'CHEQUE','S','N');
--