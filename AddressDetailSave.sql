CREATE PROCEDURE AddressDetailSave
(
	@ID					int OUTPUT,
	@Street				nvarchar(250),
	@City				nvarchar(250),
	@District			nvarchar(250),
	@State				nvarchar(250),
	@CountryID			int,
	@Zip				nvarchar(255),
	@CreationDate		datetime,
	@LastUpdatedDate	datetime,
	@CreatedBy			int,
	@LastUpdatedBy		int
)
AS
BEGIN

	IF EXISTS (SELECT * FROM [AddressDetail] WHERE [ID] = @ID)
	BEGIN
		
		UPDATE [AddressDetail]
		SET [Street]			= @Street,
			[City]				= @City,
			[District]			= @District,
			[State]				= @State,
			[CountryID]			= @CountryID.
			[Zip]				= @Zip,
			[CreationDate]		= @CreationDate,
			[LastUpdatedDate]   = @LastUpdatedDate,
			[CreatedBy]			= @CreatedBy,
			[LastUpdatedBy]		= @LastUpdatedBy
		WHERE ID = @ID
		
	END
	ELSE
	BEGIN
		
		INSERT INTO [AddressDetail]
		(
			[Street],
			[City],
			[District],
			[State],
			[CountryID],
			[Zip],
			[CreationDate],		
			[LastUpdatedDate],  
			[CreatedBy],			
			[LastUpdatedBy]		
		)
		VALUES
		(
			@Street,
			@City,
			@District,
			@State,
			@CountryID,
			@Zip,
			@CreationDate,
			@LastUpdatedDate,
			@CreatedBy,
			@LastUpdatedBy
		)
		SEt @ID = SCOPE_IDENTITY();
	
	END
	
END