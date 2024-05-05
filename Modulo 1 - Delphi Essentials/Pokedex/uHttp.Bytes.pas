unit uHttp.Bytes;

interface

uses System.Classes;

type
  THttpBytes = class
  private
  public
    class procedure GetBytes(const AUrl: String; AImage: TStream);
  end;

implementation

uses
  WinAPI.WinInet;

{ THttpBytes }

class procedure THttpBytes.GetBytes(const AUrl: String; AImage: TStream);

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
    GetMem(LBuffer, cBUFFER_SIZE);
    // Define/Cria um Buffer/Espaço na memoria a alocando
    try
      // Extrai o binario da imagem/Retorno
      LUrlOpen := InternetOpenUrl(LHiNet, PChar(AUrl), nil, 0,
        INTERNET_FLAG_RELOAD, 0);

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

end.
