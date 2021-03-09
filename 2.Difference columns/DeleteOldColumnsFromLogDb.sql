
DECLARE @DbLogName nvarchar(max)='sadganlog'
-----------------------------------------------------------
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
DECLARE @Commnads TABLE(Id bigint Identity(1,1),Columnname nvarchar(max), SchemaName nvarchar(max),TableName nvarchar(max),Command nvarchar(max))
INSERT INTO @Commnads
select 
        LOGDB.colname,
		LOGDB.schemaname,
		LOGDB.tblname,
		'ALTER TABLE '+@DbLogName+'.'+LOGDB.schemaname+'.'+LOGDB.tblname+' DROP COLUMN '+LOGDB.colname
		FROM
              
	   
				(SELECT 
				       cols.name colname
					   ,cols.object_id objectid
					   ,OBJECT_NAME(cols.object_id) as tblname
					   ,dtype.name typename
					   ,OBJECT_SCHEMA_NAME(cols.object_id)schemaname
				 FROM 
				       sadganlog.sys.columns cols
				 JOIN
				       sadganlog.sys.objects objs ON cols.object_id=objs.object_id
				 JOIN
				       sadganlog.sys.types dtype ON cols.system_type_id=dtype.system_type_id AND cols.user_type_id=dtype.user_type_id
				 WHERE 
					   objs.type=N'U' AND cols.name<>@LogDate AND cols.name<>@LogId 
					   AND cols.name<>@Col_User_LoginId AND cols.name<>@Action_Log AND cols.name<>@Log_Host
					   AND  cols.name<>@Log_nt_domain AND cols.name<>@Log_nt_username AND cols.name<>@Log_ClientAddress
				)LOGDB
	   LEFT JOIN
				(SELECT 
				     cols.name colname
					 ,cols.object_id objectid
					 ,OBJECT_NAME(cols.object_id) as tblname
					 ,dtype.name typename
					 ,OBJECT_SCHEMA_NAME(cols.object_id)schemaname 
			   FROM 
					 sadganPaloodDev.sys.columns cols
			   JOIN
					 sadganPaloodDev.sys.objects objs ON cols.object_id=objs.object_id
			   JOIN
					 sadganPaloodDev.sys.types dtype ON cols.system_type_id=dtype.system_type_id and cols.user_type_id=dtype.user_type_id
			   WHERE 
					 objs.type=N'U'
			    )MainDB
		ON 
				LOGDB.schemaname=MainDB.schemaname AND  LOGDB.tblname=MainDB.tblname AND LOGDB.colname=MainDB.colname
		where 
					MainDB.objectid is null 

SELECT * FROM @Commnads						
DECLARE @Id bigint=(SELECT TOP 1 Id FROM @Commnads)

WHILE @Id IS NOT NULL
	BEGIN
		DECLARE @cmd nvarchar(max)=(SELECT TOP 1 Command FROM @Commnads WHERE Id=@Id)
		PRINT @cmd
		--EXEC sp_executesql @cmd
		DELETE FROM @Commnads WHERE Id=@Id
		SET @Id=(SELECT TOP 1 Id FROM @Commnads)
	END
