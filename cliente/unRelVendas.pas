unit unRelVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.FMTBcd,
  frxClass, frxDBSet, Data.DB, Data.SqlExpr, Datasnap.DBClient,
  Datasnap.Provider;

type
  TfrmRelVenda = class(TForm)
    edDtInicio: TDateTimePicker;
    edDtFim: TDateTimePicker;
    lblDtInicial: TLabel;
    lblDtFinal: TLabel;
    Button1: TButton;
    SQLQry_Pedido: TSQLQuery;
    frxReportPedido: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    dsPedido: TDataSource;
    sqlItemPedido: TSQLQuery;
    dsItemPedido: TDataSource;
    frxDBDataset2: TfrxDBDataset;
    dspItemPedido: TDataSetProvider;
    cdsItemPedido: TClientDataSet;
    cdsItemPedidoID: TIntegerField;
    cdsItemPedidoID_PRODUTO: TIntegerField;
    cdsItemPedidoDESCRICAO_PRODUTO: TStringField;
    cdsItemPedidoVALOR_PRODUTO: TFMTBCDField;
    cdsItemPedidoQUANTIDADE: TIntegerField;
    cdsItemPedidoIND_EXTRA: TStringField;
    dspPedido: TDataSetProvider;
    cdsPedido: TClientDataSet;
    cdsPedidoID: TIntegerField;
    cdsPedidoNOME: TStringField;
    cdsPedidoDATA_PEDIDO: TDateField;
    cdsPedidoDATA_VENCTO: TDateField;
    cdsPedidoDATA_ENTREG: TDateField;
    cdsPedidoTOTAL_B: TFMTBCDField;
    cdsPedidoDESCONTO: TFMTBCDField;
    cdsPedidoTOTAL_L: TFMTBCDField;
    cdsPedidoID_ALUNO: TIntegerField;
    cdsPedidoID_TURMA: TIntegerField;
    cdsPedidoID_ESCOLA: TIntegerField;
    cdsPedidoANO_LETIVO: TIntegerField;
    cdsPedidoOBSERVACAO: TStringField;
    cdsPedidoCPF_CONTATO: TStringField;
    cdsPedidoTELEFONE: TStringField;
    cdsPedidoNOME_CONTATO: TStringField;
    cdsItemPedidoID_PEDIDO: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVenda: TfrmRelVenda;

implementation

{$R *.dfm}

procedure TfrmRelVenda.Button1Click(Sender: TObject);
begin
  if (edDtInicio.Date <> null ) and (edDtFim.Date <> null) then
  begin
    cdsPedido.Close;
    cdsPedido.Params[0].AsDate := edDtInicio.Date;
    cdsPedido.Params[1].AsDate := edDtFim.Date;
    cdsPedido.Open;

    frxReportPedido.LoadFromFile(ExtractFilePath(Application.ExeName) + '\relatorios\relVenda.fr3');
    frxReportPedido.ShowReport;

  end;
end;

procedure TfrmRelVenda.FormCreate(Sender: TObject);
begin
  edDtInicio.DateTime := Now;
  edDtFim.DateTime    := Now;
end;

end.
