unit Modulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.PG, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    driver: TFDPhysPgDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    TableColaborador: TFDTable;
    DsColaborador: TDataSource;
    TableColaboradorid: TIntegerField;
    TableColaboradornome: TWideStringField;
    TableColaboradorcpf: TWideStringField;
    TableColaboradoremail: TWideStringField;
    TableColaboradortelefone: TWideStringField;
    TableColaboradorendereco: TWideStringField;
    TableColaboradorcargo: TIntegerField;
    TableCargo: TFDTable;
    DsCargo: TDataSource;
    TableCargoid: TIntegerField;
    TableCargodescricao: TWideStringField;
    Query: TFDQuery;
    DataSource1: TDataSource;
    QuerySelectAll: TFDQuery;
    DataSelectAllColaborador: TDataSource;
    QueryUpdateColaborador: TFDQuery;
    QuerySelectAllcodigo: TIntegerField;
    QuerySelectAllnome: TWideStringField;
    QuerySelectAllcpf: TWideStringField;
    QuerySelectAllemail: TWideStringField;
    QuerySelectAllendereco: TWideStringField;
    QuerySelectAlldescricao: TWideStringField;
    QueryDeleteColaborador: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
   with FDConnection1 do
   begin
     Params.Database := 'Restaurante';
     Params.UserName := 'postgres';
     Params.Password := 'ellsisayss';

     Driver.VendorLib := GetCurrentDir + '\lib\libpq.dll';
     Connected := true;

   end;


end;

end.
