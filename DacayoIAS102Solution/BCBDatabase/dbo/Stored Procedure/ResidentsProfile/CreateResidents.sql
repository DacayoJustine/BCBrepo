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
