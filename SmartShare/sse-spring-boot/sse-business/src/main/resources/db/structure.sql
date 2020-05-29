CREATE TABLE PARADM_COMPANY
(
    ID                       INT IDENTITY (10000,1) NOT NULL,
    COMPANY_NAME             NVARCHAR(100)          NOT NULL,
    COMPANY_NAME_ENG         NVARCHAR(100)          NULL,
    CODE                     NVARCHAR(150)          NULL,
    OWNER_ID                 INT                    NOT NULL,
    ADDRESS1                 NVARCHAR(150)          NULL,
    ADDRESS2                 NVARCHAR(150)          NULL,
    ADDRESS3                 NVARCHAR(150)          NULL,
    CITY                     NVARCHAR(150)          NULL,
    STATE                    NVARCHAR(150)          NULL,
    POSTAL_CODE              NVARCHAR(50)           NULL,
    AREA_CODE                NVARCHAR(50)           NULL,
    PHONE_NO                 NVARCHAR(50)           NULL,
    FAX_NO                   NVARCHAR(50)           NULL,
    URL                      NVARCHAR(50)           NULL,
    EMAIL                    NVARCHAR(200)          NOT NULL,
    COUNTRY_ID               INT                    NULL,
    PROVINCE_ID              INT                    NULL,
    LEAD_SOURCE_ID           INT                    NULL,
    INDUSTRY_ID              INT                    NULL,
    TURNOVER                 FLOAT                  NULL,
    EMPLOYEE_COUNT           INT                    NULL,
    STOCK_CODE               NVARCHAR(20)           NULL,
    BUSINESS_ACTIVITY        NVARCHAR(500),
    BACKGROUND               NVARCHAR(500),
    USER_DEF_1               NVARCHAR(150)          NULL,
    USER_DEF_2               NVARCHAR(150)          NULL,
    USER_DEF_3               NVARCHAR(150)          NULL,
    USER_DEF_4               NVARCHAR(150)          NULL,
    USER_DEF_5               NVARCHAR(150)          NULL,
    SPECIAL_ALERT_ID         INT                    NULL,
    CLASS_TYPE               VARCHAR(2)             NULL,
    CIC_ID                   INT                    NULL,
    SIC_ID                   INT                    NULL,
    STATUS_ID                INT                    NULL,
    OVERSEAS_BRANCHES        INT                    NULL,
    HK_BRANCHES              INT                    NULL,

    DS_DB_NAME               NVARCHAR(50)           NOT NULL,
    DS_DB_TYPE               INT                    NULL,
    DS_DRIVER_CLASS          NVARCHAR(150)          NULL,
    DS_URL                   NVARCHAR(150)          NULL,
    DS_USERNAME              NVARCHAR(30)           NULL,
    DS_PWD                   NVARCHAR(30)           NULL,
    DS_JNDI_NAME             NVARCHAR(150)          NULL,
    DS_AUTO_COMMIT           NVARCHAR(10)           NULL,
    DS_READ_ONLY             NVARCHAR(10)           NULL,
    DS_MAX_ACTIVE            INT                    NULL,
    DS_MAX_IDLE              INT                    NULL,
    DS_MAX_WAIT              INT                    NULL,
    DS_POOL_PS               NVARCHAR(10)           NULL,
    DS_MAX_OPEN_PS           INT                    NULL,
    DS_TRANSACTION_ISOLATION INT                    NULL,
    DS_LOG_ABANDONED         NVARCHAR(10)           NULL,
    DS_REMOVE_ABANDONED      NVARCHAR(10)           NULL,
    DS_WHILE_IDLE            NVARCHAR(10)           NULL,

    ACTIVE_FLAG              INT                    NULL,
    EXPIRE_DATE              DATETIME               NULL,
    REMIND_DATE              DATETIME               NULL,
    COMPLETE_INIT            INT                    NULL,
    CONFIGURING_PERCENT      INT                    NOT NULL DEFAULT 0,

    LICENSED_USER            INT                    NOT NULL,
    STORAGE_SPACE            INT                    NULL,     --use paradm company default 500GB
    IS_CLOUD                 INT                    NOT NULL, --0 is use other company storage space ,1 is use cloud storage space
    STORAGE_TYPE             INT                    NOT NULL,

    RECORD_STATUS            INT                    NOT NULL,
    UPDATE_COUNT             INT                    NOT NULL,
    CREATOR_ID               INT                    NOT NULL,
    CREATE_DATE              DATETIME               NOT NULL,
    UPDATER_ID               INT                    NOT NULL,
    UPDATE_DATE              DATETIME               NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE (EMAIL)
);

