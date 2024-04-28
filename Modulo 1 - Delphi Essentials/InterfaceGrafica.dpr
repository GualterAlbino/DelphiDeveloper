program InterfaceGrafica;

uses
  System.StartUpCopy,
  FMX.Forms,
  uInterfaceGrafica in 'InterfaceGrafica\uInterfaceGrafica.pas' {Form1},
  uConversorMoeda in 'InterfaceGrafica\uConversorMoeda.pas',
  uConversorMoedaGenerico in 'InterfaceGrafica\uConversorMoedaGenerico.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
