unit NovaSaidaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TNovaSaidaFrm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    btnSair: TSpeedButton;
    btnConfirma: TSpeedButton;
    edtValor: TButtonedEdit;
    cmbOrigem: TComboBox;
    mmDescricao: TMemo;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actConfirmar: TAction;
    actSair: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actConfirmarExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NovaSaidaFrm: TNovaSaidaFrm;

implementation

{$R *.dfm}

uses SaidaDM, FerramentasForm, PrincipalForm;

procedure TNovaSaidaFrm.actConfirmarExecute(Sender: TObject);
var
  Valor:double;
  Descricao:String;
  Origem:integer;
begin
  Valor:=0;
  Origem:=0;
  Descricao:='';

  Valor:=StrToFloatDef(StringReplace(StringReplace(edtValor.Text,'.','',[rfReplaceAll]),' ','',[rfReplaceAll]),0);
  if (cmbOrigem.ItemIndex>=0) then
    Origem:=cmbOrigem.ItemIndex+1;
  Descricao:=mmDescricao.Lines.Strings[0];

  if (Valor=0) or
     (Origem=0) then
    FerramentasFrm.MsgPadrao('VALOR E ORIGEM DEVEM SER PREENCHIDOS','CAMPOS OBRIGATÓRIOS',1)
  else
  begin
    with (SaidaDtm) do
    begin
      qrySaida.Close;
      qrySaida.SQL.Clear;
      qrySaida.SQL.Add(SaidaDtm.Select);
      qrySaida.SQL.Add(SaidaDtm.From);
      qrySaida.Open();

      qrySaida.Append;
      qrySaida.FieldByName('valor').AsFloat:=Valor;
      qrySaida.FieldByName('cod_origem').AsInteger:=Origem;
      qrySaida.FieldByName('descricao').AsString:=Descricao;
      qrySaida.FieldByName('data').AsDateTime:=now;
      qrySaida.FieldByName('hora').AsDateTime:=now;
      try
        qrySaida.Post;
        Close;
      except
        on e:exception do
          FerramentasFrm.MsgPadrao(PChar('ERRO: '+E.Message),'ERRO',2);
      end;
    end;
  end;
end;

procedure TNovaSaidaFrm.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TNovaSaidaFrm.edtValorExit(Sender: TObject);
begin
  edtValor.Text:=FormatFloat('#,##0.00',StrToIntDef(edtValor.Text,0));
end;


procedure TNovaSaidaFrm.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Perform(Wm_NextDlgCtl,0,0);
    Key:=#0;
  end;
end;

procedure TNovaSaidaFrm.FormActivate(Sender: TObject);
var
  lOrigemSaida:TStringList;
  i:integer;
begin
  if (FileExists(PrincipalFrm.Caminho+'origens_entrada.txt')) then
  begin
    lOrigemSaida:=TStringList.Create;
    lOrigemSaida.LoadFromFile(PrincipalFrm.Caminho+'origens_saida.txt');
    for i := 0 to lOrigemSaida.Count-1 do
      cmbOrigem.Items.Add(lOrigemSaida.Strings[i]);
  end;
end;

procedure TNovaSaidaFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(SaidaDtm);
end;

procedure TNovaSaidaFrm.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TSaidaDtm,SaidaDtm);
end;

end.
