{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit FrmCadastroColaborador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.Mask,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmColaborador = class(TForm)
    RbNome: TRadioButton;
    RbCpf: TRadioButton;
    EdtBuscarNome: TEdit;
    EdtNome: TEdit;
    EdtEnder: TEdit;
    EdtEmail: TEdit;
    DBGrid1: TDBGrid;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BtnNovo: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    BtnEditar: TSpeedButton;
    EdtCpf2: TMaskEdit;
    EdtTelefone1: TMaskEdit;
    EdtCpf: TMaskEdit;
    CbCargo: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    BtnCancelar: TSpeedButton;
    EdtID: TEdit;
    procedure RbCpfClick(Sender: TObject);
    procedure RbNomeClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
   procedure HabilitarCampos;
   procedure updateColaborador;
   procedure DeletarCampos;
  public
    { Public declarations }
  end;

var
  FrmColaborador: TFrmColaborador;
  sql : string;
  sqli : Integer;
  teste: string;
implementation

{$R *.dfm}

uses Modulo, ModuloFornecedor;

procedure TFrmColaborador.RbCpfClick(Sender: TObject);
begin
  if RbCpf.Checked then
    EdtBuscarNome.Text := '';
    EdtBuscarNome.Visible := False;
    EdtCpf.Text :='';
    EdtCpf.Visible :=true;
  end;

procedure TFrmColaborador.RbNomeClick(Sender: TObject);
begin

  if RbCpf.Checked then
      EdtCpf.Text :='';
      EdtCpf.Visible :=False;
      EdtBuscarNome.Text := '';
      EdtBuscarNome.Visible := True;

  end;


procedure LimparCampos();
begin

  with FrmColaborador   do
    begin
         EdtNome.text := '';
         EdtEmail.text := '';
         EdtCpf2.text := '';
         EdtEnder.text := '';
         EdtTelefone1.text := '';
         CbCargo.Text :='';
      end

end;

procedure TFrmColaborador.updateColaborador;
begin
  DataModule1.QueryUpdateColaborador.Close;
  DataModule1.QueryUpdateColaborador.Sql.Clear;


DataModule1.QueryUpdateColaborador.SQL.Add('update colaborador set nome=:EdtNome'+
',email=:EdtEmail,cpf=:EdtCpf2,endereco=:EdtEnde,telefone=:EdtTelefone,cargo=:idcargo where id =:EdtId');

DataModule1.QueryUpdateColaborador.ParamByName('EdtTelefone').AsString :=EdtTelefone1.Text;
DataModule1.QueryUpdateColaborador.ParamByName('EdtEnde').AsString :=EdtEnder.Text;
DataModule1.QueryUpdateColaborador.ParamByName('EdtCpf2').AsString :=EdtCpf2.Text;
DataModule1.QueryUpdateColaborador.ParamByName('EdtEmail').AsString :=EdtEmail.Text;
DataModule1.QueryUpdateColaborador.ParamByName('EdtNome').AsString := EdtNome.Text;
DataModule1.QueryUpdateColaborador.ParamByName('EdtId').AsInteger := StrToInt(EdtID.Text);

DataModule1.Query.Close;
DataModule1.Query.SQL.Clear;
DataModule1.Query.SQL.Add('select id from cargos');
DataModule1.Query.SQL.Add('WHERE descricao =:combobox');
DataModule1.Query.ParamByName('combobox').AsString := CbCargo.Text;
DataModule1.Query.Open;

DataModule1.QueryUpdateColaborador.ParamByName('idcargo').AsInteger := StrToInt(DataModule1.Query['id']);
DataModule1.QueryUpdateColaborador.ExecSQL;
LimparCampos;
EdtNome.Color := cl3DDkShadow;
EdtEmail.color := cl3DDkShadow;
EdtCpf2.color := cl3DDkShadow;
EdtEnder.color := cl3DDkShadow;
EdtTelefone1.color := cl3DDkShadow;
CbCargo.color := cl3DDkShadow;
BtnEditar.Enabled := false;
BtnCancelar.Enabled := false;
BtnNovo.Enabled := true;
DataModule1.QuerySelectAll.Open;
ShowMessage('Editado com sucesso');
end;

procedure TFrmColaborador.BtnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   EdtNome.Color := cl3DDkShadow;
   EdtEmail.color := cl3DDkShadow;
   EdtCpf2.color := cl3DDkShadow;
   EdtEnder.color := cl3DDkShadow;
   EdtTelefone1.color := cl3DDkShadow;
   CbCargo.color := cl3DDkShadow;
   BtnEditar.Enabled:=FALSE;
   BtnCancelar.Enabled:=FALSE;
   BtnNovo.Enabled := TRUE;
   BtnExcluir.Enabled := FALSE;
   DBGrid1.Enabled :=TRUE;


   if BtnSalvar.Enabled = true then
   begin
    BtnSalvar.Enabled := false;
   end;

end;

procedure TFrmColaborador.BtnEditarClick(Sender: TObject);
begin
updateColaborador;
DataModule1.TableColaborador.Open;
DataModule1.QuerySelectAll.Close;
DataModule1.QuerySelectAll.Open;
DBGrid1.Enabled := true;
end;

procedure TFrmColaborador.BtnExcluirClick(Sender: TObject);
begin
    DataModule1.QueryDeleteColaborador.Close;
    DataModule1.QueryDeleteColaborador.SQL.Clear;
    DataModule1.QueryDeleteColaborador.SQL.Add('delete from colaborador where id=:idColaborador');
    DataModule1.QueryDeleteColaborador.ParamByName('idColaborador').AsInteger := StrToInt(EdtID.Text);
    DataModule1.QueryDeleteColaborador.ExecSQL;
    ShowMessage('Deletado com sucesso');
    LimparCampos;
    EdtNome.Color := cl3DDkShadow;
    EdtEmail.color := cl3DDkShadow;
    EdtCpf2.color := cl3DDkShadow;
    EdtEnder.color := cl3DDkShadow;
    EdtTelefone1.color := cl3DDkShadow;
    CbCargo.color := cl3DDkShadow;
    BtnEditar.Enabled := false;
    BtnCancelar.Enabled := false;
    BtnExcluir.Enabled:=false;
    BtnNovo.Enabled := true;
    DataModule1.QuerySelectAll.Open;
    DataModule1.TableColaborador.Open;
    DataModule1.QuerySelectAll.Close;
    DataModule1.QuerySelectAll.Open;
    DBGrid1.Enabled := true;

end;

procedure TFrmColaborador.BtnNovoClick(Sender: TObject);

begin
    with FrmColaborador   do
    begin
         HabilitarCampos;
         BtnNovo.Enabled:=false;
         BtnSalvar.Enabled := true;
         BtnCancelar.Enabled := true;
         DataModule1.TableColaborador.Insert;
         DBGrid1.Enabled := false;
    end;
end;

procedure TFrmColaborador.BtnSalvarClick(Sender: TObject);
begin

DataModule1.Query.SQL.Add('select id from cargos');
DataModule1.Query.SQL.Add('WHERE descricao =:combobox');
DataModule1.Query.ParamByName('combobox').AsString := CbCargo.Text;
DataModule1.Query.Open;

sqli  :=StrToInt (DataModule1.Query['id']);

DataModule1.TableColaborador.FieldByName('nome').Value := EdtNome.Text;
DataModule1.TableColaborador.FieldByName('cpf').Value := EdtCpf2.Text;
DataModule1.TableColaborador.FieldByName('email').Value := EdtEmail.Text;
DataModule1.TableColaborador.FieldByName('telefone').Value := EdtTelefone1.Text;
DataModule1.TableColaborador.FieldByName('endereco').Value := EdtEnder.Text;
DataModule1.TableColaborador.FieldByName('cargo').Value := sqli;


DataModule1.Query.Close;
DataModule1.Query.SQL.Clear;

DataModule1.Query.SQL.Add('select max(id) as id from colaborador');
DataModule1.Query.open;
DataModule1.TableColaborador.FieldByName('id').Value := 1+DataModule1.Query['id'];
DataModule1.TableColaborador.Post;
LimparCampos;
DataModule1.TableColaborador.Open;
DataModule1.QuerySelectAll.Close;
DataModule1.QuerySelectAll.Open;
BtnSalvar.Enabled := FALSE;
BtnNovo.Enabled:= True;
DBGrid1.Enabled := True;
BtnCancelar.Enabled := False;
end;



procedure TFrmColaborador.DBGrid1CellClick(Column: TColumn);
var
texto :string;
begin
texto := DBGrid1.Fields[0].AsString;
DataModule1.Query.Close;
DataModule1.Query.SQL.Clear;
DataModule1.Query.SQL.Add('select co.descricao,* from colaborador as c inner join cargos as co'+
' on c.cargo=co.id ');
DataModule1.Query.SQL.Add('WHERE c.id ='+texto);
DataModule1.Query.Open;

HabilitarCampos;

  EdtID.Text := DataModule1.Query['id'];
if DataModule1.Query['nome'] <> null then
begin
  EdtNome.Text := DataModule1.Query['nome'];
end;
if DataModule1.Query['endereco'] <> null then
begin
  EdtEnder.Text := DataModule1.Query['endereco'];
end;
if DataModule1.Query['email'] <> null then
begin
  EdtEmail.Text := DataModule1.Query['email'];
end;
if DataModule1.Query['cpf']  <> null then
begin
  EdtCpf2.Text := DataModule1.Query['cpf'];
end;
if DataModule1.Query['telefone']  <> null then
begin
  EdtTelefone1.Text := DataModule1.Query['telefone'];
end;
if DataModule1.Query['descricao'] <> null then
begin
  CbCargo.Text := DataModule1.Query['descricao'];
end;

DBGrid1.Enabled:=False;
BtnNovo.Enabled:=False;
BtnEditar.Enabled:=TRUE;
BtnExcluir.Enabled :=TRUE;
BtnCancelar.Enabled :=  TRUE;

end;

procedure TFrmColaborador.DeletarCampos;
begin

end;

procedure TFrmColaborador.FormShow(Sender: TObject);
begin
    with DataModule1.TableCargo do begin
        while not Eof do
        begin
        CbCargo.Items.Add(FieldByName('descricao').AsString);
        Next;
        end;

    end;
end;

procedure TFrmColaborador.HabilitarCampos;
begin
  EdtNome.Enabled := true;
  EdtEmail.Enabled := true;
  EdtCpf2.Enabled := true;
  EdtEnder.Enabled := true;
  EdtTelefone1.Enabled := true;
  CbCargo.Enabled := true;

  EdtNome.Color := clWindow;
  EdtEmail.Color := clWindow;
  EdtEnder.Color := clWindow;
  EdtCpf2.Color := clWindow;
  EdtTelefone1.Color := clWindow;
  CbCargo.Color := clWindow;
end;

end.
