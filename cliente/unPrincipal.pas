unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DBXFirebird, Data.DB,
  Data.SqlExpr, Vcl.Imaging.jpeg, Vcl.ExtCtrls, IniFiles;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Sair1: TMenuItem;
    SQLConnection1: TSQLConnection;
    miEscola: TMenuItem;
    mnImportacao: TMenuItem;
    miImportarCsv: TMenuItem;
    Image1: TImage;
    N1: TMenuItem;
    Pedido1: TMenuItem;
    PedidodeVenda1: TMenuItem;
    Produto1: TMenuItem;
    Financeiro1: TMenuItem;
    Contasareceber1: TMenuItem;
    Devoluo1: TMenuItem;
    Relatrios1: TMenuItem;
    Vendasporperodo1: TMenuItem;
    otalrecebido1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure miEscolaClick(Sender: TObject);
    procedure miImportarCsvClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PedidodeVenda1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure SQLConnection1BeforeConnect(Sender: TObject);
    procedure Contasareceber1Click(Sender: TObject);
    procedure Devoluo1Click(Sender: TObject);
    procedure Vendasporperodo1Click(Sender: TObject);
    procedure otalrecebido1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses unEscola, unImportacao, unPedido, unProduto, unContaReceber, UnDevolucao, unRelVendas, unRelTotalizador;

procedure TfrmPrincipal.Contasareceber1Click(Sender: TObject);
begin
  frmContaRebecer.ShowModal;
end;

procedure TfrmPrincipal.Devoluo1Click(Sender: TObject);
begin
  frmDevolucao.ShowModal;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SQLConnection1.CloseDataSets;
  SQLConnection1.Close;
  Application.MessageBox('Muito obrigado por utilizar o sistema', 'Abraço', MB_OK + MB_ICONINFORMATION);
  Application.Terminate;
end;

procedure TfrmPrincipal.miEscolaClick(Sender: TObject);
begin
  frmEscola.ShowModal;
end;

procedure TfrmPrincipal.miImportarCsvClick(Sender: TObject);
begin
  frmImportacao.ShowModal;
end;

procedure TfrmPrincipal.otalrecebido1Click(Sender: TObject);
begin
  frmTotalizador.ShowModal;
end;

procedure TfrmPrincipal.PedidodeVenda1Click(Sender: TObject);
begin
  frmPedido.ShowModal;
end;

procedure TfrmPrincipal.Produto1Click(Sender: TObject);
begin
  frmProduto.ShowModal;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  SQLConnection1.CloseDataSets;
  SQLConnection1.Close;
  Application.MessageBox('Muito obrigado por utilizar o sistema', 'Abraço', MB_OK + MB_ICONINFORMATION);
  Application.Terminate;
end;

procedure TfrmPrincipal.SQLConnection1BeforeConnect(Sender: TObject);
var ini :TIniFile;
begin
  try
    ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
    SQLConnection1.Connected := False;
    SQLConnection1.LoginPrompt := False;
    SQLConnection1.Params.Add('Database=' + ini.ReadString('Acesso','DBPATH','c:\NOVO.fdb'));
  except
    on E: Exception do
      MessageDlg('Erro ao conectar! '#13' Erro: '+E.Message, mtError, [mbOK],0);
  end;
end;

procedure TfrmPrincipal.Vendasporperodo1Click(Sender: TObject);
begin
  frmRelVenda.Show;
end;

end.
