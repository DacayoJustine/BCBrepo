CREATE TABLE [dbo].[Residentsform]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[FirstName] NVARCHAR(250) NULL, 
    [MiddleName] NVARCHAR(250) NULL, 
    [LastName] NVARCHAR(250) NULL, 
    [Suffix] NVARCHAR(250) NULL, 
    [BirthDate] DATE NULL, 
    [Age] NVARCHAR(250) NULL, 
    [Gender] NVARCHAR(250) NULL, 
    [civilStatus] NVARCHAR(250) NULL, 
    [Religion] NVARCHAR(250) NULL, 
    [Occupation] NVARCHAR(250) NULL, 
    [FathersName] NVARCHAR(250) NULL, 
    [MothersName] NVARCHAR(250) NULL, 
    [HeadOfFamily] NVARCHAR(250) NULL, 
    [TotalNumberOfFamily] NVARCHAR(250) NULL, 
    [EducationalAttainment] NVARCHAR(250) NULL, 
    [Purok] NVARCHAR(250) NULL, 
    [StatusType] NVARCHAR(250) NULL

)

