CREATE PROCEDURE [dbo].[UpdateResidents]
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
	UPDATE [dbo].[Residentsform]
	SET [FirstName] = @FirstName
	     ,[MiddleName] = @MiddleName
		 ,[LastName] = @LastName
		 ,[Suffix] = @Suffix
		 ,[BirthDate] = @BirthDate
		 ,[Age] = @Age
		 ,[Gender] = @Gender
		 ,[civilStatus] = @civilStatus
		 ,[Religion] = @Religion
		 ,[Occupation] = @Occupation
		 ,[FathersName] = @FathersName
		 ,[MothersName] = @MothersName
		 ,[HeadOfFamily] = @HeadOfFamily
		 ,[TotalNumberOfFamily] = @TotalNumberOfFamily
		 ,[EducationalAttainment] = @EducationalAttainment
		 ,[Purok] = @Purok
		 ,[StatusType] = @StatusType
		
	WHERE [Id] = @Id;


END

