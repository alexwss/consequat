unit unRelTotalizador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, frxClass, frxDBSet, Data.SqlExpr, Vcl.StdCtrls,
  Vcl.ComCtrls, frxChart;

type
  TfrmTotalizador = class(TForm)
    lblDtInicial: TLabel;
    lblDtFinal: TLabel;
    edDtInicio: TDateTimePicker;
    edDtFim: TDateTimePicker;
    Button1: TButton;
    SQLQry_Totalizador: TSQLQuery;
    frxReportPedido: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    dsTotalizador: TDataSource;
    dspTotalizador: TDataSetProvider;
    cdsTotalizador: TClientDataSet;
    cdsTotalizadorID: TIntegerField;
    cdsTotalizadorDESCRICAO: TStringField;
    cdsTotalizadorSUM: TFloatField;
    frxChartObject1: TfrxChartObject;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTotalizador: TfrmTotalizador;

implementation

{$R *.dfm}

procedure TfrmTotalizador.Button1Click(Sender: TObject);
begin
  if (edDtInicio.Date <> null ) and (edDtFim.Date <> null) then
  begin
    cdsTotalizador.Close;
    cdsTotalizador.ParamByName('DATA_INICIO').value := edDtInicio.Date;
    cdsTotalizador.ParamByName('DATA_FIM').value := edDtFim.Date;
    cdsTotalizador.Open;

    frxReportPedido.LoadFromFile(ExtractFilePath(Application.ExeName) + '\relatorios\relTotalizador.fr3');
    frxReportPedido.ShowReport;

  end;
end;

procedure TfrmTotalizador.FormCreate(Sender: TObject);
begin
  edDtInicio.DateTime := Now;
  edDtFim.DateTime    := Now;
end;

end.
