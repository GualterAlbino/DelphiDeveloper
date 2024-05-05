unit uHome.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Menus, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  uPokemon.View, uTema.Conf, uQRCode.View;

type
  TfrHome = class(TForm)
    PopupMenu: TPopupMenu;
    emadoSistema1: TMenuItem;
    N1: TMenuItem;
    Dark1: TMenuItem;
    Dark2: TMenuItem;
    StatusBar1: TStatusBar;
    pnlBoasVindas: TPanel;
    pnlMain: TPanel;
    btnPokemon: TButton;
    imgListButtonPokemon: TImageList;
    btnQRCODE: TButton;
    procedure btnPokemonClick(Sender: TObject);
    procedure Dark1Click(Sender: TObject);
    procedure btnQRCodeClick(Sender: TObject);
    procedure Dark2Click(Sender: TObject);
  private
    { Private declarations }
    FTemaDefault: TIniTema;
    procedure AbrirTelaPokemon;
    procedure AbrirTelaQRCODE;
  public
    { Public declarations }
  end;

var
  frHome: TfrHome;

implementation

uses
  Vcl.Themes, Vcl.Styles;

{$R *.dfm}
{ TfrCadastro }

procedure TfrHome.AbrirTelaPokemon;
begin
  var
    LfrPokemon: TfrPokemon := TfrPokemon.Create(Self);
  try
    LfrPokemon.ShowModal;
  finally
    FreeAndNil(LfrPokemon);
  end;
end;

procedure TfrHome.AbrirTelaQRCode;
begin
  var
    LfrPokemon: TfrQRCode := TfrQRCode.Create(Self);
  try
    LfrPokemon.ShowModal;
  finally
    FreeAndNil(LfrPokemon);
  end;
end;

procedure TfrHome.btnPokemonClick(Sender: TObject);
begin
  AbrirTelaPokemon;
end;

procedure TfrHome.btnQRCODEClick(Sender: TObject);
begin
  AbrirTelaQRCode;
end;

procedure TfrHome.Dark1Click(Sender: TObject);
begin
  TStyleManager.TrySetStyle('Cyan Night');
   FTemaDefault.GravarTema('Cyan Night');
end;

procedure TfrHome.Dark2Click(Sender: TObject);
begin
   TStyleManager.TrySetStyle('Luna');
   FTemaDefault.GravarTema('Luna');
end;

end.
