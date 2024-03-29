USE [C80]
GO
/****** Object:  UserDefinedTableType [dbo].[SurveyQuestionsTypeV2]    Script Date: 12/12/2019 2:01:12 PM ******/
CREATE TYPE [dbo].[SurveyQuestionsTypeV2] AS TABLE(
	[UserId] [int] NULL,
	[Question] [nvarchar](500) NULL,
	[HelpText] [nvarchar](255) NULL,
	[IsRequired] [bit] NULL,
	[IsMultipleAllowed] [bit] NULL,
	[QuestionTypeId] [int] NULL,
	[StatusId] [int] NULL,
	[SortOrder] [int] NULL,
	[TempId] [int] NULL
)
GO
