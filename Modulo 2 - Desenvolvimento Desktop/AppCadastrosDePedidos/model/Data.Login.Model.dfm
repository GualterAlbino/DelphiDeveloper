object DMLoginModel: TDMLoginModel
  Height = 115
  Width = 205
  object FDQLogin: TFDQuery
    BeforeOpen = FDQLoginBeforeOpen
    AfterClose = FDQLoginAfterClose
    SQL.Strings = (
      'Select '
      '  ID_LOGIN As CodUsuario,'
      '  NOME_USUARIO As NomeUsuario'
      ' From '
      '   Login'
      ' Where '
      '   NOME_USUARIO = :Usuario and '
      '   SENHA        = :Senha   ')
    Left = 80
    Top = 24
    ParamData = <
      item
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FDQLoginCodUsuario: TIntegerField
      FieldName = 'CodUsuario'
      Origin = 'ID_LOGIN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQLoginNomeUsuario: TWideStringField
      FieldName = 'NomeUsuario'
      Origin = 'NOME_USUARIO'
      Required = True
      Size = 50
    end
  end
end
