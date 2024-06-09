unit Data.Produto.Entity;

interface

type
  TProdutoEntity = class
    private
    FIdProduto: Integer;
    FNomeProduto: String;
    FPreco: Double;
    FEstoque: integer;
    public
      property IdProduto: Integer read FIdProduto write FIdProduto;
      property NomeProduto: String read FNomeProduto write FNomeProduto;
      property Preco: Double read FPreco write FPreco;
      property Estoque: integer read FEstoque write FEstoque;
  end;

implementation

end.
