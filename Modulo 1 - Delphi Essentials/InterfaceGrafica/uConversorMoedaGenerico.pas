unit uConversorMoedaGenerico;

interface

uses System.SysUtils, System.Rtti, uConversorMoeda;

type
  TConversorMoedaGenerico<T> = class
  public
    function ConverterDolarParaReal(ADolar: T): T;
    function ConverterRealParaDolar(AReal: T): T;
  end;

implementation

{ TConversorGenerico<T> }

function TConversorMoedaGenerico<T>.ConverterDolarParaReal(ADolar: T): T;
begin
  var
  TesteTipo := GetTypeKind(ADolar);
  var
  Conversor := TConversorMoeda.Create;
  try
    if TesteTipo = tkUString then
    begin
      var
      valorString := TValue.From<T>(ADolar).AsType<string>;
      Result := TValue.From<String>
        (Conversor.ConverterDolarParaReal(valorString).ToString).AsType<T>;

      Exit;
    end;

    if TValue.From<T>(ADolar).Kind = tkFloat then
    begin
      var
      valorDouble := TValue.From<T>(ADolar).AsType<Double>;
      Result := TValue.From<Double>(Conversor.ConverterDolarParaReal(valorDouble)).AsType<T>;
    end;

  finally
    FreeAndNil(Conversor);
  end;
end;



function TConversorMoedaGenerico<T>.ConverterRealParaDolar(AReal: T): T;
begin
   var
  TesteTipo := GetTypeKind(AReal);
  var
  Conversor := TConversorMoeda.Create;
  try
    if TesteTipo = tkUString then
    begin
      var
      valorString := TValue.From<T>(AReal).AsType<string>;
      Result := TValue.From<String>
        (Conversor.ConverterRealParaDolar(valorString).ToString).AsType<T>;

      Exit;
    end;

    if TValue.From<T>(AReal).Kind = tkFloat then
    begin
      var
      valorDouble := TValue.From<T>(AReal).AsType<Double>;
      Result := TValue.From<Double>(Conversor.ConverterRealParaDolar(valorDouble)).AsType<T>;
    end;

  finally
    FreeAndNil(Conversor);
  end;
end;

end.
