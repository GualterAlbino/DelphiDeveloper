unit uTema.Conf;

interface
  uses
  IniFiles, System.SysUtils;
  type TIniTema = class
    private
      FIni: TIniFile;
    public
      constructor Create;

      procedure GravarTema(AValue: String);
      function BuscarTemaDefault:String;
  end;

implementation
uses
  Vcl.Forms;

{ TIniTema }

function TIniTema.BuscarTemaDefault: String;
begin
  FIni.ReadString('TEMA', 'default', '');
end;

constructor TIniTema.Create;
begin
   FIni := TiniFile.Create(ExtractFilePath(Application.ExeName)+ 'tema.ini');
end;

procedure TIniTema.GravarTema(AValue: String);
begin
  FIni.writeString('TEMA','default',AValue);
end;

end.
