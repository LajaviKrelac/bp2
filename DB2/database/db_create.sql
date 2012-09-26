USE [db2]
GO
/****** Object:  User [db2]    Script Date: 09/26/2012 02:20:29 ******/
CREATE USER [db2] FOR LOGIN [db2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[student]    Script Date: 09/26/2012 02:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student](
	[id] [int] NOT NULL,
	[name] [varchar](256) NULL,
	[lname] [varchar](256) NULL,
	[absence] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[professor]    Script Date: 09/26/2012 02:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[professor](
	[id] [int] NOT NULL,
	[name] [varchar](256) NULL,
	[lname] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[course]    Script Date: 09/26/2012 02:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[course](
	[id] [int] NOT NULL,
	[name] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[attends]    Script Date: 09/26/2012 02:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attends](
	[courseId] [int] NOT NULL,
	[studentId] [int] NOT NULL,
	[mark] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[courseId] ASC,
	[studentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report]    Script Date: 09/26/2012 02:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report](
	[id] [int] NOT NULL,
	[professorId] [int] NOT NULL,
	[full_report] [text] NULL,
	[xml] [xml] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teaches]    Script Date: 09/26/2012 02:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teaches](
	[cid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC,
	[sid] ASC,
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FKD7C0D5192FAC3174]    Script Date: 09/26/2012 02:20:29 ******/
ALTER TABLE [dbo].[attends]  WITH CHECK ADD  CONSTRAINT [FKD7C0D5192FAC3174] FOREIGN KEY([studentId])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[attends] CHECK CONSTRAINT [FKD7C0D5192FAC3174]
GO
/****** Object:  ForeignKey [FKD7C0D519B46AF50E]    Script Date: 09/26/2012 02:20:29 ******/
ALTER TABLE [dbo].[attends]  WITH CHECK ADD  CONSTRAINT [FKD7C0D519B46AF50E] FOREIGN KEY([courseId])
REFERENCES [dbo].[course] ([id])
GO
ALTER TABLE [dbo].[attends] CHECK CONSTRAINT [FKD7C0D519B46AF50E]
GO
/****** Object:  ForeignKey [FKC84C553428588BA5]    Script Date: 09/26/2012 02:20:29 ******/
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FKC84C553428588BA5] FOREIGN KEY([professorId])
REFERENCES [dbo].[professor] ([id])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FKC84C553428588BA5]
GO
/****** Object:  ForeignKey [FKAA31CBE32856E735]    Script Date: 09/26/2012 02:20:29 ******/
ALTER TABLE [dbo].[teaches]  WITH CHECK ADD  CONSTRAINT [FKAA31CBE32856E735] FOREIGN KEY([id])
REFERENCES [dbo].[professor] ([id])
GO
ALTER TABLE [dbo].[teaches] CHECK CONSTRAINT [FKAA31CBE32856E735]
GO
/****** Object:  ForeignKey [FKAA31CBE377700510]    Script Date: 09/26/2012 02:20:29 ******/
ALTER TABLE [dbo].[teaches]  WITH CHECK ADD  CONSTRAINT [FKAA31CBE377700510] FOREIGN KEY([cid], [sid])
REFERENCES [dbo].[attends] ([courseId], [studentId])
GO
ALTER TABLE [dbo].[teaches] CHECK CONSTRAINT [FKAA31CBE377700510]
GO
