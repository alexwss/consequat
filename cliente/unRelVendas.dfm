object frmRelVenda: TfrmRelVenda
  Left = 285
  Top = 103
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Vendas'
  ClientHeight = 144
  ClientWidth = 427
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblDtInicial: TLabel
    Left = 32
    Top = 21
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
  end
  object lblDtFinal: TLabel
    Left = 304
    Top = 21
    Width = 48
    Height = 13
    Caption = 'Data Final'
  end
  object edDtInicio: TDateTimePicker
    Left = 32
    Top = 40
    Width = 105
    Height = 21
    Date = 43444.934412696760000000
    Time = 43444.934412696760000000
    TabOrder = 0
  end
  object edDtFim: TDateTimePicker
    Left = 304
    Top = 40
    Width = 105
    Height = 21
    Date = 43444.934412696760000000
    Time = 43444.934412696760000000
    TabOrder = 1
  end
  object Button1: TButton
    Left = 32
    Top = 80
    Width = 377
    Height = 41
    Caption = 'Gerar Relat'#243'rio'
    TabOrder = 2
    OnClick = Button1Click
  end
  object SQLQry_Pedido: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_FIM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select P.ID, A.NOME, P.DATA_PEDIDO, P.DATA_VENCTO, P.DATA_ENTREG' +
        ', P.TOTAL_B, P.DESCONTO, P.TOTAL_L, P.ID_ALUNO, T.ID ID_TURMA, E' +
        '.ID ID_ESCOLA, T.ANO_LETIVO, P.OBSERVACAO, P.CPF_CONTATO, P.TELE' +
        'FONE, P.NOME_CONTATO'
      'from PEDIDO P'
      'inner join ALUNO A on (P.ID_ALUNO = A.ID)'
      'inner join TURMA T on (T.ID = A.ID_TURMA)'
      'inner join ESCOLA E on (E.ID = T.ID_ESCOLA)'
      'where P.DATA_PEDIDO between :DATA_INICIO and :DATA_FIM')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 224
  end
  object frxReportPedido: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41718.667806689800000000
    ReportOptions.LastChange = 43445.950925763890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 336
    Top = 4
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxdbItem'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 60.472480000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Align = baLeft
          Top = 11.338590000000000000
          Width = 740.787880000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Pedidos')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 11.338590000000000000
          Top = 7.559060000000000000
          Width = 181.417440000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          HAlign = haCenter
          Memo.UTF8W = (
            'Reviver Fotografia')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 185.196970000000000000
        Width = 740.409927000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        PrintIfDetailEmpty = True
        RowCount = 0
        object frxDBDataset1ID: TfrxMemoView
          Left = 11.779530000000000000
          Top = 4.535433070866140000
          Width = 79.370130000000000000
          Height = 15.118110236220500000
          AutoWidth = True
          DataField = 'ID'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."ID"]')
          ParentFont = False
        end
        object frxDBDataset1NOME: TfrxMemoView
          Left = 112.826840000000000000
          Top = 4.535433070000000000
          Width = 204.094620000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataField = 'NOME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NOME"]')
          ParentFont = False
        end
        object frxDBDataset1SOBRENOME: TfrxMemoView
          Left = 328.260050000000000000
          Top = 4.535433070866140000
          Width = 188.976500000000000000
          Height = 15.118110236220500000
          AutoWidth = True
          DataField = 'TOTAL_L'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."TOTAL_L"]')
          ParentFont = False
        end
        object frxDBDataset1TELEFONE: TfrxMemoView
          Left = 521.016080000000000000
          Top = 4.535433070866140000
          Width = 113.385900000000000000
          Height = 15.118110236220500000
          AutoWidth = True
          DataField = 'TELEFONE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."TELEFONE"]')
          ParentFont = False
        end
        object frxDBDataset1DATANASCIMENTO: TfrxMemoView
          Left = 641.961040000000000000
          Top = 4.535433070866140000
          Width = 90.708720000000000000
          Height = 15.118110236220500000
          AutoWidth = True
          DataField = 'DATA_PEDIDO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."DATA_PEDIDO"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 313.700990000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Left = 665.197280000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 234.330860000000000000
        Width = 740.409927000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxdbItem'
        PrintIfDetailEmpty = True
        RowCount = 0
        object frxdbItemDESCRICAO_PRODUTO: TfrxMemoView
          Left = 113.385900000000000000
          Top = 1.889763779527560000
          Width = 400.630180000000000000
          Height = 13.228346460000000000
          DataField = 'DESCRICAO_PRODUTO'
          DataSet = frxDBDataset2
          DataSetName = 'frxdbItem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            '[frxdbItem."DESCRICAO_PRODUTO"]')
          ParentFont = False
        end
        object frxdbItemQUANTIDADE: TfrxMemoView
          Left = 532.913730000000000000
          Top = 1.889763779527560000
          Width = 79.370130000000000000
          Height = 13.228346460000000000
          DataField = 'QUANTIDADE'
          DataSet = frxDBDataset2
          DataSetName = 'frxdbItem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxdbItem."QUANTIDADE"]')
          ParentFont = False
        end
        object frxdbItemVALOR_PRODUTO: TfrxMemoView
          Left = 634.961040000000000000
          Top = 1.889763779527560000
          Width = 102.047310000000000000
          Height = 13.228346460000000000
          DataField = 'VALOR_PRODUTO'
          DataSet = frxDBDataset2
          DataSetName = 'frxdbItem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            '[frxdbItem."VALOR_PRODUTO"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 102.047310000000000000
        Width = 740.409927000000000000
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 113.385900000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 325.039580000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Total:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 517.795610000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 638.740570000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Venda:')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'NOME=NOME'
      'DATA_PEDIDO=DATA_PEDIDO'
      'DATA_VENCTO=DATA_VENCTO'
      'DATA_ENTREG=DATA_ENTREG'
      'TOTAL_B=TOTAL_B'
      'DESCONTO=DESCONTO'
      'TOTAL_L=TOTAL_L'
      'ID_ALUNO=ID_ALUNO'
      'ID_TURMA=ID_TURMA'
      'ID_ESCOLA=ID_ESCOLA'
      'ANO_LETIVO=ANO_LETIVO'
      'OBSERVACAO=OBSERVACAO'
      'CPF_CONTATO=CPF_CONTATO'
      'TELEFONE=TELEFONE'
      'NOME_CONTATO=NOME_CONTATO')
    OpenDataSource = False
    DataSource = dsPedido
    BCDToCurrency = False
    Left = 320
    Top = 60
  end
  object dsPedido: TDataSource
    DataSet = cdsPedido
    Left = 72
  end
  object sqlItemPedido: TSQLQuery
    MaxBlobSize = 1
    ParamCheck = False
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_PEDIDO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select  i.id_pedido, i.id, i.id_produto, i.descricao_produto, i.' +
        'valor_produto, i.quantidade, coalesce(i.ind_extra, '#39'N'#39') ind_extr' +
        'a'
      'from pedido_item i'
      'where i.id_pedido = :COD_PEDIDO'
      'order by i.id')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 232
    Top = 96
  end
  object dsItemPedido: TDataSource
    DataSet = cdsItemPedido
    Left = 72
    Top = 96
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxdbItem'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'ID_PRODUTO=ID_PRODUTO'
      'DESCRICAO_PRODUTO=DESCRICAO_PRODUTO'
      'VALOR_PRODUTO=VALOR_PRODUTO'
      'QUANTIDADE=QUANTIDADE'
      'IND_EXTRA=IND_EXTRA')
    OpenDataSource = False
    DataSource = dsItemPedido
    BCDToCurrency = False
    Left = 392
    Top = 76
  end
  object dspItemPedido: TDataSetProvider
    DataSet = sqlItemPedido
    Left = 184
    Top = 96
  end
  object cdsItemPedido: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PEDIDO'
    MasterFields = 'ID'
    MasterSource = dsPedido
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_PEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspItemPedido'
    Left = 128
    Top = 96
    object cdsItemPedidoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsItemPedidoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object cdsItemPedidoDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 200
    end
    object cdsItemPedidoVALOR_PRODUTO: TFMTBCDField
      FieldName = 'VALOR_PRODUTO'
      currency = True
      Precision = 18
      Size = 4
    end
    object cdsItemPedidoQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object cdsItemPedidoIND_EXTRA: TStringField
      FieldName = 'IND_EXTRA'
      Size = 1
    end
    object cdsItemPedidoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
  end
  object dspPedido: TDataSetProvider
    DataSet = SQLQry_Pedido
    Left = 168
  end
  object cdsPedido: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'DATA_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_FIM'
        ParamType = ptInput
      end>
    ProviderName = 'dspPedido'
    Left = 112
    object cdsPedidoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPedidoNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object cdsPedidoDATA_PEDIDO: TDateField
      FieldName = 'DATA_PEDIDO'
    end
    object cdsPedidoDATA_VENCTO: TDateField
      FieldName = 'DATA_VENCTO'
    end
    object cdsPedidoDATA_ENTREG: TDateField
      FieldName = 'DATA_ENTREG'
    end
    object cdsPedidoTOTAL_B: TFMTBCDField
      FieldName = 'TOTAL_B'
      currency = True
      Precision = 18
      Size = 4
    end
    object cdsPedidoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 9
      Size = 2
    end
    object cdsPedidoTOTAL_L: TFMTBCDField
      FieldName = 'TOTAL_L'
      currency = True
      Precision = 18
      Size = 4
    end
    object cdsPedidoID_ALUNO: TIntegerField
      FieldName = 'ID_ALUNO'
      Required = True
    end
    object cdsPedidoID_TURMA: TIntegerField
      FieldName = 'ID_TURMA'
      Required = True
    end
    object cdsPedidoID_ESCOLA: TIntegerField
      FieldName = 'ID_ESCOLA'
      Required = True
    end
    object cdsPedidoANO_LETIVO: TIntegerField
      FieldName = 'ANO_LETIVO'
    end
    object cdsPedidoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 4000
    end
    object cdsPedidoCPF_CONTATO: TStringField
      FieldName = 'CPF_CONTATO'
      Size = 14
    end
    object cdsPedidoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object cdsPedidoNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 200
    end
  end
end
