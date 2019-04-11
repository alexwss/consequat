unit unPesquisaPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Vcl.StdCtrls,
  Vcl.Samples.Spin, Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmPesquisaPedido = class(TForm)
    Panel1: TPanel;
    sqlSerie: TSQLQuery;
    dspSerie: TDataSetProvider;
    cdsSerie: TClientDataSet;
    cdsSerieID: TIntegerField;
    cdsSerieSERIE: TStringField;
    dsSerie: TDataSource;
    SQLQueryEscola: TSQLQuery;
    DataSetProviderEscola: TDataSetProvider;
    ClientDataSetEscola: TClientDataSet;
    ClientDataSetEscolaID: TIntegerField;
    ClientDataSetEscolaNOME_ESCOLA: TStringField;
    DataSourceEscola: TDataSource;
    dsAluno: TDataSource;
    cdsAluno: TClientDataSet;
    cdsAlunoID: TIntegerField;
    cdsAlunoNOME: TStringField;
    cdsAlunoRA: TStringField;
    dspAluno: TDataSetProvider;
    sqlAluno: TSQLQuery;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    Label3: TLabel;
    lblAluno: TLabel;
    lblNome: TLabel;
    btnPesquisaAbaUm: TButton;
    edAnoLetivo: TSpinEdit;
    lkAluno: TDBLookupComboBox;
    lkEscola: TDBLookupComboBox;
    lkSerie: TDBLookupComboBox;
    sqlPedidoPesquisa: TSQLQuery;
    dspPedidoPesquisa: TDataSetProvider;
    cdsPedidoPesquisa: TClientDataSet;
    dsPedidoPesquisa: TDataSource;
    Label1: TLabel;
    Label4: TLabel;
    cdsPedidoPesquisaID: TIntegerField;
    cdsPedidoPesquisaNOME: TStringField;
    cdsPedidoPesquisaDATA_PEDIDO: TDateField;
    cdsPedidoPesquisaDATA_VENCTO: TDateField;
    cdsPedidoPesquisaDATA_ENTREG: TDateField;
    cdsPedidoPesquisaTOTAL_B: TFMTBCDField;
    cdsPedidoPesquisaDESCONTO: TFMTBCDField;
    cdsPedidoPesquisaTOTAL_L: TFMTBCDField;
    cdsPedidoPesquisaID_ALUNO: TIntegerField;
    cdsPedidoPesquisaID_TURMA: TIntegerField;
    cdsPedidoPesquisaID_ESCOLA: TIntegerField;
    sqlPedidoItem: TSQLQuery;
    dspPedidoItem: TDataSetProvider;
    cdsPedidoItem: TClientDataSet;
    dsPedidoItem: TDataSource;
    cdsPedidoItemID: TIntegerField;
    cdsPedidoItemID_PRODUTO: TIntegerField;
    cdsPedidoItemDESCRICAO_PRODUTO: TStringField;
    cdsPedidoItemVALOR_PRODUTO: TFMTBCDField;
    cdsPedidoItemQUANTIDADE: TIntegerField;
    cdsPedidoPesquisaANO_LETIVO: TIntegerField;
    cdsPedidoPesquisaOBSERVACAO: TStringField;
    cdsPedidoPesquisaCPF_CONTATO: TStringField;
    cdsPedidoPesquisaTELEFONE: TStringField;
    cdsPedidoPesquisaNOME_CONTATO: TStringField;
    cdsPedidoItemIND_EXTRA: TStringField;
    GroupBox1: TGroupBox;
    dtInicio: TDateTimePicker;
    Label6: TLabel;
    Label5: TLabel;
    dtFim: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ClientDataSetEscolaAfterScroll(DataSet: TDataSet);
    procedure cdsSerieAfterScroll(DataSet: TDataSet);
    procedure btnPesquisaAbaUmClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    Function ifthen(cond: boolean; aTrue: variant; aFalse:  variant): variant;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure gerarQuery(nomeBotao : String);
  public
    { Public declarations }
  end;

