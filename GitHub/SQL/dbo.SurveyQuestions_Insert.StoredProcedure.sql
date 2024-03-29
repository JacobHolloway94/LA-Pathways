USE [C80]
GO
/****** Object:  StoredProcedure [dbo].[SurveyQuestions_Insert]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SurveyQuestions_Insert]
	@Id                INT OUTPUT,
	@UserId            INT, 
	@Question          NVARCHAR(500), 
	@HelpText          NVARCHAR(255), 
	@IsRequired        BIT, 
	@IsMultipleAllowed BIT, 
	@QuestionTypeId    INT, 
	@SectionId         INT, 
	@StatusId          INT, 
	@SortOrder         INT

AS

/*--------------- TEST CODE --------------------		
DECLARE @_id INT,
	@_userId INT = 2,
	@_question NVARCHAR(500) = 'Are you seeking capital for your businesses?',
	@_helpText NVARCHAR(255) = 'Please select necessary capital types.',
	@_isRequired BIT = 1,
	@_isMultipleAllowed BIT = 1,
	@_questionTypeId INT = 2,
	@_sectionId INT = 64,
	@_statusId INT = 2,
	@_sortOrder INT = 1

EXECUTE [dbo].[SurveyQuestions_Insert] 
	@_id,
	@_userId,
	@_question,
	@_helpText,
	@_isRequired,
	@_isMultipleAllowed,
	@_questionTypeId,
	@_sectionId,
	@_statusId,
	@_sortOrder
	

		SELECT *
		FROM [dbo].[SurveyQuestions]
*/

    BEGIN
        INSERT INTO [dbo].[SurveyQuestions]
        ([UserId], 
         [Question], 
         [HelpText], 
         [IsRequired], 
         [IsMultipleAllowed], 
         [QuestionTypeId], 
         [SectionId], 
         [StatusId], 
         [SortOrder]
        )
        VALUES
        (@UserId, 
         @Question, 
         @HelpText, 
         @IsRequired, 
         @IsMultipleAllowed, 
         @QuestionTypeId, 
         @SectionId, 
         @StatusId, 
         @SortOrder
        );
        SET @Id = SCOPE_IDENTITY();
    END;
GO
