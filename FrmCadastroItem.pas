unit FrmCadastroItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.Mask;

type
  TFrmItem = class(TForm)
    RbNome: TRadioButton;
    RbCpf: TRadioButton;
    EdtBuscarNome: TEdit;
    EdtDesc: TEdit;
    EdtVlr: TEdit;
    CbFornecedor: TComboBox;
    Image1: TImage;
    Descri��o: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BtnNovo: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    BtnEditar: TSpeedButton;
    EdtEstoqueA: TEdit;
    EdtCusto: TEdit;
    Label8: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    BtnCancelar: TSpeedButton;
    Label10: TLabel;
    DBGrid1: TDBGrid;
    EdtId: TEdit;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure habilitarCampos;
    procedure desabilitarCampos;
    procedure updateItem;
  end;

var
  FrmItem: TFrmItem;

implementation

{$R *.dfm}

uses ModuloItem, FrmCadastroFornecedor, ModuloFornecedor;




procedure LimparCampos();
begin

  with FrmItem do
  begin
    EdtDesc.Text := '';
    EdtCusto.Text := '';
    EdtVlr.Text := '';
    EdtEstoqueA.Text :='';

  end;

end;
procedure TFrmItem.BtnCancelarClick(Sender: TObject);
begin
desabilitarCampos;
BtnSalvar.Enabled :=false;
BtnCancelar.Enabled :=false;
BtnNovo.Enabled :=true;
DBGrid1.Enabled :=true;
end;

procedure TFrmItem.BtnEditarClick(Sender: TObject);
begin
updateItem;
end;

procedure TFrmItem.BtnExcluirClick(Sender: TObject);
begin
DataModuleItem.query.Close;
DataModuleItem.query.SQL.Clear;
DataModuleItem.query.SQL.Add('delete from item where id=:iditem');
DataModuleItem.query.ParamByName('iditem').AsInteger := StrToInt(EdtId.Text);
DataModuleItem.query.ExecSQL;
ShowMessage('Produto deletado com sucesso');
DataModuleItem.QuerySelectAll_item.Open;
DataModuleItem.QuerySelectAll_item.Active := false;
DataModuleItem.QuerySelectAll_item.Active := true;
desabilitarCampos;
LimparCampos;
BtnEditar.Enabled :=false;
BtnExcluir.Enabled :=false;
BtnNovo.Enabled :=true;
DBGrid1.Enabled :=true;
BtnCancelar.Enabled :=false;
end;

procedure TFrmItem.BtnNovoClick(Sender: TObject);

begin
  habilitarCampos;
  BtnSalvar.Enabled := true;
  BtnCancelar.Enabled :=true;
  DataModuleItem.TableItem.Insert;
end;

procedure TFrmItem.BtnSalvarClick(Sender: TObject);
begin

DataModuleItem.TableItem.FieldByName('descricao').Value := EdtDesc.Text;
DataModuleItem.TableItem.FieldByName('estoque_atual').Value := StrToInt(EdtEstoqueA.Text);
DataModuleItem.TableItem.FieldByName('valor_custo').Value := StrToFloat(EdtCusto.Text);
DataModuleItem.TableItem.FieldByName('valor_venda').Value := StrToFloat(EdtVlr.Text);

DataModuleItem.query.close;
DataModuleItem.query.SQL.Clear;
DataModuleItem.query.SQL.add('select id  from fornecedor where razao =:cbrazao');
DataModuleItem.query.ParamByName('cbrazao').AsString := CbFornecedor.Text;
DataModuleItem.query.Open;
DataModuleItem.TableItem.FieldByName('fornecedor').Value := StrToInt(DataModuleItem.query['id']);
DataModuleItem.TableItem.Post;
DataModuleItem.QuerySelectAll_item.Open;
DataModuleItem.QuerySelectAll_item.Active :=false;
DataModuleItem.QuerySelectAll_item.Active :=true;
desabilitarCampos;
BtnSalvar.Enabled :=false;
BtnCancelar.Enabled :=false;
BtnNovo.Enabled :=True;
ShowMessage('Produto cadastrado com sucesso');
end;


