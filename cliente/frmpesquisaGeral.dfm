object frmpesqGeral: TfrmpesqGeral
  Left = 0
  Top = 0
  Caption = 'Pesquisa De dados '
  ClientHeight = 202
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 0
    Width = 431
    Height = 194
    DataSource = dts_pesquisa
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object dts_pesquisa: TDataSource
    DataSet = cds_pesquisa
    Left = 336
    Top = 8
  end
  object cds_pesquisa: TClientDataSet
    PersistDataPacket.Data = {
      540000009619E0BD01000000180000000200000000000300000054000A494452
      4547495354524F04000100000000001244455343524943414F5F524547495354
      524F01004900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 16
    object cds_pesquisaIDREGISTRO: TIntegerField
      FieldName = 'IDREGISTRO'
    end
    object cds_pesquisaDESCRICAO_REGISTRO: TStringField
      FieldName = 'DESCRICAO_REGISTRO'
    end
  end
  object DataSource1: TDataSource
    DataSet = SQLTable1
    Left = 504
    Top = 72
  end
  object SQLTable1: TSQLTable
    Active = True
    MaxBlobSize = -1
    SQLConnection = frmPrincipal.SQLConnection1
    TableName = 'ESCOLA'
    Left = 520
    Top = 72
    object SQLTable1ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object SQLTable1NOME_ESCOLA: TStringField
      FieldName = 'NOME_ESCOLA'
      Size = 500
    end
    object SQLTable1ENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 200
    end
    object SQLTable1NUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 50
    end
    object SQLTable1TELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object SQLTable1EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object SQLTable1CELULAR: TStringField
      FieldName = 'CELULAR'
    end
    object SQLTable1CNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object SQLTable1OBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 4000
    end
  end
end
