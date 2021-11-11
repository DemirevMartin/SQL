/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ID]
      ,[Name]
      ,[Age] + 1
  FROM [Minions].[dbo].[PersonalData]
  ORDER BY PersonalData.Name;