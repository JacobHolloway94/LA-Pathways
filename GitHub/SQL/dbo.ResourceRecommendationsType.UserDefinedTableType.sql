USE [C80]
GO
/****** Object:  UserDefinedTableType [dbo].[ResourceRecommendationsType]    Script Date: 12/12/2019 2:01:12 PM ******/
CREATE TYPE [dbo].[ResourceRecommendationsType] AS TABLE(
	[ResourceId] [int] NULL,
	[WhereString] [nvarchar](100) NULL
)
GO
