unit uConversorMoeda;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  // Enum
  EnumMoeda = (Dolar, Real);

  RecordMoedas = record
    TipoMoeda: EnumMoeda;
  end;

  TConversorMoeda = class
  private const
    cCOTACAO_DOLAR = 5.12;

  public
    procedure PopulaDicionario;

    class function ConverterRealParaDolar(AReal: double): double; overload;
    class function ConverterRealParaDolar(AReal: string): double; overload;

    class function ConverterDolarParaReal(ADolar: double): double; overload;
    class function ConverterDolarParaReal(ADolar: string): double; overload;
  end;

implementation

{ TConversorMoeda }

{$REGION 'Real Para Dolar'}

class function TConversorMoeda.ConverterRealParaDolar(AReal: double): double;
begin
  if AReal = 0 then
    Exit(0);

  Result := AReal / cCOTACAO_DOLAR;
end;

class function TConversorMoeda.ConverterRealParaDolar(AReal: string): double;
var
  LOutput: double;
begin

  if AReal.Trim.IsEmpty then
    Exit(0);

  if not TryStrToFloat(AReal, LOutput) then
    Exit(0);

  Result := Self.ConverterRealParaDolar(LOutput);
end;
{$ENDREGION}
{$REGION 'Dolar Para Real'}

class function TConversorMoeda.ConverterDolarParaReal(ADolar: double): double;
begin
  if ADolar = 0 then
    Exit(0);

  Result := ADolar * cCOTACAO_DOLAR;
end;

class function TConversorMoeda.ConverterDolarParaReal(ADolar: string): double;
var
  LOutput: double;
begin

  if ADolar.Trim.IsEmpty then
    Exit(0);

  if not TryStrToFloat(ADolar, LOutput) then
    Exit(0);

  Result := Self.ConverterDolarParaReal(LOutput);
end;
{$ENDREGION}

procedure TConversorMoeda.PopulaDicionario;
begin
  var
    RecMoeda: RecordMoedas;
  RecMoeda.TipoMoeda := Dolar;

  var
  Dicionario := TDictionary<EnumMoeda, RecordMoedas>.Create;

  if RecMoeda.TipoMoeda = Dolar then
    Dicionario.Add(Dolar, RecMoeda);

  if RecMoeda.TipoMoeda = Dolar then
    Dicionario.Add(Real, RecMoeda);

  for var key in Dicionario.Keys do
  begin
    var
    LRecord := Dicionario.Items[key];

  end;

end;

end.
