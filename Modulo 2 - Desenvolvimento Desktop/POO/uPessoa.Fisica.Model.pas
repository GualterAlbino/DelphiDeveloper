unit uPessoa.Fisica.Model;

interface
uses
   uPessoa.Model;

type
 TPessoaFisica = class(TPessoa)
    strict private
      FCpf : string;
      FAltura: Double;
      function getCpf: string;
      procedure setCpf(const Value: string);

      function getNome: string;  override;
    public
      property Cpf : string read getCpf write setCpf;
      property Altura: Double {read FAltura} write FAltura;
      constructor Create;
  end;

  TPessoaJuridica = class(TPessoa)
  private
    FCnpj : string;
    function getCnpj: String;
    procedure setCnpj(const Value: String);

  public
    Property CNPJ : String read getCnpj Write setCnpj;
  end;


implementation

{ TPessoaFisica }
uses System.MaskUtils, System.SysUtils, Math;

constructor TPessoaFisica.Create;
begin
 // Self.FNome // acesso por ser protected, protected somente classes filhas acessam
end;

function TPessoaFisica.getCpf: string;
begin
  Result := FormatMaskText('000\.000\.000\-00;0;', FCpf) ;
end;

function TPessoaFisica.getNome: string;
begin
  Result := 'Oi Eu sou o: ' +FNome +
  ', e tenho '+ FAltura.ToString +' de Altura,'+
  'e meu Cpf �: '+ FCpf;
end;

procedure TPessoaFisica.setCpf(const Value: string);
begin
   var lng := IfThen(Value.Contains('.'), 14 ,11);

   if Length(Value) <> lng then
     raise Exception.Create('Cpf invalido');

   FCpf := Value;


end;

{ TPessoaJuridica }

function TPessoaJuridica.getCnpj: String;
begin
  Result := FormatMaskText('00\.000\.000\/0000\-00;0;', FCnpj);
end;

procedure TPessoaJuridica.setCnpj(const Value: String);
begin

 var lng := IfThen(Value.Contains('.'), 18 ,14);

   if Length(Value) <> lng then
     raise Exception.Create('Cpf invalido');

   FCnpj := Value;
end;

end.
