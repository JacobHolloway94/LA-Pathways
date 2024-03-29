USE [C80]
GO
/****** Object:  Table [dbo].[ResourceSpecialTopics]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceSpecialTopics](
	[ResourceId] [int] NOT NULL,
	[SpecialTopicId] [int] NOT NULL,
 CONSTRAINT [PK_ResourceSpecialTopics] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[SpecialTopicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ResourceSpecialTopics]  WITH CHECK ADD  CONSTRAINT [FK_ResourceSpecialTopics_ResourceId] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resources] ([Id])
GO
ALTER TABLE [dbo].[ResourceSpecialTopics] CHECK CONSTRAINT [FK_ResourceSpecialTopics_ResourceId]
GO
ALTER TABLE [dbo].[ResourceSpecialTopics]  WITH CHECK ADD  CONSTRAINT [FK_ResourceSpecialTopics_SpecialTopicTypes] FOREIGN KEY([SpecialTopicId])
REFERENCES [dbo].[SpecialTopicTypes] ([Id])
GO
ALTER TABLE [dbo].[ResourceSpecialTopics] CHECK CONSTRAINT [FK_ResourceSpecialTopics_SpecialTopicTypes]
GO
