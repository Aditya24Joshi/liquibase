-- liquibase formatted sql
-- changeset jenkins:001-01
-- comment: create Client table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UniqueClientID] [int] NOT NULL,
	[Title] [varchar](25) NULL,
	[FirstName] [varchar](50) NOT NULL,
	[SecondName] [varchar](50) NULL,
	[SurName] [varchar](50) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[DateOfDeath] [datetime] NULL,
	[NINumber] [varchar](50) NULL,
	[StatusID] [int] NOT NULL,
	[LifeStatusID] [int] NOT NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [varchar](50) NOT NULL,
 CONSTRAINT [Client_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO



-- changeset jenkins:001-02
-- comment: create Contact table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UniqueClientID] [int] NOT NULL,
	[TypeID] [int] NULL,
	[Preferred] [bit] NULL,
	[Number] [varchar](100) NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [varchar](50) NOT NULL,
 CONSTRAINT [contact_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO




-- changeset jenkins:001-03
-- comment: create Email table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[Email](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UniqueClientID] [int] NOT NULL,
	[TypeID] [int] NULL,
	[Preferred] [bit] NULL,
	[Email] [varchar](100) NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [varchar](50) NOT NULL,
 CONSTRAINT [email_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO




-- changeset jenkins:001-04
-- comment: create RefAddressType table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[RefAddressType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [varchar](50) NOT NULL,
 CONSTRAINT [refaddresstype_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO


-- changeset jenkins:001-05
-- comment: create RefEmailType table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[RefEmailType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [varchar](50) NOT NULL,
 CONSTRAINT [refemailtype_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO



-- changeset jenkins:001-06
-- comment: create RefLifeStatus table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[RefLifeStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [varchar](50) NOT NULL,
 CONSTRAINT [reflifestatus_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO


-- changeset jenkins:001-07
-- comment: create RefPhoneType table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[RefPhoneType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [varchar](50) NOT NULL,
 CONSTRAINT [refephonetype_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO


-- changeset jenkins:001-08
-- comment: create RefRole table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[RefRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [varchar](50) NOT NULL,
	[Source_Role_Type] [varchar](100) NOT NULL,
 CONSTRAINT [refrole_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO



-- changeset jenkins:001-09
-- comment: create RefStatus table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[RefStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [varchar](50) NOT NULL,
 CONSTRAINT [refstatus_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO


-- changeset jenkins:001-10
-- comment: create Address table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[Address](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UniqueClientID] [int] NOT NULL,
	[TypeID] [int] NULL,
	[Preferred] [bit] NULL,
	[AddressLine1] [varchar](500) NOT NULL,
	[AddressLine2] [varchar](500) NULL,
	[AddressLine3] [varchar](500) NULL,
	[AddressLine4] [varchar](500) NULL,
	[AddressLine5] [varchar](500) NULL,
	[CityName] [varchar](100) NULL,
	[PostCode] [varchar](100) NOT NULL,
	[CountryCode] [varchar](500) NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [varchar](50) NOT NULL,
 CONSTRAINT [address_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO






-- changeset jenkins:001-11
-- comment: create Client_Policy_Role table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[Client_Policy_Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UniqueClientID] [int] NOT NULL,
	[PolicyID] [varchar](100) NOT NULL,
	[RoleID] [int] NOT NULL,
	[EffectiveStartDate] [datetime] NOT NULL,
	[EffectiveEndDate] [datetime] NOT NULL,
	[LastUpdatedTS] [datetime] NOT NULL,
	[LastUpdatedUser] [varchar](50) NOT NULL,
 CONSTRAINT [clientpolicyrole_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO


-- changeset jenkins:001-12
-- comment: Alter client table



ALTER TABLE [etl].[Client]  WITH CHECK ADD  CONSTRAINT [LifeStatus_fk] FOREIGN KEY([LifeStatusID])
REFERENCES [etl].[RefLifeStatus] ([ID])
GO

ALTER TABLE [etl].[Client] CHECK CONSTRAINT [LifeStatus_fk]
GO

ALTER TABLE [etl].[Client]  WITH CHECK ADD  CONSTRAINT [Status_fk] FOREIGN KEY([StatusID])
REFERENCES [etl].[RefStatus] ([ID])
GO

ALTER TABLE [etl].[Client] CHECK CONSTRAINT [Status_fk]
GO



-- changeset jenkins:001-13
-- comment: Alter email table


ALTER TABLE [etl].[Email]  WITH CHECK ADD  CONSTRAINT [Emailtyp_fk] FOREIGN KEY([TypeID])
REFERENCES [etl].[RefEmailType] ([ID])
GO

ALTER TABLE [etl].[Email] CHECK CONSTRAINT [Emailtyp_fk]
GO



-- changeset jenkins:001-14
-- comment: Alter address table

ALTER TABLE [etl].[Address]  WITH CHECK ADD  CONSTRAINT [Addrtyp_fk] FOREIGN KEY([TypeID])
REFERENCES [etl].[RefAddressType] ([ID])
GO

ALTER TABLE [etl].[Address] CHECK CONSTRAINT [Addrtyp_fk]
GO



-- changeset jenkins:001-15
-- comment: Alter Client_Policy_Role table


ALTER TABLE [etl].[Client_Policy_Role]  WITH CHECK ADD  CONSTRAINT [clientpolicyrole1_pk] FOREIGN KEY([RoleID])
REFERENCES [etl].[RefRole] ([ID])
GO

ALTER TABLE [etl].[Client_Policy_Role] CHECK CONSTRAINT [clientpolicyrole1_pk]
GO