procedure TFrmItem.DBGrid1CellClick(Column: TColumn);
var texto:string;
begin
    texto := DBGrid1.Fields[0].AsString;
    DataModuleItem.Query.Close;
    DataModuleItem.Query.SQL.Clear;
    DataModuleItem.Query.SQL.Add('select * from item');
    DataModuleItem.Query.SQL.Add('where id='+texto);
    DataModuleItem.Query.Open;

    habilitarCampos;
    DBGrid1.Enabled :=false;
    EdtId.Text :=DataModuleItem.Query['id'];

    if DataModuleItem.Query['descricao'] <> null then
    begin
      EdtDesc.Text := DataModuleItem.Query['descricao'];
    end;

    if DataModuleItem.Query['valor_custo'] <> null then
    begin
      EdtCusto.Text := DataModuleItem.Query['valor_custo'];
    end;

    if DataModuleItem.Query['valor_venda'] <> null then
    begin
      EdtVlr.Text := DataModuleItem.Query['valor_venda'];
    end;

    if DataModuleItem.Query['estoque_atual'] <> null then
    begin
      EdtEstoqueA.Text := DataModuleItem.Query['estoque_atual'];
    end;

    DataModuleItem.Query2.Close;
    DataModuleItem.Query2.SQL.Clear;
    DataModuleItem.Query2.Close;
    DataModuleItem.Query2.SQL.Add('select razao from fornecedor where id =:idforn');
    DataModuleItem.Query2.ParamByName('idforn').AsInteger := StrToInt(DataModuleItem.Query['fornecedor']);
    DataModuleItem.Query2.Open;

    if DataModuleItem.Query2['razao'] <> null then
    begin
      CbFornecedor.Text := DataModuleItem.Query2['razao'];
    end;

    BtnNovo.Enabled := false;
    BtnEditar.Enabled :=true;
    BtnCancelar.Enabled := true;
    BtnExcluir.Enabled :=true;

end;

procedure TFrmItem.desabilitarCampos;
begin
         EdtDesc.Color := cl3DDkShadow;;
         EdtCusto.Color := cl3DDkShadow;
         EdtVlr.Color := cl3DDkShadow;;
         EdtEstoqueA.Color := cl3DDkShadow;
         CbFornecedor.Color := cl3DDkShadow;

         EdtDesc.Enabled := false;
         EdtCusto.Enabled := false;
         EdtVlr.Enabled := false;
         EdtEstoqueA.Enabled := false;
         CbFornecedor.Enabled :=false;

         EdtDesc.text := '';
         EdtCusto.text := '';
         EdtVlr.text := '';
         EdtEstoqueA.text := '';
         CbFornecedor.Text :='';
end;

procedure TFrmItem.FormShow(Sender: TObject);
begin
   With DataModuleItem.TableFornecedor do begin
     while not Eof do
     begin
       CbFornecedor.Items.Add(FieldByName('razao').AsString);
       next;
     end;

   end;


end;

procedure TFrmItem.habilitarCampos;
begin
         EdtDesc.Enabled := true;
         EdtCusto.Enabled := true;
         EdtVlr.Enabled := true;
         EdtEstoqueA.Enabled := true;
         CbFornecedor.Enabled :=true;

         EdtDesc.Color := clWindow;
         EdtCusto.Color := clWindow;
         EdtVlr.Color := clWindow;
         EdtEstoqueA.Color := clWindow;
         CbFornecedor.Color := clWindow;
end;

procedure TFrmItem.updateItem;
begin

DataModuleItem.query.Close;
DataModuleItem.query.SQL.Clear;
DataModuleItem.query.sql.Add('update item set descricao=:EdtDesc,estoque_atual=:EdtEst,valor_custo=:edtCusto'+
',valor_venda=:edtvlr,fornecedor =:idforn where id=:iditem');

DataModuleItem.query.ParamByName('EdtDesc').AsString := EdtDesc.Text;
DataModuleItem.query.ParamByName('EdtEst').AsInteger := StrToInt(EdtEstoqueA.Text);
DataModuleItem.query.ParamByName('edtCusto').AsFloat := StrToFloat(EdtCusto.Text);
DataModuleItem.query.ParamByName('edtvlr').AsFloat := StrToFloat(EdtVlr.Text);

DataModuleItem.query2.Close;
DataModuleItem.query2.sql.Clear;
DataModuleItem.query2.sql.Add('select id from fornecedor where razao=:cbrazao');
DataModuleItem.query2.ParamByName('cbrazao').AsString := CbFornecedor.Text;
DataModuleItem.query2.Open;

DataModuleItem.query.ParamByName('idforn').AsInteger :=StrToInt(DataModuleItem.query2['id']);
DataModuleItem.query.ParamByName('iditem').AsInteger := StrToInt(EdtId.Text);
DataModuleItem.query.ExecSQL;
ShowMessage('Produto editado com sucesso');
LimparCampos;
desabilitarCampos;
DataModuleItem.QuerySelectAll_item.Open;
DataModuleItem.TableItem.Open;
DataModuleItem.QuerySelectAll_item.Active:=false;
DataModuleItem.QuerySelectAll_item.Active:=true;
BtnCancelar.Enabled :=false;
BtnSalvar.Enabled :=false;
BtnNovo.Enabled:= true;
DBGrid1.Enabled :=true;

 end;

end.
