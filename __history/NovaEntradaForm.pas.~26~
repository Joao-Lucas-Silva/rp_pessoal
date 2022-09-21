unit NovaEntradaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList, Vcl.Buttons;

type
  TNovaEntradaFrm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    edtValor: TButtonedEdit;
    cmbOrigem: TComboBox;
    mmDescricao: TMemo;
    Label2: TLabel;
    btnSair: TSpeedButton;
    ActionList1: TActionList;
    ImageList1: TImageList;
    actConfirmar: TAction;
    actSair: TAction;
    btnConfirma: TSpeedButton;
    procedure actSairExecute(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actConfirmarExecute(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NovaEntradaFrm: TNovaEntradaFrm;

implementation

{$R *.dfm}

uses EntradaDM, FerramentasForm, PrincipalForm;

procedure TNovaEntradaFrm.actConfirmarExecute(Sender: TObject);
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
    with (EntradaDtm) do
    begin
      qryEntrada.Close;
      qryEntrada.SQL.Clear;
      qryEntrada.SQL.Add(EntradaDtm.Select);
      qryEntrada.SQL.Add(EntradaDtm.From);
      qryEntrada.Open();

      qryEntrada.Append;
      qryEntrada.FieldByName('valor').AsFloat:=Valor;
      qryEntrada.FieldByName('cod_origem').AsInteger:=Origem;
      qryEntrada.FieldByName('descricao').AsString:=Descricao;
      qryEntrada.FieldByName('data').AsDateTime:=now;
      qryEntrada.FieldByName('hora').AsDateTime:=now;
      try
        qryEntrada.Post;
        Close;
      except
        on e:exception do
          FerramentasFrm.MsgPadrao(PChar('ERRO: '+E.Message),'ERRO',2);
      end;
    end;
  end;
end;

procedure TNovaEntradaFrm.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TNovaEntradaFrm.edtValorExit(Sender: TObject);
begin
  edtValor.Text:=FormatFloat('#,##0.00',StrToIntDef(edtValor.Text,0));
end;

procedure TNovaEntradaFrm.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Perform(Wm_NextDlgCtl,0,0);
    Key:=#0;
  end;
end;

procedure TNovaEntradaFrm.FormActivate(Sender: TObject);
var
  lOrigemEntrada:TStringList;
  i:integer;
begin
  if (FileExists(PrincipalFrm.Caminho+'origens_entrada.txt')) then
  begin
    lOrigemEntrada:=TStringList.Create;
    lOrigemEntrada.LoadFromFile(PrincipalFrm.Caminho+'origens_entrada.txt');
    for i := 0 to lOrigemEntrada.Count-1 do
      cmbOrigem.Items.Add(lOrigemEntrada.Strings[i]);
  end;
end;

procedure TNovaEntradaFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(EntradaDtm);
end;

procedure TNovaEntradaFrm.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TEntradaDtm,EntradaDtm);
end;

end.
