unit unProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.FMTBcd, Data.SqlExpr, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, System.Generics.Collections;

type
  TfrmProduto = class(TForm)
    Label1: TLabel;
    Label9: TLabel;
    edCod: TDBEdit;
    Label2: TLabel;
    edDescricao: TDBEdit;
    Button3: TButton;
    edValor: TDBEdit;
    Label3: TLabel;
    edObservacao: TDBMemo;
    Label8: TLabel;
    btnIncluir: TButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    DataSourceProduto: TDataSource;
    ClientDataSetProduto: TClientDataSet;
    DataSetProviderProduto: TDataSetProvider;
    SQLDataSetProduto: TSQLDataSet;
    ClientDataSetProdutoID: TIntegerField;
    ClientDataSetProdutoDESCRICAO: TStringField;
    ClientDataSetProdutoVALOR: TFMTBCDField;
    ClientDataSetProdutoOBSERVACAO: TStringField;
    ClientDataSetProdutoIND_DESATIVADO: TStringField;
    sqlSequence: TSQLQuery;
    sqlSequenceID: TLargeintField;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    SQLDataSetProdutoID: TIntegerField;
    SQLDataSetProdutoDESCRICAO: TStringField;
    SQLDataSetProdutoVALOR: TFMTBCDField;
    SQLDataSetProdutoOBSERVACAO: TStringField;
    SQLDataSetProdutoIND_DESATIVADO: TStringField;
    SQLDataSetProdutoIND_KIT: TStringField;
    ClientDataSetProdutoIND_KIT: TStringField;
    pnlKit: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    btnIncluirItem: TButton;
    edQtde: TEdit;
    lkProduto: TDBLookupComboBox;
    edCodProduto: TEdit;
    lblCodProd: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dsProduto: TDataSource;
    cdsProduto: TClientDataSet;
    cdsProdutoID: TIntegerField;
    cdsProdutoDESCRICAO: TStringField;
    cdsProdutoVALOR: TFMTBCDField;
    cdsProdutoDESCRICAO_ORIGINAL: TStringField;
    dspProduto: TDataSetProvider;
    sqlProduto: TSQLQuery;
    btnKit: TButton;
    dsKit: TDataSource;
    cdsKit: TClientDataSet;
    dspKit: TDataSetProvider;
    sqlKit: TSQLDataSet;
    sqlKitID: TIntegerField;
    sqlKitID_PROD_KIT: TIntegerField;
    sqlKitID_PRODUTO: TIntegerField;
    sqlKitDESCRICAO: TStringField;
    sqlKitQUANTIDADE: TIntegerField;
    cdsKitID: TIntegerField;
    cdsKitID_PROD_KIT: TIntegerField;
    cdsKitID_PRODUTO: TIntegerField;
    cdsKitDESCRICAO: TStringField;
    cdsKitQUANTIDADE: TIntegerField;
    btnConcluiKit: TButton;
    cdsKitIND_ALTERACAO: TStringField;
    sqlProdutoID: TIntegerField;
    sqlProdutoDESCRICAO: TStringField;
    sqlProdutoVALOR: TFMTBCDField;
    sqlProdutoDESCRICAO_ORIGINAL: TStringField;
    sqlKitIND_ALTERACAO: TStringField;
    spKit: TSQLStoredProc;
    procedure ClientDataSetProdutoNewRecord(DataSet: TDataSet);
    procedure FormatarComoMoeda(Componente: TObject; var Key: Char);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure edCodProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edCodProdutoExit(Sender: TObject);
    procedure lkProdutoExit(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure btnIncluirItemClick(Sender: TObject);
    procedure cdsKitBeforeEdit(DataSet: TDataSet);
    procedure btnKitClick(Sender: TObject);
    procedure btnConcluiKitClick(Sender: TObject);
    procedure DBCheckBox2Exit(Sender: TObject);
    procedure cdsKitBeforeDelete(DataSet: TDataSet);
    procedure ClientDataSetProdutoAfterPost(DataSet: TDataSet);
    procedure ClientDataSetProdutoBeforeDelete(DataSet: TDataSet);
    procedure ClientDataSetProdutoBeforeOpen(DataSet: TDataSet);
    procedure ClientDataSetProdutoAfterScroll(DataSet: TDataSet);
    procedure afterScrollPersonalizado();
    procedure zeraIdSequencial();
    procedure DBGrid1ColExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      idSequencial: Integer;
  end;

var
  frmProduto: TfrmProduto;

  listaDeleteKit: TList<Integer>;
  listaDeleteKitProd: TList<Integer>;

implementation

{$R *.dfm}

uses unPesquisaProduto;

procedure TfrmProduto.afterScrollPersonalizado;
var
  I: Integer;
begin
  //implementar codigo here
  if cdsKit.RecordCount > 0 then
  begin
    //implementar aqui
    cdsKit.First;
    while not (cdsKit.Eof) do
    begin

      if cdsKitIND_ALTERACAO.AsString <> 'N' then
      begin
        spKit.Close;
        spKit.Params[0].AsInteger := cdsKitID.AsInteger;
        spKit.Params[1].AsInteger := ClientDataSetProdutoID.AsInteger;
        spKit.Params[2].AsInteger := cdsKitID_PRODUTO.AsInteger;
        spKit.Params[3].AsString  := cdsKitDESCRICAO.AsString;
        spKit.Params[4].AsInteger := cdsKitQUANTIDADE.AsInteger;
        spKit.Params[5].AsString  := cdsKitIND_ALTERACAO.AsString;
        spKit.ExecProc;
      end;

      cdsKit.Next;
    end;

    for I := 0 to listaDeleteKit.Count-1 do
    begin

        spKit.Close;
        spKit.Params[0].AsInteger := listaDeleteKit[I];
        spKit.Params[1].AsInteger := ClientDataSetProdutoID.AsInteger;
        spKit.Params[2].AsInteger := listaDeleteKitProd[I];
        spKit.Params[3].AsString  := '';
        spKit.Params[4].AsInteger := 0;
        spKit.Params[5].AsString  := 'D';
        spKit.ExecProc;

    end;

    frmPesquisaProduto.cdsKit.Close;
    frmPesquisaProduto.cdsKit.Open;
  end;
end;

procedure TfrmProduto.btnCancelarClick(Sender: TObject);
begin
  pnlKit.Visible := False;
  ClientDataSetProduto.Close;
end;

procedure TfrmProduto.btnConcluiKitClick(Sender: TObject);
begin
  pnlKit.Visible := False;
end;

procedure TfrmProduto.btnIncluirClick(Sender: TObject);
var bEdicao : Boolean;
begin
  bEdicao := False;

  if DataSourceProduto.State = dsEdit then
  begin

    if Application.MessageBox('O cadastro está em edição, deseja realmente inserir um novo registro?','Aviso',MB_YESNO + MB_ICONQUESTION) = ID_YES then
      bEdicao := True;

  end;

  if not bEdicao then
  begin
    ClientDataSetProduto.Close;
    ClientDataSetProduto.Open;
    ClientDataSetProduto.Append;
    idSequencial := 1;
  end;

end;

procedure TfrmProduto.btnIncluirItemClick(Sender: TObject);
var idMax: Integer;
begin

  idMax := -1;

  if lkProduto.KeyValue = null then
  begin
    ShowMessage(PChar('Selecione um item antes de inserir o produto.'));
    exit;
  end;

  if lkProduto.KeyValue = ClientDataSetProdutoID.AsInteger then
  begin
    ShowMessage(PChar('Não é possível inserir o mesmo produto como item do KIT.'));
    exit;
  end;

  if not cdsKit.Active then
  begin
    cdsKit.Open;
    cdsKit.Active := True;
  end;

  cdsKit.First;
  while not (cdsKit.Eof) do
  begin

    if cdsKitID_PRODUTO.AsInteger = lkProduto.KeyValue then
    begin
      ShowMessage(Pchar('Produto já cadastrado!'));
      exit;
    end;

    if (idSequencial = 0) and (cdsKit.RecordCount > 0) then
    begin
      if idMax <  cdsKitID.AsInteger then
        idMax := cdsKitID.AsInteger + 1;
    end;

    cdsKit.Next;
  end;

  if (idMax > -1) then
    idSequencial := idMax + 1;

  cdsKit.Append;
  cdsKitID.AsInteger           := idSequencial;
  cdsKitID_PROD_KIT.AsInteger  := ClientDataSetProdutoID.AsInteger;
  cdsKitID_PRODUTO.AsInteger   := lkProduto.KeyValue;
  cdsKitDESCRICAO.AsString     := cdsProdutoDESCRICAO_ORIGINAL.AsString;
  cdsKitQUANTIDADE.AsInteger   := StrToInt(edQtde.Text);
  cdsKitIND_ALTERACAO.AsString := 'I';
  cdsKit.post;

  inc(idSequencial,1);
end;

procedure TfrmProduto.btnKitClick(Sender: TObject);
begin
  cdsProduto.Close;
  cdsProduto.Open;

  pnlKit.Visible := True;
end;

procedure TfrmProduto.btnSalvarClick(Sender: TObject);
begin

  if dsProduto.State = dsInactive  then
  begin
    pnlKit.Visible := False;
    exit;
  end;

  if DataSourceProduto.DataSet.State in [dsEdit, dsInsert] then
  begin

    if ClientDataSetProdutoID.AsInteger = -1 then
    begin
      sqlSequence.Close;
      sqlSequence.Open;
      ClientDataSetProdutoID.AsInteger := sqlSequenceID.AsInteger;
    end;

    //grava em cache
    ClientDataSetProduto.Post;
    //grava no bd
    ClientDataSetProduto.ApplyUpdates(-1);
    //ClientDataSet1 a conexão com a tabela.
    ClientDataSetProduto.Close;
    Application.MessageBox('Salvo com sucesso','Aviso', MB_OK+MB_ICONINFORMATION);
    pnlKit.Visible := False;
  end
  else if (DataSourceProduto.DataSet.State = dsBrowse) and
           (dsKit.DataSet.RecordCount > 0) then
  begin
    afterScrollPersonalizado;
    ClientDataSetProduto.Close;
    pnlKit.Visible := False;
  end
  else if (DataSourceProduto.DataSet.State = dsBrowse) then
    ClientDataSetProduto.Close
  else
    ShowMessage('Atenção, Por favor executar uma operação');
end;

procedure TfrmProduto.Button3Click(Sender: TObject);
begin
  pnlKit.Visible := False;
  frmPesquisaProduto.ShowModal;
end;

procedure TfrmProduto.cdsKitBeforeDelete(DataSet: TDataSet);
begin
  if (cdsKitIND_ALTERACAO.AsString <> 'I') and (cdsProdutoID.AsInteger <> -1)  then
  begin
    listaDeleteKit.Add(cdsKitID.AsInteger);
    listaDeleteKitProd.Add(cdsKitID_PROD_KIT.AsInteger);
  end;
end;

procedure TfrmProduto.cdsKitBeforeEdit(DataSet: TDataSet);
begin
  if cdsKitIND_ALTERACAO.AsString = 'N' then
    cdsKitIND_ALTERACAO.AsString := 'U';
end;

procedure TfrmProduto.ClientDataSetProdutoAfterPost(DataSet: TDataSet);
begin
  afterScrollPersonalizado;
end;

procedure TfrmProduto.ClientDataSetProdutoAfterScroll(DataSet: TDataSet);
begin
  listaDeleteKit     := TList<Integer>.Create();
  listaDeleteKitProd := TList<Integer>.Create();
  cdsKit.Close;
  cdsKit.Open;
end;

procedure TfrmProduto.ClientDataSetProdutoBeforeDelete(DataSet: TDataSet);
begin

  if ClientDataSetProdutoID.AsInteger <> -1 then
  begin
    spKit.Close;
    spKit.Params[0].AsInteger := -1;
    spKit.Params[1].AsInteger := cdsKitID_PROD_KIT.AsInteger;
    spKit.Params[2].AsInteger := ClientDataSetProdutoID.AsInteger;
    spKit.Params[3].AsString  := '';
    spKit.Params[4].AsInteger := 0;
    spKit.Params[5].AsString  := 'D';
    spKit.ExecProc;
  end;

end;

procedure TfrmProduto.ClientDataSetProdutoBeforeOpen(DataSet: TDataSet);
begin
  listaDeleteKit     := TList<Integer>.Create();
  listaDeleteKitProd := TList<Integer>.Create();
end;

procedure TfrmProduto.ClientDataSetProdutoNewRecord(DataSet: TDataSet);
begin
  listaDeleteKit     := TList<Integer>.Create();
  listaDeleteKitProd := TList<Integer>.Create();
  ClientDataSetProdutoID.Value := -1;
  ClientDataSetProdutoIND_DESATIVADO.Value := 'N';
end;

procedure TfrmProduto.DBCheckBox2Click(Sender: TObject);
begin
  if DBCheckBox2.Checked then
  begin
    btnKit.Enabled := True;

    if not cdsProduto.Active then
    begin
      cdsProduto.Active := True;
      cdsProduto.Open;
    end;

  end
  else  btnKit.Enabled := False;

end;

procedure TfrmProduto.DBCheckBox2Exit(Sender: TObject);
begin
  if DBCheckBox2.Checked then
    btnKit.Enabled := True
  else btnKit.Enabled := False;
end;

procedure TfrmProduto.DBGrid1ColExit(Sender: TObject);
begin
  if cdsKit.State = dsEdit then
    cdsKit.Post;
end;

procedure TfrmProduto.edCodProdutoExit(Sender: TObject);
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
       ShowMessage(Pchar('Código não encontrado!'));
  end;
end;

procedure TfrmProduto.edCodProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
     key := #0;
end;

procedure TfrmProduto.edValorKeyPress(Sender: TObject; var Key: Char);
begin
  FormatarComoMoeda( edValor, Key );
end;

procedure TfrmProduto.FormatarComoMoeda(Componente: TObject; var Key: Char);
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

procedure TfrmProduto.lkProdutoExit(Sender: TObject);
begin
  if not cdsProdutoID.IsNull then
    edCodProduto.Text := cdsProdutoID.AsString;

  edQtde.SetFocus;
end;

procedure TfrmProduto.zeraIdSequencial;
begin
  idSequencial := 0;
end;

end.