var
  frmPesquisaPedido: TfrmPesquisaPedido;

implementation

{$R *.dfm}

{ TfrmPesquisaPedido }

uses unPedido;

procedure TfrmPesquisaPedido.btnPesquisaAbaUmClick(Sender: TObject);
begin
  gerarQuery('botaoUm');
end;

procedure TfrmPesquisaPedido.Button2Click(Sender: TObject);
begin

  if (cdsPedidoPesquisaID.IsNull) then
  begin
    ShowMessage(Pchar('Selecione um registro para prosseguir!'));
    exit;
  end;

  frmPedido.cdsPedido.Open;
  frmPedido.cdsPedido.EmptyDataSet;

  frmPedido.cdsPedido.Append;
  frmPedido.cdsPedidoid.AsInteger            := cdsPedidoPesquisaID.AsInteger;
  frmPedido.cdsPedidoidEscola.AsInteger      := cdsPedidoPesquisaID_ESCOLA.AsInteger;
  frmPedido.cdsPedidoidSerie.AsInteger       := cdsPedidoPesquisaID_TURMA.AsInteger;
  frmPedido.cdsPedidoidAluno.AsInteger       := cdsPedidoPesquisaID_ALUNO.AsInteger;
  frmPedido.edAnoLetivo.Value                := cdsPedidoPesquisaANO_LETIVO.Value;
  frmPedido.cdsPedidoobservacao.AsString     := cdsPedidoPesquisaOBSERVACAO.AsString;
  frmPedido.cdsPedidocelularContato.AsString := cdsPedidoPesquisaTELEFONE.AsString;
  frmPedido.cdsPedidocpfContato.AsString     := cdsPedidoPesquisaCPF_CONTATO.AsString;
  frmPedido.cdsPedidonomeContato.AsString    := cdsPedidoPesquisaNOME_CONTATO.AsString;
  frmPedido.dtVencito.DateTime               := cdsPedidoPesquisaDATA_VENCTO.AsDateTime;
  frmPedido.dtEntrega.DateTime               := cdsPedidoPesquisaDATA_ENTREG.AsDateTime;
  frmPedido.cdsPedidostatus.AsString         := 'Finalizado';
  frmPedido.cdsPedido.Post;

  cdsPedidoItem.Active := False;
  cdsPedidoItem.Params[0].AsInteger := cdsPedidoPesquisaID.AsInteger;
  cdsPedidoItem.Active := True;

  frmPedido.cdsItem.Open;
  frmPedido.cdsItem.EmptyDataSet;

  cdsPedidoItem.First;
  while not cdsPedidoItem.Eof do
  begin
    frmPedido.cdsItem.Append;
    frmPedido.cdsItemid.AsInteger               := cdsPedidoItemID.AsInteger;
    frmPedido.cdsItemIDPRODUTO.AsInteger        := cdsPedidoItemID_PRODUTO.AsInteger;
    frmPedido.cdsItemDESCRICAO_PRODUTO.AsString := cdsPedidoItemDESCRICAO_PRODUTO.AsString;
    frmPedido.cdsItemVALOR_PRODUTO.AsCurrency   := cdsPedidoItemVALOR_PRODUTO.AsCurrency;
    frmPedido.cdsItemQUANTIDADE.AsInteger       := cdsPedidoItemQUANTIDADE.AsInteger;
    frmPedido.cdsItemIND_ITEM_EXTRA.AsString    := cdsPedidoItemIND_EXTRA.AsString;
    frmPedido.cdsItemIND_NOVO.Value             := False;
    cdsPedidoItem.Next;
  end;

  frmPedido.chkPedidoExtra.Visible := True;
  frmPedido.setPedidoExtra(False);
  frmPedido.chkPedidoExtra.Checked := False;

  cdsPedidoItem.Last;
  frmPedido.setSequencial(cdsPedidoItemID.AsInteger + 1);
  frmPedido.calculaTotal;
  frmPedido.lblStatus.Refresh;
  frmPedido.btnObservacao.Enabled := True;
  frmPedido.SetFocus;
  frmPedido.DBGrid1.Enabled  := True;
  frmPedido.DBGrid1.ReadOnly := True;
  Close;
