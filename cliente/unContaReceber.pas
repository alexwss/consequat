unit unContaReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Data.FMTBcd, Data.SqlExpr, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Samples.Spin, Vcl.Mask;

type
  TfrmContaRebecer = class(TForm)
    pnFIltro: TPanel;
    pnControles: TPanel;
    pnGrid: TPanel;
    btnBaixa: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    Label3: TLabel;
    lblAluno: TLabel;
    lblNome: TLabel;
    Label4: TLabel;
    btnPesquisaAbaUm: TButton;
    edAnoLetivo: TSpinEdit;
    lkAluno: TDBLookupComboBox;
    lkEscola: TDBLookupComboBox;
    lkSerie: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label5: TLabel;
    dtInicio: TDateTimePicker;
    dtFim: TDateTimePicker;
    DataSourceEscola: TDataSource;
    ClientDataSetEscola: TClientDataSet;
    ClientDataSetEscolaID: TIntegerField;
    ClientDataSetEscolaNOME_ESCOLA: TStringField;
    DataSetProviderEscola: TDataSetProvider;
    SQLQueryEscola: TSQLQuery;
    dsAluno: TDataSource;
    cdsAluno: TClientDataSet;
    cdsAlunoID: TIntegerField;
    cdsAlunoNOME: TStringField;
    cdsAlunoRA: TStringField;
    dspAluno: TDataSetProvider;
    sqlAluno: TSQLQuery;
    dsSerie: TDataSource;
    cdsSerie: TClientDataSet;
    cdsSerieID: TIntegerField;
    cdsSerieSERIE: TStringField;
    dspSerie: TDataSetProvider;
    sqlSerie: TSQLQuery;
    sqlContasReceber: TSQLQuery;
    dspContasReceber: TDataSetProvider;
    cdsContasReceber: TClientDataSet;
    dsContasReceber: TDataSource;
    cdsContasReceberID: TIntegerField;
    cdsContasReceberID_PEDIDO: TIntegerField;
    cdsContasReceberVALOR: TSingleField;
    cdsContasReceberDATA_LANCAMENTO: TDateField;
    cdsContasReceberDATA_VENCTO: TDateField;
    cdsContasReceberEVENTO: TStringField;
    cdsContasReceberOBSERVACAO: TStringField;
    cdsContasReceberID_FORMA_PAGTO: TIntegerField;
    cdsContasReceberDESCRICAO: TStringField;
    DBGrid1: TDBGrid;
    cdsContasReceberNOME: TStringField;
    cdsContasReceberTELEFONE: TStringField;
    cdsContasReceberNOME_CONTATO: TStringField;
    rgStatus: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ClientDataSetEscolaAfterScroll(DataSet: TDataSet);
    procedure cdsSerieAfterScroll(DataSet: TDataSet);
    procedure btnPesquisaAbaUmClick(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure montarPesquisa();
  public
    { Public declarations }
  end;

var
  frmContaRebecer: TfrmContaRebecer;

implementation

{$R *.dfm}

uses unBaixaTitulo;

procedure TfrmContaRebecer.btnBaixaClick(Sender: TObject);
begin

  if cdsContasReceberId.IsNull then
  begin
    ShowMessage(PChar('Selecione um item antes de prosseguir.'));
    exit;
  end;

  if cdsContasReceberEVENTO.AsString  <> 'PENDENTE' then
  begin
    ShowMessage(PChar('Título não pode ser alterado!'));
    exit;
  end;

  if cdsContasReceberEVENTO.AsString  = 'DEVOLVIDO' then
  begin
    ShowMessage(PChar('Título Devolvido não pode ser alterado!'));
    exit;
  end;

  frmBaixaTitulo.carregarTitulo(cdsContasReceberID.AsInteger);
  frmBaixaTitulo.ShowModal;
end;

procedure TfrmContaRebecer.btnPesquisaAbaUmClick(Sender: TObject);
begin
  montarPesquisa();
end;

procedure TfrmContaRebecer.cdsSerieAfterScroll(DataSet: TDataSet);
begin
  cdsAluno.Active              := False;
  cdsAluno.Params[0].AsInteger := cdsSerieID.Value;
  cdsAluno.Active              := True;
end;

procedure TfrmContaRebecer.ClientDataSetEscolaAfterScroll(DataSet: TDataSet);
begin
  cdsSerie.Active              := False;
  cdsSerie.Params[0].AsInteger := ClientDataSetEscolaID.Value;
  cdsSerie.Params[1].AsInteger := edAnoLetivo.Value;
  cdsSerie.Active              := True;
end;

procedure TfrmContaRebecer.DBGrid1DblClick(Sender: TObject);
begin
  if not cdsContasReceberID.IsNull then
    btnBaixaClick(Sender);
end;

procedure TfrmContaRebecer.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if Column.Field = cdsContasReceberEVENTO then
  begin

    if cdsContasReceberEVENTO.AsString = 'PENDENTE' then
    begin
      DBGrid1.Canvas.Brush.Color := clGreen;
      DBGrid1.Canvas.Font.Color  := clWhite;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, state);
    end
    else if cdsContasReceberEVENTO.AsString = 'LIQUIDADO' then
    begin
      DBGrid1.Canvas.Brush.Color := clBlue;
      DBGrid1.Canvas.Font.Color  := clWhite;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, state);
    end
    else if cdsContasReceberEVENTO.AsString = 'CANCELADO' then         
    begin
      DBGrid1.Canvas.Brush.Color := clRed;
      DBGrid1.Canvas.Font.Color  := clWhite;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, state);
    end
    else if cdsContasReceberEVENTO.AsString = 'DEVOLVIDO' then
    begin
      DBGrid1.Canvas.Brush.Color := clMedGray;
      DBGrid1.Canvas.Font.Color  := clWhite;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, state);
    end    
         
  end;
