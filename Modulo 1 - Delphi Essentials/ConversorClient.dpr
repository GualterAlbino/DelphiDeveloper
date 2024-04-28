program ConversorClient;

uses
  Vcl.Forms,
  uConversorClient in 'ConversorClient\uConversorClient.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
