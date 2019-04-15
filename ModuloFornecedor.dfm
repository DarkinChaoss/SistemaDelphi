object DataModuloForne: TDataModuloForne
  OldCreateOrder = False
  Height = 362
  Width = 472
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=Restaurante'
      'User_Name=postgres'
      'Password=ellsisayss'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 8
  end
  object driver: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\Usuario\Documents\Embarcadero\Studio\Projects\SistemaRe' +
      'staurante\Win32\Debug\lib\libpq.dll'
    Left = 104
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 184
    Top = 8
  end
  object TableFornecedor: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'fornecedor'
    TableName = 'fornecedor'
    Left = 32
    Top = 88
  end
  object DataFonrcedor: TDataSource
    Left = 120
    Top = 88
  end
  object QueryAllFornecedor: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select id ,razao,email,telefone from fornecedor'
      'order by id')
    Left = 40
    Top = 168
    object QueryAllFornecedorid: TIntegerField
      DisplayWidth = 5
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QueryAllFornecedorrazao: TWideStringField
      DisplayWidth = 35
      FieldName = 'razao'
      Origin = 'razao'
      Size = 65
    end
    object QueryAllFornecedoremail: TWideStringField
      DisplayWidth = 35
      FieldName = 'email'
      Origin = 'email'
      Size = 65
    end
    object QueryAllFornecedortelefone: TWideStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 65
    end
  end
  object DataAllF: TDataSource
    DataSet = QueryAllFornecedor
    Left = 136
    Top = 168
  end
  object query: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select*from fornecedor order by id')
    Left = 40
    Top = 240
    object queryid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object queryrazao: TWideStringField
      DisplayWidth = 32
      FieldName = 'razao'
      Origin = 'razao'
      Size = 65
    end
    object querycnpj: TWideStringField
      DisplayWidth = 20
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Size = 65
    end
    object queryemail: TWideStringField
      DisplayWidth = 25
      FieldName = 'email'
      Origin = 'email'
      Size = 65
    end
    object querytelefone: TWideStringField
      DisplayWidth = 25
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 65
    end
  end
  object DataQuery: TDataSource
    DataSet = query
    Left = 128
    Top = 240
  end
  object QueryUpdateforn: TFDQuery
    Connection = FDConnection1
    Left = 40
    Top = 304
  end
end
