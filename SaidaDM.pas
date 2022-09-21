unit SaidaDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSaidaDtm = class(TDataModule)
    qrySaida: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Select,From:string;
  end;

var
  SaidaDtm: TSaidaDtm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ConexaoDM;

{$R *.dfm}

procedure TSaidaDtm.DataModuleCreate(Sender: TObject);
begin
  Select:='SELECT s.cod_saida,'+
          ' s.descricao,'+
          ' s.cod_origem,'+
          ' s.data,'+
          ' s.hora,'+
          ' s.valor';
  From:='FROM saida s ';
end;

end.
