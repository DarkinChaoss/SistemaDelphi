program Sistema;

uses
  Vcl.Forms,
  SistemaRestaurante in 'SistemaRestaurante.pas' {Login};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLogin, Login);
  Application.Run;
end.
