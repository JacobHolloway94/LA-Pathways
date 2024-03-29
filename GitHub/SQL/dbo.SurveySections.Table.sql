USE [C80]
GO
/****** Object:  Table [dbo].[SurveySections]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveySections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyId] [int] NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](2000) NULL,
	[SortOrder] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[TempId] [int] NULL,
 CONSTRAINT [PK_SurveysSections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SurveySections] ADD  CONSTRAINT [DF_SurveysSections_DateCreated_1]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[SurveySections] ADD  CONSTRAINT [DF_SurveysSections_DateModified_1]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[SurveySections]  WITH CHECK ADD  CONSTRAINT [FK_SurveysSections_Surveys_Id] FOREIGN KEY([SurveyId])
REFERENCES [dbo].[Surveys] ([Id])
GO
ALTER TABLE [dbo].[SurveySections] CHECK CONSTRAINT [FK_SurveysSections_Surveys_Id]
GO
