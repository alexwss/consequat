program drpFinFoto;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unEscola in 'unEscola.pas' {frmEscola},
  unPesquisaEscola in 'unPesquisaEscola.pas' {frmLocalizarEscola},
  unImportacao in 'unImportacao.pas' {frmImportacao},
  unTurma in 'unTurma.pas',
  Vcl.Themes,
  Vcl.Styles,
  unAluno in 'unAluno.pas',
  unPedido in 'unPedido.pas' {frmPedido},
  frmpesquisaGeral in 'frmpesquisaGeral.pas' {frmpesqGeral},
  unProduto in 'unProduto.pas' {frmProduto},
  unPesquisaProduto in 'unPesquisaProduto.pas' {frmPesquisaProduto},
  unPesquisaPedido in 'unPesquisaPedido.pas' {frmPesquisaPedido},
  unFormaPagamento in 'unFormaPagamento.pas' {frmFormaPagamento},
  unContaReceber in 'unContaReceber.pas' {frmContaRebecer},
  unBaixaTitulo in 'unBaixaTitulo.pas' {frmBaixaTitulo},
  unDevolucao in 'unDevolucao.pas' {frmDevolucao},
  unRelVendas in 'unRelVendas.pas' {frmRelVenda},
  unRelTotalizador in 'unRelTotalizador.pas' {frmTotalizador};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Consequat - Financeiro';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmEscola, frmEscola);
  Application.CreateForm(TfrmLocalizarEscola, frmLocalizarEscola);
  Application.CreateForm(TfrmImportacao, frmImportacao);
  Application.CreateForm(TfrmPedido, frmPedido);
  Application.CreateForm(TfrmpesqGeral, frmpesqGeral);
  Application.CreateForm(TfrmProduto, frmProduto);
  Application.CreateForm(TfrmPesquisaProduto, frmPesquisaProduto);
  Application.CreateForm(TfrmPesquisaPedido, frmPesquisaPedido);
  Application.CreateForm(TfrmFormaPagamento, frmFormaPagamento);
  Application.CreateForm(TfrmContaRebecer, frmContaRebecer);
  Application.CreateForm(TfrmBaixaTitulo, frmBaixaTitulo);
  Application.CreateForm(TfrmDevolucao, frmDevolucao);
  Application.CreateForm(TfrmRelVenda, frmRelVenda);
  Application.CreateForm(TfrmTotalizador, frmTotalizador);
  Application.Run;
end.
