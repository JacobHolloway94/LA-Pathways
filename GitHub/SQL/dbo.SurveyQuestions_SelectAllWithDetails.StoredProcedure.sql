USE [C80]
GO
/****** Object:  StoredProcedure [dbo].[SurveyQuestions_SelectAllWithDetails]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SurveyQuestions_SelectAllWithDetails] @PageIndex INT, 
                                                        @PageSize  INT
AS

/*------------- TEST CODE --------------

DECLARE @PageIndex int = 0,
		@PageSize int = 6

EXECUTE [dbo].[SurveyQuestions_SelectAllWithDetails]
		@PageIndex,
		@PageSize

*/

    BEGIN
        DECLARE @Offset INT= @PageIndex * @PageSize;
        SELECT SQ.[Id], 
               SQ.[UserId], 
               SQ.[Question], 
               SQ.[HelpText], 
               SQ.[IsRequired], 
               SQ.[IsMultipleAllowed], 
               SQ.[QuestionTypeId], 
               SQ.[SectionId], 
               SQ.[StatusId], 
               SQ.[SortOrder], 
               SQ.[DateCreated], 
               SQ.[DateModified], 
               QT.[Name] AS QuestionTypeName, 
               SS.[Title] AS SectionName, 
               ST.[Name] AS StatusName, 
               totalCount = COUNT(1) OVER()
        FROM dbo.SurveyQuestions AS SQ
             JOIN dbo.QuestionTypes AS QT ON SQ.QuestionTypeId = QT.Id
             JOIN dbo.SurveySections AS SS ON SQ.SectionId = SS.Id
             JOIN dbo.SurveyStatus AS ST ON SQ.StatusId = ST.Id
        ORDER BY SQ.Id
        OFFSET @offset ROWS FETCH NEXT @pageSize ROWS ONLY;
    END;
GO
