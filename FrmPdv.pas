unit FrmPdv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Buttons;

type
  TFormPdv = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    SearchBox2: TSearchBox;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    Edit1: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPdv: TFormPdv;

implementation

{$R *.dfm}

end.
