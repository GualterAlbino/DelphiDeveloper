program AplicacaoDOS;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  uProcedural in 'Procedural\uProcedural.pas';

var
  Output: string;
  ValorReal: double;

begin
  try
    while True do
    begin
      try
        Writeln('Informe o valor em real: ');
        Readln(Output);

        if not TryStrToFloat(Output, ValorReal) then
          raise Exception.Create('Não foi possivel converter para float.' + sLineBreak);

        Writeln('O valor é: ' +
          ConverterRealParaDolar(ValorReal).ToString + sLineBreak);
      except
        on E: Exception do
        begin
          Writeln(E.Message);
        end;
      end;

    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
