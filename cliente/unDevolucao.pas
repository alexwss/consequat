unit unDevolucao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.FMTBcd, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  Data.SqlExpr;

type
  TfrmDevolucao = class(TForm)
    pnTopo: TPanel;
    Label1: TLabel;
    edPedido: TEdit;
    Label2: TLabel;
    btnPesquisaPedido: TButton;
    pnControles: TPanel;
    btnCancelar: TButton;
    btnFinalizar: TButton;
    pnCentral: TPanel;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    edAluno: TDBText;
    Label4: TLabel;
    edEscola: TDBText;
    Label5: TLabel;
    edSerie: TDBText;
    Label6: TLabel;
    edValor: TDBText;
    Label7: TLabel;
    sqlPedido: TSQLQuery;
    dspPedido: TDataSetProvider;
    cdsPedido: TClientDataSet;
    dsPedido: TDataSource;
    sqlSpVerificaTitulo: TSQLStoredProc;
    dbEditValor: TDBEdit;
    cdsPedidoID: TIntegerField;
    cdsPedidoID_PEDIDO: TIntegerField;
    cdsPedidoNOME: TStringField;
    cdsPedidoVALOR: TSingleField;
    cdsPedidoVALOR_DEVOLUCAO: TSingleField;
    cdsPedidoSERIE: TStringField;
    cdsPedidoNOME_ESCOLA: TStringField;
    cdsPedidoOBSERVACAO: TStringField;
    sqlSpValidaPedido: TSQLStoredProc;
    sqlSpTitulo: TSQLStoredProc;
    procedure btnPesquisaPedidoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure edPedidoExit(Sender: TObject);
    procedure edPedidoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure pHabilitaFim();
  public
    { Public declarations }
  end;

var
  frmDevolucao: TfrmDevolucao;

implementation

{$R *.dfm}

procedure TfrmDevolucao.btnCancelarClick(Sender: TObject);
begin
  edPedido.Text := EmptyStr;
  cdsPedido.Close;
  frmDevolucao.Close;
end;

procedure TfrmDevolucao.btnFinalizarClick(Sender: TObject);
begin

  if (cdsPedido.RecordCount > 0) then
  begin

    if cdsPedidoVALOR_DEVOLUCAO.IsNull then
    begin
      ShowMessage(Pchar('Preenchar o Valor da Devolução!'));
      dbEditValor.SetFocus;
      exit;
    end
    else if cdsPedidoVALOR_DEVOLUCAO.AsInteger > cdsPedidoVALOR.AsInteger then
    begin
      ShowMessage(Pchar('O Valor do Pedido deve ser Menor que o Título'));
      dbEditValor.SetFocus;
      exit;
    end
    else if cdsPedidoVALOR_DEVOLUCAO.AsInteger < 0 then
    begin
      ShowMessage(Pchar('O Valor do Pedido não pode ser Negativo'));
      dbEditValor.SetFocus;
      exit;
    end;

    try
      sqlSpTitulo.Close;
      sqlSpTitulo.Params[0].AsInteger  := cdsPedidoID_PEDIDO.AsInteger;
      sqlSpTitulo.Params[1].AsString   := 'DEVOLVIDO';
      sqlSpTitulo.Params[2].AsCurrency := cdsPedidoVALOR_DEVOLUCAO.AsCurrency;
      sqlSpTitulo.Params[3].AsString   := cdsPedidoOBSERVACAO.AsString;
      sqlSpTitulo.ExecProc;

      Application.MessageBox('Salvo com Sucesso!','Aviso',MB_ICONINFORMATION+MB_OK);
      btnFinalizar.Enabled := False;
      cdsPedido.Close;
      edPedido.Text := EmptyStr;
      edPedido.SetFocus;
    Except

      on Ex : Exception Do
      begin
        ShowMessage('Ocorreu um erro ao Salvar. Erro: '+Ex.Message);
      end;

    end;

  end;

end;

procedure TfrmDevolucao.btnPesquisaPedidoClick(Sender: TObject);
begin
  if edPedido.Text = EmptyStr then
  begin
    ShowMessage(Pchar('Preenchar o Nr. do Pedido para Pesquisar!'));
    edPedido.SetFocus;
    exit;
  end;

  sqlSpVerificaTitulo.Close;
  sqlSpVerificaTitulo.Params[0].AsInteger   := StrToInt(edPedido.Text);
  sqlSpVerificaTitulo.ExecProc;

  if sqlSpVerificaTitulo.Params[1].AsString = 'N' then
  begin
    ShowMessage(Pchar('O Nr. do Pedido é inválido!'));
    edPedido.SetFocus;
    exit;
  end;

  sqlSpValidaPedido.Close;
  sqlSpValidaPedido.Params[0].AsInteger := StrToInt(edPedido.Text);
  sqlSpValidaPedido.ExecProc;

  if sqlSpValidaPedido.Params[1].AsString = 'N' then
  begin
    ShowMessage('O título deve estar liquidado para realizar a devolução!');
    edPedido.SetFocus;
    exit;
  end;

  if sqlSpValidaPedido.Params[2].AsString = 'S' then
  begin
    ShowMessage('Já existe Devolução para este Pedido!');
    edPedido.SetFocus;
    exit;
  end;

  cdsPedido.Close;
  cdsPedido.Params[0].AsInteger := StrToInt(edPedido.Text);
  cdsPedido.Open;

end;

procedure TfrmDevolucao.edPedidoExit(Sender: TObject);
begin
  pHabilitaFim;
end;

procedure TfrmDevolucao.edPedidoKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
     key := #0;
end;

procedure TfrmDevolucao.pHabilitaFim;
begin
  if not (cdsPedidoVALOR.IsNull) and not (cdsPedidoOBSERVACAO.IsNull) then
    btnFinalizar.Enabled := True;
end;

end.
