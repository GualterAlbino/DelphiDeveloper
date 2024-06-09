unit Data.Login.Controller;

interface

uses
  System.Classes;
type
  TLoginController = class
  private
   class procedure GravarSessao(const ACodUsuario: integer; const AUsuario:String);
  public
   class Function ValidarLogin(AUsuario, ASenha: string):boolean;
   class Procedure GetTelaLogin(AOwner :TComponent);
  end;

implementation

uses Data.Conexao.Model,  Data.Login.Model, Login.Form.View;

{ TLoginController }

class procedure TLoginController.GetTelaLogin(AOwner: TComponent);
begin
   var LoginView := TFrLoginView.Create(AOwner);
   try
     LoginView.ShowModal;
   finally
      LoginView.Free;
   end;
end;

class procedure TLoginController.GravarSessao(const ACodUsuario: integer; const AUsuario:String);
begin
  var Usuario : TUsuarioLogado;
  Usuario.CodUsuario   :=  ACodUsuario;
  Usuario.NomeUsuario  := AUsuario;

  DmConexaoModel.UsuarioLogado := Usuario;
end;

class function TLoginController.ValidarLogin(AUsuario, ASenha: string): boolean;
begin
  var LoginModel := TDMLoginModel.Create(DmConexaoModel.Conexao);
  try
     Result := LoginModel.ValidarLogin(AUsuario, ASenha);
     GravarSessao(LoginModel.CodUsuario, LoginModel.NomeUsuario);
  finally
    LoginModel.Free;
  end;
end;

end.
