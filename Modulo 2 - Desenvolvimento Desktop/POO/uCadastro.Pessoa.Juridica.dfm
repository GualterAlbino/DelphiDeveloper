inherited frCadastroPessoaJuridica: TfrCadastroPessoaJuridica
  Caption = 'frCadastroPessoaJuridica'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlTitulo: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited pnlBottom: TPanel
    StyleElements = [seFont, seClient, seBorder]
    object GerarClassePessoa: TButton
      Left = 16
      Top = 6
      Width = 129
      Height = 25
      Caption = 'Gerar Classe Pessoa'
      TabOrder = 2
      OnClick = GerarClassePessoaClick
    end
    object Edit1: TEdit
      Left = 151
      Top = 7
      Width = 121
      Height = 23
      TabOrder = 3
      Text = 'Edit1'
    end
  end
  inherited PnlInformacoes: TPanel
    StyleElements = [seFont, seClient, seBorder]
    object Label1: TLabel [0]
      Left = 5
      Top = 6
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object Label2: TLabel [1]
      Left = 5
      Top = 43
      Width = 25
      Height = 15
      Caption = 'Cnpj'
    end
    object DBEdit1: TDBEdit
      Left = 44
      Top = 3
      Width = 377
      Height = 23
      DataField = 'Nome'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 44
      Top = 39
      Width = 169
      Height = 23
      DataField = 'Cnpj'
      DataSource = DataSource1
      TabOrder = 2
    end
  end
  inherited MemDados: TFDMemTable
    Active = True
    object MemDadosNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object MemDadosCnpj: TStringField
      FieldName = 'Cnpj'
    end
  end
end
