object frmProduto: TfrmProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produto'
  ClientHeight = 334
  ClientWidth = 792
  Color = clHighlightText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 57
    Width = 23
    Height = 13
    Caption = 'C'#243'd.'
  end
  object Label9: TLabel
    Left = 246
    Top = 8
    Width = 296
    Height = 40
    Caption = 'Cadastro de Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 44
    Top = 92
    Width = 27
    Height = 13
    Caption = 'Desc.'
  end
  object Label3: TLabel
    Left = 633
    Top = 92
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label8: TLabel
    Left = 33
    Top = 129
    Width = 63
    Height = 13
    Caption = 'Observa'#231#245'es'
  end
  object edCod: TDBEdit
    Left = 74
    Top = 54
    Width = 63
    Height = 21
    DataField = 'ID'
    DataSource = DataSourceProduto
    Enabled = False
    TabOrder = 0
  end
  object edDescricao: TDBEdit
    Left = 74
    Top = 89
    Width = 534
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = DataSourceProduto
    TabOrder = 1
  end
  object Button3: TButton
    Left = 689
    Top = 14
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = Button3Click
  end
  object edValor: TDBEdit
    Left = 661
    Top = 89
    Width = 103
    Height = 21
    DataField = 'VALOR'
    DataSource = DataSourceProduto
    TabOrder = 3
  end
  object edObservacao: TDBMemo
    Left = 26
    Top = 148
    Width = 738
    Height = 126
    DataField = 'OBSERVACAO'
    DataSource = DataSourceProduto
    TabOrder = 4
  end
  object btnIncluir: TButton
    Left = 26
    Top = 289
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 5
    OnClick = btnIncluirClick
  end
  object btnCancelar: TButton
    Left = 596
    Top = 289
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = btnCancelarClick
  end
  object btnSalvar: TButton
    Left = 689
    Top = 289
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 7
    OnClick = btnSalvarClick
  end
  object DBCheckBox1: TDBCheckBox
    Left = 574
    Top = 18
    Width = 109
    Height = 17
    Caption = 'Desativar Produto'
    DataField = 'IND_DESATIVADO'
    DataSource = DataSourceProduto
    TabOrder = 8
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 574
    Top = 56
    Width = 109
    Height = 17
    Caption = 'Kit de Produto'
    DataField = 'IND_KIT'
    DataSource = DataSourceProduto
    TabOrder = 9
    ValueChecked = 'S'
    ValueUnchecked = 'N'
    OnClick = DBCheckBox2Click
  end
  object btnKit: TButton
    Left = 690
    Top = 49
    Width = 75
    Height = 25
    Caption = 'Cadastrar Kit'
    TabOrder = 11
    OnClick = btnKitClick
  end
  object pnlKit: TPanel
    Left = 56
    Top = 38
    Width = 662
    Height = 254
    TabOrder = 10
    Visible = False
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 660
      Height = 56
      Align = alTop
      Color = clGradientInactiveCaption
      ParentBackground = False
      TabOrder = 0
      object lblCodProd: TLabel
        Left = 9
        Top = 15
        Width = 52
        Height = 13
        Caption = 'C'#243'd. Prod.'
      end
      object Label4: TLabel
        Left = 67
        Top = 15
        Width = 87
        Height = 13
        Caption = 'Descri'#231#227'o Produto'
      end
      object Label5: TLabel
        Left = 489
        Top = 15
        Width = 24
        Height = 13
        Caption = 'Qtde'
      end
      object btnIncluirItem: TButton
        Left = 564
        Top = 28
        Width = 92
        Height = 23
        Caption = 'Incluir Produto'
        TabOrder = 0
        OnClick = btnIncluirItemClick
      end
      object edQtde: TEdit
        Left = 487
        Top = 29
        Width = 72
        Height = 21
        TabOrder = 1
      end
      object lkProduto: TDBLookupComboBox
        Left = 65
        Top = 29
        Width = 416
        Height = 21
        KeyField = 'ID'
        ListField = 'DESCRICAO;VALOR'
        ListSource = dsProduto
        TabOrder = 2
        OnExit = lkProdutoExit
      end
      object edCodProduto: TEdit
        Left = 7
        Top = 29
        Width = 52
        Height = 21
        TabOrder = 3
        OnExit = edCodProdutoExit
        OnKeyPress = edCodProdutoKeyPress
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 203
      Width = 660
      Height = 50
      Align = alBottom
      Color = clGradientInactiveCaption
      ParentBackground = False
      TabOrder = 1
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 57
      Width = 660
      Height = 146
      Align = alClient
      DataSource = dsKit
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnColExit = DBGrid1ColExit
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_PRODUTO'
          ReadOnly = True
          Title.Caption = 'C'#243'd. Prod.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Width = 500
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Caption = 'Qtd.'
          Width = 66
          Visible = True
        end>
    end
    object btnConcluiKit: TButton
      Left = 560
      Top = 216
      Width = 75
      Height = 25
      Caption = 'Concluir'
      TabOrder = 3
      OnClick = btnConcluiKitClick
    end
  end
  object DataSourceProduto: TDataSource
    DataSet = ClientDataSetProduto
    Left = 728
    Top = 64
  end
  object ClientDataSetProduto: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Precision = 200
        Name = 'descricao'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProviderProduto'
    BeforeOpen = ClientDataSetProdutoBeforeOpen
    AfterPost = ClientDataSetProdutoAfterPost
    BeforeDelete = ClientDataSetProdutoBeforeDelete
    AfterScroll = ClientDataSetProdutoAfterScroll
    OnNewRecord = ClientDataSetProdutoNewRecord
    Left = 728
    Top = 112
    object ClientDataSetProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ClientDataSetProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object ClientDataSetProdutoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      currency = True
      Precision = 18
      Size = 4
    end
    object ClientDataSetProdutoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 4000
    end
    object ClientDataSetProdutoIND_DESATIVADO: TStringField
      FieldName = 'IND_DESATIVADO'
      Size = 1
    end
    object ClientDataSetProdutoIND_KIT: TStringField
      FieldName = 'IND_KIT'
      Size = 1
    end
  end
  object DataSetProviderProduto: TDataSetProvider
    DataSet = SQLDataSetProduto
    Left = 728
    Top = 152
  end
  object SQLDataSetProduto: TSQLDataSet
    Active = True
    CommandText = 'select * from produto'#13#10'where descricao like :descricao'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'descricao'
        ParamType = ptInput
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 728
    Top = 200
    object SQLDataSetProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object SQLDataSetProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object SQLDataSetProdutoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 4
    end
    object SQLDataSetProdutoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 4000
    end
    object SQLDataSetProdutoIND_DESATIVADO: TStringField
      FieldName = 'IND_DESATIVADO'
      Size = 1
    end
    object SQLDataSetProdutoIND_KIT: TStringField
      FieldName = 'IND_KIT'
      Size = 1
    end
  end
  object sqlSequence: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select next value for s_produto as id from rdb$database')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 112
    Top = 16
    object sqlSequenceID: TLargeintField
      FieldName = 'ID'
      Required = True
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 248
    Top = 48
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 281
    Top = 48
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
  end
  object dspProduto: TDataSetProvider
    DataSet = sqlProduto
    Left = 315
    Top = 48
  end
  object sqlProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select P.ID, upper(P.DESCRICAO) || replace('#39' - R$ '#39' || cast(coal' +
        'esce(P.VALOR, 0) as numeric(15,2)), '#39'.'#39', '#39','#39') as descricao, P.VA' +
        'LOR, upper(P.DESCRICAO) descricao_original'
      'from PRODUTO P '
      'where coalesce(p.ind_kit,'#39'N'#39') <> '#39'S'#39)
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 348
    Top = 48
    object sqlProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sqlProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 227
    end
    object sqlProdutoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 4
    end
    object sqlProdutoDESCRICAO_ORIGINAL: TStringField
      FieldName = 'DESCRICAO_ORIGINAL'
      Size = 200
    end
  end
  object dsKit: TDataSource
    DataSet = cdsKit
    Left = 360
    Top = 128
  end
  object cdsKit: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Precision = 200
        Name = 'descricao'
        ParamType = ptInput
      end>
    ProviderName = 'dspKit'
    BeforeEdit = cdsKitBeforeEdit
    BeforeDelete = cdsKitBeforeDelete
    Left = 360
    Top = 176
    object cdsKitID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsKitID_PROD_KIT: TIntegerField
      FieldName = 'ID_PROD_KIT'
      Required = True
    end
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
    object cdsKitIND_ALTERACAO: TStringField
      FieldName = 'IND_ALTERACAO'
      Size = 1
    end
  end
  object dspKit: TDataSetProvider
    DataSet = sqlKit
    Left = 360
    Top = 216
  end
  object sqlKit: TSQLDataSet
    Active = True
    CommandText = 
      'select p.*,  '#39'N'#39' ind_alteracao from produto_kit p'#13#10'where p.id_pr' +
      'od_kit = :id_kit'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Precision = 200
        Name = 'descricao'
        ParamType = ptInput
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 360
    Top = 264
    object sqlKitID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sqlKitID_PROD_KIT: TIntegerField
      FieldName = 'ID_PROD_KIT'
      Required = True
    end
    object sqlKitID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object sqlKitDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object sqlKitQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object sqlKitIND_ALTERACAO: TStringField
      FieldName = 'IND_ALTERACAO'
      Size = 1
    end
  end
  object spKit: TSQLStoredProc
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
        Name = 'ID_PROD_KIT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ID_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 200
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'QTD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 1
        Name = 'IND_ESTADO'
        ParamType = ptInput
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    StoredProcName = 'P_KIT'
    Left = 176
    Top = 208
  end
end
