program AppCadPedidos;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  Base.Form.View in '..\..\view\FormBase\Base.Form.View.pas' {FrBase},
  Login.Form.View in '..\..\view\Login.Form.View.pas' {FrLoginView},
  Data.Conexao.Model in '..\..\model\Data.Conexao.Model.pas' {DmConexaoModel: TDataModule},
  Data.Login.Model in '..\..\model\Data.Login.Model.pas' {DMLoginModel: TDataModule},
  Data.Login.Controller in '..\..\controller\Data.Login.Controller.pas',
  Principal.Form.View in '..\..\view\Principal.Form.View.pas' {FrPrincipalView},
  Data.Cliente.Model in '..\..\model\Data.Cliente.Model.pas' {DmClienteModel: TDataModule},
  Data.Cliente.Controller in '..\..\controller\Data.Cliente.Controller.pas',
  Data.Cliente.Entity in '..\..\DTO\Data.Cliente.Entity.pas',
  Base.Cadastro.Form.View in '..\..\view\FormBase\Base.Cadastro.Form.View.pas' {FrBaseCadastros},
  Clientes.Cadastros.Form.View in '..\..\view\Clientes.Cadastros.Form.View.pas' {FrBaseCadastros1},
  Produto.Cadastros.Form.View in '..\..\view\Produto.Cadastros.Form.View.pas' {FrCadastroProduto},
  Data.Produto.Model in '..\..\model\Data.Produto.Model.pas' {dmProdutoModel: TDataModule},
  Data.Produto.Entity in '..\..\DTO\Data.Produto.Entity.pas',
  Data.Produto.Controller in '..\..\controller\Data.Produto.Controller.pas',
  Principal.Controller in '..\..\controller\Principal.Controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrPrincipalView, FrPrincipalView);
  Application.CreateForm(TDmConexaoModel, DmConexaoModel);
  Application.Run;
end.
