unit ModuloFornecedor;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI;

type
  TDataModuloForne = class(TDataModule)
    FDConnection1: TFDConnection;
    driver: TFDPhysPgDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    TableFornecedor: TFDTable;
    DataFonrcedor: TDataSource;
    QueryAllFornecedor: TFDQuery;
    DataAllF: TDataSource;
    query: TFDQuery;
    DataQuery: TDataSource;
    QueryAllFornecedorid: TIntegerField;
    QueryAllFornecedorrazao: TWideStringField;
    QueryAllFornecedoremail: TWideStringField;
    QueryAllFornecedortelefone: TWideStringField;
    queryid: TIntegerField;
    queryrazao: TWideStringField;
    querycnpj: TWideStringField;
    queryemail: TWideStringField;
    querytelefone: TWideStringField;
    QueryUpdateforn: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuloForne: TDataModuloForne;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
