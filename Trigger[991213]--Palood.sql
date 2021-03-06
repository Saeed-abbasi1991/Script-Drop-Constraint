USE sadganPaloodDev
IF object_id(N'STO.Trg_ImportHeader', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ImportHeader
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ImportHeader] ON [sadganPaloodDev].[STO].[ImportHeader] AFTER INSERT, DELETE,UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @User_LoginId ndtid=null
	DECLARE @HostName ndtLongString=(SELECT TOP 1 host_name FROM sys.dm_exec_sessions WHERE session_id=@@SPID)
	DECLARE @Nt_Domain ndtLongString=(SELECT TOP 1 nt_domain FROM sys.dm_exec_sessions WHERE session_id=@@SPID)
	DECLARE @Nt_UserName ndtLongString=(SELECT TOP 1 nt_user_name FROM sys.dm_exec_sessions WHERE session_id=@@SPID)
	DECLARE @ClientAddress ndtLongString=(SELECT TOP 1 client_net_address FROM sys.dm_exec_connections WHERE session_id=@@SPID)
	--SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin WHERE SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act INT = 0--INSERT
	IF EXISTS(SELECT Id FROM DELETED WHERE Id IN (SELECT id FROM INSERTED))
		SET @Act=1--UPDATE
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2--DELETE

		IF @Act=0 or @Act=1
			BEGIN
				BEGIN TRY
						INSERT INTO sadganBase.STO.ImportHeader
							([ID]
							,[RefVoucherTypeID]
							,[RefFiscalYearID]
							,[RefVoucherHeaderID]
							,[ImportNo]
							,[ImportDate]
							,[RefKindID]
							,[RefWarehouseID]
							,[RefDetailAccountID]
							,[ByRefrence]
							,[Comment]
							,[TotalPrice]
							,[TotalDiscount]
							,[TotalTaxPrice]
							,[TotalChargePrice]
							,[TotalTransportPrice]
							,[TotalTransportTaxPrice]
							,[TotalTransportChargePrice]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[BuyFactorNo]
							,[BuyFactorDate]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress]
							)
					SELECT
						   [ID]
						  ,[RefVoucherTypeID]
						  ,[RefFiscalYearID]
						  ,[RefVoucherHeaderID]
						  ,[ImportNo]
						  ,[ImportDate]
						  ,[RefKindID]
						  ,[RefWarehouseID]
						  ,[RefDetailAccountID]
						  ,[ByRefrence]
						  ,[Comment]
						  ,[TotalPrice]
						  ,[TotalDiscount]
						  ,[TotalTaxPrice]
						  ,[TotalChargePrice]
						  ,[TotalTransportPrice]
						  ,[TotalTransportTaxPrice]
						  ,[TotalTransportChargePrice]
						  ,[TotalNetPrice]
						  ,[RefStatusID]
						  ,[RefWriterID]
						  ,[CreateDate]
						  ,[RefEditorID]
						  ,[UpdateDate]
						  ,[RefAmountConfirmStatusID]
						  ,[AmountConfirmStatusUpdateDate]
						  ,[BuyFactorNo]
						  ,[BuyFactorDate]
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
				END CATCH
			END

		ELSE
			BEGIN
			     BEGIN TRY
					INSERT INTO sadganBase.STO.ImportHeader
							([ID]
							,[RefVoucherTypeID]
							,[RefFiscalYearID]
							,[RefVoucherHeaderID]
							,[ImportNo]
							,[ImportDate]
							,[RefKindID]
							,[RefWarehouseID]
							,[RefDetailAccountID]
							,[ByRefrence]
							,[Comment]
							,[TotalPrice]
							,[TotalDiscount]
							,[TotalTaxPrice]
							,[TotalChargePrice]
							,[TotalTransportPrice]
							,[TotalTransportTaxPrice]
							,[TotalTransportChargePrice]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[BuyFactorNo]
							,[BuyFactorDate]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress]
							)
                      SELECT
							 [ID]
							,[RefVoucherTypeID]
							,[RefFiscalYearID]
							,[RefVoucherHeaderID]
							,[ImportNo]
							,[ImportDate]
							,[RefKindID]
							,[RefWarehouseID]
							,[RefDetailAccountID]
							,[ByRefrence]
							,[Comment]
							,[TotalPrice]
							,[TotalDiscount]
							,[TotalTaxPrice]
							,[TotalChargePrice]
							,[TotalTransportPrice]
							,[TotalTransportTaxPrice]
							,[TotalTransportChargePrice]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[BuyFactorNo]
							,[BuyFactorDate]
							,getdate()
							,@User_LoginId
							,@Act
							,@HostName
							,@Nt_Domain
							,@Nt_UserName
							,@ClientAddress
		               FROM
			DELETED i
			     END TRY
				 BEGIN CATCH
				END CATCH
		    END
