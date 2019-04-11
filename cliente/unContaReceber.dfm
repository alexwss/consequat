object frmContaRebecer: TfrmContaRebecer
  Left = 0
  Top = 0
  ActiveControl = PageControl1
  Caption = 'Contas a Receber'
  ClientHeight = 512
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnFIltro: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 185
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 780
      Height = 183
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Pesquisar T'#237'tulo'
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 772
          Height = 155
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
            Top = 104
            Width = 27
            Height = 13
            Caption = 'Aluno'
          end
          object lblNome: TLabel
            Tag = 78
            Left = 16
            Top = 59
            Width = 30
            Height = 13
            Caption = 'Escola'
          end
          object Label4: TLabel
            Left = 417
            Top = 59
            Width = 30
            Height = 13
            Caption = 'Turma'
          end
          object btnPesquisaAbaUm: TButton
            Left = 661
            Top = 119
            Width = 75
            Height = 25
            Caption = '&Pesquisar'
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
            Top = 122
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
            Top = 77
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
            Top = 77
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
            Top = 2
            Width = 286
            Height = 53
            Hint = 
              'Se Desejar Pesquisar por Data de Pedido N'#227'o Ser'#225' Origat'#243'rio  Fil' +
              'trar o Aluno'
            Caption = 'Pesquisa por Data de Vencimento'
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
          object rgStatus: TRadioGroup
            Left = 624
            Top = 2
            Width = 112
            Height = 69
            Caption = 'Pesquisar por Status'
            ItemIndex = 3
            Items.Strings = (
              'Pendente'
              'Liquidado'
              'Cancelado'
              'Todos')
            TabOrder = 6
          end
        end
      end
    end
  end
  object pnControles: TPanel
    Left = 0
    Top = 480
    Width = 782
    Height = 32
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      782
      32)
    object btnBaixa: TButton
      Left = 666
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Selecionar'
      TabOrder = 0
      OnClick = btnBaixaClick
    end
  end
  object pnGrid: TPanel
    Left = 0
    Top = 185
    Width = 782
    Height = 295
    Align = alClient
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 780
      Height = 293
      Align = alClient
      DataSource = dsContasReceber
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'C'#243'd. Tit.'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_PEDIDO'
          Title.Caption = 'C'#243'd. Pedido'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome Aluno'
          Width = 169
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Title.Caption = 'Telefone'
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CONTATO'
          Title.Caption = 'Nome Contato'
          Width = 174
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Caption = 'Valor'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_VENCTO'
          Title.Caption = 'Data Vencimento'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EVENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Title.Caption = 'Evento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Forma de Pagamento'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_LANCAMENTO'
          Title.Caption = 'Data Venda'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBSERVACAO'
          Title.Caption = 'Observa'#231#245'es'
          Width = 1000
          Visible = True
        end>
    end
  end
  object DataSourceEscola: TDataSource
    DataSet = ClientDataSetEscola
    Left = 28
    Top = 63
  end
  object ClientDataSetEscola: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderEscola'
    AfterScroll = ClientDataSetEscolaAfterScroll
    Left = 60
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
  object DataSetProviderEscola: TDataSetProvider
    DataSet = SQLQueryEscola
    Left = 92
    Top = 63
  end
  object SQLQueryEscola: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select id, nome_escola from escola')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 124
    Top = 63
  end
  object dsAluno: TDataSource
    DataSet = cdsAluno
    Left = 27
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
    Left = 59
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
    Left = 91
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
    Left = 123
    Top = 113
  end
  object dsSerie: TDataSource
    DataSet = cdsSerie
    Left = 412
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
    Left = 452
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
  object dspSerie: TDataSetProvider
    DataSet = sqlSerie
    Left = 484
    Top = 63
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
    Left = 516
    Top = 63
  end
  object sqlContasReceber: TSQLQuery
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQL.Strings = (
      
        'select T.ID, T.ID_PEDIDO, A.NOME, P.TELEFONE, P.NOME_CONTATO , T' +
        '.VALOR, T.DATA_LANCAMENTO, P.DATA_VENCTO, T.EVENTO, T.OBSERVACAO' +
        ', T.ID_FORMA_PAGTO,'
      '       F.DESCRICAO'
      '  from TITULO T'
      ' inner join PEDIDO P on (T.ID_PEDIDO = P.ID)'
      ' inner join ALUNO A on (P.ID_ALUNO = A.ID)'
      ' inner join FORMA_PAGAMENTO F on (T.ID_FORMA_PAGTO = F.ID)'
      ' where 1 = 1')
    SQLConnection = frmPrincipal.SQLConnection1
    Left = 684
    Top = 375
  end
  object dspContasReceber: TDataSetProvider
    DataSet = sqlContasReceber
    Left = 683
    Top = 336
  end
  object cdsContasReceber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContasReceber'
    Left = 685
    Top = 288
    object cdsContasReceberID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsContasReceberID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
    object cdsContasReceberVALOR: TSingleField
      Alignment = taLeftJustify
      FieldName = 'VALOR'
      currency = True
    end
    object cdsContasReceberDATA_LANCAMENTO: TDateField
      FieldName = 'DATA_LANCAMENTO'
    end
    object cdsContasReceberDATA_VENCTO: TDateField
      FieldName = 'DATA_VENCTO'
    end
    object cdsContasReceberEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 10
    end
    object cdsContasReceberOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 4000
    end
    object cdsContasReceberID_FORMA_PAGTO: TIntegerField
      FieldName = 'ID_FORMA_PAGTO'
    end
    object cdsContasReceberDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsContasReceberNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object cdsContasReceberTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object cdsContasReceberNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 200
    end
  end
  object dsContasReceber: TDataSource
    DataSet = cdsContasReceber
    Left = 688
    Top = 240
  end
end
