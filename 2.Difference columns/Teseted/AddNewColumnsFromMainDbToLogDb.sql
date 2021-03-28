DECLARE @MainDb_Id Smallint= db_id('sadganPaloodDev')
DECLARE @LogDb_Id Smallint= db_id('sadganBase')
DECLARE @DbLogName nvarchar(max)='sadganBase'

DECLARE @MainColumn Table(SchemaName nvarchar(Max),TableName nvarchar(Max),ColumnName nvarchar(Max),TypeName nvarchar(Max),Object_id int)

INSERT INTO @MainColumn
						SELECT
							OBJECT_SCHEMA_NAME(cols.object_id,@MainDb_Id)schemaname
							,OBJECT_NAME(cols.object_id,@MainDb_Id) as tblname
							,cols.name colname
							,dtype.name typename
							,cols.object_id objectid 
						FROM 
								sadganPaloodDev.sys.columns cols
						JOIN
								sadganPaloodDev.sys.objects objs ON cols.object_id=objs.object_id
						JOIN
								sadganPaloodDev.sys.types dtype ON cols.system_type_id=dtype.system_type_id and cols.user_type_id=dtype.user_type_id
						WHERE 
								objs.type=N'U'

SELECT * FROM @MainColumn ORDER BY TableName


Declare @LogDb_Columns Table(SchemaName nvarchar(Max),TableName nvarchar(Max),ColumnName nvarchar(Max),TypeName nvarchar(Max),Object_id int)

INSERT INTO @LogDb_Columns
						SELECT
							OBJECT_SCHEMA_NAME(cols.object_id,@LogDb_Id)schemaname
							,OBJECT_NAME(cols.object_id,@LogDb_Id) as tblname
							,cols.name colname
							,dtype.name typename
							,cols.object_id objectid 
						FROM 
								sadganBase.sys.columns cols
						JOIN
								sadganBase.sys.objects objs ON cols.object_id=objs.object_id
						JOIN
								sadganBase.sys.types dtype ON cols.system_type_id=dtype.system_type_id and cols.user_type_id=dtype.user_type_id
						WHERE 
								objs.type=N'U'

SELECT * FROM @LogDb_Columns ORDER BY TableName



SELECT 
       'ALTER TABLE '+@DbLogName+'.'+MainCols.schemaname+'.'+MainCols.TableName+' ADD '+MainCols.ColumnName+' '+MainCols.typename+' NULL',* 
FROM 
	    @MainColumn MainCols
LEFT JOIN
		@LogDb_Columns LogCols
ON 
		MainCols.SchemaName=LogCols.SchemaName AND  MainCols.TableName=LogCols.TableName AND MainCols.ColumnName=LogCols.ColumnName
WHERE 
		LogCols.Object_id IS NULL 


