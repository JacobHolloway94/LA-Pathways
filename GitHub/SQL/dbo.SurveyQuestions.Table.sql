USE [C80]
GO
/****** Object:  Table [dbo].[SurveyQuestions]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyQuestions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Question] [nvarchar](500) NOT NULL,
	[HelpText] [nvarchar](255) NOT NULL,
	[IsRequired] [bit] NOT NULL,
	[IsMultipleAllowed] [bit] NOT NULL,
	[QuestionTypeId] [int] NOT NULL,
	[SectionId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[TempId] [int] NULL,
 CONSTRAINT [PK_SurveryQuestions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SurveyQuestions] ADD  CONSTRAINT [DF_SurveryQuestions_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[SurveyQuestions] ADD  CONSTRAINT [DF_SurveryQuestions_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[SurveyQuestions]  WITH CHECK ADD  CONSTRAINT [FK_SurveyQuestions_QuestionsTypes_QuestionTypeId] FOREIGN KEY([QuestionTypeId])
REFERENCES [dbo].[QuestionTypes] ([Id])
GO
ALTER TABLE [dbo].[SurveyQuestions] CHECK CONSTRAINT [FK_SurveyQuestions_QuestionsTypes_QuestionTypeId]
GO
ALTER TABLE [dbo].[SurveyQuestions]  WITH CHECK ADD  CONSTRAINT [FK_SurveyQuestions_SurveySection_SectionId] FOREIGN KEY([SectionId])
REFERENCES [dbo].[SurveySections] ([Id])
GO
ALTER TABLE [dbo].[SurveyQuestions] CHECK CONSTRAINT [FK_SurveyQuestions_SurveySection_SectionId]
GO
ALTER TABLE [dbo].[SurveyQuestions]  WITH CHECK ADD  CONSTRAINT [FK_SurveyQuestions_SurveyStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[SurveyStatus] ([Id])
GO
ALTER TABLE [dbo].[SurveyQuestions] CHECK CONSTRAINT [FK_SurveyQuestions_SurveyStatus]
GO
ALTER TABLE [dbo].[SurveyQuestions]  WITH CHECK ADD  CONSTRAINT [FK_SurveyQuestions_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[SurveyQuestions] CHECK CONSTRAINT [FK_SurveyQuestions_Users_UserId]
GO
