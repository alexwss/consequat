object frmEscola: TfrmEscola
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro Escola'
  ClientHeight = 366
  ClientWidth = 798
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 51
    Width = 23
    Height = 13
    Caption = 'C'#243'd.'
  end
  object Label2: TLabel
    Left = 36
    Top = 86
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 18
    Top = 121
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label4: TLabel
    Left = 561
    Top = 51
    Width = 22
    Height = 13
    Caption = 'Cnpj'
  end
  object Label5: TLabel
    Left = 546
    Top = 86
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object Label6: TLabel
    Left = 541
    Top = 121
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label7: TLabel
    Left = 550
    Top = 156
    Width = 33
    Height = 13
    Caption = 'Celular'
  end
  object Label8: TLabel
    Left = 25
    Top = 161
    Width = 63
    Height = 13
    Caption = 'Observa'#231#245'es'
  end
  object Label9: TLabel
    Left = 238
    Top = 2
    Width = 275
    Height = 40
    Caption = 'Cadastro de Escola'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object DBEdit1: TDBEdit
    Left = 66
    Top = 48
    Width = 63
    Height = 21
    DataField = 'ID'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 66
    Top = 83
    Width = 441
    Height = 21
    DataField = 'NOME_ESCOLA'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 66
    Top = 118
    Width = 441
    Height = 21
    DataField = 'ENDERECO'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 588
    Top = 48
    Width = 168
    Height = 21
    DataField = 'CNPJ'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 588
    Top = 83
    Width = 168
    Height = 21
    DataField = 'NUMERO'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 588
    Top = 118
    Width = 168
    Height = 21
    DataField = 'TELEFONE'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 588
    Top = 153
    Width = 168
    Height = 21
    DataField = 'CELULAR'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBMemo1: TDBMemo
    Left = 18
    Top = 180
    Width = 738
    Height = 126
    DataField = 'OBSERVACAO'
    DataSource = DataSource1
    TabOrder = 7
  end
  object btnSalvar: TButton
    Left = 681
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 8
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 588
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 9
    OnClick = btnCancelarClick
  end
  object Button3: TButton
    Left = 681
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 10
    OnClick = Button3Click
  end
  object btnIncluir: TButton
    Left = 18
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 11
    OnClick = btnIncluirClick
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 728
    Top = 64
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NomeEscola'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProvider1'
    OnNewRecord = ClientDataSet1NewRecord
    Left = 728
    Top = 112
    object ClientDataSet1ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ClientDataSet1NOME_ESCOLA: TStringField
      FieldName = 'NOME_ESCOLA'
      Size = 2000
    end
    object ClientDataSet1ENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 800
    end
    object ClientDataSet1NUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 200
    end
    object ClientDataSet1TELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '(99)99999-9999;1;_'
      Size = 80
    end
    object ClientDataSet1EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 400
    end
    object ClientDataSet1CELULAR: TStringField
      FieldName = 'CELULAR'
      EditMask = '(99)99999-9999;1;_'
      Size = 80
    end
    object ClientDataSet1CNPJ: TStringField
      FieldName = 'CNPJ'
      EditMask = '99.999.999/9999-99;1'
      Size = 80
    end
    object ClientDataSet1OBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 16000
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Constraints = False
    Left = 728
    Top = 152
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 'select * from escola'#13#10'where nome_escola like  :NomeEscola'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NomeEscola'
        ParamType = ptInput
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 728
    Top = 200
    object SQLDataSet1ID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object SQLDataSet1NOME_ESCOLA: TStringField
      FieldName = 'NOME_ESCOLA'
      Size = 2000
    end
    object SQLDataSet1ENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 800
    end
    object SQLDataSet1NUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 200
    end
    object SQLDataSet1TELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 80
    end
    object SQLDataSet1EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 400
    end
    object SQLDataSet1CELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 80
    end
    object SQLDataSet1CNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 80
    end
    object SQLDataSet1OBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 16000
    end
  end
  object SQLQuery1: TSQLQuery
    DataSource = DataSource1
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select next value for s_escola as id from rdb$database')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 136
    Top = 40
    object SQLQuery1ID: TLargeintField
      FieldName = 'ID'
      Required = True
    end
  end
end
