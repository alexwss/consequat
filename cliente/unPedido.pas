unit unPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Mask, Data.DB, Datasnap.DBClient, Data.FMTBcd,
  Data.SqlExpr, Datasnap.Provider, Vcl.Samples.Spin, Vcl.ExtCtrls;

type
  TfrmPedido = class(TForm)
    lblTitulo: TLabel;
    btnPesquisa: TButton;
    lkEscola: TDBLookupComboBox;
    lkSerie: TDBLookupComboBox;
    lkAluno: TDBLookupComboBox;
    edContato: TDBEdit;
    dtVencito: TDateTimePicker;
    dtEntrega: TDateTimePicker;
    lkProduto: TDBLookupComboBox;
    btnIncluir: TButton;
    dbNrPedido: TDBText;
    lblNome: TLabel;
    lblSerie: TLabel;
    lblAluno: TLabel;
    Label4: TLabel;
    edCpf: TDBEdit;
    edCelular: TDBEdit;
    btnObservacao: TButton;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    lblCodProd: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblDescricaoProd: TLabel;
    lblQtde: TLabel;
    btnFinalizar: TButton;
    btnCancelar: TButton;
    edCodProduto: TEdit;
    lblDtVencto: TLabel;
    cdsItem: TClientDataSet;
    cdsItemIDPRODUTO: TIntegerField;
    cdsItemDESCRICAO_PRODUTO: TStringField;
    cdsItemVALOR_PRODUTO: TFloatField;
    cdsItemQUANTIDADE: TFloatField;
    dsItem: TDataSource;
    btnIncluirPedido: TButton;
    cdsPedido: TClientDataSet;
    dsPedido: TDataSource;
    cdsPedidoid: TIntegerField;
    cdsPedidoidEscola: TIntegerField;
    cdsPedidonomeEscola: TStringField;
    SQLQueryEscola: TSQLQuery;
    DataSetProviderEscola: TDataSetProvider;
    ClientDataSetEscola: TClientDataSet;
    ClientDataSetEscolaID: TIntegerField;
    ClientDataSetEscolaNOME_ESCOLA: TStringField;
    DataSourceEscola: TDataSource;
    cdsPedidoidSerie: TIntegerField;
    cdsPedidoanoLetivo: TIntegerField;
    cdsPedidoidAluno: TIntegerField;
    cdsPedidodesconto: TCurrencyField;
    cdsPedidoobservacao: TStringField;
    cdsPedidodataPedido: TDateField;
    cdsPedidodataEntrega: TDateField;
    cdsPedidodataVencimento: TDateField;
    cdsPedidonomeContato: TStringField;
    cdsPedidocpfContato: TStringField;
    cdsPedidocelularContato: TStringField;
    edAnoLetivo: TSpinEdit;
    Label3: TLabel;
    dsSerie: TDataSource;
    cdsSerie: TClientDataSet;
    dspSerie: TDataSetProvider;
    sqlSerie: TSQLQuery;
    cdsSerieID: TIntegerField;
    cdsSerieSERIE: TStringField;
    dsAluno: TDataSource;
    cdsAluno: TClientDataSet;
    dspAluno: TDataSetProvider;
    sqlAluno: TSQLQuery;
    cdsAlunoID: TIntegerField;
    cdsAlunoNOME: TStringField;
    lblStatus: TDBText;
    cdsPedidostatus: TStringField;
    cdsItemid: TIntegerField;
    edDesconto: TDBEdit;
    Panel1: TPanel;
    DBMemo1: TDBMemo;
    btnConcluir: TButton;
    cdsAlunoRA: TStringField;
    dsProduto: TDataSource;
    cdsProduto: TClientDataSet;
    dspProduto: TDataSetProvider;
    sqlProduto: TSQLQuery;
    cdsProdutoID: TIntegerField;
    cdsProdutoDESCRICAO: TStringField;
    cdsProdutoVALOR: TFMTBCDField;
    sqlSpPedido: TSQLStoredProc;
    sqlSpItem: TSQLStoredProc;
    SQLProc: TSQLQuery;
    cdsProdutoDESCRICAO_ORIGINAL: TStringField;
    sqlSpLog: TSQLStoredProc;
    edQtde: TEdit;
    lblTotalLiquido: TLabel;
    cdsItemIND_ITEM_EXTRA: TStringField;
    chkPedidoExtra: TCheckBox;
    cdsItemIND_NOVO: TBooleanField;
    sqlSpPedidoExtra: TSQLStoredProc;
    sqlSpFormaPagto: TSQLStoredProc;
    cdsPedidoformaPagamento: TIntegerField;
    sqlSpValidaTitulo: TSQLStoredProc;
    cdsProdutoIND_KIT: TStringField;
    sqlKit: TSQLQuery;
    dspKit: TDataSetProvider;
    cdsKit: TClientDataSet;
    dsKit: TDataSource;
    cdsKitID_PRODUTO: TIntegerField;
    cdsKitDESCRICAO: TStringField;
    cdsKitQUANTIDADE: TIntegerField;
    cdsKitVALOR: TFMTBCDField;
    cdsKitID_PROD_KIT: TIntegerField;
    cdsItemID_KIT: TIntegerField;
    procedure edDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edQtdeKeyPress(Sender: TObject; var Key: Char);
    Procedure FormatarComoMoeda( Componente : TObject; var Key: Char );
    procedure edCodProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edAnoLetivoChange(Sender: TObject);
    procedure cdsPedidoidEscolaChange(Sender: TField);
    procedure cdsPedidoidSerieChange(Sender: TField);
    procedure cdsPedidoNewRecord(DataSet: TDataSet);
    procedure edCpfClick(Sender: TObject);
    procedure edCelularClick(Sender: TObject);
    procedure btnConcluirClick(Sender: TObject);
    procedure btnObservacaoClick(Sender: TObject);
    procedure btnIncluirPedidoClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure desabilitaComponentes;
    procedure habilitaComponentes;
    procedure btnFinalizarClick(Sender: TObject);
    procedure edQtdeClick(Sender: TObject);
    procedure calculaTotal;
    procedure edDescontoChange(Sender: TObject);
    procedure cdsProdutoAfterDelete(DataSet: TDataSet);
    procedure edDescontoExit(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure chkPedidoExtraClick(Sender: TObject);
    procedure cdsPedidoAfterPost(DataSet: TDataSet);
    procedure edCodProdutoExit(Sender: TObject);
    procedure lkProdutoExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsProdutoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setSequencial(Valor :Integer);
    procedure setPedidoExtra(Valor :Boolean);
    procedure habilitaPedidoExtra();
    procedure salvarFormaPagamento();
  end;

var
  frmPedido    : TfrmPedido;
  idSequencial : Integer;
  total_bruto, total_liquido : Currency;
  bPedidoExtra : Boolean;

implementation

{$R *.dfm}

uses unPesquisaPedido, unFormaPagamento;

procedure TfrmPedido.btnCancelarClick(Sender: TObject);
begin
  cdsPedido.Close;
  cdsItem.Close;
  ClientDataSetEscola.Close;
  ClientDataSetEscola.Active := False;
  cdsSerie.Close;
  cdsSerie.Active := False;
  cdsAluno.Close;
  cdsAluno.Active := False;
  lblTotalLiquido.Caption := '';
  desabilitaComponentes;
end;

procedure TfrmPedido.btnConcluirClick(Sender: TObject);
begin
  Panel1.Visible := False;
  if dtVencito.Enabled then  
    dtVencito.SetFocus;
end;

procedure TfrmPedido.btnFinalizarClick(Sender: TObject);
begin

  if (cdsItem.RecordCount = 0) then
  begin
    ShowMessage(Pchar('Inclua um item antes de finalizar!'));
    exit;
  end;

  if (cdsPedidoidAluno.IsNull) then
  begin
    ShowMessage(Pchar('Selecione um aluno antes de finalizar!'));
    exit;
  end;

  try

    if bPedidoExtra then
    begin
      sqlSpPedidoExtra.Close;
      sqlSpPedidoExtra.Params[0].AsInteger  := cdsPedidoid.AsInteger;
      sqlSpPedidoExtra.Params[1].AsCurrency := total_bruto;
      sqlSpPedidoExtra.Params[2].AsCurrency := total_liquido;
      sqlSpPedidoExtra.ExecProc;
    end
    else
    begin
      sqlSpPedido.Close;
      sqlSpPedido.Params[0].AsInteger  := cdsPedidoidAluno.AsInteger;
      sqlSpPedido.Params[1].AsDate     := Now;
      sqlSpPedido.Params[2].AsDate     := dtVencito.Date;
      sqlSpPedido.Params[3].AsDate     := dtEntrega.Date;
      sqlSpPedido.Params[4].AsCurrency := total_bruto;
      sqlSpPedido.Params[5].AsInteger  := cdsPedidodesconto.AsInteger;
      sqlSpPedido.Params[6].AsCurrency := total_liquido;
      sqlSpPedido.Params[7].AsString   := cdsPedidoobservacao.AsString;
      sqlSpPedido.Params[8].AsString   := cdsPedidocpfContato.AsString;
      sqlSpPedido.Params[9].AsString   := cdsPedidocelularContato.AsString;
      sqlSpPedido.Params[10].AsString  := cdsPedidonomeContato.AsString;

      sqlSpPedido.ExecProc;

      cdsPedidoid.AsInteger :=  sqlSpPedido.Params[11].AsInteger;
    end;

    cdsItem.First;
    while not cdsItem.Eof do
    begin

      if cdsItemIND_NOVO.Value then
      begin
        sqlSpItem.Close;
        sqlSpItem.Params[0].AsInteger := cdsItemid.AsInteger;
        sqlSpItem.Params[1].AsInteger := cdsPedidoid.AsInteger;
        sqlSpItem.Params[2].AsInteger := cdsItemIDPRODUTO.AsInteger;
        sqlSpItem.Params[3].AsString  := cdsItemDESCRICAO_PRODUTO.AsString;
        sqlSpItem.Params[4].AsFloat   := cdsItemVALOR_PRODUTO.AsFloat;
        sqlSpItem.Params[5].AsInteger := cdsItemQUANTIDADE.AsInteger;
        sqlSpItem.Params[6].AsString  := cdsItemIND_ITEM_EXTRA.AsString;
        sqlSpItem.Params[7].AsInteger := cdsItemID_KIT.AsInteger;
        sqlSpItem.ExecProc;

        SQLProc.SQL.Text := 'commit retain';
        SQLProc.ExecSQL();
        SQLProc.Close;
      end;

      cdsItem.Next;
    end;

    //FORMA DE PAGAMENTO
    frmFormaPagamento.ShowModal;
    frmFormaPagamento.lbFormaPagto.KeyValue := Null;
    bPedidoExtra := False;
    chkPedidoExtra.Checked := False;

  Except

    on Ex : Exception Do
    begin
      SQLProc.SQL.Text := 'rollback retain';
      SQLProc.ExecSQL();
      SQLProc.SQL.Text := 'commit retain';
      SQLProc.ExecSQL();

      SQLspLog.Close;
      SQLspLog.Params[0].AsString  := 'P' + Ex.Message.Substring(0,3999);
      SQLspLog.ExecProc;

      ShowMessage('Ocorreu um erro ao Salvar. Erro: '+Ex.Message);
    end;

  end;

end;

procedure TfrmPedido.btnIncluirClick(Sender: TObject);
begin

  if not cdsItem.Active then
  begin
    cdsItem.Open;
    cdsItem.Active := True;
  end;

  if cdsProdutoIND_KIT.AsString = 'N' then
  begin

    cdsItem.Append;
    cdsItemid.AsInteger               := idSequencial;
    cdsItemIDPRODUTO.AsInteger        := cdsProdutoID.AsInteger;
    cdsItemDESCRICAO_PRODUTO.AsString := cdsProdutoDESCRICAO_ORIGINAL.AsString;
    cdsItemVALOR_PRODUTO.AsFloat      := cdsProdutoVALOR.AsFloat;
    cdsItemQUANTIDADE.AsFloat         := StrToFloat(edQtde.Text);
    cdsItemIND_NOVO.Value             := True;
    cdsItemID_KIT.AsInteger           := -1;

    if bPedidoExtra then
      cdsItemIND_ITEM_EXTRA.AsString := 'S'
    else cdsItemIND_ITEM_EXTRA.AsString := 'N';

    cdsItem.Post;

    inc(idSequencial,1);
  end
  else
  begin

    cdsKit.First;
    while not cdsKit.Eof  do
    begin
      cdsItem.Append;
      cdsItemid.AsInteger               := idSequencial;
      cdsItemIDPRODUTO.AsInteger        := cdsKitID_PRODUTO.AsInteger;
      cdsItemDESCRICAO_PRODUTO.AsString := cdsKitDESCRICAO.AsString;
      cdsItemVALOR_PRODUTO.AsFloat      := cdsKitVALOR.AsFloat;
      cdsItemQUANTIDADE.AsFloat         := cdsKitQUANTIDADE.AsFloat * StrToFloat(edQtde.Text);
      cdsItemIND_NOVO.Value             := True;
      cdsItemID_KIT.AsInteger           := cdsProdutoID.AsInteger;

      if bPedidoExtra then
        cdsItemIND_ITEM_EXTRA.AsString := 'S'
      else cdsItemIND_ITEM_EXTRA.AsString := 'N';

      cdsItem.Post;

      inc(idSequencial,1);
      cdsKit.Next;
    end;

  end;
  calculaTotal;
end;

procedure TfrmPedido.btnIncluirPedidoClick(Sender: TObject);
begin

  dtVencito.DateTime := Now;
  dtEntrega.DateTime := Now;
  edAnoLetivo.Value  := FormatDateTime('yyyy', Now).ToInteger();

  cdsPedido.Close;
  cdsPedido.CreateDataSet;
  cdsPedido.Open;
  cdsPedido.Append;

  cdsItem.Close;
  cdsItem.CreateDataSet;
  cdsItem.Open;
  cdsItem.Active := True;
  idSequencial   := 1;

  if not cdsProduto.Active then
  begin
    cdsProduto.Active := True;
    cdsProduto.Open;
  end;

  if not ClientDataSetEscola.Active then
  begin
    ClientDataSetEscola.Active := True;
  end;

  ClientDataSetEscola.Close;
  ClientDataSetEscola.Open;

  if not cdsSerie.Active then
  begin
    cdsSerie.Active := True;
    cdsSerie.Open;
  end;

  if not cdsAluno.Active then
  begin
    cdsAluno.Active := True;
    cdsAluno.Open;
  end;

  lblTotalLiquido.Caption := '';
  lblStatus.Font.Color := clBlue;
  habilitaComponentes;
  DBMemo1.Enabled  := True;
  DBGrid1.Enabled  := True;
  DBGrid1.ReadOnly := False;
  lkEscola.SetFocus;

end;

procedure TfrmPedido.btnObservacaoClick(Sender: TObject);
begin
  Panel1.Visible := True;

  if DBMemo1.Enabled then
    DBMemo1.SetFocus;

end;

procedure TfrmPedido.btnPesquisaClick(Sender: TObject);
begin
  frmPesquisaPedido.ShowModal;
end;

procedure TfrmPedido.calculaTotal;
begin
  total_bruto   := 0;
  total_liquido := 0;

  cdsItem.First;
  while not cdsItem.Eof do
  begin
    total_bruto := total_bruto + (cdsItemVALOR_PRODUTO.AsCurrency * cdsItemQUANTIDADE.AsCurrency);
    cdsItem.Next;
  end;

  if cdsPedidodesconto <> nil then
  begin
    total_liquido := total_bruto - ( (total_bruto/100) * cdsPedidodesconto.AsCurrency);
  end;

  lblTotalLiquido.Caption := FormatCurr('R$ ###,###,##0.00', total_liquido);
end;

procedure TfrmPedido.cdsPedidoAfterPost(DataSet: TDataSet);
begin
  if cdsPedidostatus.Value = 'Pendente' then
    lblStatus.Font.Color := clBlue
  else
    lblStatus.Font.Color := clRed;
end;

procedure TfrmPedido.cdsPedidoidEscolaChange(Sender: TField);
begin

  cdsSerie.Active              := False;
  cdsSerie.Params[0].AsInteger := cdsPedidoidEscola.Value;
  cdsSerie.Params[1].AsInteger := edAnoLetivo.Value;
  cdsSerie.Active              := True;

  cdsPedidoidAluno.Clear;

end;

procedure TfrmPedido.cdsPedidoidSerieChange(Sender: TField);
begin
  cdsAluno.Active              := False;
  cdsAluno.Params[0].AsInteger := cdsPedidoidSerie.Value;
  cdsAluno.Active              := True;
end;

procedure TfrmPedido.cdsPedidoNewRecord(DataSet: TDataSet);
begin
  cdsPedidoid.AsInteger    := -1;
  cdsPedidostatus.AsString := 'Pendente';
end;

procedure TfrmPedido.cdsProdutoAfterDelete(DataSet: TDataSet);
begin
  calculaTotal;
end;

procedure TfrmPedido.cdsProdutoAfterScroll(DataSet: TDataSet);
begin
  cdsKit.Close;
  cdsKit.Open;
end;

procedure TfrmPedido.chkPedidoExtraClick(Sender: TObject);
begin

  if (chkPedidoExtra.Checked) then
  begin
    sqlSpValidaTitulo.Close;
    sqlSpValidaTitulo.Params[0].AsInteger := cdsPedidoid.AsInteger;
    sqlSpValidaTitulo.ExecProc;

    if (sqlSpValidaTitulo.Params[1].AsString = 'S') then
    begin
      ShowMessage(PChar('Ttulo est liquidado,#13 no  possvel alterar!'));
      chkPedidoExtra.Checked := False;
      exit;
    end;

  end;

  bPedidoExtra := chkPedidoExtra.Checked;

  if bPedidoExtra then
  begin
    edCodProduto.Enabled := True;
    lkProduto.Enabled    := True;
    edQtde.Enabled       := True;
    btnIncluir.Enabled   := True;
    btnFinalizar.Enabled := True;

    if cdsProduto.IsEmpty then
      cdsProduto.Open;

  end
  else
  begin
    edCodProduto.Enabled := False;
    lkProduto.Enabled    := False;
    edQtde.Enabled       := False;
    btnIncluir.Enabled   := False;
    btnFinalizar.Enabled := False;
  end;

end;

procedure TfrmPedido.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field = cdsItemIND_ITEM_EXTRA then
  begin
    if cdsItemIND_ITEM_EXTRA.AsString = 'S' then
    begin
      DBGrid1.Canvas.Brush.Color := clYellow;
      DBGrid1.Canvas.Font.Color  := clBlack;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, state);
    end;
  end;

