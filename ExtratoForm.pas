unit ExtratoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TExtratoFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    grdSaida: TDBGrid;
    grdEntrada: TDBGrid;
    Panel3: TPanel;
    lblTituloSaldo: TLabel;
    lblSaldo: TLabel;
    dtsSaida: TDataSource;
    dtsEntrada: TDataSource;
    qrySaida: TFDQuery;
    qryEntrada: TFDQuery;
    qrySaidavalor: TBCDField;
    qrySaidacod_saida: TFDAutoIncField;
    qrySaidadata: TDateField;
    qrySaidahora: TTimeField;
    qryEntradacod_entrada: TFDAutoIncField;
    qryEntradadata: TDateField;
    qryEntradahora: TTimeField;
    qryEntradavalor: TBCDField;
    qrySaldo: TFDQuery;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExtratoFrm: TExtratoFrm;

implementation

{$R *.dfm}

uses ConexaoDM;

procedure TExtratoFrm.FormActivate(Sender: TObject);
begin
  qrySaida.Close;
  qrySaida.Open();

  qryEntrada.Close;
  qryEntrada.Open();

  qrySaldo.Close;
  qrySaldo.Open();

  lblSaldo.Caption:='R$ '+FormatFloat('#,##0.00',qrySaldo.FieldByName('saldo').AsFloat);
  if (qrySaldo.FieldByName('saldo').AsFloat<0) then
    lblSaldo.Font.Color:=clRed;
  lblTituloSaldo.Left:=lblSaldo.Left-(lblTituloSaldo.Width+10);
end;

end.
