program prPonteiros;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  uClass.Params in 'uClass.Params.pas',
  SysUtils;

  function GerarRec: TMeuRec;
  begin
    Result.ID := 534;
  end;

begin
  try
    begin
//       var obj : TMeuObj := TMeuObj.Create; //Heap
//
//       obj.ID.ToString;    // call @1234 -> MOV
//
//       if obj.ID > 1000 then
//         writeln('ID maior que mil')
//       else
//         writeln('ID menor que mil');
//
//       obj.Free;

       //record
//       begin
//         var mr: TMeuRec; //stack
//         if mr.ID > 1000 then
//           writeln('ID maior que mil');
//
//         writeln('Rec.ID: ' + intToStr(mr.ID));
//       end;
      var num: integer;
      var b: Byte;
      var c: Cardinal;
      var bool: Boolean;
      var str: string; //'adjfkjksdhfjkhsdf'
      var ch : char;  //'1'
      var fl: Double;
      var sVariant: Variant;
      var p: Pointer;
      var dt: TDateTime;
      var meuObj: TMeuObj;

      //Trabalhando com records direto na memoria
//      var pRec: pMeuRec; //Ponteiro para memoria
//      prec := @GerarRec; //Escrevendo o endere�o de memoria.
//      Writeln('Prec: ' + format('%p',[prec]));
//
       var mr: TMeuRec;
//      prec := @mr;
//      Writeln('Prec: ' + format('%p',[prec]));
//
//      New(prec);
//      Writeln('Prec: ' + format('%p',[prec]));
//      Dispose(prec);

      if num < 10 then
      begin
        //
      end;

//      WriteLn('Num: ' + IntToStr(num) + ' str: '+ str + ' Float: '+ FloatToStr(fl) + ' ch: '+ ch+ '  dt: ' + DateToStr(dt));
//      WriteLn(' Byte: '+ IntToStr(b) + ' Cardinal: '+ intToStr(c) + ' Bool: '+ BoolToStr(bool,true));
//      WriteLn('@p:  '+ format('%p', [p]) + ' variant: '+ sVariant + ' obj: '+ format('%p', [@meuObj]));
//      writeLn('DataTime: ' +DateTimeToStr(dt));


//         Writeln('Executa de forma normal!');
//         Writeln( Format('   $%p  pData: %n', [@dt, dt]) );
//         Writeln( Format('   $%p  pFloat: %n', [@fl, fl]) );
//         Writeln( Format('   $%p  pInt: %d', [@num, num]) );
//         Writeln( Format('   $%d  pBool: %d', [Integer(@Bool), Integer(Bool)]) );
//         Writeln( Format('   $%p  pStr: %s', [@Str, Str]) );
//         Writeln( Format('   $%p  pCh: %s', [@Ch, Ch]) );
//         Writeln( Format('   $%p  pRec: %d', [@mr, mr.ID]) );
//         Writeln( Format('   $%p  pPoint: %p', [@p, p]) );
//         Writeln( Format('   $%p  pVariant: %s', [@sVariant, sVariant]));
//         Writeln;
//
//         TParametros.ExecutaAlgo(dt, fl, num, bool,str,ch,mr,p,sVariant);


//        Writeln('Executa por consts!');
//         Writeln( Format('   $%p  pData: %n', [@dt, dt]) );
//         Writeln( Format('   $%p  pFloat: %n', [@fl, fl]) );
//         Writeln( Format('   $%p  pInt: %d', [@num, num]) );
//         Writeln( Format('   $%d  pBool: %d', [Integer(@Bool), Integer(Bool)]) );
//         Writeln( Format('   $%p  pStr: %s', [@Str, Str]) );
//         Writeln( Format('   $%p  pCh: %s', [@Ch, Ch]) );
//         Writeln( Format('   $%p  pRec: %d', [@mr, mr.ID]) );
//         Writeln( Format('   $%p  pPoint: %p', [@p, p]) );
//         Writeln( Format('   $%p  pVariant: %s', [@sVariant, sVariant]));
//         Writeln;
//
//         TParametros.ExecutaAlgoConst(dt, fl, num, bool,str,ch,mr,p,sVariant);


         Writeln('Executa por Param Var!');  //N�o altera os endere�os de memoria
         Writeln( Format('   $%p  pData: %n', [@dt, dt]) );
         Writeln( Format('   $%p  pFloat: %n', [@fl, fl]) );
         Writeln( Format('   $%p  pInt: %d', [@num, num]) );
         Writeln( Format('   $%d  pBool: %d', [Integer(@Bool), Integer(Bool)]) );
         Writeln( Format('   $%p  pStr: %s', [@Str, Str]) );
         Writeln( Format('   $%p  pCh: %s', [@Ch, Ch]) );
         Writeln( Format('   $%p  pRec: %d', [@mr, mr.ID]) );
         Writeln( Format('   $%p  pPoint: %p', [@p, p]) );
         Writeln( Format('   $%p  pVariant: %s', [@sVariant, sVariant]));
         Writeln;

         TParametros.ExecutaVar(dt, fl, num, bool,str,ch,mr,p,sVariant);

         Writeln;
         Writeln('Executa por Param Var! - Depois de passar pela procedure');
         Writeln( Format('   $%p  pData: %n', [@dt, dt]) );
         Writeln( Format('   $%p  pFloat: %n', [@fl, fl]) );
         Writeln( Format('   $%p  pInt: %d', [@num, num]) );
         Writeln( Format('   $%d  pBool: %d', [Integer(@Bool), Integer(Bool)]) );
         Writeln( Format('   $%p  pStr: %s', [@Str, Str]) );
         Writeln( Format('   $%p  pCh: %s', [@Ch, Ch]) );
         Writeln( Format('   $%p  pRec: %d', [@mr, mr.ID]) );
         Writeln( Format('   $%p  pPoint: %p', [@p, p]) );
         Writeln( Format('   $%p  pVariant: %s', [@sVariant, sVariant]));
         Writeln;


    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
