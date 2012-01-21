CREATE TABLE LuGender
(
	ID int PRIMARY KEY IDENTITY(1,1),
	Name nvarchar(200) NOT NULL,
	[Description] nvarchar(200) NULL,
	IsActiveFL bit DEFAULT 1 NOT NULL,
	CreationDate datetime NOT NULL DEFAULT GETUTCDATE(),
	LastUpdatedDate datetime NOT NULL DEFAULT GETUTCDATE(),
	CreatedBy int NOT NULL,
	LastUpdatedBy int NOT NULL
)

CREATE TABLE LuBloodGroup
(
	ID int PRIMARY KEY IDENTITY(1,1),
	Name nvarchar(200) NOT NULL,
	[Description] nvarchar(200) NULL,
	IsActiveFL bit DEFAULT 1 NOT NULL,
	CreationDate datetime NOT NULL DEFAULT GETUTCDATE(),
	LastUpdatedDate datetime NOT NULL DEFAULT GETUTCDATE(),
	CreatedBy int NOT NULL,
	LastUpdatedBy int NOT NULL
)


CREATE TABLE LuMaritalStatus
(
	ID int PRIMARY KEY IDENTITY(1,1),
	Name nvarchar(200) NOT NULL,
	[Description] nvarchar(200) NULL,
	IsActiveFL bit DEFAULT 1 NOT NULL,
	CreationDate datetime NOT NULL DEFAULT GETUTCDATE(),
	LastUpdatedDate datetime NOT NULL DEFAULT GETUTCDATE(),
	CreatedBy int NOT NULL,
	LastUpdatedBy int NOT NULL
)

CREATE TABLE LuAddressType
(
	ID int PRIMARY KEY IDENTITY(1,1),
	Name nvarchar(200) NOT NULL,
	[Description] nvarchar(200) NULL,
	IsActiveFL bit DEFAULT 1 NOT NULL,
	CreationDate datetime NOT NULL DEFAULT GETUTCDATE(),
	LastUpdatedDate datetime NOT NULL DEFAULT GETUTCDATE(),
	CreatedBy int NOT NULL,
	LastUpdatedBy int NOT NULL
)



CREATE TABLE LuCountry
(
	ID int PRIMARY KEY IDENTITY(1,1),
	Name nvarchar(200) NOT NULL,
	[Description] nvarchar(200) NULL,
	IsActiveFL bit DEFAULT 1 NOT NULL,
	CreationDate datetime NOT NULL DEFAULT GETUTCDATE(),
	LastUpdatedDate datetime NOT NULL DEFAULT GETUTCDATE(),
	CreatedBy int NOT NULL,
	LastUpdatedBy int NOT NULL
)

CREATE TABLE LuRelationship
(
	ID int PRIMARY KEY IDENTITY(1,1),
	Name nvarchar(200) NOT NULL,
	[Description] nvarchar(200) NULL,
	IsActiveFL bit DEFAULT 1 NOT NULL,
	CreationDate datetime NOT NULL DEFAULT GETUTCDATE(),
	LastUpdatedDate datetime NOT NULL DEFAULT GETUTCDATE(),
	CreatedBy int NOT NULL,
	LastUpdatedBy int NOT NULL
)


CREATE TABLE Club
(
	ID int PRIMARY KEY IDENTITY(1,1),
	Region nvarchar(200) NOT NULL,
	Zone  nvarchar(200)  NOT NULL,
	Number  int  NOT NULL,
	Name nvarchar(200) NOT NULL,
	ShortName nvarchar(50) NOT NULL,
	SponsoredBy nvarchar(200) NOT NULL,
	ChartedDate datetime NULL,
	CharterPresident  nvarchar(200) NULL,
	ExtensionChairman nvarchar(200) NULL,
	GuidingLion nvarchar(200) NOT NULL,
	MeetsOn nvarchar(200)  NULL,
	IsActiveFL bit NOT NULL DEFAULT 1,
	IsDeletedFL bit NOT NULL DEFAULT 0,
	CreationDate datetime NOT NULL DEFAULT GETUTCDATE(),
	LastUpdatedDate datetime NOT NULL DEFAULT GETUTCDATE(),
	CreatedBy int NOT NULL,
	LastUpdatedBy int NOT NULL
	
)

