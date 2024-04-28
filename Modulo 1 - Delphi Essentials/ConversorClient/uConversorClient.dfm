object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlConversorClient: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    Caption = 'Conversor Client'
    TabOrder = 0
  end
  object pnlDolarParaReal: TPanel
    Left = 128
    Top = 96
    Width = 369
    Height = 105
    Alignment = taLeftJustify
    Caption = 'Converter Dolar para Real'
    TabOrder = 1
    VerticalAlignment = taAlignTop
    object edtInputDolar: TEdit
      Left = 24
      Top = 48
      Width = 121
      Height = 23
      ImeName = 'edtInputDolar'
      TabOrder = 0
      OnKeyUp = edtInputDolarKeyUp
    end
    object edtResultadoReal: TEdit
      Left = 224
      Top = 48
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 1
    end
  end
  object pnlRealParaDolar: TPanel
    Left = 128
    Top = 264
    Width = 369
    Height = 105
    Alignment = taLeftJustify
    Caption = 'Converter Real para Dolar'
    TabOrder = 2
    VerticalAlignment = taAlignTop
    object edtInputReal: TEdit
      Left = 24
      Top = 48
      Width = 121
      Height = 23
      TabOrder = 0
      OnKeyUp = edtInputRealKeyUp
    end
    object edtResultadoDolar: TEdit
      Left = 224
      Top = 48
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 1
    end
  end
  object RESTClient: TRESTClient
    Params = <>
    SynchronizedEvents = False
    Left = 48
    Top = 120
  end
  object RESTRequest: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient
    Params = <>
    SynchronizedEvents = False
    Left = 32
    Top = 256
  end
end
