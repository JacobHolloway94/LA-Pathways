USE [C80]
GO
/****** Object:  UserDefinedTableType [dbo].[SurveySectionsTypeV2]    Script Date: 12/12/2019 2:01:12 PM ******/
CREATE TYPE [dbo].[SurveySectionsTypeV2] AS TABLE(
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](2000) NULL,
	[SortOrder] [int] NULL,
	[TempId] [int] NULL
)
GO
