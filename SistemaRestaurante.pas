unit SistemaRestaurante;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TLogin = class(TForm)
    Imgback: TImage;
    Panel1: TPanel;
    EdtPass: TEdit;
    Panel2: TPanel;
    EdtUser: TEdit;
    btnLogin: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Login: TLogin;

implementation

{$R *.dfm}

end.
