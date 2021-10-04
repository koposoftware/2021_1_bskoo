-- ������ 2õ���� 

SELECT * FROM DBA_TEMP_FILES WHERE TABLESPACE_NAME='TEMP';
ALTER TABLESPACE TEMP ADD TEMPFILE '/ORADATA/TEMP02.DBF' SIZE 100M; 

-- �ε��� ����


SELECT CNT, COMPARE_VALUE,
    CASE WHEN CNT>=COMPARE_VALUE THEN ROUND((CNT-COMPARE_VALUE)/COMPARE_VALUE *100,2)
    WHEN  CNT<COMPARE_VALUE THEN ROUND((COMPARE_VALUE-CNT)/COMPARE_VALUE *100,2) END AS RATIO FROM (
SELECT COUNT(*) AS CNT FROM TRANSACTION_HISTORY WHERE HISTORY_DATE BETWEEN TO_CHAR(TRUNC(SYSDATE)) AND TO_CHAR(TRUNC(SYSDATE+1))),(
SELECT COUNT(*) AS COMPARE_VALUE FROM TRANSACTION_HISTORY WHERE HISTORY_DATE BETWEEN TO_CHAR(TRUNC(SYSDATE-1)) AND TO_CHAR(TRUNC(SYSDATE)));

SELECT HISTORY_DATE, SUM(AMOUNT) AS SUB_TOTAL FROM
		(SELECT
		TO_CHAR(TRUNC(HISTORY_DATE), 'MM-DD(DY)') AS HISTORY_DATE , AMOUNT
		FROM TRANSACTION_HISTORY WHERE HISTORY_DATE BETWEEN SYSDATE-7 AND
		SYSDATE) GROUP BY HISTORY_DATE ORDER BY HISTORY_DATE;


DROP INDEX HISTORY_DATE_IDX;
EXPLAIN plan FOR (
SELECT CNT, COMPARE_VALUE,
    CASE WHEN CNT>=COMPARE_VALUE THEN ROUND((CNT-COMPARE_VALUE)/COMPARE_VALUE *100,2)
    WHEN  CNT<COMPARE_VALUE THEN ROUND((COMPARE_VALUE-CNT)/COMPARE_VALUE *100,2) END AS RATIO FROM (
SELECT COUNT(*) AS CNT FROM TRANSACTION_HISTORY WHERE HISTORY_DATE BETWEEN TO_CHAR(TRUNC(SYSDATE)) AND TO_CHAR(TRUNC(SYSDATE+1))),(
SELECT COUNT(*) AS COMPARE_VALUE FROM TRANSACTION_HISTORY WHERE HISTORY_DATE BETWEEN TO_CHAR(TRUNC(SYSDATE-1)) AND TO_CHAR(TRUNC(SYSDATE))));


SELECT * FROM TABLE(dbms_xplan.display);

CREATE INDEX HISTORY_DATE_IDX ON TRANSACTION_HISTORY(HISTORY_DATE);

EXPLAIN plan FOR (
SELECT CNT, COMPARE_VALUE,
    CASE WHEN CNT>=COMPARE_VALUE THEN ROUND((CNT-COMPARE_VALUE)/COMPARE_VALUE *100,2)
    WHEN  CNT<COMPARE_VALUE THEN ROUND((COMPARE_VALUE-CNT)/COMPARE_VALUE *100,2) END AS RATIO FROM (
SELECT COUNT(*) AS CNT FROM TRANSACTION_HISTORY WHERE HISTORY_DATE BETWEEN TO_CHAR(TRUNC(SYSDATE)) AND TO_CHAR(TRUNC(SYSDATE+1))),(
SELECT COUNT(*) AS COMPARE_VALUE FROM TRANSACTION_HISTORY WHERE HISTORY_DATE BETWEEN TO_CHAR(TRUNC(SYSDATE-1)) AND TO_CHAR(TRUNC(SYSDATE))));

SELECT * FROM TABLE(dbms_xplan.display);