unit uQRCode.API;

interface

uses
  System.Classes, uHttp.Bytes, SysUtils;

type
  TQRCodeAPI = class
  private const
    cURL_QRCODE_API =
      'https://qrcode.tec-it.com/API/QRCode?data=[VALOR]&backcolor=%23ffffff&size=small&quietzone=1&errorcorrection=H';
  public
    class procedure GerarQrCode(AValor: String; AImg: TStream);
  end;

implementation

uses System.StrUtils;

{ TQRCodeAPI }

class procedure TQRCodeAPI.GerarQrCode(AValor: String; AImg: TStream);
var
  LUrl: String;
begin

  if AValor.Trim.IsEmpty then
    raise Exception.Create('Informe um valor, para gerar o QRCode!');

  LUrl := cURL_QRCODE_API;
  THttpBytes.GetBytes(LUrl.Replace('[VALOR]', AValor), AImg);

end;

end.
