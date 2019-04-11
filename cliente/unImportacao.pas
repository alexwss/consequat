unit unImportacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtDlgs,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, Vcl.DBCtrls, Data.FMTBcd,
  Data.SqlExpr, Vcl.Samples.Spin;

type
  TfrmImportacao = class(TForm)
    OpenTextFileDialog1: TOpenTextFileDialog;
    edArquivo: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    btnProcessar: TButton;
    SQLProc: TSQLQuery;
    SQLStoredProc1: TSQLStoredProc;
    SQLspLog: TSQLStoredProc;
    Label9: TLabel;
    SQLspImportar: TSQLStoredProc;
    edAnoLetivo: TSpinEdit;
    Label3: TLabel;
    SQLspAluno: TSQLStoredProc;
    lkEscola: TDBLookupComboBox;
    DataSourceEscola: TDataSource;
    ClientDataSetEscola: TClientDataSet;
    DataSetProviderEscola: TDataSetProvider;
    SQLQueryEscola: TSQLQuery;
    ClientDataSetEscolaID: TIntegerField;
    ClientDataSetEscolaNOME_ESCOLA: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportacao : TfrmImportacao;
  csv           : TStringList;
  nomeArquivo   : String;

implementation

uses unTurma, unAluno, System.Generics.Collections, unPrincipal;

{$R *.dfm}

procedure TfrmImportacao.btnProcessarClick(Sender: TObject);
  var ListaTurma   : TList<TTurma>;
  var ListaAluno   : TList<TAluno>;
  var TamanhoCsv   : Integer;
  var i            : integer;
  var j            : integer;
  var colunas      : TStringList;
  var listaCount   : integer;
  var bExisteTurma : Boolean;
  var comando      : String;
  var idImportacao : Integer;
  var sJaImportado : String;
  var idTurma      : integer;
  var aluno        : TAluno;
