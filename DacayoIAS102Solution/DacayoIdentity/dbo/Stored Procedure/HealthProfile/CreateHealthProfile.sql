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
