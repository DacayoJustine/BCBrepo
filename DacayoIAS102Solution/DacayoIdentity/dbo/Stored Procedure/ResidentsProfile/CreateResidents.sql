CREATE PROCEDURE [dbo].[CreateResidents]
	@Id INT, 
    @FirstName NVARCHAR(250), 
    @MiddleName NVARCHAR(250), 
    @LastName NVARCHAR(250), 
    @Suffix NVARCHAR(250), 
    @BirthDate DATE, 
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

	BEGIN
		INSERT INTO [dbo].[Residentsform]([FirstName],[MiddleName], [LastName], [Suffix], 
		[BirthDate], [Age], [Gender], [civilStatus], [Religion], [Occupation], [FathersName], 
		[MothersName], [HeadOfFamily], [TotalNumberOfFamily], [EducationalAttainment], [Purok], [StatusType])

		VALUES(@FirstName ,@MiddleName, @LastName, @Suffix, @BirthDate, @Age, @Gender, @civilStatus, @Religion,
		@Occupation, @FathersName, @MothersName, @HeadOfFamily, @TotalNumberOfFamily, @EducationalAttainment, @Purok, @StatusType);
	END
END
