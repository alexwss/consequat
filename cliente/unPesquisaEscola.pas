unit unPesquisaEscola;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, DB;

type
  TfrmLocalizarEscola = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    btnLocalizar: TButton;
    DBGrid1: TDBGrid;
    btnSelecionar: TButton;
    btnCancelar: TButton;
    StatusBar1: TStatusBar;
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalizarEscola: TfrmLocalizarEscola;

implementation

{$R *.dfm}

uses unPrincipal, unEscola;

procedure TfrmLocalizarEscola.btnCancelarClick(Sender: TObject);
begin
  frmLocalizarEscola.Close;
end;

procedure TfrmLocalizarEscola.btnLocalizarClick(Sender: TObject);
begin
  frmEscola.ClientDataSet1.Close;
  frmEscola.ClientDataSet1.Params[0].AsString := '%' + Edit1.Text + '%';
  frmEscola.ClientDataSet1.Open;

  btnSelecionar.Enabled := not frmEscola.ClientDataSet1.IsEmpty;

  if frmEscola.ClientDataSet1.IsEmpty then
    StatusBar1.SimpleText := Format('Nenhum registro foi encontrado' + 'com "%s"', [Edit1.Text])
  else
    StatusBar1.SimpleText := Format('%d registros encontrados com' + '"%s"',[frmEscola.ClientDataSet1.RecordCount, Edit1.Text]);
  //
end;

procedure TfrmLocalizarEscola.btnSelecionarClick(Sender: TObject);
begin
  frmEscola.DBEdit2.SetFocus;
  Close;
end;

procedure TfrmLocalizarEscola.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
    btnLocalizar.Enabled := True
  else
    btnLocalizar.Enabled := False;
  //
end;

procedure TfrmLocalizarEscola.Edit1Enter(Sender: TObject);
begin
  btnLocalizar.Click;
end;

end.
