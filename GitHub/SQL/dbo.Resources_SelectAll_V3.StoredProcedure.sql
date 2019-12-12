USE [C80]
GO
/****** Object:  StoredProcedure [dbo].[Resources_SelectAll_V3]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Resources_SelectAll_V3]
AS

/*
-----------TEST CODE ------------------------

		EXEC dbo.ConsultingTypes_SelectAll;
        EXEC dbo.ContractingTypes_SelectAll;
        EXEC dbo.LocationZoneTypes_SelectAll;
        EXEC dbo.CapitalTypes_SelectAll;
        EXEC dbo.ComplianceTypes_SelectAll;
        EXEC dbo.DemographicTypes_SelectAll;
        EXEC dbo.SpecialTopicTypes_SelectAll;
        EXEC dbo.IndustryTypes_SelectAll;

*/ --------------------------------------------

    BEGIN
        EXEC dbo.ConsultingTypes_SelectAll;
        EXEC dbo.ContractingTypes_SelectAll;
        EXEC dbo.LocationZoneTypes_SelectAll;
        EXEC dbo.CapitalTypes_SelectAll;
        EXEC dbo.ComplianceTypes_SelectAll;
        EXEC dbo.DemographicTypes_SelectAll;
        EXEC dbo.SpecialTopicTypes_SelectAll;
        EXEC dbo.IndustryTypes_SelectAll;
    END;
GO
