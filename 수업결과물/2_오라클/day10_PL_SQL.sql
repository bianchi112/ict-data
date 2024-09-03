-- day10_PL_SQL.sql

-- PL/SQL
-- SQL �� ������ ���α׷��� ��Ҹ� �߰��� ����Ŭ ���� �����ͺ��̽� ���α׷��� ���

-- PL/SQL ���� 3���� (�����)
-- �̸����� (ANONYMUS) PL/SQL �� => PL/SQL �ڵ� �ۼ��ؼ� �ٷ� ���� Ȯ�ο����� �����
-- PL/SQL ���� �����ؼ� ��� ��� ������ => ���ν���(PROCEDURE), �Լ�(FUNCTION) ��ü�� ������
-- ���ν����� ���� ��� ����,  �Լ��� ���� ��� ����

-- 1. PL/SQL �� -------------------------------------
SHOW SERVEROUTPUT; 
-- �Ķ���� ���� ���� Ȯ�� : OFF �̸� ON ���� �ٲ�

SET SERVEROUTPUT ON;
-- PL/SQL �� ����Լ��� ��� ���� ���°� ��

-- ���� ����
DECLARE
    -- ���� ����� :  ������ �ڷ���'
    BOX CHAR(3);
BEGIN -- �ڵ� �ۼ��� ����
    -- SQL ������ ����ؼ� ������ �� ����, ���ǹ�, �ݺ��� �� ���
    SELECT EMP_ID
    INTO BOX    -- BOX = EMP_ID �����Ѵٴ� �ǹ���
    FROM EMPLOYEE
    WHERE EMP_NAME = '�Ѽ���';
    
    -- ��� Ȯ��
    DBMS_OUTPUT.PUT_LINE(BOX);
    
END; -- ���� ��
/ 
-- �ٷ� ������

-- �ǽ� : 
-- '������'�� ����� �̸��� ��ȸ�ؼ� ������ �����ϰ� ������ ���
-- ���� : ���(VEMPID), �̸�(VENAME) �����ϰ� ���

-- PL/SQL �� �ۼ� :
DECLARE
--    VEMPID CHAR(3);
--    VENAME VARCHAR2(20);
    VEMPID EMPCPY.EMP_ID%TYPE;
    VENAME EMPCPY.EMP_NAME%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME
    INTO VEMPID, VENAME
    FROM EMPCPY
    --WHERE EMP_NAME = '������';
    -- ���� �̸��� �Է¹޾Ƽ� ��� : '&�޼���'
    WHERE EMP_NAME = '&�̸�';
    
    SYS.DBMS_OUTPUT.PUT_LINE('��� �̸�');
    DBMS_OUTPUT.PUT_LINE('--------------------------');
    DBMS_OUTPUT.PUT_LINE(VEMPID || ' ' || VENAME);
END;
/

-- �ǽ� :
-- ����� �Է¹޾Ƽ� ('&���') �ش� ����� ���� ������ ����ϴ� PL/SQL �� �ۼ��ϱ�
-- ���, �̸�, �޿�, �Ի��� ��ȸ
-- ���� ���� : �ڷ����� �÷��� �ڷ����� ����
-- ��ȸ�� ����� ������ �����ؼ� ���������� ����ϱ�

DECLARE
    VEMPID EMPLOYEE.EMP_ID%TYPE;
    VENAME EMPLOYEE.EMP_NAME%TYPE;
    VSAL EMPLOYEE.SALARY%TYPE;
    VHDATE EMPLOYEE.HIRE_DATE%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, SALARY, HIRE_DATE
    INTO VEMPID, VENAME, VSAL, VHDATE
    FROM EMPLOYEE
    WHERE EMP_ID =  '&���';
    
    DBMS_OUTPUT.PUT_LINE(VEMPID || ',' || VENAME || ',' || VSAL || ',' || VHDATE);
END;
/

-- �ǽ� : ���ǹ� ���
-- IF ���� THEN �� ó������ ELSE ���� ó������ END IF;
-- ������ �̸��� �Է¹޾�, �ش� ������ ������ ���ϴ� PL/SQL �� �ۼ��Ͻÿ�.
SET SERVEROUTPUT ON;

DECLARE
    VEMP EMPLOYEE%ROWTYPE; -- �� �������� (�� ���� ������)
    ANNSAL NUMBER(15, 2);
