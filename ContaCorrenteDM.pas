unit ContaCorrenteDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TContaCorrenteDtm = class(TDataModule)
    qryContaCorrente: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Select,From:string;
  end;

var
  ContaCorrenteDtm: TContaCorrenteDtm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ConexaoDM;

{$R *.dfm}

procedure TContaCorrenteDtm.DataModuleCreate(Sender: TObject);
begin
  Select:='SELECT c.controle, c.saldo ';
  From:='FROM conta_corrente c ';
end;

end.
