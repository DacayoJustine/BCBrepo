CREATE PROCEDURE [dbo].[GetAllResidents]

AS
BEGIN
	SELECT [a].*
	FROM [dbo].Residentsform AS a;
END