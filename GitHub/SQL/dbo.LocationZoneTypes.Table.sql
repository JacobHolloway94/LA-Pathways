USE [C80]
GO
/****** Object:  Table [dbo].[LocationZoneTypes]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationZoneTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_LocationZoneTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
