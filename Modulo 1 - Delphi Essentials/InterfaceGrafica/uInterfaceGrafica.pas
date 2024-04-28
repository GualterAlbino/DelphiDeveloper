unit uInterfaceGrafica;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit;

type
  TForm1 = class(TForm)
    pnlTitulo: TPanel;
    lblTitulo: TLabel;
    Panel1: TPanel;
    lblRealDolar: TLabel;
    edtInputReal: TEdit;
    Panel2: TPanel;
    lblDolarReal: TLabel;
    edtInputDolar: TEdit;
    edtResultadoDolar: TEdit;
    edtResultadoReal: TEdit;

    procedure edtInputRealKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: WideChar; Shift: TShiftState);
    procedure edtInputDolarKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: WideChar; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses uConversorMoedaGenerico;

procedure TForm1.edtInputDolarKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: WideChar; Shift: TShiftState);
begin
  var
  LConversor := TConversorMoedaGenerico<String>.Create;
  try
    edtResultadoReal.Text := LConversor.ConverterRealParaDolar
      (edtInputDolar.Text);

  finally
    LConversor.Free;
  end;
end;

procedure TForm1.edtInputRealKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: WideChar; Shift: TShiftState);
begin
  var
  LConversor := TConversorMoedaGenerico<String>.Create;
  try
    edtResultadoDolar.Text := LConversor.ConverterDolarParaReal
      (edtInputReal.Text);
  finally
    LConversor.Free;
  end;
end;

end.
