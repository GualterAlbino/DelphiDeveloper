unit Clientes.Cadastros.Form.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Base.Cadastro.Form.View, System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid,
  FMX.TabControl, FMX.Objects, FMX.Controls.Presentation, system.Generics.Collections,
  Data.Cliente.Entity, Data.Cliente.Controller, FMX.DateTimeCtrls, FMX.Edit;

type
  TFrCadastroClientes = class(TFrBaseCadastros)
    clIdCliente: TIntegerColumn;
    clNomeCliente: TStringColumn;
    clEndereco: TStringColumn;
    ClDtaCadastro: TStringColumn;
    EdtId: TEdit;
    EdtName: TEdit;
    edtEndereco: TEdit;
    DEdtCadastro: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblcad: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnInsertClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure SgDadosCellDblClick(const Column: TColumn; const Row: Integer);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    ListaCliente : TList<TClienteEntity>;
    FControllerCliente : TClienteController;
    Procedure IniciarGrid;
    procedure EditarRegistro;
    procedure PopulaGrid;
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

{ TFrBaseCadastros1 }

procedure TFrCadastroClientes.BtnCancelClick(Sender: TObject);
begin
  inherited;
  ControleVisualCadastro(false);
end;

procedure TFrCadastroClientes.BtnEditClick(Sender: TObject);
begin
  inherited;
  EditarRegistro;
end;

procedure TFrCadastroClientes.BtnInsertClick(Sender: TObject);
begin
  inherited;
  ControleVisualCadastro(true);
end;

procedure TFrCadastroClientes.BtnSaveClick(Sender: TObject);
begin
  inherited;
  var Cliente := TClienteEntity.Create;

  Cliente.IdCliente    := EdtId.Text.ToInteger;
  Cliente.NomeCliente  := EdtName.Text;
  Cliente.Endereco     := edtEndereco.Text;
  Cliente.DataCadastro := DEdtCadastro.Date;

  ListaCliente := FControllerCliente.GravarClientes(Cliente);

  ControleVisualCadastro(false);
  PopulaGrid;
end;

procedure TFrCadastroClientes.EditarRegistro;
begin
  ControleVisualCadastro(true);
  EdtId.Text        := SgDados.Cells[clIdCliente.Index, SgDados.Row];
  EdtName.Text      := SgDados.Cells[clNomeCliente.Index, SgDados.Row];
  edtEndereco.Text  := SgDados.Cells[clEndereco.Index, SgDados.Row];
  DEdtCadastro.Date := StrToDate(SgDados.Cells[ClDtaCadastro.Index, SgDados.Row]);
end;


procedure TFrCadastroClientes.FormCreate(Sender: TObject);
begin
  inherited;
  FControllerCliente := TClienteController.Create;
end;

procedure TFrCadastroClientes.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(FControllerCliente) then
    FreeAndNil(FControllerCliente);
end;

procedure TFrCadastroClientes.FormShow(Sender: TObject);
begin
  inherited;
  lblTitulo.Text := 'Cadastro de Clientes';
  IniciarGrid;
end;

procedure TFrCadastroClientes.IniciarGrid;
begin
  ListaCliente       :=  FControllerCliente.BuscarCliente;
  PopulaGrid;
end;

procedure TFrCadastroClientes.PopulaGrid;
procedure LimparGrid;
begin
 for var I := 0 to pred(SgDados.RowCount) do
 begin
    SgDados.Cells[clIdCliente.Index,i]   := '';
    SgDados.Cells[clNomeCliente.Index,i] := '';
    SgDados.Cells[clEndereco.Index,i]    := '';
    SgDados.Cells[ClDtaCadastro.Index,i] := '';
 end;
end;
begin
  AtualizaRowCount(ListaCliente.Count);
  LimparGrid;
  for var I := 0 to pred(ListaCliente.Count) do
   begin
      SgDados.Cells[clIdCliente.Index,i]   :=  ListaCliente[i].IdCliente.ToString;
      SgDados.Cells[clNomeCliente.Index,i] :=  ListaCliente[i].NomeCliente;
      SgDados.Cells[clEndereco.Index,i]    :=  ListaCliente[i].Endereco;
      SgDados.Cells[ClDtaCadastro.Index,i] :=  FormatDateTime('dd/MM/yyyy', ListaCliente[i].DataCadastro);
   end;
end;


procedure TFrCadastroClientes.SgDadosCellDblClick(const Column: TColumn; const Row: Integer);
begin
  inherited;
  BtnEditClick(nil);
end;

end.
