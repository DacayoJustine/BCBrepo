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
:setvar DefaultDataPath "C:\Users\Osting\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\Osting\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating database $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating Table [dbo].[AspNetRoleClaims]...';


GO
CREATE TABLE [dbo].[AspNetRoleClaims] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [RoleId]     NVARCHAR (450) NOT NULL,
    [ClaimType]  NVARCHAR (MAX) NULL,
    [ClaimValue] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[AspNetRoleClaims].[IX_AspNetRoleClaims_RoleId]...';


GO
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId]
    ON [dbo].[AspNetRoleClaims]([RoleId] ASC);


GO
PRINT N'Creating Table [dbo].[AspNetRoles]...';


GO
CREATE TABLE [dbo].[AspNetRoles] (
    [Id]               NVARCHAR (450) NOT NULL,
    [Name]             NVARCHAR (256) NULL,
    [NormalizedName]   NVARCHAR (256) NULL,
    [ConcurrencyStamp] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[AspNetRoles].[RoleNameIndex]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex]
    ON [dbo].[AspNetRoles]([NormalizedName] ASC) WHERE ([NormalizedName] IS NOT NULL);


GO
PRINT N'Creating Table [dbo].[AspNetUserClaims]...';


GO
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [UserId]     NVARCHAR (450) NOT NULL,
    [ClaimType]  NVARCHAR (MAX) NULL,
    [ClaimValue] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[AspNetUserClaims].[IX_AspNetUserClaims_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId]
    ON [dbo].[AspNetUserClaims]([UserId] ASC);


GO
PRINT N'Creating Table [dbo].[AspNetUserLogins]...';


GO
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider]       NVARCHAR (128) NOT NULL,
    [ProviderKey]         NVARCHAR (128) NOT NULL,
    [ProviderDisplayName] NVARCHAR (MAX) NULL,
    [UserId]              NVARCHAR (450) NOT NULL,
    CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED ([LoginProvider] ASC, [ProviderKey] ASC)
);


GO
PRINT N'Creating Index [dbo].[AspNetUserLogins].[IX_AspNetUserLogins_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId]
    ON [dbo].[AspNetUserLogins]([UserId] ASC);


GO
PRINT N'Creating Table [dbo].[AspNetUserRoles]...';


GO
CREATE TABLE [dbo].[AspNetUserRoles] (
    [UserId] NVARCHAR (450) NOT NULL,
    [RoleId] NVARCHAR (450) NOT NULL,
    CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC)
);


GO
PRINT N'Creating Index [dbo].[AspNetUserRoles].[IX_AspNetUserRoles_RoleId]...';


GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId]
    ON [dbo].[AspNetUserRoles]([RoleId] ASC);


GO
PRINT N'Creating Table [dbo].[AspNetUsers]...';


