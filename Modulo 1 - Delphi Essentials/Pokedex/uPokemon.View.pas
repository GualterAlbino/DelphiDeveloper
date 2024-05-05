unit uPokemon.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.ComCtrls;

type
  TfrPokemon = class(TForm)
    pnlHeader: TPanel;
    lblTitulo: TLabel;
    edtInputPokemon: TEdit;
    btnBuscarPokemon: TButton;
    imgListButtonBuscar: TImageList;
    pnlMain: TPanel;
    imgPokemon: TImage;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    pnlHabilidades: TPanel;
    lblHabilidades: TLabel;
    pnlMovimentos: TPanel;
    lblMovimentos: TLabel;
    pnlDados: TPanel;
    lblDados: TLabel;
    procedure btnBuscarPokemonClick(Sender: TObject);
  private
    { Private declarations }
    FUrlFoto: String;
    procedure CriarLabel(AValor: String; ATopValor: Integer; AOwner: TComponent);
    procedure BuscarPokemon;
    procedure RenderizarFotoPokemon;
  public
    { Public declarations }
  end;

var
  frPokemon: TfrPokemon;

implementation

uses REST.Json, uPokemon.Model, uPokemon.API, Vcl.Imaging.pngimage;

{$R *.dfm}

procedure TfrPokemon.btnBuscarPokemonClick(Sender: TObject);
begin
  BuscarPokemon;
  RenderizarFotoPokemon;
end;

procedure TfrPokemon.BuscarPokemon;
var
  lblTop : Integer;
  LModel: TPokemon;
begin
  LModel := TPokemonAPI.CapturarPokemon(edtInputPokemon.Text);

  lblTop := 25;
  CriarLabel(LModel.Name, lblTop, pnlDados);
  lblTop := 45;
  CriarLabel(LModel.Weight.ToString, lblTop, pnlDados);

  lblTop := 25;
  for var i := 0 to LModel.Abilities.Count - 1 do
  begin
    CriarLabel(LModel.Abilities[i].Ability.Name, lblTop, pnlHabilidades);
    lblTop := lblTop + 15;
  end;

  lblTop := 30;
  for var i := 0 to LModel.Moves.Count - 1 do
  begin
    CriarLabel(LModel.Moves[i].Move.Name, lblTop, pnlMovimentos);
    lblTop := lblTop + 15;
  end;



  FUrlFoto := LModel.Sprites.FrontDefault;
end;

procedure TfrPokemon.CriarLabel(AValor: String; ATopValor:Integer; AOwner: TComponent);
begin
  var lbl := TLabel.Create(AOwner);
  lbl.Parent := TWinControl(AOwner);
  lbl.Font.Color := clWhite;
  lbl.Font.Style := [];
  lbl.Font.Size := 9;
  lbl.Caption := AValor;
  lbl.Left := 10;
  lbl.Top := ATopValor;
  lbl.Name := 'lbl_habilidades_' + AValor.Replace('-', '_');
end;

procedure TfrPokemon.RenderizarFotoPokemon;
begin
  var
  LImg := TMemoryStream.Create;

  TPokemonAPI.BuscarImagem(FUrlFoto, LImg);

  if LImg.Size > 0 then
  begin
    var
    LPng := TPngImage.Create;
    LImg.Position := 0;
    LPng.LoadFromStream(LImg);
    imgPokemon.Picture.Assign(LPng);
  end;

end;

end.
