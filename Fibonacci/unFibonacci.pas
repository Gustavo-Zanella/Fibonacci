unit unFibonacci;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmFibonacci = class(TForm)
    edtEntrada: TEdit;
    mmoResultado: TMemo;
    btnStart: TButton;
    btnInstrucao: TBitBtn;
    procedure edtEntradaKeyPress(Sender: TObject; var Key: Char);
    procedure btnInstrucaoClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFibonacci: TfrmFibonacci;

implementation

{$R *.dfm}

procedure TfrmFibonacci.btnInstrucaoClick(Sender: TObject);
begin
  //Exibe informações na tela
  Showmessage('Digite quantidade de sequências que deseja retornar'+#13#10+'(Menor que 91).'+#13#10+'Após isso clique em start!');
end;

procedure TfrmFibonacci.btnStartClick(Sender: TObject);
Var
  iNum1, iNum2, iMax, iSoma : Int64;
  i : integer;
  sEdtEntrada : string;
begin
  sEdtEntrada := edtEntrada.Text;
  mmoResultado.Clear;
  if sEdtEntrada = '' then
  begin
    ShowMessage('Valor Inválido!');
    edtEntrada.SetFocus;
    exit;
  end;

  iMax := StrToInt(sEdtEntrada);

  if iMax > 90 then
  begin
    Showmessage('Valor muito alto, escreva uma valor menor');
    edtEntrada.Clear;
    edtEntrada.SetFocus;
    exit;
  end;

  iNum1 := 0;
  iNum2 := 1;
  //Preencher Memo
  for i := 1 to iMax do
  begin
    iSoma := iNum1 + iNum2;
    mmoResultado.Lines.Add(IntToStr(iSoma));
    iNum1 := iNum2;
    iNum2 := iSoma;
  end;

  edtEntrada.Clear;
end;

procedure TfrmFibonacci.edtEntradaKeyPress(Sender: TObject; var Key: Char);
begin
  // Permite apenas dois números
  if not (CharInSet(Key, ['0'..'9', #8]) and (Length(edtEntrada.Text) < 2)) then
  begin
    if not (Key = #8) then
      Key := #0;
  end;
end;



end.
