-- day11_trigger.sql

-- Ʈ���� (TRIGGER) ��ü
-- �����ͺ��̽� �̺�Ʈ ��ü��
-- �ַ� ���̺� DML(INSERT, UPDATE, DELETE) �� ����� ��
-- �ٸ� ���̺� �ڵ����� �Բ� DML �� �۵���ų �� �̿���
/*
�ۼ����� : 
CREATE OR REPLACE TRIGGER Ʈ�����̸�
[BEFORE | AFTER]  -- �̺�Ʈ �߻� ������ ����
[INSERT | UPDATE | DELETE] ON ���̺��
FOR EACH ROW  -- ���� ������� ������ �ǹ���
[WHEN ���ǽ�]  -- ��� �࿡ ���� �̺�Ʈ ���� ����
BEGIN
    -- ������ ������ �̺�Ʈ �߻��� ó���� ���� (�ڵ� ����� ����)
    �ٸ� ���̺� �����Ϸ��� DML ���� �ۼ�; 
END;
/

Ʈ���� �������� ���� => ALTER TRIGGER ����
Ʈ���� ���� : DROP TRIGGER Ʈ�����̸�;
*/

-- ȭ��(�ܼ�)�� ������ ��½�Ű�� ���� ������ Ȯ��
SHOW SERVEROUTPUT;
-- OFF �����̸� ON ���� �ٲ�
SET SERVEROUTPUT ON;

-- ���� ���̺� ����� : 
-- ���̺��� �÷� ������ ������ ���� ��
DROP TABLE EMPCPY CASCADE CONSTRAINTS;

CREATE TABLE EMPCPY
AS
SELECT EMP_ID, EMP_NAME, DEPT_ID
FROM EMPLOYEE
WHERE 1 = 0;  -- ������ ������ ���� ��

DESC EMPCPY;  -- �÷� ���� �����
SELECT * FROM EMPCPY;  -- ������ ����

-- Ư�� ���̺� DML �� ������ �Ǹ�, �ڵ����� � ������ �����Ű�� �̺�Ʈ ��ü => Ʈ������.

-- �� : EMPCPY ���̺� INSERT �� ������ �ǰ� ���� (AFTER)
-- �ڵ����� ��º�(�ܼ�)�� ȯ���޼����� ��µǴ� �̺�Ʈ�� ����Ǵ� Ʈ��Ŀ �����

CREATE OR REPLACE TRIGGER TRI_WELCOME
AFTER INSERT ON EMPCPY
BEGIN
    DBMS_OUTPUT.PUT_LINE('�Ի縦 ȯ���մϴ�.');
END;
/

-- Ʈ���� �ڵ� ���� Ȯ�� : 
INSERT INTO EMPCPY VALUES ('777', 'ȫ���', '90');

SELECT * FROM EMPCPY;

-- �ǽ� : 
-- ���� ���̺�
CREATE TABLE EMP03 (
    EMPNO  NUMBER(4) PRIMARY KEY,
    ENAME  VARCHAR2(15),
    SAL  NUMBER(7, 2)
);

-- �޿� ���̺�
CREATE TABLE SALARY (
    NO  NUMBER  PRIMARY KEY,
    EMPNO  NUMBER(4) REFERENCES EMP03,
    SAL NUMBER(7, 2)
);

-- SALARY ���̺��� NO �÷� ���� ������ �̿���
CREATE SEQUENCE SEQ_SALARY_NO
START WITH 1
INCREMENT BY 1
NOCYCLE NOCACHE;

-- Ʈ���� �����
CREATE OR REPLACE TRIGGER TRI_SALARY
AFTER INSERT ON EMP03  -- EMP03 ���̺� INSERT ����� ���� �ڵ� ����Ǵ� Ʈ������
FOR EACH ROW  -- INSERT �� �� ���� �ݵ�� �ʿ���
BEGIN
    INSERT INTO SALARY
    VALUES (SEQ_SALARY_NO.NEXTVAL, :NEW.EMPNO, :NEW.SAL);
    -- ���ε�(BIND) ���� : ���� �߰��� ���� :NEW.�÷���, ������ ��ϵǾ� �ִ� �� :OLD.�÷��� �����
    -- FOR EACH ROW �����ÿ��� �̿��� �� ����
