﻿/*
Deployment script for BCBDatabase

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "BCBDatabase"
:setvar DefaultFilePrefix "BCBDatabase"
:setvar DefaultDataPath "C:\Users\My Computer\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\My Computer\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Starting rebuilding table [dbo].[ResidentsForm]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_ResidentsForm] (
    [Id]                    INT            NOT NULL,
    [FirstName]             NVARCHAR (250) NULL,
    [MiddleName]            NVARCHAR (250) NULL,
    [LastName]              NVARCHAR (250) NULL,
    [Suffix]                NVARCHAR (250) NULL,
    [BirthDate]             DATE           NULL,
    [Age]                   NVARCHAR (250) NULL,
    [Gender]                NVARCHAR (250) NULL,
    [civilStatus]           NVARCHAR (250) NULL,
    [Religion]              NVARCHAR (250) NULL,
    [Occupation]            NVARCHAR (250) NULL,
    [FathersName]           NVARCHAR (250) NULL,
    [MothersName]           NVARCHAR (250) NULL,
    [HeadOfFamily]          NVARCHAR (250) NULL,
    [TotalNumberOfFamily]   NVARCHAR (250) NULL,
    [EducationalAttainment] NVARCHAR (250) NULL,
    [Purok]                 NVARCHAR (250) NULL,
    [StatusType]            NVARCHAR (250) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[ResidentsForm])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_ResidentsForm] ([Id], [FirstName], [MiddleName], [LastName], [Suffix], [BirthDate], [Age], [Gender], [civilStatus], [Religion], [Occupation], [FathersName], [MothersName], [HeadOfFamily], [TotalNumberOfFamily], [EducationalAttainment], [Purok], [StatusType])
        SELECT   [Id],
                 [FirstName],
                 [MiddleName],
                 [LastName],
                 [Suffix],
                 [BirthDate],
                 [Age],
                 [Gender],
                 [civilStatus],
                 [Religion],
                 [Occupation],
                 [FathersName],
                 [MothersName],
                 [HeadOfFamily],
                 [TotalNumberOfFamily],
                 [EducationalAttainment],
                 [Purok],
                 [StatusType]
        FROM     [dbo].[ResidentsForm]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[ResidentsForm];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_ResidentsForm]', N'ResidentsForm';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering Procedure [dbo].[GetAllResidents]...';


GO
ALTER PROCEDURE [dbo].[GetAllResidents]
AS
BEGIN
	SELECT [a].*
	FROM [dbo].ResidentsForm AS a;
END
GO
PRINT N'Refreshing Procedure [dbo].[CreateResidents]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[CreateResidents]';


GO
PRINT N'Update complete.';


GO
