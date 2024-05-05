program Pokedex;

uses
  Vcl.Forms,
  uHome.View in 'Pokedex\uHome.View.pas' {frHome},
  uPokemon.Model in 'Pokedex\uPokemon.Model.pas',
  uPokemon.View in 'Pokedex\uPokemon.View.pas' {frPokemon},
  uPokemon.API in 'Pokedex\uPokemon.API.pas',
  Vcl.Themes,
  Vcl.Styles,
  uTema.Conf in 'Pokedex\uTema.Conf.pas',
  uHttp.Bytes in 'Pokedex\uHttp.Bytes.pas',
  uQRCode.View in 'Pokedex\uQRCode.View.pas' {frQRCode},
  uQRCode.API in 'Pokedex\uQRCode.API.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrHome, frHome);
  Application.CreateForm(TfrPokemon, frPokemon);
  Application.CreateForm(TfrQRCode, frQRCode);
  Application.Run;
end.