GO
CREATE TABLE [dbo].[AspNetUsers] (
    [Id]                   NVARCHAR (450)     NOT NULL,
    [UserName]             NVARCHAR (256)     NULL,
    [LastName]             NVARCHAR (36)      NULL,
    [FirstName]            NVARCHAR (36)      NULL,
    [BirthDate]            DATETIME2 (7)      NULL,
    [Address]              NVARCHAR (50)      NULL,
    [NormalizedUserName]   NVARCHAR (256)     NULL,
    [Email]                NVARCHAR (256)     NULL,
    [NormalizedEmail]      NVARCHAR (256)     NULL,
    [EmailConfirmed]       BIT                NOT NULL,
    [PasswordHash]         NVARCHAR (MAX)     NULL,
    [SecurityStamp]        NVARCHAR (MAX)     NULL,
    [ConcurrencyStamp]     NVARCHAR (MAX)     NULL,
    [PhoneNumber]          NVARCHAR (MAX)     NULL,
    [PhoneNumberConfirmed] BIT                NOT NULL,
    [TwoFactorEnabled]     BIT                NOT NULL,
    [LockoutEnd]           DATETIMEOFFSET (7) NULL,
    [LockoutEnabled]       BIT                NOT NULL,
    [AccessFailedCount]    INT                NOT NULL,
    CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[AspNetUsers].[EmailIndex]...';


GO
CREATE NONCLUSTERED INDEX [EmailIndex]
    ON [dbo].[AspNetUsers]([NormalizedEmail] ASC);


GO
PRINT N'Creating Index [dbo].[AspNetUsers].[UserNameIndex]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex]
    ON [dbo].[AspNetUsers]([NormalizedUserName] ASC) WHERE ([NormalizedUserName] IS NOT NULL);


GO
PRINT N'Creating Table [dbo].[AspNetUserTokens]...';


GO
CREATE TABLE [dbo].[AspNetUserTokens] (
    [UserId]        NVARCHAR (450) NOT NULL,
    [LoginProvider] NVARCHAR (128) NOT NULL,
    [Name]          NVARCHAR (128) NOT NULL,
    [Value]         NVARCHAR (MAX) NULL
);


GO
PRINT N'Creating Table [dbo].[HealthForm]...';


GO
CREATE TABLE [dbo].[HealthForm] (
    [Id]                    INT            NOT NULL,
    [FirstName]             NVARCHAR (250) NULL,
    [MiddleName]            NVARCHAR (250) NULL,
    [LastName]              NVARCHAR (250) NULL,
    [Suffix]                NVARCHAR (250) NULL,
    [BirthDate]             NVARCHAR (250) NULL,
    [Age]                   NVARCHAR (250) NULL,
    [Gender]                NVARCHAR (250) NULL,
    [FathersName]           NVARCHAR (250) NULL,
    [MothersName]           NVARCHAR (250) NULL,
    [HeadOfFamily]          NVARCHAR (250) NULL,
    [TotalNumberOfFamily]   NVARCHAR (250) NULL,
    [EducationalAttainment] NVARCHAR (250) NULL,
    [Purok]                 NVARCHAR (250) NULL,
    [PWD]                   NVARCHAR (250) NULL,
    [Prenatal]              NVARCHAR (250) NULL,
    [TypesOfIllness]        NVARCHAR (250) NULL,
    [Immunation]            NVARCHAR (250) NULL,
    [Weight]                NVARCHAR (250) NULL,
    [Height]                NVARCHAR (250) NULL,
    [Temperature]           NVARCHAR (250) NULL,
    [BloodPressure]         NVARCHAR (250) NULL,
    [Medicine]              NVARCHAR (250) NULL,
    CONSTRAINT [PK_HealthForm_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [dbo].[ResidentsForm]...';


GO
CREATE TABLE [dbo].[ResidentsForm] (
    [Id]                    INT            NOT NULL,
    [FirstName]             NVARCHAR (250) NULL,
    [MiddleName]            NVARCHAR (250) NULL,
    [LastName]              NVARCHAR (250) NULL,
    [Suffix]                NVARCHAR (250) NULL,
    [BirthDate]             NVARCHAR (250) NULL,
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
    CONSTRAINT [PK_ResidentsForm_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [dbo].[SecretaryLogin]...';


GO
CREATE TABLE [dbo].[SecretaryLogin] (
    [Id]       INT            NOT NULL,
    [UserName] NVARCHAR (450) NULL,
    [Password] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Foreign Key [dbo].[FK_AspNetRoleClaims_AspNetRoles_RoleId]...';


GO
ALTER TABLE [dbo].[AspNetRoleClaims]
    ADD CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key [dbo].[FK_AspNetUserClaims_AspNetUsers_UserId]...';


GO
ALTER TABLE [dbo].[AspNetUserClaims]
    ADD CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key [dbo].[FK_AspNetUserLogins_AspNetUsers_UserId]...';


GO
ALTER TABLE [dbo].[AspNetUserLogins]
    ADD CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key [dbo].[FK_AspNetUserRoles_AspNetRoles_RoleId]...';


GO
ALTER TABLE [dbo].[AspNetUserRoles]
    ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating Foreign Key [dbo].[FK_AspNetUserRoles_AspNetUsers_UserId]...';


GO
ALTER TABLE [dbo].[AspNetUserRoles]
    ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating Procedure [dbo].[CreateHealthProfile]...';


GO
CREATE PROCEDURE [dbo].[CreateHealthProfile]
	@Id NVARCHAR(250), 
    @FirstName NVARCHAR(250), 
    @MiddleName NVARCHAR(250), 
    @LastName NVARCHAR(250), 
    @Suffix NVARCHAR(250), 
    @BirthDate NVARCHAR(250), 
    @Age NVARCHAR(250), 
    @Gender NVARCHAR(250), 
    @FathersName NVARCHAR(250), 
    @MothersName NVARCHAR(250), 
    @HeadOfFamily NVARCHAR(250), 
    @TotalNumberOfFamily NVARCHAR(250), 
    @EducationalAttainment NVARCHAR(250), 
    @Purok NVARCHAR(250), 
    @PWD NVARCHAR(250), 
    @Prenatal NVARCHAR(250),
    @TypesOfIllness NVARCHAR(250),
    @Immunation NVARCHAR(250),
    @Height NVARCHAR(250),
    @Weight NVARCHAR(250),
    @Temperature NVARCHAR(250),
    @BloodPressure NVARCHAR(250),
    @Medicine NVARCHAR(250)
	
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @HealthProfileId NVARCHAR(250);

	SELECT @HealthProfileId = [a].[Id]
	FROM [dbo].[HealthForm] AS a
	WHERE [a].[FirstName] = @FirstName
	    AND [a].[MiddleName] = @MiddleName
		AND [a].[LastName] = @LastName
		AND [a].[Suffix] = @Suffix
		AND [a].[BirthDate] = @BirthDate
		AND [a].[Age] = @Age
		AND [a].[Gender] = @Gender
		AND [a].[FathersName] = @FathersName
		AND [a].[MothersName] = @MothersName
		AND [a].[HeadOfFamily] = @HeadOfFamily
		AND [a].[TotalNumberOfFamily] = @TotalNumberOfFamily
		AND [a].[EducationalAttainment] = @EducationalAttainment
		AND [a].[Purok] = @Purok
		AND [a].[PWD] = @PWD
		AND [a].[Prenatal] = @Prenatal
		AND [a].[TypesOfIllness] = @TypesOfIllness
		AND [a].[Immunation] = @Immunation
		AND [a].[Height] = @Height
		AND [a].[Weight] = @Weight
		AND [a].[Temperature] = @Temperature
		AND [a].[BloodPressure] = @BloodPressure
		AND [a].[Medicine] = @Medicine;
		
	
	IF LEN(COALESCE(@HealthProfileId, N''))=0
	BEGIN
		INSERT INTO [dbo].[HealthForm]([Id] ,[FirstName],[MiddleName], [LastName], [Suffix], 
		[BirthDate], [Age], [Gender], [FathersName], 
		[MothersName], [HeadOfFamily], [TotalNumberOfFamily], [EducationalAttainment], [Purok], [PWD],[Prenatal],[TypesOfIllness], [Immunation], [Height], [Weight], [Temperature], [BloodPressure], [Medicine])

		VALUES(@Id ,@FirstName ,@MiddleName, @LastName, @Suffix, @BirthDate, @Age, @Gender, @FathersName, @MothersName, @HeadOfFamily, @TotalNumberOfFamily, @EducationalAttainment, @Purok, @PWD, @Prenatal, @TypesOfIllness, @Immunation, @Height, @Weight, @Temperature, @BloodPressure, @Medicine);
	END
END
GO
PRINT N'Creating Procedure [dbo].[CreateResidents]...';


GO
CREATE PROCEDURE [dbo].[CreateResidents]
	@Id NVARCHAR(250), 
    @FirstName NVARCHAR(250), 
    @MiddleName NVARCHAR(250), 
    @LastName NVARCHAR(250), 
    @Suffix NVARCHAR(250), 
    @BirthDate NVARCHAR(250), 
    @Age NVARCHAR(250), 
    @Gender NVARCHAR(250), 
    @civilStatus NVARCHAR(250), 
    @Religion NVARCHAR(250), 
    @Occupation NVARCHAR(250), 
    @FathersName NVARCHAR(250), 
    @MothersName NVARCHAR(250), 
    @HeadOfFamily NVARCHAR(250), 
    @TotalNumberOfFamily NVARCHAR(250), 
    @EducationalAttainment NVARCHAR(250), 
    @Purok NVARCHAR(250), 
    @StatusType NVARCHAR(250) 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ResidentsId NVARCHAR(250);

	SELECT @ResidentsId = [a].[Id]
	FROM [dbo].[ResidentProfile] AS a
	WHERE [a].[FirstName] = @FirstName
	    AND [a].[MiddleName] = @MiddleName
		AND [a].[LastName] = @LastName
		AND [a].[Suffix] = @Suffix
		AND [a].[BirthDate] = @BirthDate
		AND [a].[Age] = @Age
		AND [a].[Gender] = @Gender
		AND [a].[civilStatus] = @civilStatus
		AND [a].[Religion] = @Religion
		AND [a].[Occupation] = @Occupation
		AND [a].[FathersName] = @FathersName
		AND [a].[MothersName] = @MothersName
		AND [a].[HeadOfFamily] = @HeadOfFamily
		AND [a].[TotalNumberOfFamily] = @TotalNumberOfFamily
		AND [a].[EducationalAttainment] = @EducationalAttainment
		AND [a].[Purok] = @Purok
		AND [a].[StatusType] = @StatusType;
		
	
	IF LEN(COALESCE(@ResidentsId, N''))=0
	BEGIN
		INSERT INTO [dbo].[ResidentProfile]([Id] ,[FirstName],[MiddleName], [LastName], [Suffix], 
		[BirthDate], [Age], [Gender], [civilStatus], [Religion], [Occupation], [FathersName], 
		[MothersName], [HeadOfFamily], [TotalNumberOfFamily], [EducationalAttainment], [Purok], [StatusType])

		VALUES(@Id ,@FirstName ,@MiddleName, @LastName, @Suffix, @BirthDate, @Age, @Gender, @civilStatus, @Religion,
		@Occupation, @FathersName, @MothersName, @HeadOfFamily, @TotalNumberOfFamily, @EducationalAttainment, @Purok, @StatusType);
	END
END
GO
PRINT N'Creating Procedure [dbo].[DeleteResidents]...';


GO
CREATE PROCEDURE [dbo].[DeleteResidents]
		@Id NVARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [dbo].[ResidentForm] WHERE [Id] = @Id;
END
GO
PRINT N'Creating Procedure [dbo].[GetAllResidents]...';


GO
CREATE PROCEDURE [dbo].[GetAllResidents]
AS
BEGIN
	SELECT [a].*
	FROM [dbo].ResidentProfile AS a;
END
GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
