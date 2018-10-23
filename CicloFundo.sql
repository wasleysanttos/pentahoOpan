USE [OPANDataBase]
GO

/****** Object:  View [dbo].[CicloFundo]    Script Date: 02/02/2017 10:53:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE VIEW [dbo].[CicloFundo] as 
SELECT 
AccountingCalendar.Sequential as IdAnoFiscal,
AccountingCalendar.FiscalYear as AnoFiscal,
Project.Sequential AS IdProjeto,
Project.Code AS Projeto,
Fund.Sequential as IdFundo

FROM Project 
  inner join AccountingCalendar ON (AccountingCalendar.Project = Project.Sequential)    
	INNER JOIN Planning on (AccountingCalendar.Sequential = Planning.AccountingCalendar)
	INNER JOIN Fund on (Planning.Fund = Fund.Sequential)
  
--Where AccountingCalendar.FiscalYear >=2015
--AND Activity.ActivityType NOT IN (3,5,6)
--and Project.Sequential = 729









GO

