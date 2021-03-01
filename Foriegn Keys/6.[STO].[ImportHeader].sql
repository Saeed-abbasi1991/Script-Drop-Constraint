BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE STO.ImportHeader
	DROP CONSTRAINT FK_STO_ImportHeader_RefWriterID_GNR_Users
GO
ALTER TABLE STO.ImportHeader
	DROP CONSTRAINT FK_STO_ImportHeader_RefEditorID_GNR_Users
GO
ALTER TABLE GNR.Users SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE STO.ImportHeader
	DROP CONSTRAINT FK_STO_ImportHeader_RefWarehouseID_GNR_Warehouse
GO
ALTER TABLE GNR.Warehouse SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE STO.ImportHeader
	DROP CONSTRAINT FK_STO_ImportHeader_RefVoucherHeaderID_ACC_VoucherHeader
GO
ALTER TABLE ACC.VoucherHeader SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE STO.ImportHeader
	DROP CONSTRAINT FK_STO_ImportHeader_RefFiscalYearID_GNR_FiscalYear
GO
ALTER TABLE GNR.FiscalYear SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE STO.ImportHeader
	DROP CONSTRAINT FK_STO_ImportHeader_RefVoucherTypeID_GNR_FixInfo
GO
ALTER TABLE STO.ImportHeader
	DROP CONSTRAINT FK_STO_ImportHeader_RefKindID_GNR_FixInfo
GO
ALTER TABLE STO.ImportHeader
	DROP CONSTRAINT FK_STO_ImportHeader_RefStatusID_GNR_FixInfo
GO
ALTER TABLE STO.ImportHeader
	DROP CONSTRAINT FK_STO_ImportHeader_RefAmountConfirmStatusID_GNR_FixInfo
GO
ALTER TABLE GNR.FixInfo SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE STO.ImportDetailTransport
	DROP CONSTRAINT FK_STO_ImportDetailTransport_RefDetailAccountID_GNR_DetailAccount
GO
ALTER TABLE STO.ImportHeader
	DROP CONSTRAINT FK_STO_ImportHeader_RefDetailAccountID_GNR_DetailAccount
GO
ALTER TABLE GNR.DetailAccount SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE STO.ImportDetailItem
	DROP CONSTRAINT FK_STO_ImportDetailItem_RefImportHeaderID_STO_ImportHeader
GO
ALTER TABLE STO.ImportDetailOppositLedger
	DROP CONSTRAINT FK_STO_ImportDetailOppositLedger_RefImportHeaderID_STO_ImportHeader
GO
ALTER TABLE STO.ImportDetailPaymentMethod
	DROP CONSTRAINT FK_STO_ImportDetailPaymentMethod_RefImportHeaderID_STO_ImportHeader
GO
ALTER TABLE STO.ImportDetailTransport
	DROP CONSTRAINT FK_STO_ImportDetailTransport_RefImportHeaderID_STO_ImportHeader
GO
ALTER TABLE LIQ.RelatedSubSystemVoucher
	DROP CONSTRAINT FK_LIQ_RelatedSubSystemVoucher_RefImportHeaderID_STO_ImportHeader
GO
ALTER TABLE STO.ImportDetailIncrementalFactor
	DROP CONSTRAINT FK_STO_ImportDetailIncrementalFactor_RefImportHeaderID_STO_ImportHeader
GO
ALTER TABLE STO.ImportHeader SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE STO.ImportDetailIncrementalFactor SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE LIQ.RelatedSubSystemVoucher SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE STO.ImportDetailTransport SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE STO.ImportDetailPaymentMethod SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE STO.ImportDetailOppositLedger SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE STO.ImportDetailItem SET (LOCK_ESCALATION = TABLE)
GO
COMMIT