END;
/

-- Ʈ���� �۵��� Ȯ��
SELECT * FROM EMP03;
SELECT * FROM SALARY;

-- Ʈ���� �ڵ� ���� Ȯ�� : 
INSERT INTO EMP03 VALUES (8888, 'ȫ���', 3500);

-- Ʈ���� �۵��� Ȯ��
SELECT * FROM EMP03;
SELECT * FROM SALARY;   -- �ڵ� INSERT Ȯ��

-- �ǽ� : 
-- Ʈ���� �����
-- EMP03 �� ������ �޿� ����� SALARY ���̺��� �ش� ������ �޿� �ڵ� ����Ǵ� Ʈ���� : TRI_SAL_UPDATE
-- EMP03 �� ���� ������ SALARY ���̺��� �ش� ���� ���� �ڵ� �����Ǵ� Ʈ���� : TRI_SAL_DELETE

CREATE OR REPLACE TRIGGER TRI_SAL_UPDATE
AFTER UPDATE ON EMP03
FOR EACH ROW
BEGIN
    UPDATE SALARY
    SET SAL = :NEW.SAL  -- ���� ��ϵ� ������ ����
    WHERE EMPNO = :OLD.EMPNO;  -- ���� ��ϰ����� �˻�
END;
/

CREATE OR REPLACE TRIGGER TRI_SAL_DELETE
AFTER DELETE ON EMP03
FOR EACH ROW
BEGIN
    DELETE FROM SALARY
    WHERE EMPNO = :OLD.EMPNO;  -- ���� ��ϰ����� �˻�
END;
/

-- ���� �� Ȯ��
SELECT * FROM EMP03;
SELECT * FROM SALARY; 

UPDATE EMP03
SET SAL = 4800
WHERE EMPNO = 8888;

-- UPDATE �� Ʈ���� �۵� Ȯ��
SELECT * FROM EMP03;
SELECT * FROM SALARY; 

DELETE FROM EMP03
WHERE EMPNO = 8888;

-- DELETE �� Ʈ���� �۵� Ȯ��
SELECT * FROM EMP03;
SELECT * FROM SALARY; 

-- �ǽ� ---------------------------------------
-- 1. ��ǰ ���̺�
CREATE TABLE ��ǰ (
    ��ǰ�ڵ� CHAR(4) CONSTRAINT PK_��ǰ PRIMARY KEY,
    ��ǰ�� VARCHAR2(15) NOT NULL,
    ������ VARCHAR2(15),
    �Һ��ڰ��� NUMBER,
    ������ NUMBER DEFAULT 0
);

-- ��ǰ ���
INSERT INTO ��ǰ (��ǰ�ڵ�, ��ǰ��, ������, �Һ��ڰ���) VALUES ('a001', '���콺', 'LG', 1000);
INSERT INTO ��ǰ VALUES ('a002', 'Ű����', '�Ｚ', 5000, DEFAULT);
INSERT INTO ��ǰ VALUES ('a003', '�����', 'HP', 10000, DEFAULT);

COMMIT;
SELECT * FROM ��ǰ;

-- 2. �԰� ���̺�
CREATE TABLE �԰� (
    �԰��ȣ NUMBER PRIMARY KEY,
    ��ǰ�ڵ� CHAR(4) REFERENCES ��ǰ (��ǰ�ڵ�),
    �԰����� DATE,
    �԰���� NUMBER,
    �԰�ܰ� NUMBER,
    �԰�ݾ� NUMBER    -- �԰���� * �԰�ܰ�
);

