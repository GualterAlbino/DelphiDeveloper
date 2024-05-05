object frPokemon: TfrPokemon
  Left = 0
  Top = 0
  Caption = 'Temos que pegar, POKEMON'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 57
    Margins.Top = 5
    Align = alTop
    Color = clHotLight
    ParentBackground = False
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 16
      Top = 18
      Width = 75
      Height = 19
      Caption = 'Pokemon: '
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object edtInputPokemon: TEdit
      Left = 97
      Top = 18
      Width = 161
      Height = 23
      Hint = 'Digite o nome...'
      ImeName = 'Portuguese (Brazilian ABNT)'
      TabOrder = 0
    end
    object btnBuscarPokemon: TButton
      Left = 296
      Top = 18
      Width = 97
      Height = 23
      Caption = 'Buscar'
      Images = imgListButtonBuscar
      TabOrder = 1
      OnClick = btnBuscarPokemonClick
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 57
    Width = 624
    Height = 384
    Align = alClient
    TabOrder = 1
    DesignSize = (
      624
      384)
    object imgPokemon: TImage
      Left = 16
      Top = 6
      Width = 153
      Height = 139
    end
    object pnlHabilidades: TPanel
      Left = 175
      Top = 151
      Width = 146
      Height = 178
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clHotLight
      ParentBackground = False
      TabOrder = 0
      object lblHabilidades: TLabel
        Left = 9
        Top = 7
        Width = 80
        Height = 20
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 5
        Caption = 'Habilidades'
        Color = 16382457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
    end
    object pnlMovimentos: TPanel
      Left = 16
      Top = 151
      Width = 153
      Height = 179
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clHotLight
      ParentBackground = False
      TabOrder = 1
      object lblMovimentos: TLabel
        Left = 33
        Top = 7
        Width = 82
        Height = 20
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 5
        Caption = 'Movimentos'
        Color = 16382457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
    end
    object pnlDados: TPanel
      Left = 175
      Top = 6
      Width = 146
      Height = 139
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clHotLight
      ParentBackground = False
      TabOrder = 2
      object lblDados: TLabel
        Left = 9
        Top = 7
        Width = 43
        Height = 20
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 5
        Caption = 'Dados'
        Color = 16382457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
    end
  end
  object imgListButtonBuscar: TImageList
    Left = 408
    Top = 16
  end
  object RESTClient: TRESTClient
    BaseURL = 'https://pokeapi.co/api/v2/pokemon/ditto'
    Params = <>
    SynchronizedEvents = False
    Left = 520
    Top = 16
  end
  object RESTRequest: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 576
    Top = 16
  end
  object RESTResponse: TRESTResponse
    Left = 464
    Top = 16
  end
end
