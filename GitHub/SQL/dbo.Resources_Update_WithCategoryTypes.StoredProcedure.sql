USE [C80]
GO
/****** Object:  StoredProcedure [dbo].[Resources_Update_WithCategoryTypes]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Resources_Update_WithCategoryTypes] 
			@Id int,
			@Name nvarchar(200),
			@Headline nvarchar(200),
			@Description nvarchar(1000),
			@Logo nvarchar(255),
			@LocationId int,
			@ContactName nvarchar(200),
			@ContactEmail nvarchar(255),
			@Phone  nvarchar(50),
			@SiteUrl nvarchar(255),
			@ConsultingTypeId int,
			@ContractingTypeId int,
			@LocationZoneTypeId int, 
			@SpecialTopics AS ResourceSpecialTopicsType READONLY,
			@CapitalTypes AS ResourceCapitalType READONLY


		
AS

/*-------TEST CODE--------

    Declare	@Id int = 7,
			@Name nvarchar(200) = 'Sabio Resource',
			@Headline nvarchar(200) = 'Update Test',
			@Description nvarchar(1000) = 'Update Test',
			@Logo nvarchar(255) = 'Logo',
			@LocationId int = 1,
			@ContactName nvarchar(200) = 'Jake',
			@ContactEmail nvarchar(255) = 'sabiola@sabio.com',
			@Phone nvarchar(50) = '949-555-5555',
			@SiteUrl nvarchar(255) = 'sabiola.com'
Select * 
FROM dbo.Resources 
WHERE Id = @Id

	Execute [dbo].[Resources_Update_WithCategoryTypes]  
			@Id, 
			@Name, 
			@Headline, 
			@Description, 
			@Logo,
			@LocationId, 
			@ContactName, 
			@ContactEmail,
			@Phone, 
			@SiteUrl

Select * 
FROM dbo.Resources 
WHERE Id = @Id

*/------------------------
BEGIN
UPDATE [dbo].[Resources] 
	          SET  
				[Name] = @Name,
				[Headline] = @Headline,
				[Description] = @Description,
				[Logo] = @Logo,
				[LocationId] = @LocationId,
				[ContactName] = @ContactName,
				[ContactEmail] = @ContactEmail,
				[Phone] = @Phone,
				[SiteUrl] = @SiteUrl
			  WHERE Id = @Id
			  
UPDATE [dbo].[ResourceCategories]
		SET 
		[ConsultingTypeId] = @ConsultingTypeId,
		[ContractingTypeId] = @ContractingTypeId,
		[LocationZoneTypeId] = @LocationZoneTypeId
		WHERE ResourceId = @Id

UPDATE [dbo]. [ResourceSpecialTopics]
		SET 
		[SpecialTopicId] = (SELECT [SpecialTopicId] 
							from @SpecialTopics)
		WHERE ResourceId = @Id
END


GO
