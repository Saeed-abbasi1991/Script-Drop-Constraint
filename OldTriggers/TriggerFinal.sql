
IF object_id(N'STO.Trg_ImportHeader', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ImportHeader
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ImportHeader] ON [sadganPaloodDev].[STO].[ImportHeader] AFTER INSERT, DELETE,UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin WHERE SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act INT = 0--INSERT
	IF EXISTS(SELECT Id FROM DELETED WHERE Id IN (SELECT id FROM INSERTED))
		SET @Act=1--UPDATE
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2--DELETE

		IF @Act=0 or @Act=1
			BEGIN
				INSERT INTO sadganBase.STO.ImportHeader
							([RefVoucherTypeID]
							,[RefFiscalYearID]
							,[RefVoucherHeaderID]
							,[ImportNo]
							,[ImportDate]
							,[RefKindID]
							,[RefWarehouseID]
							,[RefDetailAccountID]
							,[ByRefrence]
							,[Comment]
							,[_TotalPrice]
							,[_TotalDiscount]
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
							,[BuyFactorNo]
							,[BuyFactorDate]
							,[Discount]
							,[TaxPrice]
							,[ChargePrice]
							,[IncrementalFactorPrice]
							,[IncrementalFactorTaxPrice]
							,[IncrementalFactorChargePrice]
							,[DiscountedPrice]
							,[PayablePrice]
							,[FinalPrice]
							,[TotalPrice]
							,[Price]
							,[__Updated315__]
							,[ID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							)
					SELECT
						   [RefVoucherTypeID]
						  ,[RefFiscalYearID]
						  ,[RefVoucherHeaderID]
						  ,[ImportNo]
						  ,[ImportDate]
						  ,[RefKindID]
						  ,[RefWarehouseID]
						  ,[RefDetailAccountID]
						  ,[ByRefrence]
						  ,[Comment]
						  ,[_TotalPrice]
						  ,[_TotalDiscount]
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
						  ,[BuyFactorNo]
						  ,[BuyFactorDate]
						  ,[Discount]
						  ,[TaxPrice]
						  ,[ChargePrice]
						  ,[IncrementalFactorPrice]
						  ,[IncrementalFactorTaxPrice]
						  ,[IncrementalFactorChargePrice]
						  ,[DiscountedPrice]
						  ,[PayablePrice]
						  ,[FinalPrice]
						  ,[TotalPrice]
						  ,[Price]
						  ,[__Updated315__]
						  ,[ID]
						  ,getdate()
						  ,@User_LoginId
						  ,@Act
					FROM
						INSERTED i
			END

		ELSE
			BEGIN
				INSERT INTO sadganBase.STO.ImportHeader
							([RefVoucherTypeID]
							,[RefFiscalYearID]
							,[RefVoucherHeaderID]
							,[ImportNo]
							,[ImportDate]
							,[RefKindID]
							,[RefWarehouseID]
							,[RefDetailAccountID]
							,[ByRefrence]
							,[Comment]
							,[_TotalPrice]
							,[_TotalDiscount]
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
							,[BuyFactorNo]
							,[BuyFactorDate]
							,[Discount]
							,[TaxPrice]
							,[ChargePrice]
							,[IncrementalFactorPrice]
							,[IncrementalFactorTaxPrice]
							,[IncrementalFactorChargePrice]
							,[DiscountedPrice]
							,[PayablePrice]
							,[FinalPrice]
							,[TotalPrice]
							,[Price]
							,[__Updated315__]
							,[ID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action])
                      SELECT
							 [RefVoucherTypeID]
							,[RefFiscalYearID]
							,[RefVoucherHeaderID]
							,[ImportNo]
							,[ImportDate]
							,[RefKindID]
							,[RefWarehouseID]
							,[RefDetailAccountID]
							,[ByRefrence]
							,[Comment]
							,[_TotalPrice]
							,[_TotalDiscount]
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
							,[BuyFactorNo]
							,[BuyFactorDate]
							,[Discount]
							,[TaxPrice]
							,[ChargePrice]
							,[IncrementalFactorPrice]
							,[IncrementalFactorTaxPrice]
							,[IncrementalFactorChargePrice]
							,[DiscountedPrice]
							,[PayablePrice]
							,[FinalPrice]
							,[TotalPrice]
							,[Price]
							,[__Updated315__]
							,[ID]
							,getdate()
							,@User_LoginId
							,@Act
		               FROM
			DELETED i
		    END
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------

IF object_id(N'STO.Trg_ImportDetailIncrementalFactor', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ImportDetailIncrementalFactor
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ImportDetailIncrementalFactor] ON [sadganPaloodDev].[STO].[ImportDetailIncrementalFactor]AFTER INSERT, DELETE,UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin WHERE SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act INT = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id IN (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE if EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
				INSERT INTO sadganBase.STO.ImportDetailIncrementalFactor(
							 [ID]
							,[RefImportHeaderID]
							,[RefCategoryID]
							,[RefLedgerAccountID]
							,[RefDetailAccountID]
							,[RefDetailAccount2ID]
							,[RefDetailAccount3ID]
							,[Price]
							,[TaxPrice]
							,[ChargePrice]
							,[RefBaseOfSharingID]
							,[Comment]
							,[RowNo]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action]
							)
					SELECT
						   [ID]
						  ,[RefImportHeaderID]
						  ,[RefCategoryID]
						  ,[RefLedgerAccountID]
						  ,[RefDetailAccountID]
						  ,[RefDetailAccount2ID]
						  ,[RefDetailAccount3ID]
						  ,[Price]
						  ,[TaxPrice]
						  ,[ChargePrice]
						  ,[RefBaseOfSharingID]
						  ,[Comment]
						  ,[RowNo]
						  ,getdate()
						  ,@User_LoginId
						  ,@Act
					FROM
							INSERTED i
			END

		ELSE
			BEGIN
				INSERT INTO sadganBase.STO.ImportDetailIncrementalFactor
							([ID]
							,[RefImportHeaderID]
							,[RefCategoryID]
							,[RefLedgerAccountID]
							,[RefDetailAccountID]
							,[RefDetailAccount2ID]
							,[RefDetailAccount3ID]
							,[Price]
							,[TaxPrice]
							,[ChargePrice]
							,[RefBaseOfSharingID]
							,[Comment]
							,[RowNo]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action])
			          SELECT
							 [ID]
							,[RefImportHeaderID]
							,[RefCategoryID]
							,[RefLedgerAccountID]
							,[RefDetailAccountID]
							,[RefDetailAccount2ID]
							,[RefDetailAccount3ID]
							,[Price]
							,[TaxPrice]
							,[ChargePrice]
							,[RefBaseOfSharingID]
							,[Comment]
							,[RowNo]
							,getdate()
							,@User_LoginId
							,@Act
			     FROM
					 DELETED i
			END
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------

