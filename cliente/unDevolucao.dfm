object frmDevolucao: TfrmDevolucao
  Left = 0
  Top = 0
  Caption = 'Devolu'#231#227'o'
  ClientHeight = 300
  ClientWidth = 772
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnTopo: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 137
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 764
      Height = 45
      Align = alTop
      Alignment = taCenter
      Caption = 'Devolu'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 45
      Font.Name = 'Tahoma'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Quality = fqClearType
      ParentFont = False
      ExplicitWidth = 167
    end
    object Label2: TLabel
      Left = 32
      Top = 22
      Width = 50
      Height = 13
      Caption = 'Nr. Pedido'
    end
    object Label3: TLabel
      Left = 32
      Top = 85
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
    object edAluno: TDBText
      Left = 75
      Top = 86
      Width = 166
      Height = 19
      DataField = 'NOME'
      DataSource = dsPedido
    end
    object Label4: TLabel
      Left = 248
      Top = 85
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
    object edEscola: TDBText
      Left = 293
      Top = 86
      Width = 243
      Height = 19
      DataField = 'NOME_ESCOLA'
      DataSource = dsPedido
    end
    object Label5: TLabel
      Left = 547
      Top = 85
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
    object edSerie: TDBText
      Left = 585
      Top = 86
      Width = 68
      Height = 19
      DataField = 'SERIE'
      DataSource = dsPedido
    end
    object Label6: TLabel
      Left = 32
      Top = 112
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
    object edValor: TDBText
      Left = 75
      Top = 108
      Width = 76
      Height = 20
      DataField = 'VALOR'
      DataSource = dsPedido
    end
    object Label7: TLabel
      Left = 507
      Top = 114
      Width = 102
      Height = 14
      Caption = 'Valor Devolu'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edPedido: TEdit
      Left = 32
      Top = 41
      Width = 81
      Height = 21
      TabOrder = 0
      OnExit = edPedidoExit
      OnKeyPress = edPedidoKeyPress
    end
    object btnPesquisaPedido: TButton
      Left = 133
      Top = 39
      Width = 75
      Height = 25
      Caption = 'Vincular'
      TabOrder = 1
      OnClick = btnPesquisaPedidoClick
    end
    object dbEditValor: TDBEdit
      Left = 615
      Top = 110
      Width = 121
      Height = 21
      DataField = 'VALOR_DEVOLUCAO'
      DataSource = dsPedido
      TabOrder = 2
      OnExit = edPedidoExit
    end
  end
  object pnControles: TPanel
    Left = 0
    Top = 259
    Width = 772
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnCancelar: TButton
      Left = 552
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object btnFinalizar: TButton
      Left = 648
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Finalizar'
      Enabled = False
      TabOrder = 1
      OnClick = btnFinalizarClick
    end
  end
  object pnCentral: TPanel
    Left = 0
    Top = 137
    Width = 772
    Height = 122
    Align = alClient
    TabOrder = 2
    object DBMemo1: TDBMemo
      Left = 1
      Top = 1
      Width = 770
      Height = 120
      Align = alClient
      Color = 11073533
      DataField = 'OBSERVACAO'
      DataSource = dsPedido
      MaxLength = 4000
      TabOrder = 0
      OnExit = edPedidoExit
    end
  end
  object sqlPedido: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PEDIDO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select T.ID, T.ID_PEDIDO, A.NOME,  TM.serie || '#39' '#39' || TM.turma s' +
        'erie , E.nome_escola, T.VALOR, T.VALOR VALOR_DEVOLUCAO, '#39#39' obser' +
        'vacao'
      '  from TITULO T'
      ' inner join PEDIDO P  ON (T.ID_PEDIDO  = P.ID)'
      ' inner join ALUNO  A  ON (P.ID_ALUNO   = A.ID)'
      ' inner join TURMA  TM ON (A.id_turma   = TM.ID)'
      ' inner join ESCOLA E  ON (TM.id_escola = E.ID)'
      ' where P.id = :ID_PEDIDO')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 88
    Top = 241
  end
  object dspPedido: TDataSetProvider
    DataSet = sqlPedido
    Left = 88
    Top = 201
  end
  object cdsPedido: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPedido'
    Left = 88
    Top = 161
    object cdsPedidoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPedidoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
    object cdsPedidoNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object cdsPedidoVALOR: TSingleField
      FieldName = 'VALOR'
      currency = True
    end
    object cdsPedidoVALOR_DEVOLUCAO: TSingleField
      FieldName = 'VALOR_DEVOLUCAO'
      currency = True
    end
    object cdsPedidoSERIE: TStringField
      FieldName = 'SERIE'
      Size = 201
    end
    object cdsPedidoNOME_ESCOLA: TStringField
      FieldName = 'NOME_ESCOLA'
      Size = 500
    end
    object cdsPedidoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsPedido: TDataSource
    DataSet = cdsPedido
    Left = 88
    Top = 128
  end
  object sqlSpVerificaTitulo: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
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
    Left = 304
    Top = 201
  end
  object sqlSpValidaPedido: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ID_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 1
        Name = 'VEXISTE'
        ParamType = ptOutput
        Size = 1
      end
      item
        DataType = ftString
        Precision = 1
        Name = 'VEXISTEDEVOLUCAO'
        ParamType = ptOutput
        Size = 1
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    StoredProcName = 'P_VERIFICA_PEDIDO'
    Left = 416
    Top = 193
  end
  object sqlSpTitulo: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ID_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 10
        Name = 'EVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 9
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 4000
        Name = 'OBSERVACAO'
        ParamType = ptInput
      end>
    SQLConnection = frmPrincipal.SQLConnection1
    StoredProcName = 'P_BAIXA_TITULO_DEVOLUCAO'
    Left = 344
    Top = 137
  end
end
