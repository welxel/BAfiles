USE [MoviesMvcBilgeAdamDB]
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 30.11.2020 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Retired] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Directors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieDirectors]    Script Date: 30.11.2020 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieDirectors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[DirectorId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.MovieDirectors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 30.11.2020 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[ProductionYear] [nvarchar](4) NULL,
	[BoxOfficeReturn] [float] NULL,
 CONSTRAINT [PK_dbo.Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 30.11.2020 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Rating] [int] NOT NULL,
	[Reviewer] [nvarchar](200) NULL,
	[MovieId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Reviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Directors] ON 

INSERT [dbo].[Directors] ([Id], [Name], [Surname], [Retired]) VALUES (0, N'James', N'Cameron', 0)
INSERT [dbo].[Directors] ([Id], [Name], [Surname], [Retired]) VALUES (1, N'Guy', N'Ritchie', 0)
INSERT [dbo].[Directors] ([Id], [Name], [Surname], [Retired]) VALUES (2, N'F. Gary', N'Gray', 0)
INSERT [dbo].[Directors] ([Id], [Name], [Surname], [Retired]) VALUES (3, N'Ridley', N'Scott', 0)
INSERT [dbo].[Directors] ([Id], [Name], [Surname], [Retired]) VALUES (4, N'David', N'Fincher', 0)
SET IDENTITY_INSERT [dbo].[Directors] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieDirectors] ON 

INSERT [dbo].[MovieDirectors] ([Id], [MovieId], [DirectorId]) VALUES (0, 0, 0)
INSERT [dbo].[MovieDirectors] ([Id], [MovieId], [DirectorId]) VALUES (1, 1, 1)
INSERT [dbo].[MovieDirectors] ([Id], [MovieId], [DirectorId]) VALUES (2, 2, 2)
INSERT [dbo].[MovieDirectors] ([Id], [MovieId], [DirectorId]) VALUES (3, 3, 3)
INSERT [dbo].[MovieDirectors] ([Id], [MovieId], [DirectorId]) VALUES (4, 4, 0)
INSERT [dbo].[MovieDirectors] ([Id], [MovieId], [DirectorId]) VALUES (5, 5, 4)
SET IDENTITY_INSERT [dbo].[MovieDirectors] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([Id], [Name], [ProductionYear], [BoxOfficeReturn]) VALUES (0, N'Avatar', N'2009', 1000000)
INSERT [dbo].[Movies] ([Id], [Name], [ProductionYear], [BoxOfficeReturn]) VALUES (1, N'Sherlock Holmes', N'2009', NULL)
INSERT [dbo].[Movies] ([Id], [Name], [ProductionYear], [BoxOfficeReturn]) VALUES (2, N'Law Abiding Citizen', N'2009', 300000)
INSERT [dbo].[Movies] ([Id], [Name], [ProductionYear], [BoxOfficeReturn]) VALUES (3, N'Alien', N'1979', 7000000)
INSERT [dbo].[Movies] ([Id], [Name], [ProductionYear], [BoxOfficeReturn]) VALUES (4, N'Aliens', N'1986', 10000000)
INSERT [dbo].[Movies] ([Id], [Name], [ProductionYear], [BoxOfficeReturn]) VALUES (5, N'Alien 3', N'1992', 4000000)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([Id], [Content], [Rating], [Reviewer], [MovieId]) VALUES (0, N'Very good movie.', 9, N'Cagil Alsac', 0)
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
ALTER TABLE [dbo].[MovieDirectors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MovieDirectors_dbo.Directors_DirectorId] FOREIGN KEY([DirectorId])
REFERENCES [dbo].[Directors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieDirectors] CHECK CONSTRAINT [FK_dbo.MovieDirectors_dbo.Directors_DirectorId]
GO
ALTER TABLE [dbo].[MovieDirectors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MovieDirectors_dbo.Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieDirectors] CHECK CONSTRAINT [FK_dbo.MovieDirectors_dbo.Movies_MovieId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Reviews_dbo.Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_dbo.Reviews_dbo.Movies_MovieId]
GO
