-- day11_plsql_exception.sql

-- PL/SQL ���� EXCEPTION (����) ó��

-- ��> UNIQUE INDEX �� ������ �÷��� �ߺ��� �Է��� ����� ����ó��
--DROP TABLE EXAM_MEMBERS;

CREATE TABLE EXAM_MEMBERS (
    MID  VARCHAR2(20) PRIMARY KEY,  -- UNIQUE INDEX �ڵ� ������
    PWD  VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL
);

INSERT INTO EXAM_MEMBERS VALUES ('javaking', '111', '�ڹ�ŷ');

SELECT * FROM EXAM_MEMBERS;

COMMIT;

-- PL/SQL ���� ����ó�� : 
SET SERVEROUTPUT ON;

BEGIN
    INSERT INTO EXAM_MEMBERS VALUES ('javaking', '111', '�ڹ�ŷ');
EXCEPTION
    -- WHEN �����̸� THEN ó������;
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('ȸ���� ���̵� �ߺ� �ԷµǾ����ϴ�.');
END;
/

-- �ý����� �����ϴ� �����̸��� �𸣰ų�, �̸��� �������� �ʴ� ������ �߻��� ���
-- ���ܷ� �ٷ���� ���� �����̸��� �����ϸ� ��
/*
���� �߻��� �������� ����Ŭ ���� �ڵ带 Ȱ���� : ORA-xxxxx : �����޼��� �� -xxxxx �� �κ��� �����
DECLARE
    �����̸������� EXCEPTION;  -- ���ܿ� ���� �̸����� ������
    PRAGMA EXCEPTION_INIT(�����������ѿ����̸�, -�����ڵ��ȣ);  -- �� �Լ��� �����ڵ��ȣ�� ������ ������ �����̸� �����
    -- PRAGMA ������ : �����Ϸ� �����ڶ�� ��, �������� �� ��� ������
    
���� ���:
EXCEPTION
    WHEN �����ѿ����̸� ����� THEN ó������;
*/

DECLARE
    TOOLARGE_MID EXCEPTION;
    PRAGMA EXCEPTION_INIT(TOOLARGE_MID, -12899);
BEGIN
    INSERT INTO EXAM_MEMBERS VALUES ('javaking12345678912345', '111', '�ڹ�ŷ');
EXCEPTION
    -- WHEN �����̸� THEN ó������;
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('ȸ���� ���̵� �ߺ� �ԷµǾ����ϴ�.');
    WHEN TOOLARGE_MID THEN
        DBMS_OUTPUT.PUT_LINE('���̵� ������ ����Ʈ���� �ʰ��Ͽ����ϴ�.');   
END;
/

-- ���� ���� ������ ���� ���ܸ� ���Ƿ� �߻���ų���� ����:  RAISE_APPLICATION_ERROR(); �Լ� �����
/*
IF �����߻���Ȳ�� ���� ���ǽ� THEN
    RAISE_APPLICATION_ERROR(-���翡���ڵ�, '�����޼���');
END IF;    
    
����Ŭ�� �����ϴ� �����̸����� ���� �߻��ÿ���,
IF ���ܹ߻����ǽ� THEN
    RAISE �����̸�;
END IF;
    
����Ŭ�翡�� ���� �ڵ��ȣ �� 20000 ~ 20999 ������ ����� �ڵ���.
�����ڰ� ������ ���� �� ���� �ڵ�� �����ؼ� ���ܷ� ����� �� ����
*/


--�ǽ�> ���̵�� ��ȣ�� �Է¹޾Ƽ� ������ �����ϰ�,
-- ���̵�� ��ȣ�� ���ڰ����� 10 �����̻� 15 ���� �̸��� ���� ���� ����ϰ�
-- ���� ������ 10 ���� �̸��̸�, TOOSHORT ���� �߻���Ű�� 
-- ���� ������ 15 ���� �̻��̸�, TOOLONG ���� �߻���Ű���� 
-- PL/SQL ������ �ۼ��Ͻÿ�.
-- TOOLONG �� �����Ǵ� �����ڵ� -12899 �� ���� �����ϰ�,
-- TOOSHORT �� �����ڵ带 -20001 �� ���� ���ϰ�, �޼����� '���ڰ��� ����'���� ó����
-- ���̵�� ���� �� �ι� �Է¸��ϰ� �ߺ� ���� ������.
-- ���̵� �ߺ� ���� �׽�Ʈ�� �ʱⰪ ������ ����� ���̵� ���� ���� �غ��� ����
-- �Էµ� ���̵�� �غ�� ����� ���̵� �������� ������ �ߺ� ���� �߻���Ŵ
-- ���� : RAISE_APPLICATION_ERROR(-�����ڵ�, '��¸޼���');
--   => ���ǵ� �����ڵ�� ���ܺ����� �����ʱ�ȭ ������ �ϸ� ��.

DECLARE
    VID CONSTANT VARCHAR2(14) := 'student0123';  -- ����� ����
    V_MID VARCHAR2(14);
    V_PWD VARCHAR2(14);
    
    TOOLONG EXCEPTION;
    TOOSHORT EXCEPTION;
    PRAGMA EXCEPTION_INIT(TOOLONG, -12899);
    PRAGMA EXCEPTION_INIT(TOSHORT, -20001);
BEGIN
    V_MID := '&���̵�';
    V_PWD := '&��ȣ';
    
    IF(LENGTH(V_MID) < 10 OR LENGTH(V_PWD) < 10) THEN
        RAISE_APPLICATION_ERROR(-20001, '���� ���� ����');
    END IF;
    
    IF VID = M_VID THEN
        RAISE DUP_VAL_ON_INDEX;
    END IF;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN DBMS_OUTPUT.PUT_LINE('���̵� �ߺ��Ǿ����ϴ�.');
    WHEN TOOLONG THEN DBMS_OUTPUT.PUT_LINE('���� ���� ���� �ʰ�.');
    WHEN TOOSHORT THEN DBMS_OUTPUT.PUT_LINE('���� ���� ����.');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('�˼����� ������ �߻��Ͽ����ϴ�.');
END;
/



