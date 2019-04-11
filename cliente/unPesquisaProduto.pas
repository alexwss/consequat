unit unPesquisaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Data.FMTBcd, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  Data.SqlExpr;

type
  TfrmPesquisaProduto = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    btnLocalizar: TButton;
    DBGrid1: TDBGrid;
    btnCancelar: TButton;
    btnSelecionar: TButton;
    StatusBar1: TStatusBar;
    sqlKit: TSQLQuery;
    dspKit: TDataSetProvider;
    cdsKit: TClientDataSet;
    dsKit: TDataSource;
    cdsKitID: TIntegerField;
    cdsKitID_PROD_KIT: TIntegerField;
    cdsKitID_PRODUTO: TIntegerField;
    cdsKitDESCRICAO: TStringField;
    cdsKitQUANTIDADE: TIntegerField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaProduto: TfrmPesquisaProduto;

implementation

{$R *.dfm}

uses unProduto;

procedure TfrmPesquisaProduto.btnCancelarClick(Sender: TObject);
begin
  frmPesquisaProduto.Close;
end;

procedure TfrmPesquisaProduto.btnLocalizarClick(Sender: TObject);
begin

  frmProduto.ClientDataSetProduto.Active := False;
  frmProduto.SQLDataSetProduto.Close;
  frmProduto.ClientDataSetProduto.Params[0].AsString := '%' + Edit1.Text + '%';
  frmProduto.ClientDataSetProduto.Active := True;
  frmProduto.SQLDataSetProduto.Open;

  btnSelecionar.Enabled := not frmProduto.ClientDataSetProduto.IsEmpty;

  if frmProduto.ClientDataSetProduto.IsEmpty then
    StatusBar1.SimpleText := Format('Nenhum registro foi encontrado' + 'com "%s"', [Edit1.Text])
  else
    StatusBar1.SimpleText := Format('%d registros encontrados com' + '"%s"',[frmProduto.ClientDataSetProduto.RecordCount, Edit1.Text]);

end;

procedure TfrmPesquisaProduto.btnSelecionarClick(Sender: TObject);
begin

  if cdsKit.RecordCount > 0 then
  begin
    frmProduto.cdsKit.Close;
    frmProduto.cdsKit.Open;

    cdsKit.First;
    while not cdsKit.Eof do
    begin

      frmProduto.cdsKit.Append;
      frmProduto.cdsKitID.AsInteger           := cdsKitID.AsInteger;
      frmProduto.cdsKitID_PROD_KIT.AsInteger  := cdsKitID_PROD_KIT.AsInteger;
      frmProduto.cdsKitID_PRODUTO.AsInteger   := cdsKitID_PRODUTO.AsInteger;
      frmProduto.cdsKitDESCRICAO.AsString     := cdsKitDESCRICAO.AsString;
      frmProduto.cdsKitQUANTIDADE.AsInteger   := cdsKitQUANTIDADE.AsInteger;
      frmProduto.cdsKitIND_ALTERACAO.AsString := 'N';
      frmProduto.cdsKit.Post;

      cdsKit.Next;
    end;

  end;

  frmProduto.zeraIdSequencial;
  frmProduto.edDescricao.SetFocus;
  Close;
end;

procedure TfrmPesquisaProduto.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
    btnLocalizar.Enabled := True
  else
    btnLocalizar.Enabled := False;
end;

procedure TfrmPesquisaProduto.Edit1Click(Sender: TObject);
begin
  btnLocalizar.Click;
end;

end.
