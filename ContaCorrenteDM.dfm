object ContaCorrenteDtm: TContaCorrenteDtm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object qryContaCorrente: TFDQuery
    Connection = ConexaoDtm.Conexao
    Left = 88
    Top = 48
  end
end