end;

procedure TfrmContaRebecer.FormCreate(Sender: TObject);
begin
  dtInicio.DateTime  := Now;
  dtFim.DateTime     := Now;
  edAnoLetivo.Value  := FormatDateTime('yyyy', Now).ToInteger();
end;

procedure TfrmContaRebecer.FormShow(Sender: TObject);
begin

  if not (ClientDataSetEscola.Active) then
  begin
    ClientDataSetEscola.Active := True;
    ClientDataSetEscola.Open;
  end;

  if not (cdsSerie.Active) then
  begin
    cdsSerie.Active := True;
    cdsSerie.Open;
  end;

  if not (cdsAluno.Active) then
  begin
    cdsAluno.Active := True;
    cdsAluno.Open;
  end;

end;

procedure TfrmContaRebecer.montarPesquisa;
var sql :String;
begin
  sql := 'select T.ID, T.ID_PEDIDO, A.NOME, P.TELEFONE, P.NOME_CONTATO , ' +
         '       T.VALOR, T.DATA_LANCAMENTO, P.DATA_VENCTO,'+
         '       T.EVENTO, T.OBSERVACAO, T.ID_FORMA_PAGTO,' +
         '       F.DESCRICAO '+
         '  from TITULO T '+
         ' inner join PEDIDO P on (T.ID_PEDIDO = P.ID) '+
         ' inner join ALUNO A on (P.ID_ALUNO = A.ID) '+
         ' left  join FORMA_PAGAMENTO F on (T.ID_FORMA_PAGTO = F.ID) '+
         ' where 1 = 1 ';

  if lkAluno.KeyValue <> Null then
  begin
    sql := sql + ' and p.id_aluno = ' +  IntToStr(lkAluno.KeyValue);
  end
  else
  begin

    if rgStatus.ItemIndex <> Null then
    begin
      if rgStatus.ItemIndex = 0 then
        sql := sql + 'and t.evento = ' + QuotedStr('PENDENTE')
      else if rgStatus.ItemIndex = 1 then
        sql := sql + 'and t.evento = ' + QuotedStr('LIQUIDADO')
      else if rgStatus.ItemIndex = 2 then
        sql := sql + 'and t.evento = ' + QuotedStr('CANCELADO');
    end;

    if (dtInicio.DateTime <> Null) and (dtFim.DateTime <> Null)  then
    begin
      sql:= sql + 'and P.DATA_VENCTO between ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtInicio.DateTime).ToLower) +
                                           ' and ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtFim.DateTime).ToLower);
    end;

  end;
  sql := sql + ' order by 1';

  cdsContasReceber.Close;
  sqlContasReceber.SQL.Clear;
  sqlContasReceber.SQL.Add(sql);
  cdsContasReceber.Open;

end;

end.
