USE [C80]
GO
/****** Object:  Table [dbo].[ResourceConditions]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceConditions](
	[ResourceId] [int] NOT NULL,
	[Condition] [nvarchar](max) NOT NULL,
	[Query] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ResourceConditions]  WITH CHECK ADD  CONSTRAINT [FK_ResourceConditions_Resource_Id] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resources] ([Id])
GO
ALTER TABLE [dbo].[ResourceConditions] CHECK CONSTRAINT [FK_ResourceConditions_Resource_Id]
GO
