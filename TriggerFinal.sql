-------this is trigger scripts























SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [STO].[Trg_ImportHeader] ON [sadganPaloodDev].[STO].[ImportHeader] AFTER INSERT, DELETE,UPDATE
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ImportDetailIncrementalFactor]
ON [sadganPaloodDev].[STO].[ImportDetailIncrementalFactor]
AFTER INSERT, DELETE,UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin WHERE SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	IF EXISTS(SELECT id FROM deleted WHERE id in (SELECT id FROM inserted))
		set @Act=1/*update*/
	ELSE if exists(SELECT 1 FROM deleted)
		set @Act=2/*delete*/

		if @Act=0 or @Act=1
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
        inserted i
		end

		ELSE
		begin
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
        deleted i
	end
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [STO].[Trg_ImportDetailItem]
ON [sadganPaloodDev].[STO].[ImportDetailItem]
AFTER INSERT, DELETE,UPDATE
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @User_LoginId ndtid
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	if exists(SELECT id FROM deleted where id in (SELECT id FROM inserted))
		set @Act=1/*update*/
	ELSE if exists(SELECT 1 FROM deleted)
		set @Act=2/*delete*/

		if @Act=0 or @Act=1
		begin
			INSERT INTO sadganBase.STO.ImportDetailItem(
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
	  ,[LogDate]
	  ,[User_LoginId]
	  ,[Log_Action]
    )
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
        inserted i
		end

		ELSE
		begin
    INSERT INTO sadganBase.STO.ImportDetailItem(
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
	  ,[LogDate]
	  ,[User_LoginId]
	  ,[Log_Action]
    )
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
	end
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------
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
	
	SELECT @User_LoginId=(SELECT TOP 1 ID FROM GNR.UserLogin where SessionId=@@SPID ORDER BY ServerTime DESC)

	DECLARE @Act int = 0/*insert*/
	if exists(SELECT id FROM deleted where id in (SELECT id FROM inserted))
		set @Act=1/*update*/
	ELSE if exists(SELECT 1 FROM deleted)
		set @Act=2/*delete*/

		if @Act=0 or @Act=1
		begin
			INSERT INTO sadganBase.STO.ImportDetailOppositLedger(
		    [ID]
           ,[RefImportHeaderID]
           ,[RefLedgerAccountID]
           ,[RefDetailAccountID]
		   ,[RefDetailAccount2ID]
		   ,[RefDetailAccount3ID]
		   ,[Percentage]
		   ,[Price]
		   ,[LogDate]
		   ,[User_LoginId]
		   ,[Log_Action]
    )
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
        inserted i
		end

		ELSE
		begin
    INSERT INTO sadganBase.STO.ImportDetailOppositLedger(
	   [ID]
      ,[RefImportHeaderID]
      ,[RefLedgerAccountID]
      ,[RefDetailAccountID]
	  ,[RefDetailAccount2ID]
	  ,[RefDetailAccount3ID]
	  ,[Percentage]
	  ,[Price]
	  ,[LogDate]
	  ,[User_LoginId]
	  ,[Log_Action]
    )
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
	end
    
END
SET ANSI_NULLS ON
GO
------------------------------------------------------------
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
	if exists(SELECT id FROM deleted where id in (SELECT id FROM inserted))
		set @Act=1/*update*/
	ELSE if exists(SELECT 1 FROM deleted)
		set @Act=2/*delete*/

		if @Act=0 or @Act=1
		begin
			INSERT INTO sadganBase.STO.ImportDetailPaymentMethod(
		   [ID]
		  ,[RefImportHeaderID]
		  ,[RowNo]
		  ,[RefPaymentTypeID]
		  ,[PaymentDate]
		  ,[PaymentPrice]
		  ,[IsPaid]
		  ,[LogDate]
		  ,[User_LoginId]
		  ,[Log_Action]
    )
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
        inserted i
		end

		ELSE
		begin
    INSERT INTO sadganBase.STO.ImportDetailPaymentMethod(
	   [ID]
      ,[RefImportHeaderID]
      ,[RowNo]
      ,[RefPaymentTypeID]
      ,[PaymentDate]
      ,[PaymentPrice]
      ,[IsPaid]
	  ,[LogDate]
	  ,[User_LoginId]
	  ,[Log_Action]
    )
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
	end
    
