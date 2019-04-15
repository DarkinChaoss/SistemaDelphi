unit formlogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmlogin = class(TForm)
    Imgback: TImage;
    Panel1: TPanel;
    EdtPass: TEdit;
    Panel2: TPanel;
    EdtUser: TEdit;
    btnLogin: TSpeedButton;
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmlogin: TFrmlogin;

implementation

{$R *.dfm}

uses MenuPrinciapl;

procedure TFrmlogin.btnLoginClick(Sender: TObject);
begin

FrmPrincipal := TFrmPrincipal.Create(self);
FrmPrincipal.ShowModal;
Frmlogin.Close;

end;

end.
