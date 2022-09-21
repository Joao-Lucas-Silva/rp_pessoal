object ExtratoFrm: TExtratoFrm
  Left = 0
  Top = 0
  Caption = 'EXTRATO'
  ClientHeight = 277
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 10
    Width = 311
    Height = 215
    BevelOuter = bvNone
    Color = clRed
    ParentBackground = False
    TabOrder = 0
    object grdSaida: TDBGrid
      Left = 1
      Top = 1
      Width = 309
      Height = 213
      DataSource = dtsSaida
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'data'
          Title.Alignment = taCenter
          Width = 121
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hora'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          Title.Alignment = taRightJustify
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 325
    Top = 9
    Width = 309
    Height = 216
    BevelOuter = bvNone
    Color = clGreen
    ParentBackground = False
    TabOrder = 1
    object grdEntrada: TDBGrid
      Left = 1
      Top = 1
      Width = 307
      Height = 214
      DataSource = dtsEntrada
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'data'
          Title.Alignment = taCenter
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hora'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          Title.Alignment = taRightJustify
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 236
    Width = 646
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    ExplicitLeft = 192
    ExplicitTop = 248
    ExplicitWidth = 185
    object lblTituloSaldo: TLabel
      Left = 462
      Top = 16
      Width = 100
      Height = 19
      Caption = 'Saldo Atual:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSaldo: TLabel
      Left = 571
      Top = 16
      Width = 62
      Height = 19
      Alignment = taRightJustify
      Caption = 'R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dtsSaida: TDataSource
    DataSet = qrySaida
    Left = 8
    Top = 65530
  end
  object dtsEntrada: TDataSource
    DataSet = qryEntrada
    Left = 328
    Top = 65530
  end
  object qrySaida: TFDQuery
    Connection = ConexaoDtm.Conexao
    SQL.Strings = (
      'SELECT s.cod_saida, '
      '       s.data, '
      '       s.hora, '
      '       s.valor '
      'FROM saida s')
    Left = 40
    Top = 65530
    object qrySaidacod_saida: TFDAutoIncField
      FieldName = 'cod_saida'
      Origin = 'cod_saida'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrySaidadata: TDateField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      DisplayLabel = 'DATA'
      FieldName = 'data'
      Origin = '`data`'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qrySaidahora: TTimeField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      DisplayLabel = 'HORA'
      FieldName = 'hora'
      Origin = 'hora'
      DisplayFormat = '00:00'
    end
    object qrySaidavalor: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'VALOR'
      FieldName = 'valor'
      Origin = 'valor'
      DisplayFormat = '#,##0.00'
      Precision = 12
      Size = 2
    end
  end
  object qryEntrada: TFDQuery
    Connection = ConexaoDtm.Conexao
    SQL.Strings = (
      'SELECT e.cod_entrada,'
      '       e.data, '
      '       e.hora, '
      '       e.valor'
      'FROM entrada e')
    Left = 368
    Top = 65530
    object qryEntradacod_entrada: TFDAutoIncField
      FieldName = 'cod_entrada'
      Origin = 'cod_entrada'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryEntradadata: TDateField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      DisplayLabel = 'DATA'
      FieldName = 'data'
      Origin = '`data`'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object qryEntradahora: TTimeField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      DisplayLabel = 'HORA'
      FieldName = 'hora'
      Origin = 'hora'
      DisplayFormat = 'hh:mm'
    end
    object qryEntradavalor: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'VALOR'
      FieldName = 'valor'
      Origin = 'valor'
      DisplayFormat = '#,##0.00'
      Precision = 12
      Size = 2
    end
  end
  object qrySaldo: TFDQuery
    Connection = ConexaoDtm.Conexao
    SQL.Strings = (
      'SELECT c.controle, '
      '       c.saldo '
      'FROM conta_corrente c')
    Left = 608
  end
end
