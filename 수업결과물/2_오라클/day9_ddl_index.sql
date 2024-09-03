-- day9_ddl_index.sql

-- �ε��� (INDEX)
-- SQL ���� (SELECT, DML)��  ó�� �ӵ��� ����Ű�� ���� �÷��� ���� �����ϴ� �����ͺ��̽� ��ü��
-- �ε��� ���� ������ B* Ʈ��(����Ž��Ʈ�� : BST, Binary Search Tree) ��
-- �ε��� ��ü�� �����ϴ� �� �ð��� �ʿ��ϰ�, ������ �ʿ��� => �ݵ�� ���� ���� �ƴ�
-- �ε��� ����(����) �Ŀ� DML �۾��� �����ϸ�, �ε����� ����� Ű����(�÷���)�� ����ǹǷ� B*Ʈ�� ���� ���� �����
-- B*Ʈ���� �ٽ� ������ �Ǿ�� �ϹǷ�(�ڵ�) DML �۾��� �ξ� ���ſ����� ��

-- ���� : 
-- �˻� �ӵ��� ����
-- �ý��ۿ� �ɸ��� ���ϸ� �ٿ��� �ý��� ��ü ������ ����Ŵ

-- ���� : 
-- �ε����� ���� �߰����� ������ �ʿ���
-- �ε����� �����ϴ� �� �ð���  �ʿ���
-- ���̺� DML(INSERT, UPDATE, DELETE)�� ���� �߻��ϴ� ���, �ε��� Ʈ�� �籸���� �ڵ� ����ǹǷ� ���� ���ϵ�

-- �ε��� ���� ���� : 
/*
CREATE [UNIZUE] INDEX �ε��� �̸� ON ���̺��(�÷���[, �÷���, ...] | �Լ�����);

�ε��� ���� : UNIQUE INDEX, NONUNIQUE INDEX
*/

-- UNIQUE INDEX :
-- �÷��� UNIZUE �������� ������ �Ͱ� ���� => ���� �� �ι� ��� �� �� (�ߺ��˻�)
-- PRIMARY KEY�� UNIQUE ���������� ������ �÷��� �� ���� �ڵ����� UNIQUE INDEX �� ������

CREATE UNIQUE INDEX IDX_DNM
ON DEPARTMENT (DEPT_NAME);

-- �ε����� �ڵ����� ����� �� : 
-- SELECT, INSERT, UPDATE, DELETE ���� ����
-- WHERE ��, JOIN �÷� ����

-- �ε��� ���� �ǽ� ---------------------
-- 1. EMPLOYEE ���̺��� EMP_NAME �÷��� 
-- IDX_ENM �̸��� UNIQUE INDEX �� �����Ͻÿ�.
CREATE UNIQUE INDEX IDX_ENM
ON EMPLOYEE (EMP_NAME);

-- 2. ���ο� �����͸� �Է��� ����, ���� ������ �ľ��Ͻÿ�.
CREATE SEQUENCE SEQ_EID
START WITH 400
NOMAXVALUE
NOCYCLE NOCACHE;

INSERT INTO EMPLOYEE (EMP_ID, EMP_NO, EMP_NAME)
VALUES (SEQ_EID.NEXTVAL, '880808-1234567', '���켷');
-- ���� ���� : 
-- EMPLOYEE �� EMP_NAME �÷��� '���켷' �̸���  �̹� ������
-- UNIZUE INDEX �� UNIQUE �������� ����� ������

-- 3. EMPLOYEE ���̺��� DEPT_ID �÷���  
-- IDX_DID �̸��� UNIQUE INDEX �� ������ ����
-- ���� ������ �ľ��Ͻÿ�.

CREATE UNIQUE INDEX IDX_DID
ON EMPLOYEE (DEPT_ID);

-- �������� : 
-- DEPT_ID �÷��� �̹� �ߺ����� ���� �� ����ϰ� �ִ� �÷���
-- UNIQUE INDEX ���� �� ��

-- NONUNOQUE INDEX -------------------
-- ����ϰ� ���Ǵ� �Ϲ� �÷��� �����ϴ� �ε�����
-- ���� ����� ���� ����
CREATE INDEX IDX_DID
ON EMPLOYEE (DEPT_ID);

-- �ε��� ���� --------------------
-- ���̺��� �����Ǹ�, �ε����� �Բ� ������
-- DROP INDEX �ε����̸�;
DROP INDEX IDX_ENM;

-- �ε��� ���� ��ųʸ� ���� Ȯ�� 
DESC USER_INDEXES;
DESC USER_IND_COLUMNS;

SELECT INDEX_NAME, COLUMN_NAME,TABLE_NAME, INDEX_TYPE, UNIQUENESS
FROM USER_INDEXES
JOIN USER_IND_COLUMNS USING (INDEX_NAME, TABLE_NAME)
WHERE TABLE_NAME = 'EMPLOYEE';

-- �˻� �ӵ� ���� ����
-- EMPLOYEE ���̺��� ��� ������ �������� ����ؼ� ������ EMPL01, EMPL02 ���̺� ����ÿ�.
-- EMPL01 �� EMP_ID �÷��� ���� UNIQUE INDEX ����ÿ�. : IDX_EID
-- �˻� �ӵ� �񱳸� ���� SELECT �������� EMP_ID �÷����� ��ȸ�� ���� : ��� 141�� ������ȸ

CREATE TABLE EMPL01
AS
SELECT * FROM EMPLOYEE;

CREATE TABLE EMPL02
AS
SELECT * FROM EMPLOYEE;

CREATE UNIQUE INDEX IDX_EID
ON EMPL01 (EMP_ID);

SELECT * FROM EMPL01
WHERE EMP_ID = '141'; -- 0.011

SELECT * FROM EMPL02
WHERE EMP_ID = '141'; -- 0.012 

-- ���� �ε��� -------------------------------------------
-- ���� �ε��� : �� ���� �÷����� ������ �ε���
-- ���� �ε��� : �� ���̻��� �÷����� ������ �ε���
CREATE TABLE DEPT01
AS
SELECT * FROM DEPARTMENT;

-- �μ���ȣ�� �μ����� �����ؼ� �ε��� �����
CREATE INDEX IDX_DEPT01_COMP
ON DEPT01 (DEPT_ID, DEPT_NAME);

-- ��ųʸ����� Ȯ�� : 
SELECT INDEX_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'DEPT01';

-- �Լ� ��� �ε��� ---------------------------------------
-- SELECT ���̳� WHERE ���� ��������̳� �Լ����� ����ϴ� ���
-- ������ �ε����� ������ ����  �ʴ´�. (�ε����� ����� �������� ����)
-- ��� �ܷΰ����� Ű����� �ؼ� �˻� Ʈ���� ������ �� ����
-- �������� �˻��ϴ� ��찡 ���ٸ�, �����̳� �Լ����� �ε����� ���� �� ����
CREATE TABLE EMPL03
AS
SELECT * FROM EMPLOYEE;

CREATE INDEX IDX_EMPL03_SALCALC
ON EMPL03 ((SALARY + (SALARY * NVL(BONUS_PCT, 0))) * 12);

SELECT INDEX_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMPL03';








