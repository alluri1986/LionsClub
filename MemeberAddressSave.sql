CREATE PROCEDURE MemeberAddressSave
(
	@ClubMemberID			int,
	@AddressID				int,
	@AddressTypeID			int,
	@PreferredAddress		bit,
	@CreationDate			datetime,
	@LastUpdatedDate		datetime,
	@CreatedBy				int,
	@LastUpdatedBy			int
)
AS
BEGIN

	IF EXISTS (SELECT * FROM [MemberAddress] WHERE [ClubMemberID] = @ClubMemberID AND [AddressID] = @AddressID AND [AddressTypeID] = @AddressTypeID)
	BEGIN
		
		UPDATE [MemberAddress]
		SET	[PreferredAddress] = @PreferredAddress,
			[LastUpdatedBy]	   = @LastUpdatedBy,
			[LastUpdatedDate]  = @LastUpdatedDate
		WHERE [ClubMemberID]   = @ClubMemberID AND
			  [AddressID]	   = @AddressID    AND
			  [AddressTypeID]  = @AddressTypeID	
	END
	ELSE
	BEGIN
	
		INSERT INTO [MemberAddress]
		(
			[ClubMemberID],
			[AddressID],
			[AddressTypeID],
			[PreferredAddress],
			[CreationDate],
			[LastUpdatedDate],
			[CreatedBy],
			[LastUpdatedBy]
		)
		VALUES
		(
			@ClubMemberID,
			@AddressID,
			@AddressTypeID,
			@PreferredAddress,
			@CreationDate,
			@LastUpdatedDate,
			@CreatedBy,
			@LastUpdatedBy
		)
	
	END
	
END