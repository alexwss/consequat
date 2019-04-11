unit unTurma;

interface

type

  TTurma = class
  private
    serie, turma : string;
    ano, idEscola, idTurma : Integer;
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create(aSerie: string; aTurma: string; oAno: Integer; oIdEscola: Integer); overload;
    function getSerie(): String;
    function getTurma(): String;
    function getAno(): Integer;
    function getIdEscola(): Integer;
    procedure setIdTurma(oId : integer); overload;
    function getIdTurma(): Integer;
  published
    { published declarations }
  end;

implementation

  constructor TTurma.Create(aSerie: string; aTurma: string; oAno: Integer; oIdEscola: Integer);
  begin
    self.SERIE    := aSerie;
    self.TURMA    := aTurma;
    self.ANO      := oANo;
    self.IDESCOLA := oIdEscola;
  end;

  function TTurma.getSerie(): String;
  begin
    getSerie := self.serie;
  end;

  function TTurma.getTurma(): String;
  begin
    getTurma := self.turma;
  end;

  function TTurma.getAno(): Integer;
  begin
    getAno := self.ano;
  end;

  function TTurma.getIdEscola(): Integer;
  begin
    getIdEscola := self.idEscola;
  end;

  procedure TTurma.setIdTurma(oId : integer);
  begin
    self.IDTURMA := oId;
  end;

  function TTurma.getIdTurma(): Integer;
  begin
    getIdTurma := self.idTurma;
  end;

end.
