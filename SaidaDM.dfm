object SaidaDtm: TSaidaDtm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object qrySaida: TFDQuery
    Connection = ConexaoDtm.Conexao
    Left = 64
    Top = 56
  end
end
