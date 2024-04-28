unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth;

type
{$METHODINFO ON}
  TServerMethods1 = class(TComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetMyName: string;
    function ConverterDolarParaReal(Valor: string): string;
    function ConverterRealParaDolar(Valor: string): string;
  end;
{$METHODINFO OFF}

implementation

uses System.StrUtils, uConversorMoedaGenerico;

function TServerMethods1.ConverterDolarParaReal(Valor: string): string;
begin
  var LConversor := TConversorMoedaGenerico<String>.Create;
  try
    Result := LConversor.ConverterDolarParaReal(Valor);
  finally
    LConversor.Free;
  end;
end;

function TServerMethods1.ConverterRealParaDolar(Valor: string): string;
begin
  var LConversor := TConversorMoedaGenerico<String>.Create;
  try
    Result := LConversor.ConverterRealParaDolar(Valor);
  finally
    LConversor.Free;
  end;
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetMyName: string;
begin
  Result := 'Gualter';
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.
