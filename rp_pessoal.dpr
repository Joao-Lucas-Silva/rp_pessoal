program rp_pessoal;

uses
  Vcl.Forms,
  PrincipalForm in 'PrincipalForm.pas' {PrincipalFrm},
  ConexaoDM in 'ConexaoDM.pas' {ConexaoDtm: TDataModule},
  ContaCorrenteDM in 'ContaCorrenteDM.pas' {ContaCorrenteDtm: TDataModule},
  EntradaDM in 'EntradaDM.pas' {EntradaDtm: TDataModule},
  SaidaDM in 'SaidaDM.pas' {SaidaDtm: TDataModule},
  NovaEntradaForm in 'NovaEntradaForm.pas' {NovaEntradaFrm},
  FerramentasForm in 'FerramentasForm.pas' {FerramentasFrm},
  MsgPadraoForm in 'MsgPadraoForm.pas' {MsgPadraoFrm},
  NovaSaidaForm in 'NovaSaidaForm.pas' {NovaSaidaFrm},
  ConexaoForm in 'ConexaoForm.pas' {ConexaoFrm},
  ConfiguracoesForm in 'ConfiguracoesForm.pas' {ConfiguracoesFrm},
  ExtratoForm in 'ExtratoForm.pas' {ExtratoFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TConexaoDtm, ConexaoDtm);
  Application.CreateForm(TPrincipalFrm, PrincipalFrm);
  Application.CreateForm(TFerramentasFrm, FerramentasFrm);
  Application.CreateForm(TConfiguracoesFrm, ConfiguracoesFrm);
  Application.CreateForm(TExtratoFrm, ExtratoFrm);
  Application.Run;
end.
