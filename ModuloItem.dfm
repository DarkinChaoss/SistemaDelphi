object DataModuleItem: TDataModuleItem
  OldCreateOrder = False
  Height = 343
  Width = 527
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
  object TableItem: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'item'
    TableName = 'item'
    Left = 32
    Top = 72
  end
  object QuerySelectAll_item: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select  i.id as codigo,i.descricao,'
      'i.estoque_atual,i.valor_custo,f.razao as Fornecedor from item i'
      'inner join fornecedor f on i.fornecedor = f.id')
    Left = 32
    Top = 136
    object QuerySelectAll_itemcodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'codigo'
    end
    object QuerySelectAll_itemdescricao: TWideStringField
      DisplayWidth = 35
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 60
    end
    object QuerySelectAll_itemestoque_atual: TIntegerField
      FieldName = 'estoque_atual'
      Origin = 'estoque_atual'
    end
    object QuerySelectAll_itemvalor_custo: TFloatField
      FieldName = 'valor_custo'
      Origin = 'valor_custo'
    end
    object QuerySelectAll_itemfornecedor: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'fornecedor'
      Origin = 'fornecedor'
      Size = 65
    end
  end
  object DataSource1: TDataSource
    DataSet = QuerySelectAll_item
    Left = 128
    Top = 136
  end
  object DataItem: TDataSource
    DataSet = TableItem
    Left = 104
    Top = 72
  end
  object query: TFDQuery
    Connection = FDConnection1
    Left = 32
    Top = 224
  end
  object Dataquery: TDataSource
    DataSet = query
    Left = 96
    Top = 224
  end
  object Query2: TFDQuery
    Connection = FDConnection1
    Left = 312
  end
  object DataQuery2: TDataSource
    DataSet = Query2
    Left = 368
  end
  object TableFornecedor: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'fornecedor'
    TableName = 'fornecedor'
    Left = 320
    Top = 80
  end
end
