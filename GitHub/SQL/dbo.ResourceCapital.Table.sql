USE [C80]
GO
/****** Object:  Table [dbo].[ResourceCapital]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceCapital](
	[ResourceId] [int] NOT NULL,
	[CapitalTypesId] [int] NOT NULL,
 CONSTRAINT [PK_ResourceCapital] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[CapitalTypesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ResourceCapital]  WITH CHECK ADD  CONSTRAINT [FK_ResourceCapital_CapitalTypes] FOREIGN KEY([CapitalTypesId])
REFERENCES [dbo].[CapitalTypes] ([Id])
GO
ALTER TABLE [dbo].[ResourceCapital] CHECK CONSTRAINT [FK_ResourceCapital_CapitalTypes]
GO
ALTER TABLE [dbo].[ResourceCapital]  WITH CHECK ADD  CONSTRAINT [FK_ResourceCapital_Resources] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resources] ([Id])
GO
ALTER TABLE [dbo].[ResourceCapital] CHECK CONSTRAINT [FK_ResourceCapital_Resources]
GO
