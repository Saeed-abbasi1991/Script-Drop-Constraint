
select * from sadgan001.STO.ImportHeader
select  TOP 5 * from SadganLog001.STO.ImportHeader WHERE Log_Action IS NOT NULL ORDER BY LogId DESC 
-----------------------------------------------------------------------------

select * from sadgan001.STO.ImportDetailItem
select * from SadganLog001.STO.ImportDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
---------------------------------------------------------------------------

select * from sadgan001.STO.ReturnImportHeader
/*Not Logged*/
select * from SadganLog001.STO.ReturnImportHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadgan001.STO.ReturnImportDetailItem
/*Not Logged*/
select * from SadganLog001.STO.ReturnImportDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------

select * from sadgan001.STO.ExportHeader
select * from SadganLog001.STO.ExportHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------

select * from sadgan001.STO.ExportDetailItem
select * from SadganLog001.STO.ExportDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadgan001.STO.ReturnExportHeader/*Not Logged*/
select * from SadganLog001.STO.ReturnExportHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadgan001.STO.ReturnExportDetailItem/*Not Logged*/
select * from SadganLog001.STO.ReturnExportDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadgan001.STO.TransferHeader
select * from SadganLog001.STO.TransferHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadgan001.STO.TransferDetailItem
select * from SadganLog001.STO.TransferDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadgan001.STO.TransferDetailItem
select * from SadganLog001.STO.TransferDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadgan001.STO.StockBeginHeader/*Not Logged*/
select * from SadganLog001.STO.StockBeginHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadgan001.STO.StockBeginDetailItem/*Not Logged*/
select * from SadganLog001.STO.StockBeginDetailItem WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadgan001.STO.StockEndHeader/*Table is Empty*/
select * from SadganLog001.STO.StockEndHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
---------------------------------------------------------------------------- 
select * from sadgan001.STO.StockEndDetail/*Table is Empty*/
select * from SadganLog001.STO.StockEndDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
---------------------------------------------------------------------------- 
select * from sadgan001.ACC.BuyFactorHeader/*Not Logged*/
select * from SadganLog001.ACC.BuyFactorHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadgan001.ACC.BuyFactorDetail/*Not Logged*/
select * from SadganLog001.ACC.BuyFactorDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
---------------------------------------------------------------------------- 
select * from sadgan001.ACC.VoucherDetail
select * from SadganLog001.ACC.VoucherDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadgan001.ACC.VoucherHeader
select  TOP 5 * from SadganLog001.ACC.VoucherHeader WHERE Log_Action IS NOT NULL ORDER BY LogId DESC
-------------------------------------------------------------------------------------
select * from sadgan001.SAL.PreFactorHeader
select * from SadganLog001.SAL.PreFactorHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------

select * from sadgan001.SAL.PreFactorDetail
select * from SadganLog001.SAL.PreFactorDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
 
select * from sadgan001.SAL.FactorHeader
select * from SadganLog001.SAL.FactorHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadgan001.SAL.FactorDetail
select * from SadganLog001.SAL.FactorDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------
select * from sadgan001.SAL.ReturnFactorHeader
select * from SadganLog001.SAL.ReturnFactorHeader WHERE Log_Action IS NOT NULL ORDER BY LogId
---------------------------------------------------------------------------- 
select * from sadgan001.SAL.ReturnFactorDetail
select * from SadganLog001.SAL.ReturnFactorDetail WHERE Log_Action IS NOT NULL ORDER BY LogId
----------------------------------------------------------------------------


