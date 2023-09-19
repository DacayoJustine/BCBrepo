CREATE TABLE [dbo].[HealthForm]
(
	[Id] INT NOT NULL,
	[FirstName] NVARCHAR(250) NULL, 
    [MiddleName] NVARCHAR(250) NULL, 
    [LastName] NVARCHAR(250) NULL, 
    [Suffix] NVARCHAR(250) NULL, 
    [BirthDate] NVARCHAR(250) NULL, 
    [Age] NVARCHAR(250) NULL, 
    [Gender] NVARCHAR(250) NULL, 
    [FathersName] NVARCHAR(250) NULL, 
    [MothersName] NVARCHAR(250) NULL, 
    [HeadOfFamily] NVARCHAR(250) NULL, 
    [TotalNumberOfFamily] NVARCHAR(250) NULL, 
    [EducationalAttainment] NVARCHAR(250) NULL, 
    [Purok] NVARCHAR(250) NULL, 
    [PWD] NVARCHAR(250) NULL, 
    [Prenatal] NVARCHAR(250) NULL, 
    [TypesOfIllness] NVARCHAR(250) NULL, 
    [Immunation] NVARCHAR(250) NULL, 
    [Weight] NVARCHAR(250) NULL, 
    [Height] NVARCHAR(250) NULL, 
    [Temperature] NVARCHAR(250) NULL, 
    [BloodPressure] NVARCHAR(250) NULL, 
    [Medicine] NVARCHAR(250) NULL,
    

);
GO
ALTER TABLE [dbo].[HealthForm]
ADD CONSTRAINT [PK_HealthForm_Id]
PRIMARY KEY CLUSTERED ([Id])