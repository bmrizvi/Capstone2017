/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ID]
      ,[Year]
      ,[ForecastCategory]
      ,[Jurisdiction]
      ,[Sector]
      ,[UseOfFunds]
      ,[CurrentDollars]
      ,[CurrentDollarsPerCapita]
      ,[CurrentDollarsClassfication]
  FROM [BeenaCapstonProject].[dbo].[HealthDataOLD]

  select p.year, p.Jurisdiction, p.CurrentDollarsPerCapita-(select r.CurrentDollarsPerCapita from HealthDataOLD r where r.Year=p.Year and r.Sector='Provincial/territorial government' and r.Jurisdiction=p.Jurisdiction  )
  from HealthDataOLD p where Sector='Public'
  
  select year,sector, Jurisdiction, CurrentDollarsPerCapita-(select ) 
  from HealthDataOLD where Sector ='Provincial/territorial government'


