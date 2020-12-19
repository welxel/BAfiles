USE [Oyunlar]
GO
/****** Object:  Table [dbo].[Oyun]    Script Date: 19.12.2020 13:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oyun](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](max) NULL,
	[Maliyeti] [float] NULL,
	[Kazanci] [float] NULL,
	[YilId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Oyun] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OyunTur]    Script Date: 19.12.2020 13:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OyunTur](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OyunId] [int] NOT NULL,
	[TurId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.OyunTur] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tur]    Script Date: 19.12.2020 13:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tur](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Tur] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yil]    Script Date: 19.12.2020 13:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Degeri] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Yil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Oyun] ON 

INSERT [dbo].[Oyun] ([Id], [Adi], [Maliyeti], [Kazanci], [YilId]) VALUES (11, N'GTA5', 1000000, 2000000, 16)
INSERT [dbo].[Oyun] ([Id], [Adi], [Maliyeti], [Kazanci], [YilId]) VALUES (12, N'Doom', 500000, 300000, 17)
INSERT [dbo].[Oyun] ([Id], [Adi], [Maliyeti], [Kazanci], [YilId]) VALUES (13, N'Dishonored', 100000, 300000, 18)
SET IDENTITY_INSERT [dbo].[Oyun] OFF
GO
SET IDENTITY_INSERT [dbo].[OyunTur] ON 

INSERT [dbo].[OyunTur] ([Id], [OyunId], [TurId]) VALUES (24, 11, 11)
INSERT [dbo].[OyunTur] ([Id], [OyunId], [TurId]) VALUES (25, 11, 12)
INSERT [dbo].[OyunTur] ([Id], [OyunId], [TurId]) VALUES (26, 11, 13)
INSERT [dbo].[OyunTur] ([Id], [OyunId], [TurId]) VALUES (27, 12, 11)
INSERT [dbo].[OyunTur] ([Id], [OyunId], [TurId]) VALUES (28, 13, 11)
INSERT [dbo].[OyunTur] ([Id], [OyunId], [TurId]) VALUES (29, 13, 12)
SET IDENTITY_INSERT [dbo].[OyunTur] OFF
GO
SET IDENTITY_INSERT [dbo].[Tur] ON 

INSERT [dbo].[Tur] ([Id], [Adi]) VALUES (11, N'FPS')
INSERT [dbo].[Tur] ([Id], [Adi]) VALUES (12, N'RPG')
INSERT [dbo].[Tur] ([Id], [Adi]) VALUES (13, N'Open World')
SET IDENTITY_INSERT [dbo].[Tur] OFF
GO
SET IDENTITY_INSERT [dbo].[Yil] ON 

INSERT [dbo].[Yil] ([Id], [Degeri]) VALUES (16, N'2015')
INSERT [dbo].[Yil] ([Id], [Degeri]) VALUES (17, N'2016')
INSERT [dbo].[Yil] ([Id], [Degeri]) VALUES (18, N'2018')
INSERT [dbo].[Yil] ([Id], [Degeri]) VALUES (19, N'2017')
INSERT [dbo].[Yil] ([Id], [Degeri]) VALUES (20, N'2019')
SET IDENTITY_INSERT [dbo].[Yil] OFF
GO
ALTER TABLE [dbo].[Oyun]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Oyun_dbo.Yil_YilId] FOREIGN KEY([YilId])
REFERENCES [dbo].[Yil] ([Id])
GO
ALTER TABLE [dbo].[Oyun] CHECK CONSTRAINT [FK_dbo.Oyun_dbo.Yil_YilId]
GO
ALTER TABLE [dbo].[OyunTur]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OyunTur_dbo.Oyun_OyunId] FOREIGN KEY([OyunId])
REFERENCES [dbo].[Oyun] ([Id])
GO
ALTER TABLE [dbo].[OyunTur] CHECK CONSTRAINT [FK_dbo.OyunTur_dbo.Oyun_OyunId]
GO
ALTER TABLE [dbo].[OyunTur]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OyunTur_dbo.Tur_TurId] FOREIGN KEY([TurId])
REFERENCES [dbo].[Tur] ([Id])
GO
ALTER TABLE [dbo].[OyunTur] CHECK CONSTRAINT [FK_dbo.OyunTur_dbo.Tur_TurId]
GO
