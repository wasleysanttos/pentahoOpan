USE [OPANDataBase]
GO

/****** Object:  View [dbo].[PlanejamentoProjeto]    Script Date: 02/02/2017 10:53:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












CREATE VIEW [dbo].[PlanejamentoProjeto] AS 
SELECT 
AccountingCalendar.FiscalYear as AnoFiscal,
LTRIM(RTRIM(Project.Code)) AS Projeto,
Project.Sequential as IdProjeto,
LTRIM(RTRIM(StrategicObjective.Code)) + LTRIM(RTRIM(OperationalObjective.Code)) + LTRIM(RTRIM(Activity.Code)) as Atividade,
Activity.Code,
Activity.FundType,
Activity.Translated,
Activity.HEA,
Activity.Regional,
Activity.Description as AtividadeDescricao,
Activity.DescriptionEnglish AS DescricaoIngles,
Activity.PreAssumption,
Activity.PreAssumptionEnglish,
ActivityType
,OperationalObjective.Sequential AS IdOperacional
,Activity.StrategicAreaMain
,Activity.Sequential AS IdAtividade

FROM Project
  inner join AccountingCalendar ON (AccountingCalendar.Project = Project.Sequential)    
  inner join AccountingCalendarOperationalObjective ON (AccountingCalendarOperationalObjective.AccountingCalendar = AccountingCalendar.Sequential) 
  inner join OperationalObjective ON (AccountingCalendarOperationalObjective.OperationalObjective = OperationalObjective.Sequential)    
  inner join StrategicObjective ON (OperationalObjective.StrategicObjective = StrategicObjective.Sequential)    
  inner join Activity ON (Activity.AccountingCalendarOperationalObjective = AccountingCalendarOperationalObjective.Sequential)    
 
--Where Activity.CurrentPlanning = 1 
--AND AccountingCalendar.FiscalYear >=2015
--AND Activity.ActivityType NOT IN (3,5,6)















GO

