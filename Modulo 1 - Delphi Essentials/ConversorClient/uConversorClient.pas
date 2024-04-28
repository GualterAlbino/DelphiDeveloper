unit uConversorClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TForm3 = class(TForm)
    pnlConversorClient: TPanel;
    pnlDolarParaReal: TPanel;
    pnlRealParaDolar: TPanel;
    edtInputDolar: TEdit;
    edtResultadoReal: TEdit;
    edtInputReal: TEdit;
    edtResultadoDolar: TEdit;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    procedure edtInputDolarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInputRealKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  { Private declarations }
    const
    cBASE_URL = 'http://localhost:8080/datasnap/rest/TServerMethods1';
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses REST.Json, System.Json;

procedure TForm3.edtInputDolarKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  var
  LRest := TRESTClient.Create(cBASE_URL + '/ConverterDolarParaReal/' +
    String(edtInputDolar.Text));

  var
  LRestRequest := TRESTRequest.Create(self);
  LRestRequest.Client := LRest;
  try
    LRestRequest.Execute;

    var
    LRetorno := LRestRequest.Response.JSONValue.GetValue<TJSONArray>('result')
      .Get(0).ToString.Replace('"', '');

    edtResultadoReal.Text := LRetorno;
  finally
    LRest.Free;
    FreeAndNil(LRestRequest);
  end;
end;

procedure TForm3.edtInputRealKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  LRetorno: String;
  LRest: TRESTClient;
  LRestRequest: TRESTRequest;
begin
  LRest := TRESTClient.Create(cBASE_URL + '/ConverterRealParaDolar/' +
    String(edtInputReal.Text));
  LRestRequest := TRESTRequest.Create(self);
  LRestRequest.Client := LRest;
  try
    LRestRequest.Execute;

    LRetorno := LRestRequest.Response.JSONValue.GetValue<TJSONArray>('result').Get(0).ToString.Replace('"', '');

    edtResultadoDolar.Text := LRetorno;
  finally
    FreeAndNil(LRest);
    FreeAndNil(LRestRequest);
  end;
end;

end.