end;

procedure TfrmPesquisaPedido.cdsSerieAfterScroll(DataSet: TDataSet);
begin
  cdsAluno.Active              := False;
  cdsAluno.Params[0].AsInteger := cdsSerieID.Value;
  cdsAluno.Active              := True;
end;

procedure TfrmPesquisaPedido.ClientDataSetEscolaAfterScroll(DataSet: TDataSet);
begin
  //implementar
  cdsSerie.Active              := False;
  cdsSerie.Params[0].AsInteger := ClientDataSetEscolaID.Value;
  cdsSerie.Params[1].AsInteger := edAnoLetivo.Value;
  cdsSerie.Active              := True;
end;

procedure TfrmPesquisaPedido.DBGrid1DblClick(Sender: TObject);
begin
  if not cdsPedidoPesquisaID.IsNull then
     Button2Click(Sender);

end;

procedure TfrmPesquisaPedido.FormCreate(Sender: TObject);
begin
  edAnoLetivo.Value  := FormatDateTime('yyyy', Now).ToInteger();
  dtInicio.DateTime  := Now;
  dtFim.DateTime     := Now;
end;

procedure TfrmPesquisaPedido.FormShow(Sender: TObject);
begin

  if not (ClientDataSetEscola.Active) then
  begin
    //ClientDataSetEscola.Close;
    ClientDataSetEscola.Active := True;
    ClientDataSetEscola.Open;
  end;

  if not (cdsSerie.Active) then
  begin
   // cdsSerie.Close;
    cdsSerie.Active := True;
    cdsSerie.Open;
  end;

  if not (cdsAluno.Active) then
  begin
    //cdsAluno.Close;
    cdsAluno.Active := True;
    cdsAluno.Open;
  end;

end;

procedure TfrmPesquisaPedido.gerarQuery(nomeBotao : String);
var dataErro : TDateTime;
    sql      : String;
begin
  dataErro := EncodeDate(1990,1,1);
  cdsPedidoPesquisa.Close;

  sql :=      ' select P.ID, A.NOME, P.DATA_PEDIDO, P.DATA_VENCTO, P.DATA_ENTREG, P.TOTAL_B, P.DESCONTO, P.TOTAL_L, P.ID_ALUNO, T.ID ID_TURMA, E.ID ID_ESCOLA, T.ANO_LETIVO, P.OBSERVACAO, P.CPF_CONTATO, P.TELEFONE, P.NOME_CONTATO' +
              '   from PEDIDO P'                             +
              '  inner join ALUNO A on (P.ID_ALUNO = A.ID) ' +
              '  inner join TURMA T on (T.ID = A.ID_TURMA)'  +
              '  inner join ESCOLA E on (E.ID = T.ID_ESCOLA)'+
              '  where 1=1 ';

  if (lkAluno.KeyValue <> Null) then
  begin
    sql := sql + ' and  a.id = ' + IntToStr(lkAluno.KeyValue);
  end
  else
  begin

    if (dtInicio.DateTime <> Null) and (dtFim.DateTime <> Null) then
      sql:= sql + 'and p.data_pedido between ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtInicio.DateTime).ToLower) +
                                           ' and ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtFim.DateTime).ToLower);

  end;

  sql:= sql + ' order by 1';

  sqlPedidoPesquisa.SQL.Clear;
  sqlPedidoPesquisa.SQL.Add(sql);

  cdsPedidoPesquisa.Open;

end;

function TfrmPesquisaPedido.ifthen(cond: boolean; aTrue,
  aFalse: variant): variant;
begin
  if cond then
    Result := aTrue
  else
    Result :=  aFalse;
end;

end.
