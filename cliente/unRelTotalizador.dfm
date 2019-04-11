object frmTotalizador: TfrmTotalizador
  Left = 293
  Top = 110
  Caption = 'Relat'#243'rio de totalizadores'
  ClientHeight = 140
  ClientWidth = 442
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
  object SQLQry_Totalizador: TSQLQuery
    GetMetadata = True
    MaxBlobSize = 1
    ParamCheck = False
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
      end
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
      'select F.ID, F.DESCRICAO, sum(T.VALOR)'
      'from PEDIDO P'
      'inner join TITULO T on (T.ID_PEDIDO = P.ID)'
      'inner join FORMA_PAGAMENTO F on (F.ID = T.ID_FORMA_PAGTO)'
      'where T.EVENTO = '#39'LIQUIDADO'#39' and'
      '      P.DATA_VENCTO between :DATA_INICIO and :DATA_FIM'
      'group by 1, 2'
      'union all'
      'select -1, '#39'DEVOLU'#199#195'O'#39', sum(T.VALOR)'
      'from PEDIDO P'
      'inner join TITULO T on (T.ID_PEDIDO = P.ID)'
      'where T.EVENTO = '#39'DEVOLVIDO'#39' and'
      '      P.DATA_VENCTO between :DATA_INICIO and :DATA_FIM and'
      '      not exists(select 1'
      '                 from TITULO TT'
      '                 where TT.ID_PEDIDO = T.ID_PEDIDO and'
      '                       TT.EVENTO = '#39'CANCELADO'#39')'
      'group by 1, 2')
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
    ReportOptions.CreateDate = 43451.970758379630000000
    ReportOptions.LastChange = 43451.984576875000000000
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
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 18.897650000000000000
          Top = 3.779530000000001000
          Width = 423.307360000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio de Totalizadores:')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 359.055350000000000000
        Top = 124.724490000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Chart1: TfrxChartView
          Left = 30.236240000000000000
          Top = 15.118120000000000000
          Width = 646.299630000000000000
          Height = 321.260050000000000000
          HighlightColor = clBlack
          Chart = {
            5450463006544368617274054368617274044C656674020003546F7002000557
            696474680390010648656967687403FA00144261636B57616C6C2E50656E2E56
            697369626C65080B4178697356697369626C65080D4672616D652E5669736962
            6C6508175669657733444F7074696F6E732E456C65766174696F6E033B011856
            69657733444F7074696F6E732E4F7274686F676F6E616C08195669657733444F
            7074696F6E732E50657273706563746976650200165669657733444F7074696F
            6E732E526F746174696F6E0368010B56696577334457616C6C73080A42657665
            6C4F75746572070662764E6F6E6505436F6C6F720707636C57686974650D4465
            6661756C7443616E766173060E54474449506C757343616E76617311436F6C6F
            7250616C65747465496E646578020D000A545069655365726965730753657269
            6573310D5856616C7565732E4F72646572070B6C6F417363656E64696E670C59
            56616C7565732E4E616D6506035069650D5956616C7565732E4F726465720706
            6C6F4E6F6E651A4672616D652E496E6E657242727573682E4261636B436F6C6F
            720705636C526564224672616D652E496E6E657242727573682E477261646965
            6E742E456E64436F6C6F720706636C47726179224672616D652E496E6E657242
            727573682E4772616469656E742E4D6964436F6C6F720707636C576869746524
            4672616D652E496E6E657242727573682E4772616469656E742E537461727443
            6F6C6F720440404000214672616D652E496E6E657242727573682E4772616469
            656E742E56697369626C65091B4672616D652E4D6964646C6542727573682E42
            61636B436F6C6F720708636C59656C6C6F77234672616D652E4D6964646C6542
            727573682E4772616469656E742E456E64436F6C6F720482828200234672616D
            652E4D6964646C6542727573682E4772616469656E742E4D6964436F6C6F7207
            07636C5768697465254672616D652E4D6964646C6542727573682E4772616469
            656E742E5374617274436F6C6F720706636C47726179224672616D652E4D6964
            646C6542727573682E4772616469656E742E56697369626C65091A4672616D65
            2E4F7574657242727573682E4261636B436F6C6F720707636C477265656E2246
            72616D652E4F7574657242727573682E4772616469656E742E456E64436F6C6F
            720440404000224672616D652E4F7574657242727573682E4772616469656E74
            2E4D6964436F6C6F720707636C5768697465244672616D652E4F757465724272
            7573682E4772616469656E742E5374617274436F6C6F720708636C53696C7665
            72214672616D652E4F7574657242727573682E4772616469656E742E56697369
            626C65090B4672616D652E57696474680204194F74686572536C6963652E4C65
            67656E642E56697369626C6508000000}
          ChartElevation = 315
          SeriesData = <
            item
              InheritedName = 'TfrxSeriesItem2'
              DataType = dtDBData
              DataBand = frxReportPedido.MasterData1
              DataSet = frxDBDataset1
              DataSetName = 'frxDBDataset1'
              SortOrder = soAscending
              TopN = 0
              XType = xtText
              Source1 = 'frxDBDataset1."DESCRICAO"'
              Source2 = 'frxDBDataset1."SUM"'
              XSource = 'frxDBDataset1."DESCRICAO"'
              YSource = 'frxDBDataset1."SUM"'
            end>
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'DESCRICAO=DESCRICAO'
      'SUM=SUM')
    OpenDataSource = False
    DataSource = dsTotalizador
    BCDToCurrency = False
    Left = 320
    Top = 60
  end
  object dsTotalizador: TDataSource
    DataSet = cdsTotalizador
    Left = 72
  end
  object dspTotalizador: TDataSetProvider
    DataSet = SQLQry_Totalizador
    Left = 168
  end
  object cdsTotalizador: TClientDataSet
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
      end
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
    ProviderName = 'dspTotalizador'
    Left = 112
    object cdsTotalizadorID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTotalizadorDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsTotalizadorSUM: TFloatField
      FieldName = 'SUM'
      currency = True
    end
  end
  object frxChartObject1: TfrxChartObject
    Left = 272
    Top = 40
  end
end