end;

procedure TfrmPedido.desabilitaComponentes;
begin
  edAnoLetivo.Enabled      := False;
  lkEscola.Enabled         := False;
  lkSerie.Enabled          := False;
  lkAluno.Enabled          := False;
  edContato.Enabled        := False;
  edCpf.Enabled            := False;
  edCelular.Enabled        := False;
  btnObservacao.Enabled    := False;
  dtVencito.Enabled        := False;
  dtEntrega.Enabled        := False;
  edDesconto.Enabled       := False;
  edCodProduto.Enabled     := False;
  lkProduto.Enabled        := False;
  edQtde.Enabled           := False;
  btnIncluir.Enabled       := False;
  DBGrid1.Enabled          := False;
  panel1.Visible           := False;
  btnFinalizar.Enabled     := False;
  btnIncluir.Enabled       := False;
  DBMemo1.Enabled          := False;
  chkPedidoExtra.Visible   := False;
  btnIncluirPedido.Enabled := True;
  btnPesquisa.Enabled      := True;
end;

procedure TfrmPedido.edAnoLetivoChange(Sender: TObject);
begin
  if cdsPedido.State = dsEdit then
    cdsPedidoanoLetivo.Value := edAnoLetivo.Value;
end;

procedure TfrmPedido.edCelularClick(Sender: TObject);
begin
  edCelular.SelStart := 0;
