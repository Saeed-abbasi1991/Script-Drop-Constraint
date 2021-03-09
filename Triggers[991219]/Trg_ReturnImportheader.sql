
use sadganPaloodDev
IF object_id(N'STO.Trg_ReturnImportHeader', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ReturnImportHeader
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ReturnImportHeader]
ON [sadganPaloodDev].[STO].[ReturnImportHeader]
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
	if EXISTS(SELECT id FROM deleted where id in (SELECT id FROM INSERTED))
		set @Act=1/*update*/
	ELSE if EXISTS(SELECT 1 FROM deleted)
		set @Act=2/*delete*/

		if @Act=0 or @Act=1
			BEGIN
				BEGIN TRY
						INSERT INTO SadganLog.STO.ReturnImportHeader
							([ID]
      ,[RefVoucherTypeID]
      ,[RefFiscalYearID]
      ,[RefVoucherHeaderID]
      ,[ReturnImportNo]
      ,[ReturnImportDate]
      ,[RefKindID]
      ,[RefWarehouseID]
      ,[RefDetailAccountID]
      ,[ByRefrence]
      ,[Comment]
      ,[_TotalPrice]
      ,[_TotalTaxPrice]
      ,[_TotalChargePrice]
      ,[_TotalTransportPrice]
      ,[_TotalTransportTaxPrice]
      ,[_TotalTransportChargePrice]
      ,[_TotalNetPrice]
      ,[RefStatusID]
      ,[RefWriterID]
      ,[CreateDate]
      ,[RefEditorID]
      ,[UpdateDate]
      ,[RefAmountConfirmStatusID]
      ,[AmountConfirmStatusUpdateDate]
      ,[_TotalAvgPrice]
      ,[_TotalNetAvgPrice]
      ,[TaxPrice]
      ,[ChargePrice]
      ,[TotalPrice]
      ,[AvgPrice]
      ,[TotalAvgPrice]
      ,[Price]
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
      ,[RefVoucherTypeID]
      ,[RefFiscalYearID]
      ,[RefVoucherHeaderID]
      ,[ReturnImportNo]
      ,[ReturnImportDate]
      ,[RefKindID]
      ,[RefWarehouseID]
      ,[RefDetailAccountID]
      ,[ByRefrence]
      ,[Comment]
      ,[_TotalPrice]
      ,[_TotalTaxPrice]
      ,[_TotalChargePrice]
      ,[_TotalTransportPrice]
      ,[_TotalTransportTaxPrice]
      ,[_TotalTransportChargePrice]
      ,[_TotalNetPrice]
      ,[RefStatusID]
      ,[RefWriterID]
      ,[CreateDate]
      ,[RefEditorID]
      ,[UpdateDate]
      ,[RefAmountConfirmStatusID]
      ,[AmountConfirmStatusUpdateDate]
      ,[_TotalAvgPrice]
      ,[_TotalNetAvgPrice]
      ,[TaxPrice]
      ,[ChargePrice]
      ,[TotalPrice]
      ,[AvgPrice]
      ,[TotalAvgPrice]
      ,[Price]
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
						Print'Trg_ReturnImportHeader ERROR'
				END CATCH
			END

		ELSE
		BEGIN
			BEGIN TRY
					INSERT INTO SadganLog.STO.ReturnImportHeader
						([ID]
      ,[RefVoucherTypeID]
      ,[RefFiscalYearID]
      ,[RefVoucherHeaderID]
      ,[ReturnImportNo]
      ,[ReturnImportDate]
      ,[RefKindID]
      ,[RefWarehouseID]
      ,[RefDetailAccountID]
      ,[ByRefrence]
      ,[Comment]
      ,[_TotalPrice]
      ,[_TotalTaxPrice]
      ,[_TotalChargePrice]
      ,[_TotalTransportPrice]
      ,[_TotalTransportTaxPrice]
      ,[_TotalTransportChargePrice]
      ,[_TotalNetPrice]
      ,[RefStatusID]
      ,[RefWriterID]
      ,[CreateDate]
      ,[RefEditorID]
      ,[UpdateDate]
      ,[RefAmountConfirmStatusID]
      ,[AmountConfirmStatusUpdateDate]
      ,[_TotalAvgPrice]
      ,[_TotalNetAvgPrice]
      ,[TaxPrice]
      ,[ChargePrice]
      ,[TotalPrice]
      ,[AvgPrice]
      ,[TotalAvgPrice]
      ,[Price]
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
      ,[RefVoucherTypeID]
      ,[RefFiscalYearID]
      ,[RefVoucherHeaderID]
      ,[ReturnImportNo]
      ,[ReturnImportDate]
      ,[RefKindID]
      ,[RefWarehouseID]
      ,[RefDetailAccountID]
      ,[ByRefrence]
      ,[Comment]
      ,[_TotalPrice]
      ,[_TotalTaxPrice]
      ,[_TotalChargePrice]
      ,[_TotalTransportPrice]
      ,[_TotalTransportTaxPrice]
      ,[_TotalTransportChargePrice]
      ,[_TotalNetPrice]
      ,[RefStatusID]
      ,[RefWriterID]
      ,[CreateDate]
      ,[RefEditorID]
      ,[UpdateDate]
      ,[RefAmountConfirmStatusID]
      ,[AmountConfirmStatusUpdateDate]
      ,[_TotalAvgPrice]
      ,[_TotalNetAvgPrice]
      ,[TaxPrice]
      ,[ChargePrice]
      ,[TotalPrice]
      ,[AvgPrice]
      ,[TotalAvgPrice]
      ,[Price]
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
					Print'Trg_ReturnImportHeader ERROR'
			END CATCH
		END
    
END
SET ANSI_NULLS ON
GO