CREATE TABLE SYS_FUNCTION
(
    ID              INT IDENTITY (10000,1) NOT NULL,
    FUNCTION_CODE   NVARCHAR(300)          NOT NULL,
    FUNCTION_LABEL  NVARCHAR(1000),
    FUNCTION_ICON   NVARCHAR(100),
    PARENT_ID       INT                    NOT NULL,
    LINK_URL        NVARCHAR(200)          NULL,
    DISPLAY_SEQ     INT                    NOT NULL,
    MENU_TYPE       INT                    NOT NULL,
    PERMISSION_TYPE NVARCHAR(10)           NOT NULL,
    STATUS          INT                    NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (FUNCTION_CODE)
);

CREATE TABLE SYS_FUNCTION_RULES_PERMISSION
(
    ID          INT IDENTITY (10000,1) NOT NULL,
    RULES_ID    INT                    NOT NULL,
    FUNCTION_ID INT                    NOT NULL,
    PERMISSION  NVARCHAR(100)          NOT NULL, -- FUNCTION OPERATION PERMISSION
    PRIMARY KEY (ID)
);

CREATE TABLE SYS_PARAMETER
(
    ID                      INT IDENTITY (10000,1) NOT NULL,
    PARAMETER_CODE          NVARCHAR(100)          NOT NULL,
    PARAMETER_VALUE         NVARCHAR(200),
    PARAMETER_DEFAULT_VALUE NVARCHAR(200),
    PARAMETER_TYPE          INT                    NOT NULL,
    DESCRIPTION             NVARCHAR(255)          NULL,
    STATUS                  INT                    NOT NULL,
    RECORD_STATUS           INT                    NOT NULL,
    UPDATE_COUNT            INT                    NOT NULL,
    CREATOR_ID              INT                    NOT NULL,
    CREATE_DATE             DATETIME               NOT NULL,
    UPDATER_ID              INT                    NOT NULL,
    UPDATE_DATE             DATETIME               NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (PARAMETER_CODE)
);

