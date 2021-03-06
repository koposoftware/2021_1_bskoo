DROP TABLE PCA_MEMBER;
CREATE TABLE PCA_MEMBER(
    PCA_DATE DATE DEFAULT SYSDATE,
    MEMBER_NO NUMBER(10),
    CLUSTER_NO NUMBER(10)
);

SELECT * FROM PCA_MEMBER;
DELETE FROM PCA_MEMBER;

DROP TABLE PCA_COMPONENt;
CREATE TABLE PCA_COMPONENT(
    PCA_DATE DATE DEFAULT SYSDATE,
    CLUSTER_NO NUMBER(10),
    CATEGORY VARCHAR2(100)
);


SELECT * FROM PCA_COMPONENT;

commit;

DROP TABLE PCA_COMPONENT;

DELETE FROM PCA_COMPONENT;

SELECT * FROM TRANSACTION_HISTORY ORDER BY HISTORY_NO DESC;
commit;
UPDATE TRANSACTION_HISTORY SET HISTORY_DATE= HISTORY_DATE - (365*3) WHERE HISTORY_DATE > TO_DATE('23/01/01');

CREATE SEQUENCE MAIL_LOG_SEQ;
DROP SEQUENCE MAIL_LOG_SEQ;

DROP TABLE MAIL_LOG;

SELECT * FROM MAIL_LOG;
CREATE TABLE MAIL_LOG(
    MAIL_NO NUMBER(10) DEFAULT MAIL_LOG_SEQ.NEXTVAL CONSTRAINT MAIL_LOG_PK PRIMARY KEY,
    SENDING_DATE DATE DEFAULT SYSDATE NOT NULL,
    CLUSTER_NO NUMBER(10) NOT NULL,
    CARD_CODE VARCHAR2(10) NOT NULL,
    TOTAL NUMBER(10) NOT NULL,
    SENDING_SUCCESS NUMBER(10) NOT NULL);
    
INSERT INTO MAIL_LOG(CARD_CODE, TOTAL, SENDING_SUCCESS) VALUES();
DROP TABLE MAIL_LOG;
INSERT INTO MAIL_LOG(CARD_CODE, TOTAL, SENDING_SUCCESS) VALUES(1001, 1, 1);

SELECT L.MAIL_NO, TO_CHAR(L.SENDING_DATE, 'YYYY-MM-DD HH24:MI:SS') AS SENDING_DATE,  C.CARD_NAME, L.CLUSTER_NO, L.TOTAL, L.SENDING_SUCCESS, (L.TOTAL-L.SENDING_SUCCESS) AS SENDING_FAIL FROM CARD C, MAIL_LOG L WHERE C.CARD_CODE = L.CARD_CODE ORDER BY MAIL_NO DESC;

SELECT * FROM MAIL_LOG;


SELECT * FROM CARD

