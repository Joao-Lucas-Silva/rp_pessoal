unit ConexaoDM;

interface

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf;

type
  TConexaoDtm = class(TDataModule)
    Conexao: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    cmd: TFDCommand;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CriarTabelas();
  public
    { Public declarations }
  end;

var
  ConexaoDtm: TConexaoDtm;

implementation

uses
  Vcl.Forms, System.SysUtils, Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TConexaoDtm.CriarTabelas;
var
  Database:string;
begin
  Database:=Conexao.Params.Database;

  //Tabela Conta Correte
  cmd.CommandText.Add('CREATE TABLE if not exists `'+Database+'`.`conta_corrente` ('+
  '`controle` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,'+
  '`saldo` DECIMAL(12,2),'+
  'PRIMARY KEY(`controle`)'+
  ')'+
  'ENGINE = InnoDB;');
  cmd.Execute();

  //Tabela Entrada
  cmd.CommandText.Clear;
  cmd.CommandText.Add('CREATE TABLE if not exists `'+Database+'`.`entrada` ('+
  '`cod_entrada` INTEGER unsigned NOT NULL AUTO_INCREMENT,'+
  '`descricao` varchar(50) DEFAULT NULL,'+
  '`cod_origem` INTEGER unsigned DEFAULT NULL,'+
  '`data` date DEFAULT NULL,'+
  '`hora` time DEFAULT NULL,'+
  '`valor` decimal(12,2) DEFAULT NULL,'+
  'PRIMARY KEY (`cod_entrada`)'+
  ') ENGINE=InnoDB DEFAULT CHARSET=latin1;');
  cmd.Execute();

  //Tabela Saida
  cmd.CommandText.Clear;
  cmd.CommandText.Add('CREATE TABLE if not exists `'+Database+'`.`saida` ('+
  '`cod_saida` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,'+
  '`descricao` VARCHAR(45),'+
  '`cod_origem` INTEGER UNSIGNED,'+
  '`data` DATE,'+
  '`hora` TIME,'+
  '`valor` DECIMAL(12,2),'+
  'PRIMARY KEY(`cod_saida`)'+
  ')'+
  'ENGINE = InnoDB;');
  cmd.Execute();

  //Tabela Carteira
  cmd.CommandText.Clear;
  cmd.CommandText.Add('CREATE TABLE if not exists `'+Database+'`.`carteira` ('+
  '`cod_carteira` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,'+
  '`nome_carteira` VARCHAR(45),'+
  '`dt_cadastro` DATE,'+
  'PRIMARY KEY(`cod_carteira`)'+
  ')'+
  'ENGINE = InnoDB;');
  cmd.Execute();
end;

procedure TConexaoDtm.DataModuleCreate(Sender: TObject);
begin
  FDPhysMySQLDriverLink1.VendorLib:='';
  FDPhysMySQLDriverLink1.VendorLib:=ExtractFilePath(Application.ExeName)+'libmysql.dll';
  CriarTabelas();
end;

end.
