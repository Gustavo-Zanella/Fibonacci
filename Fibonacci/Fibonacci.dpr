program Fibonacci;

uses
  Vcl.Forms,
  unFibonacci in 'unFibonacci.pas' {frmFibonacci};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFibonacci, frmFibonacci);
  Application.Run;
end.
