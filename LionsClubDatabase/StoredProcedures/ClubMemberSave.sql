CREATE PROCEDURE ClubMemberSave
(
	@ID int OUTPUT,
	@ClubID int,
	@FirstName nvarchar(200),
	@MiddleName nvarchar(200),
	@LastName nvarchar(200),
	@UserName nvarchar(200),
	@Password nvarchar(200),
	@GenderID int,
	@DOB datetime,
	@BloodGroupID int,
	@Occupation nvarchar(200),
	@Email nvarchar(200),
	@CellPhone nvarchar(200),
	@HomePhone nvarchar(200),
	@WorkPhone nvarchar(200),
	@MaritalStatusID int,
	@MarriageAnniversity datetime,
	@SpounserName nvarchar(200),
	@PastDesignations nvarchar(200),
	@PhotoPath nvarchar(500),
	@Photo varbinary(max),
	@MemberSince datetime,
	@IsActiveFL bit,
	@IsDeletedFL bit,
	@CreationDate datetime,
	@LastUpdatedDate datetime,
	@CreatedBy int,
	@LastUpdatedBy int
)
AS
BEGIN

	IF EXISTS (SELECT * FROM [ClubMember] WHERE [ID] = @ID)
	BEGIN
		
		UPDATE ClubMember
		SET		[ClubID]				= @ClubID,
				[FirstName]				= @FirstName,
				[MiddleName]			= @MiddleName,
				[LastName]				= @LastName,
				[UserName]				= @UserName,
				[Password]				= @Password,
				[GenderID]				= @GenderID,
				[DOB]					= @DOB,
				[BloodGroupID]			= @BloodGroupID,
				[Occupation]			= @Occupation,
				[Email]					= @Email,
				[CellPhone]				= @CellPhone,
				[HomePhone]				= @HomePhone,
				[WorkPhone]   			= @WorkPhone,
				[MaritalStatusID]       = @MaritalStatusID,
				[MarriageAnniversity]	= @MarriageAnniversity,
				[SpounserName]			= @SpounserName,
				[PastDesignations]		= @PastDesignations,
				[PhotoPath]				= @PhotoPath,
				[Photo]					= @Photo,
				[MemberSince]			= @MemberSince,
				[IsActiveFL]			= @IsActiveFL,
				[IsDeletedFL]			= @IsDeletedFL,
				[LastUpdatedDate]		= @LastUpdatedDate,
				[LastUpdatedBy]			= @LastUpdatedBy
		WHERE [ID] = @ID;
				
	END
	ELSE
	BEGIN
	
		INSERT INTO [ClubMember]
		(
			[ClubID],				
			[FirstName]	,			
			[MiddleName],			
			[LastName],				
			[UserName],				
			[Password],				
			[GenderID],				
			[DOB],					
			[BloodGroupID],			
			[Occupation],			
			[Email],					
			[CellPhone],			
			[HomePhone],				
			[WorkPhone],  			
			[MaritalStatusID],      
			[MarriageAnniversity],	
			[SpounserName],		
			[PastDesignations],		
			[PhotoPath],				
			[Photo],					
			[MemberSince],			
			[IsActiveFL],			
			[IsDeletedFL],
			[CreationDate],
			[LastUpdatedDate],
			[CreatedBy],
			[LastUpdatedBy]			
			
		)
		VALUES
		(
			@ClubID,
			@FirstName,
			@MiddleName,
			@LastName,
			@UserName,
			@Password,
			@GenderID,
			@DOB,
			@BloodGroupID,
			@Occupation,
			@Email,
			@CellPhone,
			@HomePhone,
			@WorkPhone,
			@MaritalStatusID,
			@MarriageAnniversity,
			@SpounserName,
			@PastDesignations,
			@PhotoPath,
			@Photo,
			@MemberSince,
			@IsActiveFL,
			@IsDeletedFL,
			@CreationDate,
			@LastUpdatedDate,
			@CreatedBy,
			@LastUpdatedBy
		)
		
	SET @ID = SCOPE_IDENTITY();
	END
END