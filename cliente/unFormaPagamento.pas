unit unFormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.FMTBcd, Data.SqlExpr, Datasnap.Provider, Data.DB, Datasnap.DBClient;

type
  TfrmFormaPagamento = class(TForm)
    pnPrincipal: TPanel;
    btnSeleciona: TButton;
    lbFormaPagto: TDBLookupListBox;
    Label1: TLabel;
    dsFormaPagto: TDataSource;
    cdsFormaPagto: TClientDataSet;
    dspFOrmaPagto: TDataSetProvider;
    sqlFormaPagto: TSQLQuery;
    cdsFormaPagtoID: TIntegerField;
    cdsFormaPagtoDESCRICAO: TStringField;
    procedure btnSelecionaClick(Sender: TObject);
    procedure lbFormaPagtoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormaPagamento: TfrmFormaPagamento;

implementation

{$R *.dfm}

uses unPedido;

procedure TfrmFormaPagamento.btnSelecionaClick(Sender: TObject);
begin
  if cdsFormaPagtoID.Value = Null then
  begin
    Application.MessageBox('Selecione Uma Forma de Pagamento Para Prosseguir!','Atenção',MB_ICONWARNING+MB_OK);
    exit;
  end
  else
  begin
    if frmPedido.cdsPedido.State in [dsBrowse, dsInactive] then
       frmPedido.cdsPedido.Edit;

    frmPedido.cdsPedidoformaPagamento.AsInteger := cdsFormaPagtoID.Value;
    frmPedido.salvarFormaPagamento;
  end;

end;

procedure TfrmFormaPagamento.lbFormaPagtoDblClick(Sender: TObject);
begin
  frmFormaPagamento.btnSelecionaClick(Sender);
end;

end.
