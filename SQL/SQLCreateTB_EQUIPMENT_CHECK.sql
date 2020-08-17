USE [DBRISTMC]
GO

/****** Object:  Table [dbo].[TB_EQUIPMENT_CHECK]    Script Date: 12/16/2019 5:15:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_EQUIPMENT_CHECK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MC_NO] [varchar](10) NOT NULL,
	[Title] [int] NOT NULL,
	[Title_No] [int] NOT NULL,
	[Detail_topic] [nvarchar](60) NOT NULL,
	[Number] [int] NOT NULL,
	[IsSelected] [bit] NOT NULL,
	[IP] [varchar](10) NOT NULL,
	[OPNO_ADD] [varchar](10) NOT NULL,
	[DATE_ADD] [datetime] NOT NULL,
	[OPNO_UPDATE] [varchar](10) NOT NULL,
	[DATE_UPDATE] [datetime] NOT NULL,
	[FLAG] [int] NOT NULL,
 CONSTRAINT [PK_TB_EQUIPMENT_CHECK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
