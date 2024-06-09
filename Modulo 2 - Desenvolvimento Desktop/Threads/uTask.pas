unit uTask;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrTask = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Lista : TStringList;
    procedure GetDadosCliente;
    procedure GetDadosFornecedor;
    procedure GetDadosVendas;
  public
    procedure CarregarDados;
  end;

var
  FrTask: TFrTask;

implementation

{$R *.dfm}
uses System.Threading;

{ TFrTask }

procedure TFrTask.Button1Click(Sender: TObject);
begin
  CarregarDados;
end;

procedure TFrTask.Button2Click(Sender: TObject);
begin
//  var Lista := TStringList.Create;
  try
    Lista.Add('aaaaaaa');
    Lista.Add('bbbbbbb');
    Lista.Add('ccccccc');

    TParallel.For(0, Pred(Lista.count),
     procedure (i: integer)
     begin
       TThread.Queue(TThread.CurrentThread,  //S� roda com queue
        procedure
        begin
           Memo1.Lines.Add(Lista[i]);
           sleep(1000);
        end)
     end);

     TParallel.For(0, Pred(Lista.count),
     procedure (i: integer)
     begin
       TThread.Queue(TThread.CurrentThread,
        procedure
        begin
           Memo1.Lines.Add(Lista[i]);
           sleep(1000);
        end)
     end);

//    for var I := 0 to Lista.Count - 1 do
//    begin
//      Memo1.Lines.Add(Lista[i]);
//      sleep(1000);
//    end;

  finally
//    Lista.Free;
  end;
end;

procedure TFrTask.CarregarDados;
var Tasks : array [0..2] of ITask;
begin
  var Inicio: TDateTime;
  var Fim   : TDateTime;

  inicio := now;

  {Jeito Padr�o, leva mais tempo} // 06 segundos
  //  GetDadosCliente;
  //  GetDadosFornecedor;
  //  GetDadosVendas;

  //Executando pelas tasks, levou 02
  Tasks[0] := TTask.Create(GetDadosCliente);
  Tasks[0].Start;

  Tasks[1] := TTask.Create(GetDadosFornecedor);
  Tasks[1].Start;

  Tasks[2] := TTask.Create(GetDadosVendas);
  Tasks[2].Start;

  TTask.WaitForAll(Tasks);

  fim := now;

  ShowMessage (Format('Consultas realizadas'+sLineBreak +
               'Tempo gasto: %s', [FormatDateTime('ss', fim- inicio)]));

end;

procedure TFrTask.FormCreate(Sender: TObject);
begin
  Lista := TStringList.Create
end;

procedure TFrTask.FormDestroy(Sender: TObject);
begin
  freeAndNil(Lista);
end;

procedure TFrTask.GetDadosCliente;
begin
  Sleep(2000);
end;

procedure TFrTask.GetDadosFornecedor;
begin
  Sleep(2000);
end;

procedure TFrTask.GetDadosVendas;
begin
   Sleep(2000);
end;

end.
