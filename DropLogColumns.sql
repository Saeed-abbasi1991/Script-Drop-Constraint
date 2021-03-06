--This IS SCRIPT FOR Add NEW COLUMNS To ALLTables OF LOGDATABASE(SADGANBASE)
use sadganBase
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


---------------------ADD LgDate Column----------------------------------
Insert INTO @Commands
						SELECT 
								--'Exec Sp_executesql N'' '
								--+
								N' ALTER TABLE '+OBJECT_SCHEMA_NAME(sys.tables.object_id)+'.'+sys.tables.name+'  DROP COLUMN '+@LogDate
						FROM
							sys.tables
						Left join
							sys.columns on	sys.tables.object_id=sys.columns.object_id and sys.columns.name=@LogDate
						WHERE 
							sys.columns.column_id IS NOT NULL  AND OBJECT_SCHEMA_NAME(sys.tables.object_id)<>'dbo'

---------------------ADD LogId Column--------------------------------------
Insert INTO @Commands
						SELECT 
								--'Exec Sp_executesql N'' '
								--+
								N' ALTER TABLE '+OBJECT_SCHEMA_NAME(sys.tables.object_id)+'.'+sys.tables.name+'  DROP COLUMN '+@LogId
						FROM
							sys.tables
						Left join
							sys.columns on	sys.tables.object_id=sys.columns.object_id and sys.columns.name=@LogId
						WHERE 
							sys.columns.column_id IS NOT NULL  AND OBJECT_SCHEMA_NAME(sys.tables.object_id)<>'dbo'

---------------------ADD User_LoginId Column-------------------------------
Insert INTO @Commands
						SELECT 
								--'Exec Sp_executesql N'' '
								--+
								N' ALTER TABLE '+OBJECT_SCHEMA_NAME(sys.tables.object_id)+'.'+sys.tables.name+'  DROP COLUMN '+@Col_User_LoginId
						FROM
							sys.tables
						Left join
							sys.columns on	sys.tables.object_id=sys.columns.object_id and sys.columns.name=@Col_User_LoginId
						WHERE 
							sys.columns.column_id IS NOT NULL AND OBJECT_SCHEMA_NAME(sys.tables.object_id)<>'dbo'
--select * from @Commands

-------------------------------Add Log_Action Column-----------------------------------------------------------------
Insert INTO @Commands
						SELECT 
								--'Exec Sp_executesql N'' '
								--+
								N' ALTER TABLE '+OBJECT_SCHEMA_NAME(sys.tables.object_id)+'.'+sys.tables.name+'  DROP COLUMN '+@Action_Log
						FROM
							sys.tables
						Left join
							sys.columns on	sys.tables.object_id=sys.columns.object_id and sys.columns.name=@Action_Log
						WHERE 
							sys.columns.column_id IS NOT NULL AND OBJECT_SCHEMA_NAME(sys.tables.object_id)<>'dbo'


------------------------------Add Log_HostNameColumn------------------------------------------------------------------
Insert INTO @Commands
						SELECT 
								--'Exec Sp_executesql N'' '
								--+
								N' ALTER TABLE '+OBJECT_SCHEMA_NAME(sys.tables.object_id)+'.'+sys.tables.name+'  DROP COLUMN '+@Log_Host
						FROM
							sys.tables
						Left join
							sys.columns on	sys.tables.object_id=sys.columns.object_id and sys.columns.name=@Log_Host
						WHERE 
							sys.columns.column_id IS NOT NULL AND OBJECT_SCHEMA_NAME(sys.tables.object_id)<>'dbo'
----------------------------------------------------------------------------------------------------------------------------


------------------------------Add Log_nt_domain------------------------------------------------------------------
Insert INTO @Commands
						SELECT 
								--'Exec Sp_executesql N'' '
								--+
								N' ALTER TABLE '+OBJECT_SCHEMA_NAME(sys.tables.object_id)+'.'+sys.tables.name+'  DROP COLUMN '+@Log_nt_domain
						FROM
							sys.tables
						Left join
							sys.columns on	sys.tables.object_id=sys.columns.object_id and sys.columns.name=@Log_nt_domain
						WHERE 
							sys.columns.column_id IS NOT NULL AND OBJECT_SCHEMA_NAME(sys.tables.object_id)<>'dbo'
----------------------------------------------------------------------------------------------------------------------------

------------------------------Add Log_nt_username------------------------------------------------------------------
Insert INTO @Commands
						SELECT 
								--'Exec Sp_executesql N'' '
								--+
								N' ALTER TABLE '+OBJECT_SCHEMA_NAME(sys.tables.object_id)+'.'+sys.tables.name+'  DROP COLUMN '+@Log_nt_username
						FROM
							sys.tables
						Left join
							sys.columns on	sys.tables.object_id=sys.columns.object_id and sys.columns.name=@Log_nt_username
						WHERE 
							sys.columns.column_id IS NOT NULL AND OBJECT_SCHEMA_NAME(sys.tables.object_id)<>'dbo'
----------------------------------------------------------------------------------------------------------------------------



------------------------------Add Log_clientAddress------------------------------------------------------------------
Insert INTO @Commands
						SELECT 
								--'Exec Sp_executesql N'' '
								--+
								N' ALTER TABLE '+OBJECT_SCHEMA_NAME(sys.tables.object_id)+'.'+sys.tables.name+'  DROP COLUMN '+@Log_ClientAddress
						FROM
							sys.tables
						Left join
							sys.columns on	sys.tables.object_id=sys.columns.object_id and sys.columns.name=@Log_ClientAddress
						WHERE 
							sys.columns.column_id IS NOT NULL  AND OBJECT_SCHEMA_NAME(sys.tables.object_id)<>'dbo'
----------------------------------------------------------------------------------------------------------------------------

DECLARE @Id bigint=(SELECT TOP 1 Id FROM @Commands)
--SELECT * FROM @Commands
WHILE @Id IS NOT NULL
	BEGIN
		declare @cmd nvarchar(max)=(SELECT TOP 1 Command FROM @Commands WHERE Id=@Id)
		print @cmd
		--EXEC sp_executesql @cmd
		DELETE FROM @Commands WHERE Id=@Id
		set @Id=(SELECT TOP 1 Id FROM @Commands)
	END






	
