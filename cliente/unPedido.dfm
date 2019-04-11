object frmPedido: TfrmPedido
  Left = 293
  Top = 0
  ActiveControl = btnPesquisa
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pedido de Venda'
  ClientHeight = 604
  ClientWidth = 744
  Color = clHighlightText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitulo: TLabel
    Left = 208
    Top = 16
    Width = 280
    Height = 40
    Caption = 'PEDIDO DE VENDA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object dbNrPedido: TDBText
    Left = 494
    Top = 30
    Width = 80
    Height = 15
    DataField = 'id'
    DataSource = dsPedido
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblNome: TLabel
    Tag = 78
    Left = 15
    Top = 78
    Width = 30
    Height = 13
    Caption = 'Escola'
  end
  object lblSerie: TLabel
    Tag = 78
    Left = 415
    Top = 77
    Width = 24
    Height = 13
    Caption = 'S'#233'rie'
  end
  object lblAluno: TLabel
    Left = 12
    Top = 123
    Width = 27
    Height = 13
    Caption = 'Aluno'
  end
  object Label4: TLabel
    Left = 415
    Top = 123
    Width = 69
    Height = 13
    Caption = 'Nome Contato'
  end
  object Label5: TLabel
    Left = 15
    Top = 169
    Width = 61
    Height = 13
    Caption = 'CPF Contato'
  end
  object lblCodProd: TLabel
    Left = 15
    Top = 261
    Width = 52
    Height = 13
    Caption = 'C'#243'd. Prod.'
  end
  object Label8: TLabel
    Left = 252
    Top = 169
    Width = 79
    Height = 13
    Caption = 'Celular/Telefone'
  end
  object Label9: TLabel
    Left = 252
    Top = 215
    Width = 64
    Height = 13
    Caption = 'Data Entrega'
  end
  object Label10: TLabel
    Left = 614
    Top = 215
    Width = 87
    Height = 13
    Caption = '% Desconto Geral'
  end
  object lblDescricaoProd: TLabel
    Left = 102
    Top = 261
    Width = 87
    Height = 13
    Caption = 'Descri'#231#227'o Produto'
  end
  object lblQtde: TLabel
    Left = 556
    Top = 261
    Width = 24
    Height = 13
    Caption = 'Qtde'
  end
  object lblDtVencto: TLabel
    Left = 15
    Top = 215
    Width = 81
    Height = 13
    Caption = 'Data Vencimento'
  end
  object Label3: TLabel
    Left = 15
    Top = 34
    Width = 51
    Height = 13
    Caption = 'Ano Letivo'
  end
  object lblStatus: TDBText
    Left = 446
    Top = 233
    Width = 158
    Height = 18
    Alignment = taCenter
    DataField = 'status'
    DataSource = dsPedido
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTotalLiquido: TLabel
    Left = 136
    Top = 569
    Width = 6
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = 25
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnPesquisa: TButton
    Left = 626
    Top = 25
    Width = 103
    Height = 25
    Caption = 'Pesquisar Pedidos'
    TabOrder = 1
    OnClick = btnPesquisaClick
  end
  object lkEscola: TDBLookupComboBox
    Left = 10
    Top = 96
    Width = 392
    Height = 21
    DataField = 'nomeEscola'
    DataSource = dsPedido
    TabOrder = 3
  end
  object lkSerie: TDBLookupComboBox
    Left = 413
    Top = 96
    Width = 316
    Height = 21
    DataField = 'idSerie'
    DataSource = dsPedido
    KeyField = 'ID'
    ListField = 'SERIE'
    ListSource = dsSerie
    TabOrder = 4
  end
  object lkAluno: TDBLookupComboBox
    Left = 10
    Top = 141
    Width = 392
    Height = 21
    DataField = 'idAluno'
    DataSource = dsPedido
    KeyField = 'ID'
    ListField = 'NOME;RA'
    ListSource = dsAluno
    TabOrder = 5
  end
  object edContato: TDBEdit
    Left = 413
    Top = 141
    Width = 316
    Height = 21
    DataField = 'nomeContato'
    DataSource = dsPedido
    TabOrder = 6
  end
  object dtVencito: TDateTimePicker
    Left = 10
    Top = 233
    Width = 190
    Height = 21
    Date = 43355.850691701390000000
    Time = 43355.850691701390000000
    TabOrder = 10
  end
  object dtEntrega: TDateTimePicker
    Left = 250
    Top = 233
    Width = 190
    Height = 21
    Date = 43355.850691701390000000
    Time = 43355.850691701390000000
    TabOrder = 11
  end
  object lkProduto: TDBLookupComboBox
    Left = 100
    Top = 279
    Width = 437
    Height = 21
    KeyField = 'ID'
    ListField = 'DESCRICAO;VALOR'
    ListSource = dsProduto
    TabOrder = 14
    OnExit = lkProdutoExit
  end
  object btnIncluir: TButton
    Left = 632
    Top = 277
    Width = 103
    Height = 23
    Caption = 'Incluir Produto'
    TabOrder = 16
    OnClick = btnIncluirClick
  end
  object edCpf: TDBEdit
    Left = 10
    Top = 187
    Width = 213
    Height = 21
    AutoSelect = False
    DataField = 'cpfContato'
    DataSource = dsPedido
    TabOrder = 7
    OnClick = edCpfClick
  end
  object edCelular: TDBEdit
    Left = 250
    Top = 187
    Width = 213
    Height = 21
    DataField = 'celularContato'
    DataSource = dsPedido
    TabOrder = 8
    OnClick = edCelularClick
  end
  object btnObservacao: TButton
    Left = 480
    Top = 185
    Width = 103
    Height = 25
    Caption = 'Observa'#231#245'es'
    TabOrder = 9
    OnClick = btnObservacaoClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 314
    Width = 725
    Height = 249
    Hint = 
      'Para Excluir um item Clique Sobre ele e pressione (Ctrl + Shit +' +
      ' Delete).'
    DataSource = dsItem
    TabOrder = 20
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        ReadOnly = True
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDPRODUTO'
        ReadOnly = True
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO_PRODUTO'
        Width = 408
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'VALOR_PRODUTO'
        ReadOnly = True
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        ReadOnly = True
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_ITEM_EXTRA'
        ReadOnly = True
        Title.Caption = 'Extra'
        Visible = True
      end>
  end
  object btnFinalizar: TButton
    Left = 632
    Top = 569
    Width = 103
    Height = 25
    Caption = 'Finalizar'
    TabOrder = 17
    OnClick = btnFinalizarClick
  end
  object btnCancelar: TButton
    Left = 501
    Top = 569
    Width = 103
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 18
    OnClick = btnCancelarClick
  end
  object edCodProduto: TEdit
    Left = 15
    Top = 279
    Width = 72
    Height = 21
    TabOrder = 13
    OnExit = edCodProdutoExit
    OnKeyPress = edCodProdutoKeyPress
  end
  object btnIncluirPedido: TButton
    Left = 10
    Top = 569
    Width = 103
    Height = 25
    Caption = 'Incluir'
    TabOrder = 19
    OnClick = btnIncluirPedidoClick
  end
  object edAnoLetivo: TSpinEdit
    Left = 12
    Top = 50
    Width = 89
    Height = 22
    MaxValue = 2100
    MinValue = 1900
    TabOrder = 2
    Value = 1990
    OnChange = edAnoLetivoChange
  end
  object edDesconto: TDBEdit
    Left = 609
    Top = 234
    Width = 120
    Height = 21
    DataField = 'desconto'
    DataSource = dsPedido
    TabOrder = 12
    OnChange = edDescontoChange
    OnExit = edDescontoExit
  end
  object Panel1: TPanel
    Left = 32
    Top = 148
    Width = 687
    Height = 126
    Caption = 'Panel1'
    TabOrder = 21
    Visible = False
    object DBMemo1: TDBMemo
      Left = 1
      Top = 1
      Width = 685
      Height = 99
      Align = alClient
      Color = 11073533
      DataField = 'observacao'
      DataSource = dsPedido
      MaxLength = 500
      TabOrder = 0
    end
    object btnConcluir: TButton
      Left = 1
      Top = 100
      Width = 685
      Height = 25
      Align = alBottom
      Caption = 'Concluir'
      TabOrder = 1
      OnClick = btnConcluirClick
    end
  end
  object edQtde: TEdit
    Left = 548
    Top = 279
    Width = 72
    Height = 21
    TabOrder = 15
    OnKeyPress = edCodProdutoKeyPress
  end
  object chkPedidoExtra: TCheckBox
    Left = 629
    Top = 66
    Width = 97
    Height = 17
    Caption = 'Pedido Extra'
    TabOrder = 0
    Visible = False
    OnClick = chkPedidoExtraClick
  end
  object cdsItem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 224
    object cdsItemIDPRODUTO: TIntegerField
      DisplayLabel = 'C'#243'digo do Produto'
      FieldName = 'IDPRODUTO'
    end
    object cdsItemDESCRICAO_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 80
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 200
    end
    object cdsItemQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
    end
    object cdsItemVALOR_PRODUTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_PRODUTO'
      currency = True
    end
    object cdsItemid: TIntegerField
      DisplayLabel = 'Nr.'
      FieldName = 'id'
    end
    object cdsItemIND_ITEM_EXTRA: TStringField
      FieldName = 'IND_ITEM_EXTRA'
      Size = 1
    end
    object cdsItemIND_NOVO: TBooleanField
      FieldName = 'IND_NOVO'
    end
    object cdsItemID_KIT: TIntegerField
      FieldName = 'ID_KIT'
    end
  end
  object dsItem: TDataSource
    DataSet = cdsItem
    Left = 496
    Top = 224
  end
  object cdsPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = cdsPedidoAfterPost
    OnNewRecord = cdsPedidoNewRecord
    Left = 272
    object cdsPedidoid: TIntegerField
      FieldName = 'id'
    end
    object cdsPedidoidEscola: TIntegerField
      FieldName = 'idEscola'
      OnChange = cdsPedidoidEscolaChange
    end
    object cdsPedidonomeEscola: TStringField
      FieldKind = fkLookup
      FieldName = 'nomeEscola'
      LookupDataSet = ClientDataSetEscola
      LookupKeyFields = 'ID'
      LookupResultField = 'NOME_ESCOLA'
      KeyFields = 'idEscola'
      Size = 200
      Lookup = True
    end
    object cdsPedidoanoLetivo: TIntegerField
      FieldName = 'anoLetivo'
    end
    object cdsPedidoidSerie: TIntegerField
      FieldName = 'idSerie'
      OnChange = cdsPedidoidSerieChange
    end
    object cdsPedidoidAluno: TIntegerField
      FieldName = 'idAluno'
    end
    object cdsPedidodesconto: TCurrencyField
      FieldName = 'desconto'
      currency = False
      MaxValue = 100.000000000000000000
    end
    object cdsPedidoobservacao: TStringField
      FieldName = 'observacao'
      Size = 500
    end
    object cdsPedidodataPedido: TDateField
      FieldName = 'dataPedido'
    end
    object cdsPedidodataEntrega: TDateField
      FieldName = 'dataEntrega'
    end
    object cdsPedidodataVencimento: TDateField
      FieldName = 'dataVencimento'
    end
    object cdsPedidonomeContato: TStringField
      FieldName = 'nomeContato'
      Size = 100
    end
    object cdsPedidocpfContato: TStringField
      FieldName = 'cpfContato'
      EditMask = '999.999.999-99;0;_'
      FixedChar = True
      Size = 11
    end
    object cdsPedidocelularContato: TStringField
      FieldName = 'celularContato'
      EditMask = '(99)9-9999-9999;0;_'
      Size = 11
    end
    object cdsPedidostatus: TStringField
      FieldName = 'status'
      Size = 50
    end
    object cdsPedidoformaPagamento: TIntegerField
      FieldName = 'formaPagamento'
    end
  end
  object dsPedido: TDataSource
    DataSet = cdsPedido
    Left = 216
  end
  object SQLQueryEscola: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select id, nome_escola from escola')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 120
    Top = 88
  end
  object DataSetProviderEscola: TDataSetProvider
    DataSet = SQLQueryEscola
    Left = 88
    Top = 88
  end
  object ClientDataSetEscola: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderEscola'
    Left = 56
    Top = 88
    object ClientDataSetEscolaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ClientDataSetEscolaNOME_ESCOLA: TStringField
      FieldName = 'NOME_ESCOLA'
      Size = 500
    end
  end
  object DataSourceEscola: TDataSource
    DataSet = ClientDataSetEscola
    Left = 24
    Top = 88
  end
  object dsSerie: TDataSource
    DataSet = cdsSerie
    Left = 408
    Top = 88
  end
  object cdsSerie: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_escola'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ano_letivo'
        ParamType = ptInput
      end>
    ProviderName = 'dspSerie'
    Left = 448
    Top = 88
    object cdsSerieID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSerieSERIE: TStringField
      FieldName = 'SERIE'
      Size = 201
    end
  end
  object dspSerie: TDataSetProvider
    DataSet = sqlSerie
    Left = 480
    Top = 88
  end
  object sqlSerie: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_escola'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ano_letivo'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select t.id,upper( t.serie) || '#39' - '#39' || upper(t.turma) as serie '
      'from turma  t'
      'where t.id_escola = :escola and t.ano_letivo = :ano_letivo')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 512
    Top = 88
  end
  object dsAluno: TDataSource
    DataSet = cdsAluno
    Left = 23
    Top = 138
  end
  object cdsAluno: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_turma'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspAluno'
    Left = 55
    Top = 138
    object cdsAlunoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsAlunoNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object cdsAlunoRA: TStringField
      FieldName = 'RA'
      Size = 100
    end
  end
  object dspAluno: TDataSetProvider
    DataSet = sqlAluno
    Left = 87
    Top = 138
  end
  object sqlAluno: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_turma'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select a.id, a.nome, a.ra'
      'from aluno a'
      'where a.id_turma = :id_turma')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 119
    Top = 138
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 112
    Top = 272
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    AfterDelete = cdsProdutoAfterDelete
    AfterScroll = cdsProdutoAfterScroll
    Left = 145
    Top = 272
    object cdsProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 227
    end
    object cdsProdutoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 4
    end
    object cdsProdutoDESCRICAO_ORIGINAL: TStringField
      FieldName = 'DESCRICAO_ORIGINAL'
      Size = 200
    end
    object cdsProdutoIND_KIT: TStringField
      FieldName = 'IND_KIT'
      Size = 1
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sqlProduto
    Left = 179
    Top = 272
  end
  object sqlProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select P.ID,'
      
        '       upper(P.DESCRICAO) || replace('#39' - R$ '#39' || cast(coalesce(P' +
        '.VALOR, 0) as numeric(15,2)), '#39'.'#39', '#39','#39') as DESCRICAO,'
      '       P.VALOR,'
      '       upper(P.DESCRICAO) DESCRICAO_ORIGINAL,'
      '       coalesce(p.ind_kit,'#39'N'#39') ind_kit'
      'from PRODUTO P  ')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 212
    Top = 272
  end
  object sqlSpPedido: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ID_ALUNO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Precision = 4
        Name = 'DATA_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Precision = 4
        Name = 'DATA_VENCTO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Precision = 4
        Name = 'DATA_ENTREG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 9
        Name = 'TOTAL_B'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 9
        Name = 'DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 9
        Name = 'TOTAL_L'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPF_CONTATO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TELEFONE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME_CONTATO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'OID'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    StoredProcName = 'P_PEDIDO'
    Left = 648
    Top = 536
  end
  object sqlSpItem: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ID_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 500
        Name = 'DESC_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 9
        Name = 'VALOR_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IND_EXTRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_KIT'
        ParamType = ptInput
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    StoredProcName = 'P_PEDIDO_ITEM'
    Left = 696
    Top = 536
  end
  object SQLProc: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 696
    Top = 488
  end
  object sqlSpLog: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Precision = 4000
        Name = 'MENSAGEM'
        ParamType = ptInput
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    StoredProcName = 'P_LOG'
    Left = 696
    Top = 440
  end
  object sqlSpPedidoExtra: TSQLStoredProc
    MaxBlobSize = -1
    ParamCheck = False
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'TOTAL_B'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'TOTAL_L'
        ParamType = ptInput
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    StoredProcName = 'P_PEDIDO_EXTRA'
    Left = 280
    Top = 352
  end
  object sqlSpFormaPagto: TSQLStoredProc
    MaxBlobSize = -1
    ParamCheck = False
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_FORMA_PAGTO'
        ParamType = ptInput
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    StoredProcName = 'P_TITULO'
    Left = 376
    Top = 352
  end
  object sqlSpValidaTitulo: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 1
        Name = 'OLIQUIDADO'
        ParamType = ptOutput
        Size = 1
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    StoredProcName = 'P_VERIFICA_TITULO'
    Left = 320
    Top = 408
  end
  object sqlKit: TSQLQuery
    GetMetadata = True
    Active = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'KIT'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select k.id_prod_kit, K.ID_PRODUTO, K.DESCRICAO, K.QUANTIDADE, P' +
        '.VALOR'
      'from PRODUTO_KIT K'
      'inner join PRODUTO P on (K.ID_PRODUTO = P.ID)'
      'inner join PRODUTO PP on (K.ID_PROD_KIT = PP.ID)'
      'where K.ID_PROD_KIT = :KIT')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 208
    Top = 320
  end
  object dspKit: TDataSetProvider
    DataSet = sqlKit
    Left = 176
    Top = 320
  end
  object cdsKit: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ID_PROD_KIT'
    MasterFields = 'ID'
    MasterSource = dsProduto
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspKit'
    Left = 144
    Top = 320
    object cdsKitID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object cdsKitDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsKitQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object cdsKitVALOR: TFMTBCDField
      FieldName = 'VALOR'
      currency = True
      Precision = 18
      Size = 4
    end
    object cdsKitID_PROD_KIT: TIntegerField
      FieldName = 'ID_PROD_KIT'
      Required = True
    end
  end
  object dsKit: TDataSource
    DataSet = cdsKit
    Left = 112
    Top = 320
  end
end
