unit Login.Form.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, System.ImageList,
  FMX.ImgList;

type
  TFrLoginView = class(TForm)
    Main: TRectangle;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Image1: TImage;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    CornerButton1: TCornerButton;
    CornerButton2: TCornerButton;
    ImageList1: TImageList;
    procedure CornerButton2Click(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure RealizarLogin;
    function CriptografiaRP(Opcao, Dados: String): String;
  public
    { Public declarations }
  end;

var
  FrLoginView: TFrLoginView;

implementation

{$R *.fmx}
uses Data.Login.Controller, system.Hash;

procedure TFrLoginView.CornerButton1Click(Sender: TObject);
begin
  RealizarLogin;
end;

procedure TFrLoginView.CornerButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrLoginView.FormShow(Sender: TObject);
begin
  if edtUsuario.CanFocus then
    edtUsuario.SetFocus;
end;

procedure TFrLoginView.RealizarLogin;
begin
  //Supondo que aqui � o cadastro da senha
  var hash := THashMD5.GetHashString(edtSenha.Text);
  var str  := CriptografiaRP('C',edtSenha.Text +'&'+hash);

  str := CriptografiaRP('D',edtSenha.Text +'&'+hash);

  str  := Copy(str,0, pos(str,'&')-1);

  if TLoginController.ValidarLogin(edtUsuario.Text, edtSenha.Text) then
    close
  else
    ShowMessage('Usu�rio ou senha invalidos!');
end;

//N�o pertece a view, � s� um teste
Function TFrLoginView.CriptografiaRP(Opcao : String; Dados : String): String;
var
  I : Integer;
  Key : Cardinal;
  Res : String;
const
  C1    = 44970; //33598
  C2    = 31511; //24219
  Chave = 18021; //16854
begin
  Key := Chave;

  for I := 1 to length(Dados) do
  begin
    Res := Res + Char(Byte(Dados[I]) xor (Key shr 8));
    if Opcao = 'C' then
      Key := (Byte(Res[I]) + Chave) * C1 + C2;
    if Opcao = 'D' then
      Key := (Byte(Dados[I]) + Chave) * C1 + C2;
  end;

  Result := Res;
end;

end.
