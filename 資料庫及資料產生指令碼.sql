USE [PetDailyNet]
GO
/****** Object:  Table [dbo].[BillDetails]    Script Date: 2024/10/7 下午 11:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[PetId] [int] NOT NULL,
	[PetName] [nvarchar](100) NOT NULL,
	[DoctorId] [int] NOT NULL,
	[DoctorName] [nvarchar](100) NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[EndDate] [datetime] NULL,
	[BookRecordId] [int] NOT NULL,
 CONSTRAINT [PK__BillDeta__3214EC07C3C77C4E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookRecords]    Script Date: 2024/10/7 下午 11:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[BookTime] [datetime] NOT NULL,
	[BookTimeId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[DoctorName] [nvarchar](100) NOT NULL,
	[IsStart] [int] NULL,
	[PetId] [int] NOT NULL,
 CONSTRAINT [PK__BookReco__3214EC07189C2419] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookTimes]    Script Date: 2024/10/7 下午 11:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookTimes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookTime] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepositRecords]    Script Date: 2024/10/7 下午 11:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepositRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[DepositDate] [datetime] NULL,
	[DepositAmount] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__DepositR__3214EC07007C8EA7] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManagerIncomeDetails]    Script Date: 2024/10/7 下午 11:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagerIncomeDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[MemberName] [nvarchar](100) NOT NULL,
	[BillDetailsId] [int] NOT NULL,
	[IncomeAmount] [decimal](18, 2) NOT NULL,
	[SettlementDate] [datetime] NULL,
	[IsEnd] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManagerProfiles]    Script Date: 2024/10/7 下午 11:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagerProfiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PermissionLevel] [bit] NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Account] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[DoctorBoolin] [char](1) NOT NULL,
	[ProfilePicture] [nvarchar](255) NULL,
	[Education] [nvarchar](50) NOT NULL,
	[Expertise] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[BirthDate] [date] NULL,
	[LineCode] [nchar](20) NULL,
 CONSTRAINT [PK__ManagerP__3214EC07D3449AC1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2024/10/7 下午 11:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Mobile] [varchar](10) NULL,
	[AccountBalance] [decimal](10, 2) NOT NULL,
	[IsConfirmed] [bit] NULL,
	[ConfirmCode] [varchar](50) NULL,
	[Address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetDiaries]    Script Date: 2024/10/7 下午 11:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetDiaries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PetId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[DataDate] [date] NULL,
	[Type] [char](1) NULL,
	[Weight] [decimal](3, 2) NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetProfiles]    Script Date: 2024/10/7 下午 11:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetProfiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Gender] [char](1) NULL,
	[Birthday] [date] NULL,
	[Species] [char](1) NULL,
	[Breed] [varchar](50) NULL,
	[Neutered] [bit] NULL,
	[Photo] [nvarchar](255) NULL,
	[Weight] [decimal](4, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetsTag]    Script Date: 2024/10/7 下午 11:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetsTag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PetProfilesId] [int] NOT NULL,
	[PhotoId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photo]    Script Date: 2024/10/7 下午 11:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PetDiariesId] [int] NULL,
	[FileName] [varchar](70) NOT NULL,
	[FilePath] [nvarchar](255) NULL,
	[UploadDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PictureFiles]    Script Date: 2024/10/7 下午 11:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PictureFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MediaPath] [varchar](max) NULL,
	[Description] [nvarchar](100) NULL,
	[DisplayOrder] [int] NOT NULL,
	[LastModified] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BillDetails] ON 

INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (4, 1, 1, N'Max', 1, N'王小明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2023-09-01T09:00:00.000' AS DateTime), 11)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (5, 2, 2, N'Bella', 2, N'王大明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2023-09-01T09:30:00.000' AS DateTime), 12)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (6, 3, 3, N'Charlie', 1, N'王小明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2023-09-01T10:00:00.000' AS DateTime), 13)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (7, 4, 4, N'Lucy', 2, N'王大明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2023-09-01T10:30:00.000' AS DateTime), 14)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (8, 5, 5, N'Daisy', 1, N'王小明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2023-09-01T11:00:00.000' AS DateTime), 15)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (17, 1, 1, N'Max', 1, N'王小明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-09-24T11:38:26.500' AS DateTime), 25)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (18, 1, 1, N'Max', 2, N'王大明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-09-24T13:40:36.553' AS DateTime), 22)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (19, 1, 1, N'Max', 1, N'王小明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-09-24T15:50:45.247' AS DateTime), 29)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (20, 1, 1, N'Max', 1, N'王小明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-09-24T16:44:56.777' AS DateTime), 28)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (29, 1, 1, N'Max', 1, N'王小明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-09-25T09:26:56.957' AS DateTime), 30)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (32, 1, 1, N'Max', 1, N'王小明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-09-30T09:34:33.000' AS DateTime), 30)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (1030, 1, 1, N'Max', 1, N'王小明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-10-07T15:16:39.373' AS DateTime), 11)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (1031, 2, 2, N'Bella', 2, N'王大明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-10-07T15:16:39.400' AS DateTime), 12)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (1032, 3, 3, N'Charlie', 1, N'王小明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-10-07T15:16:39.407' AS DateTime), 13)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (1033, 4, 4, N'Lucy', 2, N'王大明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-10-07T15:16:39.410' AS DateTime), 14)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (1034, 5, 5, N'Daisy', 1, N'王小明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-10-07T15:16:39.410' AS DateTime), 15)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (1035, 1, 1, N'Max', 1, N'王小明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-10-07T15:16:39.410' AS DateTime), 18)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (1036, 1, 1, N'Max', 2, N'王大明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-10-07T15:16:39.410' AS DateTime), 19)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (1037, 1, 1, N'Max', 1, N'王小明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-10-07T15:16:39.410' AS DateTime), 21)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (1038, 1, 1, N'Max', 1, N'王小明', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-10-07T15:16:39.410' AS DateTime), 31)
INSERT [dbo].[BillDetails] ([Id], [MemberId], [PetId], [PetName], [DoctorId], [DoctorName], [Amount], [EndDate], [BookRecordId]) VALUES (1039, 1, 1, N'Max', 6, N'brian', CAST(200.00 AS Decimal(10, 2)), CAST(N'2024-10-07T15:16:39.413' AS DateTime), 33)
SET IDENTITY_INSERT [dbo].[BillDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[BookRecords] ON 

INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (11, 1, CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-09-01T09:00:00.000' AS DateTime), 1, 1, N'王小明', 4, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (12, 2, CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-09-01T09:30:00.000' AS DateTime), 2, 2, N'王大明', 4, 2)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (13, 3, CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-09-01T10:00:00.000' AS DateTime), 3, 1, N'王小明', 4, 3)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (14, 4, CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-09-01T10:30:00.000' AS DateTime), 4, 2, N'王大明', 4, 4)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (15, 5, CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-09-01T11:00:00.000' AS DateTime), 5, 1, N'王小明', 4, 5)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (17, 1, CAST(N'2024-09-22T00:00:00.000' AS DateTime), CAST(N'2024-09-22T10:00:00.000' AS DateTime), 3, 1, N'王小明', 3, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (18, 1, CAST(N'2024-09-25T00:00:00.000' AS DateTime), CAST(N'2024-09-25T11:30:00.000' AS DateTime), 6, 1, N'王小明', 4, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (19, 1, CAST(N'2024-09-25T00:00:00.000' AS DateTime), CAST(N'2024-09-25T17:00:00.000' AS DateTime), 15, 2, N'王大明', 4, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (20, 1, CAST(N'2024-09-22T00:00:00.000' AS DateTime), CAST(N'2024-09-22T13:00:00.000' AS DateTime), 7, 2, N'王大明', 3, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (21, 1, CAST(N'2024-10-03T00:00:00.000' AS DateTime), CAST(N'2024-10-03T20:00:00.000' AS DateTime), 19, 1, N'王小明', 4, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (22, 1, CAST(N'2024-09-24T00:00:00.000' AS DateTime), CAST(N'2024-09-24T13:00:00.000' AS DateTime), 7, 2, N'王大明', 3, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (23, 1, CAST(N'2024-09-23T00:00:00.000' AS DateTime), CAST(N'2024-09-23T13:00:00.000' AS DateTime), 7, 2, N'王大明', 3, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (24, 1, CAST(N'2024-09-22T00:00:00.000' AS DateTime), CAST(N'2024-09-22T14:00:00.000' AS DateTime), 9, 1, N'王小明', 3, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (25, 1, CAST(N'2024-09-24T00:00:00.000' AS DateTime), CAST(N'2024-09-24T09:30:00.000' AS DateTime), 2, 1, N'王小明', 3, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (26, 1, CAST(N'2024-09-24T00:00:00.000' AS DateTime), CAST(N'2024-09-24T13:40:00.000' AS DateTime), 8, 2, N'王大明', 3, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (27, 1, CAST(N'2024-09-24T00:00:00.000' AS DateTime), CAST(N'2024-09-24T14:00:00.000' AS DateTime), 9, 1, N'王小明', 3, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (28, 1, CAST(N'2024-09-24T00:00:00.000' AS DateTime), CAST(N'2024-09-24T15:00:00.000' AS DateTime), 11, 1, N'王小明', 3, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (29, 1, CAST(N'2024-09-24T00:00:00.000' AS DateTime), CAST(N'2024-09-24T15:30:00.000' AS DateTime), 12, 1, N'王小明', 3, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (30, 1, CAST(N'2024-09-25T00:00:00.000' AS DateTime), CAST(N'2024-09-25T09:00:00.000' AS DateTime), 1, 1, N'王小明', 3, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (31, 1, CAST(N'2024-10-04T15:42:30.000' AS DateTime), CAST(N'2024-10-07T09:00:00.000' AS DateTime), 1, 1, N'王小明', 4, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (32, 1, CAST(N'2024-10-04T10:20:10.000' AS DateTime), CAST(N'2024-10-14T09:00:00.000' AS DateTime), 1, 2, N'王大明', 0, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (33, 1, CAST(N'2024-10-04T09:32:00.000' AS DateTime), CAST(N'2024-10-04T19:00:00.000' AS DateTime), 17, 6, N'brian', 4, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (1031, 1, CAST(N'2024-10-07T08:01:00.000' AS DateTime), CAST(N'2024-10-08T10:00:00.000' AS DateTime), 3, 1, N'王小明', 0, 1)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (1032, 1, CAST(N'2024-10-07T15:12:59.370' AS DateTime), CAST(N'2024-10-08T09:30:00.000' AS DateTime), 2, 2, N'李仁碩', 0, 11)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (1033, 1, CAST(N'2024-10-07T16:38:10.750' AS DateTime), CAST(N'2024-10-08T10:00:00.000' AS DateTime), 3, 2, N'李仁碩', 0, 11)
INSERT [dbo].[BookRecords] ([Id], [MemberId], [StartDate], [BookTime], [BookTimeId], [DoctorId], [DoctorName], [IsStart], [PetId]) VALUES (1034, 1, CAST(N'2024-10-07T17:11:56.310' AS DateTime), CAST(N'2024-10-08T09:00:00.000' AS DateTime), 1, 2, N'李仁碩', 0, 19)
SET IDENTITY_INSERT [dbo].[BookRecords] OFF
GO
SET IDENTITY_INSERT [dbo].[BookTimes] ON 

INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (1, N'9:00')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (2, N'9:30')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (3, N'10:00')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (4, N'10:30')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (5, N'11:00')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (6, N'11:30')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (7, N'13:00')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (8, N'13:30')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (9, N'14:00')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (10, N'14:30')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (11, N'15:00')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (12, N'15:30')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (13, N'16:00')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (14, N'16:30')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (15, N'17:00')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (16, N'17:30')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (17, N'19:00')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (18, N'19:30')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (19, N'20:00')
INSERT [dbo].[BookTimes] ([Id], [BookTime]) VALUES (20, N'20:30')
SET IDENTITY_INSERT [dbo].[BookTimes] OFF
GO
SET IDENTITY_INSERT [dbo].[DepositRecords] ON 

INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (1, 1, CAST(N'2024-09-01T08:30:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (2, 2, CAST(N'2024-09-02T14:45:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (3, 3, CAST(N'2024-09-03T10:15:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (4, 4, CAST(N'2024-09-04T16:20:00.000' AS DateTime), CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (5, 5, CAST(N'2024-09-05T09:55:00.000' AS DateTime), CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (10, 2015, CAST(N'2024-09-30T12:00:00.000' AS DateTime), CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (11, 2015, CAST(N'2024-09-30T00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (12, 2015, CAST(N'2024-09-30T16:11:34.393' AS DateTime), CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (13, 2015, CAST(N'2024-09-30T16:12:09.463' AS DateTime), CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (14, 2015, CAST(N'2024-09-30T16:58:33.340' AS DateTime), CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (1012, 2015, CAST(N'2024-10-03T17:47:01.127' AS DateTime), CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (2012, 2015, CAST(N'2024-10-04T17:19:59.780' AS DateTime), CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (2013, 1, CAST(N'2024-10-04T17:23:16.643' AS DateTime), CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (2014, 1, CAST(N'2024-10-04T17:30:48.883' AS DateTime), CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (2015, 1, CAST(N'2024-10-04T17:30:53.917' AS DateTime), CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (2016, 1, CAST(N'2024-10-04T17:30:53.977' AS DateTime), CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (2017, 1, CAST(N'2024-10-04T17:30:54.070' AS DateTime), CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (2018, 1, CAST(N'2024-10-04T17:30:54.243' AS DateTime), CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (3012, 1, CAST(N'2024-10-07T11:16:07.760' AS DateTime), CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (4012, 1, CAST(N'2024-10-07T15:12:27.937' AS DateTime), CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (4013, 2016, CAST(N'2024-10-07T15:49:27.673' AS DateTime), CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (4014, 2016, CAST(N'2024-10-07T16:34:19.607' AS DateTime), CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (4015, 1, CAST(N'2024-10-07T16:37:59.313' AS DateTime), CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (4016, 1, CAST(N'2024-10-07T17:07:58.170' AS DateTime), CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[DepositRecords] ([Id], [MemberId], [DepositDate], [DepositAmount]) VALUES (4017, 1, CAST(N'2024-10-07T17:11:34.583' AS DateTime), CAST(250.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DepositRecords] OFF
GO
SET IDENTITY_INSERT [dbo].[ManagerIncomeDetails] ON 

INSERT [dbo].[ManagerIncomeDetails] ([Id], [UserId], [MemberId], [MemberName], [BillDetailsId], [IncomeAmount], [SettlementDate], [IsEnd]) VALUES (2, 1, 1, N'Alice', 4, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-09-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ManagerIncomeDetails] ([Id], [UserId], [MemberId], [MemberName], [BillDetailsId], [IncomeAmount], [SettlementDate], [IsEnd]) VALUES (3, 1, 2, N'Bob', 5, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-09-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ManagerIncomeDetails] ([Id], [UserId], [MemberId], [MemberName], [BillDetailsId], [IncomeAmount], [SettlementDate], [IsEnd]) VALUES (4, 2, 3, N'Charlie', 6, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-09-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ManagerIncomeDetails] ([Id], [UserId], [MemberId], [MemberName], [BillDetailsId], [IncomeAmount], [SettlementDate], [IsEnd]) VALUES (5, 2, 4, N'David', 7, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-09-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ManagerIncomeDetails] ([Id], [UserId], [MemberId], [MemberName], [BillDetailsId], [IncomeAmount], [SettlementDate], [IsEnd]) VALUES (6, 3, 5, N'Eva', 8, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-09-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[ManagerIncomeDetails] ([Id], [UserId], [MemberId], [MemberName], [BillDetailsId], [IncomeAmount], [SettlementDate], [IsEnd]) VALUES (7, 1, 1, N'Alice', 4, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-10-07T15:16:39.507' AS DateTime), 1)
INSERT [dbo].[ManagerIncomeDetails] ([Id], [UserId], [MemberId], [MemberName], [BillDetailsId], [IncomeAmount], [SettlementDate], [IsEnd]) VALUES (8, 2, 2, N'Bob1', 5, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-10-07T15:16:39.517' AS DateTime), 1)
INSERT [dbo].[ManagerIncomeDetails] ([Id], [UserId], [MemberId], [MemberName], [BillDetailsId], [IncomeAmount], [SettlementDate], [IsEnd]) VALUES (9, 1, 3, N'Charlie', 6, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-10-07T15:16:39.517' AS DateTime), 1)
INSERT [dbo].[ManagerIncomeDetails] ([Id], [UserId], [MemberId], [MemberName], [BillDetailsId], [IncomeAmount], [SettlementDate], [IsEnd]) VALUES (10, 2, 4, N'David', 7, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-10-07T15:16:39.520' AS DateTime), 1)
INSERT [dbo].[ManagerIncomeDetails] ([Id], [UserId], [MemberId], [MemberName], [BillDetailsId], [IncomeAmount], [SettlementDate], [IsEnd]) VALUES (11, 1, 5, N'Eva', 8, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-10-07T15:16:39.520' AS DateTime), 1)
INSERT [dbo].[ManagerIncomeDetails] ([Id], [UserId], [MemberId], [MemberName], [BillDetailsId], [IncomeAmount], [SettlementDate], [IsEnd]) VALUES (12, 1, 1, N'Alice', 1035, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-10-07T15:16:39.523' AS DateTime), 1)
INSERT [dbo].[ManagerIncomeDetails] ([Id], [UserId], [MemberId], [MemberName], [BillDetailsId], [IncomeAmount], [SettlementDate], [IsEnd]) VALUES (13, 2, 1, N'Alice', 1036, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-10-07T15:16:39.533' AS DateTime), 1)
INSERT [dbo].[ManagerIncomeDetails] ([Id], [UserId], [MemberId], [MemberName], [BillDetailsId], [IncomeAmount], [SettlementDate], [IsEnd]) VALUES (14, 1, 1, N'Alice', 1037, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-10-07T15:16:39.533' AS DateTime), 1)
INSERT [dbo].[ManagerIncomeDetails] ([Id], [UserId], [MemberId], [MemberName], [BillDetailsId], [IncomeAmount], [SettlementDate], [IsEnd]) VALUES (15, 1, 1, N'Alice', 1038, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-10-07T15:16:39.537' AS DateTime), 1)
INSERT [dbo].[ManagerIncomeDetails] ([Id], [UserId], [MemberId], [MemberName], [BillDetailsId], [IncomeAmount], [SettlementDate], [IsEnd]) VALUES (16, 6, 1, N'Alice', 1039, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-10-07T15:16:39.537' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ManagerIncomeDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[ManagerProfiles] ON 

INSERT [dbo].[ManagerProfiles] ([Id], [PermissionLevel], [FullName], [Account], [Password], [DoctorBoolin], [ProfilePicture], [Education], [Expertise], [Name], [Gender], [PhoneNumber], [Address], [BirthDate], [LineCode]) VALUES (1, 0, N'陳育昇', N'doctor111', N'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', N'1', N'doctor1.jpg', N'醫學院', N'小動物專家', N'陳育昇', N'M', N'0912345678', N'台北市信義區', CAST(N'1980-05-15' AS Date), NULL)
INSERT [dbo].[ManagerProfiles] ([Id], [PermissionLevel], [FullName], [Account], [Password], [DoctorBoolin], [ProfilePicture], [Education], [Expertise], [Name], [Gender], [PhoneNumber], [Address], [BirthDate], [LineCode]) VALUES (2, 0, NULL, N'doctor222', N'c6ba91b90d922e159893f46c387e5dc1b3dc5c101a5a4522f03b987177a24a91', N'1', NULL, N'獸醫學院', N'大型動物專家', N'李仁碩', N'M', N'0923456787', N'台北市大安區', CAST(N'1998-01-07' AS Date), NULL)
INSERT [dbo].[ManagerProfiles] ([Id], [PermissionLevel], [FullName], [Account], [Password], [DoctorBoolin], [ProfilePicture], [Education], [Expertise], [Name], [Gender], [PhoneNumber], [Address], [BirthDate], [LineCode]) VALUES (3, 1, N'王美琳', N'admin111', N'713bfda78870bf9d1b261f565286f85e97ee614efe5f0faf7c34e7ca4f65baca', N'0', N'admin.jpg', N'管理學院', N'系統管理', N'王美琳', N'F', N'0934567890', N'台北市中山區', CAST(N'1975-11-30' AS Date), NULL)
INSERT [dbo].[ManagerProfiles] ([Id], [PermissionLevel], [FullName], [Account], [Password], [DoctorBoolin], [ProfilePicture], [Education], [Expertise], [Name], [Gender], [PhoneNumber], [Address], [BirthDate], [LineCode]) VALUES (4, 1, NULL, N'admin222', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'0', NULL, N'管理學院', N'123', N'王小杰', N'M', N'0912345678', N'台北市中正區', CAST(N'1988-01-01' AS Date), NULL)
INSERT [dbo].[ManagerProfiles] ([Id], [PermissionLevel], [FullName], [Account], [Password], [DoctorBoolin], [ProfilePicture], [Education], [Expertise], [Name], [Gender], [PhoneNumber], [Address], [BirthDate], [LineCode]) VALUES (6, 0, NULL, N'doctor123', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'1', NULL, N'123', N'123', N'brian', N'M', N'0987654321', N'123', NULL, NULL)
INSERT [dbo].[ManagerProfiles] ([Id], [PermissionLevel], [FullName], [Account], [Password], [DoctorBoolin], [ProfilePicture], [Education], [Expertise], [Name], [Gender], [PhoneNumber], [Address], [BirthDate], [LineCode]) VALUES (1005, 0, NULL, N'doctor555', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'1', NULL, N'醫學院', N'貓科專業', N'陳小美', N'F', N'0912345678', N'新北市土城區清水路10號', CAST(N'1990-02-14' AS Date), NULL)
INSERT [dbo].[ManagerProfiles] ([Id], [PermissionLevel], [FullName], [Account], [Password], [DoctorBoolin], [ProfilePicture], [Education], [Expertise], [Name], [Gender], [PhoneNumber], [Address], [BirthDate], [LineCode]) VALUES (1006, 1, NULL, N'admin567', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'0', N'/Uploads/ProfilesPictures/300px-Polish_Jerry.jpg', N'管理學院', N'管理學院', N'王傑瑞', N'M', N'0912345678', N'新北市土城區青仁路30號1樓', CAST(N'1992-02-14' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[ManagerProfiles] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (1, N'Alice', N'zhangsan@example.com', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'0912345678', CAST(50.00 AS Decimal(10, 2)), 1, N'5eae60169bd144518cb358edce221ead', N'456')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (2, N'Bob1', N'lisi@example.com', N'C6BA91B90D922E159893F46C387E5DC1B3DC5C101A5A4522F03B987177A24A91', N'0922345679', CAST(0.00 AS Decimal(10, 2)), 1, N'DEF456', N'125')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (3, N'Charlie', N'wangwu@example.com', N'5EFC2B017DA4F7736D192A74DDE5891369E0685D4D38F2A455B6FCDAB282DF9C', N'0932345678', CAST(300.00 AS Decimal(10, 2)), 1, N'GHI789', NULL)
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4, N'David', N'zhaoliu@example.com', N'5C773B22EA79D367B38810E7E9AD108646ED62E231868CEFB0B1280EA88AC4F0', N'0942345678', CAST(150.00 AS Decimal(10, 2)), 1, N'JKL101', NULL)
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (5, N'Eva', N'chenqi@example.com', N'3233C5E43B1A0D2A03C8A6FC981FE3BAD46B9FEE5CA59D53F6A531325CD3A433', N'0952345678', CAST(50.00 AS Decimal(10, 2)), 0, N'MNO102', NULL)
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (6, N'孫八', N'sunba@example.com', N'C14883C02091C283D24D22EDF9ADBCBD13CC43E564E47E30D600033885C49AF5', N'0962345678', CAST(500.00 AS Decimal(10, 2)), 1, N'PQR103', NULL)
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (7, N'周九', N'zhoujiu@example.com', N'825242929F5ADFD5C4B9318E95C1A83584367D888172D1453EF3A855ED704453', N'0972345678', CAST(250.00 AS Decimal(10, 2)), 0, N'STU104', NULL)
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (8, N'吳十', N'wushi@example.com', N'BB10F0C847BE9E4CD43DCA85E1E42763E357207C04598A082F276F8B7A36C8F7', N'0982345678', CAST(0.00 AS Decimal(10, 2)), 1, N'VWX105', NULL)
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (9, N'bbb', N'test@gmail.com', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'0912345687', CAST(0.00 AS Decimal(10, 2)), 1, NULL, NULL)
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (2014, N'liam', N'zscx870214@gmail.com', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'0912345678', CAST(0.00 AS Decimal(10, 2)), 0, N'7296ac2766a948bba8d951de98c1a02c', NULL)
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (2015, N'勞贖', N'asd931047@gmail.com', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'0912345677', CAST(0.00 AS Decimal(10, 2)), 1, N'01b439c4658946578cf6ba71533f4770', N'456')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (2016, N'盧佘', N'brianye66@gmail.com', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'0988123456', CAST(0.00 AS Decimal(10, 2)), 1, NULL, N'456')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4016, N'Meaghan', N'Tiara.Hahn84@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0920858578', CAST(421.59 AS Decimal(10, 2)), 1, N'dc89ywftqe', N'三民路 512號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4017, N'Rosalee', N'Taryn.Dickens@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0996416448', CAST(816.91 AS Decimal(10, 2)), 1, N'akc7czgfp0', N'羅斯福路 878號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4018, N'Isabelle', N'Olen.Schmidt92@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0924457806', CAST(2807.62 AS Decimal(10, 2)), 1, N'kng3y62hkg', N'八德路 755號, 基隆市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4019, N'Ofelia', N'Gia_Auer@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0948280196', CAST(3182.98 AS Decimal(10, 2)), 1, N'cr4kb8tcpl', N'復興北路 490號, 嘉義市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4020, N'Jaiden', N'Joan_Berge@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0986899745', CAST(340.84 AS Decimal(10, 2)), 0, N'9fvh3zmtgs', N'三民路 675號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4021, N'Darrell', N'Xavier.Heidenreich53@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0921327915', CAST(2814.73 AS Decimal(10, 2)), 0, N'89wcamzcmv', N'中山路 205號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4022, N'Nathaniel', N'Russ98@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0963579352', CAST(1874.17 AS Decimal(10, 2)), 1, N'f8vyceuvld', N'信義路 428號, 彰化縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4023, N'Lyla', N'Angus.Hirthe@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0931611871', CAST(1837.22 AS Decimal(10, 2)), 0, N'2ozkf0bres', N'基隆路 718號, 嘉義市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4024, N'Linda', N'Columbus_Renner92@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0992473677', CAST(2291.12 AS Decimal(10, 2)), 0, N'oinaog17tq', N'四維路 172號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4025, N'Shanon', N'Louie99@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0982491448', CAST(537.04 AS Decimal(10, 2)), 1, N'lzx5b7tcdr', N'復興北路 682號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4026, N'Charley', N'Quentin.Block@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0966738406', CAST(889.86 AS Decimal(10, 2)), 1, N'y83g5m82ke', N'八德路 640號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4027, N'Dayne', N'Cecilia64@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0938647926', CAST(1651.59 AS Decimal(10, 2)), 0, N'4553sglm0q', N'三民路 17號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4028, N'Mireille', N'Adam_Strosin@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0927089156', CAST(3559.60 AS Decimal(10, 2)), 1, N'elqn9ohng0', N'四維路 585號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4029, N'Terrill', N'Emilio_Shanahan72@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0968673121', CAST(3372.17 AS Decimal(10, 2)), 0, N'wwtbzadg7j', N'中山路 81號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4030, N'Americo', N'Katarina61@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0951907709', CAST(4705.43 AS Decimal(10, 2)), 0, N'6hs2ooflq1', N'和平東路 523號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4031, N'Clemmie', N'Kurtis.Yost@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0901533797', CAST(2892.64 AS Decimal(10, 2)), 1, N'8eiocqaqdx', N'仁愛路 497號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4032, N'Korbin', N'Alvena.Shanahan15@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0948140937', CAST(4763.18 AS Decimal(10, 2)), 0, N'o0js10nu5a', N'中山路 278號, 桃園市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4033, N'Maida', N'Milford.Witting@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0915448531', CAST(1418.59 AS Decimal(10, 2)), 0, N'w0e7fhvss0', N'仁愛路 939號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4034, N'Samantha', N'Boyd_Reinger@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0998406151', CAST(4733.79 AS Decimal(10, 2)), 1, N'nhkde8vy82', N'羅斯福路 182號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4035, N'Edwin', N'Cleve_Koss@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0988298063', CAST(2911.89 AS Decimal(10, 2)), 1, N'vquacodohb', N'民權西路 774號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4036, N'Salvador', N'Pasquale29@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0970226826', CAST(2838.36 AS Decimal(10, 2)), 1, N'midy63chx2', N'八德路 794號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4037, N'Kallie', N'Allie.Medhurst@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0904015846', CAST(3120.11 AS Decimal(10, 2)), 0, N'gq35preboe', N'和平東路 578號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4038, N'Danielle', N'Sylvan_Williamson63@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0981521423', CAST(1761.23 AS Decimal(10, 2)), 0, N'pudm2oxupm', N'民權西路 710號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4039, N'Kiana', N'Ellsworth_Stanton@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0978935558', CAST(2910.78 AS Decimal(10, 2)), 1, N'7wbrqqtmi7', N'忠孝東路 897號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4040, N'Zena', N'Brooks_Casper81@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0967488800', CAST(2548.20 AS Decimal(10, 2)), 1, N'29dfdeauph', N'中山路 65號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4041, N'Rosetta', N'Ramon.Zemlak@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0950775188', CAST(4316.50 AS Decimal(10, 2)), 0, N'rl03ynnkkr', N'羅斯福路 130號, 桃園市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4042, N'Erick', N'Kelton.Haag@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0986505046', CAST(4320.89 AS Decimal(10, 2)), 1, N'jezupn2cv7', N'仁愛路 434號, 宜蘭縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4043, N'Melany', N'Jada.Treutel@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0982880109', CAST(2784.71 AS Decimal(10, 2)), 0, N'51pc7g59mp', N'和平東路 967號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4044, N'Robyn', N'Horace.Schaden8@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0902833518', CAST(2857.04 AS Decimal(10, 2)), 0, N'4sy14qhh5b', N'四維路 827號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4045, N'Johnathan', N'Jayden_Anderson35@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0944718808', CAST(4487.69 AS Decimal(10, 2)), 0, N'f13d6ssspa', N'信義路 297號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4046, N'Josh', N'Jeffery_Heathcote@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0922246319', CAST(1449.52 AS Decimal(10, 2)), 0, N'gl9b7sm4po', N'中山路 111號, 宜蘭縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4047, N'Anastacio', N'Christop88@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0946037186', CAST(3649.15 AS Decimal(10, 2)), 0, N'muisur1fbf', N'羅斯福路 208號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4048, N'Buck', N'Carmelo56@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0969094859', CAST(3110.55 AS Decimal(10, 2)), 1, N'yxeu2dl273', N'仁愛路 264號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4049, N'Isabell', N'Edyth.Towne54@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0961227753', CAST(4936.28 AS Decimal(10, 2)), 1, N'4t9hxsv2xj', N'民權西路 944號, 嘉義市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4050, N'Eloisa', N'Vernie.Morar@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0968032815', CAST(1797.64 AS Decimal(10, 2)), 0, N'2o8v0foyjh', N'忠孝東路 846號, 桃園市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4051, N'Zoila', N'Mohammed_OConnell75@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0902052791', CAST(663.95 AS Decimal(10, 2)), 0, N'bpchnplaw9', N'四維路 953號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4052, N'Vergie', N'Montana_Bins15@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0966493227', CAST(3486.76 AS Decimal(10, 2)), 0, N'seto4siq01', N'復興北路 49號, 嘉義市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4053, N'Julius', N'Malinda_Bergnaum67@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0969471942', CAST(2544.30 AS Decimal(10, 2)), 1, N'j7iujs9nyk', N'仁愛路 556號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4054, N'Jesse', N'Blanca_Trantow14@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0910714390', CAST(4334.53 AS Decimal(10, 2)), 1, N'hir4uyokvs', N'仁愛路 609號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4055, N'Samson', N'Savanah98@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0965373186', CAST(650.08 AS Decimal(10, 2)), 1, N'am2jo1cdp5', N'中山路 330號, 宜蘭縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4056, N'Everardo', N'Kianna.Von55@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0980849197', CAST(3399.46 AS Decimal(10, 2)), 1, N'yfeijjj60i', N'四維路 424號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4057, N'Pietro', N'Marques_Bahringer@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0996514521', CAST(3738.90 AS Decimal(10, 2)), 0, N'em109wgtt1', N'信義路 665號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4058, N'Alexandrea', N'Henriette12@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0914941382', CAST(459.40 AS Decimal(10, 2)), 0, N'aef34zetjd', N'中山路 203號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4059, N'Nikita', N'Elian.Larkin@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0931048866', CAST(4140.33 AS Decimal(10, 2)), 0, N'17quqy8zwq', N'忠孝東路 404號, 苗栗縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4060, N'Nicola', N'Tabitha52@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0983805139', CAST(1420.69 AS Decimal(10, 2)), 1, N'bsznb0hs0x', N'忠孝東路 522號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4061, N'Martina', N'Verna47@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0904090736', CAST(1242.23 AS Decimal(10, 2)), 0, N'kapof9fuf0', N'和平東路 52號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4062, N'Kyra', N'Esperanza11@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0941431860', CAST(3112.75 AS Decimal(10, 2)), 0, N'ntjcdsty9p', N'三民路 845號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4063, N'Jadon', N'Zetta.Haag@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0902562483', CAST(2584.24 AS Decimal(10, 2)), 0, N'kd8vdlit71', N'三民路 717號, 宜蘭縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4064, N'Gracie', N'Keven92@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0952994429', CAST(641.64 AS Decimal(10, 2)), 0, N'yhfo55my3u', N'和平東路 482號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4065, N'Arnoldo', N'Garland50@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0918330343', CAST(1977.43 AS Decimal(10, 2)), 0, N'bjp931a78x', N'基隆路 351號, 花蓮縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4066, N'Antone', N'Alexane_Volkman10@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0914481005', CAST(4023.21 AS Decimal(10, 2)), 0, N'bk5jxs1z53', N'仁愛路 895號, 彰化縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4067, N'Micheal', N'Tabitha.Harber@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0965281124', CAST(4798.76 AS Decimal(10, 2)), 0, N'7mf8msriq8', N'羅斯福路 844號, 彰化縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4068, N'Adolphus', N'Donavon.Torphy21@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0945307234', CAST(4148.03 AS Decimal(10, 2)), 0, N'm17whgb3z5', N'八德路 925號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4069, N'Kelley', N'Walton_Grady22@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0937171018', CAST(2627.65 AS Decimal(10, 2)), 1, N'4wo9td4itk', N'四維路 75號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4070, N'Verlie', N'Miles78@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0945602201', CAST(1841.21 AS Decimal(10, 2)), 1, N'67gpo04ayk', N'仁愛路 343號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4071, N'Mae', N'Effie26@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0928059536', CAST(42.75 AS Decimal(10, 2)), 0, N'dz5eegmc9h', N'四維路 505號, 基隆市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4072, N'Colton', N'Braulio.Kreiger96@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0978913197', CAST(526.73 AS Decimal(10, 2)), 0, N'iag757n9do', N'民權西路 959號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4073, N'Pearlie', N'Jena_Tillman10@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0930851120', CAST(1569.98 AS Decimal(10, 2)), 0, N'l5r37wznxt', N'復興北路 888號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4074, N'Edwardo', N'Ariel_Deckow@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0919931256', CAST(122.79 AS Decimal(10, 2)), 1, N'c62yqs0pjl', N'羅斯福路 63號, 花蓮縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4075, N'Doris', N'Jalen_Roob@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0999205614', CAST(4649.61 AS Decimal(10, 2)), 0, N'ccmvhitbj1', N'忠孝東路 480號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4076, N'Delilah', N'Brendon_Auer69@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0998904994', CAST(410.72 AS Decimal(10, 2)), 0, N'lrk9jf0s5m', N'和平東路 64號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4077, N'Wyatt', N'Art.Wyman64@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0972434680', CAST(2737.42 AS Decimal(10, 2)), 0, N'ugehp9ztpz', N'基隆路 520號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4078, N'Ana', N'Celine.Wolff@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0920418508', CAST(289.43 AS Decimal(10, 2)), 0, N'7rmsklahst', N'基隆路 886號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4079, N'Mackenzie', N'Crystal_DAmore@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0962655702', CAST(3203.19 AS Decimal(10, 2)), 1, N'55rxs5w9ha', N'羅斯福路 481號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4080, N'Justice', N'Grayson_Jenkins63@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0963709102', CAST(4007.08 AS Decimal(10, 2)), 0, N'3umou4qvdb', N'羅斯福路 942號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4081, N'Horacio', N'Jed.Collins@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0925074708', CAST(4197.18 AS Decimal(10, 2)), 1, N'u0opsm5u5a', N'復興北路 920號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4082, N'Emma', N'Myah85@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0994043588', CAST(1012.22 AS Decimal(10, 2)), 1, N'3u0bgw9inl', N'信義路 285號, 嘉義市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4083, N'Scarlett', N'Emmett.Fahey73@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0960304923', CAST(1179.35 AS Decimal(10, 2)), 0, N'bn36twzvkh', N'四維路 671號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4084, N'Beth', N'Zora.Ernser32@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0944348620', CAST(4852.27 AS Decimal(10, 2)), 1, N'5et1mcpuf8', N'八德路 772號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4085, N'Baron', N'Nico.Gleason@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0943968177', CAST(4964.77 AS Decimal(10, 2)), 1, N'rtlgf9g21n', N'三民路 903號, 彰化縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4086, N'Aurore', N'Mitchel40@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0938625851', CAST(1138.23 AS Decimal(10, 2)), 1, N'myv6g06tor', N'民權西路 191號, 基隆市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4087, N'Novella', N'Korbin.Rowe8@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0943989139', CAST(3081.40 AS Decimal(10, 2)), 0, N'9ul0k1embj', N'信義路 583號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4088, N'Orin', N'Jordon96@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0969141693', CAST(2810.02 AS Decimal(10, 2)), 0, N'uw201cqqmj', N'信義路 194號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4089, N'Kamron', N'Skyla67@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0922950371', CAST(4358.92 AS Decimal(10, 2)), 0, N'332gphimqu', N'八德路 131號, 嘉義市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4090, N'Helene', N'Jeff_Williamson@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0988615694', CAST(4684.30 AS Decimal(10, 2)), 0, N'mlvng94hu4', N'信義路 84號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4091, N'Ressie', N'Carmel_Runolfsson@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0931260248', CAST(4540.14 AS Decimal(10, 2)), 1, N'i1o0779tzf', N'信義路 467號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4092, N'Milo', N'Ramon_Jacobson40@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0946335225', CAST(818.13 AS Decimal(10, 2)), 0, N'8lrlcedmew', N'基隆路 554號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4093, N'Dangelo', N'Felipe.Mayer87@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0935214366', CAST(4528.83 AS Decimal(10, 2)), 0, N'8tm4v04jf0', N'中山路 151號, 苗栗縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4094, N'Sophia', N'Clint.Cassin@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0953219055', CAST(4650.80 AS Decimal(10, 2)), 1, N'pxiwpqs31c', N'和平東路 191號, 宜蘭縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4095, N'Sally', N'Chelsea.Abernathy@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0922514854', CAST(1101.81 AS Decimal(10, 2)), 0, N'hmmdbanl64', N'信義路 26號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4096, N'Rhiannon', N'Ervin_Kunde@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0901278443', CAST(2124.78 AS Decimal(10, 2)), 0, N'7cv8uukhj4', N'三民路 407號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4097, N'Baylee', N'Cicero_Stracke14@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0916473385', CAST(4339.63 AS Decimal(10, 2)), 0, N'b6cw256zer', N'忠孝東路 871號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4098, N'Clarabelle', N'Zaria_Cummings57@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0932416345', CAST(2514.04 AS Decimal(10, 2)), 0, N'yoa78t6r1p', N'復興北路 536號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4099, N'German', N'Amaya33@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0998219898', CAST(1949.41 AS Decimal(10, 2)), 0, N'ogw226czf6', N'基隆路 161號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4100, N'Shaylee', N'Rodger87@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0904136031', CAST(1238.15 AS Decimal(10, 2)), 1, N'vdda09mbb1', N'復興北路 321號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4101, N'Candida', N'Rene.Gerlach@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0909976225', CAST(1886.41 AS Decimal(10, 2)), 0, N's6q3blsbus', N'中山路 566號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4102, N'Ressie', N'Nils12@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0989013945', CAST(3001.09 AS Decimal(10, 2)), 0, N'z2xb9iliul', N'忠孝東路 930號, 苗栗縣')
GO
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4103, N'Ebba', N'Isabelle85@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0942451706', CAST(3856.59 AS Decimal(10, 2)), 1, N'57q2s5meke', N'中山路 293號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4104, N'Julia', N'Sid.King87@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0937637641', CAST(2288.64 AS Decimal(10, 2)), 1, N'zrigt7hhrt', N'八德路 544號, 嘉義市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4105, N'Neil', N'Alexis.Walker@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0923858406', CAST(133.22 AS Decimal(10, 2)), 0, N'683z7jo21o', N'基隆路 324號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4106, N'Ana', N'Perry.Gottlieb73@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0978115896', CAST(1679.39 AS Decimal(10, 2)), 1, N'tg8mkfhjkc', N'羅斯福路 621號, 彰化縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4107, N'Gillian', N'Vesta.Smith@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0914284308', CAST(3128.55 AS Decimal(10, 2)), 0, N'rfpj5v7fec', N'八德路 383號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4108, N'Gina', N'Casey.Glover61@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0936104132', CAST(944.70 AS Decimal(10, 2)), 1, N'mxwkfx183r', N'和平東路 216號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4109, N'Grace', N'Micheal23@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0926064755', CAST(3747.17 AS Decimal(10, 2)), 0, N't67x5gste8', N'中山路 480號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4110, N'Sallie', N'Austyn.Wolff68@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0939019921', CAST(3144.42 AS Decimal(10, 2)), 1, N'jhex80q8ax', N'仁愛路 603號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4111, N'Sid', N'Kari35@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0982044117', CAST(849.27 AS Decimal(10, 2)), 0, N'josvozpxd3', N'民權西路 508號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4112, N'Nikolas', N'Nova33@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0972785349', CAST(2366.47 AS Decimal(10, 2)), 1, N'vx2qeft37t', N'羅斯福路 214號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4113, N'Dina', N'Emma25@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0919477389', CAST(1758.57 AS Decimal(10, 2)), 1, N'kqgb7bg9cr', N'基隆路 895號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4114, N'Joshuah', N'Katlyn.Leuschke@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0901778943', CAST(4739.04 AS Decimal(10, 2)), 1, N'iurt84rd29', N'羅斯福路 961號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4115, N'Jesse', N'Dylan.Welch23@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0937134064', CAST(1289.28 AS Decimal(10, 2)), 0, N'3b983459hs', N'中山路 455號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4116, N'Marlen', N'Cleve.Treutel35@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0975781937', CAST(2645.12 AS Decimal(10, 2)), 1, N'llh4vrftlx', N'四維路 882號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4117, N'Madelynn', N'Shaun47@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0925038284', CAST(3198.78 AS Decimal(10, 2)), 1, N'ydem74qkdf', N'和平東路 875號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4118, N'Haylie', N'Rolando97@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0912300150', CAST(1125.41 AS Decimal(10, 2)), 0, N'xx6hy8h1gs', N'仁愛路 264號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4119, N'Amparo', N'Federico.Roberts@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0947539703', CAST(3069.54 AS Decimal(10, 2)), 1, N'jncshjo9g2', N'信義路 780號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4120, N'Cecelia', N'Rodger97@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0939011248', CAST(2485.56 AS Decimal(10, 2)), 1, N'63fc8ixwkh', N'四維路 471號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4121, N'Aaliyah', N'Marcelina.Bednar@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0918497661', CAST(3261.01 AS Decimal(10, 2)), 1, N'5ur6w8cbxn', N'羅斯福路 639號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4122, N'Jerel', N'Sierra46@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0910630374', CAST(2970.60 AS Decimal(10, 2)), 0, N'vr99ctpz3g', N'民權西路 726號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4123, N'Karianne', N'Kaden_Braun85@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0967111141', CAST(2597.41 AS Decimal(10, 2)), 0, N'uqar5df567', N'八德路 908號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4124, N'Brycen', N'Lexus54@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0975772001', CAST(1173.71 AS Decimal(10, 2)), 0, N'9vlwhz5r35', N'復興北路 751號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4125, N'Magnolia', N'Melba72@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0903527395', CAST(2559.14 AS Decimal(10, 2)), 1, N'baxkxwb3of', N'和平東路 338號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4126, N'Golden', N'Ally70@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0930475933', CAST(783.27 AS Decimal(10, 2)), 1, N'zm9zudt6q6', N'信義路 583號, 基隆市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4127, N'Edwin', N'Nella65@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0959897281', CAST(252.24 AS Decimal(10, 2)), 1, N'lzyifu21j8', N'中山路 564號, 基隆市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4128, N'Julius', N'Osbaldo74@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0961645083', CAST(1155.13 AS Decimal(10, 2)), 0, N'gn5pkemuu6', N'復興北路 284號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4129, N'Helene', N'Adell79@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0967424425', CAST(4735.38 AS Decimal(10, 2)), 1, N'0rtzrkfnyr', N'仁愛路 819號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4130, N'Kiara', N'Emilia95@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0955529628', CAST(1507.54 AS Decimal(10, 2)), 1, N'34wh5whmnx', N'四維路 928號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4131, N'Alfonso', N'Otto.Langworth9@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0905384250', CAST(384.43 AS Decimal(10, 2)), 1, N'jcvn0wse7u', N'羅斯福路 606號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4132, N'Wava', N'Dannie.Kovacek@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0937210556', CAST(3457.06 AS Decimal(10, 2)), 0, N'xmkl1lgdsv', N'復興北路 442號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4133, N'Deondre', N'Hillard.Ledner@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0980899817', CAST(2903.89 AS Decimal(10, 2)), 1, N'e5qlw90fxz', N'八德路 89號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4134, N'Emanuel', N'Tobin.Roberts64@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0913488766', CAST(931.59 AS Decimal(10, 2)), 1, N'psdgkpdcte', N'仁愛路 476號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4135, N'Jaeden', N'Isaiah.Lebsack@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0917932827', CAST(312.01 AS Decimal(10, 2)), 1, N'csqj2a9uv7', N'信義路 606號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4136, N'Dave', N'Lonnie.Bayer39@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0925020801', CAST(3683.38 AS Decimal(10, 2)), 1, N'mac2aqrdf6', N'復興北路 568號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4137, N'Myron', N'Jaylan_Prohaska@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0926621162', CAST(346.09 AS Decimal(10, 2)), 1, N'8n5rrbv6nw', N'民權西路 607號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4138, N'Crawford', N'Madison_Ryan@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0916591961', CAST(4697.69 AS Decimal(10, 2)), 1, N'1ib0x0f2z9', N'四維路 524號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4139, N'Newton', N'Margarett_Will@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0943552611', CAST(2980.97 AS Decimal(10, 2)), 0, N'pr8kuraoak', N'中山路 716號, 基隆市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4140, N'Jackeline', N'Lucas.Trantow49@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0914467977', CAST(1520.58 AS Decimal(10, 2)), 0, N'8g7jta6wqd', N'民權西路 174號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4141, N'D''angelo', N'Wellington_Bogisich@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0937175378', CAST(638.49 AS Decimal(10, 2)), 0, N'ixzo095w3c', N'復興北路 871號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4142, N'Bertram', N'Yvette97@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0981155434', CAST(72.14 AS Decimal(10, 2)), 0, N'iarxvb7e7g', N'八德路 185號, 苗栗縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4143, N'Dolly', N'Jerod.Ziemann54@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0958393841', CAST(2595.12 AS Decimal(10, 2)), 0, N'pwktf3t8es', N'基隆路 39號, 苗栗縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4144, N'Tiara', N'Leopold.Stehr@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0934450439', CAST(2460.03 AS Decimal(10, 2)), 0, N's9ok3ayfle', N'中山路 740號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4145, N'Nestor', N'Jared.Hickle@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0998105349', CAST(4087.72 AS Decimal(10, 2)), 1, N'ptrw0pcyte', N'四維路 416號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4146, N'Lindsey', N'Lorine_Schinner53@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0997759160', CAST(4007.56 AS Decimal(10, 2)), 0, N'zmkoczpq94', N'信義路 635號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4147, N'Bettye', N'Shayne_Langworth51@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0932970030', CAST(2901.46 AS Decimal(10, 2)), 0, N'x0insexzn3', N'基隆路 346號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4148, N'Lucienne', N'Torrey.Morar60@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0912163592', CAST(4797.05 AS Decimal(10, 2)), 1, N'ooghmagrhk', N'復興北路 230號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4149, N'Monserrat', N'Santina.Hayes@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0930967730', CAST(2272.88 AS Decimal(10, 2)), 0, N'0oorany5om', N'仁愛路 226號, 彰化縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4150, N'Alene', N'Trent_Swaniawski@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0924159677', CAST(3629.34 AS Decimal(10, 2)), 0, N'ygaok0jnfc', N'基隆路 178號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4151, N'Jessyca', N'Carter.Koch81@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0993955518', CAST(3234.47 AS Decimal(10, 2)), 0, N'6fsopxvg8e', N'中山路 16號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4152, N'Kayla', N'Mercedes78@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0973900031', CAST(283.63 AS Decimal(10, 2)), 1, N'eusfqqytj8', N'三民路 496號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4153, N'Hazel', N'Sophie.Champlin@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0988041857', CAST(3225.67 AS Decimal(10, 2)), 0, N'lrer0c8utb', N'復興北路 839號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4154, N'Kane', N'Earnest.Cummings@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0998626583', CAST(1371.65 AS Decimal(10, 2)), 0, N'776wnt3fea', N'四維路 291號, 彰化縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4155, N'Camilla', N'Alphonso_Buckridge@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0960357711', CAST(761.09 AS Decimal(10, 2)), 1, N'jwkx4jnuws', N'中山路 748號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4156, N'Berneice', N'Loren.Graham@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0943542186', CAST(862.54 AS Decimal(10, 2)), 0, N'py9yqrqo1j', N'信義路 280號, 彰化縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4157, N'Alec', N'Tevin2@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0946950241', CAST(3433.93 AS Decimal(10, 2)), 0, N'ozny37h4cp', N'羅斯福路 598號, 嘉義市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4158, N'Lisa', N'Cali_Rogahn@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0925605096', CAST(4599.22 AS Decimal(10, 2)), 0, N'ck03vdmmxh', N'和平東路 836號, 花蓮縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4159, N'Elva', N'Reyes.Crona@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0949437035', CAST(2324.86 AS Decimal(10, 2)), 0, N'8s7tcclcrs', N'三民路 133號, 苗栗縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4160, N'Darlene', N'German88@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0996200416', CAST(1963.23 AS Decimal(10, 2)), 0, N'015x8nm2yu', N'中山路 803號, 彰化縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4161, N'Layne', N'Enrique50@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0930670651', CAST(3639.10 AS Decimal(10, 2)), 0, N'7yyzsizlz8', N'八德路 630號, 基隆市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4162, N'Alfred', N'Brent_Batz76@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0981049338', CAST(3142.64 AS Decimal(10, 2)), 1, N'gc1m9umtuc', N'八德路 225號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4163, N'Khalid', N'Madelyn92@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0984983885', CAST(3961.55 AS Decimal(10, 2)), 1, N'mqd3aace6a', N'和平東路 856號, 宜蘭縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4164, N'Henri', N'Margarette_Stehr@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0960902931', CAST(1530.48 AS Decimal(10, 2)), 1, N'y20op1u5ag', N'民權西路 257號, 桃園市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4165, N'Lourdes', N'Zena_OConner@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0993845573', CAST(4222.55 AS Decimal(10, 2)), 1, N'w63rcdt5p9', N'八德路 691號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4166, N'Connie', N'Harold90@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0938564515', CAST(878.41 AS Decimal(10, 2)), 1, N'8jbyk45das', N'仁愛路 491號, 宜蘭縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4167, N'Ernestine', N'Eliane.Deckow8@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0944590543', CAST(3978.76 AS Decimal(10, 2)), 1, N'9zk09d8mw9', N'三民路 14號, 桃園市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4168, N'Beau', N'Ada.Gerhold36@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0910471795', CAST(2709.10 AS Decimal(10, 2)), 0, N'1hlwi9bkxx', N'忠孝東路 538號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4169, N'Cheyenne', N'Eddie4@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0962471812', CAST(604.02 AS Decimal(10, 2)), 0, N'94cjhii7bq', N'基隆路 250號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4170, N'Hipolito', N'Leann27@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0928420808', CAST(3911.73 AS Decimal(10, 2)), 0, N'52gaox6apy', N'八德路 273號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4171, N'Else', N'Garry.Abshire52@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0989234614', CAST(3339.37 AS Decimal(10, 2)), 1, N'neplvswqhe', N'基隆路 560號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4172, N'Bailee', N'Alison_Crooks81@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0952920192', CAST(1434.32 AS Decimal(10, 2)), 1, N't0i4u3pik3', N'中山路 803號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4173, N'Major', N'Mallie.Cronin@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0937830173', CAST(3995.12 AS Decimal(10, 2)), 0, N'zh7d5jtz5y', N'和平東路 291號, 桃園市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4174, N'Minerva', N'Orrin94@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0905987011', CAST(241.34 AS Decimal(10, 2)), 0, N'cdpy4rlqis', N'羅斯福路 175號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4175, N'Heidi', N'Allison55@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0994335354', CAST(3309.12 AS Decimal(10, 2)), 1, N'coxfl2k6l1', N'中山路 423號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4176, N'Carmen', N'Rubye_Hessel@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0940577993', CAST(1882.08 AS Decimal(10, 2)), 0, N'772ff68rty', N'和平東路 443號, 苗栗縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4177, N'Joanny', N'Kip82@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0900696311', CAST(3699.75 AS Decimal(10, 2)), 0, N'38svuzcdqd', N'四維路 586號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4178, N'Providenci', N'Afton65@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0937566150', CAST(4103.69 AS Decimal(10, 2)), 1, N'2215v8nnn4', N'中山路 259號, 嘉義市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4179, N'Ivory', N'Izabella_Johnston60@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0905633711', CAST(3599.07 AS Decimal(10, 2)), 1, N'9jmakjixyd', N'羅斯福路 411號, 苗栗縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4180, N'Stephany', N'Deshaun.Becker@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0972220547', CAST(2732.85 AS Decimal(10, 2)), 0, N'hgxpypv5jw', N'羅斯福路 908號, 宜蘭縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4181, N'Daren', N'Liliane.Yundt7@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0969069332', CAST(80.69 AS Decimal(10, 2)), 1, N'pdgvegtybd', N'羅斯福路 980號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4182, N'Payton', N'Hudson.Yundt@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0974488490', CAST(4785.71 AS Decimal(10, 2)), 1, N'jwjr7jecj5', N'仁愛路 763號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4183, N'Marty', N'Louisa87@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0939844296', CAST(4996.69 AS Decimal(10, 2)), 0, N'jtzxu0fkla', N'忠孝東路 636號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4184, N'Douglas', N'Tyrese.Kshlerin24@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0971305003', CAST(4776.94 AS Decimal(10, 2)), 0, N'scmlcr1ur7', N'忠孝東路 629號, 彰化縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4185, N'Jordi', N'Chadd47@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0915708658', CAST(1435.29 AS Decimal(10, 2)), 0, N'd7mo9a7o26', N'和平東路 939號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4186, N'Alvah', N'Ardella.MacGyver38@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0908142557', CAST(3254.28 AS Decimal(10, 2)), 1, N'5kutvzw9fz', N'羅斯福路 3號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4187, N'Ernie', N'Dillan76@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0975943341', CAST(191.37 AS Decimal(10, 2)), 0, N'owez9dg7w3', N'四維路 633號, 花蓮縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4188, N'Hailey', N'Adela.Mante96@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0920546644', CAST(2622.73 AS Decimal(10, 2)), 0, N'q7qazla2st', N'三民路 431號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4189, N'Jamal', N'Lamar.Kunde77@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0980848856', CAST(3635.87 AS Decimal(10, 2)), 1, N'qdjxf73nf9', N'八德路 507號, 桃園市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4190, N'Genesis', N'Esperanza.Bergnaum@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0961798198', CAST(466.46 AS Decimal(10, 2)), 0, N'rf2tr24jnd', N'信義路 95號, 花蓮縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4191, N'Jonathon', N'Flo_Weber@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0981553665', CAST(306.12 AS Decimal(10, 2)), 1, N'a9kphcfbmp', N'中山路 528號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4192, N'Malinda', N'Larissa18@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0915158685', CAST(2508.37 AS Decimal(10, 2)), 1, N'fkhd34i71f', N'基隆路 613號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4193, N'Zack', N'Effie_Jacobson72@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0933507108', CAST(4233.06 AS Decimal(10, 2)), 0, N'xtg9m1dkn2', N'基隆路 207號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4194, N'Kristian', N'Marshall59@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0997770192', CAST(1646.69 AS Decimal(10, 2)), 0, N'he6x0sdqq8', N'忠孝東路 355號, 桃園市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4195, N'Madonna', N'Chelsey.Murphy8@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0982652062', CAST(2292.56 AS Decimal(10, 2)), 1, N'28okl0uksb', N'信義路 440號, 基隆市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4196, N'Clemmie', N'Krista_Cartwright@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0997296153', CAST(4031.31 AS Decimal(10, 2)), 0, N'oi93y4f3s5', N'八德路 399號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4197, N'Odie', N'Helmer_Stoltenberg@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0993391297', CAST(4714.54 AS Decimal(10, 2)), 1, N'ghr1mw598g', N'仁愛路 37號, 彰化縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4198, N'Mikel', N'Kaycee.Bosco@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0931418313', CAST(4667.36 AS Decimal(10, 2)), 0, N'4p5dpbmn5o', N'民權西路 610號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4199, N'Jerrold', N'Sheridan.Renner@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0915371205', CAST(1149.41 AS Decimal(10, 2)), 1, N'qtbjbfw70g', N'基隆路 446號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4200, N'Marcelino', N'Maurice_Wintheiser93@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0952356342', CAST(2021.42 AS Decimal(10, 2)), 1, N'1fwxgan62z', N'三民路 612號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4201, N'Maximillian', N'Clark.Quigley33@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0982526007', CAST(473.39 AS Decimal(10, 2)), 1, N'zm7v1fqheb', N'復興北路 646號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4202, N'Brigitte', N'Jeremie.Moore62@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0980011378', CAST(1421.90 AS Decimal(10, 2)), 0, N'gyijzitprz', N'民權西路 29號, 台北市')
GO
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4203, N'Hilbert', N'Federico10@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0922481517', CAST(4524.26 AS Decimal(10, 2)), 1, N'zn4oaoflxz', N'八德路 47號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4204, N'Lue', N'Olga_Beahan@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0984783146', CAST(1859.73 AS Decimal(10, 2)), 1, N'd4tozmwc5j', N'羅斯福路 851號, 基隆市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4205, N'Bettie', N'Dangelo_Mueller40@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0947125923', CAST(525.37 AS Decimal(10, 2)), 1, N't7gmn8znpv', N'復興北路 495號, 基隆市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4206, N'Sammy', N'Ansel12@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0961998364', CAST(2119.49 AS Decimal(10, 2)), 0, N'o01c3mwhyz', N'四維路 168號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4207, N'Kaley', N'Zola17@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0929255724', CAST(3806.52 AS Decimal(10, 2)), 1, N'ki8z6pg0re', N'仁愛路 141號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4208, N'Brigitte', N'Jessica.Goldner@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0994294774', CAST(4167.98 AS Decimal(10, 2)), 1, N'deqnf4xuc2', N'三民路 357號, 嘉義市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4209, N'Odessa', N'Bud64@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0948383123', CAST(2651.41 AS Decimal(10, 2)), 1, N'xy6d0reops', N'三民路 415號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4210, N'Benny', N'Lilyan_Von@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0917889508', CAST(1651.54 AS Decimal(10, 2)), 1, N'wmbw5l53qk', N'復興北路 940號, 基隆市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4211, N'Rosario', N'Alberta56@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0927623213', CAST(2178.66 AS Decimal(10, 2)), 1, N'olcfwx36yq', N'和平東路 807號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4212, N'Aliyah', N'Cecile34@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0988260190', CAST(2747.42 AS Decimal(10, 2)), 0, N'hsoaw5lxxi', N'基隆路 559號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4213, N'River', N'Hermann_Ward@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0981056737', CAST(1937.71 AS Decimal(10, 2)), 0, N'0zm09o4h5f', N'三民路 415號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4214, N'Reese', N'Dina.Muller@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0922430371', CAST(3279.75 AS Decimal(10, 2)), 1, N'tvj7ixx8kk', N'民權西路 444號, 苗栗縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4215, N'Dannie', N'Isadore52@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0918374752', CAST(4645.25 AS Decimal(10, 2)), 0, N'xyt1lpvua1', N'信義路 380號, 宜蘭縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4216, N'Muriel', N'Nigel_Schoen56@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0933299253', CAST(631.33 AS Decimal(10, 2)), 1, N'57vueawgi1', N'和平東路 295號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4217, N'Iva', N'Wilhelm.Bergstrom@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0965794813', CAST(2401.15 AS Decimal(10, 2)), 1, N'wl3dibxv8g', N'羅斯福路 347號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4218, N'Jovani', N'Austin_Bradtke93@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0999145494', CAST(2897.17 AS Decimal(10, 2)), 1, N'kzh5u6xyu1', N'中山路 331號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4219, N'Ava', N'Jewell31@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0945588699', CAST(4608.69 AS Decimal(10, 2)), 0, N'0fobcdkd1w', N'中山路 814號, 花蓮縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4220, N'Shanie', N'Marc14@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0938187046', CAST(1208.02 AS Decimal(10, 2)), 1, N'7y001qnmrv', N'基隆路 812號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4221, N'Hank', N'Lacey_Muller23@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0998851385', CAST(1528.01 AS Decimal(10, 2)), 0, N'w4up8swu90', N'信義路 260號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4222, N'Brooke', N'Reyna.Quigley@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0978052115', CAST(4342.71 AS Decimal(10, 2)), 1, N'v1gx1o6pas', N'復興北路 824號, 彰化縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4223, N'Danial', N'Micah.Marks34@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0944810124', CAST(590.34 AS Decimal(10, 2)), 0, N'ezt5bsb3tn', N'忠孝東路 54號, 基隆市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4224, N'Mark', N'Corrine50@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0944584657', CAST(4681.12 AS Decimal(10, 2)), 0, N'w766bur20w', N'民權西路 595號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4225, N'Max', N'Gudrun25@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0930951940', CAST(3705.29 AS Decimal(10, 2)), 0, N'8k6artv5c3', N'和平東路 703號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4226, N'Lavina', N'Sienna.Greenholt0@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0934018260', CAST(2122.48 AS Decimal(10, 2)), 1, N'qcanofwysi', N'基隆路 861號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4227, N'Isabelle', N'Reuben23@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0968719010', CAST(4586.01 AS Decimal(10, 2)), 0, N'a2xoodxxmg', N'信義路 885號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4228, N'Javonte', N'Jayden_Hand@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0983887951', CAST(3759.19 AS Decimal(10, 2)), 0, N'au178uxhra', N'羅斯福路 448號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4229, N'Nyah', N'Muhammad61@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0975597921', CAST(4522.47 AS Decimal(10, 2)), 0, N'rt605ju68q', N'三民路 840號, 宜蘭縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4230, N'Dovie', N'Gerardo57@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0953438731', CAST(2285.44 AS Decimal(10, 2)), 1, N'mtkzi19nlo', N'羅斯福路 217號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4231, N'Sibyl', N'Teagan78@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0921582438', CAST(828.05 AS Decimal(10, 2)), 1, N'8qqy3q9ur2', N'仁愛路 31號, 嘉義市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4232, N'Sherman', N'Elmira.Halvorson@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0910300427', CAST(3776.86 AS Decimal(10, 2)), 1, N'peh8g5h2s5', N'四維路 820號, 嘉義市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4233, N'Miles', N'Delaney_Pfeffer@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0917422136', CAST(4676.05 AS Decimal(10, 2)), 0, N'gj3ocqj8f0', N'八德路 243號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4234, N'Elva', N'Eladio_Marvin@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0976089992', CAST(4835.81 AS Decimal(10, 2)), 1, N'qt44o4ptdi', N'復興北路 450號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4235, N'Magali', N'Samir95@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0957818852', CAST(3436.99 AS Decimal(10, 2)), 1, N'qb95az3om5', N'三民路 757號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4236, N'Emory', N'Emmy_Jacobs@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0908296909', CAST(1310.17 AS Decimal(10, 2)), 0, N'mg4zsd62d3', N'八德路 238號, 嘉義市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4237, N'Phyllis', N'Ron.Lehner@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0941553802', CAST(2322.70 AS Decimal(10, 2)), 1, N'z4fsj4m9jo', N'仁愛路 329號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4238, N'Leland', N'Rebekah_Johnston@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0945873485', CAST(3324.59 AS Decimal(10, 2)), 0, N'cwl14mto9a', N'中山路 266號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4239, N'Grayson', N'Bertram.Cassin50@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0956684274', CAST(288.84 AS Decimal(10, 2)), 1, N'2llc8pygq0', N'八德路 237號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4240, N'Llewellyn', N'Lacey28@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0993158291', CAST(3478.19 AS Decimal(10, 2)), 1, N'39715nc25e', N'中山路 485號, 嘉義市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4241, N'Jewel', N'Elinore_Hills85@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0941637415', CAST(154.19 AS Decimal(10, 2)), 0, N'srcwh19hh8', N'信義路 136號, 花蓮縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4242, N'Christian', N'Rubye_Olson84@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0948561474', CAST(1136.71 AS Decimal(10, 2)), 1, N'j4nep4l793', N'三民路 229號, 彰化縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4243, N'Francis', N'Danika_Langworth77@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0991739723', CAST(2716.17 AS Decimal(10, 2)), 0, N'290v08sqp1', N'四維路 264號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4244, N'Jaycee', N'Davin_Feeney@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0985495990', CAST(3896.98 AS Decimal(10, 2)), 1, N'evpjgylh9z', N'復興北路 124號, 桃園市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4245, N'Missouri', N'Monserrate15@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0957456580', CAST(1545.19 AS Decimal(10, 2)), 1, N'brycnrj708', N'四維路 735號, 桃園市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4246, N'Tito', N'Nels.Jakubowski82@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0968086418', CAST(4738.36 AS Decimal(10, 2)), 1, N'j67oy5s2w6', N'中山路 235號, 花蓮縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4247, N'Amiya', N'Luz91@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0907456885', CAST(198.09 AS Decimal(10, 2)), 1, N'eb233jx9bl', N'四維路 658號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4248, N'Luz', N'Helena4@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0998980876', CAST(89.57 AS Decimal(10, 2)), 1, N'aa1lsx5sy8', N'復興北路 229號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4249, N'Esther', N'Hunter.Hauck23@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0984035320', CAST(1383.12 AS Decimal(10, 2)), 0, N'888abmsuc9', N'中山路 66號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4250, N'Dawson', N'Shayna_Murray@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0984714892', CAST(1328.71 AS Decimal(10, 2)), 0, N'xqoehzr16t', N'三民路 976號, 花蓮縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4251, N'Waylon', N'Olin_Padberg63@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0984898408', CAST(2550.71 AS Decimal(10, 2)), 0, N'ilrcgddrr4', N'四維路 181號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4252, N'Tracey', N'Jayce_Schneider@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0917680284', CAST(3185.55 AS Decimal(10, 2)), 0, N'p7n40d5mae', N'民權西路 75號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4253, N'Johan', N'Maya.Pagac36@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0961357993', CAST(963.33 AS Decimal(10, 2)), 1, N'y47fdinwib', N'中山路 162號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4254, N'Roxanne', N'Tomasa.Carroll57@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0932800252', CAST(2085.52 AS Decimal(10, 2)), 1, N'b3wcyl2r60', N'基隆路 556號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4255, N'Jaquelin', N'Ryan_Leannon@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0919645833', CAST(1493.10 AS Decimal(10, 2)), 1, N'2n32u2di3c', N'忠孝東路 972號, 桃園市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4256, N'Kayla', N'Ransom_Feil@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0970450344', CAST(3791.31 AS Decimal(10, 2)), 1, N'9qgyybgymd', N'和平東路 7號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4257, N'Jewel', N'Colleen42@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0969704925', CAST(4985.13 AS Decimal(10, 2)), 1, N'lxrz2ai7lq', N'信義路 274號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4258, N'Deven', N'Norberto_Parisian87@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0940943034', CAST(4913.38 AS Decimal(10, 2)), 1, N'xy4sj9efio', N'四維路 464號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4259, N'Harmony', N'Barton_Kihn@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0937191974', CAST(3589.65 AS Decimal(10, 2)), 1, N'4pmofbnh6i', N'民權西路 482號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4260, N'Christelle', N'Veda.Hayes@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0950767181', CAST(2998.35 AS Decimal(10, 2)), 0, N'hwp8kvuzz1', N'和平東路 963號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4261, N'Chyna', N'Santiago_Langosh22@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0913461999', CAST(1304.83 AS Decimal(10, 2)), 1, N'hvk0cs0m23', N'信義路 589號, 桃園市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4262, N'Retha', N'Roxanne_Mills@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0992302525', CAST(2251.96 AS Decimal(10, 2)), 0, N'x0qky2l5o3', N'和平東路 316號, 花蓮縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4263, N'Brando', N'Lavonne.Fadel@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0932165255', CAST(3627.54 AS Decimal(10, 2)), 0, N'jg646cujvj', N'中山路 441號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4264, N'Nathanael', N'Larue80@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0936516681', CAST(74.16 AS Decimal(10, 2)), 0, N'k2fwj15ryv', N'復興北路 668號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4265, N'Jessy', N'Sigmund.Gulgowski@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0992704999', CAST(2602.23 AS Decimal(10, 2)), 0, N'iqj5z60264', N'和平東路 520號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4266, N'Tiara', N'Marielle18@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0934607334', CAST(2303.47 AS Decimal(10, 2)), 0, N'359fdz4lit', N'羅斯福路 221號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4267, N'Enrique', N'Isom.Wisoky75@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0997710044', CAST(3310.97 AS Decimal(10, 2)), 0, N'lmk0a9vjyj', N'中山路 492號, 基隆市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4268, N'Rocio', N'Dante.Heller@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0953751342', CAST(1624.36 AS Decimal(10, 2)), 0, N'n6v0alna86', N'仁愛路 252號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4269, N'Constance', N'Hilma.Kirlin82@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0991322908', CAST(4606.45 AS Decimal(10, 2)), 0, N'l71w2mcjjk', N'忠孝東路 319號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4270, N'Delfina', N'Dedrick_Kuphal91@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0924260570', CAST(3453.78 AS Decimal(10, 2)), 0, N'gadh12ass3', N'和平東路 504號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4271, N'Marcella', N'Antone.Bernier41@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0900337820', CAST(405.95 AS Decimal(10, 2)), 0, N'iuxl0pr967', N'羅斯福路 946號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4272, N'Ardith', N'Dayna93@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0970233201', CAST(1541.35 AS Decimal(10, 2)), 1, N'2qpixnb2ld', N'民權西路 696號, 宜蘭縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4273, N'Cory', N'Calista66@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0921168455', CAST(1130.38 AS Decimal(10, 2)), 0, N'mnyw468b52', N'羅斯福路 468號, 嘉義市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4274, N'Kirk', N'Antonietta92@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0908489961', CAST(3303.95 AS Decimal(10, 2)), 1, N'3quwqnqx38', N'基隆路 890號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4275, N'Leila', N'Piper.Padberg@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0924606721', CAST(4602.93 AS Decimal(10, 2)), 1, N'j3npy6mkui', N'信義路 285號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4276, N'Marlene', N'Cornelius.Ruecker19@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0906825082', CAST(4623.05 AS Decimal(10, 2)), 1, N'l0wot8dne6', N'仁愛路 687號, 花蓮縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4277, N'Herta', N'Judd.Yost3@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0987944753', CAST(522.01 AS Decimal(10, 2)), 0, N'ax2qa2zhye', N'中山路 852號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4278, N'Carolina', N'Myles7@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0918807292', CAST(1898.44 AS Decimal(10, 2)), 1, N'vaaetrvoog', N'基隆路 246號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4279, N'Lura', N'Alexane.Reichert69@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0922064000', CAST(55.63 AS Decimal(10, 2)), 1, N'r3hiwjlcmv', N'八德路 541號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4280, N'Aurelia', N'Hilma_Flatley55@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0916260273', CAST(3593.56 AS Decimal(10, 2)), 0, N'noe75y4ah4', N'信義路 437號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4281, N'Jett', N'Manley_Ward79@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0934864299', CAST(1403.56 AS Decimal(10, 2)), 0, N'yx05v8vqg4', N'四維路 199號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4282, N'Romaine', N'Roslyn.Prosacco34@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0949722557', CAST(3432.17 AS Decimal(10, 2)), 1, N'd7agitcvf1', N'忠孝東路 524號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4283, N'Katelyn', N'Alisa_Wunsch57@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0959859286', CAST(3306.57 AS Decimal(10, 2)), 1, N'zsw704e60c', N'忠孝東路 898號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4284, N'Travis', N'Darron17@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0961118248', CAST(2602.97 AS Decimal(10, 2)), 0, N'h7rq2qsc5w', N'四維路 728號, 苗栗縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4285, N'Dannie', N'Margaret_Nicolas76@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0974068673', CAST(3697.85 AS Decimal(10, 2)), 0, N'hohus4kv4g', N'羅斯福路 958號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4286, N'Zackary', N'Lonie13@hotmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0952747771', CAST(1228.27 AS Decimal(10, 2)), 1, N'1xf8312d9j', N'忠孝東路 40號, 苗栗縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4287, N'Elvie', N'Pablo70@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0976211290', CAST(508.41 AS Decimal(10, 2)), 1, N'fgm2ewj1wv', N'三民路 510號, 宜蘭縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4288, N'Lacy', N'Jessie.Paucek@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0956302463', CAST(475.12 AS Decimal(10, 2)), 0, N'50984mehwd', N'中山路 170號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4289, N'Rickey', N'Dorothea_Satterfield64@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0948148057', CAST(4909.03 AS Decimal(10, 2)), 1, N'8x2qj8lgx3', N'中山路 540號, 屏東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4290, N'Michel', N'Hilario.MacGyver@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0907426117', CAST(1647.62 AS Decimal(10, 2)), 0, N'upx5084321', N'中山路 214號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4291, N'Kaylah', N'Timmothy.Berge@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0951731448', CAST(308.38 AS Decimal(10, 2)), 1, N'3t4d8immo5', N'民權西路 467號, 基隆市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4292, N'Westley', N'Priscilla_Bruen74@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0976907959', CAST(2703.35 AS Decimal(10, 2)), 0, N'b1oxc39bvb', N'和平東路 727號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4293, N'April', N'Mylene.Sawayn36@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0993331135', CAST(2813.57 AS Decimal(10, 2)), 1, N'n5ezfp14pu', N'三民路 1000號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4294, N'Marcelina', N'Mozell98@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0975113735', CAST(994.21 AS Decimal(10, 2)), 0, N'ysbarkj3l0', N'復興北路 762號, 雲林縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4295, N'Josiah', N'Tyrese.Thompson@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0922543092', CAST(3091.98 AS Decimal(10, 2)), 0, N'chwswso5we', N'中山路 795號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4296, N'Wade', N'Vallie.Volkman@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0987176629', CAST(4851.98 AS Decimal(10, 2)), 0, N'lbgvo9uvm7', N'民權西路 732號, 嘉義縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4297, N'Weston', N'Jerod_Thompson@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0913018631', CAST(880.87 AS Decimal(10, 2)), 1, N'is67tvbja5', N'仁愛路 43號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4298, N'Tyshawn', N'Berenice54@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0977965222', CAST(42.72 AS Decimal(10, 2)), 1, N'yppdpgji5c', N'中山路 348號, 台南市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4299, N'Rosa', N'Billie2@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0961504785', CAST(3414.17 AS Decimal(10, 2)), 0, N'm1i86eco8p', N'三民路 489號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4300, N'Clarabelle', N'Helga34@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0991224816', CAST(4406.43 AS Decimal(10, 2)), 0, N'lzulq4t0nv', N'八德路 621號, 花蓮縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4301, N'Ericka', N'Blanca.Bogisich@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0937225482', CAST(3967.72 AS Decimal(10, 2)), 1, N'9psa3knggu', N'四維路 456號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4302, N'Jaycee', N'Felicity.Feil32@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0975868750', CAST(1210.19 AS Decimal(10, 2)), 1, N'j7al2tl8ng', N'四維路 942號, 台南市')
GO
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4303, N'Jamaal', N'Garett.Rodriguez@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0982465196', CAST(1449.81 AS Decimal(10, 2)), 0, N'3g7j284vki', N'四維路 692號, 基隆市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4304, N'Salma', N'Patsy_Hand@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0909794276', CAST(340.62 AS Decimal(10, 2)), 0, N'uyxtd7qpem', N'民權西路 866號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4305, N'Mike', N'Clement_Thiel@yahoo.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0986888162', CAST(537.50 AS Decimal(10, 2)), 0, N'hftmnorkhw', N'忠孝東路 614號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4306, N'Cathy', N'Burnice35@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0941131200', CAST(76.66 AS Decimal(10, 2)), 1, N'iilm4t1f1y', N'和平東路 318號, 桃園市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4307, N'Lee', N'Colin_OReilly66@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0968833245', CAST(2089.36 AS Decimal(10, 2)), 0, N'oj9ek0b1d3', N'和平東路 989號, 新竹市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4308, N'Payton', N'Allene_Marquardt@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', N'0934398672', CAST(4043.70 AS Decimal(10, 2)), 0, N'kwmdrru746', N'信義路 663號, 高雄市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4309, N'Keyshawn', N'Mac28@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0968681213', CAST(2608.44 AS Decimal(10, 2)), 0, N'a28tikc00b', N'中山路 363號, 苗栗縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4310, N'Montana', N'Mustafa.Brown22@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0969587272', CAST(2560.40 AS Decimal(10, 2)), 0, N'ho7wafh19a', N'和平東路 61號, 台東縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4311, N'Arlo', N'Erik.Swift@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0942376079', CAST(3981.70 AS Decimal(10, 2)), 1, N'jtiqpobtya', N'四維路 735號, 宜蘭縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4312, N'Theodora', N'Kristina_Yundt@hotmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0941731234', CAST(1278.22 AS Decimal(10, 2)), 1, N'qi9zqnj8dn', N'忠孝東路 45號, 南投縣')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4313, N'Burley', N'Margret.Hirthe@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0912438301', CAST(2801.25 AS Decimal(10, 2)), 1, N'avkrk3hu61', N'忠孝東路 745號, 新北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4314, N'Shaniya', N'Gaston_Littel@yahoo.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0980310408', CAST(751.04 AS Decimal(10, 2)), 1, N'leoxd4gvle', N'中山路 519號, 台中市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4315, N'Alisha', N'Freddie.Denesik@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0984205253', CAST(3469.64 AS Decimal(10, 2)), 1, N'0mpsfm25i9', N'羅斯福路 659號, 台北市')
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Mobile], [AccountBalance], [IsConfirmed], [ConfirmCode], [Address]) VALUES (4316, N'王人碩', N'brian66@gmail.com', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'0977556688', CAST(0.00 AS Decimal(10, 2)), 0, N'2a5c21f520d947b4b47efad4ba2311c7', NULL)
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[PetDiaries] ON 

INSERT [dbo].[PetDiaries] ([Id], [PetId], [CreateDate], [DataDate], [Type], [Weight], [Title], [Content]) VALUES (1, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-09-01' AS Date), N'C', CAST(5.00 AS Decimal(3, 2)), N'Health Check', N'Max had a routine health check-up today. All is well.')
INSERT [dbo].[PetDiaries] ([Id], [PetId], [CreateDate], [DataDate], [Type], [Weight], [Title], [Content]) VALUES (2, 2, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-09-01' AS Date), N'F', CAST(4.50 AS Decimal(3, 2)), N'New Diet', N'Bella started a new diet today to manage her weight.')
INSERT [dbo].[PetDiaries] ([Id], [PetId], [CreateDate], [DataDate], [Type], [Weight], [Title], [Content]) VALUES (3, 3, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-09-01' AS Date), N'C', CAST(6.20 AS Decimal(3, 2)), N'Vaccination', N'Charlie received his vaccinations today. No side effects observed.')
INSERT [dbo].[PetDiaries] ([Id], [PetId], [CreateDate], [DataDate], [Type], [Weight], [Title], [Content]) VALUES (4, 4, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-09-01' AS Date), N'F', CAST(4.80 AS Decimal(3, 2)), N'Diet Adjustment', N'Lucy had a slight adjustment in her diet plan.')
INSERT [dbo].[PetDiaries] ([Id], [PetId], [CreateDate], [DataDate], [Type], [Weight], [Title], [Content]) VALUES (5, 5, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-09-01' AS Date), N'C', CAST(5.30 AS Decimal(3, 2)), N'Routine Check', N'Daisy had a routine check-up and everything is fine.')
INSERT [dbo].[PetDiaries] ([Id], [PetId], [CreateDate], [DataDate], [Type], [Weight], [Title], [Content]) VALUES (1002, 1, CAST(N'2024-10-07T14:23:03.337' AS DateTime), CAST(N'2024-10-07' AS Date), NULL, CAST(0.00 AS Decimal(3, 2)), N'dailyRecord', N'無辜大眼')
INSERT [dbo].[PetDiaries] ([Id], [PetId], [CreateDate], [DataDate], [Type], [Weight], [Title], [Content]) VALUES (1003, 1, CAST(N'2024-10-07T14:25:07.983' AS DateTime), CAST(N'2024-10-07' AS Date), NULL, CAST(0.00 AS Decimal(3, 2)), N'dailyRecord', N'今天看起來很開心')
INSERT [dbo].[PetDiaries] ([Id], [PetId], [CreateDate], [DataDate], [Type], [Weight], [Title], [Content]) VALUES (1004, 25, CAST(N'2024-10-07T14:30:01.260' AS DateTime), CAST(N'2024-10-07' AS Date), NULL, CAST(0.00 AS Decimal(3, 2)), N'dailyRecord', N'超可愛橘貓')
INSERT [dbo].[PetDiaries] ([Id], [PetId], [CreateDate], [DataDate], [Type], [Weight], [Title], [Content]) VALUES (1005, 1, CAST(N'2024-10-07T17:16:25.397' AS DateTime), CAST(N'2023-07-07' AS Date), NULL, CAST(0.00 AS Decimal(3, 2)), N'dailyRecord', N'散步日常')
SET IDENTITY_INSERT [dbo].[PetDiaries] OFF
GO
SET IDENTITY_INSERT [dbo].[PetProfiles] ON 

INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (1, 1, N'Max', N'M', CAST(N'2020-05-12' AS Date), N'D', N'柯基', 1, N'929f1af5a7244f5c9a5443f8d44fe287.jpg', CAST(15.00 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (2, 2, N'Bella', N'F', CAST(N'2019-08-21' AS Date), N'C', N'Siamese', 0, N'bella_photo.jpg', NULL)
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (3, 3, N'Charlie', N'M', CAST(N'2021-01-11' AS Date), N'D', N'Beagle', 1, N'charlie_photo.jpg', NULL)
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (4, 4, N'Lucy', N'F', CAST(N'2018-03-14' AS Date), N'C', N'Persian', 0, N'lucy_photo.jpg', NULL)
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (5, 5, N'Daisy', N'F', CAST(N'2022-07-22' AS Date), N'D', N'Bulldog', 0, N'daisy_photo.jpg', NULL)
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (7, 6, N'Frank', N'M', CAST(N'2023-11-08' AS Date), N'D', N'Bulldog', 0, N'frank_photo.jpg', CAST(38.44 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (8, 2014, N'Clarabelle', N'F', CAST(N'2018-05-17' AS Date), N'D', N'Shih Tzu', 1, N'clarabelle_photo.jpg', CAST(15.82 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (9, 2015, N'Kraig', N'M', CAST(N'2023-04-07' AS Date), N'D', N'Labrador', 0, N'kraig_photo.jpg', CAST(25.00 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (10, 2016, N'Collin', N'F', CAST(N'2020-12-29' AS Date), N'C', N'Poodle', 1, N'collin_photo.jpg', CAST(26.09 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (11, 1, N'Ronaldo', N'F', CAST(N'2021-10-26' AS Date), N'D', N'柴犬', 1, N'be563c28a8c74db2a72e40c049f33ba2.jpg', CAST(29.62 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (12, 2, N'Amiya', N'M', CAST(N'2019-01-29' AS Date), N'C', N'Shih Tzu', 0, N'amiya_photo.jpg', CAST(33.49 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (13, 3, N'Shanie', N'M', CAST(N'2024-08-17' AS Date), N'D', N'Ragdoll', 0, N'shanie_photo.jpg', CAST(4.08 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (14, 2, N'Martin', N'F', CAST(N'2022-07-02' AS Date), N'C', N'Labrador', 1, N'martin_photo.jpg', CAST(12.35 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (15, 3, N'Waino', N'F', CAST(N'2021-07-05' AS Date), N'D', N'Sphynx', 1, N'waino_photo.jpg', CAST(14.10 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (16, 4, N'Matilde', N'M', CAST(N'2024-09-26' AS Date), N'D', N'Beagle', 1, N'matilde_photo.jpg', CAST(34.62 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (17, 5, N'Nelle', N'F', CAST(N'2023-12-24' AS Date), N'D', N'Golden Retriever', 1, N'nelle_photo.jpg', CAST(8.02 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (18, 2, N'Hildegard', N'F', CAST(N'2020-10-18' AS Date), N'D', N'Siamese', 1, N'hildegard_photo.jpg', CAST(22.65 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (19, 1, N'Braden', N'M', CAST(N'2019-03-27' AS Date), N'D', N'Siamese', 0, N'b01232de215d485a9ee5c17d35d91a48.jpg', CAST(36.27 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (20, 5, N'Samanta', N'F', CAST(N'2017-05-30' AS Date), N'C', N'Sphynx', 0, N'samanta_photo.jpg', CAST(23.19 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (21, 6, N'May', N'F', CAST(N'2015-06-14' AS Date), N'C', N'Sphynx', 0, N'may_photo.jpg', CAST(7.59 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (22, 4, N'Hector', N'M', CAST(N'2017-12-31' AS Date), N'D', N'Ragdoll', 0, N'hector_photo.jpg', CAST(35.60 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (23, 5, N'Laron', N'F', CAST(N'2015-03-03' AS Date), N'C', N'Poodle', 0, N'laron_photo.jpg', CAST(21.19 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (24, 2, N'Lilla', N'M', CAST(N'2020-01-10' AS Date), N'D', N'Labrador', 1, N'lilla_photo.jpg', CAST(37.89 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (25, 1, N'Alta', N'F', CAST(N'2017-12-26' AS Date), N'C', N'Beagle', 0, N'c1f7932caedc4533af01d2685eaae557.jpg', CAST(6.14 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (26, 4195, N'Danielle', N'F', CAST(N'2018-04-23' AS Date), N'C', N'Golden Retriever', 0, N'danielle_photo.jpg', CAST(27.82 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (27, 4016, N'Ada', N'M', CAST(N'2023-07-30' AS Date), N'C', N'Golden Retriever', 0, N'ada_photo.jpg', CAST(3.22 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (28, 4157, N'Adolf', N'F', CAST(N'2021-09-29' AS Date), N'D', N'Labrador', 1, N'adolf_photo.jpg', CAST(11.75 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (29, 4069, N'Jedediah', N'M', CAST(N'2021-11-05' AS Date), N'D', N'Bulldog', 1, N'jedediah_photo.jpg', CAST(21.19 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (30, 4217, N'Reanna', N'F', CAST(N'2019-11-13' AS Date), N'C', N'Beagle', 0, N'reanna_photo.jpg', CAST(38.89 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (31, 4032, N'Quinn', N'F', CAST(N'2023-09-23' AS Date), N'D', N'Persian', 0, N'quinn_photo.jpg', CAST(16.52 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (32, 4116, N'Natalie', N'F', CAST(N'2017-11-04' AS Date), N'D', N'Bulldog', 0, N'natalie_photo.jpg', CAST(28.03 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (33, 4095, N'Joy', N'F', CAST(N'2022-03-08' AS Date), N'C', N'Bulldog', 0, N'joy_photo.jpg', CAST(25.51 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (34, 4262, N'Kobe', N'M', CAST(N'2022-12-20' AS Date), N'D', N'Persian', 1, N'kobe_photo.jpg', CAST(30.40 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (35, 4272, N'Treva', N'M', CAST(N'2018-07-10' AS Date), N'C', N'Sphynx', 0, N'treva_photo.jpg', CAST(24.47 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (36, 4312, N'Rosamond', N'M', CAST(N'2021-03-26' AS Date), N'C', N'Labrador', 1, N'rosamond_photo.jpg', CAST(25.57 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (37, 4072, N'Austen', N'M', CAST(N'2022-07-30' AS Date), N'D', N'Poodle', 1, N'austen_photo.jpg', CAST(31.22 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (38, 4224, N'Tressie', N'M', CAST(N'2016-09-14' AS Date), N'D', N'Maine Coon', 1, N'tressie_photo.jpg', CAST(33.34 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (39, 4215, N'Aimee', N'M', CAST(N'2022-01-07' AS Date), N'D', N'Golden Retriever', 0, N'aimee_photo.jpg', CAST(9.29 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (40, 4220, N'Audrey', N'F', CAST(N'2015-02-21' AS Date), N'D', N'Siamese', 1, N'audrey_photo.jpg', CAST(13.95 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (41, 4049, N'Julius', N'M', CAST(N'2023-03-31' AS Date), N'D', N'Beagle', 1, N'julius_photo.jpg', CAST(29.33 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (42, 4292, N'Jarrell', N'M', CAST(N'2015-01-09' AS Date), N'C', N'Beagle', 1, N'jarrell_photo.jpg', CAST(31.03 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (43, 4052, N'Donna', N'F', CAST(N'2019-11-25' AS Date), N'D', N'Golden Retriever', 0, N'donna_photo.jpg', CAST(2.40 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (44, 4236, N'Berneice', N'F', CAST(N'2021-02-14' AS Date), N'C', N'Siamese', 0, N'berneice_photo.jpg', CAST(39.12 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (45, 4237, N'Uriah', N'F', CAST(N'2018-02-21' AS Date), N'C', N'Sphynx', 0, N'uriah_photo.jpg', CAST(13.91 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (46, 4085, N'Mohammed', N'F', CAST(N'2018-09-21' AS Date), N'C', N'Maine Coon', 0, N'mohammed_photo.jpg', CAST(22.24 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (47, 4033, N'Ursula', N'M', CAST(N'2015-09-19' AS Date), N'D', N'Shih Tzu', 1, N'ursula_photo.jpg', CAST(10.45 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (48, 4063, N'Alessia', N'F', CAST(N'2015-06-15' AS Date), N'C', N'Sphynx', 0, N'alessia_photo.jpg', CAST(23.33 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (49, 4089, N'Hollis', N'M', CAST(N'2017-07-03' AS Date), N'C', N'Chihuahua', 1, N'hollis_photo.jpg', CAST(28.17 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (50, 4297, N'Lauren', N'F', CAST(N'2021-08-21' AS Date), N'C', N'Sphynx', 1, N'lauren_photo.jpg', CAST(20.79 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (51, 4124, N'Althea', N'F', CAST(N'2016-04-26' AS Date), N'C', N'Chihuahua', 0, N'althea_photo.jpg', CAST(7.99 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (52, 4194, N'Einar', N'F', CAST(N'2018-01-08' AS Date), N'D', N'Ragdoll', 0, N'einar_photo.jpg', CAST(31.77 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (53, 4101, N'Tina', N'F', CAST(N'2022-05-27' AS Date), N'C', N'Maine Coon', 0, N'tina_photo.jpg', CAST(37.40 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (54, 6, N'Khalid', N'M', CAST(N'2017-08-02' AS Date), N'C', N'Sphynx', 0, N'khalid_photo.jpg', CAST(2.27 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (55, 4253, N'Ervin', N'M', CAST(N'2020-02-12' AS Date), N'D', N'Beagle', 0, N'ervin_photo.jpg', CAST(8.14 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (56, 4106, N'Wilfrid', N'M', CAST(N'2022-02-26' AS Date), N'D', N'Persian', 0, N'wilfrid_photo.jpg', CAST(25.37 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (57, 4275, N'Werner', N'F', CAST(N'2018-10-02' AS Date), N'D', N'Beagle', 0, N'werner_photo.jpg', CAST(30.62 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (58, 4155, N'Nelle', N'F', CAST(N'2021-02-20' AS Date), N'D', N'Sphynx', 1, N'nelle_photo.jpg', CAST(27.31 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (59, 4210, N'Macey', N'M', CAST(N'2016-06-20' AS Date), N'D', N'Persian', 0, N'macey_photo.jpg', CAST(28.54 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (60, 4167, N'Karine', N'M', CAST(N'2018-01-31' AS Date), N'C', N'Chihuahua', 0, N'karine_photo.jpg', CAST(20.14 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (61, 4172, N'Phoebe', N'F', CAST(N'2015-10-23' AS Date), N'D', N'Beagle', 0, N'phoebe_photo.jpg', CAST(21.72 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (62, 4046, N'Layla', N'M', CAST(N'2019-10-02' AS Date), N'D', N'Bulldog', 0, N'layla_photo.jpg', CAST(32.96 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (63, 4223, N'Grace', N'F', CAST(N'2020-08-20' AS Date), N'D', N'Chihuahua', 1, N'grace_photo.jpg', CAST(17.15 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (64, 4179, N'Raoul', N'M', CAST(N'2018-01-09' AS Date), N'C', N'Siamese', 1, N'raoul_photo.jpg', CAST(13.46 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (65, 4153, N'Janick', N'M', CAST(N'2020-01-10' AS Date), N'D', N'Persian', 1, N'janick_photo.jpg', CAST(19.21 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (66, 4235, N'Jayde', N'M', CAST(N'2015-10-16' AS Date), N'C', N'Golden Retriever', 0, N'jayde_photo.jpg', CAST(1.50 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (67, 4121, N'Mabel', N'F', CAST(N'2021-04-29' AS Date), N'D', N'Labrador', 1, N'mabel_photo.jpg', CAST(13.80 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (68, 4223, N'Justyn', N'M', CAST(N'2018-04-12' AS Date), N'C', N'Beagle', 0, N'justyn_photo.jpg', CAST(11.91 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (69, 2, N'Aurelio', N'F', CAST(N'2018-03-20' AS Date), N'C', N'Labrador', 0, N'aurelio_photo.jpg', CAST(11.10 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (70, 4201, N'Crystal', N'F', CAST(N'2015-10-11' AS Date), N'D', N'Siamese', 1, N'crystal_photo.jpg', CAST(16.62 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (71, 4284, N'Elijah', N'M', CAST(N'2024-08-26' AS Date), N'D', N'Chihuahua', 1, N'elijah_photo.jpg', CAST(17.53 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (72, 4171, N'Zora', N'F', CAST(N'2020-01-27' AS Date), N'C', N'Poodle', 0, N'zora_photo.jpg', CAST(28.17 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (73, 4309, N'Arielle', N'M', CAST(N'2016-04-10' AS Date), N'D', N'Sphynx', 1, N'arielle_photo.jpg', CAST(8.59 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (74, 4022, N'Myriam', N'M', CAST(N'2016-06-07' AS Date), N'C', N'Siamese', 0, N'myriam_photo.jpg', CAST(18.20 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (75, 4206, N'Anastacio', N'M', CAST(N'2019-10-06' AS Date), N'D', N'Ragdoll', 1, N'anastacio_photo.jpg', CAST(36.36 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (76, 4176, N'Clint', N'M', CAST(N'2015-04-10' AS Date), N'C', N'Persian', 1, N'clint_photo.jpg', CAST(25.15 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (77, 4240, N'Shane', N'M', CAST(N'2022-01-28' AS Date), N'C', N'Shih Tzu', 0, N'shane_photo.jpg', CAST(12.96 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (78, 4244, N'Rosella', N'M', CAST(N'2020-03-11' AS Date), N'C', N'Labrador', 0, N'rosella_photo.jpg', CAST(6.75 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (79, 4279, N'Francis', N'M', CAST(N'2015-10-18' AS Date), N'D', N'Siamese', 0, N'francis_photo.jpg', CAST(30.35 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (80, 4084, N'Haleigh', N'M', CAST(N'2022-08-02' AS Date), N'C', N'Beagle', 0, N'haleigh_photo.jpg', CAST(19.86 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (81, 4267, N'Kane', N'M', CAST(N'2024-10-05' AS Date), N'C', N'Chihuahua', 0, N'kane_photo.jpg', CAST(18.17 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (82, 4186, N'Bernice', N'M', CAST(N'2022-04-01' AS Date), N'C', N'Shih Tzu', 1, N'bernice_photo.jpg', CAST(16.08 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (83, 4057, N'Caleb', N'F', CAST(N'2022-01-17' AS Date), N'C', N'Persian', 1, N'caleb_photo.jpg', CAST(15.87 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (84, 4071, N'Kaelyn', N'M', CAST(N'2019-09-23' AS Date), N'C', N'Maine Coon', 0, N'kaelyn_photo.jpg', CAST(5.68 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (85, 4059, N'Maurice', N'M', CAST(N'2015-01-13' AS Date), N'D', N'Poodle', 1, N'maurice_photo.jpg', CAST(13.02 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (86, 4255, N'Vivian', N'F', CAST(N'2024-05-20' AS Date), N'C', N'Persian', 1, N'vivian_photo.jpg', CAST(15.29 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (87, 4211, N'Loy', N'F', CAST(N'2019-12-09' AS Date), N'D', N'Bulldog', 0, N'loy_photo.jpg', CAST(1.99 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (88, 4274, N'Stewart', N'F', CAST(N'2020-11-15' AS Date), N'D', N'Golden Retriever', 0, N'stewart_photo.jpg', CAST(12.92 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (89, 4267, N'Burnice', N'F', CAST(N'2014-12-07' AS Date), N'C', N'Labrador', 1, N'burnice_photo.jpg', CAST(5.28 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (90, 4150, N'Lillie', N'M', CAST(N'2015-01-13' AS Date), N'C', N'Labrador', 1, N'lillie_photo.jpg', CAST(37.46 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (91, 4081, N'Sylvan', N'M', CAST(N'2015-03-10' AS Date), N'D', N'Siamese', 0, N'sylvan_photo.jpg', CAST(39.94 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (92, 4108, N'Zola', N'F', CAST(N'2022-04-10' AS Date), N'C', N'Ragdoll', 0, N'zola_photo.jpg', CAST(32.63 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (93, 2016, N'Joshua', N'F', CAST(N'2017-03-15' AS Date), N'D', N'Beagle', 0, N'joshua_photo.jpg', CAST(24.30 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (94, 4133, N'Jack', N'F', CAST(N'2019-02-18' AS Date), N'C', N'Poodle', 1, N'jack_photo.jpg', CAST(25.84 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (95, 4103, N'Otto', N'F', CAST(N'2019-06-29' AS Date), N'C', N'Ragdoll', 1, N'otto_photo.jpg', CAST(10.37 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (96, 4276, N'Virginie', N'F', CAST(N'2018-09-22' AS Date), N'C', N'Sphynx', 1, N'virginie_photo.jpg', CAST(4.54 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (97, 4174, N'Lisandro', N'F', CAST(N'2024-02-14' AS Date), N'C', N'Chihuahua', 0, N'lisandro_photo.jpg', CAST(15.50 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (98, 4048, N'Sidney', N'F', CAST(N'2017-04-17' AS Date), N'C', N'Persian', 1, N'sidney_photo.jpg', CAST(23.76 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (99, 4192, N'Dion', N'F', CAST(N'2024-05-13' AS Date), N'C', N'Persian', 1, N'dion_photo.jpg', CAST(10.26 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (100, 4044, N'Frankie', N'F', CAST(N'2020-08-11' AS Date), N'D', N'Beagle', 1, N'frankie_photo.jpg', CAST(17.37 AS Decimal(4, 2)))
GO
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (101, 4095, N'Jamir', N'F', CAST(N'2022-07-08' AS Date), N'C', N'Persian', 0, N'jamir_photo.jpg', CAST(28.30 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (102, 4284, N'Kaylah', N'M', CAST(N'2018-04-17' AS Date), N'D', N'Persian', 0, N'kaylah_photo.jpg', CAST(33.72 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (103, 4282, N'Delfina', N'M', CAST(N'2022-04-06' AS Date), N'D', N'Siamese', 1, N'delfina_photo.jpg', CAST(16.81 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (104, 4315, N'Leopoldo', N'F', CAST(N'2020-02-13' AS Date), N'D', N'Beagle', 1, N'leopoldo_photo.jpg', CAST(39.46 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (105, 4120, N'Brett', N'F', CAST(N'2023-01-31' AS Date), N'C', N'Sphynx', 0, N'brett_photo.jpg', CAST(7.98 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (106, 4228, N'Brain', N'F', CAST(N'2021-04-02' AS Date), N'C', N'Shih Tzu', 0, N'brain_photo.jpg', CAST(3.29 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (107, 4287, N'Meghan', N'F', CAST(N'2024-08-17' AS Date), N'D', N'Maine Coon', 1, N'meghan_photo.jpg', CAST(37.05 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (108, 4234, N'Hadley', N'F', CAST(N'2023-09-08' AS Date), N'C', N'Persian', 0, N'hadley_photo.jpg', CAST(4.64 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (109, 4075, N'Gonzalo', N'F', CAST(N'2022-10-10' AS Date), N'C', N'Labrador', 1, N'gonzalo_photo.jpg', CAST(35.96 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (110, 4166, N'Sanford', N'F', CAST(N'2024-06-06' AS Date), N'D', N'Maine Coon', 1, N'sanford_photo.jpg', CAST(29.30 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (111, 4082, N'Lamont', N'F', CAST(N'2020-01-20' AS Date), N'C', N'Beagle', 0, N'lamont_photo.jpg', CAST(39.13 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (112, 4265, N'Madaline', N'F', CAST(N'2023-04-06' AS Date), N'D', N'Maine Coon', 1, N'madaline_photo.jpg', CAST(5.47 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (113, 4140, N'Micheal', N'F', CAST(N'2019-02-06' AS Date), N'C', N'Chihuahua', 1, N'micheal_photo.jpg', CAST(13.56 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (114, 4215, N'Maximus', N'F', CAST(N'2022-04-29' AS Date), N'D', N'Siamese', 1, N'maximus_photo.jpg', CAST(18.56 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (115, 4021, N'Caitlyn', N'M', CAST(N'2023-05-21' AS Date), N'C', N'Golden Retriever', 0, N'caitlyn_photo.jpg', CAST(14.50 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (116, 4042, N'Sadie', N'M', CAST(N'2023-07-07' AS Date), N'C', N'Beagle', 0, N'sadie_photo.jpg', CAST(25.48 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (117, 4182, N'Mariano', N'M', CAST(N'2017-07-23' AS Date), N'C', N'Ragdoll', 0, N'mariano_photo.jpg', CAST(1.09 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (118, 4113, N'Gerald', N'M', CAST(N'2016-05-07' AS Date), N'D', N'Shih Tzu', 0, N'gerald_photo.jpg', CAST(26.20 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (119, 4185, N'Houston', N'M', CAST(N'2015-09-26' AS Date), N'D', N'Bulldog', 1, N'houston_photo.jpg', CAST(22.57 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (120, 4185, N'Kelli', N'M', CAST(N'2015-07-03' AS Date), N'D', N'Beagle', 0, N'kelli_photo.jpg', CAST(12.56 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (121, 4250, N'Abdullah', N'F', CAST(N'2021-02-27' AS Date), N'C', N'Maine Coon', 0, N'abdullah_photo.jpg', CAST(4.47 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (122, 4276, N'Grant', N'F', CAST(N'2022-03-23' AS Date), N'D', N'Chihuahua', 0, N'grant_photo.jpg', CAST(35.80 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (123, 4148, N'Marilie', N'F', CAST(N'2023-08-07' AS Date), N'C', N'Sphynx', 1, N'marilie_photo.jpg', CAST(5.13 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (124, 4307, N'Selmer', N'F', CAST(N'2021-02-17' AS Date), N'C', N'Golden Retriever', 0, N'selmer_photo.jpg', CAST(7.07 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (125, 4163, N'Nella', N'F', CAST(N'2020-02-16' AS Date), N'C', N'Poodle', 0, N'nella_photo.jpg', CAST(16.53 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (126, 4016, N'Autumn', N'F', CAST(N'2015-03-14' AS Date), N'D', N'Siamese', 0, N'autumn_photo.jpg', CAST(18.70 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (127, 4033, N'Camryn', N'M', CAST(N'2017-10-08' AS Date), N'D', N'Shih Tzu', 1, N'camryn_photo.jpg', CAST(36.50 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (128, 4102, N'Mina', N'M', CAST(N'2015-07-25' AS Date), N'D', N'Beagle', 1, N'mina_photo.jpg', CAST(8.70 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (129, 4292, N'Margarett', N'F', CAST(N'2022-03-14' AS Date), N'C', N'Persian', 1, N'margarett_photo.jpg', CAST(14.39 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (130, 4022, N'Kelli', N'M', CAST(N'2016-04-12' AS Date), N'D', N'Bulldog', 0, N'kelli_photo.jpg', CAST(39.14 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (131, 4190, N'Baylee', N'F', CAST(N'2017-12-17' AS Date), N'D', N'Sphynx', 0, N'baylee_photo.jpg', CAST(38.42 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (132, 4058, N'Arianna', N'F', CAST(N'2023-12-07' AS Date), N'D', N'Sphynx', 1, N'arianna_photo.jpg', CAST(30.16 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (133, 4235, N'Jerrell', N'M', CAST(N'2016-08-24' AS Date), N'C', N'Bulldog', 0, N'jerrell_photo.jpg', CAST(11.42 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (134, 4206, N'Magnus', N'F', CAST(N'2018-06-07' AS Date), N'D', N'Poodle', 0, N'magnus_photo.jpg', CAST(17.16 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (135, 4239, N'Cheyenne', N'F', CAST(N'2023-09-10' AS Date), N'D', N'Poodle', 1, N'cheyenne_photo.jpg', CAST(34.22 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (136, 4278, N'Mario', N'F', CAST(N'2018-04-28' AS Date), N'C', N'Golden Retriever', 0, N'mario_photo.jpg', CAST(36.17 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (137, 4019, N'Jadyn', N'M', CAST(N'2017-03-27' AS Date), N'D', N'Maine Coon', 1, N'jadyn_photo.jpg', CAST(2.51 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (138, 4160, N'Harold', N'F', CAST(N'2021-04-18' AS Date), N'D', N'Bulldog', 0, N'harold_photo.jpg', CAST(35.86 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (139, 4182, N'Emmanuel', N'F', CAST(N'2022-05-23' AS Date), N'D', N'Golden Retriever', 1, N'emmanuel_photo.jpg', CAST(11.27 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (140, 4029, N'Ernesto', N'M', CAST(N'2015-10-05' AS Date), N'D', N'Beagle', 0, N'ernesto_photo.jpg', CAST(3.25 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (141, 4112, N'Viva', N'M', CAST(N'2014-11-24' AS Date), N'D', N'Ragdoll', 1, N'viva_photo.jpg', CAST(12.27 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (142, 4256, N'Katrina', N'F', CAST(N'2024-02-05' AS Date), N'C', N'Ragdoll', 0, N'katrina_photo.jpg', CAST(15.99 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (143, 4095, N'Virgil', N'M', CAST(N'2021-02-21' AS Date), N'D', N'Chihuahua', 0, N'virgil_photo.jpg', CAST(12.44 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (144, 4035, N'Nathanial', N'M', CAST(N'2016-09-18' AS Date), N'C', N'Labrador', 0, N'nathanial_photo.jpg', CAST(12.05 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (145, 4242, N'Keely', N'F', CAST(N'2023-11-23' AS Date), N'D', N'Poodle', 1, N'keely_photo.jpg', CAST(20.87 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (146, 4037, N'Maureen', N'M', CAST(N'2016-11-27' AS Date), N'D', N'Siamese', 1, N'maureen_photo.jpg', CAST(19.09 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (147, 4087, N'Michele', N'F', CAST(N'2020-02-10' AS Date), N'C', N'Siamese', 1, N'michele_photo.jpg', CAST(2.94 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (148, 4290, N'Vita', N'F', CAST(N'2017-04-11' AS Date), N'D', N'Labrador', 0, N'vita_photo.jpg', CAST(12.32 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (149, 4050, N'Jabari', N'M', CAST(N'2020-10-07' AS Date), N'D', N'Chihuahua', 1, N'jabari_photo.jpg', CAST(26.02 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (150, 4170, N'Mike', N'M', CAST(N'2021-07-06' AS Date), N'D', N'Maine Coon', 0, N'mike_photo.jpg', CAST(39.69 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (151, 4043, N'Willis', N'M', CAST(N'2014-10-31' AS Date), N'C', N'Beagle', 1, N'willis_photo.jpg', CAST(24.61 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (152, 4064, N'Keith', N'F', CAST(N'2023-10-03' AS Date), N'C', N'Shih Tzu', 1, N'keith_photo.jpg', CAST(23.03 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (153, 4076, N'Carolyn', N'F', CAST(N'2015-11-08' AS Date), N'C', N'Ragdoll', 1, N'carolyn_photo.jpg', CAST(33.06 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (154, 4213, N'Aubrey', N'F', CAST(N'2023-05-03' AS Date), N'C', N'Chihuahua', 0, N'aubrey_photo.jpg', CAST(25.42 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (155, 4211, N'Princess', N'M', CAST(N'2019-12-22' AS Date), N'D', N'Shih Tzu', 0, N'princess_photo.jpg', CAST(32.30 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (156, 4283, N'Loraine', N'F', CAST(N'2018-01-16' AS Date), N'D', N'Siamese', 0, N'loraine_photo.jpg', CAST(36.69 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (157, 4152, N'Nikolas', N'M', CAST(N'2024-01-12' AS Date), N'C', N'Golden Retriever', 1, N'nikolas_photo.jpg', CAST(21.95 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (158, 4128, N'Itzel', N'F', CAST(N'2018-01-16' AS Date), N'D', N'Bulldog', 0, N'itzel_photo.jpg', CAST(32.63 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (159, 4251, N'Anastacio', N'M', CAST(N'2015-06-21' AS Date), N'D', N'Poodle', 1, N'anastacio_photo.jpg', CAST(21.65 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (160, 4121, N'Alisha', N'F', CAST(N'2021-06-24' AS Date), N'D', N'Poodle', 0, N'alisha_photo.jpg', CAST(8.18 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (161, 4097, N'Wilton', N'M', CAST(N'2023-05-05' AS Date), N'C', N'Chihuahua', 0, N'wilton_photo.jpg', CAST(38.42 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (162, 4275, N'Okey', N'F', CAST(N'2017-04-01' AS Date), N'C', N'Ragdoll', 0, N'okey_photo.jpg', CAST(30.28 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (163, 4184, N'Annabel', N'F', CAST(N'2015-01-27' AS Date), N'D', N'Sphynx', 0, N'annabel_photo.jpg', CAST(4.92 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (164, 4058, N'Marilou', N'M', CAST(N'2015-10-15' AS Date), N'D', N'Chihuahua', 0, N'marilou_photo.jpg', CAST(8.48 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (165, 4194, N'Haleigh', N'M', CAST(N'2022-03-07' AS Date), N'C', N'Poodle', 1, N'haleigh_photo.jpg', CAST(1.16 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (166, 4230, N'Bradly', N'M', CAST(N'2019-01-12' AS Date), N'C', N'Shih Tzu', 0, N'bradly_photo.jpg', CAST(31.40 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (167, 4143, N'Bernie', N'M', CAST(N'2015-02-26' AS Date), N'C', N'Maine Coon', 1, N'bernie_photo.jpg', CAST(8.84 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (168, 4280, N'Garett', N'F', CAST(N'2016-07-20' AS Date), N'D', N'Maine Coon', 0, N'garett_photo.jpg', CAST(3.76 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (169, 4289, N'Kailey', N'M', CAST(N'2018-12-08' AS Date), N'D', N'Bulldog', 0, N'kailey_photo.jpg', CAST(15.26 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (170, 4287, N'Theodore', N'F', CAST(N'2024-09-11' AS Date), N'C', N'Sphynx', 1, N'theodore_photo.jpg', CAST(31.58 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (171, 4091, N'Magali', N'M', CAST(N'2023-11-24' AS Date), N'D', N'Poodle', 0, N'magali_photo.jpg', CAST(33.32 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (172, 4065, N'Efrain', N'F', CAST(N'2020-06-09' AS Date), N'C', N'Labrador', 0, N'efrain_photo.jpg', CAST(23.46 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (173, 4171, N'Asha', N'M', CAST(N'2021-09-20' AS Date), N'C', N'Sphynx', 1, N'asha_photo.jpg', CAST(7.92 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (174, 4185, N'Alfonso', N'M', CAST(N'2017-08-30' AS Date), N'D', N'Golden Retriever', 1, N'alfonso_photo.jpg', CAST(17.16 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (175, 4072, N'Vincent', N'F', CAST(N'2018-05-02' AS Date), N'D', N'Chihuahua', 0, N'vincent_photo.jpg', CAST(28.74 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (176, 4165, N'Dolores', N'M', CAST(N'2024-01-11' AS Date), N'D', N'Poodle', 0, N'dolores_photo.jpg', CAST(11.48 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (177, 4205, N'Albina', N'F', CAST(N'2017-05-28' AS Date), N'C', N'Sphynx', 1, N'albina_photo.jpg', CAST(8.39 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (178, 4233, N'Dean', N'F', CAST(N'2022-02-08' AS Date), N'D', N'Ragdoll', 0, N'dean_photo.jpg', CAST(13.14 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (179, 4291, N'Holden', N'M', CAST(N'2016-03-28' AS Date), N'C', N'Golden Retriever', 1, N'holden_photo.jpg', CAST(27.77 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (180, 4236, N'Leann', N'M', CAST(N'2022-04-17' AS Date), N'C', N'Persian', 0, N'leann_photo.jpg', CAST(26.47 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (181, 4208, N'Tre', N'M', CAST(N'2022-10-07' AS Date), N'D', N'Shih Tzu', 0, N'tre_photo.jpg', CAST(7.18 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (182, 4052, N'Jefferey', N'M', CAST(N'2023-06-14' AS Date), N'C', N'Poodle', 1, N'jefferey_photo.jpg', CAST(6.00 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (183, 4125, N'Taya', N'M', CAST(N'2024-07-13' AS Date), N'D', N'Chihuahua', 1, N'taya_photo.jpg', CAST(7.31 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (184, 4262, N'Verona', N'M', CAST(N'2023-12-07' AS Date), N'C', N'Golden Retriever', 1, N'verona_photo.jpg', CAST(36.16 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (185, 4198, N'Domenick', N'F', CAST(N'2020-09-04' AS Date), N'D', N'Persian', 0, N'domenick_photo.jpg', CAST(11.52 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (186, 4310, N'Carolina', N'M', CAST(N'2021-07-20' AS Date), N'C', N'Golden Retriever', 0, N'carolina_photo.jpg', CAST(32.71 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (187, 4244, N'Clyde', N'F', CAST(N'2016-08-20' AS Date), N'D', N'Chihuahua', 1, N'clyde_photo.jpg', CAST(31.71 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (188, 4202, N'Erin', N'M', CAST(N'2020-05-06' AS Date), N'D', N'Shih Tzu', 0, N'erin_photo.jpg', CAST(27.20 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (189, 4105, N'Jess', N'F', CAST(N'2019-11-30' AS Date), N'C', N'Sphynx', 0, N'jess_photo.jpg', CAST(11.14 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (190, 4028, N'Simeon', N'M', CAST(N'2024-06-11' AS Date), N'C', N'Beagle', 0, N'simeon_photo.jpg', CAST(30.28 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (191, 4105, N'Lelia', N'F', CAST(N'2020-06-22' AS Date), N'D', N'Shih Tzu', 0, N'lelia_photo.jpg', CAST(33.00 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (192, 4120, N'Zackery', N'F', CAST(N'2024-06-13' AS Date), N'D', N'Labrador', 1, N'zackery_photo.jpg', CAST(3.22 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (193, 4220, N'Jed', N'M', CAST(N'2023-02-24' AS Date), N'D', N'Labrador', 1, N'jed_photo.jpg', CAST(11.80 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (194, 4135, N'Enos', N'F', CAST(N'2021-11-19' AS Date), N'D', N'Labrador', 1, N'enos_photo.jpg', CAST(14.26 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (195, 4176, N'Litzy', N'M', CAST(N'2018-08-05' AS Date), N'C', N'Beagle', 1, N'litzy_photo.jpg', CAST(15.72 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (196, 4026, N'Pauline', N'F', CAST(N'2017-06-22' AS Date), N'D', N'Chihuahua', 1, N'pauline_photo.jpg', CAST(21.88 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (197, 4149, N'Dianna', N'M', CAST(N'2024-04-01' AS Date), N'C', N'Persian', 1, N'dianna_photo.jpg', CAST(23.56 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (198, 4114, N'Khalil', N'F', CAST(N'2023-08-14' AS Date), N'C', N'Labrador', 1, N'khalil_photo.jpg', CAST(15.83 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (199, 4251, N'Laney', N'M', CAST(N'2020-10-09' AS Date), N'D', N'Labrador', 1, N'laney_photo.jpg', CAST(21.62 AS Decimal(4, 2)))
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (200, 4214, N'Terrell', N'M', CAST(N'2018-02-02' AS Date), N'C', N'Persian', 1, N'terrell_photo.jpg', CAST(28.00 AS Decimal(4, 2)))
GO
INSERT [dbo].[PetProfiles] ([Id], [MemberId], [Name], [Gender], [Birthday], [Species], [Breed], [Neutered], [Photo], [Weight]) VALUES (201, 4110, N'Dorcas', N'M', CAST(N'2023-08-16' AS Date), N'D', N'Siamese', 1, N'dorcas_photo.jpg', CAST(19.89 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[PetProfiles] OFF
GO
SET IDENTITY_INSERT [dbo].[PetsTag] ON 

INSERT [dbo].[PetsTag] ([Id], [PetProfilesId], [PhotoId]) VALUES (1, 1, 1)
INSERT [dbo].[PetsTag] ([Id], [PetProfilesId], [PhotoId]) VALUES (2, 2, 2)
INSERT [dbo].[PetsTag] ([Id], [PetProfilesId], [PhotoId]) VALUES (3, 3, 3)
INSERT [dbo].[PetsTag] ([Id], [PetProfilesId], [PhotoId]) VALUES (4, 4, 4)
INSERT [dbo].[PetsTag] ([Id], [PetProfilesId], [PhotoId]) VALUES (5, 5, 5)
SET IDENTITY_INSERT [dbo].[PetsTag] OFF
GO
SET IDENTITY_INSERT [dbo].[Photo] ON 

INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (1, 1, N'max_checkup.jpg', N'images/max_checkup.jpg', CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (2, 2, N'bella_diet.jpg', N'images/bella_diet.jpg', CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (3, 3, N'charlie_vaccine.jpg', N'images/charlie_vaccine.jpg', CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (4, 4, N'lucy_diet.jpg', N'images/lucy_diet.jpg', CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (5, 5, N'daisy_checkup.jpg', N'images/daisy_checkup.jpg', CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (1002, 1002, N'6c568fa9f475488f9c25afa385bb12dd.jpg', N'C:\GitLab\期末\FrontSite完成版\PetsWebSite\Uploads\Diaries\6c568fa9f475488f9c25afa385bb12dd.jpg', CAST(N'2024-10-07' AS Date))
INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (1003, 1003, N'6b3c20b696574210bdd973d68f48dc41.jpg', N'C:\GitLab\期末\FrontSite完成版\PetsWebSite\Uploads\Diaries\6b3c20b696574210bdd973d68f48dc41.jpg', CAST(N'2024-10-07' AS Date))
INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (1004, 1003, N'0740ff6125a74a0cbb463e53409b5505.jpg', N'C:\GitLab\期末\FrontSite完成版\PetsWebSite\Uploads\Diaries\0740ff6125a74a0cbb463e53409b5505.jpg', CAST(N'2024-10-07' AS Date))
INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (1005, 1003, N'9a15bffe0631408783f8638c6c039215.jpg', N'C:\GitLab\期末\FrontSite完成版\PetsWebSite\Uploads\Diaries\9a15bffe0631408783f8638c6c039215.jpg', CAST(N'2024-10-07' AS Date))
INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (1006, 1003, N'92b7a16ad56c46619e3bf76d3759ff5e.jpg', N'C:\GitLab\期末\FrontSite完成版\PetsWebSite\Uploads\Diaries\92b7a16ad56c46619e3bf76d3759ff5e.jpg', CAST(N'2024-10-07' AS Date))
INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (1007, 1003, N'139cb5725e184c579eb7398a135701e4.jpg', N'C:\GitLab\期末\FrontSite完成版\PetsWebSite\Uploads\Diaries\139cb5725e184c579eb7398a135701e4.jpg', CAST(N'2024-10-07' AS Date))
INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (1008, 1004, N'2ad06a398f5e4285a7cbd4521a8d230f.jpg', N'C:\GitLab\期末\FrontSite完成版\PetsWebSite\Uploads\Diaries\2ad06a398f5e4285a7cbd4521a8d230f.jpg', CAST(N'2024-10-07' AS Date))
INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (1009, 1004, N'e9f9a31ddfc343ff8d7dbbf535f90d6b.jpg', N'C:\GitLab\期末\FrontSite完成版\PetsWebSite\Uploads\Diaries\e9f9a31ddfc343ff8d7dbbf535f90d6b.jpg', CAST(N'2024-10-07' AS Date))
INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (1010, 1004, N'732d605dab7c4593b04712cef45809c5.jpg', N'C:\GitLab\期末\FrontSite完成版\PetsWebSite\Uploads\Diaries\732d605dab7c4593b04712cef45809c5.jpg', CAST(N'2024-10-07' AS Date))
INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (1011, 1004, N'c96a5f346f104b399b9308f4949a3799.jpg', N'C:\GitLab\期末\FrontSite完成版\PetsWebSite\Uploads\Diaries\c96a5f346f104b399b9308f4949a3799.jpg', CAST(N'2024-10-07' AS Date))
INSERT [dbo].[Photo] ([Id], [PetDiariesId], [FileName], [FilePath], [UploadDate]) VALUES (1012, 1005, N'd9ecf2e533c247599f390dc1bbb4698b.jpg', N'C:\GitLab\期末\FrontSite完成版\PetsWebSite\Uploads\Diaries\d9ecf2e533c247599f390dc1bbb4698b.jpg', CAST(N'2023-07-07' AS Date))
SET IDENTITY_INSERT [dbo].[Photo] OFF
GO
SET IDENTITY_INSERT [dbo].[PictureFiles] ON 

INSERT [dbo].[PictureFiles] ([Id], [MediaPath], [Description], [DisplayOrder], [LastModified]) VALUES (1, N'images/pic1.jpg', N'Max during check-up', 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PictureFiles] ([Id], [MediaPath], [Description], [DisplayOrder], [LastModified]) VALUES (2, N'images/pic2.jpg', N'Bella enjoying her new food', 2, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PictureFiles] ([Id], [MediaPath], [Description], [DisplayOrder], [LastModified]) VALUES (3, N'images/pic3.jpg', N'Charlie’s vaccination day', 3, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PictureFiles] ([Id], [MediaPath], [Description], [DisplayOrder], [LastModified]) VALUES (4, N'images/pic4.jpg', N'Lucy’s diet change', 4, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PictureFiles] ([Id], [MediaPath], [Description], [DisplayOrder], [LastModified]) VALUES (5, N'images/pic5.jpg', N'Daisy’s regular check-up', 5, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[PictureFiles] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Members__A9D10534CB858075]    Script Date: 2024/10/7 下午 11:01:48 ******/
ALTER TABLE [dbo].[Members] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DepositRecords] ADD  CONSTRAINT [DF__DepositRe__Depos__5165187F]  DEFAULT (getdate()) FOR [DepositDate]
GO
ALTER TABLE [dbo].[DepositRecords] ADD  CONSTRAINT [DF__DepositRe__Depos__52593CB8]  DEFAULT ((0)) FOR [DepositAmount]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((0)) FOR [AccountBalance]
GO
ALTER TABLE [dbo].[PetDiaries] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillDetails_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[BillDetails] CHECK CONSTRAINT [FK_BillDetails_Members]
GO
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillDetails_PetProfiles] FOREIGN KEY([PetId])
REFERENCES [dbo].[PetProfiles] ([Id])
GO
ALTER TABLE [dbo].[BillDetails] CHECK CONSTRAINT [FK_BillDetails_PetProfiles]
GO
ALTER TABLE [dbo].[BookRecords]  WITH CHECK ADD  CONSTRAINT [FK_BookRecords_BookTimes] FOREIGN KEY([BookTimeId])
REFERENCES [dbo].[BookTimes] ([Id])
GO
ALTER TABLE [dbo].[BookRecords] CHECK CONSTRAINT [FK_BookRecords_BookTimes]
GO
ALTER TABLE [dbo].[BookRecords]  WITH CHECK ADD  CONSTRAINT [FK_BookRecords_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[BookRecords] CHECK CONSTRAINT [FK_BookRecords_Members]
GO
ALTER TABLE [dbo].[BookRecords]  WITH CHECK ADD  CONSTRAINT [FK_BookRecords_PetProfiles] FOREIGN KEY([PetId])
REFERENCES [dbo].[PetProfiles] ([Id])
GO
ALTER TABLE [dbo].[BookRecords] CHECK CONSTRAINT [FK_BookRecords_PetProfiles]
GO
ALTER TABLE [dbo].[DepositRecords]  WITH CHECK ADD  CONSTRAINT [FK_DepositRecords_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[DepositRecords] CHECK CONSTRAINT [FK_DepositRecords_Members]
GO
ALTER TABLE [dbo].[ManagerIncomeDetails]  WITH CHECK ADD  CONSTRAINT [FK_ManagerIncomeDetails_BillDetails] FOREIGN KEY([BillDetailsId])
REFERENCES [dbo].[BillDetails] ([Id])
GO
ALTER TABLE [dbo].[ManagerIncomeDetails] CHECK CONSTRAINT [FK_ManagerIncomeDetails_BillDetails]
GO
ALTER TABLE [dbo].[ManagerIncomeDetails]  WITH CHECK ADD  CONSTRAINT [FK_ManagerIncomeDetails_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[ManagerIncomeDetails] CHECK CONSTRAINT [FK_ManagerIncomeDetails_Members]
GO
ALTER TABLE [dbo].[PetProfiles]  WITH CHECK ADD  CONSTRAINT [FK_PetProfiles_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[PetProfiles] CHECK CONSTRAINT [FK_PetProfiles_Members]
GO
ALTER TABLE [dbo].[PetsTag]  WITH CHECK ADD  CONSTRAINT [FK_PetsTag_PetProfiles] FOREIGN KEY([PetProfilesId])
REFERENCES [dbo].[PetProfiles] ([Id])
GO
ALTER TABLE [dbo].[PetsTag] CHECK CONSTRAINT [FK_PetsTag_PetProfiles]
GO
ALTER TABLE [dbo].[PetsTag]  WITH CHECK ADD  CONSTRAINT [FK_PetsTag_Photo] FOREIGN KEY([PhotoId])
REFERENCES [dbo].[Photo] ([Id])
GO
ALTER TABLE [dbo].[PetsTag] CHECK CONSTRAINT [FK_PetsTag_Photo]
GO
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK_Photo_PetDiaries] FOREIGN KEY([PetDiariesId])
REFERENCES [dbo].[PetDiaries] ([Id])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK_Photo_PetDiaries]
GO