IF object_id(N'STO.Trg_ImportDetailItem', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ImportDetailItem
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ImportDetailItem]ON [sadganPaloodDev].[STO].[ImportDetailItem]AFTER INSERT, DELETE,UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin WHERE SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	if EXISTS(SELECT id FROM deleted WHERE id IN (SELECT id FROM INSERTED))
		set @Act=1/*update*/
	ELSE if EXISTS(SELECT 1 FROM deleted)
		set @Act=2/*delete*/

		if @Act=0 or @Act=1
			BEGIN
				INSERT INTO sadganBase.STO.ImportDetailItem
						([ID]
						,[RefImportHeaderID]
						,[RowNo]
						,[RefGoodsID]
						,[RefBaseUnitID]
						,[BaseAmount]
						,[RefLateralUnitID]
						,[LateralAmount]
						,[_MainUnit]
						,[_Amount]
						,[_Rate]
						,[Price]
						,[Discount]
						,[TaxPrice]
						,[ChargePrice]
						,[_TransportPrice]
						,[_TransportTaxPrice]
						,[_TransportChargePrice]
						,[_NetPrice]
						,[Comment]
						,[ORDERValue]
						,[RemainRate]
						,[RemainPrice]
						,[RemainAmount]
						,[RefPricingHeaderID]
						,[RefBuyFactorDetailID]
						,[LastRateBuy]
						,[_RefBaseUnitID]
						,[_BaseAmount]
						,[_RefLateralUnitID]
						,[_LateralAmount]
						,[_Price]
						,[_Discount]
						,[_TaxPrice]
						,[_ChargePrice]
						,[BaseRate]
						,[LateralRate]
						,[IncrementalFactorPrice]
						,[IncrementalFactorTaxPrice]
						,[IncrementalFactorChargePrice]
						,[DiscountedPrice]
						,[PayablePrice]
						,[FinalPrice]
						,[TotalPrice]
						,[__Updated315__]
						,[LogDate]
						,[User_LoginId]
						,[Log_Action])
                 SELECT
						 [ID]
						,[RefImportHeaderID]
						,[RowNo]
						,[RefGoodsID]
						,[RefBaseUnitID]
						,[BaseAmount]
						,[RefLateralUnitID]
						,[LateralAmount]
						,[_MainUnit]
						,[_Amount]
						,[_Rate]
						,[Price]
						,[Discount]
						,[TaxPrice]
						,[ChargePrice]
						,[_TransportPrice]
						,[_TransportTaxPrice]
						,[_TransportChargePrice]
						,[_NetPrice]
						,[Comment]
						,[ORDERValue]
						,[RemainRate]
						,[RemainPrice]
						,[RemainAmount]
						,[RefPricingHeaderID]
						,[RefBuyFactorDetailID]
						,[LastRateBuy]
						,[_RefBaseUnitID]
						,[_BaseAmount]
						,[_RefLateralUnitID]
						,[_LateralAmount]
						,[_Price]
						,[_Discount]
						,[_TaxPrice]
						,[_ChargePrice]
						,[BaseRate]
						,[LateralRate]
						,[IncrementalFactorPrice]
						,[IncrementalFactorTaxPrice]
						,[IncrementalFactorChargePrice]
						,[DiscountedPrice]
						,[PayablePrice]
						,[FinalPrice]
						,[TotalPrice]
						,[__Updated315__]
						,getdate()
						,@User_LoginId
						,@Act
					FROM
						INSERTED i
			END

		ELSE
			BEGIN
				INSERT INTO sadganBase.STO.ImportDetailItem
					([ID]
					,[RefImportHeaderID]
					,[RowNo]
					,[RefGoodsID]
					,[RefBaseUnitID]
					,[BaseAmount]
					,[RefLateralUnitID]
					,[LateralAmount]
					,[_MainUnit]
					,[_Amount]
					,[_Rate]
					,[Price]
					,[Discount]
					,[TaxPrice]
					,[ChargePrice]
					,[_TransportPrice]
					,[_TransportTaxPrice]
					,[_TransportChargePrice]
					,[_NetPrice]
					,[Comment]
					,[ORDERValue]
					,[RemainRate]
					,[RemainPrice]
					,[RemainAmount]
					,[RefPricingHeaderID]
					,[RefBuyFactorDetailID]
					,[LastRateBuy]
					,[_RefBaseUnitID]
					,[_BaseAmount]
					,[_RefLateralUnitID]
					,[_LateralAmount]
					,[_Price]
					,[_Discount]
					,[_TaxPrice]
					,[_ChargePrice]
					,[BaseRate]
					,[LateralRate]
					,[IncrementalFactorPrice]
					,[IncrementalFactorTaxPrice]
					,[IncrementalFactorChargePrice]
					,[DiscountedPrice]
					,[PayablePrice]
					,[FinalPrice]
					,[TotalPrice]
					,[__Updated315__]
					,[LogDate]
					,[User_LoginId]
					,[Log_Action])
			SELECT
					 [ID]
					,[RefImportHeaderID]
					,[RowNo]
					,[RefGoodsID]
					,[RefBaseUnitID]
					,[BaseAmount]
					,[RefLateralUnitID]
					,[LateralAmount]
					,[_MainUnit]
					,[_Amount]
					,[_Rate]
					,[Price]
					,[Discount]
					,[TaxPrice]
					,[ChargePrice]
					,[_TransportPrice]
					,[_TransportTaxPrice]
					,[_TransportChargePrice]
					,[_NetPrice]
					,[Comment]
					,[ORDERValue]
					,[RemainRate]
					,[RemainPrice]
					,[RemainAmount]
					,[RefPricingHeaderID]
					,[RefBuyFactorDetailID]
					,[LastRateBuy]
					,[_RefBaseUnitID]
					,[_BaseAmount]
					,[_RefLateralUnitID]
					,[_LateralAmount]
					,[_Price]
					,[_Discount]
					,[_TaxPrice]
					,[_ChargePrice]
					,[BaseRate]
					,[LateralRate]
					,[IncrementalFactorPrice]
					,[IncrementalFactorTaxPrice]
					,[IncrementalFactorChargePrice]
					,[DiscountedPrice]
					,[PayablePrice]
					,[FinalPrice]
					,[TotalPrice]
					,[__Updated315__]
					,getdate()
					,@User_LoginId
					,@Act
		  FROM
			  deleted i
			END
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------

