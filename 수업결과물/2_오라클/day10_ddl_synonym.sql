-- day10_ddl_synonym.sql

-- ���Ǿ� (SYNONYM)
-- �ٸ� ����ڰ����� �ִ� ��ü�� ���� ALIAS (��Ī, ���Ӹ�)��
-- ���� ����ڰ� ���̺��� ������ ���, �ٸ� ����ڰ� ���̺� ������ �� ����ڸ�.���̺�� ���� ǥ���ؾ� �� 
-- �� �� ���Ǿ �����ϸ� �����ϰ� ǥ���� �� �ְ� ��

-- �ۼ����� : 
-- CREATE SYNONYM ���Ӹ� FOR ����ڸ�.��ü��;
-- �� : 
CREATE SYNONYM EP FOR C##STUDENT.EMPLOYEE; -- ó�� ���� ���� �����
-- ������ �������� CREATE SYNONYM ������ �ο��ް� ����ؾ� �� 
-- �����ڰ��� : GRANT CREATE SYNONYM TO C##STUDENT;

-- Ȯ�� 
SELECT * FROM C##STUDENT.EMPLOYEE;
-- �ڱ� ���� �ȿ����� ����ڸ� ������
SELECT * FROM EMPLOYEE;
-- ���Ǿ� ���
SELECT * FROM EP;

-- ���Ǿ� ��뿹 : 
SELECT * FROM SYS.DUAL;
SELECT * FROM DUAL;
SELECT * FROM C##SCOCTT.EMP; -- �ٸ� ������ ��ü�� ���� (��, ���� �ο����� �Ŀ� ������)

-- ���Ǿ�� ��� ����ڰ� �̿��� �� �ִ� ����(PUBLIC) ���Ǿ��
-- ���� ����ڰ� �̿��ϴ� ����� ���Ǿ ����
-- ���� ���Ǿ� �ۼ� :
-- CREATE PUBLIC SYNONYM ���Ǿ� FOR ����ڰ���.��ü��;

-- SYSTEM �������� ------------------------------------------------------------------------------
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

-- C##STUDENT �������� --------------------------------------------------------------
-- �����ڰ����� �ִ� SYSTBL ���̺��� SELECT ��ȸ Ȯ��
SELECT * FROM SYSTEM.SYSTBL;

-- ���Ǿ� �����
CREATE SYNONYM STB FOR SYSTEM.SYSTBL;
-- Ȯ��
SELECT * FROM STB;

-- ���Ǿ� �����ϱ�
-- ����� ���Ǿ� : �ش� ����ڰ������� ������
-- ���� : DROP SYNONYM ���Ӹ�; 

-- C##STUDENT �������� ----------------
DROP SYNONYM EP;
DROP SYNONYM STB;

-- ���� ���Ǿ� : SYSTEM �������� ������
-- ���� : DROP PUBLIC SYNONYM �������Ǿ�;












