unit uPokemon.API;

interface

uses uPokemon.Model, Rest.Client, Rest.Json, SysUtils, StrUtils,
  System.Classes, Rest.Types;

type
  TPokemonAPI = class
  private const
    cURL_POKEDEX_API = 'https://pokeapi.co/api/v2/pokemon/';
  public
    class procedure BuscarImagem(const AUrl: String; AImage: TStream);
    class function CapturarPokemon(const ANomePokemon: String): TPokemon;
  end;

implementation

uses
  WinAPI.WinInet;

{ TPokemonAPI }

class procedure TPokemonAPI.BuscarImagem(const AUrl: String; AImage: TStream);
const
  cBUFFER_SIZE = 1024 * 1024;
var
  LHiNet: Pointer;
  LBuffer: Pointer;
  LUrlOpen: Pointer;
  LBytesReaded: Cardinal;
begin
  // Cria um objeto capaz de realizar requisições (Uma DLL nativa do windows)
  LHiNet := InternetOpen('', INTERNET_OPEN_TYPE_PRECONFIG, NIL, NIL, 0);

  if Assigned(LHiNet) then
  begin
    AImage.Position := 0;
    GetMem(LBuffer, cBUFFER_SIZE); // Define/Cria um Buffer/Espaço na memoria a alocando
    try
      // Extrai o binario da imagem/Retorno
      LUrlOpen := InternetOpenUrl(LHiNet, PChar(AUrl), nil, 0, INTERNET_FLAG_RELOAD, 0);

      if Assigned(LUrlOpen) then
      begin
        try
          // Etrutura de repetição alternativa
          repeat
            // Grava byte a byte do arquivo
            InternetReadFile(LUrlOpen, LBuffer, cBUFFER_SIZE, LBytesReaded);

            if LBytesReaded > 0 then
              AImage.Write(LBuffer^, LBytesReaded);
            // ^ - Assinatura de ponteiros em Delphi

            // A condição de parada é os fins dos bytes
          until (LBytesReaded = 0);

        finally
          FreeMem(LBuffer);
        end;

      end;

    finally
      // Fecha a conexão inciada no inicio
      InternetCloseHandle(LHiNet);
    end;
  end;
end;

class function TPokemonAPI.CapturarPokemon(const ANomePokemon: String): TPokemon;
begin
  if ANomePokemon.Trim.IsEmpty then
    raise Exception.Create('Informe o nome do pokemon para consulta!');

  var
  LRest := TRESTClient.Create(cURL_POKEDEX_API + ANomePokemon);
  var
  LReq := TRESTRequest.Create(LRest);
  try
    LRest.Accept := '*/*';
    LRest.ContentType := 'application/json';

    LReq.Client := LRest;
    LReq.Method := rmGET;
    LReq.Execute;

    if LReq.Response.JSONText.IsEmpty then
      raise Exception.Create('Pokemon não encontrado!');

    Result := TJson.JsonToObject<TPokemon>(LReq.Response.JSONText);
  finally
    LReq.Free;
    LRest.Free;
  end;
end;

end.