begin

  if (Trim(edArquivo.Text) = '') then
  begin
    Application.MessageBox('Por favor Selecione um Arquivo para Prosseguir','Aviso', MB_OK + MB_ICONWARNING);
    exit;
  end;

  if edAnoLetivo.Value = Null then
  begin
    Application.MessageBox('Por favor Informe o Ano Letivo para Prosseguir','Aviso', MB_OK + MB_ICONWARNING);
    exit;
  end;

  if lkEscola.KeyValue = Null then
  begin
    Application.MessageBox('Por favor Selecione a Escola para Prosseguir','Aviso', MB_OK + MB_ICONWARNING);
    exit;
  end;


  try

    ListaTurma := TList<TTurma>.Create();
    ListaAluno := TList<TAluno>.Create();
    csv        := TStringList.Create();
    csv.LoadFromFile(edArquivo.Text);
    TamanhoCsv :=  csv.Count - 1;

    if ((TamanhoCsv) > 1) then
    begin
      SQLspImportar.Close;
      SQLspImportar.Params[0].AsInteger := lkEscola.KeyValue;
      SQLspImportar.Params[1].AsInteger := edAnoLetivo.Value;
      SQLspImportar.Params[2].AsString  := csv.Text;
      SQLspImportar.Params[3].AsString  := nomeArquivo.ToUpper;
      SQLspImportar.ExecProc;

      if SQLspImportar.Params[5].AsString = 'S' then
      begin
        Application.MessageBox('O Arquivo já foi importado!','Aviso', MB_OK + MB_ICONEXCLAMATION);
        exit;
      end;

      idImportacao := SQLspImportar.Params[4].AsInteger;

      (* 0 - Sequencial
         1 - Código Aluno
         2 - dt Nascimento
         3 - RA
         4 - Nome
         5 - Série
         6 - Turma  *)

      for i := 0 to TamanhoCsv do
      begin
        colunas                 := TStringList.Create();
        colunas.StrictDelimiter := True;
        colunas.Delimiter       := ';';
        colunas.DelimitedText   := csv[i].Trim();
        bExisteTurma            := False;

        if ((colunas[5] <> '') and (colunas[6] <> '')) then
        begin

          listaCount :=  ListaTurma.Count -1;
          for j := 0 to ListaCount do
          begin
            if ( (ListaTurma[j].getSerie() = colunas[5].Trim().ToLower()) and
                 (ListaTurma[j].getTurma() = colunas[6].Trim().ToLower()) ) then
            begin
              bExisteTurma := True;
              break;
            end;
          end;

          if not bExisteTurma then
            ListaTurma.Add(TTurma.Create(colunas[5].Trim().ToLower(), colunas[6].Trim().ToLower(), edAnoLetivo.Value, lkEscola.KeyValue));
        end;

      end;

      for i := 0 to ListaTurma.Count - 1 do
      begin

        SQLStoredProc1.Close;
        SQLStoredProc1.Params[0].AsString  := ListaTurma[i].getSerie();
        SQLStoredProc1.Params[1].AsString  := ListaTurma[i].getTurma();
        SQLStoredProc1.Params[2].AsInteger := ListaTurma[i].getAno();
        SQLStoredProc1.Params[3].AsInteger := ListaTurma[i].getIdEscola();
        SQLStoredProc1.ExecProc;
        ListaTurma[i].setIdTurma(SQLStoredProc1.Params[4].AsInteger);

        SQLProc.SQL.Text := 'commit';
        SQLProc.ExecSQL();
        SQLProc.Close;
        SQLStoredProc1.Close;

      end;

      for i := 0 to TamanhoCsv do
      begin
        colunas                 := TStringList.Create();
        colunas.StrictDelimiter := True;
        colunas.Delimiter       := ';';
        colunas.DelimitedText   := csv[i].Trim();

        idTurma := -1;
        aluno   := TAluno.Create(colunas[4], StrToDate(colunas[2]), 0,colunas[1], colunas[3], '', StrToInt(colunas[0]));

        listaCount :=  ListaTurma.Count -1;
        for j := 0 to ListaCount do
        begin
          if ( (ListaTurma[j].getSerie = colunas[5].Trim().ToLower()) and (ListaTurma[j].getTurma = colunas[6].Trim().ToLower()) ) then
          begin
            aluno.setIdTurma(ListaTurma[j].getIdTurma);
            break;
          end;
        end;

        ListaAluno.Add(aluno);
      end;

      for i := 0 to ListaAluno.Count - 1 do
      begin

        SQLspAluno.Close;
        SQLspAluno.Params[0].AsString  := ListaAluno[i].getNome();
        SQLspAluno.Params[1].AsDate    := ListaAluno[i].getDtNascimento();
        SQLspAluno.Params[2].AsString  := ListaAluno[i].getCodAluno();
        SQLspAluno.Params[3].AsString  := ListaAluno[i].getRa();
        SQLspAluno.Params[4].AsString  := ListaAluno[i].getObservacao();
        SQLspAluno.Params[5].AsInteger := ListaAluno[i].getIdTurma();
        SQLspAluno.Params[6].AsInteger := ListaAluno[i].getSequencial();
        SQLspAluno.ExecProc;

        SQLProc.SQL.Text := 'commit retain';
        SQLProc.ExecSQL();
        SQLProc.Close;
        SQLspAluno.Close;

      end;

      csv.Destroy;
      ListaTurma.Destroy;
      ListaAluno.Destroy;
    end;

    Application.MessageBox('Importação Concluída com Sucesso!','Aviso', MB_OK + MB_ICONINFORMATION);

  except
    on Ex : Exception do
    begin
      SQLProc.SQL.Text := 'rollback retain';
      SQLProc.ExecSQL();
      SQLProc.SQL.Text := 'commit retain';
      SQLProc.ExecSQL();

      SQLspLog.Close;
      SQLspLog.Params[0].AsString  := Ex.Message.Substring(0,4000);
      SQLspLog.ExecProc;

      ShowMessage('Ocorreu um erro Ao processar. Erro: '+Ex.Message);
    end;

  end;

end;

procedure TfrmImportacao.Button1Click(Sender: TObject);
begin
  OpenTextFileDialog1.Execute();

  nomeArquivo    := '';
  edArquivo.Text := OpenTextFileDialog1.FileName;
  nomeArquivo    := ExtractFileName(OpenTextFileDialog1.FileName);
end;

procedure TfrmImportacao.FormCreate(Sender: TObject);
begin
  edAnoLetivo.Value := FormatDateTime('yyyy', Now).ToInteger();
end;

procedure TfrmImportacao.FormShow(Sender: TObject);
begin
  edArquivo.Text    := EmptyStr;
  lkEscola.KeyValue := Null;

  ClientDataSetEscola.Close;
  ClientDataSetEscola.Open;
end;

end.