CREATE TABLE USER_RECORD
(
    ID                       INT IDENTITY (10000,1) NOT NULL,
    LOGIN_NAME               NVARCHAR(200)          NOT NULL,
    LOGIN_PWD                NVARCHAR(200)          NULL,
    MODIFY_LOGIN_PWD         INT,
    FIRST_NAME               NVARCHAR(100)          NOT NULL,
    LAST_NAME                NVARCHAR(100)          NOT NULL,
    FULL_NAME                NVARCHAR(200)          NOT NULL,
    COMPANY_ID               INT                    NOT NULL,
    EMAIL                    NVARCHAR(200)          NULL,
    FAILED_ATTEMPT           INT                    NULL,
    MAX_ATTEMPT              INT                    NULL,
    CONNECTOR_FAILED_ATTEMPT INT                    NULL,
    PWD_EXPIRY_DAY           INT                    NULL,
    LAST_PWD_UPDATE_DATE     DATETIME               NULL,
    LAST_LOGIN_DATE          DATETIME               NULL,
    PWD_RESET_FLAG           INT DEFAULT '1',
    STATUS                   INT                    NOT NULL,
    USER_TYPE                INT                    NULL,
    USER_LINK_ID             INT                    NULL,
    PREFERENCE               INT                    NULL,
    LOCALE                   NVARCHAR(30)           NULL,
    USER_DEF_1               NVARCHAR(200)          NULL,
    USER_DEF_2               NVARCHAR(200)          NULL,
    USER_DEF_3               NVARCHAR(200)          NULL,
    USER_DEF_4               NVARCHAR(200)          NULL,
    USER_DEF_5               NVARCHAR(200)          NULL,
    TWO_FACTOR_AUTH_ENABLE   INT DEFAULT 0,--0:OFF,1:ON
    LDAP_LOGIN_NAME          NVARCHAR(200)          NULL,
    STORAGE_QUOTA            INT                    NULL,
    NOTIFY_FLAG              INT                    NULL,
    NOTIFY_GROUP_BY_STATUS   INT                    NULL,
    AMDP_SYNC_FLAG           INT                    NULL,
    RECORD_STATUS            INT                    NOT NULL,
    UPDATE_COUNT             INT                    NOT NULL,
    CREATOR_ID               INT                    NOT NULL,
    CREATE_DATE              DATETIME               NOT NULL,
    UPDATER_ID               INT                    NOT NULL,
    UPDATE_DATE              DATETIME               NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE USER_GROUP
(
    ID                   INT IDENTITY (10000,1) NOT NULL,
    OWNER_USER_RECORD_ID INT                    NOT NULL,
    GROUP_TYPE           INT                    NULL,
    GROUP_NAME           NVARCHAR(150)          NOT NULL,
    GROUP_DESC           NVARCHAR(200)          NULL,
    PARENT_GROUP_ID      INT                    NULL,
    RECORD_STATUS        INT                    NOT NULL,
    UPDATE_COUNT         INT                    NOT NULL,
    CREATOR_ID           INT                    NOT NULL,
    CREATE_DATE          DATETIME               NOT NULL,
    UPDATER_ID           INT                    NOT NULL,
    UPDATE_DATE          DATETIME               NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE USER_ROLE
(
    ID            INT IDENTITY (10000,1) NOT NULL,
    ROLE_TYPE     INT                    NOT NULL,
    ROLE_NAME     NVARCHAR(150)          NOT NULL,
    ROLE_DESC     NVARCHAR(200)          NULL,
    RECORD_STATUS INT                    NOT NULL,
    UPDATE_COUNT  INT                    NOT NULL,
    CREATOR_ID    INT                    NOT NULL,
    CREATE_DATE   DATETIME               NOT NULL,
    UPDATER_ID    INT                    NOT NULL,
    UPDATE_DATE   DATETIME               NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE MTM_USER_RECORD_USER_GROUP
(
    ID             INT IDENTITY (10000,1) NOT NULL,
    USER_RECORD_ID INT                    NOT NULL,
    USER_GROUP_ID  INT                    NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE MTM_USER_RECORD_USER_ROLE
(
    ID             INT IDENTITY (10000,1) NOT NULL,
    USER_RECORD_ID INT                    NOT NULL,
    USER_ROLE_ID   INT                    NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE USER_RULES
(
    ID            INT IDENTITY (10000,1) NOT NULL,
    OBJECT_ID     INT                    NOT NULL,
    RULES_TYPE    INT                    NOT NULL, -- 0:USER, 1:GROUP 2ROLE
    RECORD_STATUS INT                    NOT NULL,
    UPDATE_COUNT  INT                    NOT NULL,
    CREATOR_ID    INT                    NOT NULL,
    CREATE_DATE   DATETIME               NOT NULL,
    UPDATER_ID    INT                    NOT NULL,
    UPDATE_DATE   DATETIME               NOT NULL,
    PRIMARY KEY (ID)
);
CREATE NONCLUSTERED INDEX IDX_RULES_OBJECT_ID ON USER_RULES (OBJECT_ID);

CREATE TABLE SMARTSHARE_LOC_MASTER
(
    ID            INT IDENTITY (10000,1) NOT NULL,
    LOC_NAME      NVARCHAR(90)           NULL,
    LOC_PATH      NVARCHAR(100)          NOT NULL,
    SEGMENT_NO    INT,
    DESCRIPTION   NVARCHAR(255)          NULL,
    RECORD_STATUS INT                    NOT NULL,
    UPDATE_COUNT  INT                    NOT NULL,
    CREATOR_ID    INT                    NOT NULL,
    CREATE_DATE   DATETIME               NOT NULL,
    UPDATER_ID    INT                    NOT NULL,
    UPDATE_DATE   DATETIME               NOT NULL,
    PRIMARY KEY (ID)
);
