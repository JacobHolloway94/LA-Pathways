USE [C80]
GO
/****** Object:  StoredProcedure [dbo].[SurveyQuestions_MultipleInsert]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SurveyQuestions_MultipleInsert] @Id              INT OUTPUT, 
                                                  @UserId          INT, 
                                                  @SectionId       INT, 
                                                  @SurveyQuestions AS SURVEYQUESTIONSTYPEV2 READONLY, 
                                                  @SectionPairs AS    SectionPairsType READONLY
AS

/*--------------- TEST CODE --------------------		
DECLARE @Id INT = 0, @UserId INT = 2, @SectionId INT = 9, @SurveyQuestions AS SURVEYQUESTIONSTYPEV2;
INSERT INTO @SurveyQuestions
([Question], 
 [HelpText], 
 [IsRequired], 
 [IsMultipleAllowed], 
 [QuestionTypeId], 
 [StatusId], 
 [SortOrder],
 [TempId])
VALUES ('What is your Question?','This is the help text.',1,0,2,1,1,43)
INSERT INTO @SurveyQuestions
([Question], 
 [HelpText], 
 [IsRequired], 
 [IsMultipleAllowed], 
 [QuestionTypeId], 
 [StatusId], 
 [SortOrder],
 [TempId])
VALUES ('What is your other Question?','This is the new help text.',1,0,2,1,1,12)
EXECUTE [dbo].[SurveyQuestions_MultipleInsert] 
        @Id OUT, 
        @UserId, 
		@SectionId,
        @SurveyQuestions
SELECT *
FROM [dbo].[SurveyQuestions];
*/

    BEGIN
        DECLARE @Date DATETIME2(7)= GETUTCDATE();
        INSERT INTO [dbo].[SurveyQuestions]
        ([UserId], 
         [Question], 
         [HelpText], 
         [IsRequired], 
         [IsMultipleAllowed], 
         [QuestionTypeId], 
         [SectionId], 
         [StatusId], 
         [SortOrder], 
         [DateCreated], 
         [DateModified], 
         [TempId]
        )
               SELECT @UserId, 
                      SQ.[Question], 
                      SQ.[HelpText], 
                      SQ.[IsRequired], 
                      SQ.[IsMultipleAllowed], 
                      SQ.[QuestionTypeId], 
                      SP.Id, 
                      SQ.[StatusId], 
                      SQ.[SortOrder], 
                      @Date, 
                      @Date, 
                      SQ.TempId
               FROM @SurveyQuestions AS SQ
                    INNER JOIN @SectionPairs AS SP ON SP.TempId = SQ.TempId;
        SELECT SQ.SortOrder, 
               SQ.Id
        FROM dbo.SurveyQuestions AS SQ
             INNER JOIN @SectionPairs AS SP ON SP.TempId = SQ.TempId
        WHERE SectionId = SP.Id;
    END;
GO
