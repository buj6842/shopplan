CREATE TABLE T_EXPERT
(
    EX_NUM         NUMBER           NOT NULL, 
    EX_ID          VARCHAR2(100)    NULL, 
    EX_PW          VARCHAR2(100)    NULL, 
    EX_NAME        VARCHAR2(100)    NULL, 
    EX_EXPERT_NAME    VARCHAR2(100)    NULL, 
    EX_PHONE_NUM 		VARCHAR(100) NULL,
    EX_EMAIL        VARCHAR2(100)    NULL, 
    EX_GENDER      VARCHAR2(100)    NULL,
    EX_ZIPCODE     VARCHAR2(100)	NULL,
    EX_ADDRESS	   VARCHAR2(100)	NULL,
    EX_ADDRESS_DETAIL VARCHAR2(100)	NULL,
    EX_ADDRESS_ETC	VARCHAR2(100)	NULL,
    CONSTRAINT T_EXPERT_PK PRIMARY KEY (EX_NUM)
);


CREATE SEQUENCE SEQ_E_NUMBER
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

SELECT * FROM T_EXPERT;
SELECT * FROM T_FILES;


CREATE TABLE T_FILES(
	FILE_NAME_EX  VARCHAR2(100) NULL,
	EX_NUM         NUMBER	 NULL,
	 CONSTRAINT  T_FILES_PK PRIMARY KEY(FILE_NAME_EX),
	 CONSTRAINT  T_FILES_FK FOREIGN KEY(EX_NUM ) REFERENCES  T_EXPERT(EX_NUM )
);