unit uCadastro.Pessoa.Juridica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastro.Padrao.Form, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, uPessoa.Fisica.Model,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  System.Generics.Collections ;

type
  TfrCadastroPessoaJuridica = class(TFrCadastroPadaro)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    MemDadosNome: TStringField;
    MemDadosCnpj: TStringField;
    GerarClassePessoa: TButton;
    Edit1: TEdit;
    procedure GerarClassePessoaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Lista: TList<TPessoaJuridica>;
    FPessoaJuridica : TPessoaJuridica;
  public
    function GerarObjetoLinha(Index: integer): TPessoaJuridica; overload;
  end;

var
  frCadastroPessoaJuridica: TfrCadastroPessoaJuridica;

implementation

{$R *.dfm}

{ TFrCadastroPadaro1 }

procedure TfrCadastroPessoaJuridica.FormCreate(Sender: TObject);
begin
  inherited;

  for var I := 0 to 20 do
    MemDados.AppendRecord([Random(20).ToString, Random(14)]);
end;

procedure TfrCadastroPessoaJuridica.GerarClassePessoaClick(Sender: TObject);
begin
  inherited;
  GerarObjetoLinha(String(Edit1.Text).ToInteger);
end;

function TfrCadastroPessoaJuridica.GerarObjetoLinha(Index: integer): TPessoaJuridica;
begin
  if not assigned(FPessoaJuridica) then
     FPessoaJuridica := TPessoaJuridica.Create;

  if (Index < 1) or (Index > MemDados.RecordCount ) then
    raise Exception.Create('Index invalido!');

//  MemDados.RecNo := Index;

  var book := MemDados.Bookmark;

  Lista := TList<TPessoaJuridica>.Create;
  try
    MemDados.LogChanges := false;
    MemDados.DisableControls;
    MemDados.First;

    while not MemDados.EOF do
    begin
      FPessoaJuridica.Nome    := MemDadosNome.AsString;
    //  FPessoaJuridica.CNPJ    := MemDadosCnpj.AsString;
      Lista.Add(FPessoaJuridica);
      MemDados.Next;
    end;
  finally
    MemDados.EnableControls;
    MemDados.Bookmark := book;
    Lista.Free;
  end;


end;

end.
