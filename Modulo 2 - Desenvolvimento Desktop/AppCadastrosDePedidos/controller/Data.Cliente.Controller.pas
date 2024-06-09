unit Data.Cliente.Controller;

interface
Uses
  Data.Conexao.Model, Data.Cliente.Model, Data.Cliente.Entity,
  system.Generics.Collections, System.Classes;

  type
    TClienteController = class
      private
         var FModelCLiente : TDmClienteModel;
      public
        procedure GetTelaCliente(AOwner: TComponent);
        Function BuscarCliente(): TList<TClienteEntity>;
        Function GravarClientes(AModel: TClienteEntity): TList<TClienteEntity>;
        constructor Create();
        destructor Destroy; override;
    end;

implementation

uses
  System.SysUtils, Clientes.Cadastros.Form.View;

{ TClienteController }

function TClienteController.BuscarCliente: TList<TClienteEntity>;
begin
  Result :=  FModelCLiente.BuscarClientes;
end;

constructor TClienteController.Create();
begin
  FModelCLiente :=  TDmClienteModel.Create(DmConexaoModel.Conexao);
end;

destructor TClienteController.Destroy;
begin
  FreeAndNil(FModelCLiente);
  inherited;
end;

procedure TClienteController.GetTelaCliente(AOwner: TComponent);
begin
  var FrCliente := TFrCadastroClientes.Create(nil);
  try
    FrCliente.ShowModal;
  finally
    FrCliente.Free;
  end;
end;

function TClienteController.GravarClientes(AModel: TClienteEntity): TList<TClienteEntity>;
begin
  Result := FModelCLiente.GravarClientes(AModel);
end;

end.
