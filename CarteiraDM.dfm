object CarteiraDtm: TCarteiraDtm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 199
  Width = 256
  object qryCarteira: TFDQuery
    Connection = ConexaoDtm.Conexao
    SQL.Strings = (
      'SELECT c.cod_carteira,'
      '       c.nome_carteira,'
      '       c.dt_cadastro'
      'FROM carteira c'
      'LIMIT 0')
    Left = 112
    Top = 80
    object qryCarteiracod_carteira: TFDAutoIncField
      Alignment = taCenter
      DisplayLabel = 'C'#211'DIGO'
      FieldName = 'cod_carteira'
      Origin = 'cod_carteira'
      ProviderFlags = [pfInWhere, pfInKey]
      DisplayFormat = '000'
    end
    object qryCarteiranome_carteira: TStringField
      DisplayLabel = 'NOME CARTEIRA'
      FieldName = 'nome_carteira'
      Origin = 'nome_carteira'
      Size = 45
    end
    object qryCarteiradt_cadastro: TDateField
      FieldName = 'dt_cadastro'
      Origin = 'dt_cadastro'
    end
  end
end
