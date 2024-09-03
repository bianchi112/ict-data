-- day9_ddl_view.sql

-- VIEW (��)---------------------------------------------
-- STORED QUERY : SELECT ������ �����ϴ� ��ü
-- VIRTUAL TABLE : ����� SELECT �������� ������ �Ǹ鼭 ����並 ������
-- ������ : 
-- 1. ���ȿ� ���� : �������� ������ �ʰ� �ϰ�, ����丸 ���̰� ��
-- 2. �����ϰ� �� �������� ���� �������� �ʰ�, ����� �������� ������
--       => ���� �ӵ��� ����, ���� ���౸���� ������
-- ��ɱ��� : CREATE VIEW, DROP VIEW
--      ALTER VIEW ����, ALTER VIEW ��ſ� CREATE OR REPLACE VIEW �� �����
--  �ۼ����� : 
/*
CREATE [OR PEPLACE] VIEW ���̸�
AS
��������
[WITH READ ONLY CONSTRAINT �����̸�]
[WITH CHECK OPTION CONSTRAINT �����̸�];
*/

CREATE VIEW V_EMP
AS 
SELECT * FROM EMPLOYEE; -- ���� ����� ���� �߻��ϸ�

-- �����ڰ���(SYSTEM/ORACLE)���� ���� �ο�����
--GRANT CREATE VIEW TO c##student;

-- �� ������ �����ϴ� ��ųʸ� : USER_VIEWS, USER_CATALOG, USER_OBJECTS
-- ��ųʸ��� ���� Ȯ��
DESC USER_VIEWS;

SELECT VIEW_NAME, TEXT_LENGTH, TEXT, READ_ONLY
FROM USER_VIEWS
WHERE VIEW_NAME = 'V_EMP';

CREATE VIEW V_EMP_DEPT90
AS
SELECT EMP_NAME, DEPT_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
LEFT OUTER JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
WHERE DEPT_ID = '90';

-- �� ��� : FROM ���� ���̺� ��ſ� ����� => �ζ��κ� ó�� �̿���
SELECT * FROM V_EMP_DEPT90;

-- �ǽ� : 
-- ���޸��� '���'�� ��� �������� �����, �μ���, ���޸��� ��ȸ�ϴ� ������ ��� �����Ͻÿ�
-- ���̸� : V_EMP_DEPT_JOB
CREATE VIEW V_EMP_DEPT_JOB
AS
SELECT EMP_NAME, DEPT_NAME, JOB_TITLE
FROM EMPLOYEE 
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
WHERE JOB_TITLE = '���';

-- ����Ȯ��
SELECT * FROM V_EMP_DEPT_JOB;

-- ��ųʸ� Ȯ�� : 
-- �� ��ü�� ���̺� ��üó�� ��ȸ�� ���� ����
SELECT COLUMN_NAME, DATA_TYPE, NULLABLE
FROM USER_TAB_COLS
WHERE TABLE_NAME = 'V_EMP_DEPT_JOB';

-- �� ������ �������� SELECT �׸��� �÷� ��Ī�� ���� ������ ���� ����
-- SELECT �׸� ���� �� ��Ī ó���ؾ� ��
CREATE OR REPLACE VIEW V_EMP_DEPT_JOB (ENAME, DNAME, JTITLE)
AS
SELECT EMP_NAME, DEPT_NAME, JOB_TITLE
FROM EMPLOYEE 
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
WHERE JOB_TITLE = '���';

SELECT * FROM V_EMP_DEPT_JOB;

-- �������� �κп��� ��Ī �����ص� ��
CREATE OR REPLACE VIEW V_EMP_DEPT_JOB
AS
SELECT EMP_NAME �̸�, DEPT_NAME �μ���, JOB_TITLE
FROM EMPLOYEE 
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
WHERE JOB_TITLE = '���';

SELECT * FROM V_EMP_DEPT_JOB;

-- ���� : 
-- �������� SELECT ���� �Լ������� �ݵ�� ��Ī �ٿ��� ��
CREATE OR REPLACE VIEW V_EMP
AS
SELECT EMP_NAME,
       DECODE(SUBSTR(EMP_NO, 8, 1), '1', '����', '3', '����', '����') ����,
       ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) �ٹ����
FROM EMPLOYEE;

CREATE OR REPLACE VIEW V_EMP ("Ename", "Gender", "Years")
AS
SELECT EMP_NAME,
       DECODE(SUBSTR(EMP_NO, 8, 1), '1', '����', '3', '����', '����'),
       ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) 
FROM EMPLOYEE;

SELECT * FROM V_EMP;

-- �� �������� ----------------------------------------
-- WITH READ ONLY : �並 �̿��� DML �۾� �� �� (�б����� ��)
-- WITH CHECK OPTION : �並 ���̺�ó�� ����ؼ� DML ������ �� ����
--                     ���̽����̺��� 1���� ���������� ������
--                     ���̽����̺� DML �� ����� => DELTE ���� ������� ����
--                     => �������� ������ �����ؼ� ���ѵ� DML(INSERT, UPDATE) ������ �� ����
-- �� �������ǵ� CONSTRAINT �̸����� ������ �� ����

-- WITH READ ONLY:
CREATE OR REPLACE VIEW V_EMP
AS
SELECT * FROM EMPLOYEE
WITH READ ONLY;

-- DML ��� Ȯ�� : 
INSERT INTO V_EMP (EMP_ID, EMP_NAME, EMP_NO)
VALUES ('666',  '�׽���', '901225-1234567'); -- ����

DELETE FROM V_EMP; -- ERROR

UPDATE V_EMP
SET DEPT_ID = NULL; -- ERROR

SELECT * FROM V_EMP;

-- WITH CHECK OPTION : 
-- DELETE ���� ���� ���� ��� ������
-- INSERT, UPDATE ���� ���ǿ� ���� �۾��� ���ѵǾ� ����� �� ����
CREATE OR REPLACE VIEW V_EMP
AS
SELECT EMP_ID, EMP_NAME, EMP_NO, MARRIAGE
FROM EMPLOYEE
WHERE MARRIAGE = 'N'
WITH CHECK OPTION; -- DML ��� ����

SELECT * FROM V_EMP;

INSERT INTO V_EMP (EMP_ID, EMP_NAME, EMP_NO, MARRIAGE)
VALUES ('666', '�׽���', '991225-1234567', 'Y'); -- ERROR
-- ���������� ���ǰ� ��ġ�ϴ� ���� ����� �� ���� 

UPDATE V_EMP
SET MARRIAGE = 'Y'; -- ERROR

INSERT INTO V_EMP (EMP_ID, EMP_NAME, EMP_NO, MARRIAGE)
VALUES ('666', '�׽���', '991225-1234567', 'N'); -- ���̽����̺� �߰� ��ϵ�

SELECT * FROM EMPLOYEE;

SELECT * FROM V_EMP;

ROLLBACK;

-- SELECT �������� ����� �䰴ü�� �ٸ� SELECT ���� FROM  ����  �ζ��κ�� ����� �� ����
-- �ζ��κ� : FROM ���� ���� ���������� ����並 ����
--           FROM (��������) ��Ī => FORM ���̸�

-- �ζ��κ� ��� �� 1:
CREATE OR REPLACE VIEW V_EMP_INFO
AS
SELECT EMP_NAME, DEPT_NAME, JOB_TITLE
FROM EMPLOYEE 
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID);

SELECT * FROM V_EMP_INFO;

-- �䰴ü�� ���̺� ��ſ� �����
SELECT EMP_NAME
FROM V_EMP_INFO -- ���̺� ��� �� ���
WHERE DEPT_NAME = '�ؿܿ���1��'
AND JOB_TITLE =  '���';

-- �ζ��κ� ��� �� 2 : 
CREATE OR REPLACE VIEW V_DEPT_SAL ("Did", "Dname", "Davg")
AS
SELECT NVL(DEPT_ID, '00'),
       NVL(DEPT_NAME, 'NONAME'),
       ROUND(AVG(SALARY), -3)
FROM DEPARTMENT
RIGHT JOIN EMPLOYEE USING (DEPT_ID)
GROUP BY DEPT_ID, DEPT_NAME;

-- �並 �ζ��κ�� ���� �信�� ���� ��Ī(�÷�ó�� ����) ���� ""  ���� ��Ī�� ���ÿ��� "" ����� ��
SELECT "Dname", "Davg"
FROM V_DEPT_SAL
WHERE "Davg" > 3000000;

SELECT DNAME, DAVG
FROM V_DEPT_SAL
WHERE DAVG > 3000000; -- ���� : (DAVG != "Davg")

-- �� ���� ���� ������ ����
-- ALTER VIEW ���̸� ����
-- �� ������ ���ϸ�, ���� ��и� �����ϰ� �ٽ� �������
-- �Ǵ� CREATE OR REPLACE VIEW �����

-- �� ����
-- DROP VIEW ���̸�;
DROP VIEW V_EMP;

-- FORCE �ɼ� :
-- ��������(����Ǵ� ������)�� ���� ���̺��� �������� �ʾƵ� �並 ������ ��
-- SELECT ������ �����ϴ� �뵵�� �� �� �̿���

CREATE OR REPLACE FORCE VIEW V_EMP
AS
SELECT TCODE, TNAME, TCONTENT
FROM TTT;

CREATE OR REPLACE NOFORCE VIEW V_EMP -- NOFORCE : �⺻��, ��������
AS
SELECT TCODE, TNAME, TCONTENT
FROM TTT; -- ���̺��� �������� ������ ������


SELECT 
    EMP_NAME AS �����,
    EMP_NO AS �ֹι�ȣ
FROM 
    EMPLOYEE
WHERE 
    SUBSTR(EMP_NO, 8, 1) IN ('1', '3');









