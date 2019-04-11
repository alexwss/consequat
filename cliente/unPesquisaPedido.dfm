object frmPesquisaPedido: TfrmPesquisaPedido
  Left = 146
  Top = 110
  ActiveControl = PageControl1
  Caption = 'Pesquisar Pedido'
  ClientHeight = 508
  ClientWidth = 752
  Color = clHighlightText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 232
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 752
    Height = 177
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 750
      Height = 175
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Pesquisa Detalhada'
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 742
          Height = 147
          Align = alClient
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
          object Label3: TLabel
            Left = 19
            Top = 2
            Width = 51
            Height = 13
            Caption = 'Ano Letivo'
          end
          object lblAluno: TLabel
            Left = 14
            Top = 91
            Width = 27
            Height = 13
            Caption = 'Aluno'
          end
          object lblNome: TLabel
            Tag = 78
            Left = 16
            Top = 46
            Width = 30
            Height = 13
            Caption = 'Escola'
          end
          object Label4: TLabel
            Left = 417
            Top = 46
            Width = 30
            Height = 13
            Caption = 'Turma'
          end
          object btnPesquisaAbaUm: TButton
            Left = 417
            Top = 106
            Width = 75
            Height = 25
            Caption = 'Pesquisar'
            TabOrder = 5
            OnClick = btnPesquisaAbaUmClick
          end
          object edAnoLetivo: TSpinEdit
            Left = 16
            Top = 18
            Width = 89
            Height = 22
            MaxValue = 2100
            MinValue = 1900
            TabOrder = 0
            Value = 1990
          end
          object lkAluno: TDBLookupComboBox
            Left = 14
            Top = 109
            Width = 392
            Height = 21
            DataField = 'idAluno'
            KeyField = 'ID'
            ListField = 'NOME;RA'
            ListSource = dsAluno
            TabOrder = 4
          end
          object lkEscola: TDBLookupComboBox
            Left = 14
            Top = 64
            Width = 392
            Height = 21
            DataField = 'nomeEscola'
            KeyField = 'ID'
            ListField = 'NOME_ESCOLA'
            ListSource = DataSourceEscola
            TabOrder = 2
          end
          object lkSerie: TDBLookupComboBox
            Left = 417
            Top = 64
            Width = 319
            Height = 21
            DataField = 'idSerie'
            KeyField = 'ID'
            ListField = 'SERIE'
            ListSource = dsSerie
            TabOrder = 3
          end
          object GroupBox1: TGroupBox
            Left = 120
            Top = 0
            Width = 286
            Height = 53
            Hint = 
              'Se Desejar Pesquisar por Data de Pedido N'#227'o Ser'#225' Origat'#243'rio  Fil' +
              'trar o Aluno'
            Caption = 'Pesquisar por Data do Pedido'
            TabOrder = 1
            object Label6: TLabel
              Left = 8
              Top = 13
              Width = 53
              Height = 13
              Caption = 'Data Inicial'
            end
            object Label5: TLabel
              Left = 149
              Top = 13
              Width = 48
              Height = 13
              Caption = 'Data Final'
            end
            object dtInicio: TDateTimePicker
              Left = 8
              Top = 27
              Width = 132
              Height = 21
              Date = 43430.879249803240000000
              Time = 43430.879249803240000000
              TabOrder = 0
            end
            object dtFim: TDateTimePicker
              Left = 149
              Top = 27
              Width = 132
              Height = 21
              Date = 43430.879249803240000000
              Time = 43430.879249803240000000
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 472
    Width = 752
    Height = 36
    Align = alBottom
    TabOrder = 2
    object Button2: TButton
      Left = 665
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Selecionar'
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 177
    Width = 752
    Height = 295
    Align = alClient
    DataSource = dsPedidoPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'Nr. Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome do Aluno'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_PEDIDO'
        Title.Caption = 'Data do Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_VENCTO'
        Title.Caption = 'Data Vencto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_ENTREG'
        Title.Caption = 'Data Entrega'
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'TOTAL_B'
        Title.Caption = 'Total Bruto'
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'DESCONTO'
        Title.Caption = '% Desc.'
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'TOTAL_L'
        Title.Caption = 'Total L'#237'quido'
        Visible = True
      end>
  end
  object sqlSerie: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_escola'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ano_letivo'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select t.id,upper( t.serie) || '#39' - '#39' || upper(t.turma) as serie '
      'from turma  t'
      'where t.id_escola = :escola and t.ano_letivo = :ano_letivo')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 508
    Top = 63
  end
  object dspSerie: TDataSetProvider
    DataSet = sqlSerie
    Left = 476
    Top = 63
  end
  object cdsSerie: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_escola'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ano_letivo'
        ParamType = ptInput
      end>
    ProviderName = 'dspSerie'
    AfterScroll = cdsSerieAfterScroll
    Left = 444
    Top = 63
    object cdsSerieID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSerieSERIE: TStringField
      FieldName = 'SERIE'
      Size = 201
    end
  end
  object dsSerie: TDataSource
    DataSet = cdsSerie
    Left = 404
    Top = 63
  end
  object SQLQueryEscola: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select id, nome_escola from escola')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 116
    Top = 63
  end
  object DataSetProviderEscola: TDataSetProvider
    DataSet = SQLQueryEscola
    Left = 84
    Top = 63
  end
  object ClientDataSetEscola: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderEscola'
    AfterScroll = ClientDataSetEscolaAfterScroll
    Left = 52
    Top = 63
    object ClientDataSetEscolaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ClientDataSetEscolaNOME_ESCOLA: TStringField
      FieldName = 'NOME_ESCOLA'
      Size = 500
    end
  end
  object DataSourceEscola: TDataSource
    DataSet = ClientDataSetEscola
    Left = 20
    Top = 63
  end
  object dsAluno: TDataSource
    DataSet = cdsAluno
    Left = 19
    Top = 116
  end
  object cdsAluno: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_turma'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspAluno'
    Left = 51
    Top = 113
    object cdsAlunoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsAlunoNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object cdsAlunoRA: TStringField
      FieldName = 'RA'
      Size = 100
    end
  end
  object dspAluno: TDataSetProvider
    DataSet = sqlAluno
    Left = 83
    Top = 113
  end
  object sqlAluno: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_turma'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select a.id, a.nome, a.ra'
      'from aluno a'
      'where a.id_turma = :id_turma')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 115
    Top = 113
  end
  object sqlPedidoPesquisa: TSQLQuery
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQL.Strings = (
      
        'select P.ID, A.NOME, P.DATA_PEDIDO, P.DATA_VENCTO, P.DATA_ENTREG' +
        ', P.TOTAL_B, P.DESCONTO, P.TOTAL_L, P.ID_ALUNO, T.ID ID_TURMA, E' +
        '.ID ID_ESCOLA, T.ANO_LETIVO, P.OBSERVACAO, P.CPF_CONTATO, P.TELE' +
        'FONE, P.NOME_CONTATO'
      'from PEDIDO P'
      'inner join ALUNO A on (P.ID_ALUNO = A.ID)'
      'inner join TURMA T on (T.ID = A.ID_TURMA)'
      'inner join ESCOLA E on (E.ID = T.ID_ESCOLA)'
      'where ((:COD_ALUNO = -1) or (A.ID = :COD_ALUNO)) and'
      
        '      ((:DATA_INICIO = '#39'1990-01-01'#39') or (P.DATA_PEDIDO between :' +
        'DATA_INICIO and :DATA_FIM))')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 600
    Top = 312
  end
  object dspPedidoPesquisa: TDataSetProvider
    DataSet = sqlPedidoPesquisa
    Left = 600
    Top = 256
  end
  object cdsPedidoPesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedidoPesquisa'
    Left = 600
    Top = 216
    object cdsPedidoPesquisaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPedidoPesquisaNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object cdsPedidoPesquisaDATA_PEDIDO: TDateField
      FieldName = 'DATA_PEDIDO'
    end
    object cdsPedidoPesquisaDATA_VENCTO: TDateField
      FieldName = 'DATA_VENCTO'
    end
    object cdsPedidoPesquisaDATA_ENTREG: TDateField
      FieldName = 'DATA_ENTREG'
    end
    object cdsPedidoPesquisaTOTAL_B: TFMTBCDField
      FieldName = 'TOTAL_B'
      currency = True
      Precision = 18
      Size = 4
    end
    object cdsPedidoPesquisaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 9
      Size = 2
    end
    object cdsPedidoPesquisaTOTAL_L: TFMTBCDField
      FieldName = 'TOTAL_L'
      currency = True
      Precision = 18
      Size = 4
    end
    object cdsPedidoPesquisaID_ALUNO: TIntegerField
      FieldName = 'ID_ALUNO'
      Required = True
    end
    object cdsPedidoPesquisaID_TURMA: TIntegerField
      FieldName = 'ID_TURMA'
      Required = True
    end
    object cdsPedidoPesquisaID_ESCOLA: TIntegerField
      FieldName = 'ID_ESCOLA'
      Required = True
    end
    object cdsPedidoPesquisaANO_LETIVO: TIntegerField
      FieldName = 'ANO_LETIVO'
    end
    object cdsPedidoPesquisaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 4000
    end
    object cdsPedidoPesquisaCPF_CONTATO: TStringField
      FieldName = 'CPF_CONTATO'
      Size = 14
    end
    object cdsPedidoPesquisaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object cdsPedidoPesquisaNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 200
    end
  end
  object dsPedidoPesquisa: TDataSource
    DataSet = cdsPedidoPesquisa
    Left = 600
    Top = 176
  end
  object sqlPedidoItem: TSQLQuery
    MaxBlobSize = -1
    ParamCheck = False
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_PEDIDO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select i.id, i.id_produto, i.descricao_produto, i.valor_produto,' +
        ' i.quantidade, coalesce(i.ind_extra, '#39'N'#39') ind_extra'
      'from pedido_item i'
      'where i.id_pedido = :COD_PEDIDO'
      'order by i.id')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 56
    Top = 328
  end
  object dspPedidoItem: TDataSetProvider
    DataSet = sqlPedidoItem
    Left = 56
    Top = 272
  end
  object cdsPedidoItem: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_PEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPedidoItem'
    Left = 56
    Top = 224
    object cdsPedidoItemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPedidoItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object cdsPedidoItemDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 200
    end
    object cdsPedidoItemVALOR_PRODUTO: TFMTBCDField
      FieldName = 'VALOR_PRODUTO'
      Precision = 18
      Size = 4
    end
    object cdsPedidoItemQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object cdsPedidoItemIND_EXTRA: TStringField
      FieldName = 'IND_EXTRA'
      Size = 1
    end
  end
  object dsPedidoItem: TDataSource
    DataSet = cdsPedidoItem
    Left = 56
    Top = 176
  end
end
