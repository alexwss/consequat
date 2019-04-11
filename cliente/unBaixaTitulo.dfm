object frmBaixaTitulo: TfrmBaixaTitulo
  Left = 0
  Top = 0
  ActiveControl = btnFinalizar
  BorderStyle = bsSingle
  Caption = 'frmBaixaTitulo'
  ClientHeight = 330
  ClientWidth = 672
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 128
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 664
      Height = 45
      Align = alTop
      Alignment = taCenter
      Caption = 'Realizar Baixa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 45
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Quality = fqClearType
      ParentFont = False
      ExplicitWidth = 223
    end
    object edAluno: TDBText
      Left = 75
      Top = 73
      Width = 166
      Height = 17
      DataField = 'NOME_ALUNO'
      DataSource = dsTitulo
    end
    object edValor: TDBText
      Left = 75
      Top = 103
      Width = 76
      Height = 18
      DataField = 'VALOR'
      DataSource = dsTitulo
    end
    object edEscola: TDBText
      Left = 293
      Top = 73
      Width = 243
      Height = 17
      DataField = 'NOME_ESCOLA'
      DataSource = dsTitulo
    end
    object edSerie: TDBText
      Left = 585
      Top = 73
      Width = 68
      Height = 17
      DataField = 'SERIE'
      DataSource = dsTitulo
    end
    object Label2: TLabel
      Left = 32
      Top = 72
      Width = 40
      Height = 14
      Caption = 'Aluno:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 248
      Top = 72
      Width = 41
      Height = 14
      Caption = 'Escola:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 32
      Top = 102
      Width = 35
      Height = 14
      Caption = 'Valor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 547
      Top = 72
      Width = 34
      Height = 14
      Caption = 'S'#233'rie:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 248
      Top = 102
      Width = 30
      Height = 14
      Caption = 'Tipo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object rbBaixar: TRadioButton
      Left = 293
      Top = 102
      Width = 92
      Height = 17
      Caption = 'Baixar T'#237'tulo'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbCancelar: TRadioButton
      Left = 397
      Top = 102
      Width = 113
      Height = 17
      Caption = 'Cancelar'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 293
    Width = 672
    Height = 37
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object btnFinalizar: TButton
      Left = 574
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Finalizar'
      TabOrder = 0
      OnClick = btnFinalizarClick
    end
    object btnCancelar: TButton
      Left = 478
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 128
    Width = 672
    Height = 165
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object edObservacao: TDBMemo
      Left = 1
      Top = 1
      Width = 670
      Height = 163
      Align = alClient
      Color = 11073533
      DataField = 'OBSERVACAO'
      DataSource = dsTitulo
      MaxLength = 4000
      TabOrder = 0
    end
  end
  object sqlTitulo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_TITULO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select T.ID, A.nome NOME_ALUNO, E.nome_escola NOME_ESCOLA, TM.se' +
        'rie || '#39' '#39' || TM.turma SERIE, T.valor,  T.observacao'
      '  from TITULO T'
      ' inner join PEDIDO P on (P.ID  = T.ID_PEDIDO)'
      ' inner join ALUNO A  on (A.ID  = P.ID_ALUNO)'
      ' inner join turma tm on (tm.id = a.id_turma)'
      ' inner join escola e on (e.id  = tm.id_escola)'
      ' where t.id = :ID_TITULO')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 136
    Top = 240
  end
  object dspTitulo: TDataSetProvider
    DataSet = sqlTitulo
    Left = 136
    Top = 184
  end
  object cdsTitulo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_TITULO'
        ParamType = ptInput
      end>
    ProviderName = 'dspTitulo'
    Left = 136
    Top = 136
    object cdsTituloID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTituloNOME_ALUNO: TStringField
      FieldName = 'NOME_ALUNO'
      Size = 200
    end
    object cdsTituloNOME_ESCOLA: TStringField
      FieldName = 'NOME_ESCOLA'
      Size = 500
    end
    object cdsTituloSERIE: TStringField
      FieldName = 'SERIE'
      Size = 201
    end
    object cdsTituloVALOR: TSingleField
      FieldName = 'VALOR'
      currency = True
    end
    object cdsTituloOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 4000
    end
  end
  object dsTitulo: TDataSource
    DataSet = cdsTitulo
    Left = 136
    Top = 80
  end
  object sqlSpBaixaTitulo: TSQLStoredProc
    MaxBlobSize = -1
    ParamCheck = False
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_TITULO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACAO'
        ParamType = ptInput
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    StoredProcName = 'P_BAIXA_TITULO'
    Left = 400
    Top = 190
  end
end