BEGIN
    SELECT *
    INTO VEMP
    FROM EMPLOYEE
    WHERE EMP_NAME = '&�̸�';
    
    IF (VEMP.BONUS_PCT IS NULL) THEN
        ANNSAL := VEMP.SALARY * 12;
    ELSE ANNSAL := (VEMP.SALARY + (VEMP.SALARY * VEMP.BONUS_PCT)) * 12;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('��� �̸� ����');
    DBMS_OUTPUT.PUT_LINE('''--------------------------------');
    DBMS_OUTPUT.PUT_LINE(VEMP.EMP_ID || '  ' || VEMP.EMP_NAME || '  ' || ANNSAL);
END;
/

-- �ǽ� : IF ���� THEN �� ELSE ���� END IF;
-- ����� �Է¹޾� �ش� ������ ��ü ������ ��ȸ�ؼ� �Ҽ� �μ��ڵ� �� �̿��ؼ� �μ����� ��ȸ
-- ���, �̸�, �μ��ڵ�, �μ��� ��� ó��
-- �ش� ������ �μ��ڵ尡 NULL �̸� '�ҼӺμ� ����' ��µǰ� ��, �ƴϸ� �μ��� ��ȸ�ؼ� ������ ����
-- �� �������� �����

DECLARE 
    VEMP EMPLOYEE%ROWTYPE;
    VDNAME DEPARTMENT.DEPT_NAME%TYPE;
BEGIN 
    SELECT *
    INTO VEMP
    FROM EMPLOYEE
    WHERE EMP_ID = '&���';
    
    IF VEMP.DEPT_ID IS NULL THEN
        VDNAME := '�ҼӺμ� ����';
    ELSE
        SELECT DEPT_NAME
        INTO VDNAME
        FROM DEPARTMENT
        WHERE DEPT_ID = VEMP.DEPT_ID;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(VEMP.EMP_ID || ',' || VEMP.EMP_NAME || ',' || VEMP.DEPT_ID || ',' || VDNAME);
END;
/

--PL/SQL �� �ݺ���

-- BASIC LOOP ��
--����> BASIC LOOP ������ 1 ���� 5 ���� ����ϱ�
DECLARE
    N NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N + 1;
        IF N > 5 THEN
           EXIT;
      END IF;
    END LOOP;
END;
/

--FOR LOOP
--����> FOR LOOP ������ 1 ���� 5 ���� ����ϱ�
DECLARE
BEGIN
FOR N IN 1..5 LOOP
DBMS_OUTPUT.PUT_LINE(N);
END LOOP;
END;
/

--�ǽ� 1> 1 ���� 10 ���� �ݺ��Ͽ� TEST1 ���̺� ����ǰ� �Ͻÿ�.
--SCOTT �������� TEST1 ���̺� ����
--SQL> 
create table test1(bunho number(3), irum varchar2(10));

BEGIN
FOR i IN 1..10 LOOP
insert into test1 values(i, SYSDATE);
END LOOP;
END;
/
--SQL>
select * from test1;

--�ǽ� 2> �������� Ȧ���ܸ� ��µǰ� �Ͻÿ�. (for ���� if �� ȥ��)
DECLARE
 RESULT NUMBER;
BEGIN
 FOR DAN IN 2..9 LOOP
 IF MOD(DAN, 2) = 1 THEN
 FOR N IN 1..9 LOOP
 RESULT := DAN * N;
 DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || RESULT);
 END LOOP;
 DBMS_OUTPUT.PUT_LINE(' ');
 END IF;
 END LOOP;
END;
/


-- WHILE LOOP ��
--����> WHILE LOOP ������ 1 ���� 5 ���� ����ϱ�
DECLARE
    N NUMBER := 1;
BEGIN
    WHILE N <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N + 1;
    END LOOP;
END;
/

--�ǽ�> ������ 2 ~ 9 �ܿ��� ����� Ȧ���� �͸� ��µǰ� �Ͻÿ�.
--(WHILE LOOP ���)
DECLARE
     RESULT NUMBER;
     DAN NUMBER := 2;
     SU NUMBER;
BEGIN
    WHILE DAN <= 9 LOOP
    SU := 1;
    WHILE SU <= 9 LOOP
     RESULT := DAN * SU;
         IF MOD(RESULT, 2) = 1 THEN
            DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || SU || ' = ' || RESULT);
         END IF;
     SU := SU + 1;
     END LOOP;
     DBMS_OUTPUT.PUT_LINE(' ');
     DAN := DAN + 1;
 END LOOP;
END;
/





