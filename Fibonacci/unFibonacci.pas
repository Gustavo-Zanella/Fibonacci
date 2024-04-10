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
  Showmessage('Digite quantidade de sequências que deseja retornar'+#13#10+'(Menor que 91).'+#13#10+'Após isso clique em strat!');
end;

procedure TfrmFibonacci.btnStartClick(Sender: TObject);
Var
  iNum1, iNum2, iMax, iSoma : Int64;
  i : integer;
begin
  mmoResultado.Clear;
  iMax := StrToInt(edtEntrada.Text);

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

end;

procedure TfrmFibonacci.edtEntradaKeyPress(Sender: TObject; var Key: Char);
begin
  //Aceita apenas números
  if not CharInSet(Key, ['0'..'9', #8]) then
    Key := #0;
end;

end.