END
SET ANSI_NULLS ON
GO
------------------------------------------------------------
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
	if exists(SELECT id FROM deleted where id in (SELECT id FROM inserted))
		set @Act=1/*update*/
	ELSE if exists(SELECT 1 FROM deleted)
		set @Act=2/*delete*/

		if @Act=0 or @Act=1
		begin
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
		  ,[Log_Action]
    )
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
        inserted i
		end

		ELSE
		begin
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
	  ,[Log_Action]
    )
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
	end
    
END
SET ANSI_NULLS ON
GO
------------------------------------------------------------

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
	if exists(SELECT id FROM deleted where id in (SELECT id FROM inserted))
		set @Act=1/*update*/
	ELSE if exists(SELECT 1 FROM deleted)
		set @Act=2/*delete*/

		if @Act=0 or @Act=1
		begin
			INSERT INTO sadganBase.STO.ReturnImportDetailItem(
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
		  ,[LogDate]
		  ,[User_LoginId]
		  ,[Log_Action]
    )
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
        inserted i
		end

		ELSE
		begin
    INSERT INTO sadganBase.STO.ReturnImportDetailItem(
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
	  ,[LogDate]
	  ,[User_LoginId]
	  ,[Log_Action]
    )
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
	end
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------
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

	DECLARE @Act int = 0/*insert*/
	if exists(SELECT id FROM deleted where id in (SELECT id FROM inserted))
		set @Act=1/*update*/
	ELSE if exists(SELECT 1 FROM deleted)
		set @Act=2/*delete*/

		if @Act=0 or @Act=1
		begin
			INSERT INTO sadganBase.STO.ReturnImportDetailOppositLedger(
		   [ID]
		  ,[RefReturnImportHeaderID]
		  ,[RefLedgerAccountID]
		  ,[RefDetailAccountID]
		  ,[RefDetailAccount2ID]
		  ,[RefDetailAccount3ID]
		  ,[Percentage]
		  ,[Price]
		  ,[LogDate]
		  ,[User_LoginId]
		  ,[Log_Action]
    )
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
        inserted i
		end

		ELSE
		begin
    INSERT INTO sadganBase.STO.ReturnImportDetailOppositLedger(
	   [ID]
      ,[RefReturnImportHeaderID]
      ,[RefLedgerAccountID]
      ,[RefDetailAccountID]
      ,[RefDetailAccount2ID]
      ,[RefDetailAccount3ID]
      ,[Percentage]
      ,[Price]
	  ,[LogDate]
	  ,[User_LoginId]
	  ,[Log_Action]
    )
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
	end
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------

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
	if exists(SELECT id FROM deleted where id in (SELECT id FROM inserted))
		set @Act=1/*update*/
	ELSE if exists(SELECT 1 FROM deleted)
		set @Act=2/*delete*/

		if @Act=0 or @Act=1
		begin
			INSERT INTO sadganBase.STO.ReturnImportDetailTransport(
		     [RefDetailAccountID]
			,[Price]
			,[TaxPrice]
			,[ChargePrice]
			,[SharingBasis]
			,[Deliverer]
			,[Comment]
			,[ID]
		    ,[LogDate]
		    ,[User_LoginId]
		    ,[Log_Action]
    )
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
        inserted i
		end

		ELSE
		begin
    INSERT INTO sadganBase.STO.ReturnImportDetailTransport(
	   [RefDetailAccountID]
	  ,[Price]
      ,[TaxPrice]
	  ,[ChargePrice]
	  ,[SharingBasis]
	  ,[Deliverer]
	  ,[Comment]
	  ,[ID]
	  ,[LogDate]
	  ,[User_LoginId]
	  ,[Log_Action]
    )
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
	end
    
END
SET ANSI_NULLS ON
GO
-----------------------------------------------------------