END
SET ANSI_NULLS ON
GO
------------------------------------------------------------------------------------------------------------------------
IF object_id(N'STO.Trg_ImportDetailItem', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ImportDetailItem
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ImportDetailItem]ON [sadganPaloodDev].[STO].[ImportDetailItem]AFTER INSERT, DELETE,UPDATE
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
	if EXISTS(SELECT id FROM deleted WHERE id IN (SELECT id FROM INSERTED))
		set @Act=1/*update*/
	ELSE if EXISTS(SELECT 1 FROM deleted)
		set @Act=2/*delete*/

		if @Act=0 or @Act=1
			BEGIN
				BEGIN TRY
						INSERT INTO sadganBase.STO.ImportDetailItem
						([ID]
						,[RefImportHeaderID]
						,[RowNo]
						,[RefGoodsID]
						,[RefBaseUnitID]
						,[BaseAmount]
						,[RefLateralUnitID]
						,[LateralAmount]
						,[MainUnit]
						,[Amount]
						,[Rate]
						,[Price]
						,[Discount]
						,[TaxPrice]
						,[ChargePrice]
						,[TransportPrice]
						,[TransportTaxPrice]
						,[TransportChargePrice]
						,[NetPrice]
						,[Comment]
						,[OrderValue]
						,[RemainRate]
						,[RemainPrice]
						,[RemainAmount]
						,[RefPricingHeaderID]
						,[RefBuyFactorDetailID]
						,[LastRateBuy]
						,[LogDate]
						,[User_LoginId]
						,[Log_Action]
						,[Log_HostName]
						,[Log_nt_domain]
						,[Log_nt_username]
						,[Log_ClientAddress])
                 SELECT
						 [ID]
						,[RefImportHeaderID]
						,[RowNo]
						,[RefGoodsID]
						,[RefBaseUnitID]
						,[BaseAmount]
						,[RefLateralUnitID]
						,[LateralAmount]
						,[MainUnit]
						,[Amount]
						,[Rate]
						,[Price]
						,[Discount]
						,[TaxPrice]
						,[ChargePrice]
						,[TransportPrice]
						,[TransportTaxPrice]
						,[TransportChargePrice]
						,[NetPrice]
						,[Comment]
						,[OrderValue]
						,[RemainRate]
						,[RemainPrice]
						,[RemainAmount]
						,[RefPricingHeaderID]
						,[RefBuyFactorDetailID]
						,[LastRateBuy]
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
				Print'Trg_ImportDetailItem ERROR'
				END CATCH
			END

		ELSE
			BEGIN
				BEGIN TRY
							INSERT INTO sadganBase.STO.ImportDetailItem
					([ID]
					,[RefImportHeaderID]
					,[RowNo]
					,[RefGoodsID]
					,[RefBaseUnitID]
					,[BaseAmount]
					,[RefLateralUnitID]
					,[LateralAmount]
					,[MainUnit]
					,[Amount]
					,[Rate]
					,[Price]
					,[Discount]
					,[TaxPrice]
					,[ChargePrice]
					,[TransportPrice]
					,[TransportTaxPrice]
					,[TransportChargePrice]
					,[NetPrice]
					,[Comment]
					,[OrderValue]
					,[RemainRate]
					,[RemainPrice]
					,[RemainAmount]
					,[RefPricingHeaderID]
					,[RefBuyFactorDetailID]
					,[LastRateBuy]
					,[LogDate]
					,[User_LoginId]
					,[Log_Action]
					,[Log_HostName]
					,[Log_nt_domain]
					,[Log_nt_username]
					,[Log_ClientAddress])
			SELECT
					 [ID]
					,[RefImportHeaderID]
					,[RowNo]
					,[RefGoodsID]
					,[RefBaseUnitID]
					,[BaseAmount]
					,[RefLateralUnitID]
					,[LateralAmount]
					,[MainUnit]
					,[Amount]
					,[Rate]
					,[Price]
					,[Discount]
					,[TaxPrice]
					,[ChargePrice]
					,[TransportPrice]
					,[TransportTaxPrice]
					,[TransportChargePrice]
					,[NetPrice]
					,[Comment]
					,[OrderValue]
					,[RemainRate]
					,[RemainPrice]
					,[RemainAmount]
					,[RefPricingHeaderID]
					,[RefBuyFactorDetailID]
					,[LastRateBuy]
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
				Print'Trg_ImportDetailItem ERROR'
				END CATCH
			END
    
