DECLARE @LogDate Varchar(20)='LogDate'
DECLARE @LogDate_Type Varchar(20)='ndtDateTime'
-----------------------------------------------------------
DECLARE @LogId Varchar(20)='LogId'
DECLARE @LogId_Type Varchar(20)='ndtInt'
-----------------------------------------------------------
DECLARE @Col_User_LoginId varchar(20)='User_LoginId'
DECLARE @Col_User_LoginId_Type varchar(20)='ndtInt'
-----------------------------------------------------------
DECLARE @Action_Log varchar(20)='Log_Action'
DECLARE @Action_Log_Type varchar(20)='ndtSmallInt'

DECLARE @Commands TABLE(Id bigint identity(1,1),Command varchar(max))
----------------------------------------------------------------------------

DECLARE @Log_Host varchar(20)='Log_HostName'
DECLARE @Log_Host_Type varchar(20)='ndtLongString'
-----------------------------------------------------------------------------
DECLARE @Log_nt_domain varchar(20)='Log_nt_domain'
DECLARE @Log_nt_domain_Type varchar(20)='ndtLongString'
----------------------------------------------------------------------------
DECLARE @Log_nt_username varchar(20)='Log_nt_username'
DECLARE @Log_nt_username_Type varchar(20)='ndtLongString'
----------------------------------------------------------------------------
DECLARE @Log_ClientAddress varchar(20)='Log_ClientAddress'
DECLARE @Log_ClientAddress_Type varchar(20)='ndtLongString'
--------------------------------------------------------------------------------------

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
							sadganBase.sys.types dtype ON cols.system_type_id=dtype.system_type_id AND cols.user_type_id=dtype.user_type_id
						WHERE 
							objs.type=N'U' AND cols.name<>@LogDate AND cols.name<>@LogId 
						AND 
							cols.name<>@Col_User_LoginId AND cols.name<>@Action_Log AND cols.name<>@Log_Host
						AND 
							cols.name<>@Log_nt_domain AND cols.name<>@Log_nt_username AND cols.name<>@Log_ClientAddress
						
SELECT * FROM @LogDb_Columns ORDER BY TableName



SELECT 
       'ALTER TABLE '+@DbLogName+'.'+LogCols.schemaname+'.'+LogCols.TableName+' DROP COLUMN '+LogCols.ColumnName,* 
FROM 
	   @LogDb_Columns LogCols
LEFT JOIN
	   @MainColumn MainCols
ON 
	   LogCols.SchemaName=MainCols.SchemaName AND  LogCols.TableName=MainCols.TableName AND LogCols.ColumnName=MainCols.ColumnName
WHERE 
	   MainCols.Object_id IS NULL
ORDER BY 
       LogCols.TableName
 
SELECT schemaname,count(*) FROM @LogDb_Columns GROUP BY schemaname
SELECT schemaname,count(*) FROM @MainColumn    GROUP BY schemaname


