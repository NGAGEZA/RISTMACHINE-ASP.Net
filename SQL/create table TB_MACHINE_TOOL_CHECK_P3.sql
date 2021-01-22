create table TB_MACHINE_TOOL_CHECK_P3
(
    ID                           int identity
        constraint PK_TB_MACHINE_TOOL_CHECK_P3
            primary key,
    MC_NO                        varchar(10) not null,
    A1_1_BEFORE_IMPORT           varchar(2),
    A1_1_BEFORE_IMPORT_NOTE      varchar(50),
    A1_1_BEFORE_START_WORK       varchar(2),
    A1_1_BEFORE_START_WORK_NOTE  varchar(50),
    A1_2_BEFORE_IMPORT           varchar(2),
    A1_2_BEFORE_IMPORT_NOTE      varchar(50),
    A1_2_BEFORE_START_WORK       varchar(2),
    A1_2_BEFORE_START_WORK_NOTE  varchar(50),
    A1_A_BEFORE_IMPORT           varchar(2),
    A1_A_BEFORE_IMPORT_NOTE      varchar(50),
    A1_A_BEFORE_START_WORK       varchar(2),
    A1_A_BEFORE_START_WORK_NOTE  varchar(50),
    A1_3_BEFORE_IMPORT           varchar(2),
    A1_3_BEFORE_IMPORT_NOTE      varchar(50),
    A1_3_BEFORE_START_WORK       varchar(2),
    A1_3_BEFORE_START_WORK_NOTE  varchar(50),
    A1_4_BEFORE_IMPORT           varchar(2),
    A1_4_BEFORE_IMPORT_NOTE      varchar(50),
    A1_4_BEFORE_START_WORK       varchar(2),
    A1_4_BEFORE_START_WORK_NOTE  varchar(50),
    A1_5_BEFORE_IMPORT           varchar(2),
    A1_5_BEFORE_IMPORT_NOTE      varchar(50),
    A1_5_BEFORE_START_WORK       varchar(2),
    A1_5_BEFORE_START_WORK_NOTE  varchar(50),
    A1_6_BEFORE_IMPORT           varchar(2),
    A1_6_BEFORE_IMPORT_NOTE      varchar(50),
    A1_6_BEFORE_START_WORK       varchar(2),
    A1_6_BEFORE_START_WORK_NOTE  varchar(50),
    A1_7_BEFORE_IMPORT           varchar(2),
    A1_7_BEFORE_IMPORT_NOTE      varchar(50),
    A1_7_BEFORE_START_WORK       varchar(2),
    A1_7_BEFORE_START_WORK_NOTE  varchar(50),
    A1_8_BEFORE_IMPORT           varchar(2),
    A1_8_BEFORE_IMPORT_NOTE      varchar(50),
    A1_8_BEFORE_START_WORK       varchar(2),
    A1_8_BEFORE_START_WORK_NOTE  varchar(50),
    A1_9_BEFORE_IMPORT           varchar(2),
    A1_9_BEFORE_IMPORT_NOTE      varchar(50),
    A1_9_BEFORE_START_WORK       varchar(2),
    A1_9_BEFORE_START_WORK_NOTE  varchar(50),
    A1_10_BEFORE_IMPORT          varchar(2),
    A1_10_BEFORE_IMPORT_NOTE     varchar(50),
    A1_10_BEFORE_START_WORK      varchar(2),
    A1_10_BEFORE_START_WORK_NOTE varchar(50),
    A1_11_BEFORE_IMPORT          varchar(2),
    A1_11_BEFORE_IMPORT_NOTE     varchar(50),
    A1_11_BEFORE_START_WORK      varchar(2),
    A1_11_BEFORE_START_WORK_NOTE varchar(50),

    A2_1_BEFORE_IMPORT           varchar(2),
    A2_1_BEFORE_IMPORT_NOTE      varchar(50),
    A2_1_BEFORE_START_WORK       varchar(2),
    A2_1_BEFORE_START_WORK_NOTE  varchar(50),

    A2_2_BEFORE_IMPORT           varchar(2),
    A2_2_BEFORE_IMPORT_NOTE      varchar(50),
    A2_2_BEFORE_START_WORK       varchar(2),
    A2_2_BEFORE_START_WORK_NOTE  varchar(50),

    A2_3_BEFORE_IMPORT           varchar(2),
    A2_3_BEFORE_IMPORT_NOTE      varchar(50),
    A2_3_BEFORE_START_WORK       varchar(2),
    A2_3_BEFORE_START_WORK_NOTE  varchar(50),

    A2_4_BEFORE_IMPORT           varchar(2),
    A2_4_BEFORE_IMPORT_NOTE      varchar(50),
    A2_4_BEFORE_START_WORK       varchar(2),
    A2_4_BEFORE_START_WORK_NOTE  varchar(50),

    A2_5_BEFORE_IMPORT           varchar(2),
    A2_5_BEFORE_IMPORT_NOTE      varchar(50),
    A2_5_BEFORE_START_WORK       varchar(2),
    A2_5_BEFORE_START_WORK_NOTE  varchar(50),

    A2_6_BEFORE_IMPORT           varchar(2),
    A2_6_BEFORE_IMPORT_NOTE      varchar(50),
    A2_6_BEFORE_START_WORK       varchar(2),
    A2_6_BEFORE_START_WORK_NOTE  varchar(50),

    A2_7_BEFORE_IMPORT           varchar(2),
    A2_7_BEFORE_IMPORT_NOTE      varchar(50),
    A2_7_BEFORE_START_WORK       varchar(2),
    A2_7_BEFORE_START_WORK_NOTE  varchar(50),

    B1_1_BEFORE_IMPORT           varchar(2),
    B1_1_BEFORE_IMPORT_NOTE      varchar(50),
    B1_1_BEFORE_START_WORK       varchar(2),
    B1_1_BEFORE_START_WORK_NOTE  varchar(50),

    B1_2_BEFORE_IMPORT           varchar(2),
    B1_2_BEFORE_IMPORT_NOTE      varchar(50),
    B1_2_BEFORE_START_WORK       varchar(2),
    B1_2_BEFORE_START_WORK_NOTE  varchar(50),
    
    B1_3_BEFORE_IMPORT           varchar(2),
    B1_3_BEFORE_IMPORT_NOTE      varchar(50),
    B1_3_BEFORE_START_WORK       varchar(2),
    B1_3_BEFORE_START_WORK_NOTE  varchar(50),

    B1_4_BEFORE_IMPORT           varchar(2),
    B1_4_BEFORE_IMPORT_NOTE      varchar(50),
    B1_4_BEFORE_START_WORK       varchar(2),
    B1_4_BEFORE_START_WORK_NOTE  varchar(50),

    B1_5_BEFORE_IMPORT           varchar(2),
    B1_5_BEFORE_IMPORT_NOTE      varchar(50),
    B1_5_BEFORE_START_WORK       varchar(2),
    B1_5_BEFORE_START_WORK_NOTE  varchar(50),

    C1_1_BEFORE_IMPORT           varchar(2),
    C1_1_BEFORE_IMPORT_NOTE      varchar(50),
    C1_1_BEFORE_START_WORK       varchar(2),
    C1_1_BEFORE_START_WORK_NOTE  varchar(50),

    C1_2_BEFORE_IMPORT           varchar(2),
    C1_2_BEFORE_IMPORT_NOTE      varchar(50),
    C1_2_BEFORE_START_WORK       varchar(2),
    C1_2_BEFORE_START_WORK_NOTE  varchar(50),

    C1_3_BEFORE_IMPORT           varchar(2),
    C1_3_BEFORE_IMPORT_NOTE      varchar(50),
    C1_3_BEFORE_START_WORK       varchar(2),
    C1_3_BEFORE_START_WORK_NOTE  varchar(50),

    C1_4_BEFORE_IMPORT           varchar(2),
    C1_4_BEFORE_IMPORT_NOTE      varchar(50),
    C1_4_BEFORE_START_WORK       varchar(2),
    C1_4_BEFORE_START_WORK_NOTE  varchar(50),

    C1_5_BEFORE_IMPORT           varchar(2),
    C1_5_BEFORE_IMPORT_NOTE      varchar(50),
    C1_5_BEFORE_START_WORK       varchar(2),
    C1_5_BEFORE_START_WORK_NOTE  varchar(50),

    C1_6_BEFORE_IMPORT           varchar(2),
    C1_6_BEFORE_IMPORT_NOTE      varchar(50),
    C1_6_BEFORE_START_WORK       varchar(2),
    C1_6_BEFORE_START_WORK_NOTE  varchar(50),

    C1_7_BEFORE_IMPORT           varchar(2),
    C1_7_BEFORE_IMPORT_NOTE      varchar(50),
    C1_7_BEFORE_START_WORK       varchar(2),
    C1_7_BEFORE_START_WORK_NOTE  varchar(50),

    C1_8_BEFORE_IMPORT           varchar(2),
    C1_8_BEFORE_IMPORT_NOTE      varchar(50),
    C1_8_BEFORE_START_WORK       varchar(2),
    C1_8_BEFORE_START_WORK_NOTE  varchar(50),

    C1_9_BEFORE_IMPORT           varchar(2),
    C1_9_BEFORE_IMPORT_NOTE      varchar(50),
    C1_9_BEFORE_START_WORK       varchar(2),
    C1_9_BEFORE_START_WORK_NOTE  varchar(50),

    C1_10_BEFORE_IMPORT           varchar(2),
    C1_10_BEFORE_IMPORT_NOTE      varchar(50),
    C1_10_BEFORE_START_WORK       varchar(2),
    C1_10_BEFORE_START_WORK_NOTE  varchar(50),

    C2_A_BEFORE_IMPORT           varchar(2),
    C2_A_BEFORE_IMPORT_NOTE      varchar(50),
    C2_A_BEFORE_START_WORK       varchar(2),
    C2_A_BEFORE_START_WORK_NOTE  varchar(50),

    C2_B_BEFORE_IMPORT           varchar(2),
    C2_B_BEFORE_IMPORT_NOTE      varchar(50),
    C2_B_BEFORE_START_WORK       varchar(2),
    C2_B_BEFORE_START_WORK_NOTE  varchar(50),

    C2_C_BEFORE_IMPORT           varchar(2),
    C2_C_BEFORE_IMPORT_NOTE      varchar(50),
    C2_C_BEFORE_START_WORK       varchar(2),
    C2_C_BEFORE_START_WORK_NOTE  varchar(50),

    C2_D_BEFORE_IMPORT           varchar(2),
    C2_D_BEFORE_IMPORT_NOTE      varchar(50),
    C2_D_BEFORE_START_WORK       varchar(2),
    C2_D_BEFORE_START_WORK_NOTE  varchar(50),

    C2_E_BEFORE_IMPORT           varchar(2),
    C2_E_BEFORE_IMPORT_NOTE      varchar(50),
    C2_E_BEFORE_START_WORK       varchar(2),
    C2_E_BEFORE_START_WORK_NOTE  varchar(50),

    C2_F_BEFORE_IMPORT           varchar(2),
    C2_F_BEFORE_IMPORT_NOTE      varchar(50),
    C2_F_BEFORE_START_WORK       varchar(2),
    C2_F_BEFORE_START_WORK_NOTE  varchar(50),

    C2_G_BEFORE_IMPORT           varchar(2),
    C2_G_BEFORE_IMPORT_NOTE      varchar(50),
    C2_G_BEFORE_START_WORK       varchar(2),
    C2_G_BEFORE_START_WORK_NOTE  varchar(50),

    C3_A_BEFORE_IMPORT           varchar(2),
    C3_A_BEFORE_IMPORT_NOTE      varchar(50),
    C3_A_BEFORE_START_WORK       varchar(2),
    C3_A_BEFORE_START_WORK_NOTE  varchar(50),

    C3_B_BEFORE_IMPORT           varchar(2),
    C3_B_BEFORE_IMPORT_NOTE      varchar(50),
    C3_B_BEFORE_START_WORK       varchar(2),
    C3_B_BEFORE_START_WORK_NOTE  varchar(50),

    C3_C_BEFORE_IMPORT           varchar(2),
    C3_C_BEFORE_IMPORT_NOTE      varchar(50),
    C3_C_BEFORE_START_WORK       varchar(2),
    C3_C_BEFORE_START_WORK_NOTE  varchar(50),

    C3_D_BEFORE_IMPORT           varchar(2),
    C3_D_BEFORE_IMPORT_NOTE      varchar(50),
    C3_D_BEFORE_START_WORK       varchar(2),
    C3_D_BEFORE_START_WORK_NOTE  varchar(50),

    C3_E_BEFORE_IMPORT           varchar(2),
    C3_E_BEFORE_IMPORT_NOTE      varchar(50),
    C3_E_BEFORE_START_WORK       varchar(2),
    C3_E_BEFORE_START_WORK_NOTE  varchar(50),

    C3_E_CHK1                    BIT,
    C3_E_CHK2                    BIT,
    C3_E_CHK3                    BIT,

    C3_F_BEFORE_IMPORT           varchar(2),
    C3_F_BEFORE_IMPORT_NOTE      varchar(50),
    C3_F_BEFORE_START_WORK       varchar(2),
    C3_F_BEFORE_START_WORK_NOTE  varchar(50),

    C4_A_BEFORE_IMPORT           varchar(2),
    C4_A_BEFORE_IMPORT_NOTE      varchar(50),
    C4_A_BEFORE_START_WORK       varchar(2),
    C4_A_BEFORE_START_WORK_NOTE  varchar(50),

    C4_B_BEFORE_IMPORT           varchar(2),
    C4_B_BEFORE_IMPORT_NOTE      varchar(50),
    C4_B_BEFORE_START_WORK       varchar(2),
    C4_B_BEFORE_START_WORK_NOTE  varchar(50),

    C4_C_BEFORE_IMPORT           varchar(2),
    C4_C_BEFORE_IMPORT_NOTE      varchar(50),
    C4_C_BEFORE_START_WORK       varchar(2),
    C4_C_BEFORE_START_WORK_NOTE  varchar(50),

    D_A_BEFORE_IMPORT           varchar(2),
    D_A_BEFORE_IMPORT_NOTE      varchar(50),
    D_A_BEFORE_START_WORK       varchar(2),
    D_A_BEFORE_START_WORK_NOTE  varchar(50),

    D_B_BEFORE_IMPORT           varchar(2),
    D_B_BEFORE_IMPORT_NOTE      varchar(50),
    D_B_BEFORE_START_WORK       varchar(2),
    D_B_BEFORE_START_WORK_NOTE  varchar(50),

    D_C_BEFORE_IMPORT           varchar(2),
    D_C_BEFORE_IMPORT_NOTE      varchar(50),
    D_C_BEFORE_START_WORK       varchar(2),
    D_C_BEFORE_START_WORK_NOTE  varchar(50),

    D_D_BEFORE_IMPORT           varchar(2),
    D_D_BEFORE_IMPORT_NOTE      varchar(50),
    D_D_BEFORE_START_WORK       varchar(2),
    D_D_BEFORE_START_WORK_NOTE  varchar(50),

    D_E_BEFORE_IMPORT           varchar(2),
    D_E_BEFORE_IMPORT_NOTE      varchar(50),
    D_E_BEFORE_START_WORK       varchar(2),
    D_E_BEFORE_START_WORK_NOTE  varchar(50),

    D_F_BEFORE_IMPORT           varchar(2),
    D_F_BEFORE_IMPORT_NOTE      varchar(50),
    D_F_BEFORE_START_WORK       varchar(2),
    D_F_BEFORE_START_WORK_NOTE  varchar(50),

    D_G_BEFORE_IMPORT           varchar(2),
    D_G_BEFORE_IMPORT_NOTE      varchar(50),
    D_G_BEFORE_START_WORK       varchar(2),
    D_G_BEFORE_START_WORK_NOTE  varchar(50),

    E1_A_BEFORE_IMPORT           varchar(2),
    E1_A_BEFORE_IMPORT_NOTE      varchar(50),
    E1_A_BEFORE_START_WORK       varchar(2),
    E1_A_BEFORE_START_WORK_NOTE  varchar(50),

    E1_B_BEFORE_IMPORT           varchar(2),
    E1_B_BEFORE_IMPORT_NOTE      varchar(50),
    E1_B_BEFORE_START_WORK       varchar(2),
    E1_B_BEFORE_START_WORK_NOTE  varchar(50),

    E2_A_BEFORE_IMPORT           varchar(2),
    E2_A_BEFORE_IMPORT_NOTE      varchar(50),
    E2_A_BEFORE_START_WORK       varchar(2),
    E2_A_BEFORE_START_WORK_NOTE  varchar(50),

    E2_B_BEFORE_IMPORT           varchar(2),
    E2_B_BEFORE_IMPORT_NOTE      varchar(50),
    E2_B_BEFORE_START_WORK       varchar(2),
    E2_B_BEFORE_START_WORK_NOTE  varchar(50),

    E2_C_BEFORE_IMPORT           varchar(2),
    E2_C_BEFORE_IMPORT_NOTE      varchar(50),
    E2_C_BEFORE_START_WORK       varchar(2),
    E2_C_BEFORE_START_WORK_NOTE  varchar(50),

    E3_A_BEFORE_IMPORT           varchar(2),
    E3_A_BEFORE_IMPORT_NOTE      varchar(50),
    E3_A_BEFORE_START_WORK       varchar(2),
    E3_A_BEFORE_START_WORK_NOTE  varchar(50),

    E3_B_BEFORE_IMPORT           varchar(2),
    E3_B_BEFORE_IMPORT_NOTE      varchar(50),
    E3_B_BEFORE_START_WORK       varchar(2),
    E3_B_BEFORE_START_WORK_NOTE  varchar(50),

    E3_C_BEFORE_IMPORT           varchar(2),
    E3_C_BEFORE_IMPORT_NOTE      varchar(50),
    E3_C_BEFORE_START_WORK       varchar(2),
    E3_C_BEFORE_START_WORK_NOTE  varchar(50),

    E3_D_BEFORE_IMPORT           varchar(2),
    E3_D_BEFORE_IMPORT_NOTE      varchar(50),
    E3_D_BEFORE_START_WORK       varchar(2),
    E3_D_BEFORE_START_WORK_NOTE  varchar(50),

    E4_A_BEFORE_IMPORT           varchar(2),
    E4_A_BEFORE_IMPORT_NOTE      varchar(50),
    E4_A_BEFORE_START_WORK       varchar(2),
    E4_A_BEFORE_START_WORK_NOTE  varchar(50),

    E4_B_BEFORE_IMPORT           varchar(2),
    E4_B_BEFORE_IMPORT_NOTE      varchar(50),
    E4_B_BEFORE_START_WORK       varchar(2),
    E4_B_BEFORE_START_WORK_NOTE  varchar(50),

    E4_C_BEFORE_IMPORT           varchar(2),
    E4_C_BEFORE_IMPORT_NOTE      varchar(50),
    E4_C_BEFORE_START_WORK       varchar(2),
    E4_C_BEFORE_START_WORK_NOTE  varchar(50),

    E4_D_BEFORE_IMPORT           varchar(2),
    E4_D_BEFORE_IMPORT_NOTE      varchar(50),
    E4_D_BEFORE_START_WORK       varchar(2),
    E4_D_BEFORE_START_WORK_NOTE  varchar(50),



    



    OPNO_ADD                     varchar(10),
    DATE_ADD                     datetime,
    OPNO_UPDATE                  varchar(10),
    DATE_UPDATE                  datetime,
    STATUS_ID                    int,
    STATUS_NAME                  varchar(50),
    IP                           varchar(10)
)
go

