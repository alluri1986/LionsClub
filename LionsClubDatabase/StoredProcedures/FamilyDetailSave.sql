CREATE PROCEDURE FamilyDetailSave
(
	@ID					int OUTPUT,
	@ClubMemberID		int,
	@FirstName			nvarchar(255),
	@LastName			nvarchar(255),
	@DOB				datetime,
	@GenderID			int,
	@BloodGroupID		int,
	@Occupation			nvarchar(255),
	@RelationshipID		int,
	@IsActiveFL			bit,
	@IsDeletedFL		bit,
	@CreationDate		datetime,
	@LastUpdatedDate	datetime,
	@CreatedBy			int,
	@LastUpdatedBy		int
)
AS
BEGIN

	IF EXISTS (SELECT * FROM [FamilyDetail] WHERE [ID] = @ID)
	BEGIN
		
		UPDATE [FamilyDetail]
		SET [ClubMemberID]		= @ClubMemberID,
			[FirstName]			= @FirstName,
			[LastName]			= @LastName,
			[DOB]				= @DOB,
			[GenderID]			= @GenderID,
			[BloodGroupID]		= @BloodGroupID,
			[Occupation]		= @Occupation,
			[RelationshipID]	= @RelationshipID,
			[IsActiveFL]		= @IsActiveFL,
			[IsDeletedFL]		= @IsDeletedFL,
			[LastUpdatedDate]	= @LastUpdatedDate,
			[LastUpdatedBy]		= @LastUpdatedBy
		WHERE [ID] = @ID;
	
	END
	ELSE
	BEGIN
	
		INSERT INTO [FamilyDetail]
		(
			[ClubMemberID],
			[FirstName],
			[LastName],
			[DOB],
			[GenderID],
			[BloodGroupID],
			[Occupation],
			[RelationshipID],
			[IsActiveFL],
			[IsDeletedFL],
			[LastUpdatedDate],
			[LastUpdatedBy]
		)
		VALUES
		(
			@ClubMemberID,
			@FirstName,
			@LastName,
			@DOB,
			@GenderID,
			@BloodGroupID,
			@Occupation,
			@RelationshipID,
			@IsActiveFL,
			@IsDeletedFL,
			@LastUpdatedDate,
			@LastUpdatedBy
		)
		
		SET @ID =  SCOPE_IDENTITY();
	
	END

END