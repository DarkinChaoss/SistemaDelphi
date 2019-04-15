unit ModuloItem;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI;

type
  TDataModuleItem = class(TDataModule)
    FDConnection1: TFDConnection;
    driver: TFDPhysPgDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    TableItem: TFDTable;
    QuerySelectAll_item: TFDQuery;
    DataSource1: TDataSource;
    QuerySelectAll_itemcodigo: TIntegerField;
    QuerySelectAll_itemdescricao: TWideStringField;
    QuerySelectAll_itemestoque_atual: TIntegerField;
    QuerySelectAll_itemvalor_custo: TFloatField;
    QuerySelectAll_itemfornecedor: TWideStringField;
    DataItem: TDataSource;
    query: TFDQuery;
    Dataquery: TDataSource;
    Query2: TFDQuery;
    DataQuery2: TDataSource;
    TableFornecedor: TFDTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleItem: TDataModuleItem;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
