object ConexaoDtm: TConexaoDtm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=rp_pessoal'
      'User_Name=user'
      'Password=snhrp'
      'Port=3307'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 104
    Top = 72
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\rp_pessoal\EXE\libmysql.dll'
    Left = 96
    Top = 16
  end
  object cmd: TFDCommand
    Connection = Conexao
    Left = 40
    Top = 72
  end
end
