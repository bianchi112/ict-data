-- C##SCOTT ����
-- PL/SQL ���ù� ���� (PL/SQL.pdf 12���������� �ݺ��� ����)

SET SERVEROUTPUT ON;

/*
IF ���� THEN
    ������ ���� �� ó������;
END IF;
*/

-- ����> �μ���ȣ�� �μ��� �˾Ƴ���
DECLARE
    VEMPNO EMP.EMPNO%TYPE;
    VENAME EMP.ENAME%TYPE;
    VDEPTNO EMP.DEPTNO%TYPE;
    VDNAME VARCHAR2(20) := NULL;
BEGIN
    SELECT EMPNO, ENAME, DEPTNO
    INTO VEMPNO, VENAME, VDEPTNO
    FROM EMP
    WHERE EMPNO = &EMPNO;
    
    IF (VDEPTNO = 10) THEN
        VDNAME := 'ACCOUNTING';
    END IF;
    IF (VDEPTNO = 20) THEN
        VDNAME := 'RESEARCH';
    END IF;
    IF (VDEPTNO = 30) THEN
        VDNAME := 'SALES';
    END IF;
    IF (VDEPTNO = 40) THEN
        VDNAME := 'OPERATIONS';
    END IF;
    DBMS_OUTPUT.PUT_LINE('��� �̸� �μ���');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------');
    DBMS_OUTPUT.PUT_LINE(VEMPNO || '  ' || VENAME || '  ' || VDNAME);
END;
/

-- ����> ������ ���ϴ� ����

DECLARE
VEMP EMP%ROWTYPE;
ANNSAL NUMBER(7, 2);
BEGIN
SELECT * INTO VEMP
FROM EMP
WHERE ENAME = '&ENAME';
IF (VEMP.COMM IS NULL) THEN
ANNSAL := VEMP.SAL * 12;
ELSE
ANNSAL := VEMP.SAL * 12 + VEMP.COMM;
END IF;
DBMS_OUTPUT.PUT_LINE('��� �̸� ����');
DBMS_OUTPUT.PUT_LINE('--------------------------------------');
DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO || '  ' || VEMP.ENAME || '  ' || ANNSAL);
END;
/

--�ǽ�> Ư�� ����� Ŀ�̼��� �޴��� �� �޴����� �����ؼ� ����Ͻÿ�.
--��� ��: ��� 7788 �� SCOTT ����̰� Ŀ�̼��� ���� �ʽ��ϴ�.
--��� ��: ��� 7654 �� MARTIN ����̰� Ŀ�̼��� 1400 �޽��ϴ�.

DECLARE
    VEMPNO EMP.EMPNO%TYPE;
    VCOMM EMP.COMM%TYPE;
    VENAME EMP.ENAME%TYPE;
BEGIN
    SELECT EMPNO, ENAME, COMM
    INTO VEMPNO, VENAME, VCOMM
    FROM EMP
    WHERE EMPNO =&EMPNO;
    IF (VCOMM IS NULL OR VCOMM = 0) THEN
    DBMS_OUTPUT.PUT_LINE('���' || VEMPNO || '�� ' || VENAME || '����̰�
    Ŀ�̼��� ���� �ʽ��ϴ�.' );
    ELSE
    DBMS_OUTPUT.PUT_LINE('���' || VEMPNO || '�� ' || VENAME || '����̰�' || VCOMM || '�� �޽��ϴ�.' );
    END IF;
END;
/

--����> �μ���ȣ�� �μ��� �˾Ƴ���

DECLARE
    VEMP EMP%ROWTYPE;
    VDNAME VARCHAR2(14);
BEGIN
    SELECT * INTO VEMP
    FROM EMP
    WHERE ENAME = '&ENAME';
    IF (VEMP.DEPTNO = 10) THEN
        VDNAME := 'ACCOUNTING';
    ELSIF (VEMP.DEPTNO = 20) THEN
         VDNAME := 'RESEARCH';
    ELSIF (VEMP.DEPTNO = 30) THEN
        VDNAME := 'SALES';
    ELSIF (VEMP.DEPTNO = 40) THEN
        VDNAME := 'OPERATIONS';
    END IF;
    DBMS_OUTPUT.PUT_LINE('��� �̸� �μ���');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------');
    DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO || '  ' || VEMP.ENAME || '  ' || VDNAME);
END;
/


--�ǽ�> score ������ 85 �� �����ϰ�, ������ ���� ������ ����Ͻÿ�.
--��� �� : ����� SCORE �� 85 ���̰�,Grade �� B �Դϴ�.
DECLARE
    score int;
    grade varchar2(2);
BEGIN
    score := &score;
    IF score>=90 THEN
        Grade :='A';
    ELSIF score>=80 THEN
        Grade :='B';
    ELSIF score >=70 THEN
        grade :='C';
    ELSIF score >=60 THEN
        grade :='D';
    ELSE grade :='F';
    END IF;
    DBMS_OUTPUT.PUT_LINE('����� SCOR �� ' || score || '���̰�, ' || 'Grade �� ' || grade || '�Դϴ�.');
END;
/
-- CASE ��
--����> �μ���ȣ�� �μ��� �˾Ƴ���
    DECLARE
    vempno EMP.EMPNO%TYPE;
    vename EMP.ENAME%TYPE;
    vdeptno EMP.DEPTNO%TYPE;
    vdname VARCHAR(20) := null;
BEGIN
    SELECT EMPNO, ENAME, DEPTNO
    INTO vempno, vename, vdeptno
    FROM EMP
    WHERE EMPNO = &EMPNO;
    
    vdname := CASE vdeptno
        WHEN 10 THEN 'ACCOUNT'
        WHEN 20 THEN 'RESEARCH'
        WHEN 30 THEN 'SALES'
        WHEN 40 THEN 'OPERATIONS'
    END;
DBMS_OUTPUT.PUT_LINE (VEMPNO || ' ' || VENAME || ' ' ||VDEPTNO || ' ' || VDNAME);
END;
/