END
SET ANSI_NULLS ON
GO
--------------------------------------------------------------------------------------------------------------------------------
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
						INSERT INTO sadganBase.STO.ReturnImportHeader
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
							,[TotalPrice]
							,[TotalTaxPrice]
							,[TotalChargePrice]
							,[TotalTransportPrice]
							,[TotalTransportTaxPrice]
							,[TotalTransportChargePrice]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[TotalAvgPrice]
							,[TotalNetAvgPrice]
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
							,[TotalPrice]
							,[TotalTaxPrice]
							,[TotalChargePrice]
							,[TotalTransportPrice]
							,[TotalTransportTaxPrice]
							,[TotalTransportChargePrice]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[TotalAvgPrice]
							,[TotalNetAvgPrice]
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
					INSERT INTO sadganBase.STO.ReturnImportHeader
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
						,[TotalPrice]
						,[TotalTaxPrice]
						,[TotalChargePrice]
						,[TotalTransportPrice]
						,[TotalTransportTaxPrice]
						,[TotalTransportChargePrice]
						,[TotalNetPrice]
						,[RefStatusID]
						,[RefWriterID]
						,[CreateDate]
						,[RefEditorID]
						,[UpdateDate]
						,[RefAmountConfirmStatusID]
						,[AmountConfirmStatusUpdateDate]
						,[TotalAvgPrice]
						,[TotalNetAvgPrice]
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
						,[TotalPrice]
						,[TotalTaxPrice]
						,[TotalChargePrice]
						,[TotalTransportPrice]
						,[TotalTransportTaxPrice]
						,[TotalTransportChargePrice]
						,[TotalNetPrice]
						,[RefStatusID]
						,[RefWriterID]
						,[CreateDate]
						,[RefEditorID]
						,[UpdateDate]
						,[RefAmountConfirmStatusID]
						,[AmountConfirmStatusUpdateDate]
						,[TotalAvgPrice]
						,[TotalNetAvgPrice]
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
--------------------------------------------------------------------------------------------------------------------------------

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
					INSERT INTO sadganBase.STO.ReturnImportDetailItem
								 ([ID]
								,[RefReturnImportHeaderID]
								,[RowNo]
								,[RefImportDetailItemID]
								,[RefGoodsID]
								,[RefBaseUnitID]
								,[BaseAmount]
								,[RefLateralUnitID]
								,[LateralAmount]
								,[MainUnit]
								,[Amount]
								,[Rate]
								,[Price]
								,[TaxPrice]
								,[ChargePrice]
								,[TransportPrice]
								,[TransportTaxPrice]
								,[TransportChargePrice]
								,[NetPrice]
								,[Comment]
								,[OrderValue]
								,[RemainRate]
								,[RemainPrice]
								,[RemainAmount]
								,[RefPricingHeaderID]
								,[AvgRate]
								,[AvgPrice]
								,[NetAvgPrice]
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
								,[MainUnit]
								,[Amount]
								,[Rate]
								,[Price]
								,[TaxPrice]
								,[ChargePrice]
								,[TransportPrice]
								,[TransportTaxPrice]
								,[TransportChargePrice]
								,[NetPrice]
								,[Comment]
								,[OrderValue]
								,[RemainRate]
								,[RemainPrice]
								,[RemainAmount]
								,[RefPricingHeaderID]
								,[AvgRate]
								,[AvgPrice]
								,[NetAvgPrice]
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
					INSERT INTO sadganBase.STO.ReturnImportDetailItem
							 ([ID]
							,[RefReturnImportHeaderID]
							,[RowNo]
							,[RefImportDetailItemID]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[Price]
							,[TaxPrice]
							,[ChargePrice]
							,[TransportPrice]
							,[TransportTaxPrice]
							,[TransportChargePrice]
							,[NetPrice]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
							,[AvgRate]
							,[AvgPrice]
							,[NetAvgPrice]
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
							  ,[MainUnit]
							  ,[Amount]
							  ,[Rate]
							  ,[Price]
							  ,[TaxPrice]
							  ,[ChargePrice]
							  ,[TransportPrice]
							  ,[TransportTaxPrice]
							  ,[TransportChargePrice]
							  ,[NetPrice]
							  ,[Comment]
							  ,[OrderValue]
							  ,[RemainRate]
							  ,[RemainPrice]
							  ,[RemainAmount]
							  ,[RefPricingHeaderID]
							  ,[AvgRate]
							  ,[AvgPrice]
							  ,[NetAvgPrice]
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
-----------------------------------------------------------
IF object_id(N'STO.Trg_ExportHeader', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ExportHeader
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ExportHeader]
ON [sadganPaloodDev].[STO].[ExportHeader]
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
					INSERT INTO sadganBase.STO.ExportHeader
						    ([ID]
							,[RefFiscalYearID]
							,[RefVoucherTypeID]
							,[RefVoucherHeaderID]
							,[ExportNo]
							,[ExportDate]
							,[RefKindID]
							,[RefWarehouseID]
							,[RefDetailAccountID]
							,[ByRefrence]
							,[RefBaseVoucherTypeID]
							,[Comment]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
						   [ID]
						  ,[RefFiscalYearID]
						  ,[RefVoucherTypeID]
						  ,[RefVoucherHeaderID]
						  ,[ExportNo]
						  ,[ExportDate]
						  ,[RefKindID]
						  ,[RefWarehouseID]
						  ,[RefDetailAccountID]
						  ,[ByRefrence]
						  ,[RefBaseVoucherTypeID]
						  ,[Comment]
						  ,[TotalNetPrice]
						  ,[RefStatusID]
						  ,[RefWriterID]
						  ,[CreateDate]
						  ,[RefEditorID]
						  ,[UpdateDate]
						  ,[RefAmountConfirmStatusID]
						  ,[AmountConfirmStatusUpdateDate]
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
					Print'Trg_ExportHeader ERROR'
				END CATCH
			END

		ELSE
			BEGIN
				BEGIN TRY
				 INSERT INTO sadganBase.STO.ExportHeader
							 ([ID]
							,[RefFiscalYearID]
							,[RefVoucherTypeID]
							,[RefVoucherHeaderID]
							,[ExportNo]
							,[ExportDate]
							,[RefKindID]
							,[RefWarehouseID]
							,[RefDetailAccountID]
							,[ByRefrence]
							,[RefBaseVoucherTypeID]
							,[Comment]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
						SELECT
							 [ID]
							,[RefFiscalYearID]
							,[RefVoucherTypeID]
							,[RefVoucherHeaderID]
							,[ExportNo]
							,[ExportDate]
							,[RefKindID]
							,[RefWarehouseID]
							,[RefDetailAccountID]
							,[ByRefrence]
							,[RefBaseVoucherTypeID]
							,[Comment]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
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
					Print'Trg_ExportHeader ERROR'
				END CATCH
			END
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------
IF object_id(N'STO.Trg_ExportDetailItem', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ExportDetailItem
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ExportDetailItem]
ON [sadganPaloodDev].[STO].[ExportDetailItem]
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
					INSERT INTO sadganBase.STO.ExportDetailItem
						    ([ID]
							,[RefExportHeaderID]
							,[RowNo]
							,[RefPreFactorDetailID]
							,[RefFactorDetailID]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[RefLedgerAccountID]
							,[RefDetailAccountID]
							,[RefDetailAccount2ID]
							,[RefDetailAccount3ID]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
							,[RefGoodsFormulaproductionID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
						   [ID]
						  ,[RefExportHeaderID]
						  ,[RowNo]
						  ,[RefPreFactorDetailID]
						  ,[RefFactorDetailID]
						  ,[RefGoodsID]
						  ,[RefBaseUnitID]
						  ,[BaseAmount]
						  ,[RefLateralUnitID]
						  ,[LateralAmount]
						  ,[MainUnit]
						  ,[Amount]
						  ,[Rate]
						  ,[NetPrice]
						  ,[RefLedgerAccountID]
						  ,[RefDetailAccountID]
						  ,[RefDetailAccount2ID]
						  ,[RefDetailAccount3ID]
						  ,[Comment]
						  ,[OrderValue]
						  ,[RemainRate]
						  ,[RemainPrice]
						  ,[RemainAmount]
						  ,[RefPricingHeaderID]
						  ,[RefGoodsFormulaproductionID]
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
					Print'Trg_ExportDetailItem ERROR'
				END CATCH
			END

		ELSE
			BEGIN
				BEGIN TRY
				 INSERT INTO sadganBase.STO.ExportDetailItem
							 ([ID]
							,[RefExportHeaderID]
							,[RowNo]
							,[RefPreFactorDetailID]
							,[RefFactorDetailID]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[RefLedgerAccountID]
							,[RefDetailAccountID]
							,[RefDetailAccount2ID]
							,[RefDetailAccount3ID]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
							,[RefGoodsFormulaproductionID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
						     [ID]
							,[RefExportHeaderID]
							,[RowNo]
							,[RefPreFactorDetailID]
							,[RefFactorDetailID]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[RefLedgerAccountID]
							,[RefDetailAccountID]
							,[RefDetailAccount2ID]
							,[RefDetailAccount3ID]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
							,[RefGoodsFormulaproductionID]
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
					Print'Trg_ExportDetailItem ERROR'
				END CATCH
			END
		END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------
IF object_id(N'STO.Trg_ReturnExportHeader', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ReturnExportHeader
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ReturnExportHeader]
ON [sadganPaloodDev].[STO].[ReturnExportHeader]
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
					INSERT INTO sadganBase.STO.ReturnExportHeader
						    ([ID]
							,[RefFiscalYearID]
							,[RefVoucherTypeID]
							,[RefVoucherHeaderID]
							,[ReturnExportNo]
							,[ReturnExportDate]
							,[RefKindID]
							,[RefWarehouseID]
							,[RefDetailAccountID]
							,[ByRefrence]
							,[RefBaseVoucherTypeID]
							,[Comment]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
							 [ID]
							,[RefFiscalYearID]
							,[RefVoucherTypeID]
							,[RefVoucherHeaderID]
							,[ReturnExportNo]
							,[ReturnExportDate]
							,[RefKindID]
							,[RefWarehouseID]
							,[RefDetailAccountID]
							,[ByRefrence]
							,[RefBaseVoucherTypeID]
							,[Comment]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
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
					PRINT'ERROR Trg_ReturnExportHeader'
				END CATCH
			END

		ELSE
			BEGIN
				BEGIN TRY
					INSERT INTO sadganBase.STO.ReturnExportHeader
							  ([ID]
							  ,[RefFiscalYearID]
							  ,[RefVoucherTypeID]
							  ,[RefVoucherHeaderID]
							  ,[ReturnExportNo]
							  ,[ReturnExportDate]
							  ,[RefKindID]
							  ,[RefWarehouseID]
							  ,[RefDetailAccountID]
							  ,[ByRefrence]
							  ,[RefBaseVoucherTypeID]
							  ,[Comment]
							  ,[TotalNetPrice]
							  ,[RefStatusID]
							  ,[RefWriterID]
							  ,[CreateDate]
							  ,[RefEditorID]
							  ,[UpdateDate]
							  ,[RefAmountConfirmStatusID]
							  ,[AmountConfirmStatusUpdateDate]
							  ,[LogDate]
							  ,[User_LoginId]
							  ,[Log_Action]
							  ,[Log_HostName]
							  ,[Log_nt_domain]
							  ,[Log_nt_username]
							  ,[Log_ClientAddress])
						SELECT
							   [ID]
							  ,[RefFiscalYearID]
							  ,[RefVoucherTypeID]
							  ,[RefVoucherHeaderID]
							  ,[ReturnExportNo]
							  ,[ReturnExportDate]
							  ,[RefKindID]
							  ,[RefWarehouseID]
							  ,[RefDetailAccountID]
							  ,[ByRefrence]
							  ,[RefBaseVoucherTypeID]
							  ,[Comment]
							  ,[TotalNetPrice]
							  ,[RefStatusID]
							  ,[RefWriterID]
							  ,[CreateDate]
							  ,[RefEditorID]
							  ,[UpdateDate]
							  ,[RefAmountConfirmStatusID]
							  ,[AmountConfirmStatusUpdateDate]
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
					PRINT 'ERROR Trg_ReturnExportHeader'
				END CATCH
			END
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------
IF object_id(N'STO.Trg_ReturnExportDetailItem', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ReturnExportDetailItem
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ReturnExportDetailItem]
ON [sadganPaloodDev].[STO].[ReturnExportDetailItem]
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
					INSERT INTO sadganBase.STO.ReturnExportDetailItem
						    ([ID]
							,[RefReturnExportHeaderID]
							,[RowNo]
							,[RefExportDetailItemID]
							,[RefReturnFactorDetailID]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[RefLedgerAccountID]
							,[RefDetailAccountID]
							,[RefDetailAccount2ID]
							,[RefDetailAccount3ID]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
						   [ID]
						  ,[RefReturnExportHeaderID]
						  ,[RowNo]
						  ,[RefExportDetailItemID]
						  ,[RefReturnFactorDetailID]
						  ,[RefGoodsID]
						  ,[RefBaseUnitID]
						  ,[BaseAmount]
						  ,[RefLateralUnitID]
						  ,[LateralAmount]
						  ,[MainUnit]
						  ,[Amount]
						  ,[Rate]
						  ,[NetPrice]
						  ,[RefLedgerAccountID]
						  ,[RefDetailAccountID]
						  ,[RefDetailAccount2ID]
						  ,[RefDetailAccount3ID]
						  ,[Comment]
						  ,[OrderValue]
						  ,[RemainRate]
						  ,[RemainPrice]
						  ,[RemainAmount]
						  ,[RefPricingHeaderID]
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
				 PRINT'ERROR Trg_ReturnExportDetailItem'
				END CATCH
			END

		ELSE
			BEGIN
				BEGIN TRY
				 INSERT INTO sadganBase.STO.ReturnExportDetailItem
							([ID]
							,[RefReturnExportHeaderID]
							,[RowNo]
							,[RefExportDetailItemID]
							,[RefReturnFactorDetailID]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[RefLedgerAccountID]
							,[RefDetailAccountID]
							,[RefDetailAccount2ID]
							,[RefDetailAccount3ID]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
						SELECT
							 [ID]
							,[RefReturnExportHeaderID]
							,[RowNo]
							,[RefExportDetailItemID]
							,[RefReturnFactorDetailID]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[RefLedgerAccountID]
							,[RefDetailAccountID]
							,[RefDetailAccount2ID]
							,[RefDetailAccount3ID]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
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
				 PRINT'ERROR Trg_ReturnExportDetailItem'
				END CATCH
			END
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------

IF object_id(N'STO.Trg_TransferHeader', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_TransferHeader
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_TransferHeader]
ON [sadganPaloodDev].[STO].[TransferHeader]
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
					INSERT INTO sadganBase.STO.TransferHeader
						    ([ID]
							,[RefVoucherTypeID]
							,[RefFiscalYearID]
							,[TransferNo]
							,[TransferDate]
							,[RefKindID]
							,[RefSourceWarehouseID]
							,[RefTargetWarehouseID]
							,[Comment]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
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
							,[TransferNo]
							,[TransferDate]
							,[RefKindID]
							,[RefSourceWarehouseID]
							,[RefTargetWarehouseID]
							,[Comment]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
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
				 PRINT'ERROR Trg_TransferHeader'
				END CATCH
			END

		ELSE
			BEGIN
			     BEGIN TRY
					INSERT INTO sadganBase.STO.TransferHeader
							([ID]
							,[RefVoucherTypeID]
							,[RefFiscalYearID]
							,[TransferNo]
							,[TransferDate]
							,[RefKindID]
							,[RefSourceWarehouseID]
							,[RefTargetWarehouseID]
							,[Comment]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
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
							,[TransferNo]
							,[TransferDate]
							,[RefKindID]
							,[RefSourceWarehouseID]
							,[RefTargetWarehouseID]
							,[Comment]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
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
				 PRINT'ERROR Trg_TransferHeader'
				END CATCH
			END
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------
IF object_id(N'STO.Trg_TransferDetailItem', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_TransferDetailItem
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_TransferDetailItem]
ON [sadganPaloodDev].[STO].[TransferDetailItem]
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
				INSERT INTO sadganBase.STO.TransferDetailItem
						    ([ID]
							,[RefTransferHeaderID]
							,[RowNo]
							,[RefTransferDetailItemID]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
							 [ID]
							,[RefTransferHeaderID]
							,[RowNo]
							,[RefTransferDetailItemID]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
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
				 PRINT 'ERROR Trg_TransferDetailItem'
				END CATCH			
			END

		ELSE
			BEGIN
			     BEGIN TRY
				 INSERT INTO sadganBase.STO.TransferDetailItem
							([ID]
							,[RefTransferHeaderID]
							,[RowNo]
							,[RefTransferDetailItemID]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
						SELECT
							 [ID]
							,[RefTransferHeaderID]
							,[RowNo]
							,[RefTransferDetailItemID]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
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
				 PRINT 'ERROR Trg_TransferDetailItem'
				END CATCH
			END
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------

IF object_id(N'STO.Trg_StockBeginHeader', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_StockBeginHeader
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_StockBeginHeader]
ON [sadganPaloodDev].[STO].[StockBeginHeader]
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
				               INSERT INTO sadganBase.STO.StockBeginHeader
						    ([ID]
							,[RefVoucherTypeID]
							,[RefFiscalYearID]
							,[FormNo]
							,[FormDate]
							,[RefWarehouseID]
							,[BasedOnPastFiscalYear]
							,[Comment]
							,[TotalNetPrice]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[RefStatusID]
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
							,[FormNo]
							,[FormDate]
							,[RefWarehouseID]
							,[BasedOnPastFiscalYear]
							,[Comment]
							,[TotalNetPrice]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[RefStatusID]
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
					PRINT 'ERROR Trg_StockBeginHeade'
				END CATCH
			END

		ELSE
			BEGIN
				BEGIN TRY
				 INSERT INTO sadganBase.STO.StockBeginHeader
							([ID]
							,[RefVoucherTypeID]
							,[RefFiscalYearID]
							,[FormNo]
							,[FormDate]
							,[RefWarehouseID]
							,[BasedOnPastFiscalYear]
							,[Comment]
							,[TotalNetPrice]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[RefStatusID]
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
							,[FormNo]
							,[FormDate]
							,[RefWarehouseID]
							,[BasedOnPastFiscalYear]
							,[Comment]
							,[TotalNetPrice]
							,[RefWriterID]
							,[CreateDate]
							,[RefEditorID]
							,[UpdateDate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[RefStatusID]
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
					PRINT 'ERROR Trg_StockBeginHeade'
				END CATCH
			END
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------

IF object_id(N'STO.Trg_StockBeginDetailItem', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_StockBeginDetailItem
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_StockBeginDetailItem]
ON [sadganPaloodDev].[STO].[StockBeginDetailItem]
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
					INSERT INTO sadganBase.STO.StockBeginDetailItem
						    ([ID]
							,[RefStockBeginHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
							,[RefStockEndDetailID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
							 [ID]
							,[RefStockBeginHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
							,[RefStockEndDetailID]
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
					PRINT 'ERROR Trg_StockBeginDetailItem'
				END CATCH
			END

		ELSE
			BEGIN
				BEGIN TRY
				 INSERT INTO sadganBase.STO.StockBeginDetailItem
							([ID]
							,[RefStockBeginHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
							,[RefStockEndDetailID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
						SELECT
							 [ID]
							,[RefStockBeginHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
							,[RefStockEndDetailID]
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
					PRINT 'ERROR Trg_StockBeginDetailItem'
				END CATCH
			END
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------


IF object_id(N'STO.Trg_StockEndHeader', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_StockEndHeader
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_StockEndHeader]
ON [sadganPaloodDev].[STO].[StockEndHeader]
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
				INSERT INTO sadganBase.STO.StockEndHeader
						    ([ID]
							,[RefVoucherTypeID]
							,[RefFiscalYearID]
							,[RefKindID]
							,[StockEndNo]
							,[StockEndDate]
							,[RefWarehouseID]
							,[RefStatusID]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[Updatedate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[TotalNetPrice]
							,[Comment]
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
							,[RefKindID]
							,[StockEndNo]
							,[StockEndDate]
							,[RefWarehouseID]
							,[RefStatusID]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[Updatedate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[TotalNetPrice]
							,[Comment]
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
					PRINT 'ERROR Trg_StockEndHeader'
				END CATCH
			END

		ELSE
			BEGIN
			     BEGIN TRY
				 INSERT INTO sadganBase.STO.StockEndHeader
							([ID]
							,[RefVoucherTypeID]
							,[RefFiscalYearID]
							,[RefKindID]
							,[StockEndNo]
							,[StockEndDate]
							,[RefWarehouseID]
							,[RefStatusID]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[Updatedate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[TotalNetPrice]
							,[Comment]
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
							,[RefKindID]
							,[StockEndNo]
							,[StockEndDate]
							,[RefWarehouseID]
							,[RefStatusID]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[Updatedate]
							,[RefAmountConfirmStatusID]
							,[AmountConfirmStatusUpdateDate]
							,[TotalNetPrice]
							,[Comment]
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
					PRINT 'ERROR Trg_StockEndHeader'
				END CATCH
			END
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------
IF object_id(N'STO.Trg_StockEndDetail', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_StockEndDetail
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_StockEndDetail]
ON [sadganPaloodDev].[STO].[StockEndDetail]
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
					INSERT INTO sadganBase.STO.StockEndDetail
						    ([ID]
							,[RefStockEndHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
							 [ID]
							,[RefStockEndHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
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
					PRINT 'ERROR Trg_StockEndDetai'
				END CATCH	
			END

		ELSE
			BEGIN
			BEGIN TRy
				 INSERT INTO sadganBase.STO.StockEndDetail
							([ID]
							,[RefStockEndHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
						SELECT
							 [ID]
							,[RefStockEndHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[Rate]
							,[NetPrice]
							,[Comment]
							,[OrderValue]
							,[RemainRate]
							,[RemainPrice]
							,[RemainAmount]
							,[RefPricingHeaderID]
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
					PRINT 'ERROR Trg_StockEndDetai'
				END CATCH		
			END
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------

IF object_id(N'ACC.Trg_BuyFactorHeader', N'TR') IS NOT NULL DROP TRIGGER ACC.Trg_BuyFactorHeader
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [ACC].[Trg_BuyFactorHeader]
ON [sadganPaloodDev].[ACC].[BuyFactorHeader]
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
				 INSERT INTO sadganBase.ACC.BuyFactorHeader
							([ID]
							,[RefVoucherTypeID]
							,[RefVoucherHeaderID]
							,[RefFiscalYearID]
							,[FactorDate]
							,[FactorNo]
							,[RefDetailAccountID]
							,[RefFactorTypeID]
							,[RefItemTypeID]
							,[RefCreditLedgerAccountID]
							,[RefCreditDetailAccountID]
							,[RefCreditDetailAccount2ID]
							,[RefCreditDetailAccount3ID]
							,[Comment]
							,[TotalPrice]
							,[TotalDiscount]
							,[TotalTaxPrice]
							,[TotalChargePrice]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[FixNo]
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
							,[RefVoucherHeaderID]
							,[RefFiscalYearID]
							,[FactorDate]
							,[FactorNo]
							,[RefDetailAccountID]
							,[RefFactorTypeID]
							,[RefItemTypeID]
							,[RefCreditLedgerAccountID]
							,[RefCreditDetailAccountID]
							,[RefCreditDetailAccount2ID]
							,[RefCreditDetailAccount3ID]
							,[Comment]
							,[TotalPrice]
							,[TotalDiscount]
							,[TotalTaxPrice]
							,[TotalChargePrice]
							,[TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[FixNo]
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
					PRINT 'ERROR Trg_BuyFactorHeader'
				END CATCH
			END

		ELSE
		BEGIN
		       BEGIN TRY
			        INSERT INTO sadganBase.ACC.BuyFactorHeader
						([ID]
						,[RefVoucherTypeID]
						,[RefVoucherHeaderID]
						,[RefFiscalYearID]
						,[FactorDate]
						,[FactorNo]
						,[RefDetailAccountID]
						,[RefFactorTypeID]
						,[RefItemTypeID]
						,[RefCreditLedgerAccountID]
						,[RefCreditDetailAccountID]
						,[RefCreditDetailAccount2ID]
						,[RefCreditDetailAccount3ID]
						,[Comment]
						,[TotalPrice]
						,[TotalDiscount]
						,[TotalTaxPrice]
						,[TotalChargePrice]
						,[TotalNetPrice]
						,[RefStatusID]
						,[RefWriterID]
						,[RefEditorID]
						,[CreateDate]
						,[UpdateDate]
						,[FixNo]
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
						,[RefVoucherHeaderID]
						,[RefFiscalYearID]
						,[FactorDate]
						,[FactorNo]
						,[RefDetailAccountID]
						,[RefFactorTypeID]
						,[RefItemTypeID]
						,[RefCreditLedgerAccountID]
						,[RefCreditDetailAccountID]
						,[RefCreditDetailAccount2ID]
						,[RefCreditDetailAccount3ID]
						,[Comment]
						,[TotalPrice]
						,[TotalDiscount]
						,[TotalTaxPrice]
						,[TotalChargePrice]
						,[TotalNetPrice]
						,[RefStatusID]
						,[RefWriterID]
						,[RefEditorID]
						,[CreateDate]
						,[UpdateDate]
						,[FixNo]
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
					PRINT 'ERROR Trg_BuyFactorHeader'
				END CATCH
		END
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------
IF object_id(N'ACC.Trg_BuyFactorDetail', N'TR') IS NOT NULL DROP TRIGGER ACC.Trg_BuyFactorDetail
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [ACC].[Trg_BuyFactorDetail]
ON [sadganPaloodDev].[ACC].[BuyFactorDetail]
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
				 INSERT INTO sadganBase.ACC.BuyFactorDetail
							([ID]
							,[RefBuyFactorHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[CostComment]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[UsedAmount]
							,[Rate]
							,[Price]
							,[Discount]
							,[TaxPrice]
							,[ChargePrice]
							,[NetPrice]
							,[IsFund]
							,[RefDebitLedgerAccountID]
							,[RefDebitDetailAccountID]
							,[RefDebitDetailAccount2ID]
							,[RefDebitDetailAccount3ID]
							,[Comment]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
							 [ID]
							,[RefBuyFactorHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[CostComment]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[UsedAmount]
							,[Rate]
							,[Price]
							,[Discount]
							,[TaxPrice]
							,[ChargePrice]
							,[NetPrice]
							,[IsFund]
							,[RefDebitLedgerAccountID]
							,[RefDebitDetailAccountID]
							,[RefDebitDetailAccount2ID]
							,[RefDebitDetailAccount3ID]
							,[Comment]
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
					PRINT 'ERROR Trg_BuyFactorDetail'
				END CATCH	
			END

		ELSE
			BEGIN
			   BEGIN TRY
				INSERT INTO sadganBase.ACC.BuyFactorDetail
							([ID]
							,[RefBuyFactorHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[CostComment]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[UsedAmount]
							,[Rate]
							,[Price]
							,[Discount]
							,[TaxPrice]
							,[ChargePrice]
							,[NetPrice]
							,[IsFund]
							,[RefDebitLedgerAccountID]
							,[RefDebitDetailAccountID]
							,[RefDebitDetailAccount2ID]
							,[RefDebitDetailAccount3ID]
							,[Comment]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
						SELECT
							 [ID]
							,[RefBuyFactorHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[CostComment]
							,[RefBaseUnitID]
							,[BaseAmount]
							,[RefLateralUnitID]
							,[LateralAmount]
							,[MainUnit]
							,[Amount]
							,[UsedAmount]
							,[Rate]
							,[Price]
							,[Discount]
							,[TaxPrice]
							,[ChargePrice]
							,[NetPrice]
							,[IsFund]
							,[RefDebitLedgerAccountID]
							,[RefDebitDetailAccountID]
							,[RefDebitDetailAccount2ID]
							,[RefDebitDetailAccount3ID]
							,[Comment]
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
			       PRINT 'ERROR Trg_BuyFactorDetail'
			   END CATCH
			END
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------

IF object_id(N'ACC.Trg_VoucherHeader', N'TR') IS NOT NULL DROP TRIGGER ACC.Trg_VoucherHeader
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [ACC].[Trg_VoucherHeader]
ON [sadganPaloodDev].[ACC].[VoucherHeader]
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
				     INSERT INTO sadganBase.ACC.VoucherHeader
							([ID]
							,[FiscalYearID]
							,[VoucherKindID]
							,[StatusID]
							,[WriterID]
							,[EditorID]
							,[CreateDate]
							,[UpdateDate]
							,[ConfirmerID]
							,[RelateWithSystem]
							,[VoucherDate]
							,[VoucherNo]
							,[SlaveNo]
							,[FixNo]
							,[DailyNo]
							,[AttachCount]
							,[AdditionalInfoID]
							,[Comment]
							,[FaMonth]
							,[FaDay]
							,[TotalPrice]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
							 [ID]
							,[FiscalYearID]
							,[VoucherKindID]
							,[StatusID]
							,[WriterID]
							,[EditorID]
							,[CreateDate]
							,[UpdateDate]
							,[ConfirmerID]
							,[RelateWithSystem]
							,[VoucherDate]
							,[VoucherNo]
							,[SlaveNo]
							,[FixNo]
							,[DailyNo]
							,[AttachCount]
							,[AdditionalInfoID]
							,[Comment]
							,[FaMonth]
							,[FaDay]
							,[TotalPrice]
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
					PRINT 'ERROR Trg_VoucherHeader'
				END CATCH
			END

		ELSE
			BEGIN
			  BEGIN TRY
				INSERT INTO sadganBase.ACC.VoucherHeader
							([ID]
							,[FiscalYearID]
							,[VoucherKindID]
							,[StatusID]
							,[WriterID]
							,[EditorID]
							,[CreateDate]
							,[UpdateDate]
							,[ConfirmerID]
							,[RelateWithSystem]
							,[VoucherDate]
							,[VoucherNo]
							,[SlaveNo]
							,[FixNo]
							,[DailyNo]
							,[AttachCount]
							,[AdditionalInfoID]
							,[Comment]
							,[FaMonth]
							,[FaDay]
							,[TotalPrice]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
						SELECT
							 [ID]
							,[FiscalYearID]
							,[VoucherKindID]
							,[StatusID]
							,[WriterID]
							,[EditorID]
							,[CreateDate]
							,[UpdateDate]
							,[ConfirmerID]
							,[RelateWithSystem]
							,[VoucherDate]
							,[VoucherNo]
							,[SlaveNo]
							,[FixNo]
							,[DailyNo]
							,[AttachCount]
							,[AdditionalInfoID]
							,[Comment]
							,[FaMonth]
							,[FaDay]
							,[TotalPrice]
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
					PRINT 'ERROR Trg_VoucherHeader'
				END CATCH
			END
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------
IF object_id(N'ACC.Trg_VoucherDetail', N'TR') IS NOT NULL DROP TRIGGER ACC.Trg_VoucherDetail
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [ACC].[Trg_VoucherDetail]
ON [sadganPaloodDev].[ACC].[VoucherDetail]
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
				INSERT INTO sadganBase.ACC.VoucherDetail
							([ID]
							,[VoucherHeaderID]
							,[RowNo]
							,[LedgerAccountID]
							,[DetailAccount1ID]
							,[DetailAccount2ID]
							,[DetailAccount3ID]
							,[Debit]
							,[Credit]
							,[Comment]
							,[TrackNo]
							,[TrackDate]
							,[Count]
							,[RefVoucherBaseTypeID]
							,[RefVoucherBaseID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
							 [ID]
							,[VoucherHeaderID]
							,[RowNo]
							,[LedgerAccountID]
							,[DetailAccount1ID]
							,[DetailAccount2ID]
							,[DetailAccount3ID]
							,[Debit]
							,[Credit]
							,[Comment]
							,[TrackNo]
							,[TrackDate]
							,[Count]
							,[RefVoucherBaseTypeID]
							,[RefVoucherBaseID]
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
					PRINT 'ERROR Trg_VoucherDetail'
				END CATCH
			END
			

		ELSE
			BEGIN
			BEGIN TRY
				INSERT INTO sadganBase.ACC.VoucherDetail
							([ID]
							,[VoucherHeaderID]
							,[RowNo]
							,[LedgerAccountID]
							,[DetailAccount1ID]
							,[DetailAccount2ID]
							,[DetailAccount3ID]
							,[Debit]
							,[Credit]
							,[Comment]
							,[TrackNo]
							,[TrackDate]
							,[Count]
							,[RefVoucherBaseTypeID]
							,[RefVoucherBaseID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
						SELECT
							 [ID]
							,[VoucherHeaderID]
							,[RowNo]
							,[LedgerAccountID]
							,[DetailAccount1ID]
							,[DetailAccount2ID]
							,[DetailAccount3ID]
							,[Debit]
							,[Credit]
							,[Comment]
							,[TrackNo]
							,[TrackDate]
							,[Count]
							,[RefVoucherBaseTypeID]
							,[RefVoucherBaseID]
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
					PRINT 'ERROR Trg_VoucherDetail'
				END CATCH
			
			END
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------
IF object_id(N'SAL.Trg_PreFactorHeader', N'TR') IS NOT NULL DROP TRIGGER SAL.Trg_PreFactorHeader
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [SAL].[Trg_PreFactorHeader]
ON [sadganPaloodDev].[SAL].[PreFactorHeader]
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
				  INSERT INTO sadganBase.SAL.PreFactorHeader
							([ID]
							,[RefFiscalYearID]
							,[PreFactorNo]
							,[PreFactorDate]
							,[ExpiryDate]
							,[RefSaleModelID]
							,[RefCustomerID]
							,[StockReserve]
							,[DeliverAddressType]
							,[DeliverAddress]
							,[Comment]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[RefVerifierID]
							,[VerifiedDate]
							,[RefCancelUserID]
							,[CancelDate]
							,[RefSalVoucherStatusID]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[UsedDetailStatus]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[CustomerNameInPerFactor]
							,[NetPrice]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
							 [ID]
							,[RefFiscalYearID]
							,[PreFactorNo]
							,[PreFactorDate]
							,[ExpiryDate]
							,[RefSaleModelID]
							,[RefCustomerID]
							,[StockReserve]
							,[DeliverAddressType]
							,[DeliverAddress]
							,[Comment]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[RefVerifierID]
							,[VerifiedDate]
							,[RefCancelUserID]
							,[CancelDate]
							,[RefSalVoucherStatusID]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[UsedDetailStatus]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[CustomerNameInPerFactor]
							,[NetPrice]
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
					PRINT 'ERROR Trg_PreFactorHeader'
				END CATCH
			END

		ELSE
			BEGIN
			BEGIN TRY
				INSERT INTO sadganBase.SAL.PreFactorHeader
							([ID]
							,[RefFiscalYearID]
							,[PreFactorNo]
							,[PreFactorDate]
							,[ExpiryDate]
							,[RefSaleModelID]
							,[RefCustomerID]
							,[StockReserve]
							,[DeliverAddressType]
							,[DeliverAddress]
							,[Comment]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[RefVerifierID]
							,[VerifiedDate]
							,[RefCancelUserID]
							,[CancelDate]
							,[RefSalVoucherStatusID]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[UsedDetailStatus]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[CustomerNameInPerFactor]
							,[NetPrice]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
						SELECT
							 [ID]
							,[RefFiscalYearID]
							,[PreFactorNo]
							,[PreFactorDate]
							,[ExpiryDate]
							,[RefSaleModelID]
							,[RefCustomerID]
							,[StockReserve]
							,[DeliverAddressType]
							,[DeliverAddress]
							,[Comment]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[RefVerifierID]
							,[VerifiedDate]
							,[RefCancelUserID]
							,[CancelDate]
							,[RefSalVoucherStatusID]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[UsedDetailStatus]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[CustomerNameInPerFactor]
							,[NetPrice]
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
					PRINT 'ERROR Trg_PreFactorHeader'
				END CATCH
			END
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------

IF object_id(N'SAL.Trg_PreFactorDetail', N'TR') IS NOT NULL DROP TRIGGER SAL.Trg_PreFactorDetail
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [SAL].[Trg_PreFactorDetail]
ON [sadganPaloodDev].[SAL].[PreFactorDetail]
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
				INSERT INTO sadganBase.SAL.PreFactorDetail
							([ID]
							,[RefPreFactorHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[Amount]
							,[RefWarehouseID]
							,[Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[StockReserve]
							,[UsedBaseAmount]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
							,[NetPrice]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
							 [ID]
							,[RefPreFactorHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[Amount]
							,[RefWarehouseID]
							,[Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[StockReserve]
							,[UsedBaseAmount]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
							,[NetPrice]
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
					PRINT 'ERROR Trg_PreFactorDetail'
				END CATCH
			END

		ELSE
			BEGIN
			   BEGIN TRY
				INSERT INTO sadganBase.SAL.PreFactorDetail
							([ID]
							,[RefPreFactorHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[Amount]
							,[RefWarehouseID]
							,[Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[StockReserve]
							,[UsedBaseAmount]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
							,[NetPrice]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
						SELECT
							 [ID]
							,[RefPreFactorHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[Amount]
							,[RefWarehouseID]
							,[Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[StockReserve]
							,[UsedBaseAmount]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
							,[NetPrice]
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
					PRINT 'ERROR Trg_PreFactorDetail'
			   END CATCH
			END
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------

IF object_id(N'SAL.Trg_FactorHeader', N'TR') IS NOT NULL DROP TRIGGER SAL.Trg_FactorHeader
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [SAL].[Trg_FactorHeader]
ON [sadganPaloodDev].[SAL].[FactorHeader]
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
				INSERT INTO sadganBase.SAL.FactorHeader
							([ID]
							,[RefFiscalYearID]
							,[RefVoucherHeaderID]
							,[FactorNo]
							,[FactorDate]
							,[RefSaleModelID]
							,[RefCustomerID]
							,[DeliverAddressType]
							,[DeliverAddress]
							,[Comment]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[RefVerifierID]
							,[VerifiedDate]
							,[RefCancelUserID]
							,[CancelDate]
							,[RefSalVoucherStatusID]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
							 [ID]
							,[RefFiscalYearID]
							,[RefVoucherHeaderID]
							,[FactorNo]
							,[FactorDate]
							,[RefSaleModelID]
							,[RefCustomerID]
							,[DeliverAddressType]
							,[DeliverAddress]
							,[Comment]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[RefVerifierID]
							,[VerifiedDate]
							,[RefCancelUserID]
							,[CancelDate]
							,[RefSalVoucherStatusID]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
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
					PRINT 'ERROR Trg_FactorHeader'
			   END CATCH
			END

		ELSE
			BEGIN
				BEGIN TRY
				INSERT INTO sadganBase.SAL.FactorHeader
							([ID]
							,[RefFiscalYearID]
							,[RefVoucherHeaderID]
							,[FactorNo]
							,[FactorDate]
							,[RefSaleModelID]
							,[RefCustomerID]
							,[DeliverAddressType]
							,[DeliverAddress]
							,[Comment]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[RefVerifierID]
							,[VerifiedDate]
							,[RefCancelUserID]
							,[CancelDate]
							,[RefSalVoucherStatusID]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
						SELECT
							 [ID]
							,[RefFiscalYearID]
							,[RefVoucherHeaderID]
							,[FactorNo]
							,[FactorDate]
							,[RefSaleModelID]
							,[RefCustomerID]
							,[DeliverAddressType]
							,[DeliverAddress]
							,[Comment]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[RefVerifierID]
							,[VerifiedDate]
							,[RefCancelUserID]
							,[CancelDate]
							,[RefSalVoucherStatusID]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
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
					PRINT 'ERROR Trg_FactorHeader'
			   END CATCH
			END
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------

IF object_id(N'SAL.Trg_FactorDetail', N'TR') IS NOT NULL DROP TRIGGER SAL.Trg_FactorDetail
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [SAL].[Trg_FactorDetail]
ON [sadganPaloodDev].[SAL].[FactorDetail]
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
				INSERT INTO sadganBase.SAL.FactorDetail
							([ID]
							,[RefFactorHeaderID]
							,[RefBaseHeaderID]
							,[RefPreFactorDetailID]
							,[RefExportDetailID]
							,[RowNo]
							,[RefGoodsID]
							,[UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[Amount]
							,[RefWarehouseID]
							,[Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
							 [ID]
							,[RefFactorHeaderID]
							,[RefBaseHeaderID]
							,[RefPreFactorDetailID]
							,[RefExportDetailID]
							,[RowNo]
							,[RefGoodsID]
							,[UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[Amount]
							,[RefWarehouseID]
							,[Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
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
					PRINT 'ERROR Trg_FactorDetail'
			   END CATCH
			END

		ELSE
			BEGIN
			     BEGIN TRY
				INSERT INTO sadganBase.SAL.FactorDetail
							([ID]
							,[RefFactorHeaderID]
							,[RefBaseHeaderID]
							,[RefPreFactorDetailID]
							,[RefExportDetailID]
							,[RowNo]
							,[RefGoodsID]
							,[UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[Amount]
							,[RefWarehouseID]
							,[Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
						SELECT
							 [ID]
							,[RefFactorHeaderID]
							,[RefBaseHeaderID]
							,[RefPreFactorDetailID]
							,[RefExportDetailID]
							,[RowNo]
							,[RefGoodsID]
							,[UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[Amount]
							,[RefWarehouseID]
							,[Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
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
					PRINT 'ERROR Trg_FactorDetail'
			    END CATCH
			END
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------
IF object_id(N'SAL.Trg_ReturnFactorHeader', N'TR') IS NOT NULL DROP TRIGGER SAL.Trg_ReturnFactorHeader
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [SAL].[Trg_ReturnFactorHeader]
ON [sadganPaloodDev].[SAL].[ReturnFactorHeader]
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
				INSERT INTO sadganBase.SAL.ReturnFactorHeader
							([ID]
							,[RefFiscalYearID]
							,[RefVoucherHeaderID]
							,[ReturnFactorNo]
							,[ReturnFactorDate]
							,[RefSaleModelID]
							,[RefCustomerID]
							,[Comment]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[RefVerifierID]
							,[VerifiedDate]
							,[RefCancelUserID]
							,[CancelDate]
							,[RefSalVoucherStatusID]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
					SELECT
							 [ID]
							,[RefFiscalYearID]
							,[RefVoucherHeaderID]
							,[ReturnFactorNo]
							,[ReturnFactorDate]
							,[RefSaleModelID]
							,[RefCustomerID]
							,[Comment]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[RefVerifierID]
							,[VerifiedDate]
							,[RefCancelUserID]
							,[CancelDate]
							,[RefSalVoucherStatusID]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
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
					PRINT 'ERROR Trg_ReturnFactorHeader'
			    END CATCH
			END

		ELSE
			BEGIN
			    BEGIN TRY
				INSERT INTO sadganBase.SAL.ReturnFactorHeader
							([ID]
							,[RefFiscalYearID]
							,[RefVoucherHeaderID]
							,[ReturnFactorNo]
							,[ReturnFactorDate]
							,[RefSaleModelID]
							,[RefCustomerID]
							,[Comment]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[RefVerifierID]
							,[VerifiedDate]
							,[RefCancelUserID]
							,[CancelDate]
							,[RefSalVoucherStatusID]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							,[Log_HostName]
							,[Log_nt_domain]
							,[Log_nt_username]
							,[Log_ClientAddress])
						SELECT
							 [ID]
							,[RefFiscalYearID]
							,[RefVoucherHeaderID]
							,[ReturnFactorNo]
							,[ReturnFactorDate]
							,[RefSaleModelID]
							,[RefCustomerID]
							,[Comment]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[RefVerifierID]
							,[VerifiedDate]
							,[RefCancelUserID]
							,[CancelDate]
							,[RefSalVoucherStatusID]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
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
					PRINT 'ERROR Trg_ReturnFactorHeader'
			    END CATCH
			END
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------

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
				INSERT INTO sadganBase.SAL.ReturnFactorDetail
							([ID]
							,[RefReturnFactorHeaderID]
							,[RefFactorDetailID]
							,[RowNo]
							,[RefGoodsID]
							,[UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[Amount]
							,[Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[Comment]
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
							,[UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[Amount]
							,[Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[Comment]
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
				INSERT INTO sadganBase.SAL.ReturnFactorDetail
							([ID]
							,[RefReturnFactorHeaderID]
							,[RefFactorDetailID]
							,[RowNo]
							,[RefGoodsID]
							,[UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[Amount]
							,[Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[Comment]
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
							,[UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[Amount]
							,[Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Tax]
							,[Charge]
							,[NetPrice]
							,[Comment]
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
-----------------------------------------------------------