USE [DBRISTMC]
GO

/****** Object:  Table [dbo].[TB_FILE_ATTACH]    Script Date: 12/16/2019 5:15:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_FILE_ATTACH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MC_NO] [varchar](10) NOT NULL,
	[FILE_ATTACH_NO_GROUP] [int] NULL,
	[FILE_ATTACH_NAME] [varchar](150) NULL,
	[FILE_ATTACH_CONTENT_TYPE] [varchar](50) NULL,
	[FILE_ATTACH_DATA] [varbinary](max) NULL,
	[OPNO_ADD] [varchar](10) NULL,
	[DATE_ADD] [datetime] NULL,
	[OPNO_UPDATE] [varchar](10) NULL,
	[DATE_UPDATE] [datetime] NULL,
	[IP] [varchar](10) NULL,
 CONSTRAINT [PK_TB_FILE_ATTACH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
