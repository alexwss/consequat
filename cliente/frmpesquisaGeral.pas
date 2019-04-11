unit frmpesquisaGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Data.FMTBcd, Data.SqlExpr;

type
  TfrmpesqGeral = class(TForm)
    DBGrid1: TDBGrid;
    dts_pesquisa: TDataSource;
    cds_pesquisa: TClientDataSet;
    cds_pesquisaIDREGISTRO: TIntegerField;
    cds_pesquisaDESCRICAO_REGISTRO: TStringField;
    DataSource1: TDataSource;
    SQLTable1: TSQLTable;
    SQLTable1ID: TIntegerField;
    SQLTable1NOME_ESCOLA: TStringField;
    SQLTable1ENDERECO: TStringField;
    SQLTable1NUMERO: TStringField;
    SQLTable1TELEFONE: TStringField;
    SQLTable1EMAIL: TStringField;
    SQLTable1CELULAR: TStringField;
    SQLTable1CNPJ: TStringField;
    SQLTable1OBSERVACAO: TStringField;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure getTable(tabela:string;idpesqu :string;descricaopesq:string);
    procedure getSqlCommand(sql :string;id :integer;descricao:string);
    VAR IDRETORNADO :INTEGER;
        SDESCRICAORETORNADO :STRING;
  end;

var
  frmpesqGeral: TfrmpesqGeral;

implementation

{$R *.dfm}

procedure TfrmpesqGeral.getTable(tabela:string;idpesqu :string;descricaopesq:string);
begin
  //pega table sem filtrar nada
  SQLTable1.Close;
  SQLTable1.TableName:=tabela;
  SQLTable1.Active := True;
  SQLTable1.Open;
  //ShowMessage(SQLTable1.RecordCount.ToString());
  SQLTable1.First;
  while not SQLTable1.Eof do
  begin
    DBGrid1.DataSource.DataSet.Append;
    DBGrid1.DataSource.DataSet.FieldByName('IDREGISTRO').AsInteger:=SQLTable1.FieldByName(idpesqu).AsInteger;
    DBGrid1.DataSource.DataSet.FieldByName('DESCRICAO_REGISTRO').AsString:=SQLTable1.FieldByName(descricaopesq).AsString;
    DBGrid1.DataSource.DataSet.Post;

    SQLTable1.Next;
  end;
end;
procedure TfrmpesqGeral.DBGrid1DblClick(Sender: TObject);
begin
     IDRETORNADO:=DBGrid1.DataSource.DataSet.FieldByName('IDREGISTRO').AsInteger;
     SDESCRICAORETORNADO:=DBGrid1.DataSource.DataSet.FieldByName('DESCRICAO_REGISTRO').AsString;
    Close;
end;

procedure TfrmpesqGeral.getSqlCommand(sql :string;id :integer;descricao:string);
begin
  //se precisar filtrar dados usar query

end;
end.
