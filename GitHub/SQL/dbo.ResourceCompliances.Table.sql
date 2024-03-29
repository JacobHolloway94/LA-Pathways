USE [C80]
GO
/****** Object:  Table [dbo].[ResourceCompliances]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceCompliances](
	[ResourceId] [int] NOT NULL,
	[ComplianceTypesId] [int] NOT NULL,
 CONSTRAINT [PK_ResourceCompliances] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[ComplianceTypesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ResourceCompliances]  WITH CHECK ADD  CONSTRAINT [FK_ResourceCompliances_ComplianceTypes] FOREIGN KEY([ComplianceTypesId])
REFERENCES [dbo].[ComplianceTypes] ([Id])
GO
ALTER TABLE [dbo].[ResourceCompliances] CHECK CONSTRAINT [FK_ResourceCompliances_ComplianceTypes]
GO
ALTER TABLE [dbo].[ResourceCompliances]  WITH CHECK ADD  CONSTRAINT [FK_ResourceCompliances_Resources] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resources] ([Id])
GO
ALTER TABLE [dbo].[ResourceCompliances] CHECK CONSTRAINT [FK_ResourceCompliances_Resources]
GO
