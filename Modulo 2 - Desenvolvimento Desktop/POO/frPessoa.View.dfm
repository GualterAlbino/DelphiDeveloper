object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Mdados: TMemo
    Left = 1
    Top = 8
    Width = 185
    Height = 433
    Lines.Strings = (
      '')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 192
    Top = 8
    Width = 177
    Height = 41
    Caption = 'Class / Instancia / Objeto'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 192
    Top = 80
    Width = 177
    Height = 57
    Caption = 'Criar class - Heran'#231'a'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 192
    Top = 168
    Width = 177
    Height = 57
    Caption = 'Abrir cadastro Pessoa Fisica'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 192
    Top = 248
    Width = 177
    Height = 57
    Caption = 'Abrir cadastro Pessoa Juridica'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 416
    Top = 8
    Width = 161
    Height = 41
    Caption = 'ShowMessage padr'#227'o'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 416
    Top = 80
    Width = 161
    Height = 49
    Caption = 'Manipulando Interfaces'
    TabOrder = 6
    OnClick = Button6Click
  end
end
