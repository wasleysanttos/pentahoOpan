USE [OPANDataBase]
GO

/****** Object:  View [dbo].[CicloProduto]    Script Date: 02/02/2017 10:53:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[CicloProduto] as 
SELECT 
AccountingCalendar.Sequential as IdAnoFiscal,
AccountingCalendar.FiscalYear as AnoFiscal,
Project.Sequential AS IdProjeto,
Project.Code AS Projeto,
OperationalObjective.Sequential as IdProduto,
StrategicObjective.Code+OperationalObjective.Code as Produto

FROM Project 
  inner join AccountingCalendar ON (AccountingCalendar.Project = Project.Sequential)    
  inner join AccountingCalendarOperationalObjective ON (AccountingCalendarOperationalObjective.AccountingCalendar = AccountingCalendar.Sequential) 
  inner join OperationalObjective ON (AccountingCalendarOperationalObjective.OperationalObjective = OperationalObjective.Sequential)    
  inner join StrategicObjective ON (OperationalObjective.StrategicObjective = StrategicObjective.Sequential)    
--  INNER JOIN ProjetosValidos2016 as ProjetosValidos2016 on (Project.Sequential = ProjetosValidos2016.IdProjeto)
--Where AccountingCalendar.FiscalYear >=2015
--AND Activity.ActivityType NOT IN (3,5,6)
--and Project.Sequential = 729






GO

