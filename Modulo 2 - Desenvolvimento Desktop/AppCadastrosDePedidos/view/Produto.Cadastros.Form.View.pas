unit Produto.Cadastros.Form.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Base.Cadastro.Form.View, System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid,
  FMX.TabControl, FMX.Objects, FMX.Controls.Presentation, FMX.Edit, System.Generics.Collections,
  Data.Produto.Controller, Data.Produto.Entity;

type
  TFrCadastroProduto = class(TFrBaseCadastros)
    clIdProduto: TStringColumn;
    clNomeProduto: TStringColumn;
    clPreco: TStringColumn;
    clEstoque: TStringColumn;
    Label1: TLabel;
    EdtId: TEdit;
    EdtName: TEdit;
    Label2: TLabel;
    edtPreco: TEdit;
    lblP: TLabel;
    EdtEstoque: TEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SgDadosCellDblClick(const Column: TColumn; const Row: Integer);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnInsertClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    ListaProduto : TList<TProdutoEntity>;
    FControllerProduto : TProdutoController;
    procedure PopulaGrid;
    procedure IniciarGrid;
    procedure EditarRegistro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrCadastroProduto: TFrCadastroProduto;

implementation

{$R *.fmx}

procedure TFrCadastroProduto.FormCreate(Sender: TObject);
begin
  inherited;
  FControllerProduto := TProdutoController.Create;
end;

procedure TFrCadastroProduto.FormDestroy(Sender: TObject);
begin
  inherited;
  if ListaProduto <> Nil then
    FreeAndNil(ListaProduto);

  FreeAndNil(FControllerProduto);
end;

procedure TFrCadastroProduto.FormShow(Sender: TObject);
begin
  inherited;
  lblTitulo.Text := 'Cadastro de produtos';
  IniciarGrid;
end;

procedure TFrCadastroProduto.IniciarGrid;
begin
  ListaProduto  :=  FControllerProduto.BuscarProduto;
  PopulaGrid;
end;

procedure TFrCadastroProduto.PopulaGrid;
procedure LimparGrid;
begin
 for var I := 0 to pred(SgDados.RowCount) do
 begin
    SgDados.Cells[clIdProduto.Index,i]   := '';
    SgDados.Cells[clNomeProduto.Index,i] := '';
    SgDados.Cells[clPreco.Index,i]    := '';
    SgDados.Cells[ClEstoque.Index,i] := '';
 end;
end;
begin
  AtualizaRowCount(ListaProduto.Count);
  LimparGrid;
  for var I := 0 to pred(ListaProduto.Count) do
   begin
      SgDados.Cells[clIdProduto.Index,i]   :=  ListaProduto[i].IdProduto .ToString;
      SgDados.Cells[clNomeProduto.Index,i] :=  ListaProduto[i].NomeProduto;
      SgDados.Cells[clPreco.Index,i]       :=  ListaProduto[i].Preco.ToString;
      SgDados.Cells[ClEstoque.Index,i]     :=  ListaProduto[i].Estoque.ToString;
   end;
end;

procedure TFrCadastroProduto.SgDadosCellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  inherited;
  BtnEditClick(nil);
end;

procedure TFrCadastroProduto.BtnCancelClick(Sender: TObject);
begin
  inherited;
  ControleVisualCadastro(false);
end;

procedure TFrCadastroProduto.BtnEditClick(Sender: TObject);
begin
  inherited;
  EditarRegistro;
end;

procedure TFrCadastroProduto.BtnInsertClick(Sender: TObject);
begin
  inherited;
  ControleVisualCadastro(true);
end;

procedure TFrCadastroProduto.BtnSaveClick(Sender: TObject);
begin
  inherited;
  var Produto := TProdutoEntity.Create;

  Produto.IdProduto    := EdtId.Text.ToInteger;
  Produto.NomeProduto  := EdtName.Text;
  Produto.Preco        := edtPreco.Text.ToDouble();
  Produto.Estoque      := EdtEstoque.Text.ToInteger();

  ListaProduto := FControllerProduto.GravarProduto(Produto);

  ControleVisualCadastro(false);
  PopulaGrid;
end;

procedure TFrCadastroProduto.EditarRegistro;
begin
  ControleVisualCadastro(true);
  EdtId.Text        := SgDados.Cells[clIdProduto.Index, SgDados.Row];
  EdtName.Text      := SgDados.Cells[clNomeProduto.Index, SgDados.Row];
  edtPreco.Text  := SgDados.Cells[clPreco.Index, SgDados.Row];
  EdtEstoque.Text := SgDados.Cells[clEstoque.Index, SgDados.Row];
end;


end.
