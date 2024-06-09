unit Data.Produto.Model;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Generics.Collections,  Data.Produto.Entity;

type
  TdmProdutoModel = class(TDataModule)
    FDQProdutos: TFDQuery;
    procedure FDQProdutosAfterClose(DataSet: TDataSet);
    procedure FDQProdutosBeforeOpen(DataSet: TDataSet);
  private
    FListaProduto: TList<TProdutoEntity>;
    procedure FecharConexao;
    procedure ParseQueryToObjt(var AModel : TProdutoEntity);
    procedure Persistir;
  public
    function BuscarProdutos: TList<TProdutoEntity>;
    function GravarProdutos(AModel: TProdutoEntity): TList<TProdutoEntity>;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  dmProdutoModel: TdmProdutoModel;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TdmProdutoModel }

function TdmProdutoModel.BuscarProdutos: TList<TProdutoEntity>;
begin
  FListaProduto.Clear;
  try
    FDQProdutos.Open;

    FDQProdutos.First;
    while not FDQProdutos.Eof do
    begin
      var
      Produto := TProdutoEntity.Create;
      ParseQueryToObjt(Produto);
      FListaProduto.Add(Produto);

      FDQProdutos.Next;
    end;
    Result := FListaProduto;
  finally
    FDQProdutos.Close;
  end;
end;

constructor TdmProdutoModel.Create(AOwner: TComponent);
begin
  inherited;
  FListaProduto := TList<TProdutoEntity>.Create;

  If AOwner is TFDConnection then
  begin
    FDQProdutos.Connection := TFDConnection(AOwner);
    FDQProdutos.Transaction := TFDConnection(AOwner).Transaction;
  end;
end;

destructor TdmProdutoModel.Destroy;
begin
  Persistir;
  FecharConexao;

  FreeAndNil(FListaProduto);
  inherited;
end;

procedure TdmProdutoModel.FDQProdutosAfterClose(DataSet: TDataSet);
begin
  FecharConexao;
end;

procedure TdmProdutoModel.FDQProdutosBeforeOpen(DataSet: TDataSet);
begin
   if not FDQProdutos.Connection.Connected then
    FDQProdutos.Connection.Connected := True;
end;

procedure TdmProdutoModel.FecharConexao;
begin
  FDQProdutos.Connection.Connected := false;
end;

function TdmProdutoModel.GravarProdutos(AModel: TProdutoEntity): TList<TProdutoEntity>;
var
  ExisteRegistro: Boolean;
var
  idx: integer;

  procedure ProcurarRegistro;
  begin
    idx := -1;
    for var I := 0 to FListaProduto.Count - 1 do
    begin
      ExisteRegistro := false;
      if FListaProduto.Items[I].IdProduto = AModel.IdProduto then
      begin
        idx := I;
        ExisteRegistro := True;
        break;
      end;
    end;
  end;

begin
  ProcurarRegistro;
  if ExisteRegistro then
  begin
    with FListaProduto.Items[idx] do
    begin
      IdProduto := AModel.IdProduto;
      NomeProduto := AModel.NomeProduto;
      Preco := AModel.Preco;
      Estoque := AModel.Estoque;
    end;
  end
  else
    FListaProduto.Add(AModel);

  Result := FListaProduto;
end;

procedure TdmProdutoModel.ParseQueryToObjt(var AModel: TProdutoEntity);
begin
    if not Assigned(AModel) then
    raise Exception.Create('Objeto Cliente n�o instanciado!');

  AModel.IdProduto   := FDQProdutos.FieldByName('ID_PRODUTO').AsInteger;
  AModel.NomeProduto := FDQProdutos.FieldByName('NOME_PRODUTO').AsString;
  AModel.Preco       := FDQProdutos.FieldByName('PRECO').Asfloat;
  AModel.Estoque     := FDQProdutos.FieldByName('ESTOQUE').asInteger;
end;


procedure TdmProdutoModel.Persistir;
begin
  if Not Assigned(FListaProduto)  then
    raise Exception.Create('Lista n�o criada');

  FDQProdutos.DisableControls;

  // Apenas uma dica
  // if FDQProdutos.State in dsEditModes then
  // raise Exception.Create('Apenas um teste');

  if FDQProdutos.State = dsInactive then
    FDQProdutos.Open;

  try
    FDQProdutos.Transaction.StartTransaction;

    for var I := 0 to FListaProduto.Count - 1 do
    begin
      FDQProdutos.Filter := ' ID_PRODUTO = ' + FListaProduto.Items[I].IdProduto.ToString;
      FDQProdutos.Filtered := True;

      if FDQProdutos.RecordCount > 0 then
      begin
        FDQProdutos.Edit;

        FDQProdutos.FieldByName('ID_PRODUTO').value   := FListaProduto.Items[i].IdProduto;
        FDQProdutos.FieldByName('NOME_PRODUTO').value := FListaProduto.Items[i].NomeProduto;
        FDQProdutos.FieldByName('PRECO').value        := FListaProduto.Items[i].Preco;
        FDQProdutos.FieldByName('ESTOQUE').value      := FListaProduto.Items[i].Estoque;
        FDQProdutos.post;
      end
      else
        FDQProdutos.AppendRecord( [
                                     FListaProduto.Items[i].IdProduto,
                                     FListaProduto.Items[i].NomeProduto,
                                     FListaProduto.Items[i].Preco,
                                     FListaProduto.Items[i].Estoque
                                  ]);

    end;
    FDQProdutos.Filter := '';
    FDQProdutos.Filtered := false;
    FDQProdutos.ApplyUpdates(0);

    FDQProdutos.Transaction.Commit;
    FDQProdutos.Close;
  except
    on E: Exception do
    begin
      FDQProdutos.Transaction.Rollback;
      raise Exception.Create('Erro ao gravar no banco '+sLineBreak + E.Message);
    end;
  end;
end;

end.
