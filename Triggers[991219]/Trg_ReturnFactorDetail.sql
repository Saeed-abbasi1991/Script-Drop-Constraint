use sadganPaloodDev
IF object_id(N'SAL.Trg_ReturnFactorDetail', N'TR') IS NOT NULL DROP TRIGGER SAL.Trg_ReturnFactorDetail
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [SAL].[Trg_ReturnFactorDetail]
ON [sadganPaloodDev].[SAL].[ReturnFactorDetail]
AFTER INSERT, DELETE,UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @User_LoginId ndtid=null
	DECLARE @HostName ndtLongString=(SELECT TOP 1 host_name FROM sys.dm_exec_sessions WHERE session_id=@@SPID)
	DECLARE @Nt_Domain ndtLongString=(SELECT TOP 1 nt_domain FROM sys.dm_exec_sessions WHERE session_id=@@SPID)
	DECLARE @Nt_UserName ndtLongString=(SELECT TOP 1 nt_user_name FROM sys.dm_exec_sessions WHERE session_id=@@SPID)
	DECLARE @ClientAddress ndtLongString=(SELECT TOP 1 client_net_address FROM sys.dm_exec_connections WHERE session_id=@@SPID)
	--SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin WHERE SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
				BEGIN TRY
				INSERT INTO SadganLog.SAL.ReturnFactorDetail
							([ID]
      ,[RefReturnFactorHeaderID]
      ,[RefFactorDetailID]
      ,[RowNo]
      ,[RefGoodsID]
      ,[_UnitType]
      ,[RefBaseUnitID]
      ,[RefLateralUnitID]
      ,[BaseAmount]
      ,[LateralAmount]
      ,[_Amount]
      ,[_Rate]
      ,[Price]
      ,[Discount]
      ,[Addition]
      ,[Comment]
      ,[_RefBaseUnitID]
      ,[_BaseAmount]
      ,[_RefLateralUnitID]
      ,[_LateralAmount]
      ,[_Price]
      ,[_Discount]
      ,[_Addition]
      ,[_Tax]
      ,[_Charge]
      ,[_NetPrice]
      ,[BaseRate]
      ,[LateralRate]
      ,[TaxPrice]
      ,[ChargePrice]
      ,[TotalPrice]
      ,[__Updated315__]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
							 [ID]
      ,[RefReturnFactorHeaderID]
      ,[RefFactorDetailID]
      ,[RowNo]
      ,[RefGoodsID]
      ,[_UnitType]
      ,[RefBaseUnitID]
      ,[RefLateralUnitID]
      ,[BaseAmount]
      ,[LateralAmount]
      ,[_Amount]
      ,[_Rate]
      ,[Price]
      ,[Discount]
      ,[Addition]
      ,[Comment]
      ,[_RefBaseUnitID]
      ,[_BaseAmount]
      ,[_RefLateralUnitID]
      ,[_LateralAmount]
      ,[_Price]
      ,[_Discount]
      ,[_Addition]
      ,[_Tax]
      ,[_Charge]
      ,[_NetPrice]
      ,[BaseRate]
      ,[LateralRate]
      ,[TaxPrice]
      ,[ChargePrice]
      ,[TotalPrice]
      ,[__Updated315__]
							,getdate()
							,@User_LoginId
							,@Act
							,@HostName
							,@Nt_Domain
							,@Nt_UserName
							,@ClientAddress
					FROM
						INSERTED i
						END TRY
			    BEGIN CATCH
					PRINT 'ERROR Trg_ReturnFactorDetail'
			    END CATCH
			END
		ELSE
			BEGIN
				BEGIN TRY
				INSERT INTO SadganLog.SAL.ReturnFactorDetail
							([ID]
      ,[RefReturnFactorHeaderID]
      ,[RefFactorDetailID]
      ,[RowNo]
      ,[RefGoodsID]
      ,[_UnitType]
      ,[RefBaseUnitID]
      ,[RefLateralUnitID]
      ,[BaseAmount]
      ,[LateralAmount]
      ,[_Amount]
      ,[_Rate]
      ,[Price]
      ,[Discount]
      ,[Addition]
      ,[Comment]
      ,[_RefBaseUnitID]
      ,[_BaseAmount]
      ,[_RefLateralUnitID]
      ,[_LateralAmount]
      ,[_Price]
      ,[_Discount]
      ,[_Addition]
      ,[_Tax]
      ,[_Charge]
      ,[_NetPrice]
      ,[BaseRate]
      ,[LateralRate]
      ,[TaxPrice]
      ,[ChargePrice]
      ,[TotalPrice]
      ,[__Updated315__]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
						SELECT
							 [ID]
      ,[RefReturnFactorHeaderID]
      ,[RefFactorDetailID]
      ,[RowNo]
      ,[RefGoodsID]
      ,[_UnitType]
      ,[RefBaseUnitID]
      ,[RefLateralUnitID]
      ,[BaseAmount]
      ,[LateralAmount]
      ,[_Amount]
      ,[_Rate]
      ,[Price]
      ,[Discount]
      ,[Addition]
      ,[Comment]
      ,[_RefBaseUnitID]
      ,[_BaseAmount]
      ,[_RefLateralUnitID]
      ,[_LateralAmount]
      ,[_Price]
      ,[_Discount]
      ,[_Addition]
      ,[_Tax]
      ,[_Charge]
      ,[_NetPrice]
      ,[BaseRate]
      ,[LateralRate]
      ,[TaxPrice]
      ,[ChargePrice]
      ,[TotalPrice]
      ,[__Updated315__]
							,getdate()
							,@User_LoginId
							,@Act
							,@HostName
							,@Nt_Domain
							,@Nt_UserName
							,@ClientAddress
						FROM
							deleted i
				END TRY
			    BEGIN CATCH
					PRINT 'ERROR Trg_ReturnFactorDetail'
			    END CATCH
			END
    
END
SET ANSI_NULLS ON
GO