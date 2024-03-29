USE [C80]
GO
/****** Object:  Table [dbo].[ResourceIndustries]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceIndustries](
	[ResourceId] [int] NOT NULL,
	[IndustryTypesId] [int] NOT NULL,
 CONSTRAINT [PK_ResourceIndustries] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[IndustryTypesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ResourceIndustries]  WITH CHECK ADD  CONSTRAINT [FK_IndustryTypeId_ResourceIndustries_IndustryTypesId] FOREIGN KEY([IndustryTypesId])
REFERENCES [dbo].[IndustryTypes] ([Id])
GO
ALTER TABLE [dbo].[ResourceIndustries] CHECK CONSTRAINT [FK_IndustryTypeId_ResourceIndustries_IndustryTypesId]
GO
ALTER TABLE [dbo].[ResourceIndustries]  WITH CHECK ADD  CONSTRAINT [FK_ResourceId_Resource_Id] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resources] ([Id])
GO
ALTER TABLE [dbo].[ResourceIndustries] CHECK CONSTRAINT [FK_ResourceId_Resource_Id]
GO
