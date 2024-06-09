unit uThread.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Samples.Gauges,
  Vcl.StdCtrls;

type
  TMathOperation = reference to function(a,b :integer):integer;

  TFrThreads = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Gauge1: TGauge;
    Gauge2: TGauge;
    Gauge3: TGauge;
    Gauge4: TGauge;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure ExecutaAlgoPorParametro(rotina:TProc);
  public
    { Public declarations }
  end;

var
  FrThreads: TFrThreads;

implementation

{$R *.dfm}

procedure TFrThreads.Button1Click(Sender: TObject);
const MAX_VAL = 500;
function GetProc(gauge : TGauge; rotina:TProc):TProc;
begin
  gauge.MaxValue := MAX_VAL;
  Result :=
    procedure
    begin
      for var I := 0 to MAX_VAL do
      begin
        ExecutaAlgoPorParametro(rotina);
        TThread.Synchronize(nil,
         procedure
         begin
            gauge.Progress := i;
         end)
      end;
    end;
end;


begin

 var proc : TProc;
  proc :=
          procedure
          begin
            Sleep(3);
          end;

  TThread.CreateAnonymousThread( GetProc(Gauge1, proc)).Start;
  TThread.CreateAnonymousThread( GetProc(Gauge2, proc)).Start;
  TThread.CreateAnonymousThread( GetProc(Gauge3, proc)).Start;
  TThread.CreateAnonymousThread( GetProc(Gauge4, proc)).Start;

//
//  Gauge1.MaxValue :=MAX_VAL;
//  Gauge2.MaxValue :=MAX_VAL;
//  Gauge3.MaxValue :=MAX_VAL;
//  Gauge4.MaxValue :=MAX_VAL;

//  TThread.CreateAnonymousThread(
//  procedure
//    begin
//      for var I := 0 to MAX_VAL do
//      begin
//        TThread.Synchronize(nil,
//         procedure
//         begin
//            Gauge1.Progress := i;
//           sleep(3);
//         end)
//      end;
//  end).Start;
//
//
//  var Proc1 : TProc;
//
//  Proc1 :=
//  procedure
//  begin
//    for var I := 0 to MAX_VAL do
//    begin
//       Gauge2.Progress := i;
//       sleep(3);
//    end;
//  end;
//
//   TThread.CreateAnonymousThread(Proc1).Start;
//
//  TThread.CreateAnonymousThread(
//    procedure
//    begin
//    for var I := 0 to MAX_VAL do
//    begin
//       Gauge3.Progress := i;
//       sleep(3);
//    end;
//  end).Start;
//
//  TThread.CreateAnonymousThread(
//    procedure
//    begin
//      for var I := 0 to MAX_VAL do
//      begin
//         Gauge4.Progress := i;
//         sleep(3);
//      end;
//  end).Start;

end;

procedure TFrThreads.Button2Click(Sender: TObject);
 function ExecutaOperacao(a, b:integer; operation: TMathOperation):integer;
 begin
   Result := operation(a,b);
 end;

var a,b, retorno :integer;
begin
  a := StrToInt(Edit1.Text);
  b := StrToInt(Edit2.Text);

  //Soma
  retorno := ExecutaOperacao(a,b,
                                 function(x,y:integer):integer
                                 begin
                                   Result := x + y;
                                 end);
   Memo1.Lines.Add('O Valor da soma e: ' +retorno.ToString);


  //Multiplica��o
  retorno := ExecutaOperacao(a,b,
                                 function(x,y:integer):integer
                                 begin
                                   Result := x * y;
                                 end);
   Memo1.Lines.Add('O Valor da multiplica��o e: ' +retorno.ToString);


  //Multiplica��o
  retorno := ExecutaOperacao(a,b,
                                 function(x,y:integer):integer
                                 begin
                                   Result := (x * y) + (x * y) ;
                                 end);
   Memo1.Lines.Add('O Valor custom e: ' +retorno.ToString);



end;

procedure TFrThreads.ExecutaAlgoPorParametro(rotina: TProc);
begin
  rotina;
end;

end.