end;

procedure TfrmPedido.edCodProdutoExit(Sender: TObject);
begin

  if edCodProduto.Text <> EmptyStr then
  begin
     lkProduto.KeyValue := Null;
     cdsProduto.First;
     while not cdsProduto.Eof do
     begin

       if cdsProdutoID.AsString = edCodProduto.Text then
       begin
         lkProduto.KeyValue := cdsProdutoID.AsInteger;
         lkProdutoExit(Sender);
         Break;
       end;

       cdsProduto.Next;
     end;

     if lkProduto.KeyValue = Null then
       ShowMessage(Pchar('Cdigo no encontrado!'));
  end;

end;

procedure TfrmPedido.edCodProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
     key := #0;
end;

procedure TfrmPedido.edCpfClick(Sender: TObject);
begin
  edCpf.SelStart := 0;
end;

procedure TfrmPedido.edDescontoChange(Sender: TObject);
begin
  calculaTotal;
end;

procedure TfrmPedido.edDescontoExit(Sender: TObject);
begin
  calculaTotal;
end;

procedure TfrmPedido.edDescontoKeyPress(Sender: TObject; var Key: Char);
begin
   FormatarComoMoeda( edDesconto, Key );
end;

procedure TfrmPedido.edQtdeClick(Sender: TObject);
begin
  edQtde.SelStart := 0;
