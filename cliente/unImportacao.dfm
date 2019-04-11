object frmImportacao: TfrmImportacao
  Left = 0
  Top = 0
  Caption = 'Importar CSV'
  ClientHeight = 235
  ClientWidth = 705
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 93
    Width = 96
    Height = 13
    Caption = 'Caminho do Arquivo'
  end
  object Label2: TLabel
    Left = 24
    Top = 43
    Width = 60
    Height = 13
    Caption = 'Nome Escola'
  end
  object Label9: TLabel
    Left = 190
    Top = 8
    Width = 307
    Height = 40
    Caption = 'IMPORTAR ARQUIVO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 510
    Top = 43
    Width = 51
    Height = 13
    Caption = 'Ano Letivo'
  end
  object edArquivo: TEdit
    Left = 24
    Top = 112
    Width = 575
    Height = 21
    Color = clInactiveCaption
    Enabled = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 608
    Top = 110
    Width = 75
    Height = 25
    Caption = 'Procurar...'
    TabOrder = 1
    OnClick = Button1Click
  end
  object btnProcessar: TButton
    Left = 136
    Top = 165
    Width = 409
    Height = 39
    Caption = 'Processar'
    TabOrder = 2
    OnClick = btnProcessarClick
  end
  object edAnoLetivo: TSpinEdit
    Left = 510
    Top = 62
    Width = 89
    Height = 22
    MaxValue = 2100
    MinValue = 1990
    TabOrder = 3
    Value = 1990
  end
  object lkEscola: TDBLookupComboBox
    Left = 24
    Top = 62
    Width = 480
    Height = 21
    KeyField = 'ID'
    ListField = 'NOME_ESCOLA'
    ListSource = DataSourceEscola
    TabOrder = 4
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    DefaultExt = '.csv'
    Filter = 'Arquivo Separado por V'#237'rgula (*.csv)|*.csv'
    Left = 520
    Top = 109
  end
  object SQLProc: TSQLQuery
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQL.Strings = (
      'select id, nome_escola, cnpj from escola'
      'order by 1')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 559
    Top = 168
  end
  object SQLStoredProc1: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Precision = 100
        Name = 'SERIE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 100
        Name = 'TURMA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ANO_LETIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ID_ESCOLA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'POIDTURMA'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    StoredProcName = 'INSERE_TURMA'
    Left = 216
    Top = 128
  end
  object SQLspLog: TSQLStoredProc
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
    Left = 296
    Top = 128
  end
  object SQLspImportar: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ID_ESCOLA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ANO_LETIVO'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Precision = 320000
        Name = 'HASH'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 500
        Name = 'NOME_ARQUIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'OID'
        ParamType = ptOutput
        Size = 4
        Value = 1
      end
      item
        DataType = ftString
        Precision = 1
        Name = 'OEXISTE'
        ParamType = ptOutput
        Size = 1
        Value = 'N'
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    StoredProcName = 'IMPORTAR'
    Left = 216
    Top = 184
  end
  object SQLspAluno: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Precision = 200
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Precision = 4
        Name = 'DATA_NASCIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 100
        Name = 'COD_ALUNO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 100
        Name = 'RA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 4000
        Name = 'OBSERVACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ID_TURMA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'SEQUENCIAL'
        ParamType = ptInput
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    StoredProcName = 'INSERE_ALUNO'
    Left = 296
    Top = 184
  end
  object DataSourceEscola: TDataSource
    DataSet = ClientDataSetEscola
    Left = 640
    Top = 8
  end
  object ClientDataSetEscola: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderEscola'
    Left = 640
    Top = 64
    object ClientDataSetEscolaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ClientDataSetEscolaNOME_ESCOLA: TStringField
      FieldName = 'NOME_ESCOLA'
      Size = 500
    end
  end
  object DataSetProviderEscola: TDataSetProvider
    DataSet = SQLQueryEscola
    Left = 640
    Top = 120
  end
  object SQLQueryEscola: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select id, nome_escola from escola')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 640
    Top = 176
  end
end