IF object_id(N'STO.Trg_ImportDetailOppositLedger', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ImportDetailOppositLedger
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ImportDetailOppositLedger]
ON [sadganPaloodDev].[STO].[ImportDetailOppositLedger]
AFTER INSERT, DELETE,UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin WHERE SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act INT = 0/*insert*/
	if EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
		BEGIN
			INSERT INTO sadganBase.STO.ImportDetailOppositLedger
					   ([ID]
					   ,[RefImportHeaderID]
					   ,[RefLedgerAccountID]
					   ,[RefDetailAccountID]
					   ,[RefDetailAccount2ID]
					   ,[RefDetailAccount3ID]
					   ,[Percentage]
					   ,[Price]
					   ,[LogDate]
					   ,[User_LoginId]
					   ,[Log_Action])
			      SELECT
						 [ID]
					    ,[RefImportHeaderID]
						,[RefLedgerAccountID]
						,[RefDetailAccountID]
						,[RefDetailAccount2ID]
						,[RefDetailAccount3ID]
						,[Percentage]
						,[Price]
						,getdate()
						,@User_LoginId
						,@Act
				  FROM
					  INSERTED i
		END

		ELSE
		    BEGIN
				INSERT INTO sadganBase.STO.ImportDetailOppositLedger
							([ID]
							,[RefImportHeaderID]
							,[RefLedgerAccountID]
							,[RefDetailAccountID]
							,[RefDetailAccount2ID]
							,[RefDetailAccount3ID]
							,[Percentage]
							,[Price]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action])
                      SELECT
							 [ID]
							,[RefImportHeaderID]
							,[RefLedgerAccountID]
							,[RefDetailAccountID]
							,[RefDetailAccount2ID]
							,[RefDetailAccount3ID]
							,[Percentage]
							,[Price]
							,getdate()
							,@User_LoginId
							,@Act
				      FROM
                          deleted i
	        END
        END
