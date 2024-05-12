unit uCadastro.Padrao.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrCadastroPadaro = class(TForm)
    pnlTitulo: TPanel;
    pnlBottom: TPanel;
    DBGrid1: TDBGrid;
    MemDados: TFDMemTable;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    PnlInformacoes: TPanel;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    function GerarObjetoLinha: TObject; virtual; abstract;
  end;

var
  FrCadastroPadaro: TFrCadastroPadaro;

implementation

{$R *.dfm}

procedure TFrCadastroPadaro.Button1Click(Sender: TObject);
begin
  MemDados.Cancel;
end;

procedure TFrCadastroPadaro.Button2Click(Sender: TObject);
begin
  MemDados.Post;
end;

procedure TFrCadastroPadaro.Button4Click(Sender: TObject);
begin
  MemDados.Append;
end;

procedure TFrCadastroPadaro.FormCreate(Sender: TObject);
begin
   pnlTitulo.Caption := Self.Name;
end;

end.
