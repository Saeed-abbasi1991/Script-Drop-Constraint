use sadganPaloodDev
IF object_id(N'STO.Trg_ReturnImportDetailItem', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ReturnImportDetailItem
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ReturnImportDetailItem]
ON [sadganPaloodDev].[STO].[ReturnImportDetailItem]
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
	IF EXISTS(SELECT id FROM deleted WHERE id IN (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
				BEGIN TRY
					INSERT INTO sadganbase.STO.ReturnImportDetailItem
								 ([ID]
      ,[RefReturnImportHeaderID]
      ,[RowNo]
      ,[RefImportDetailItemID]
      ,[RefGoodsID]
      ,[RefBaseUnitID]
      ,[BaseAmount]
      ,[RefLateralUnitID]
      ,[LateralAmount]
      ,[_MainUnit]
      ,[_Amount]
      ,[_Rate]
      ,[Price]
      ,[TaxPrice]
      ,[ChargePrice]
      ,[_TransportPrice]
      ,[_TransportTaxPrice]
      ,[_TransportChargePrice]
      ,[_NetPrice]
      ,[Comment]
      ,[OrderValue]
      ,[RemainRate]
      ,[RemainPrice]
      ,[RemainAmount]
      ,[RefPricingHeaderID]
      ,[AvgRate]
      ,[AvgPrice]
      ,[_NetAvgPrice]
      ,[_RefBaseUnitID]
      ,[_BaseAmount]
      ,[_RefLateralUnitID]
      ,[_LateralAmount]
      ,[_Price]
      ,[_TaxPrice]
      ,[_ChargePrice]
      ,[_AvgRate]
      ,[_AvgPrice]
      ,[BaseRate]
      ,[LateralRate]
      ,[TotalPrice]
      ,[TotalAvgPrice]
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
      ,[RefReturnImportHeaderID]
      ,[RowNo]
      ,[RefImportDetailItemID]
      ,[RefGoodsID]
      ,[RefBaseUnitID]
      ,[BaseAmount]
      ,[RefLateralUnitID]
      ,[LateralAmount]
      ,[_MainUnit]
      ,[_Amount]
      ,[_Rate]
      ,[Price]
      ,[TaxPrice]
      ,[ChargePrice]
      ,[_TransportPrice]
      ,[_TransportTaxPrice]
      ,[_TransportChargePrice]
      ,[_NetPrice]
      ,[Comment]
      ,[OrderValue]
      ,[RemainRate]
      ,[RemainPrice]
      ,[RemainAmount]
      ,[RefPricingHeaderID]
      ,[AvgRate]
      ,[AvgPrice]
      ,[_NetAvgPrice]
      ,[_RefBaseUnitID]
      ,[_BaseAmount]
      ,[_RefLateralUnitID]
      ,[_LateralAmount]
      ,[_Price]
      ,[_TaxPrice]
      ,[_ChargePrice]
      ,[_AvgRate]
      ,[_AvgPrice]
      ,[BaseRate]
      ,[LateralRate]
      ,[TotalPrice]
      ,[TotalAvgPrice]
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
					Print'Trg_ReturnImportDetailItem ERROR'
				END CATCH
			END

		ELSE
			BEGIN
				BEGIN TRY
					INSERT INTO sadganbase.STO.ReturnImportDetailItem
							 ([ID]
      ,[RefReturnImportHeaderID]
      ,[RowNo]
      ,[RefImportDetailItemID]
      ,[RefGoodsID]
      ,[RefBaseUnitID]
      ,[BaseAmount]
      ,[RefLateralUnitID]
      ,[LateralAmount]
      ,[_MainUnit]
      ,[_Amount]
      ,[_Rate]
      ,[Price]
      ,[TaxPrice]
      ,[ChargePrice]
      ,[_TransportPrice]
      ,[_TransportTaxPrice]
      ,[_TransportChargePrice]
      ,[_NetPrice]
      ,[Comment]
      ,[OrderValue]
      ,[RemainRate]
      ,[RemainPrice]
      ,[RemainAmount]
      ,[RefPricingHeaderID]
      ,[AvgRate]
      ,[AvgPrice]
      ,[_NetAvgPrice]
      ,[_RefBaseUnitID]
      ,[_BaseAmount]
      ,[_RefLateralUnitID]
      ,[_LateralAmount]
      ,[_Price]
      ,[_TaxPrice]
      ,[_ChargePrice]
      ,[_AvgRate]
      ,[_AvgPrice]
      ,[BaseRate]
      ,[LateralRate]
      ,[TotalPrice]
      ,[TotalAvgPrice]
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
      ,[RefReturnImportHeaderID]
      ,[RowNo]
      ,[RefImportDetailItemID]
      ,[RefGoodsID]
      ,[RefBaseUnitID]
      ,[BaseAmount]
      ,[RefLateralUnitID]
      ,[LateralAmount]
      ,[_MainUnit]
      ,[_Amount]
      ,[_Rate]
      ,[Price]
      ,[TaxPrice]
      ,[ChargePrice]
      ,[_TransportPrice]
      ,[_TransportTaxPrice]
      ,[_TransportChargePrice]
      ,[_NetPrice]
      ,[Comment]
      ,[OrderValue]
      ,[RemainRate]
      ,[RemainPrice]
      ,[RemainAmount]
      ,[RefPricingHeaderID]
      ,[AvgRate]
      ,[AvgPrice]
      ,[_NetAvgPrice]
      ,[_RefBaseUnitID]
      ,[_BaseAmount]
      ,[_RefLateralUnitID]
      ,[_LateralAmount]
      ,[_Price]
      ,[_TaxPrice]
      ,[_ChargePrice]
      ,[_AvgRate]
      ,[_AvgPrice]
      ,[BaseRate]
      ,[LateralRate]
      ,[TotalPrice]
      ,[TotalAvgPrice]
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
					Print'Trg_ReturnImportDetailItem ERROR'
				END CATCH
			END
END
SET ANSI_NULLS ON
GO