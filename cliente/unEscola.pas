unit unEscola;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Vcl.DBCtrls, Vcl.Mask, Datasnap.Provider,
  Datasnap.DBClient;

type
  TfrmEscola = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBMemo1: TDBMemo;
    Label8: TLabel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    Button3: TButton;
    Label9: TLabel;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    SQLDataSet1: TSQLDataSet;
    SQLDataSet1ID: TIntegerField;
    SQLDataSet1NOME_ESCOLA: TStringField;
    SQLDataSet1ENDERECO: TStringField;
    SQLDataSet1NUMERO: TStringField;
    SQLDataSet1TELEFONE: TStringField;
    SQLDataSet1EMAIL: TStringField;
    SQLDataSet1CELULAR: TStringField;
    SQLDataSet1CNPJ: TStringField;
    SQLDataSet1OBSERVACAO: TStringField;
    btnIncluir: TButton;
    ClientDataSet1ID: TIntegerField;
    ClientDataSet1NOME_ESCOLA: TStringField;
    ClientDataSet1ENDERECO: TStringField;
    ClientDataSet1NUMERO: TStringField;
    ClientDataSet1TELEFONE: TStringField;
    ClientDataSet1EMAIL: TStringField;
    ClientDataSet1CELULAR: TStringField;
    ClientDataSet1CNPJ: TStringField;
    ClientDataSet1OBSERVACAO: TStringField;
    SQLQuery1: TSQLQuery;
    SQLQuery1ID: TLargeintField;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientDataSet1NewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscola: TfrmEscola;
  bEdicao: Boolean;

implementation

{$R *.dfm}

uses  unPrincipal ,unPesquisaEscola;

procedure TfrmEscola.btnCancelarClick(Sender: TObject);
begin
  ClientDataSet1.Close;
end;

procedure TfrmEscola.btnIncluirClick(Sender: TObject);
begin
  bEdicao := False;

  if ClientDataSet1.State = dsEdit then
  begin

    if Application.MessageBox('O cadastro está em edição, deseja realmente inserir um novo registro?','Aviso',MB_YESNO + MB_ICONQUESTION) = ID_YES then
      bEdicao := True;

  end;

  ClientDataSet1.Close;
  ClientDataSet1.Open;
  ClientDataSet1.Append;

end;

procedure TfrmEscola.btnSalvarClick(Sender: TObject);
begin
  if DataSource1.DataSet.State in [dsEdit, dsInsert] then
  begin

    if ClientDataSet1ID.AsInteger = -1 then
    begin
      SQLQuery1.Close;
      SQLQuery1.Open;
      ClientDataSet1ID.AsInteger := SQLQuery1ID.AsInteger;
    end;

    //grava em cache
    ClientDataSet1.Post;
    //grava no bd
    ClientDataSet1.ApplyUpdates(-1);
    //ClientDataSet1 a conexão com a tabela.
    ClientDataSet1.Close;
    frmPrincipal.SQLConnection1.Execute(Pchar('commit'),nil);
    Application.MessageBox('Salvo com sucesso','Aviso', MB_OK+MB_ICONINFORMATION);
  end
  else if DataSource1.DataSet.State = dsBrowse then
    ClientDataSet1.Close
  else
    ShowMessage('Atenção, Por favor executar uma operação');
end;

procedure TfrmEscola.Button3Click(Sender: TObject);
begin
  frmLocalizarEscola.Show;
end;

procedure TfrmEscola.ClientDataSet1NewRecord(DataSet: TDataSet);
begin
  ClientDataSet1ID.Value := -1;
end;

procedure TfrmEscola.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientDataSet1.Close;
end;

end.
