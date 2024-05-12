unit uCadastro.Pessoa.Fisica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastro.Padrao.Form, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,  uPessoa.Fisica.Model,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, uPessoa.Model, Vcl.Mask, Vcl.DBCtrls;

type
  TFrCadastroPessoaFisica = class(TFrCadastroPadaro)
    MemDadosNome: TStringField;
    MemDadosCpf: TStringField;
    MemDadosAltura: TFloatField;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    GerarClassePessoa: TButton;
    Edit1: TEdit;
    procedure GerarClassePessoaClick(Sender: TObject);
  private
    FPessoaFisica: TPessoaFisica;
  public
    function GerarObjetoLinha(Index: integer): TPessoaFisica; overload;
    destructor Destroy; override;

  end;

var
  FrCadastroPessoaFisica: TFrCadastroPessoaFisica;

implementation

{$R *.dfm}

{ TFrCadastroPadaro1 }

{ TFrCadastroPessoaFisica }

procedure TFrCadastroPessoaFisica.GerarClassePessoaClick(Sender: TObject);
begin
  inherited;
  GerarObjetoLinha(String(Edit1.Text).ToInteger);
end;

destructor TFrCadastroPessoaFisica.Destroy;
begin
   if assigned(FPessoaFisica) then
     FreeAndNil(FPessoaFisica);
  inherited;
end;

function TFrCadastroPessoaFisica.GerarObjetoLinha(Index: integer): TPessoaFisica;
begin
   if not assigned(FPessoaFisica) then
     FPessoaFisica := TPessoaFisica.Create;

  if (Index < 1) or (Index > MemDados.RecordCount ) then
    raise Exception.Create('Index invalido!');


  MemDados.RecNo := Index;

  FPessoaFisica.Nome    := MemDadosNome.AsString;
  FPessoaFisica.Cpf     := MemDadosCpf.AsString;
  FPessoaFisica.Altura  := MemDadosAltura.Value;

end;

end.
