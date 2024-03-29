USE [C80]
GO
/****** Object:  StoredProcedure [dbo].[Resources_Update_V3]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Resources_Update_V3] @Id                 INT, 
                                       @Name               NVARCHAR(200), 
                                       @Headline           NVARCHAR(200), 
                                       @Description        NVARCHAR(1000), 
                                       @Logo               NVARCHAR(255), 
                                       @LocationId         INT, 
                                       @ContactName        NVARCHAR(200), 
                                       @ContactEmail       NVARCHAR(255), 
                                       @Phone              NVARCHAR(50), 
                                       @SiteUrl            NVARCHAR(255), 
                                       @ConsultingTypeId   INT, 
                                       @ContractingTypeId  INT, 
                                       @LocationTypeId INT, 
                                       @SpecialTopicsTypes AS RESOURCESPECIALTOPICSTYPE READONLY, 
                                       @CapitalTypes AS     RESOURCECAPITALTYPE READONLY, 
                                       @ComplianceTypes AS  RESOURCECOMPLIANCETYPE READONLY, 
                                       @DemographicTypes AS RESOURCEDEMOGRAPHICSTYPE READONLY, 
                                       @IndustryTypes AS    RESOURCEINDUSTRYTYPE READONLY
               
AS

/*-------TEST CODE--------

	EXECUTE [dbo].[Resources_SelectAll_WithCatTypes]

    DECLARE	@Id int = 29,
			@Name nvarchar(200) = 'Resources_Update_V3',
			@Headline nvarchar(200) = 'Update Test',
			@Description nvarchar(1000) = 'Update Test',
			@Logo nvarchar(255) = 'Logo',
			@LocationId int = 1,
			@ContactName nvarchar(200) = 'Joshua Bloomburg Jr.',
			@ContactEmail nvarchar(255) = 'sabiola@sabio.com',
			@Phone nvarchar(50) = '949-555-5555',
			@SiteUrl nvarchar(255) = 'sabiola.com',
			@ConsultingTypeId int = 2,
			@ContractingTypeId int = 2,
			@LocationTypeId int = 2,
			@SpecialTopicsTypes AS ResourceSpecialTopicsType,
			@CapitalTypes AS ResourceCapitalType,
			@ComplianceTypes AS ResourceComplianceType,
			@DemographicTypes AS ResourceDemographicsType,
			@IndustryTypes AS ResourceIndustryType

			INSERT into @CapitalTypes ([CapitalTypesId]) values (2)
			INSERT into @CapitalTypes ([CapitalTypesId]) values (3)
			INSERT into @ComplianceTypes ([ComplianceTypesId]) values (2)
			INSERT into @ComplianceTypes ([ComplianceTypesId]) values (3)
			INSERT into @DemographicTypes ([DemographicTypesId]) values (1)
			INSERT into @SpecialTopicsTypes ([SpecialTopicId]) values (1)
			INSERT into @SpecialTopicsTypes ([SpecialTopicId]) values (2)
			INSERT into @SpecialTopicsTypes ([SpecialTopicId]) values (3)
			INSERT into @SpecialTopicsTypes ([SpecialTopicId]) values (4)
			INSERT into @SpecialTopicsTypes ([SpecialTopicId]) values (5)
			INSERT into @SpecialTopicsTypes ([SpecialTopicId]) values (6)
			INSERT into @IndustryTypes ([IndustryTypesId]) values (1)
			INSERT into @IndustryTypes ([IndustryTypesId]) values (2)
			INSERT into @IndustryTypes ([IndustryTypesId]) values (3)

			EXECUTE [dbo].[Resources_SpecialTopics_Update]  
					      @Id, 
                          @SpecialTopicsTypes 
			EXECUTE [dbo].[Resources_CapitalTypes_Update] 
						  @Id,  
                          @CapitalTypes 
			EXECUTE [dbo].[Resources_ComplianceTypes_Update]  
						  @Id, 
                          @ComplianceTypes 
			EXECUTE [dbo].[Resources_DemographicTypes_Update] 
						  @Id, 
                          @DemographicTypes
            EXECUTE [dbo].[Resources_IndustryTypes_Update]  
						  @Id, 
                          @IndustryTypes

	EXECUTE [dbo].[Resources_Update_V3] 
			@Id, 
			@Name, 
			@Headline, 
			@Description, 
			@Logo,
			@LocationId, 
			@ContactName, 
			@ContactEmail,
			@Phone, 
			@SiteUrl,
			@ConsultingTypeId,
			@ContractingTypeId,
			@LocationTypeId,
			@SpecialTopicsTypes,
			@CapitalTypes,
			@ComplianceTypes,
			@DemographicTypes,
			@IndustryTypes

Execute [dbo].[Resources_SelectAll_WithCatTypes]

*/

    ------------------------

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
        WHERE Id = @Id;
        UPDATE [dbo].[ResourceCategories]
          SET 
              [ConsultingTypeId] = @ConsultingTypeId, 
              [ContractingTypeId] = @ContractingTypeId, 
              [LocationZoneTypeId] = @LocationTypeId
        WHERE ResourceId = @Id;
        EXECUTE [dbo].[Resources_SpecialTopics_Update] 
                @Id, 
                @SpecialTopicsTypes;
        EXECUTE [dbo].[Resources_CapitalTypes_Update] 
                @Id, 
                @CapitalTypes;
        EXECUTE [dbo].[Resources_ComplianceTypes_Update] 
                @Id, 
                @ComplianceTypes;
        EXECUTE [dbo].[Resources_DemographicTypes_Update] 
                @Id, 
                @DemographicTypes;
        EXECUTE [dbo].[Resources_IndustryTypes_Update] 
                @Id, 
                @IndustryTypes;
    END;
GO
