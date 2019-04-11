object frmPesquisaProduto: TfrmPesquisaProduto
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Produto'
  ClientHeight = 363
  ClientWidth = 788
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 13
    Width = 64
    Height = 13
    Caption = 'Localizar por:'
  end
  object Edit1: TEdit
    Left = 82
    Top = 10
    Width = 611
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnClick = Edit1Click
  end
  object btnLocalizar: TButton
    Left = 705
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Procurar'
    Enabled = False
    TabOrder = 1
    OnClick = btnLocalizarClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 39
    Width = 765
    Height = 242
    DataSource = frmProduto.DataSourceProduto
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = btnSelecionarClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 610
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 73
        Visible = True
      end>
  end
  object btnCancelar: TButton
    Left = 606
    Top = 305
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object btnSelecionar: TButton
    Left = 705
    Top = 305
    Width = 75
    Height = 25
    Caption = 'Selecionar'
    Enabled = False
    TabOrder = 4
    OnClick = btnSelecionarClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 344
    Width = 788
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = True
  end
  object sqlKit: TSQLQuery
    Active = True
    MaxBlobSize = -1
    ParamCheck = False
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PROD'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from produto_kit p'
      'where p.id_prod_kit = :ID_PROD')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 688
    Top = 144
  end
  object dspKit: TDataSetProvider
    DataSet = sqlKit
    Left = 688
    Top = 112
  end
  object cdsKit: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ID_PROD_KIT'
    MasterFields = 'ID'
    MasterSource = frmProduto.DataSourceProduto
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspKit'
    Left = 688
    Top = 72
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
  end
  object dsKit: TDataSource
    Left = 688
    Top = 40
  end
end
