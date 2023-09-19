CREATE PROCEDURE [dbo].[DeleteResidents]
		@Id NVARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [dbo].[ResidentForm] WHERE [Id] = @Id;
END
