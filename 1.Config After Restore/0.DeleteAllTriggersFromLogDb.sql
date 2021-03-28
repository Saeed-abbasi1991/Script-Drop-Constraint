USE sadganbase
DECLARE @Command TABLE(Id bigint identity(1,1),SchemaName nvarchar(max),TableName nvarchar(max),TriggerName nvarchar(max),Command nvarchar(max))

INSERT INTO @Command 
                    SELECT
						 OBJECT_SCHEMA_NAME(object_id)
						,OBJECT_NAME(parent_id)
						,name
						,N'DROP TRIGGER '+OBJECT_SCHEMA_NAME(object_id)+'.'+name
		            From	
						sys.triggers 
						--where name like '%trg%'
SELECT * FROM @Command

DECLARE @Id bigint=(SELECT TOP 1 Id FROM @Command)

WHILE @Id IS NOT NULL
	BEGIN
		DECLARE @cmd nvarchar(max)=(SELECT TOP 1 Command FROM @Command WHERE Id=@Id)
		PRINT @Cmd
		EXEC sp_executesql @cmd
		DELETE FROM @Command WHERE Id=@Id
		SET @Id=(SELECT TOP 1 Id FROM @Command)
	END 


	--select * from sys.triggers