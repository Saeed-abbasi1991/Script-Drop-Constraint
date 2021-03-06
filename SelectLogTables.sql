select * from sadganPaloodDev.STO.ImportHeader
select  TOP 5 * from sadganbase.STO.ImportHeader WHERE Log_Action IS NOT NULL ORDER BY LogId DESC 
-----------------------------------------------------------------------------
select * from sadganPaloodDev.STO.ImportDetailItem
select * from sadganbase.STO.ImportDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
---------------------------------------------------------------------------
select * from sadganPaloodDev.STO.ReturnImportHeader
select * from sadganbase.STO.ReturnImportHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.STO.ReturnImportDetailItem
select * from sadganbase.STO.ReturnImportDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.STO.ExportHeader
select * from sadganbase.STO.ExportHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.STO.ExportDetailItem
select * from sadganbase.STO.ExportDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.STO.ReturnExportHeader
select * from sadganbase.STO.ReturnExportHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.STO.ReturnExportDetailItem
select * from sadganbase.STO.ReturnExportDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.STO.TransferHeader
select * from sadganbase.STO.TransferHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.STO.TransferDetailItem
select * from sadganbase.STO.TransferDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.STO.TransferDetailItem
select * from sadganbase.STO.TransferDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.STO.StockBeginHeader
select * from sadganbase.STO.StockBeginHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.STO.StockBeginDetailItem
select * from sadganbase.STO.StockBeginDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.STO.StockEndHeader
select * from sadganbase.STO.StockEndHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
---------------------------------------------------------------------------- 
select * from sadganPaloodDev.STO.StockEndDetail
select * from sadganbase.STO.StockEndDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
---------------------------------------------------------------------------- 
select * from sadganPaloodDev.ACC.BuyFactorHeader
select * from sadganbase.ACC.BuyFactorHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.ACC.BuyFactorDetail
select * from sadganbase.ACC.BuyFactorDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
---------------------------------------------------------------------------- 
select * from sadganPaloodDev.ACC.VoucherDetail
select * from sadganbase.ACC.VoucherDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.SAL.PreFactorHeader
select * from sadganbase.SAL.PreFactorHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.SAL.PreFactorDetail
select * from sadganbase.SAL.PreFactorDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.SAL.FactorHeader
select * from sadganbase.SAL.FactorHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.SAL.FactorDetail
select * from sadganbase.SAL.FactorDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganPaloodDev.SAL.ReturnFactorHeader
select * from sadganbase.SAL.ReturnFactorHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
---------------------------------------------------------------------------- 
select * from sadganPaloodDev.SAL.ReturnFactorDetail
select * from sadganbase.SAL.ReturnFactorDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------


