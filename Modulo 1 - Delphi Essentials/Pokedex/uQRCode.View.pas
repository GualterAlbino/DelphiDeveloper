unit uQRCode.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls;

type
  TfrQRCode = class(TForm)
    pnlHeader: TPanel;
    pnlMain: TPanel;
    imgQRCODE: TImage;
    edtInputTextoQRCode: TEdit;
    lblTexto: TLabel;
    btnGerarQRCode: TButton;
    imgListButton: TImageList;
    procedure btnGerarQRCodeClick(Sender: TObject);
  private
    { Private declarations }
    procedure GerarQRCode;
  public
    { Public declarations }
  end;

var
  frQRCode: TfrQRCode;

implementation

{$R *.dfm}

uses uQRCode.Api, Vcl.Imaging.pngimage;

procedure TfrQRCode.btnGerarQRCodeClick(Sender: TObject);
begin
  GerarQRCode;
end;

procedure TfrQRCode.GerarQRCode;
begin
  var
  LImg := TMemoryStream.Create;
  TQrCodeApi.GerarQRCode(edtInputTextoQRCode.Text, LImg);

  if LImg.Size > 0 then
  begin
    var
    LPng := TPngImage.Create;
    LImg.Position := 0;
    LPng.LoadFromStream(LImg);
    imgQRCODE.Picture.Assign(LPng);
  end;
end;



end.
