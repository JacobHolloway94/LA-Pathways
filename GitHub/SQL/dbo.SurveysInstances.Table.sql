USE [C80]
GO
/****** Object:  Table [dbo].[SurveysInstances]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveysInstances](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyId] [int] NOT NULL,
	[UserId] [int] NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_SurveysInstances] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SurveysInstances] ADD  CONSTRAINT [DF_SurveysInstances_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[SurveysInstances] ADD  CONSTRAINT [DF_SurveysInstances_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[SurveysInstances]  WITH CHECK ADD  CONSTRAINT [FK_Survey_SurveysInstances_SurveyId] FOREIGN KEY([SurveyId])
REFERENCES [dbo].[Surveys] ([Id])
GO
ALTER TABLE [dbo].[SurveysInstances] CHECK CONSTRAINT [FK_Survey_SurveysInstances_SurveyId]
GO
ALTER TABLE [dbo].[SurveysInstances]  WITH CHECK ADD  CONSTRAINT [FK_SurveysInstances_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[SurveysInstances] CHECK CONSTRAINT [FK_SurveysInstances_Users_UserId]
GO
