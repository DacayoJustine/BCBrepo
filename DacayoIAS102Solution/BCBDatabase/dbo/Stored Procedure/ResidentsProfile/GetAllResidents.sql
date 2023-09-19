CREATE PROCEDURE [dbo].[GetAllResidents]
AS
BEGIN
	SELECT [a].*
	FROM [dbo].ResidentProfile AS a;
END