USE [C80]
GO
/****** Object:  UserDefinedTableType [dbo].[QuestionPairType]    Script Date: 12/12/2019 2:01:12 PM ******/
CREATE TYPE [dbo].[QuestionPairType] AS TABLE(
	[SortOrder] [int] NULL,
	[Id] [int] NULL
)
GO