CREATE TABLE ClubMember
(
	ID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	ClubID int FOREIGN KEY REFERENCES Club(ID) NOT NULL,
	FirstName nvarchar(200) NOT NULL,
	MiddleName nvarchar(200) NULL,
	LastName nvarchar(200) NOT NULL,
	UserName nvarchar(200) NOT NULL,
	Passsword nvarchar(200) NOT NULL,
	GenderID int NOT NULL FOREIGN KEY REFERENCES LuGender(ID),
	DOB datetime NOT NULL,
	BloodGroupID int NULL FOREIGN KEY REFERENCES LuBloodGroup(ID),
	Occupation nvarchar(200) NOT NULL,
	Email nvarchar(200) NULL,
	CellPhone nvarchar(20) NULL,
	HomePhone nvarchar(20) NOT NULL,
	WorkPhone nvarchar(20) NOT NULL,
	MaritalStatusID int NOT NULL FOREIGN KEY REFERENCES LuMaritalStatus(ID),
	MarriageAnniversity datetime null,
	SpounserName  varchar(200) NULL,
	PastDesignations nvarchar(200) NULL,
	PhotoPath nvarchar(500) NULL,
	Photo varbinary(max),
	MemberSince datetime NOT NULL,
	IsActiveFL bit  NOT NULL DEFAULT 1,
	IsDeletedFL bit NOT NULL DEFAULT 0,
	CreationDate datetime NOT NULL DEFAULT GETUTCDATE(),
	LastUpdatedDate datetime NOT NULL DEFAULT GETUTCDATE(),
	CreatedBy int NOT NULL,
	LastUpdatedBy int NOT NULL
)

CREATE TABLE AddressDetail --- Not Complete
(
	ID int PRIMARY KEY IDENTITY(1,1),
	Street nvarchar(250),
	City nvarchar(255),
	District nvarchar(255),
	[State] nvarchar(250),
	CountryID int FOREIGN KEY REFERENCES LuCountry(ID),
	Zip nvarchar(250),
	CreationDate datetime NOT NULL DEFAULT GETUTCDATE(),
	LastUpdatedDate datetime NOT NULL DEFAULT GETUTCDATE(),
	CreatedBy int NOT NULL,
	LastUpdatedBy int NOT NULL
)

CREATE TABLE MemberAddress
(
	ClubMemberID int  NOT NULL FOREIGN KEY REFERENCES ClubMember(ID),
	AddressID int  NOT NULL FOREIGN KEY REFERENCES AddressDetail(ID),
	AddressTypeID int NOT NULL FOREIGN KEY REFERENCES LuAddressType(ID),
	PreferredAddress bit NULL,
	CreationDate datetime NOT NULL DEFAULT GETUTCDATE(),
	LastUpdatedDate datetime NOT NULL DEFAULT GETUTCDATE(),
	CreatedBy int NOT NULL,
	LastUpdatedBy int NOT NULL,
	CONSTRAINT PK_MemberAddress PRIMARY KEY (ClubMemberID,AddressID,AddressTypeID)

)

CREATE TABLE FamilyDetail
(
	ID int PRIMARY KEY IDENTITY(1,1),
	ClubMemberID int NOT NULL FOREIGN KEY REFERENCES ClubMember(ID),
	FirstName nvarchar(255) NOT NULL,
	LastName nvarchar(255) NOT NULL,
	DOB datetime NOT NULL,
	GenderID int NOT NULL FOREIGN KEY REFERENCES LuGender(ID),
	BloodGroupID int NOT NULL FOREIGN KEY REFERENCES LuBloodGroup(ID),
	Occupation nvarchar(255) NOT NULL,
	RelationshipID int NOT NULL FOREIGN KEY REFERENCES LuRelationship(ID),
	IsActiveFL bit NOT NULL DEFAULT 1,
	IsDeletedFL bit NOT NULL DEFAULT 0,
	CreationDate datetime NOT NULL DEFAULT GETUTCDATE(),
	LastUpdatedDate datetime NOT NULL DEFAULT GETUTCDATE(),
	CreatedBy int NOT NULL,
	LastUpdatedBy int NOT NULL 
)


CREATE TABLE LuRole
(
	ID int PRIMARY KEY  IDENTITY(1,1),
	Name nvarchar(255) NOT NULL,
	Sequence int NOT NULL,
	CanManageMemeber bit NOT NULL,
	IsActiveFL bit NOT NULL DEFAULT 1,
	IsDeletedFL bit NOT NULL DEFAULT 0,
	CreationDate datetime NOT NULL DEFAULT GETUTCDATE(),
	LastUpdatedDate datetime NOT NULL DEFAULT GETUTCDATE(),
	CreatedBy int NOT NULL,
	LastUpdatedBy int NOT NULL 
)


CREATE TABLE ClubYear
(
	ID int PRIMARY KEY IDENTITY(1,1),
	ClubMemberID int NOT NULL FOREIGN KEY REFERENCES ClubMember(ID),
	ClubID int NOT NULL FOREIGN KEY REFERENCES Club(ID),
	RoleID int NOT NULL FOREIGN KEY REFERENCES LuRole(ID),
	FromDate datetime NOT NULL,
	ToDate datetime NOT NULL,
	IsActiveFL bit NOT NULL DEFAULT 1,
	IsDeletedFL bit NOT NULL DEFAULT 0,
	CreationDate datetime NOT NULL DEFAULT GETUTCDATE(),
	LastUpdatedDate datetime NOT NULL DEFAULT GETUTCDATE(),
	CreatedBy int NOT NULL,
	LastUpdatedBy int NOT NULL 

)

