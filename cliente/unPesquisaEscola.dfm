object frmLocalizarEscola: TfrmLocalizarEscola
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Localizar Escola'
  ClientHeight = 377
  ClientWidth = 790
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
    Left = 8
    Top = 27
    Width = 64
    Height = 13
    Caption = 'Localizar por:'
  end
  object Edit1: TEdit
    Left = 78
    Top = 24
    Width = 611
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnEnter = Edit1Enter
  end
  object btnLocalizar: TButton
    Left = 698
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Procurar'
    Enabled = False
    TabOrder = 1
    OnClick = btnLocalizarClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 64
    Width = 765
    Height = 241
    DataSource = frmEscola.DataSource1
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
        FieldName = 'NOME_ESCOLA'
        Title.Caption = 'Nome Escola'
        Width = 500
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Title.Caption = 'Endere'#231'o'
        Width = 500
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Title.Caption = 'N'#250'mero'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Title.Caption = 'Telefone'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Title.Caption = 'Email'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CELULAR'
        Title.Caption = 'Celular'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ'
        Title.Caption = 'Cnpj'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACAO'
        Title.Caption = 'Observa'#231#227'o'
        Width = 400
        Visible = True
      end>
  end
  object btnSelecionar: TButton
    Left = 698
    Top = 319
    Width = 75
    Height = 25
    Caption = 'Selecionar'
    Enabled = False
    TabOrder = 3
    OnClick = btnSelecionarClick
  end
  object btnCancelar: TButton
    Left = 602
    Top = 319
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 358
    Width = 790
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = True
  end
end
