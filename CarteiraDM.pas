unit CarteiraDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCarteiraDtm = class(TDataModule)
    qryCarteira: TFDQuery;
    qryCarteiracod_carteira: TFDAutoIncField;
    qryCarteiranome_carteira: TStringField;
    qryCarteiradt_cadastro: TDateField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Select,From:string;
  end;

var
  CarteiraDtm: TCarteiraDtm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ConexaoDM;

{$R *.dfm}

procedure TCarteiraDtm.DataModuleCreate(Sender: TObject);
begin
  Select:='SELECT c.cod_carteira,'+
          ' c.nome_carteira,'+
          ' c.dt_cadastro';
  From:='FROM carteira c ';
end;

end.