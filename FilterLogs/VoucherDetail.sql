


DECLARE @DbName nvarchar(max)='sadganPaloodDev'
DECLARE @SchemaName nvarchar(max)='ACC'
DECLARE @TableName nvarchar(max)='VoucherDetail'

DECLARE @LogDbName nvarchar(max)='sadganBase'
-----------------------------------------------------------
declare @Actions nvarchar(max)='1,2'
-----------------------------------------------------------
declare @FromDate nvarchar(max)='2021-03-01'
DECLARE @ToDate  nvarchar(max)='2021-03-28'
-----------------------------------------------------------
DECLARE @Command nvarchar(max)=''
SET @Command=
             N'SELECT '
			 +@LogDbName+'.'+@SchemaName+'.'+@TableName+N'.Log_Action,'+CHAR(13)
			 +'CASE WHEN '++@LogDbName+'.'+@SchemaName+'.'+@TableName+'.Log_Action=0 THEN '''+'درج'+''''+CHAR(13)
			 +' WHEN '++@LogDbName+'.'+@SchemaName+'.'+@TableName+'.Log_Action=1 THEN '''+'ویرایش'+''''+CHAR(13)
			 +' WHEN '++@LogDbName+'.'+@SchemaName+'.'+@TableName+'.Log_Action=2 THEN '''+'حذف'+''' END ActionName,'+CHAR(13)
			 +@LogDbName+'.'+@SchemaName+'.'+@TableName+'.LogDate,'+CHAR(13)
			 +@LogDbName+'.'+@SchemaName+'.'+@TableName+'.Log_ClientAddress,'+CHAR(13)
			 +@LogDbName+'.'+@SchemaName+'.'+@TableName+'.Log_HostName,'+CHAR(13)
			 +@LogDbName+'.'+@SchemaName+'.'+@TableName+'.User_LoginId,'+CHAR(13)
			 +@DbName+'.GNR.Users.FullName,'+CHAR(13)
			 +@LogDbName+'.'+@SchemaName+'.'+@TableName+'.Id,'+CHAR(13)
			 +@LogDbName+'.'+@SchemaName+'.'+@TableName+'.*'+CHAR(13)
			 +N'FROM'+CHAR(13)
			 +@LogDbName+'.'+@SchemaName+'.'+@TableName+CHAR(13)
			 +N'LEFT JOIN'+CHAR(13)
			 +@DbName+'.GNR.UserLogin'+CHAR(13)
			 +N'ON'+CHAR(13)
			 +N'ISNULL('+@LogDbName+'.'+@SchemaName+'.'+@TableName+'.User_loginId,0)=ISNULL('+@DbName+'.GNR.UserLogin.ID,0)'+CHAR(13)
			 +N'LEFT JOIN'+CHAR(13)
			 +@DbName+'.GNR.Users'+CHAR(13)
			 +N'ON'+CHAR(13)
			 +N'ISNULL('+@DbName +'.GNR.UserLogin.RefUserID,0)=ISNULL('+@DbName+'.GNR.Users.ID,0)'

			 Declare @flag bit=0
			 DECLARE @Condition nvarchar(max)=N''

			 if @Actions Is Not NULL
			   BEGIN
				   Set @Condition=N' WHERE '+@LogDbName+'.'+@SchemaName+'.'+@TableName+N'.Log_Action IN('+CONVERT(nvarchar,@Actions)+N')'+CHAR(13)
				   SET @flag=1
			   END

			   
			   if @FromDate IS NOT NULL
			    BEGIN
				 if @flag=1
				   SET @Condition=@Condition+N' AND '
				ELSE
					  SET @Condition=N' WHERE '
					  SET @condition=@condition+@LogDbName+'.'+@SchemaName+'.'+@TableName+N'.LogDate>='''+CONVERT(nvarchar,@FromDate)+''''+CHAR(13)
				 SET @flag=1
				END
				
				if @ToDate IS NOT NULL
			    BEGIN
				 if @flag=1
				   SET @Condition=@Condition+' AND '
				ELSE
				  SET @Condition=' WHERE '
				 SET @condition=@condition+@LogDbName+'.'+@SchemaName+'.'+@TableName+N'.LogDate<='''+CONVERT(nvarchar,@ToDate)+''''+CHAR(13)
				 SET @flag=1
				END
				SELECT @Command= @command+@Condition
				print  @Command
				--select @Command
				

				exec sp_executesql @command


