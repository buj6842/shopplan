INSERT INTO SCOTT.TBL_USER
(USER_NUM, USER_ID, USER_PW, USER_PHONE_NUMBER, USER_NAME, USER_EMAIL, USER_LIVINGROOM_C, USER_KITCHEN_C, USER_ROOM_C, USER_AGE, USER_GENDER, USER_ZIPCODE, USER_ADDRESS, USER_ADDRESS_DETAIL, USER_ADDRESS_ETC, ADMIN)
VALUES(0, '', '', '', '', '', 'X', 'X', 'X', 0, '', '', '', '', '', 0);

CREATE TABLE TBL_USER
(
    USER_NUM               NUMBER          NOT NULL, 
    USER_ID                VARCHAR2(200)    NULL, 
    USER_PW                VARCHAR2(200)    NULL, 
    USER_PHONE_NUMBER      VARCHAR2(200)    NULL, 
    USER_NAME              VARCHAR2(200)    NULL, 
    USER_EMAIL             VARCHAR2(200)    NULL, 
    USER_LIVINGROOM_C      VARCHAR2(200)    DEFAULT 'X', 
    USER_KITCHEN_C         VARCHAR2(200)    DEFAULT 'X', 
    USER_ROOM_C              VARCHAR2(200)  DEFAULT 'X',
    USER_AGE NUMBER NULL,
    USER_GENDER            VARCHAR2(200)    NULL, 
    USER_ZIPCODE			VARCHAR2(200)  NULL,
    USER_ADDRESS           VARCHAR2(200)    NULL, 
    USER_ADDRESS_DETAIL    VARCHAR2(200)    NULL, 
    USER_ADDRESS_ETC       VARCHAR2(200)    NULL, 
    ADMIN                  NUMBER           NULL, 
    CONSTRAINT TBL_USER_PK PRIMARY KEY (USER_NUM)
);

SELECT * FROM TBL_USER;
INSERT INTO SCOTT.TBL_USER
(USER_NUM, USER_ID, USER_PW, USER_PHONE_NUMBER, USER_NAME, USER_EMAIL, USER_LIVINGROOM_C, USER_KITCHEN_C, USER_ROOM_C, USER_AGE, USER_GENDER, USER_ZIPCODE, USER_ADDRESS, USER_ADDRESS_DETAIL, USER_ADDRESS_ETC, ADMIN)
VALUES(1, 'parrot', '1234', '01071266849', '변의진', 'buj6842@naver.com', 'X', 'X', 'X', 25, '남자', '1234', '수원시', '401호', '구천동', 0);

UPDATE TBL_USER
SET  USER_PW='', USER_PHONE_NUMBER='', USER_NAME='', USER_EMAIL='', USER_LIVINGROOM_C='X', USER_KITCHEN_C='X', USER_ROOM_C='X', USER_AGE=0, USER_GENDER='', USER_ZIPCODE='', USER_ADDRESS='', USER_ADDRESS_DETAIL='', USER_ADDRESS_ETC='', ADMIN=0
WHERE USER_ID =0;


CREATE SEQUENCE SEQ_USERNUM
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

DROP TABLE TBL_USER;