end;

procedure TfrmPedido.edQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  FormatarComoMoeda( edQtde, Key );
end;

procedure TfrmPedido.FormatarComoMoeda(Componente: TObject; var Key: Char);
var
   str_valor  : String;
   dbl_valor  : double;
begin

   { verificando se estamos recebendo o TEdit realmente }
   IF Componente is TEdit THEN
   BEGIN
      { se tecla pressionada e' um numero, backspace ou del deixa passar }
      IF ( Key in ['0'..'9', #8, #9] ) THEN
      BEGIN
         { guarda valor do TEdit com que vamos trabalhar }
         str_valor := TEdit( Componente ).Text ;
         { verificando se nao esta vazio }
         IF str_valor = EmptyStr THEN str_valor := '0,00' ;
         { se valor numerico ja insere na string temporaria }
         IF Key in ['0'..'9'] THEN str_valor := Concat( str_valor, Key ) ;
         { retira pontos e virgulas se tiver! }
         str_valor := Trim( StringReplace( str_valor, '.', '', [rfReplaceAll, rfIgnoreCase] ) ) ;
         str_valor := Trim( StringReplace( str_valor, ',', '', [rfReplaceAll, rfIgnoreCase] ) ) ;
         {inserindo 2 casas decimais}
         dbl_valor := StrToFloat( str_valor ) ;
         dbl_valor := ( dbl_valor / 100 ) ;

         {reseta posicao do tedit}
         TEdit( Componente ).SelStart := Length( TEdit( Componente ).Text );
         {retornando valor tratado ao TEdit}
         TEdit( Componente ).Text := FormatFloat( '###,##0.00', dbl_valor ) ;
      END;
      {se nao e' key relevante entao reseta}
      IF NOT( Key in [#8, #9] ) THEN key := #0;
   END;

end;

procedure TfrmPedido.FormCreate(Sender: TObject);
begin
  cdsPedido.CreateDataSet;
  edAnoLetivo.Value  := FormatDateTime('yyyy', Now).ToInteger();
  cdsItem.CreateDataSet;
  dtVencito.DateTime := Now;
  dtEntrega.DateTime := Now;
  desabilitaComponentes;
  bPedidoExtra := False;
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  cdsPedido.Close;
  cdsItem.Close;
  cdsProduto.Close;
  lblTotalLiquido.Caption := '';
end;

procedure TfrmPedido.habilitaComponentes;
begin
  edAnoLetivo.Enabled      := True;
  lkEscola.Enabled         := True;
  lkSerie.Enabled          := True;
  lkAluno.Enabled          := True;
  edContato.Enabled        := True;
  edCpf.Enabled            := True;
  edCelular.Enabled        := True;
  btnObservacao.Enabled    := True;
  dtVencito.Enabled        := True;
  dtEntrega.Enabled        := True;
  edDesconto.Enabled       := True;
  edCodProduto.Enabled     := True;
  lkProduto.Enabled        := True;
  edQtde.Enabled           := True;
  btnIncluir.Enabled       := True;
  DBGrid1.Enabled          := False;
  btnIncluirPedido.Enabled := False;
  btnFinalizar.Enabled     := True;
  btnIncluir.Enabled       := True;
  btnPesquisa.Enabled      := False;
  DBMemo1.Enabled          := False;
  chkPedidoExtra.Visible   := False;
end;

procedure TfrmPedido.habilitaPedidoExtra;
begin

end;

procedure TfrmPedido.lkProdutoExit(Sender: TObject);
begin
  if not cdsProdutoID.IsNull then
    edCodProduto.Text := cdsProdutoID.AsString;

  edQtde.SetFocus;
end;

procedure TfrmPedido.salvarFormaPagamento;
begin
  try
    sqlSpFormaPagto.Close;
    sqlSpFormaPagto.Params[0].AsInteger  := cdsPedidoid.AsInteger;
    sqlSpFormaPagto.Params[1].AsCurrency := total_liquido;
    sqlSpFormaPagto.Params[2].AsInteger  := cdsPedidoformaPagamento.AsInteger;
    sqlSpFormaPagto.ExecProc;

    SQLProc.SQL.Text := 'commit retain';
    SQLProc.ExecSQL();
    SQLProc.Close;

    desabilitaComponentes;
    frmFormaPagamento.Close;
    cdsPedidostatus.AsString := 'Finalizado';
    Application.MessageBox('Salvo com sucesso','Aviso', MB_OK+MB_ICONINFORMATION);
  except
    on Ex : Exception Do
    begin
      SQLProc.SQL.Text := 'rollback retain';
      SQLProc.ExecSQL();
      SQLProc.SQL.Text := 'commit retain';
      SQLProc.ExecSQL();

      SQLspLog.Close;
      SQLspLog.Params[0].AsString  := 'P' + Ex.Message.Substring(0,3999);
      SQLspLog.ExecProc;

      ShowMessage('Ocorreu um erro ao Salvar. Erro: '+Ex.Message);
    end;

  end;
end;

procedure TfrmPedido.setPedidoExtra(Valor: Boolean);
begin
  bPedidoExtra := Valor;
end;

procedure TfrmPedido.setSequencial(Valor: Integer);
begin
  idSequencial := Valor;
end;

end.
