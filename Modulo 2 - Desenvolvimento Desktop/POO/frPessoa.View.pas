unit frPessoa.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Mdados: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses uPessoa.Model, uPessoa.Fisica.Model,
uCadastro.Pessoa.Fisica,
uCadastro.Pessoa.Juridica,
uMessage.padrao,
uAnimais.Interfaces,
uCachorro.Classes,
uLeao.Classes;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
      //Obj     //Class  //O Create gera a instancia
  var Pessoa1 := TPessoa.Create;
  Pessoa1.Nome := 'Daniel';

  var Pessoa2 := TPessoa.Create;
  Pessoa2.Nome := 'Matheus';


  mDados.Lines.Add('Pessoa 1 = Classe: '+sLineBreak+ Pessoa1.ClassName);
  mDados.Lines.Add('Pessoa 1 = Valor Objeto: '+sLineBreak+ Pessoa1.Nome);
  mDados.Lines.Add('Pessoa 1 = Instancia: '+sLineBreak+ Format('$%p', [@Pessoa1]));

  mDados.Lines.Add(sLineBreak);
  mDados.Lines.Add(sLineBreak);

  mDados.Lines.Add('Pessoa 2 = Classe: '+sLineBreak+ Pessoa2.ClassName);
  mDados.Lines.Add('Pessoa 2 = Valor Objeto:'+sLineBreak+ Pessoa2.Nome);
  mDados.Lines.Add('Pessoa 2 = Instancia:'+sLineBreak+ Format('$%p', [@Pessoa2]));

  Pessoa1.Free;
  Pessoa2.Free;
end;

procedure TForm2.Button2Click(Sender: TObject);
  Var PessoaFisica : TPessoaFisica;
      Pessoa : TPessoa;
begin
// Pessoa := TPessoaFisica.Create;
   Pessoa :=  TPessoa.Create;
   PessoaFisica := TPessoaFisica.Create;
//   var cpf := TPessoaFisica(Pessoa).Cpf;

   Pessoa.Nome := 'Daniel';


   PessoaFisica.Nome := 'Daniel';
   PessoaFisica.Cpf := '41569842509';
   PessoaFisica.Altura := 1.74;

   MDados.Lines.Add('Classe TPessoa.Nome: ' +Pessoa.Nome);
   MDados.Lines.Add(sLineBreak);
   MDados.Lines.Add('Classe TPessoaFisica.Nome: ' +PessoaFisica.Nome);
   MDados.Lines.Add('Classe TPessoaFisica.Cpf: ' +PessoaFisica.Cpf);
 //  MDados.Lines.Add('Classe TPessoaFisica.Altura: ' +PessoaFisica.Altura.ToString);

   PessoaFisica.Free;
   Pessoa.Free;

end;

procedure TForm2.Button3Click(Sender: TObject);
begin
   var CadPF := TFrCadastroPessoaFisica.Create(Self);
   try
     CadPF.ShowModal;
   finally
     CadPF.Free;
   end;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  var CadPessoaJuridica := TfrCadastroPessoaJuridica.Create(self);
  try
     CadPessoaJuridica.ShowModal;
  finally
     CadPessoaJuridica.Free;
  end;

end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  TMessage.ShowMessage('Ol� mundo');
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  var InterfAnimal: IMamiferos;

// // var Cachorro: TCachorro := TCachorro.Create;
//  var Cachorro: TCachorro := TLeao.Create; // Aqui gera erro pq a classe s� pode implementar o seu tipo
//  try
//    Cachorro.Alimentar
//  finally
//    Cachorro.Free;
//  end;
  var isCachorro:= false;

  //A Interface implementa qualquer tipo que herde de sua interface
  if isCachorro then
  begin
    InterfAnimal := TCachorro.Create;

    var tipoCachorro : IAnimalTipos;

    tipoCachorro := TCachorro.Create;
    tipoCachorro.getTipo;

  end
  else
    InterfAnimal := TLeao.Create;

  InterfAnimal.Alimentar;
  InterfAnimal.Mover;
  InterfAnimal.Mamar;
  InterfAnimal.EmitirSons;
  TMessage.ShowMessage(InterfAnimal.Reproduzir);
  InterfAnimal.SetTipo(EnumTipo.Carnivoro);
end;

end.