-- �԰��ȣ�� ���� ������ ����
CREATE SEQUENCE SEQ_�԰��ȣ
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- �԰� ������ INSERT �ϸ鼭, �԰������ �԰�ܰ��� ������ �԰�ݾ��� ����ϴ� �Է� ó�� ���ν��� ����� : 
-- ���ν���(PROCEDURE) : PL/SQL ���� ���� ��ü��
-- ��ǰ�ڵ� --> CODE, �԰���� --> SU,  �԰�ݾ� --> WON ������ ���޹޵��� ��
CREATE OR REPLACE PROCEDURE PRO_SP_INSERT(CODE CHAR, SU NUMBER, WON NUMBER)
IS
BEGIN
    INSERT INTO �԰�
    VALUES (SEQ_�԰��ȣ.NEXTVAL, CODE, SYSDATE, SU, WON, SU * WON);
END;
/

-- 3. �Է� Ʈ���� ����� : 
-- �԰� ���̺� ��ǰ�� ���� �԰������� ���(INSERT)�Ǹ�  <= ���ν����� ���� ����� ����
-- �ش� ��ǰ�� �԰������ ���ؼ�
-- ��ǰ ���̺��� �ش� ��ǰ�� �������� ���� ó���ϴ� Ʈ���� : TRI_PRODUCT_INSERT

CREATE OR REPLACE TRIGGER TRI_PRODUCT_INSERT
AFTER INSERT ON �԰�
FOR EACH ROW
BEGIN
    UPDATE ��ǰ
    SET ������ = ������ + :NEW.�԰����
    WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
END;
/

-- ���� Ʈ���� ����� : 
-- �԰� ���̺��� �԰������ ����(UPDATE)�Ǹ�
-- ��ǰ ���̺��� �������� ������ ������ �ڵ� ����Ǵ� Ʈ���� : TRI_PRODUCT_UPDATE

CREATE OR REPLACE TRIGGER TRI_PRODUCT_UPDATE
AFTER UPDATE ON �԰�
FOR EACH ROW
BEGIN
    UPDATE ��ǰ
    SET ������ = ������ - :OLD.�԰���� + :NEW.�԰����
    WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
END;
/

-- ���� Ʈ���� ����� : 
-- �԰� ���̺��� ��ǰ�� ���� ���� �����Ǹ�
-- ��ǰ ���̺��� �ش� ��ǰ�� �������� ������ ���� �԰������ŭ �����ϴ� Ʈ���� : TRI_PRODUCT_DELETE

CREATE OR REPLACE TRIGGER TRI_PRODUCT_DELETE
AFTER DELETE ON �԰�
FOR EACH ROW
BEGIN
    UPDATE ��ǰ
    SET ������ = ������ - :OLD.�԰����
    WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
END;
/

-- 4. Ʈ���� �۵� Ȯ��
-- �԰� ���̺� �԰��ǰ ����ϴ� ���ν��� ������
-- EXECUTE ���ν����̸�(���ް�, ���ް�, ...);  <= ���ν��� ���� �� �Ű������� �ڷ���, ����, ���� ��ġ�ǰ� ����ؾ� ��
-- �����ɾ� ��� ������ : EXEC ���ν����̸�(���ް�, ���ް�, ...);
EXEC PRO_SP_INSERT('a002', 20, 5000);   -- �԰� INSERT �۵�
EXEC PRO_SP_INSERT('a002', 10, 5000);   -- �԰� INSERT �۵�

-- Ȯ��
SELECT * FROM �԰�;  -- �԰� ���� �߰��� �� Ȯ�� (���ν��� ����)
SELECT * FROM ��ǰ;  -- �԰��ǰ�� ���� ������ �ڵ� ���� Ȯ���� (Ʈ���� �ڵ� ����)

-- ���� Ʈ���� �۵� Ȯ��
UPDATE �԰�
SET �԰���� = 15, �԰�ݾ� = 15 * �԰�ܰ�
WHERE �԰��ȣ = 2;

-- Ȯ��
SELECT * FROM �԰�;  -- �԰� ���� ���� Ȯ��
SELECT * FROM ��ǰ;  -- �԰���� ���濡 ���� ������ ���� Ȯ����

-- ���� Ʈ���� �۵� Ȯ��
DELETE FROM �԰�
WHERE �԰��ȣ = 2;

-- Ȯ��
SELECT * FROM �԰�;  -- �԰� ���� ���� Ȯ��
SELECT * FROM ��ǰ;  -- �԰���� ������ ���� ������ ���� Ȯ����


