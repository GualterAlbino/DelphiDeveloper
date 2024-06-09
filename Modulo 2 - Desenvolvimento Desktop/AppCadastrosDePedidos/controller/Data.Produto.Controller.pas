unit Data.Produto.Controller;

interface
Uses
  Data.Conexao.Model, Data.Produto.Model, Data.Produto.Entity,
  system.Generics.Collections, System.Classes;

type
  TProdutoController = class
  private
    var FModel : TdmProdutoModel;
  public
    procedure GetTelaProduto(AOwner: TComponent);
    Function BuscarProduto(): TList<TProdutoEntity>;
    Function GravarProduto(AModel: TProdutoEntity): TList<TProdutoEntity>;

    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TProdutoController }
uses Produto.Cadastros.Form.View, System.SysUtils;

function TProdutoController.BuscarProduto: TList<TProdutoEntity>;
begin
   Result := FModel.BuscarProdutos;
end;

constructor TProdutoController.Create;
begin
  FModel := TDmProdutoModel.Create(DmConexaoModel.Conexao);
end;

destructor TProdutoController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TProdutoController.GetTelaProduto(AOwner: TComponent);
begin
  var FrProduto := TFrCadastroProduto.Create(nil);
  try
    FrProduto.ShowModal;
  finally
    FrProduto.Free;
  end;
end;

function TProdutoController.GravarProduto(AModel: TProdutoEntity): TList<TProdutoEntity>;
begin
  Result := FModel.GravarProdutos(AModel);
end;

end.
