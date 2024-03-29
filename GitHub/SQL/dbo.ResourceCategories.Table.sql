USE [C80]
GO
/****** Object:  Table [dbo].[ResourceCategories]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceCategories](
	[ResourceId] [int] NOT NULL,
	[ConsultingTypeId] [int] NULL,
	[ContractingTypeId] [int] NULL,
	[LocationZoneTypeId] [int] NULL,
	[IsNetworking] [bit] NOT NULL,
 CONSTRAINT [PK_ResourceCategories] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ResourceCategories] ADD  CONSTRAINT [DF_ResourceCategories_IsNetworking]  DEFAULT ((0)) FOR [IsNetworking]
GO
