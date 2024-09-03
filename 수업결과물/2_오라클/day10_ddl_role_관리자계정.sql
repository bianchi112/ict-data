GRANT CREATE SYNONYM TO C##STUDENT;

-- ���̺� ����� 
DROP TABLE SYSTBL;

CREATE TABLE SYSTBL (
    SNAME VARCHAR2(20)
);

-- ���߰� (������ ��� ����)
INSERT INTO SYSTBL VALUES ('ȫ�浿');
INSERT INTO SYSTBL VALUES ('����ġ');

SELECT * FROM SYSTBL;

COMMIT;

-- ��ü ������ �ο���
-- C##STUDENT ���� SYSTBL ���̺��� SELECT �� �� �ִ� ������ �ο���
GRANT SELECT ON SYSTBL TO C##STUDENT;



-- DDL ROLE ����

-- �� ����� ���� �����
CREATE USER C##USER33 IDENTIFIED BY PASS33;

-- ���� �õ��� ���� : ���� ���� ����
CONNECT C##USER33/PASS33

-- ���� �ο�
GRANT CONNECT TO C##USER33;
GRANT RESOURCE TO C##USER33;
-- �Ǵ�
GRANT CONNECT, RESOURCE TO C##USER33;

-- ����
CONN C##USER33/PASS33

-- �� ���� ��ųʸ� : ���� Ȯ���ϱ� ���� ������ ��ųʸ��� ���� ����
SELECT * FROM DICT
WHERE TABLE_NAME LIKE '%ROLL%';

-- ����ڵ鿡�� �ο��� ���� Ȯ���ϱ� : USER_ROLL_PRIVS
SELECT * FROM USER_ROLE_PRIVS;

-- ROLE_SYS_PRIVS : �ѿ� �ο��� �ý��� ���� ����
-- ROLE_TAB_PRIVS : �ѿ� �ο��� ���̺� ���� ���� ����
-- USER_ROLE_PRIVS : ���� ������(����) �� ����
-- USER_TAB_PRIVS_MADE : �ش� ����� ������ ��ü ���� ����
-- USER_TAB_PRIVS_RECD : ����ڿ��� �ο��� ��ü ���� ����
-- USER_COL_PRIVS_MADE : �ش� ����� ������ �÷� ��ü ���� ����
-- USER_COL_PRIVS_RECD : ����ڿ��� �ο��� Ư�� �÷��� ���� ��ü ���� ����

-- ����� ���� �� ����� : 
-- CREATE ROLE ������� ������
-- �� ������ �ݵ�� DBA ������ �ִ� ����ڸ� �� �� ����
/*
�ۼ����� : 
CREATE ROLE ���̸�;  -- 1. �� ����
-- 2. ������ �ѿ� ���� �߰��� (�ο���)
GRANT �������� TO ���̸�;
GRANT ��������, ��������, .... TO ���̸�;

-- 3. �� ���
GRANT ���̸� TO ����ڰ���;
*/

-- �����ڰ������� �� ���� : ----------------------------
-- ����Ŭ 12C ���� ���� �����տ� C## ���̵��� ���̹� ��Ģ�� ������ ����
-- ���̸����� C## ����
-- 1. �� ��ü ����
CREATE ROLE C##MYROLE;
-- 2. �ѿ� ���� �߰� (���� �ο�)
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW TO C##MYROLE;
-- 3. �� ���
CREATE USER C##MYMY IDENTIFIED BY PASS;
GRANT C##MYROLE TO C##MYMY;

-- �α��� Ȯ�� : SQL PLUS ���� �׽�Ʈ
CONNECT C##MYMY/PASS -- ��ҹ��� ����
SHOW USER

-- ����ڿ��� �ο��� ���� Ȯ��
SELECT * FROM USER_ROLE_PRIVS;


/*
[����] ---------------------------------------------------------
    ������ ��������
    ���̸� : C##MYROLE02
    �ѿ� �ο��� ��ü ���� : C##STUDENT.EMPLOYEE ���̺� ���� SELECT
    �� �ο��� ����� : C##MYMY
    => SQL PLUS ���� Ȯ��
    => C##MYMY �α����ؼ� EMPLOYEE ���̺� SELECT ���� ��� Ȯ����
    ------------------------------------------------------------    
*/

-- 1.
CREATE ROLE C##MYROLE02;
-- 2. 
GRANT SELECT ON C##STUDENT.EMPLOYEE TO C##MYROLE02; -- �ѿ� ���� �߰�

-- 3. 
GRANT C##MYROLE02 TO C##MYMY;
-- C##MYMY �α��� ���� => ���̺� ��ȸ
CONN C##MYMY/PASS
SELECT * FROM C##STUDENT.EMPLOYEE;


-- ���� ȸ�� (�� ȸ��) -------------------------
-- REVOKE ���̸� FROM ����ڰ���;

-- �ý��۰������� �ο��� ���� �ý��۰������� ȸ����
REVOKE C##MYROLE02 FROM C##MYMY;

-- C##MYMY �������� �ڽſ��� �־��� �� ���� Ȯ��
CONN C##MYMY/PASS
SELECT * FROM USER_ROLE_PRIVS;

-- �� ���� -----------------------
-- DROP ROLE ���̸�;
DROP ROLE C##MYROLE02;



