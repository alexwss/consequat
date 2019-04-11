unit unBaixaTitulo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.FMTBcd, Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr;

type
  TfrmBaixaTitulo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edAluno: TDBText;
    edValor: TDBText;
    edEscola: TDBText;
    edSerie: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edObservacao: TDBMemo;
    btnFinalizar: TButton;
    btnCancelar: TButton;
    rbBaixar: TRadioButton;
    Label6: TLabel;
    rbCancelar: TRadioButton;
    sqlTitulo: TSQLQuery;
    dspTitulo: TDataSetProvider;
    cdsTitulo: TClientDataSet;
    dsTitulo: TDataSource;
    cdsTituloID: TIntegerField;
    cdsTituloNOME_ALUNO: TStringField;
    cdsTituloNOME_ESCOLA: TStringField;
    cdsTituloSERIE: TStringField;
    cdsTituloVALOR: TSingleField;
    cdsTituloOBSERVACAO: TStringField;
    sqlSpBaixaTitulo: TSQLStoredProc;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure carregarTitulo(idTitulo: Integer);
  end;

var
  frmBaixaTitulo: TfrmBaixaTitulo;

implementation

{$R *.dfm}

uses unContaReceber;

procedure TfrmBaixaTitulo.btnCancelarClick(Sender: TObject);
begin
  cdsTitulo.Close;
  frmBaixaTitulo.Close;
end;

procedure TfrmBaixaTitulo.btnFinalizarClick(Sender: TObject);
begin

  if not cdsTituloID.IsNull then
  begin

    try

      sqlSpBaixaTitulo.Close;
      sqlSpBaixaTitulo.Params[0].AsInteger := cdsTituloID.AsInteger;

      if rbBaixar.Checked then
        sqlSpBaixaTitulo.Params[1].AsString := 'LIQUIDADO'
      else sqlSpBaixaTitulo.Params[1].AsString := 'CANCELADO';

      sqlSpBaixaTitulo.Params[2].AsString := cdsTituloOBSERVACAO.AsString;
      sqlSpBaixaTitulo.ExecProc;

      cdsTitulo.Close;
      Application.MessageBox('Salvo com Sucesso','Sucesso',MB_ICONINFORMATION + MB_OK);

      if frmBaixaTitulo <> nil then
      begin
        frmContaRebecer.btnPesquisaAbaUmClick(Sender);
      end;

      frmBaixaTitulo.Close;

    except on E: Exception do
      ShowMessage(PChar('Erro ao salvar: ' + E.Message ));
    end;

  end;

end;

procedure TfrmBaixaTitulo.carregarTitulo(idTitulo: Integer);
begin

  cdsTitulo.Close;
  cdsTitulo.Active              := False;
  cdsTitulo.Params[0].AsInteger := idTitulo;
  cdsTitulo.Active              := True;
  cdsTitulo.Open;

end;

end.
