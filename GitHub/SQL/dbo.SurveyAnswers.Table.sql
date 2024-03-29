USE [C80]
GO
/****** Object:  Table [dbo].[SurveyAnswers]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyAnswers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InstanceId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[AnswerOptionId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Survey_Answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SurveyAnswers] ADD  CONSTRAINT [DF_Survey_Answers_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[SurveyAnswers] ADD  CONSTRAINT [DF_Survey_Answers_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[SurveyAnswers]  WITH CHECK ADD  CONSTRAINT [FK_SurveyAnswers_SurveyAnswers] FOREIGN KEY([Id])
REFERENCES [dbo].[SurveyAnswers] ([Id])
GO
ALTER TABLE [dbo].[SurveyAnswers] CHECK CONSTRAINT [FK_SurveyAnswers_SurveyAnswers]
GO
ALTER TABLE [dbo].[SurveyAnswers]  WITH CHECK ADD  CONSTRAINT [FK_SurveyAnswers_SurveyAnswers_SQAO_Id] FOREIGN KEY([AnswerOptionId])
REFERENCES [dbo].[SurveyQuestionAnswerOptions] ([Id])
GO
ALTER TABLE [dbo].[SurveyAnswers] CHECK CONSTRAINT [FK_SurveyAnswers_SurveyAnswers_SQAO_Id]
GO
ALTER TABLE [dbo].[SurveyAnswers]  WITH CHECK ADD  CONSTRAINT [FK_SurveyAnswers_SurveyQuestion_QuestionId] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[SurveyQuestions] ([Id])
GO
ALTER TABLE [dbo].[SurveyAnswers] CHECK CONSTRAINT [FK_SurveyAnswers_SurveyQuestion_QuestionId]
GO
ALTER TABLE [dbo].[SurveyAnswers]  WITH CHECK ADD  CONSTRAINT [FK_SurveyAnswers_SurveyQuestionAnswersQptions_AnswerId] FOREIGN KEY([AnswerOptionId])
REFERENCES [dbo].[SurveyQuestionAnswerOptions] ([Id])
GO
ALTER TABLE [dbo].[SurveyAnswers] CHECK CONSTRAINT [FK_SurveyAnswers_SurveyQuestionAnswersQptions_AnswerId]
GO
ALTER TABLE [dbo].[SurveyAnswers]  WITH CHECK ADD  CONSTRAINT [FK_SurveysInstances_SurveyAnswers_InstanceId] FOREIGN KEY([InstanceId])
REFERENCES [dbo].[SurveysInstances] ([Id])
GO
ALTER TABLE [dbo].[SurveyAnswers] CHECK CONSTRAINT [FK_SurveysInstances_SurveyAnswers_InstanceId]
GO
