USE [DBRISTMC]
GO

/****** Object:  Table [dbo].[TB_MACHINE_DATA]    Script Date: 30/08/2018 5:09:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_MACHINE_DATA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MC_NO] [nvarchar](10) NOT NULL,
	[REGISTER_DATE] [datetime] NULL,
	[REGISTER_DATE_APPROVE] [datetime] NULL,
	[CATEGORY1_MC] [int] NOT NULL,
	[CATEGORY1_MC_OTHER] [nvarchar](50) NULL,
	[CATEGORY2_MC] [int] NOT NULL,
	[CATEGORY2_MC_OTHER] [nvarchar](50) NULL,
	[MAKER] [nvarchar](150) NULL,
	[COUNTRY] [nvarchar](30) NULL,
	[SUPPLIER] [nvarchar](150) NULL,
	[PROVIDER] [nvarchar](150) NULL,
	[TEL] [nchar](10) NULL,
	[TYPE_MC] [nchar](10) NULL,
	[SIZE_HP_MC] [nvarchar](20) NULL,
	[DIVISION] [nvarchar](50) NULL,
	[DEPARTMENT] [nvarchar](50) NULL,
	[SECTION] [nvarchar](50) NULL,
	[MC_NAME] [nvarchar](50) NULL,
	[MC_SERIAL_NO] [nvarchar](50) NULL,
	[DANGER_CHEME_1] [bit] NULL,
	[DANGER_CHEME_2] [bit] NULL,
	[DANGER_CHEME_3] [bit] NULL,
	[DANGER_CHEME_4] [bit] NULL,
	[DANGER_CHEME_NAME] [nvarchar](50) NULL,
	[CAS_NO] [nvarchar](30) NULL,
	[FLAMMABLE] [bit] NULL,
	[CORROSIVE] [bit] NULL,
	[POISON] [bit] NULL,
	[GAS] [bit] NULL,
	[SUBSTANCE_OTHER] [bit] NULL,
	[SUBSTANCE_OTHER_DETAIL] [nvarchar](50) NULL,
	[OBJ_POWER] [bit] NULL,
	[OBJ_HEAT] [bit] NULL,
	[OBJ_NOISE] [bit] NULL,
	[OBJ_VIBRATE] [bit] NULL,
	[OBJ_POISONGAS] [bit] NULL,
	[OBJ_WASTE_WATER] [bit] NULL,
	[OBJ_RAY] [bit] NULL,
	[OBJ_SMOKE] [bit] NULL,
	[OBJ_ELECTRIC_WAVE] [bit] NULL,
	[OBJ_OTHER] [bit] NULL,
	[OBJ_OTHER_DETAIL] [nvarchar](50) NULL,
	[EQUIPMENT_HELMET] [bit] NULL,
	[EQUIPMENT_GLASSES] [bit] NULL,
	[EQUIPMENT_CHEMICAL_MASK] [bit] NULL,
	[EQUIPMENT_BIB_PROTECT_CHEMECAL] [bit] NULL,
	[EQUIPMENT_CHEMICAL_GLOVES] [bit] NULL,
	[EQUIPMENT_HEAT_RESISTANT_GLOVES] [bit] NULL,
	[EQUIPMENT_CUT_PROTECT_GLOVES] [bit] NULL,
	[EQUIPMENT_EYE_COVER] [bit] NULL,
	[EQUIPMENT_FACE_SHIELD] [bit] NULL,
	[EQUIPMENT_DUST_MASK] [bit] NULL,
	[EQUIPMENT_CHEMICAL_PACK] [bit] NULL,
	[EQUIPMENT_ELECTRIC_GLOVES] [bit] NULL,
	[LAW_CHEMECALS] [bit] NULL,
	[LAW_ENVIRONMENTAL] [bit] NULL,
	[LAW_HIGH_PRESSURE_GAS] [bit] NULL,
	[LAW_PREVENT_STOP_FIRE] [bit] NULL,
	[LAW_FACTORY] [bit] NULL,
	[LAW_FUEL_REGULATORY] [bit] NULL,
	[LAW_OTHER] [bit] NULL,
	[LAW_OTHER_DETAIL] [nvarchar](50) NULL,
	[OPNO_ADD] [nvarchar](10) NULL,
	[DATE_ADD] [datetime] NULL,
	[OPNO_UPDATE] [nvarchar](10) NULL,
	[DATE_UPDATE] [datetime] NULL,
	[DOCUMENT_ATTACH_NAME] [nvarchar](50) NULL,
	[DOCUMENT_ATTACH_CONTENT_TYPE] [nvarchar](50) NULL,
	[DOCUMENT_ATTACH_DATA] [varbinary](max) NULL,
	[IMAGE_ATTACH_NAME] [nvarchar](50) NULL,
	[IMAGE_ATTACH_CONTENT_TYPE] [nvarchar](50) NULL,
	[IMAGE_ATTACH_DATA] [varbinary](max) NULL,
	[LAYOUT_ATTACH_NAME] [nvarchar](50) NULL,
	[LAYOUT_ATTACH_CONTENT_TYPE] [nvarchar](50) NULL,
	[LAYOUT_ATTACH_DATA] [varbinary](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

