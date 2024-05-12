unit uLeao.Classes;

interface
uses uAnimais.Interfaces;

type
  TLeao = Class(TInterfacedObject, IMamiferos)
   private
      FTipo: EnumTipo;
      FHabitat: string;
   public
     procedure Alimentar;
     procedure Mover;
     function  Reproduzir: string;
     procedure Dormir;
     procedure SetTipo(ATipo: EnumTipo);
     procedure Mamar;
     procedure SetHabitats(AHabitat :string);
     procedure EmitirSons;
  End;

implementation

{ TLeao }
uses uMessage.padrao, StrUtils, sysUtils;

procedure TLeao.Alimentar;
begin
 TMessage.ShowMessage('O Le�o est� se alimentado');
end;

procedure TLeao.Dormir;
begin
  TMessage.ShowMessage('O Le�o est� dormindo');
end;

procedure TLeao.EmitirSons;
begin
  TMessage.ShowMessage('UUURRRRRAAAAUUUUUUULLLLLLL');
end;

procedure TLeao.Mamar;
begin
  Alimentar;
end;

procedure TLeao.Mover;
begin
   TMessage.ShowMessage('O Le�o est� andando');
end;

function TLeao.Reproduzir: string;
begin
  Result := 'O Le�o acabou de ter '+ Random(5).toString+ ' filhotes';
end;

procedure TLeao.SetHabitats(AHabitat: string);
begin
  FHabitat := AHabitat;
end;

procedure TLeao.SetTipo(ATipo: EnumTipo);
begin
  FTipo := ATipo;
end;

end.
