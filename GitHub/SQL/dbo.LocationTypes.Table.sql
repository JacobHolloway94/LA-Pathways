USE [C80]
GO
/****** Object:  Table [dbo].[LocationTypes]    Script Date: 12/12/2019 2:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LocationTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LocationTypes]  WITH CHECK ADD  CONSTRAINT [FK_LocationTypes_LocationTypes] FOREIGN KEY([Id])
REFERENCES [dbo].[LocationTypes] ([Id])
GO
ALTER TABLE [dbo].[LocationTypes] CHECK CONSTRAINT [FK_LocationTypes_LocationTypes]
GO