SET ANSI_NULLS ON
GO
------------------------------------------------------------

IF object_id(N'STO.Trg_ImportDetailPaymentMethod', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ImportDetailPaymentMethod
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ImportDetailPaymentMethod]
ON [sadganPaloodDev].[STO].[ImportDetailPaymentMethod]
AFTER INSERT, DELETE,UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	if EXISTS(SELECT id FROM deleted where id in (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE if EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
		BEGIN
			INSERT INTO sadganBase.STO.ImportDetailPaymentMethod
						([ID]
						,[RefImportHeaderID]
						,[RowNo]
						,[RefPaymentTypeID]
						,[PaymentDate]
						,[PaymentPrice]
						,[IsPaid]
						,[LogDate]
						,[User_LoginId]
						,[Log_Action])
				  SELECT
						 [ID]
						,[RefImportHeaderID]
						,[RowNo]
						,[RefPaymentTypeID]
						,[PaymentDate]
						,[PaymentPrice]
						,[IsPaid]
						,getdate()
						,@User_LoginId
						,@Act
				 FROM
                     INSERTED i
		END
		
		ELSE
			BEGIN
				INSERT INTO sadganBase.STO.ImportDetailPaymentMethod
						  ([ID]
						  ,[RefImportHeaderID]
						  ,[RowNo]
						  ,[RefPaymentTypeID]
						  ,[PaymentDate]
						  ,[PaymentPrice]
						  ,[IsPaid]
						  ,[LogDate]
						  ,[User_LoginId]
						  ,[Log_Action])
					SELECT
						   [ID]
						  ,[RefImportHeaderID]
						  ,[RowNo]
						  ,[RefPaymentTypeID]
						  ,[PaymentDate]
						  ,[PaymentPrice]
						  ,[IsPaid]
						  ,getdate()
						  ,@User_LoginId
						  ,@Act
					  FROM
						deleted i
			END
	    END
SET ANSI_NULLS ON
GO
------------------------------------------------------------


IF object_id(N'STO.Trg_ImportDetailTransport', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ImportDetailTransport
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ImportDetailTransport]
ON [sadganPaloodDev].[STO].[ImportDetailTransport]
AFTER INSERT, DELETE,UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	if EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
				INSERT INTO sadganBase.STO.ImportDetailTransport
						   ([ID]
						  ,[RefImportHeaderID]
						  ,[RefDetailAccountID]
						  ,[Price]
						  ,[TaxPrice]
						  ,[ChargePrice]
						  ,[SharingBasis]
						  ,[Deliverer]
						  ,[Comment]
						  ,[LogDate]
						  ,[User_LoginId]
						  ,[Log_Action])
					SELECT
						   [ID]
						  ,[RefImportHeaderID]
						  ,[RefDetailAccountID]
						  ,[Price]
						  ,[TaxPrice]
						  ,[ChargePrice]
						  ,[SharingBasis]
						  ,[Deliverer]
						  ,[Comment]
						  ,getdate()
						  ,@User_LoginId
						  ,@Act
					FROM
						INSERTED i
			END

		ELSE
			BEGIN
				INSERT INTO sadganBase.STO.ImportDetailTransport(
						   [ID]
						  ,[RefImportHeaderID]
						  ,[RefDetailAccountID]
						  ,[Price]
						  ,[TaxPrice]
						  ,[ChargePrice]
						  ,[SharingBasis]
						  ,[Deliverer]
						  ,[Comment]
						  ,[LogDate]
						  ,[User_LoginId]
						  ,[Log_Action])
					SELECT
						   [ID]
						  ,[RefImportHeaderID]
						  ,[RefDetailAccountID]
						  ,[Price]
						  ,[TaxPrice]
						  ,[ChargePrice]
						  ,[SharingBasis]
						  ,[Deliverer]
						  ,[Comment]
						  ,getdate()
						  ,@User_LoginId
						  ,@Act
					FROM
						deleted i
			END
    
END
SET ANSI_NULLS ON
GO
------------------------------------------------------------


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

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id IN (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
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
						  ,[ORDERValue]
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
						  ,[Log_Action])
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
						  ,[ORDERValue]
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
						FROM
							INSERTED i
			END

		ELSE
			BEGIN
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
							  ,[ORDERValue]
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
							  ,[Log_Action])
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
							  ,[ORDERValue]
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
							FROM
								deleted i
			END
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------

IF object_id(N'STO.Trg_ReturnImportDetailOppositLedger', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ReturnImportDetailOppositLedger
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ReturnImportDetailOppositLedger]
ON [sadganPaloodDev].[STO].[ReturnImportDetailOppositLedger]
AFTER INSERT, DELETE,UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act INT = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM INSERTED))
		set @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
				INSERT INTO sadganBase.STO.ReturnImportDetailOppositLedger
						   ([ID]
						  ,[RefReturnImportHeaderID]
						  ,[RefLedgerAccountID]
						  ,[RefDetailAccountID]
						  ,[RefDetailAccount2ID]
						  ,[RefDetailAccount3ID]
						  ,[Percentage]
						  ,[Price]
						  ,[LogDate]
						  ,[User_LoginId]
						  ,[Log_Action])
					SELECT
						   [ID]
						  ,[RefReturnImportHeaderID]
						  ,[RefLedgerAccountID]
						  ,[RefDetailAccountID]
						  ,[RefDetailAccount2ID]
						  ,[RefDetailAccount3ID]
						  ,[Percentage]
						  ,[Price]
						  ,getdate()
						  ,@User_LoginId
						  ,@Act
					FROM
						INSERTED i
			END

		ELSE
			BEGIN
				INSERT INTO sadganBase.STO.ReturnImportDetailOppositLedger
							 ([ID]
							,[RefReturnImportHeaderID]
							,[RefLedgerAccountID]
							,[RefDetailAccountID]
							,[RefDetailAccount2ID]
							,[RefDetailAccount3ID]
							,[Percentage]
							,[Price]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action])
				     SELECT
							 [ID]
							,[RefReturnImportHeaderID]
							,[RefLedgerAccountID]
							,[RefDetailAccountID]
							,[RefDetailAccount2ID]
							,[RefDetailAccount3ID]
							,[Percentage]
							,[Price]
							,getdate()
							,@User_LoginId
							,@Act
				       FROM
					       deleted i
			END
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------
IF object_id(N'STO.Trg_ReturnImportDetailTransport', N'TR') IS NOT NULL DROP TRIGGER STO.Trg_ReturnImportDetailTransport
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ReturnImportDetailTransport]
ON [sadganPaloodDev].[STO].[ReturnImportDetailTransport]
AFTER INSERT, DELETE,UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
				INSERT INTO sadganBase.STO.ReturnImportDetailTransport
							([RefDetailAccountID]
							,[Price]
							,[TaxPrice]
							,[ChargePrice]
							,[SharingBasis]
							,[Deliverer]
							,[Comment]
							,[ID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action])
					SELECT
						   [RefDetailAccountID]
						  ,[Price]
						  ,[TaxPrice]
						  ,[ChargePrice]
						  ,[SharingBasis]
						  ,[Deliverer]
						  ,[Comment]
						  ,[ID]
						  ,getdate()
						  ,@User_LoginId
						  ,@Act
					FROM
							INSERTED i
			END

		ELSE
			BEGIN
				INSERT INTO sadganBase.STO.ReturnImportDetailTransport
							([RefDetailAccountID]
							,[Price]
							,[TaxPrice]
							,[ChargePrice]
							,[SharingBasis]
							,[Deliverer]
							,[Comment]
							,[ID]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action])
					  SELECT
							 [RefDetailAccountID]
							,[Price]
							,[TaxPrice]
							,[ChargePrice]
							,[SharingBasis]
							,[Deliverer]
							,[Comment]
							,[ID]
							,getdate()
							,@User_LoginId
							,@Act
					  FROM
						  deleted i
			END
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------
IF object_id(N'STO.ReturnImportHeader', N'TR') IS NOT NULL DROP TRIGGER STO.ReturnImportHeader
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

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	if EXISTS(SELECT id FROM deleted where id in (SELECT id FROM INSERTED))
		set @Act=1/*update*/
	ELSE if EXISTS(SELECT 1 FROM deleted)
		set @Act=2/*delete*/

		if @Act=0 or @Act=1
			BEGIN
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
							,[Log_Action])
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
					FROM
						INSERTED i
			END

		ELSE
		BEGIN
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
						,[Log_Action])
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
					FROM
						deleted i
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

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	if EXISTS(SELECT id FROM deleted where id in (SELECT id FROM INSERTED))
		set @Act=1/*update*/
	ELSE if EXISTS(SELECT 1 FROM deleted)
		set @Act=2/*delete*/

		if @Act=0 or @Act=1
			BEGIN
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
							,[_TotalPrice]
							,[_TotalDiscount]
							,[_TotalTaxPrice]
							,[_TotalChargePrice]
							,[_TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[FixNo]
							,[Discount]
							,[TaxPrice]
							,[ChargePrice]
							,[DiscountedPrice]
							,[TotalPrice]
							,[Price]
							,[__Updated315__]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action])
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
							,[_TotalPrice]
							,[_TotalDiscount]
							,[_TotalTaxPrice]
							,[_TotalChargePrice]
							,[_TotalNetPrice]
							,[RefStatusID]
							,[RefWriterID]
							,[RefEditorID]
							,[CreateDate]
							,[UpdateDate]
							,[FixNo]
							,[Discount]
							,[TaxPrice]
							,[ChargePrice]
							,[DiscountedPrice]
							,[TotalPrice]
							,[Price]
							,[__Updated315__]
							,getdate()
							,@User_LoginId
							,@Act
					FROM
						INSERTED i
			END

		ELSE
		BEGIN
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
						,[_TotalPrice]
						,[_TotalDiscount]
						,[_TotalTaxPrice]
						,[_TotalChargePrice]
						,[_TotalNetPrice]
						,[RefStatusID]
						,[RefWriterID]
						,[RefEditorID]
						,[CreateDate]
						,[UpdateDate]
						,[FixNo]
						,[Discount]
						,[TaxPrice]
						,[ChargePrice]
						,[DiscountedPrice]
						,[TotalPrice]
						,[Price]
						,[__Updated315__]
						,[LogDate]
						,[User_LoginId]
						,[Log_Action])
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
						,[_TotalPrice]
						,[_TotalDiscount]
						,[_TotalTaxPrice]
						,[_TotalChargePrice]
						,[_TotalNetPrice]
						,[RefStatusID]
						,[RefWriterID]
						,[RefEditorID]
						,[CreateDate]
						,[UpdateDate]
						,[FixNo]
						,[Discount]
						,[TaxPrice]
						,[ChargePrice]
						,[DiscountedPrice]
						,[TotalPrice]
						,[Price]
						,[__Updated315__]
						,getdate()
						,@User_LoginId
						,@Act
					FROM
						deleted i
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

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
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
							,[_MainUnit]
							,[_Amount]
							,[UsedAmount]
							,[_Rate]
							,[Price]
							,[Discount]
							,[TaxPrice]
							,[ChargePrice]
							,[_NetPrice]
							,[IsFund]
							,[RefDebitLedgerAccountID]
							,[RefDebitDetailAccountID]
							,[RefDebitDetailAccount2ID]
							,[RefDebitDetailAccount3ID]
							,[Comment]
							,[_RefBaseUnitID]
							,[_BaseAmount]
							,[_RefLateralUnitID]
							,[_LateralAmount]
							,[_Price]
							,[_Discount]
							,[_TaxPrice]
							,[_ChargePrice]
							,[BaseRate]
							,[LateralRate]
							,[DiscountedPrice]
							,[TotalPrice]
							,[__Updated315__]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action])
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
							,[_MainUnit]
							,[_Amount]
							,[UsedAmount]
							,[_Rate]
							,[Price]
							,[Discount]
							,[TaxPrice]
							,[ChargePrice]
							,[_NetPrice]
							,[IsFund]
							,[RefDebitLedgerAccountID]
							,[RefDebitDetailAccountID]
							,[RefDebitDetailAccount2ID]
							,[RefDebitDetailAccount3ID]
							,[Comment]
							,[_RefBaseUnitID]
							,[_BaseAmount]
							,[_RefLateralUnitID]
							,[_LateralAmount]
							,[_Price]
							,[_Discount]
							,[_TaxPrice]
							,[_ChargePrice]
							,[BaseRate]
							,[LateralRate]
							,[DiscountedPrice]
							,[TotalPrice]
							,[__Updated315__]
							,getdate()
							,@User_LoginId
							,@Act
					FROM
						INSERTED i
			END

		ELSE
			BEGIN
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
							,[_MainUnit]
							,[_Amount]
							,[UsedAmount]
							,[_Rate]
							,[Price]
							,[Discount]
							,[TaxPrice]
							,[ChargePrice]
							,[_NetPrice]
							,[IsFund]
							,[RefDebitLedgerAccountID]
							,[RefDebitDetailAccountID]
							,[RefDebitDetailAccount2ID]
							,[RefDebitDetailAccount3ID]
							,[Comment]
							,[_RefBaseUnitID]
							,[_BaseAmount]
							,[_RefLateralUnitID]
							,[_LateralAmount]
							,[_Price]
							,[_Discount]
							,[_TaxPrice]
							,[_ChargePrice]
							,[BaseRate]
							,[LateralRate]
							,[DiscountedPrice]
							,[TotalPrice]
							,[__Updated315__]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action])
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
							,[_MainUnit]
							,[_Amount]
							,[UsedAmount]
							,[_Rate]
							,[Price]
							,[Discount]
							,[TaxPrice]
							,[ChargePrice]
							,[_NetPrice]
							,[IsFund]
							,[RefDebitLedgerAccountID]
							,[RefDebitDetailAccountID]
							,[RefDebitDetailAccount2ID]
							,[RefDebitDetailAccount3ID]
							,[Comment]
							,[_RefBaseUnitID]
							,[_BaseAmount]
							,[_RefLateralUnitID]
							,[_LateralAmount]
							,[_Price]
							,[_Discount]
							,[_TaxPrice]
							,[_ChargePrice]
							,[BaseRate]
							,[LateralRate]
							,[DiscountedPrice]
							,[TotalPrice]
							,[__Updated315__]
							,getdate()
							,@User_LoginId
							,@Act
						FROM
							deleted i
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

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
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
							,[Log_Action])
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
					FROM
						INSERTED i
			END

		ELSE
			BEGIN
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
							,[Log_Action])
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
						FROM
							deleted i
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

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
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
							,[Log_Action])
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
					FROM
						INSERTED i
			END

		ELSE
			BEGIN
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
							,[Log_Action])
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
						FROM
							deleted i
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

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
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
							,[UsedDetailStatus]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[CustomerNameInPerFactor]
							,[_Price]
							,[_Discount]
							,[_Addition]
							,[_Tax]
							,[_Charge]
							,[_NetPrice]
							,[TaxPrice]
							,[ChargePrice]
							,[TotalPrice]
							,[__Updated315__]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action])
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
							,[UsedDetailStatus]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[CustomerNameInPerFactor]
							,[_Price]
							,[_Discount]
							,[_Addition]
							,[_Tax]
							,[_Charge]
							,[_NetPrice]
							,[TaxPrice]
							,[ChargePrice]
							,[TotalPrice]
							,[__Updated315__]
							,getdate()
							,@User_LoginId
							,@Act
					FROM
						INSERTED i
			END

		ELSE
			BEGIN
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
							,[UsedDetailStatus]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[CustomerNameInPerFactor]
							,[_Price]
							,[_Discount]
							,[_Addition]
							,[_Tax]
							,[_Charge]
							,[_NetPrice]
							,[TaxPrice]
							,[ChargePrice]
							,[TotalPrice]
							,[__Updated315__]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action])
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
							,[UsedDetailStatus]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[CustomerNameInPerFactor]
							,[_Price]
							,[_Discount]
							,[_Addition]
							,[_Tax]
							,[_Charge]
							,[_NetPrice]
							,[TaxPrice]
							,[ChargePrice]
							,[TotalPrice]
							,[__Updated315__]
							,getdate()
							,@User_LoginId
							,@Act
						FROM
							deleted i
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

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
				INSERT INTO sadganBase.SAL.PreFactorDetail
							([ID]
							,[RefPreFactorHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[_UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[_Amount]
							,[RefWarehouseID]
							,[_Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[StockReserve]
							,[UsedBaseAmount]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
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
							,[Log_Action])
					SELECT
							 [ID]
							,[RefPreFactorHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[_UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[_Amount]
							,[RefWarehouseID]
							,[_Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[StockReserve]
							,[UsedBaseAmount]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
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
					FROM
						INSERTED i
			END

		ELSE
			BEGIN
				INSERT INTO sadganBase.SAL.PreFactorDetail
							([ID]
							,[RefPreFactorHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[_UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[_Amount]
							,[RefWarehouseID]
							,[_Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[StockReserve]
							,[UsedBaseAmount]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
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
							,[Log_Action])
						SELECT
							 [ID]
							,[RefPreFactorHeaderID]
							,[RowNo]
							,[RefGoodsID]
							,[_UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[_Amount]
							,[RefWarehouseID]
							,[_Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[StockReserve]
							,[UsedBaseAmount]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
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
						FROM
							deleted i
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

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
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
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
							,[_Price]
							,[_Discount]
							,[_Addition]
							,[_Tax]
							,[_Charge]
							,[_NetPrice]
							,[TaxPrice]
							,[ChargePrice]
							,[TotalPrice]
							,[__Updated315__]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action])
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
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
							,[_Price]
							,[_Discount]
							,[_Addition]
							,[_Tax]
							,[_Charge]
							,[_NetPrice]
							,[TaxPrice]
							,[ChargePrice]
							,[TotalPrice]
							,[__Updated315__]
							,getdate()
							,@User_LoginId
							,@Act
					FROM
						INSERTED i
			END

		ELSE
			BEGIN
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
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
							,[_Price]
							,[_Discount]
							,[_Addition]
							,[_Tax]
							,[_Charge]
							,[_NetPrice]
							,[TaxPrice]
							,[ChargePrice]
							,[TotalPrice]
							,[__Updated315__]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action])
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
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
							,[_Price]
							,[_Discount]
							,[_Addition]
							,[_Tax]
							,[_Charge]
							,[_NetPrice]
							,[TaxPrice]
							,[ChargePrice]
							,[TotalPrice]
							,[__Updated315__]
							,getdate()
							,@User_LoginId
							,@Act
						FROM
							deleted i
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

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
				INSERT INTO sadganBase.SAL.FactorDetail
							([ID]
							,[RefFactorHeaderID]
							,[RefBaseHeaderID]
							,[RefPreFactorDetailID]
							,[RefExportDetailID]
							,[RowNo]
							,[RefGoodsID]
							,[_UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[_Amount]
							,[RefWarehouseID]
							,[_Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
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
							,[Log_Action])
					SELECT
							 [ID]
							,[RefFactorHeaderID]
							,[RefBaseHeaderID]
							,[RefPreFactorDetailID]
							,[RefExportDetailID]
							,[RowNo]
							,[RefGoodsID]
							,[_UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[_Amount]
							,[RefWarehouseID]
							,[_Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
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
					FROM
						INSERTED i
			END

		ELSE
			BEGIN
				INSERT INTO sadganBase.SAL.FactorDetail
							([ID]
							,[RefFactorHeaderID]
							,[RefBaseHeaderID]
							,[RefPreFactorDetailID]
							,[RefExportDetailID]
							,[RowNo]
							,[RefGoodsID]
							,[_UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[_Amount]
							,[RefWarehouseID]
							,[_Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
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
							,[Log_Action])
						SELECT
							 [ID]
							,[RefFactorHeaderID]
							,[RefBaseHeaderID]
							,[RefPreFactorDetailID]
							,[RefExportDetailID]
							,[RowNo]
							,[RefGoodsID]
							,[_UnitType]
							,[RefBaseUnitID]
							,[RefLateralUnitID]
							,[BaseAmount]
							,[LateralAmount]
							,[_Amount]
							,[RefWarehouseID]
							,[_Rate]
							,[Price]
							,[Discount]
							,[Addition]
							,[Comment]
							,[LastRateBuy]
							,[LastRateSale]
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
						FROM
							deleted i
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

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
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
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
							,[_Price]
							,[_Discount]
							,[_Addition]
							,[_Tax]
							,[_Charge]
							,[_NetPrice]
							,[TaxPrice]
							,[ChargePrice]
							,[TotalPrice]
							,[__Updated315__]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action])
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
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
							,[_Price]
							,[_Discount]
							,[_Addition]
							,[_Tax]
							,[_Charge]
							,[_NetPrice]
							,[TaxPrice]
							,[ChargePrice]
							,[TotalPrice]
							,[__Updated315__]
							,getdate()
							,@User_LoginId
							,@Act
					FROM
						INSERTED i
			END

		ELSE
			BEGIN
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
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
							,[_Price]
							,[_Discount]
							,[_Addition]
							,[_Tax]
							,[_Charge]
							,[_NetPrice]
							,[TaxPrice]
							,[ChargePrice]
							,[TotalPrice]
							,[__Updated315__]
							,[LogDate]
							,[User_LoginId]
							,[Log_Action])
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
							,[RefBaseVoucherTypeID]
							,[RefVoucherTypeID]
							,[RefVisitorID]
							,[RefSaleAdditionOppositeLedgerAccountID]
							,[RefSaleAdditionOppositeDetailAccount1ID]
							,[RefSaleAdditionOppositeDetailAccount2ID]
							,[RefSaleAdditionOppositeDetailAccount3ID]
							,[_Price]
							,[_Discount]
							,[_Addition]
							,[_Tax]
							,[_Charge]
							,[_NetPrice]
							,[TaxPrice]
							,[ChargePrice]
							,[TotalPrice]
							,[__Updated315__]
							,getdate()
							,@User_LoginId
							,@Act
						FROM
							deleted i
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

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
				INSERT INTO sadganBase.SAL.ReturnFactorDetail
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
							,[Log_Action])
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
					FROM
						INSERTED i
			END

		ELSE
			BEGIN
				INSERT INTO sadganBase.SAL.ReturnFactorDetail
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
							,[Log_Action])
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
						FROM
							deleted i
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

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM INSERTED))
		SET @Act=1/*update*/
	ELSE IF EXISTS(SELECT 1 FROM deleted)
		SET @Act=2/*delete*/

		IF @Act=0 or @Act=1
			BEGIN
				INSERT INTO sadganBase.SAL.ReturnFactorDetail
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
							,[Log_Action])
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
					FROM
						INSERTED i
			END

		ELSE
			BEGIN
				INSERT INTO sadganBase.SAL.ReturnFactorDetail
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
							,[Log_Action])
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
						FROM
							deleted i
			END
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------