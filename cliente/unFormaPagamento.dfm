object frmFormaPagamento: TfrmFormaPagamento
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Forma de Pagamento'
  ClientHeight = 279
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 280
    Height = 279
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 278
      Height = 14
      Align = alTop
      Alignment = taCenter
      Caption = 'FORMA DE PAGAMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 144
    end
    object btnSeleciona: TButton
      Left = 49
      Top = 239
      Width = 177
      Height = 25
      Caption = 'Concluir'
      TabOrder = 0
      OnClick = btnSelecionaClick
    end
    object lbFormaPagto: TDBLookupListBox
      Left = 16
      Top = 20
      Width = 249
      Height = 212
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListSource = dsFormaPagto
      TabOrder = 1
      OnDblClick = lbFormaPagtoDblClick
    end
  end
  object dsFormaPagto: TDataSource
    DataSet = cdsFormaPagto
    Left = 8
  end
  object cdsFormaPagto: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFOrmaPagto'
    Left = 40
    object cdsFormaPagtoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFormaPagtoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  object dspFOrmaPagto: TDataSetProvider
    DataSet = sqlFormaPagto
    Left = 72
  end
  object sqlFormaPagto: TSQLQuery
    Active = True
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQL.Strings = (
      'select p.id, p.descricao from forma_pagamento p'
      'where p.ind_ativo = '#39'S'#39)
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 104
  end
end
