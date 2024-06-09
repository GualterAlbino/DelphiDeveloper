unit Data.Cliente.Model;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Cliente.Entity,
  System.Generics.Collections;

type
  TDmClienteModel = class(TDataModule)
    FDQCadastroUsuario: TFDQuery;
    procedure FDQCadastroUsuarioBeforeOpen(DataSet: TDataSet);
    procedure FDQCadastroUsuarioAfterClose(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FListaCliente: TList<TClienteEntity>;
    procedure ParseQueryToObjt(var AObtCliente: TClienteEntity);
    procedure FecharConexao;
    procedure Persistir;
  public
    function BuscarClientes: TList<TClienteEntity>;
    function GravarClientes(AModel: TClienteEntity): TList<TClienteEntity>;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

var
  DmClienteModel: TDmClienteModel;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}
{ TDataModule1 }

function TDmClienteModel.BuscarClientes: TList<TClienteEntity>;
begin

  FListaCliente.Clear;
  try
    FDQCadastroUsuario.Open;

    FDQCadastroUsuario.First;
    while not FDQCadastroUsuario.Eof do
    begin
      var
      Cliente := TClienteEntity.Create;
      ParseQueryToObjt(Cliente);
      FListaCliente.Add(Cliente);

      FDQCadastroUsuario.Next;
    end;
    Result := FListaCliente;
  finally
    FDQCadastroUsuario.Close;
  end;
end;

constructor TDmClienteModel.Create(AOwner: TComponent);
begin
  inherited;
  if not Assigned(FListaCliente) then
    FListaCliente := TList<TClienteEntity>.Create;

  If AOwner is TFDConnection then
  begin
    FDQCadastroUsuario.Connection := TFDConnection(AOwner);
    FDQCadastroUsuario.Transaction := TFDConnection(AOwner).Transaction;
  end;
end;

procedure TDmClienteModel.DataModuleDestroy(Sender: TObject);
begin
  Persistir;
end;

destructor TDmClienteModel.Destroy;
begin
  if Assigned(FListaCliente) then
    FreeAndNil(FListaCliente);

  FecharConexao;
  inherited;
end;

procedure TDmClienteModel.FDQCadastroUsuarioAfterClose(DataSet: TDataSet);
begin
  FecharConexao;
end;

procedure TDmClienteModel.FecharConexao;
begin
  FDQCadastroUsuario.Connection.Connected := false;
end;

function TDmClienteModel.GravarClientes(AModel: TClienteEntity): TList<TClienteEntity>;
var
  ExisteRegistro: Boolean;
var
  idx: integer;

  procedure ProcurarRegistro;
  begin
    idx := -1;
    for var I := 0 to FListaCliente.Count - 1 do
    begin
      ExisteRegistro := false;
      if FListaCliente.Items[I].IdCliente = AModel.IdCliente then
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
    with FListaCliente.Items[idx] do
    begin
      IdCliente := AModel.IdCliente;
      NomeCliente := AModel.NomeCliente;
      Endereco := AModel.Endereco;
      DataCadastro := AModel.DataCadastro;
    end;
  end
  else
    FListaCliente.Add(AModel);

  Result := FListaCliente;
end;

procedure TDmClienteModel.FDQCadastroUsuarioBeforeOpen(DataSet: TDataSet);
begin
  if not FDQCadastroUsuario.Connection.Connected then
    FDQCadastroUsuario.Connection.Connected := True;
end;

procedure TDmClienteModel.ParseQueryToObjt(var AObtCliente: TClienteEntity);
begin
  if not Assigned(AObtCliente) then
    raise Exception.Create('Objeto Cliente n�o instanciado!');

  AObtCliente.IdCliente := FDQCadastroUsuario.FieldByName('ID_CLIENTE').AsInteger;
  AObtCliente.NomeCliente := FDQCadastroUsuario.FieldByName('NOME_CLIENTE').AsString;
  AObtCliente.Endereco := FDQCadastroUsuario.FieldByName('ENDERECO').AsString;
  AObtCliente.DataCadastro := FDQCadastroUsuario.FieldByName('DTA_CADASTRO').AsDateTime;
end;

procedure TDmClienteModel.Persistir;
begin
  if FListaCliente = nil then
    raise Exception.Create('Lista n�o criada');

  FDQCadastroUsuario.DisableControls;

  // Apenas uma dica
  // if FDQCadastroUsuario.State in dsEditModes then
  // raise Exception.Create('Apenas um teste');

  if FDQCadastroUsuario.State = dsInactive then
    FDQCadastroUsuario.Open;

  try
    FDQCadastroUsuario.Transaction.StartTransaction;

    for var I := 0 to FListaCliente.Count - 1 do
    begin
      FDQCadastroUsuario.Filter := ' ID_CLIENTE = ' + FListaCliente.Items[I]
        .IdCliente.ToString;
      FDQCadastroUsuario.Filtered := True;

      if FDQCadastroUsuario.RecordCount > 0 then
      begin
        FDQCadastroUsuario.Edit;

        FDQCadastroUsuario.FieldByName('ID_CLIENTE').value   := FListaCliente.Items[i].IdCliente;
        FDQCadastroUsuario.FieldByName('NOME_CLIENTE').value := FListaCliente.Items[i].NomeCliente;
        FDQCadastroUsuario.FieldByName('ENDERECO').value     := FListaCliente.Items[i].Endereco;
        FDQCadastroUsuario.FieldByName('DTA_CADASTRO').value := FListaCliente.Items[i].DataCadastro;
        FDQCadastroUsuario.post;
      end
      else
        FDQCadastroUsuario.AppendRecord([
                                          FListaCliente.Items[i].IdCliente,
                                          FListaCliente.Items[i].NomeCliente,
                                          FListaCliente.Items[i].Endereco,
                                          FListaCliente.Items[i].DataCadastro
                                        ]);

    end;
    FDQCadastroUsuario.Filter := '';
    FDQCadastroUsuario.Filtered := false;
    FDQCadastroUsuario.ApplyUpdates(0);

    FDQCadastroUsuario.Transaction.Commit;
    FDQCadastroUsuario.Close;
  except
    on E: Exception do
    begin
      FDQCadastroUsuario.Transaction.Rollback;
      raise Exception.Create('Erro ao gravar no banco '+sLineBreak + E.Message);
    end;
  end;
end;

end.
