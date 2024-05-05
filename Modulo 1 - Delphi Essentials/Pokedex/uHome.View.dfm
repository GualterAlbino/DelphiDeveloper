object frHome: TfrHome
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Home'
  ClientHeight = 441
  ClientWidth = 624
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 422
    Width = 624
    Height = 19
    Panels = <>
  end
  object pnlBoasVindas: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 5
    Width = 618
    Height = 52
    Margins.Top = 5
    Align = alTop
    BevelInner = bvRaised
    BevelWidth = 2
    Caption = 'Sejam bem vindos!'
    Color = clHotLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object pnlMain: TPanel
    Left = 0
    Top = 60
    Width = 624
    Height = 293
    Margins.Top = 5
    Align = alTop
    BevelInner = bvRaised
    BevelWidth = 2
    TabOrder = 2
    object btnPokemon: TButton
      Left = 160
      Top = 108
      Width = 137
      Height = 57
      Caption = 'Pokemon'
      Images = imgListButtonPokemon
      TabOrder = 0
      OnClick = btnPokemonClick
    end
    object btnQRCODE: TButton
      Left = 312
      Top = 108
      Width = 129
      Height = 57
      Caption = 'Gerar QRCODE'
      TabOrder = 1
      OnClick = btnQRCODEClick
    end
  end
  object PopupMenu: TPopupMenu
    Left = 488
    Top = 176
    object emadoSistema1: TMenuItem
      Caption = 'Tema do Sistema'
      object Dark1: TMenuItem
        Caption = 'Dark'
        OnClick = Dark1Click
      end
      object Dark2: TMenuItem
        Caption = 'Ligth'
        OnClick = Dark2Click
      end
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object TMenuItem
    end
  end
  object imgListButtonPokemon: TImageList
    Left = 296
    Top = 248
  end
end
