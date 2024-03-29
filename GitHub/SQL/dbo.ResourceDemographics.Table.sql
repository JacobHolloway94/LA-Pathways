USE [C80]
GO
/****** Object:  Table [dbo].[ResourceDemographics]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceDemographics](
	[ResourceId] [int] NOT NULL,
	[DemographicTypesId] [int] NOT NULL,
 CONSTRAINT [PK_ResourceDemographics] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[DemographicTypesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ResourceDemographics]  WITH CHECK ADD  CONSTRAINT [FK_ResourceDemographics_DemographicTypesId] FOREIGN KEY([DemographicTypesId])
REFERENCES [dbo].[DemographicTypes] ([Id])
GO
ALTER TABLE [dbo].[ResourceDemographics] CHECK CONSTRAINT [FK_ResourceDemographics_DemographicTypesId]
GO
ALTER TABLE [dbo].[ResourceDemographics]  WITH CHECK ADD  CONSTRAINT [FK_ResourceDemographics_ResourcesId] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resources] ([Id])
GO
ALTER TABLE [dbo].[ResourceDemographics] CHECK CONSTRAINT [FK_ResourceDemographics_ResourcesId]
GO
