CREATE PROCEDURE [dbo].[GetResidentsById]
	@Id INT 
AS
	
BEGIN
	SELECT [a].*
	FROM [dbo].Residentsform AS a
	WHERE [a].[Id] = @Id;
END