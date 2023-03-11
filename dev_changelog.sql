-- liquibase formatted sql
-- changeset jenkins:001-01
-- comment: create Log_Audit_RunTime table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[Log_Audit_RunTime](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Proceesing_Start_DateTime] [datetime] NULL,
	[Stage] [varchar](25) NULL,
	[Load_Type] [varchar](10) NULL,
	[Src_System] [varchar](10) NULL,
	[Received_File_Name] [varchar](255) NULL,
	[Received_Count] [bigint] NULL,
	[Loaded_File_Name] [varchar](255) NULL,
	[Destination_Count] [bigint] NULL,
	[Difference_Count] [bigint] NULL,
	[Comments] [varchar](255) NULL,
	[Processing_End_DateTime] [varchar](255) NULL,
 CONSTRAINT [log_audit_pk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO


-- changeset jenkins:001-02
-- comment: create Log_Error_RunTime table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [etl].[Log_Error_RunTime](
	[Audit_Table_ID] [bigint] NULL,
	[Error_ID] [bigint] NULL,
	[Affected_Rows] [float] NULL,
	[Action_ID] [bigint] NULL,
	[Comments] [nvarchar](max) NULL,
	[Inserted_DateTime] [nvarchar](max) NULL
)
GO

-- changeset jenkins:001-03
-- comment: alter Log_Error_RunTime table
alter table [etl].[Log_Error_RunTime] add Test varchar(10)


-- changeset jenkins:001-04
-- comment: insert record to person table
begin transaction T00104
insert into dbo.Persons values(3,'limbhare','pratik',29,'Nashik')

-- changeset jenkins:001-05
-- comment: insert record to person table
begin transaction T00105
insert into dbo.Persons values(4,'Nawal','sumit',29,'Nashik') 

-- changeset jenkins:001-06
-- comment: create test table
create table test (name varchar(10), age int)

-- changeset jenkins:001-07
-- comment: create Demotest table
create table Demotest (name varchar(10), age int)

-- changeset jenkins:001-08
-- comment: create Demotest1 table
create table Demotest1 (name varchar(10), age int)

-- changeset jenkins:001-09
-- comment: create Demotest2 table
create table Demotest2 (name varchar(20), age int)
----------------------------------------------------------------------------------------------
