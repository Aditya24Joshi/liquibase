-- liquibase formatted sql
-- changeset jenkins:001-04
-- comment: create RefRole table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[RefRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [Varchar](100) NOT NULL,
	[Source] [Varchar](50) NOT NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [Varchar](50) NOT NULL
CONSTRAINT [refrole_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
)
GO

-- changeset jenkins:001-05
-- comment: Insert records to RefRole table
INSERT into [etl].[RefRole] values ('Policy Holder','Data Transformation',getdate(),31-12-9999,getdate(),'DT-Program')
INSERT into [etl].[RefRole] values ('Insured','Data Transformation',getdate(),31-12-9999,getdate(),'DT-Program')



-- changeset jenkins:001-06
-- comment:create RefStatus table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[RefStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [Varchar](100) NOT NULL,
	[Source] [Varchar](50) NOT NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [Varchar](50) NOT NULL
CONSTRAINT [refstatus_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
)
GO


-- changeset jenkins:001-07
-- comment: Insert records to RefStatus table
INSERT into [etl].[RefStatus] values ('Active','Data Transformation',getdate(),31-12-9999,getdate(),'DT-Program')
INSERT into [etl].[RefStatus] values ('GoneAway Indicator','Data Transformation',getdate(),31-12-9999,getdate(),'DT-Program')



-- changeset jenkins:001-08
-- comment:create RefLifeStatus table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[RefLifeStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [Varchar](100) NOT NULL,
	[Source] [Varchar](50) NOT NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [Varchar](50) NOT NULL
CONSTRAINT [reflifestatus_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
)
GO


-- changeset jenkins:001-09
-- comment: Insert records to RefLifeStatus table
INSERT into [etl].[RefLifeStatus] values ('Active','Data Transformation',getdate(),31-12-9999,getdate(),'DT-Program')
INSERT into [etl].[RefLifeStatus] values ('Deceased','Data Transformation',getdate(),31-12-9999,getdate(),'DT-Program')
INSERT into [etl].[RefLifeStatus] values ('Disabled','Data Transformation',getdate(),31-12-9999,getdate(),'DT-Program')



-- changeset jenkins:001-10
-- comment:create RefAddressType table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[RefAddressType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [Varchar](100) NOT NULL,
	[Source] [Varchar](50) NOT NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [Varchar](50) NOT NULL
CONSTRAINT [refaddresstype_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
)
GO


-- changeset jenkins:001-11
-- comment: Insert records to RefAddressType table
INSERT into [etl].[RefAddressType] values ('Correspondence','Data Transformation',getdate(),31-12-9999,getdate(),'DT-Program')
INSERT into [etl].[RefAddressType] values ('Billing','Data Transformation',getdate(),31-12-9999,getdate(),'DT-Program')



-- changeset jenkins:001-12
-- comment: create RefEmailType table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[RefEmailType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [Varchar](100) NOT NULL,
	[Source] [Varchar](50) NOT NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [Varchar](50) NOT NULL
CONSTRAINT [refemailtype_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
)
GO

-- changeset jenkins:001-13
-- comment: Insert records to RefEmailType table
INSERT into [etl].[RefEmailType] values ('Direct','Data Transformation',getdate(),31-12-9999,getdate(),'DT-Program')
INSERT into [etl].[RefEmailType] values ('Official','Data Transformation',getdate(),31-12-9999,getdate(),'DT-Program')



-- changeset jenkins:001-14
-- comment: create RefPhoneType table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[RefPhoneType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [Varchar](100) NOT NULL,
	[Source] [Varchar](50) NOT NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [Varchar](50) NOT NULL
CONSTRAINT [refephonetype_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
)
GO

-- changeset jenkins:001-15
-- comment: Insert records to RefPhoneType table
INSERT into [etl].[RefPhoneType] values ('Mobile','Data Transformation',getdate(),31-12-9999,getdate(),'DT-Program')
INSERT into [etl].[RefPhoneType] values ('Landline','Data Transformation',getdate(),31-12-9999,getdate(),'DT-Program')


-- changeset jenkins:001-16
-- comment: create Client table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[Client](
    [ID] [int] IDENTITY(1,1) NOT NULL,
	[UniqueClientID] [int] NOT NULL,
	[Title] [Varchar](25) NULL,
	[FirstName] [Varchar](50) NOT NULL,
	[SecondName] [Varchar](50) NULL,
	[SurName] [Varchar](50) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[DateOfDeath] [datetime] NULL,
	[NINumber] [Varchar](50) NULL,
	[StatusID] [int] NOT NULL,
	[LifeStatusID] [int] NOT NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [Varchar](50) NOT NULL
 CONSTRAINT [Client_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
)
 ALTER TABLE [etl].[Client] ADD CONSTRAINT [Status_fk] FOREIGN KEY (StatusID) REFERENCES etl.[RefStatus](ID) 
 ALTER TABLE [etl].[Client] ADD CONSTRAINT [LifeStatus_fk] FOREIGN KEY (LifeStatusID) REFERENCES etl.[RefLifeStatus](ID)
--)
GO

CREATE NONCLUSTERED INDEX [NCI_CLID] on [etl].[Client](UniqueClientID)

-- changeset jenkins:001-17
-- comment: create Address table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[Address](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UniqueClientID] [int] NOT NULL,
	[TypeID] [int] NULL,
	[Preferred] [Bit] NULL,
	[AddressLine1] [Varchar](100) NOT NULL,
	[AddressLine2] [Varchar](100) NULL,
	[AddressLine3] [Varchar](100) NULL,
	[AddressLine4] [Varchar](100) NULL,
	[AddressLine5] [Varchar](100) NULL,
	[CityName] [Varchar](50) NULL,
	[PostCode] [Varchar](100) NOT NULL,
	[CountryCode] [Char](10) NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [Varchar](50) NOT NULL,
 CONSTRAINT [address_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
))
 ALTER TABLE [etl].[Address] ADD CONSTRAINT [Addrtyp_fk] FOREIGN KEY (TypeID) REFERENCES etl.[RefAddressType](ID 
)
GO

CREATE NONCLUSTERED INDEX [NCI_ADD] on [etl].[Address](UniqueClientID)



-- changeset jenkins:001-18
-- comment: create Email table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[Email](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UniqueClientID] [int] NOT NULL,
	[TypeID] [int] NULL,
	[Preferred] [Bit] NULL,
	[Email] [Varchar](100) NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [Varchar](50) NOT NULL
 ,CONSTRAINT [email_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
))
ALTER TABLE [etl].[Email] ADD CONSTRAINT [Emailtyp_fk] FOREIGN KEY (TypeID) REFERENCES [etl].[RefEmailType](ID) 

GO

CREATE NONCLUSTERED INDEX [NCI_EMA] on [etl].[Email](UniqueClientID)

-- changeset jenkins:001-19
-- comment: Increases data type length for column CountryCode in table Address to varch(100)
Alter table [etl].[Address] Alter Column [CountryCode] varchar(500)
