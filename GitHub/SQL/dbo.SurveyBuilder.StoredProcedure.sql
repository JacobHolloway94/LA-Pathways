USE [C80]
GO
/****** Object:  StoredProcedure [dbo].[SurveyBuilder]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SurveyBuilder] @NewSurveyId                INT OUTPUT, 
                                 @NewSectionId               INT OUTPUT, 
                                 @NewQuestionId              INT OUTPUT, 
                                 @NewQAOId                   INT OUTPUT, 
                                 @Name                       NVARCHAR(100), 
                                 @Description                NVARCHAR(2000), 
                                 @StatusId                   INT, 
                                 @SurveyTypeId               INT, 
                                 @CreatedBy                  INT, 
                                 @SurveySections AS             SURVEYSECTIONSTYPEV2 READONLY, 
                                 @UserId                     INT, 
                                 @SurveyQuestions AS            SURVEYQUESTIONSTYPEV2 READONLY, 
                                 @SurveyQuestionAnswerOption AS SURVEYQUESTIONANSWEROPTIONSTYPE READONLY
AS

/*

DECLARE @NewSurveyId int = 0,
		 @NewSectionId INT = 0, 
		 @NewQuestionId INT = 0,
		 @NewQAOId INT = 0,
		 @UserId int = 2

DECLARE @Name NVARCHAR(100) = 'Main Survey',
        @Description NVARCHAR(2000) = 'This is our main survey.',
        @StatusId INT = 1,
        @SurveyTypeId INT = 1,
        @CreatedBy INT = 2

DECLARE @SurveySections AS SurveySectionsTypeV2
DECLARE @SurveyQuestions AS SurveyQuestionsTypeV2
DECLARE @SurveyQuestionAnswerOption AS SurveyQuestionAnswerOptionsType

-- 3 Sections
-- 5 Questions
-- 8 Answer Options

INSERT INTO @SurveySections ([Title],
							 [Description],
							 [SortOrder],
							 [TempId])
Values ('Section 1', 'This is where the description for section 1 goes.', 1, 105)

INSERT INTO @SurveyQuestions ([UserId],
							 [Question],
							 [HelpText], 
							 [IsRequired], 
							 [IsMultipleAllowed], 
							 [QuestionTypeId], 
							 [StatusId], 
							 [SortOrder],
							 [TempId]) 
Values (2, 'Q1 S1', 'Help me.', 1,0, 4, 1, 1,105)

INSERT INTO @SurveyQuestionAnswerOption ([Text], 
											 [Value], 
											 [AdditionalInfo],
											 SortOrder) 
Values ('A1 Q1 S1', 'TA01', 'This is a helpful resource.', 1)

INSERT INTO @SurveyQuestions ([UserId],
							 [Question],
							 [HelpText], 
							 [IsRequired], 
							 [IsMultipleAllowed], 
							 [QuestionTypeId], 
							 [StatusId], 
							 [SortOrder],
							 [TempId]) 
Values (2, 'Q2 S1', 'Help me.', 1,0, 4, 1, 2, 105)

INSERT INTO @SurveyQuestionAnswerOption ([Text], 
											 [Value], 
											 [AdditionalInfo],
											 SortOrder) 
Values ('A1 Q2 S1', 'TA01', 'This is a helpful resource.', 2)

INSERT INTO @SurveyQuestionAnswerOption ([Text], 
											 [Value], 
											 [AdditionalInfo],
											 SortOrder) 
Values ('A2 Q2 S1', 'TA02', 'This is a super helpful resource.', 2)

INSERT INTO @SurveySections ([Title],
							 [Description],
							 [SortOrder],
							 [TempId])
Values ('Section 2', 'This is where the description would go.', 2, 106)

INSERT INTO @SurveyQuestions ([UserId],
							 [Question],
							 [HelpText], 
							 [IsRequired], 
							 [IsMultipleAllowed], 
							 [QuestionTypeId], 
							 [StatusId], 
							 [SortOrder],
							 [TempId]) 
Values (2, 'Q1 S2', 'Help me.', 1,0, 4, 1, 3,106)

INSERT INTO @SurveyQuestionAnswerOption ([Text], 
											 [Value], 
											 [AdditionalInfo],
											 SortOrder) 
Values ('A1 Q1 S2', 'TA01', 'This is a helpful resource.', 3)

INSERT INTO @SurveyQuestionAnswerOption ([Text], 
											 [Value], 
											 [AdditionalInfo],
											 SortOrder) 
Values ('A2 Q1 S2', 'TA02', 'This is a super helpful resource.', 3)

INSERT INTO @SurveyQuestions ([UserId],
							 [Question],
							 [HelpText], 
							 [IsRequired], 
							 [IsMultipleAllowed], 
							 [QuestionTypeId], 
							 [StatusId], 
							 [SortOrder],
							 [TempId]) 
Values (2, 'Q2 S2', 'Help me.', 1,0, 4, 1, 4,106)

INSERT INTO @SurveyQuestionAnswerOption ([Text], 
											 [Value], 
											 [AdditionalInfo],
											 SortOrder) 
Values ('A1 Q2 S2', 'TA01', 'This is a helpful resource.', 4)

INSERT INTO @SurveySections ([Title],
							 [Description],
							 [SortOrder],
							 [TempId])
Values ('Section 3', 'This is where the description would go.', 2, 107)


INSERT INTO @SurveyQuestions ([UserId], 
							 [Question], 
							 [HelpText], 
							 [IsRequired], 
							 [IsMultipleAllowed], 
							 [QuestionTypeId], 
							 [StatusId], 
							 [SortOrder],
							 [TempId]) 
Values (2, 'Q1 S3', 'Help me, help you.', 0, 1, 2, 1, 5,107)

INSERT INTO @SurveyQuestionAnswerOption ([Text], 
											 [Value], 
											 [AdditionalInfo],
											 SortOrder) 
Values ('A1 Q1 S3', 'TA01', 'This is a helpful resource.', 5)

INSERT INTO @SurveyQuestionAnswerOption ([Text], 
											 [Value], 
											 [AdditionalInfo],
											 SortOrder) 
Values ('A2 Q1 S3', 'TA02', 'This is a super helpful resource.', 5)

EXECUTE dbo.SurveyBuilder   @NewSurveyId OUTPUT,
							@NewSectionId OUTPUT,
							@NewQuestionId OUTPUT,
							@NewQAOId OUTPUT,
							@Name, 
							@Description, 
							@StatusId, 
							@SurveyTypeId, 
							@CreatedBy, 
							@SurveySections, 
							@UserId,
							@SurveyQuestions,
							@SurveyQuestionAnswerOption

*/

     SET XACT_ABORT ON;
     DECLARE @tran NVARCHAR(50)= 'transaction';
    BEGIN TRY
        BEGIN TRANSACTION @tran;
        DECLARE @Date DATETIME2(7)= GETUTCDATE();
        DECLARE @SectionPairs AS SECTIONPAIRSTYPE;
        DECLARE @QuestionPairs AS QUESTIONPAIRTYPE;
        INSERT INTO dbo.Surveys
        ([Name], 
         [Description], 
         [StatusId], 
         [SurveyTypeId], 
         [CreatedBy], 
         [DateCreated], 
         [DateModified]
        )
        VALUES
        (@Name, 
         @Description, 
         @StatusId, 
         @SurveyTypeId, 
         @CreatedBy, 
         @Date, 
         @Date
        );
        SET @NewSurveyId = SCOPE_IDENTITY();
        IF EXISTS
        (
            SELECT 1
            FROM @SurveySections
        )
            BEGIN
                INSERT INTO @SectionPairs
                ([TempId], 
                 [Id]
                )
                EXECUTE dbo.SurveySections_MultipleInsert 
                        @NewSectionId, 
                        @NewSurveyId, 
                        @SurveySections;
        END;
        IF EXISTS
        (
            SELECT 1
            FROM @SurveyQuestions
        )
            BEGIN
                INSERT INTO @QuestionPairs
                (SortOrder, 
                 [Id]
                )
                EXECUTE dbo.SurveyQuestions_MultipleInsert 
                        @NewQuestionId, 
                        @UserId, 
                        @NewSectionId, 
                        @SurveyQuestions, 
                        @SectionPairs;
        END;
        IF EXISTS
        (
            SELECT 1
            FROM @SurveyQuestionAnswerOption
        )
            BEGIN
                EXECUTE dbo.SurveyQuestionAnswerOptions_Builder_InsertMultiple 
                        @NewQAOId, 
                        @CreatedBy, 
                        @QuestionPairs, 
                        @SurveyQuestionAnswerOption;
						Select @NewSurveyId
        END;
        COMMIT TRANSACTION @tran;
    END TRY
    BEGIN CATCH
        IF(XACT_STATE()) = -1
            BEGIN
                PRINT 'The transaction is in an uncommittable state.' + ' Rolling back transaction.';
                ROLLBACK TRANSACTION @Tran;
        END;
        IF(XACT_STATE()) = 1
            BEGIN
                PRINT 'The transaction is committable.' + ' Committing transaction.';
                COMMIT TRANSACTION @Tran;
        END;
        THROW;
    END CATCH;
     SET XACT_ABORT OFF;
GO
