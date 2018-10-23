USE [OPANDataBase]
GO

/****** Object:  View [dbo].[CicloAreaEstrategica]    Script Date: 02/02/2017 10:53:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[CicloAreaEstrategica] AS 
SELECT 
AccountingCalendar.Sequential as IdAnoFiscal,
AccountingCalendar.FiscalYear as AnoFiscal,
Project.Sequential AS IdProjeto,
Project.Code AS Projeto,
AccountingCalendarStrategicArea.Sequential as IdAreaCalendario,
StrategicArea.Code as AreaEstrategica

FROM Project 
  inner join AccountingCalendar ON (AccountingCalendar.Project = Project.Sequential)    
  inner join AccountingCalendarStrategicArea ON (AccountingCalendarStrategicArea.AccountingCalendar = AccountingCalendar.Sequential)     
  inner join StrategicArea on (AccountingCalendarStrategicArea.StrategicArea =StrategicArea.Sequential)

--Where AccountingCalendar.FiscalYear >=2017




GO

