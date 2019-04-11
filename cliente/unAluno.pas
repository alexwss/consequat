unit unAluno;

interface

type
  TAluno = class

  private
    nome, codAluno, ra, observacao : string;
    idTurma, sequencial            : Integer;
    dtNascimento                   : TDate;
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create(nome: string; dtNascimento: TDate; idTurma: Integer; codAluno: String; ra: String; observacao: String; sequencial: Integer ); overload;
    function  getNome()                    : String;
    procedure setNome(iNome                : String); overload;
    function  getDtNascimento()            : TDate;
    procedure setDtNascimento(iDtNascimento: TDate); overload;
    function  getIdTurma()                 : Integer;
    procedure setIdTurma(iIdTurma          : Integer); overload;
    function  getCodAluno()                : String;
    procedure setCodAluno(iCodALuno        : String); overload;
    function  getRa()                      : String;
    procedure setRa(iRa                    : String); overload;
    function  getObservacao()              : String;
    procedure setObservacao(iObservacao    : String); overload;
    function  getSequencial()              : Integer;
    procedure setSequencial(iSequencial    : Integer); overload;
  published
    { published declarations }
  end;

implementation

  constructor TAluno.Create(nome: string; dtNascimento: TDate; idTurma: Integer; codAluno: String; ra: String; observacao: String; sequencial: Integer );
  begin
    self.nome         := nome;
    self.dtNascimento := dtNascimento;
    self.idTurma      := idTurma;
    self.codAluno     := codAluno;
    self.ra           := ra;
    self.observacao   := observacao;
    self.sequencial   := sequencial;
  end;

  function  TAluno.getNome()                    : String;
  begin
    getNome := self.nome;
  end;

  procedure TAluno.setNome(iNome                : String);
  begin
    self.nome := iNome;
  end;

  function  TAluno.getDtNascimento()            : TDate;
  begin
    getDtNascimento := self.dtNascimento;
  end;

  procedure TAluno.setDtNascimento(iDtNascimento: TDate);
  begin
    self.dtNascimento := iDtNascimento;
  end;

  function  TAluno.getIdTurma()                 : Integer;
  begin
    getIdTurma :=  self.idTurma;
  end;

  procedure TAluno.setIdTurma(iIdTurma          : Integer);
  begin
    self.idTurma := iIdTurma;
  end;

  function  TAluno.getCodAluno()                : String;
  begin
    getCodAluno :=  self.codAluno;
  end;

  procedure TAluno.setCodAluno(iCodALuno        : String);
  begin
    self.codAluno := iCodALuno;
  end;

  function  TAluno.getRa()                      : String;
  begin
    getRa :=   self.ra;
  end;

  procedure TAluno.setRa(iRa                    : String);
  begin
    self.ra := iRa;
  end;

  function  TAluno.getObservacao()              : String;
  begin
    getObservacao := self.observacao;
  end;

  procedure TAluno.setObservacao(iObservacao    : String);
  begin
    self.observacao := iObservacao;
  end;

  function  TAluno.getSequencial()              : Integer;
  begin
    getSequencial :=  self.sequencial;
  end;

  procedure TAluno.setSequencial(iSequencial    : Integer);
  begin
    self.sequencial := iSequencial;
  end;

end.
