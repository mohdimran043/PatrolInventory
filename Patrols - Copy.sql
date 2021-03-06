USE [Patrols]
GO
/****** Object:  Table [dbo].[Ahwal]    Script Date: 9/19/2018 7:36:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ahwal](
	[AhwalID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_Ahwal] PRIMARY KEY CLUSTERED 
(
	[AhwalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AhwalMapping]    Script Date: 9/19/2018 7:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AhwalMapping](
	[AhwalMappingID] [bigint] IDENTITY(1,1) NOT NULL,
	[AhwalID] [bigint] NOT NULL,
	[ShiftID] [int] NOT NULL,
	[SectorID] [bigint] NOT NULL,
	[PatrolRoleID] [int] NOT NULL,
	[CityGroupID] [bigint] NOT NULL,
	[PersonID] [bigint] NOT NULL,
	[HasFixedCallerID] [tinyint] NOT NULL,
	[CallerID] [nvarchar](50) NULL,
	[HasDevices] [tinyint] NOT NULL,
	[HandHeldID] [bigint] NULL,
	[PatrolID] [bigint] NULL,
	[PatrolPersonStateID] [int] NULL,
	[LastStateChangeTimeStamp] [datetime] NULL,
	[SunRiseTimeStamp] [datetime] NULL,
	[SunSetTimeStamp] [datetime] NULL,
	[LastLandTimeStamp] [datetime] NULL,
	[LastSeaTimeStamp] [datetime] NULL,
	[LastAwayTimeStamp] [datetime] NULL,
	[LastComeBackTimeStamp] [datetime] NULL,
	[IncidentID] [bigint] NULL,
	[AssocitatePersonID] [bigint] NULL,
	[SortingIndex] [bigint] NOT NULL,
 CONSTRAINT [PK_AhwalMapping] PRIMARY KEY CLUSTERED 
(
	[AhwalMappingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckInOutStates]    Script Date: 9/19/2018 7:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckInOutStates](
	[CheckInOutStateID] [bigint] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_CheckInOutStates] PRIMARY KEY CLUSTERED 
(
	[CheckInOutStateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CityGroups]    Script Date: 9/19/2018 7:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CityGroups](
	[CityGroupID] [bigint] NOT NULL,
	[AhwalID] [bigint] NULL,
	[SectorID] [bigint] NULL,
	[ShortName] [nvarchar](50) NULL,
	[CallerPrefix] [nvarchar](50) NULL,
	[Text] [nvarchar](4000) NULL,
	[Disabled] [tinyint] NOT NULL,
 CONSTRAINT [PK_CityGroups] PRIMARY KEY CLUSTERED 
(
	[CityGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devices]    Script Date: 9/19/2018 7:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devices](
	[ID] [bigint] NULL,
	[AhwalID] [bigint] NULL,
	[OrgID] [bigint] NULL,
	[DeviceNumber] [nchar](50) NULL,
	[Model] [nchar](50) NULL,
	[Type] [nchar](50) NULL,
	[Defective] [tinyint] NULL,
	[Rental] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HandHelds]    Script Date: 9/19/2018 7:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HandHelds](
	[HandHeldID] [bigint] IDENTITY(1,1) NOT NULL,
	[AhwalID] [bigint] NOT NULL,
	[Serial] [nvarchar](50) NOT NULL,
	[BarCode] [nvarchar](50) NOT NULL,
	[Defective] [tinyint] NOT NULL,
 CONSTRAINT [PK_HandHelds] PRIMARY KEY CLUSTERED 
(
	[HandHeldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HandHeldsCheckInOut]    Script Date: 9/19/2018 7:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HandHeldsCheckInOut](
	[HandHeldCheckInOutID] [bigint] IDENTITY(1,1) NOT NULL,
	[CheckInOutStateID] [bigint] NOT NULL,
	[HandHeldID] [bigint] NOT NULL,
	[PersonID] [bigint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_HandHeldsCheckInOut] PRIMARY KEY CLUSTERED 
(
	[HandHeldCheckInOutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incidents]    Script Date: 9/19/2018 7:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incidents](
	[IncidentID] [bigint] IDENTITY(1,1) NOT NULL,
	[IncidentTypeID] [int] NOT NULL,
	[IncidentStateID] [int] NOT NULL,
	[Place] [nvarchar](4000) NULL,
	[IncidentSourceID] [int] NOT NULL,
	[IncidentSourceExtraInfo1] [nvarchar](4000) NULL,
	[IncidentSourceExtraInfo2] [nvarchar](4000) NULL,
	[IncidentSourceExtraInfo3] [nvarchar](4000) NULL,
	[UserID] [bigint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_Incidents] PRIMARY KEY CLUSTERED 
(
	[IncidentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncidentsComments]    Script Date: 9/19/2018 7:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncidentsComments](
	[IncidentCommentID] [bigint] IDENTITY(1,1) NOT NULL,
	[IncidentID] [bigint] NOT NULL,
	[Text] [nvarchar](4000) NULL,
	[UserID] [bigint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_IncidentComments] PRIMARY KEY CLUSTERED 
(
	[IncidentCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncidentSources]    Script Date: 9/19/2018 7:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncidentSources](
	[IncidentSourceID] [int] NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[MainExtraInfoNumber] [int] NOT NULL,
	[ExtraInfo1] [nvarchar](400) NULL,
	[ExtraInfo2] [nvarchar](400) NULL,
	[ExtraInfo3] [nvarchar](400) NULL,
	[RequiresExtraInfo1] [tinyint] NOT NULL,
	[RequiresExtraInfo2] [tinyint] NOT NULL,
	[RequiresExtraInfo3] [tinyint] NOT NULL,
 CONSTRAINT [PK_IncidentSources] PRIMARY KEY CLUSTERED 
(
	[IncidentSourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncidentStates]    Script Date: 9/19/2018 7:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncidentStates](
	[IncidentStateID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_IncidentStates] PRIMARY KEY CLUSTERED 
(
	[IncidentStateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncidentsTypes]    Script Date: 9/19/2018 7:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncidentsTypes](
	[IncidentTypeID] [int] NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[Priority] [int] NULL,
 CONSTRAINT [PK_IncidentTypes] PRIMARY KEY CLUSTERED 
(
	[IncidentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncidentsView]    Script Date: 9/19/2018 7:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncidentsView](
	[IncidentID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_IncidentsView] PRIMARY KEY CLUSTERED 
(
	[IncidentID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LiveCallers]    Script Date: 9/19/2018 7:36:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiveCallers](
	[LiveCallerID] [bigint] IDENTITY(1,1) NOT NULL,
	[HandHeldID] [bigint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Processed] [tinyint] NOT NULL,
 CONSTRAINT [PK_LiveCallers] PRIMARY KEY CLUSTERED 
(
	[LiveCallerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LiveCallersUnknown]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiveCallersUnknown](
	[LiveCallerUnknownID] [bigint] IDENTITY(1,1) NOT NULL,
	[HandHeldNumberName] [nvarchar](500) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Processed] [tinyint] NOT NULL,
 CONSTRAINT [PK_LiveCallerUnknown] PRIMARY KEY CLUSTERED 
(
	[LiveCallerUnknownID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationLogs]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationLogs](
	[LogID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[OperationID] [int] NOT NULL,
	[TImeStamp] [datetime] NOT NULL,
	[StatusID] [int] NOT NULL,
	[Text] [nvarchar](500) NULL,
 CONSTRAINT [PK_OperationLogs] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operations]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operations](
	[OpeartionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Operations] PRIMARY KEY CLUSTERED 
(
	[OpeartionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationsStatus]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationsStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_OperationsStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatrolCars]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatrolCars](
	[PatrolID] [bigint] IDENTITY(1,1) NOT NULL,
	[AhwalID] [bigint] NOT NULL,
	[PlateNumber] [nvarchar](50) NOT NULL,
	[BarCode] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[VINNumber] [nvarchar](50) NULL,
	[Defective] [tinyint] NOT NULL,
	[Rental] [tinyint] NOT NULL,
 CONSTRAINT [PK_PatrolCars] PRIMARY KEY CLUSTERED 
(
	[PatrolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatrolCheckInOut]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatrolCheckInOut](
	[PatrolCheckInOutID] [bigint] IDENTITY(1,1) NOT NULL,
	[CheckInOutStateID] [bigint] NOT NULL,
	[PatrolID] [bigint] NOT NULL,
	[PersonID] [bigint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_PatrolCheckInOut] PRIMARY KEY CLUSTERED 
(
	[PatrolCheckInOutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatrolPersonStateLog]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatrolPersonStateLog](
	[PatrolPersonStateLogID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[PersonID] [bigint] NOT NULL,
	[PatrolPersonStateID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_PatrolPersonStateLog] PRIMARY KEY CLUSTERED 
(
	[PatrolPersonStateLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatrolPersonStates]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatrolPersonStates](
	[PatrolPersonStateID] [int] NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_PatrolPersonStates] PRIMARY KEY CLUSTERED 
(
	[PatrolPersonStateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatrolRoles]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatrolRoles](
	[PatrolRoleID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PatrolRoles] PRIMARY KEY CLUSTERED 
(
	[PatrolRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[PersonID] [bigint] IDENTITY(1,1) NOT NULL,
	[AhwalID] [bigint] NOT NULL,
	[MilNumber] [bigint] NOT NULL,
	[RankID] [int] NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Mobile] [nvarchar](50) NULL,
	[FixedCallerID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Persons_1] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ranks]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ranks](
	[RankID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ranks] PRIMARY KEY CLUSTERED 
(
	[RankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservedCallers]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservedCallers](
	[ReservedID] [int] IDENTITY(1,1) NOT NULL,
	[ReservedCallerID] [nvarchar](50) NULL,
 CONSTRAINT [PK_ReservedCallers] PRIMARY KEY CLUSTERED 
(
	[ReservedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sectors]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sectors](
	[SectorID] [bigint] NOT NULL,
	[AhwalID] [bigint] NULL,
	[ShortName] [nvarchar](500) NOT NULL,
	[CallerPrefix] [nchar](2) NULL,
	[Disabled] [tinyint] NOT NULL,
 CONSTRAINT [PK_Sectors] PRIMARY KEY CLUSTERED 
(
	[SectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shifts]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts](
	[ShiftID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[StartingHour] [int] NOT NULL,
	[NumberOfHours] [int] NOT NULL,
 CONSTRAINT [PK_Shifts] PRIMARY KEY CLUSTERED 
(
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Password] [nvarchar](500) NOT NULL,
	[Salt] [nvarchar](50) NOT NULL,
	[FailedLogins] [int] NOT NULL,
	[LastSuccessLogin] [datetime] NULL,
	[LastFailedLogin] [datetime] NULL,
	[LastIPAddress] [nvarchar](50) NULL,
	[AccountLocked] [tinyint] NOT NULL,
	[Layout_AhwalMapping] [nvarchar](4000) NULL,
	[Layout_Groups_AhawalMapping] [nvarchar](4000) NULL,
	[Layout_OpsLive] [nvarchar](4000) NULL,
	[Layout_Groups_OpsLiveGrid] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersRoles]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRoles](
	[UserRoleID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersRolesMap]    Script Date: 9/19/2018 7:36:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRolesMap](
	[UserID] [bigint] NOT NULL,
	[AhwalID] [bigint] NOT NULL,
	[UserRoleID] [int] NOT NULL,
 CONSTRAINT [PK_UsersRolesMap] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[AhwalID] ASC,
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AhwalMapping] ADD  CONSTRAINT [DF_AhwalMapping_HasFixedCalledID]  DEFAULT ((0)) FOR [HasFixedCallerID]
GO
ALTER TABLE [dbo].[AhwalMapping] ADD  CONSTRAINT [DF_AhwalMapping_HasDevices]  DEFAULT ((0)) FOR [HasDevices]
GO
ALTER TABLE [dbo].[AhwalMapping] ADD  CONSTRAINT [DF_AhwalMapping_SortingIndex]  DEFAULT ((10000)) FOR [SortingIndex]
GO
ALTER TABLE [dbo].[CityGroups] ADD  CONSTRAINT [DF_CityGroups_Disabled]  DEFAULT ((0)) FOR [Disabled]
GO
ALTER TABLE [dbo].[HandHelds] ADD  CONSTRAINT [DF_HandHelds_Defective]  DEFAULT ((0)) FOR [Defective]
GO
ALTER TABLE [dbo].[IncidentSources] ADD  CONSTRAINT [DF_IncidentSources_MainExtraInfoNumber]  DEFAULT ((0)) FOR [MainExtraInfoNumber]
GO
ALTER TABLE [dbo].[IncidentSources] ADD  CONSTRAINT [DF_IncidentSources_RequiresExtraInfo1]  DEFAULT ((0)) FOR [RequiresExtraInfo1]
GO
ALTER TABLE [dbo].[IncidentSources] ADD  CONSTRAINT [DF_IncidentSources_RequiresExtraInfo2]  DEFAULT ((0)) FOR [RequiresExtraInfo2]
GO
ALTER TABLE [dbo].[IncidentSources] ADD  CONSTRAINT [DF_IncidentSources_RequiresExtraInfo3]  DEFAULT ((0)) FOR [RequiresExtraInfo3]
GO
ALTER TABLE [dbo].[LiveCallers] ADD  CONSTRAINT [DF_LiveCallers_Processed]  DEFAULT ((0)) FOR [Processed]
GO
ALTER TABLE [dbo].[LiveCallersUnknown] ADD  CONSTRAINT [DF_LiveCallerUnknown_Processed]  DEFAULT ((0)) FOR [Processed]
GO
ALTER TABLE [dbo].[OperationLogs] ADD  CONSTRAINT [DF_OperationLogs_TImeStamp]  DEFAULT (getdate()) FOR [TImeStamp]
GO
ALTER TABLE [dbo].[PatrolCars] ADD  CONSTRAINT [DF_PatrolCars_Defective]  DEFAULT ((0)) FOR [Defective]
GO
ALTER TABLE [dbo].[PatrolCars] ADD  CONSTRAINT [DF_PatrolCars_Rental]  DEFAULT ((0)) FOR [Rental]
GO
ALTER TABLE [dbo].[Sectors] ADD  CONSTRAINT [DF_Sectors_Disabled]  DEFAULT ((0)) FOR [Disabled]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_FailedLogins]  DEFAULT ((0)) FOR [FailedLogins]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_AccountLocked]  DEFAULT ((0)) FOR [AccountLocked]
GO
ALTER TABLE [dbo].[AhwalMapping]  WITH CHECK ADD  CONSTRAINT [FK_AhwalMapping_CityGroups] FOREIGN KEY([CityGroupID])
REFERENCES [dbo].[CityGroups] ([CityGroupID])
GO
ALTER TABLE [dbo].[AhwalMapping] CHECK CONSTRAINT [FK_AhwalMapping_CityGroups]
GO
ALTER TABLE [dbo].[AhwalMapping]  WITH CHECK ADD  CONSTRAINT [FK_AhwalMapping_HandHelds] FOREIGN KEY([HandHeldID])
REFERENCES [dbo].[HandHelds] ([HandHeldID])
GO
ALTER TABLE [dbo].[AhwalMapping] CHECK CONSTRAINT [FK_AhwalMapping_HandHelds]
GO
ALTER TABLE [dbo].[AhwalMapping]  WITH CHECK ADD  CONSTRAINT [FK_AhwalMapping_Incidents] FOREIGN KEY([IncidentID])
REFERENCES [dbo].[Incidents] ([IncidentID])
GO
ALTER TABLE [dbo].[AhwalMapping] CHECK CONSTRAINT [FK_AhwalMapping_Incidents]
GO
ALTER TABLE [dbo].[AhwalMapping]  WITH CHECK ADD  CONSTRAINT [FK_AhwalMapping_PatrolCars] FOREIGN KEY([PatrolID])
REFERENCES [dbo].[PatrolCars] ([PatrolID])
GO
ALTER TABLE [dbo].[AhwalMapping] CHECK CONSTRAINT [FK_AhwalMapping_PatrolCars]
GO
ALTER TABLE [dbo].[AhwalMapping]  WITH CHECK ADD  CONSTRAINT [FK_AhwalMapping_PatrolPersonStates] FOREIGN KEY([PatrolPersonStateID])
REFERENCES [dbo].[PatrolPersonStates] ([PatrolPersonStateID])
GO
ALTER TABLE [dbo].[AhwalMapping] CHECK CONSTRAINT [FK_AhwalMapping_PatrolPersonStates]
GO
ALTER TABLE [dbo].[AhwalMapping]  WITH CHECK ADD  CONSTRAINT [FK_AhwalMapping_PatrolRoles] FOREIGN KEY([PatrolRoleID])
REFERENCES [dbo].[PatrolRoles] ([PatrolRoleID])
GO
ALTER TABLE [dbo].[AhwalMapping] CHECK CONSTRAINT [FK_AhwalMapping_PatrolRoles]
GO
ALTER TABLE [dbo].[AhwalMapping]  WITH CHECK ADD  CONSTRAINT [FK_AhwalMapping_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])
GO
ALTER TABLE [dbo].[AhwalMapping] CHECK CONSTRAINT [FK_AhwalMapping_Persons]
GO
ALTER TABLE [dbo].[AhwalMapping]  WITH CHECK ADD  CONSTRAINT [FK_AhwalMapping_Sectors] FOREIGN KEY([SectorID])
REFERENCES [dbo].[Sectors] ([SectorID])
GO
ALTER TABLE [dbo].[AhwalMapping] CHECK CONSTRAINT [FK_AhwalMapping_Sectors]
GO
ALTER TABLE [dbo].[AhwalMapping]  WITH CHECK ADD  CONSTRAINT [FK_AhwalMapping_Shifts] FOREIGN KEY([ShiftID])
REFERENCES [dbo].[Shifts] ([ShiftID])
GO
ALTER TABLE [dbo].[AhwalMapping] CHECK CONSTRAINT [FK_AhwalMapping_Shifts]
GO
ALTER TABLE [dbo].[CityGroups]  WITH CHECK ADD  CONSTRAINT [FK_CityGroups_Ahwal] FOREIGN KEY([AhwalID])
REFERENCES [dbo].[Ahwal] ([AhwalID])
GO
ALTER TABLE [dbo].[CityGroups] CHECK CONSTRAINT [FK_CityGroups_Ahwal]
GO
ALTER TABLE [dbo].[CityGroups]  WITH CHECK ADD  CONSTRAINT [FK_CityGroups_Sectors] FOREIGN KEY([SectorID])
REFERENCES [dbo].[Sectors] ([SectorID])
GO
ALTER TABLE [dbo].[CityGroups] CHECK CONSTRAINT [FK_CityGroups_Sectors]
GO
ALTER TABLE [dbo].[HandHelds]  WITH CHECK ADD  CONSTRAINT [FK_HandHelds_Ahwal] FOREIGN KEY([AhwalID])
REFERENCES [dbo].[Ahwal] ([AhwalID])
GO
ALTER TABLE [dbo].[HandHelds] CHECK CONSTRAINT [FK_HandHelds_Ahwal]
GO
ALTER TABLE [dbo].[HandHeldsCheckInOut]  WITH CHECK ADD  CONSTRAINT [FK_HandHeldsCheckInOut_CheckInOutStates] FOREIGN KEY([CheckInOutStateID])
REFERENCES [dbo].[CheckInOutStates] ([CheckInOutStateID])
GO
ALTER TABLE [dbo].[HandHeldsCheckInOut] CHECK CONSTRAINT [FK_HandHeldsCheckInOut_CheckInOutStates]
GO
ALTER TABLE [dbo].[HandHeldsCheckInOut]  WITH CHECK ADD  CONSTRAINT [FK_HandHeldsCheckInOut_HandHelds] FOREIGN KEY([HandHeldID])
REFERENCES [dbo].[HandHelds] ([HandHeldID])
GO
ALTER TABLE [dbo].[HandHeldsCheckInOut] CHECK CONSTRAINT [FK_HandHeldsCheckInOut_HandHelds]
GO
ALTER TABLE [dbo].[HandHeldsCheckInOut]  WITH CHECK ADD  CONSTRAINT [FK_HandHeldsCheckInOut_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])
GO
ALTER TABLE [dbo].[HandHeldsCheckInOut] CHECK CONSTRAINT [FK_HandHeldsCheckInOut_Persons]
GO
ALTER TABLE [dbo].[Incidents]  WITH CHECK ADD  CONSTRAINT [FK_Incidents_IncidentSources] FOREIGN KEY([IncidentSourceID])
REFERENCES [dbo].[IncidentSources] ([IncidentSourceID])
GO
ALTER TABLE [dbo].[Incidents] CHECK CONSTRAINT [FK_Incidents_IncidentSources]
GO
ALTER TABLE [dbo].[Incidents]  WITH CHECK ADD  CONSTRAINT [FK_Incidents_IncidentStates] FOREIGN KEY([IncidentStateID])
REFERENCES [dbo].[IncidentStates] ([IncidentStateID])
GO
ALTER TABLE [dbo].[Incidents] CHECK CONSTRAINT [FK_Incidents_IncidentStates]
GO
ALTER TABLE [dbo].[Incidents]  WITH CHECK ADD  CONSTRAINT [FK_Incidents_IncidentsTypes] FOREIGN KEY([IncidentTypeID])
REFERENCES [dbo].[IncidentsTypes] ([IncidentTypeID])
GO
ALTER TABLE [dbo].[Incidents] CHECK CONSTRAINT [FK_Incidents_IncidentsTypes]
GO
ALTER TABLE [dbo].[Incidents]  WITH CHECK ADD  CONSTRAINT [FK_Incidents_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Incidents] CHECK CONSTRAINT [FK_Incidents_Users]
GO
ALTER TABLE [dbo].[IncidentsComments]  WITH CHECK ADD  CONSTRAINT [FK_IncidentsComments_Incidents] FOREIGN KEY([IncidentID])
REFERENCES [dbo].[Incidents] ([IncidentID])
GO
ALTER TABLE [dbo].[IncidentsComments] CHECK CONSTRAINT [FK_IncidentsComments_Incidents]
GO
ALTER TABLE [dbo].[IncidentsComments]  WITH CHECK ADD  CONSTRAINT [FK_IncidentsComments_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[IncidentsComments] CHECK CONSTRAINT [FK_IncidentsComments_Users]
GO
ALTER TABLE [dbo].[IncidentsView]  WITH CHECK ADD  CONSTRAINT [FK_IncidentsView_Incidents] FOREIGN KEY([IncidentID])
REFERENCES [dbo].[Incidents] ([IncidentID])
GO
ALTER TABLE [dbo].[IncidentsView] CHECK CONSTRAINT [FK_IncidentsView_Incidents]
GO
ALTER TABLE [dbo].[IncidentsView]  WITH CHECK ADD  CONSTRAINT [FK_IncidentsView_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[IncidentsView] CHECK CONSTRAINT [FK_IncidentsView_Users]
GO
ALTER TABLE [dbo].[LiveCallers]  WITH CHECK ADD  CONSTRAINT [FK_LiveCallers_HandHelds] FOREIGN KEY([HandHeldID])
REFERENCES [dbo].[HandHelds] ([HandHeldID])
GO
ALTER TABLE [dbo].[LiveCallers] CHECK CONSTRAINT [FK_LiveCallers_HandHelds]
GO
ALTER TABLE [dbo].[OperationLogs]  WITH CHECK ADD  CONSTRAINT [FK_OperationLogs_Operations] FOREIGN KEY([OperationID])
REFERENCES [dbo].[Operations] ([OpeartionID])
GO
ALTER TABLE [dbo].[OperationLogs] CHECK CONSTRAINT [FK_OperationLogs_Operations]
GO
ALTER TABLE [dbo].[OperationLogs]  WITH CHECK ADD  CONSTRAINT [FK_OperationLogs_OperationsStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[OperationsStatus] ([StatusID])
GO
ALTER TABLE [dbo].[OperationLogs] CHECK CONSTRAINT [FK_OperationLogs_OperationsStatus]
GO
ALTER TABLE [dbo].[OperationLogs]  WITH CHECK ADD  CONSTRAINT [FK_OperationLogs_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[OperationLogs] CHECK CONSTRAINT [FK_OperationLogs_Users]
GO
ALTER TABLE [dbo].[PatrolCars]  WITH CHECK ADD  CONSTRAINT [FK_PatrolCars_Ahwal] FOREIGN KEY([AhwalID])
REFERENCES [dbo].[Ahwal] ([AhwalID])
GO
ALTER TABLE [dbo].[PatrolCars] CHECK CONSTRAINT [FK_PatrolCars_Ahwal]
GO
ALTER TABLE [dbo].[PatrolCheckInOut]  WITH CHECK ADD  CONSTRAINT [FK_PatrolCheckInOut_CheckInOutStates] FOREIGN KEY([CheckInOutStateID])
REFERENCES [dbo].[CheckInOutStates] ([CheckInOutStateID])
GO
ALTER TABLE [dbo].[PatrolCheckInOut] CHECK CONSTRAINT [FK_PatrolCheckInOut_CheckInOutStates]
GO
ALTER TABLE [dbo].[PatrolCheckInOut]  WITH CHECK ADD  CONSTRAINT [FK_PatrolCheckInOut_PatrolCars] FOREIGN KEY([PatrolID])
REFERENCES [dbo].[PatrolCars] ([PatrolID])
GO
ALTER TABLE [dbo].[PatrolCheckInOut] CHECK CONSTRAINT [FK_PatrolCheckInOut_PatrolCars]
GO
ALTER TABLE [dbo].[PatrolCheckInOut]  WITH CHECK ADD  CONSTRAINT [FK_PatrolCheckInOut_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])
GO
ALTER TABLE [dbo].[PatrolCheckInOut] CHECK CONSTRAINT [FK_PatrolCheckInOut_Persons]
GO
ALTER TABLE [dbo].[PatrolPersonStateLog]  WITH CHECK ADD  CONSTRAINT [FK_PatrolPersonStateLog_PatrolPersonStates] FOREIGN KEY([PatrolPersonStateID])
REFERENCES [dbo].[PatrolPersonStates] ([PatrolPersonStateID])
GO
ALTER TABLE [dbo].[PatrolPersonStateLog] CHECK CONSTRAINT [FK_PatrolPersonStateLog_PatrolPersonStates]
GO
ALTER TABLE [dbo].[PatrolPersonStateLog]  WITH CHECK ADD  CONSTRAINT [FK_PatrolPersonStateLog_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])
GO
ALTER TABLE [dbo].[PatrolPersonStateLog] CHECK CONSTRAINT [FK_PatrolPersonStateLog_Persons]
GO
ALTER TABLE [dbo].[PatrolPersonStateLog]  WITH CHECK ADD  CONSTRAINT [FK_PatrolPersonStateLog_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[PatrolPersonStateLog] CHECK CONSTRAINT [FK_PatrolPersonStateLog_Users]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Ahwal] FOREIGN KEY([AhwalID])
REFERENCES [dbo].[Ahwal] ([AhwalID])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Ahwal]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Ranks] FOREIGN KEY([RankID])
REFERENCES [dbo].[Ranks] ([RankID])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Ranks]
GO
ALTER TABLE [dbo].[Sectors]  WITH CHECK ADD  CONSTRAINT [FK_Sectors_Ahwal] FOREIGN KEY([AhwalID])
REFERENCES [dbo].[Ahwal] ([AhwalID])
GO
ALTER TABLE [dbo].[Sectors] CHECK CONSTRAINT [FK_Sectors_Ahwal]
GO
ALTER TABLE [dbo].[UsersRolesMap]  WITH CHECK ADD  CONSTRAINT [FK_UsersRolesMap_Ahwal] FOREIGN KEY([AhwalID])
REFERENCES [dbo].[Ahwal] ([AhwalID])
GO
ALTER TABLE [dbo].[UsersRolesMap] CHECK CONSTRAINT [FK_UsersRolesMap_Ahwal]
GO
ALTER TABLE [dbo].[UsersRolesMap]  WITH CHECK ADD  CONSTRAINT [FK_UsersRolesMap_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UsersRolesMap] CHECK CONSTRAINT [FK_UsersRolesMap_Users]
GO
ALTER TABLE [dbo].[UsersRolesMap]  WITH CHECK ADD  CONSTRAINT [FK_UsersRolesMap_UsersRoles] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[UsersRoles] ([UserRoleID])
GO
ALTER TABLE [dbo].[UsersRolesMap] CHECK CONSTRAINT [FK_UsersRolesMap_UsersRoles]
GO
