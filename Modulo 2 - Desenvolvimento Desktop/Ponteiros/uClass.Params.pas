unit uClass.Params;

interface

Type
  TMeuObj = class
    private
      FID : integer;
    public
      property ID : integer read FID write FID;
  end;

  pMeuRec = ^TMeuRec;  //Ponteiro para memoria
  TMeuRec = record
    ID: integer;
  end;

  TParametros = class
    class procedure ExecutaAlgo(pData: tDateTime; pFloat:Double; pInt: integer; pBool:Boolean; pStr: String; pCh: Char; pRec: TMeuRec; pPoint: Pointer; pVariant: Variant);
    class procedure ExecutaAlgoConst(const pData: tDateTime; const pFloat:Double; const pInt: integer; const pBool:Boolean; const pStr: String; const pCh: Char; const pRec: TMeuRec; const pPoint: Pointer; const pVariant: Variant);
    class procedure ExecutaVar( var pData: tDateTime; var pFloat:Double; var pInt: integer; var pBool:Boolean; var pStr: String; var pCh: Char; var pRec: TMeuRec; var pPoint: Pointer; var pVariant: Variant);
    class procedure ExecutaOut( out pData: tDateTime; out pFloat:Double; out pInt: integer; out pBool:Boolean; out pStr: String; out pCh: Char; out pRec: TMeuRec; out pPoint: Pointer; out pVariant: Variant);
  end;

implementation

uses
  System.SysUtils;

{ TParametros }

class procedure TParametros.ExecutaAlgo(pData: tDateTime; pFloat: Double;
  pInt: integer; pBool: Boolean; pStr: String; pCh: Char; pRec: TMeuRec;
  pPoint: Pointer; pVariant: Variant);

  function GerarRec: TMeuRec;
  begin
    Result.ID := 530;
  end;
begin
  pData := Now;
  pFloat := 9;
  pint := $23;
  pBool := false;
  pStr:= 'Teste';
  pCh := '8';
  pRec.ID := 42;
  pPoint := Pointer($FFFF);
  pVariant := 1234;

  Writeln( Format('   $%p  pData: %n', [@pData, pData]) );
  Writeln( Format('   $%p  pFloat: %n', [@pFloat, pFloat]) );
  Writeln( Format('   $%p  pInt: %d', [@pInt, pInt]) );
  Writeln( Format('   $%d  pBool: %d', [Integer(@pBool), Integer(pBool)]) );
  Writeln( Format('   $%p  pStr: %s', [@pStr, pStr]) );
  Writeln( Format('   $%p  pCh: %s', [@pCh, pCh]) );
  Writeln( Format('   $%p  pRec: %d', [@pRec, pRec.ID]) );
  Writeln( Format('   $%p  pPoint: %p', [@pPoint, pPoint]) );
  Writeln( Format('   $%p  pVariant: %s', [@pVariant, pVariant]));
end;

class procedure TParametros.ExecutaAlgoConst(const pData: tDateTime;
  const pFloat: Double; const pInt: integer; const pBool: Boolean;
  const pStr: String; const pCh: Char; const pRec: TMeuRec;
  const pPoint: Pointer; const pVariant: Variant);
begin

  Writeln( Format('   $%p  pData: %n', [@pData, pData]) );
  Writeln( Format('   $%p  pFloat: %n', [@pFloat, pFloat]) );
  Writeln( Format('   $%p  pInt: %d', [@pInt, pInt]) );
  Writeln( Format('   $%d  pBool: %d', [Integer(@pBool), Integer(pBool)]) );
  Writeln( Format('   $%p  pStr: %s', [@pStr, pStr]) );
  Writeln( Format('   $%p  pCh: %s', [@pCh, pCh]) );
  Writeln( Format('   $%p  pRec: %d', [@pRec, pRec.ID]) );
  Writeln( Format('   $%p  pPoint: %p', [@pPoint, pPoint]) );
  Writeln( Format('   $%p  pVariant: %s', [@pVariant, pVariant]));
end;



class procedure TParametros.ExecutaOut(out pData: tDateTime; out pFloat: Double;
  out pInt: integer; out pBool: Boolean; out pStr: String; out pCh: Char;
  out pRec: TMeuRec; out pPoint: Pointer; out pVariant: Variant);

  function GerarRec: TMeuRec;
  begin
    Result.ID := 530;
  end;
begin
  pData := Now;
  pFloat := 9;
  pint := $23;
  pBool := false;
  pStr:= 'Teste';
  pCh := '8';
  pRec.ID := 42;
  pPoint := Pointer($FFFF);
  pVariant := 1234;

  Writeln( Format('   $%p  pData: %n', [@pData, pData]) );
  Writeln( Format('   $%p  pFloat: %n', [@pFloat, pFloat]) );
  Writeln( Format('   $%p  pInt: %d', [@pInt, pInt]) );
  Writeln( Format('   $%d  pBool: %d', [Integer(@pBool), Integer(pBool)]) );
  Writeln( Format('   $%p  pStr: %s', [@pStr, pStr]) );
  Writeln( Format('   $%p  pCh: %s', [@pCh, pCh]) );
  Writeln( Format('   $%p  pRec: %d', [@pRec, pRec.ID]) );
  Writeln( Format('   $%p  pPoint: %p', [@pPoint, pPoint]) );
  Writeln( Format('   $%p  pVariant: %s', [@pVariant, pVariant]));
end;

class procedure TParametros.ExecutaVar(var pData: tDateTime; var pFloat: Double;
  var pInt: integer; var pBool: Boolean; var pStr: String; var pCh: Char;
  var pRec: TMeuRec; var pPoint: Pointer; var pVariant: Variant);
 function GerarRec: TMeuRec;
  begin
    Result.ID := 530;
  end;
begin
  pData := Now;
  pFloat := 9;
  pint := $23;
  pBool := false;
  pStr:= 'Teste';
  pCh := '8';
  pRec.ID := 42;
  pPoint := Pointer($FFFF);
  pVariant := 1234;

  Writeln( Format('   $%p  pData: %n', [@pData, pData]) );
  Writeln( Format('   $%p  pFloat: %n', [@pFloat, pFloat]) );
  Writeln( Format('   $%p  pInt: %d', [@pInt, pInt]) );
  Writeln( Format('   $%d  pBool: %d', [Integer(@pBool), Integer(pBool)]) );
  Writeln( Format('   $%p  pStr: %s', [@pStr, pStr]) );
  Writeln( Format('   $%p  pCh: %s', [@pCh, pCh]) );
  Writeln( Format('   $%p  pRec: %d', [@pRec, pRec.ID]) );
  Writeln( Format('   $%p  pPoint: %p', [@pPoint, pPoint]) );
  Writeln( Format('   $%p  pVariant: %s', [@pVariant, pVariant]));
end;

end.
