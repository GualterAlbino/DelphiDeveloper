unit uProcedural;

interface

const
  cCOTACAO_DOLAR = 5.12;
function ConverterRealParaDolar(AReal: double): double;
function ConverterDolarParaReal(ADolar: double): double;

implementation

function ConverterRealParaDolar(AReal: double): double;
begin
  Result := AReal * cCOTACAO_DOLAR;
end;

function ConverterDolarParaReal(ADolar: double): double;
begin
  Result := ADolar / cCOTACAO_DOLAR;
end;

end.
