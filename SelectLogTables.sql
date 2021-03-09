
--update sadganpalooddev.STO.ImportHeader set TotalPrice=0 where ID=14
select * from sadganpalooddev.STO.ImportHeader
select  TOP 5 * from sadganlog.STO.ImportHeader WHERE Log_Action IS NOT NULL ORDER BY LogId DESC 
-----------------------------------------------------------------------------
--update sadganpalooddev.STO.ImportDetailItem set Price=256200000 where ID=38
select * from sadganpalooddev.STO.ImportDetailItem
select * from sadganlog.STO.ImportDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
---------------------------------------------------------------------------

--update  sadganpalooddev.STO.ReturnImportHeader set TotalPrice=0 where ID=2
select * from sadganpalooddev.STO.ReturnImportHeader
/*Not Logged*/
select * from sadganlog.STO.ReturnImportHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
--update sadganpalooddev.STO.ReturnImportDetailItem set Price=0 where ID=2
select * from sadganpalooddev.STO.ReturnImportDetailItem
/*Not Logged*/
select * from sadganlog.STO.ReturnImportDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
--update sadganpalooddev.STO.ExportHeader set Price=0 where ID=1
select * from sadganpalooddev.STO.ExportHeader
select * from sadganlog.STO.ExportHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
--update sadganpalooddev.STO.ExportDetailItem set Price=0 where ID=55
select * from sadganpalooddev.STO.ExportDetailItem
select * from sadganlog.STO.ExportDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
--update sadganpalooddev.STO.ReturnExportHeader set Price=0 where ID=1/*2 row created*/
select * from sadganpalooddev.STO.ReturnExportHeader/*Not Logged*/
select * from sadganlog.STO.ReturnExportHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
--update sadganpalooddev.STO.ReturnExportDetailItem set Price=0 where ID=1
select * from sadganpalooddev.STO.ReturnExportDetailItem/*Not Logged*/
select * from sadganlog.STO.ReturnExportDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
--update sadganpalooddev.STO.TransferHeader set Price=0 where ID=1
select * from sadganpalooddev.STO.TransferHeader
select * from sadganlog.STO.TransferHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
--update sadganpalooddev.STO.TransferDetailItem set Price=0 where ID=1
select * from sadganpalooddev.STO.TransferDetailItem
select * from sadganlog.STO.TransferDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
--update sadganpalooddev.STO.StockBeginHeader set price=6 where ID=41
select * from sadganpalooddev.STO.StockBeginHeader/*Not Logged*/
select * from sadganlog.STO.StockBeginHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
--update sadganpalooddev.STO.StockBeginDetailItem set Price=1148140000 where ID=17
select * from sadganpalooddev.STO.StockBeginDetailItem/*Not Logged*/
select * from sadganlog.STO.StockBeginDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadganpalooddev.STO.StockEndHeader/*Table is Empty*/
select * from sadganlog.STO.StockEndHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
---------------------------------------------------------------------------- 
select * from sadganpalooddev.STO.StockEndDetail/*Table is Empty*/
select * from sadganlog.STO.StockEndDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
---------------------------------------------------------------------------- 
--update sadganpalooddev.ACC.BuyFactorHeader set price=450000 where ID=2
select * from sadganpalooddev.ACC.BuyFactorHeader/*Not Logged*/
select * from sadganlog.ACC.BuyFactorHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
--update sadganpalooddev.ACC.BuyFactorDetail set Price=450000 where ID=2 
select * from sadganpalooddev.ACC.BuyFactorDetail/*Not Logged*/
select * from sadganlog.ACC.BuyFactorDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
---------------------------------------------------------------------------- 
--update sadganpalooddev.ACC.VoucherDetail set Debit=0 where ID=8261
select * from sadganpalooddev.ACC.VoucherDetail
select * from sadganlog.ACC.VoucherDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
--update sadganpalooddev.ACC.VoucherHeader set TotalPrice=TotalPrice  where ID=146
select * from sadganpalooddev.ACC.VoucherHeader
select  TOP 5 * from sadganlog.ACC.VoucherHeader WHERE Log_Action IS NOT NULL ORDER BY LogId DESC
-------------------------------------------------------------------------------------
--update sadganpalooddev.SAL.PreFactorHeader set Price=Price where ID=4
select * from sadganpalooddev.SAL.PreFactorHeader
select * from sadganlog.SAL.PreFactorHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
--update sadganpalooddev.SAL.PreFactorDetail set Price=Price where ID=4
select * from sadganpalooddev.SAL.PreFactorDetail
select * from sadganlog.SAL.PreFactorDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
--update sadganpalooddev.SAL.FactorHeader set Price=Price where ID=1
select * from sadganpalooddev.SAL.FactorHeader
select * from sadganlog.SAL.FactorHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
--update sadganpalooddev.SAL.FactorDetail set Price=Price where ID=42
select * from sadganpalooddev.SAL.FactorDetail
select * from sadganlog.SAL.FactorDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
--update sadganpalooddev.SAL.ReturnFactorHeader set Price=Price where ID=1
select * from sadganpalooddev.SAL.ReturnFactorHeader
select * from sadganlog.SAL.ReturnFactorHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
---------------------------------------------------------------------------- 
--update sadganpalooddev.SAL.ReturnFactorDetail set Price=Price where ID=1
select * from sadganpalooddev.SAL.ReturnFactorDetail
select * from sadganlog.SAL.ReturnFactorDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------

/*transferheader has problem*/


