-- C##SCOTT 계정
-- PL/SQL 선택문 연습 (PL/SQL.pdf 12페이지부터 반복문 연습)

SET SERVEROUTPUT ON;

/*
IF 조건 THEN
    조건이 참일 때 처리구문;
END IF;
*/

-- 예제> 부서번호로 부서명 알아내기
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
    DBMS_OUTPUT.PUT_LINE('사번 이름 부서명');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------');
    DBMS_OUTPUT.PUT_LINE(VEMPNO || '  ' || VENAME || '  ' || VDNAME);
END;
/

-- 예제> 연봉을 구하는 예제

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
DBMS_OUTPUT.PUT_LINE('사번 이름 연봉');
DBMS_OUTPUT.PUT_LINE('--------------------------------------');
DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO || '  ' || VEMP.ENAME || '  ' || ANNSAL);
END;
/

--실습> 특정 사원이 커미션을 받는지 안 받는지를 구분해서 출력하시오.
--출력 예: 사번 7788 은 SCOTT 사원이고 커미션을 받지 않습니다.
--출력 예: 사번 7654 은 MARTIN 사원이고 커미션을 1400 받습니다.

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
    DBMS_OUTPUT.PUT_LINE('사번' || VEMPNO || '은 ' || VENAME || '사원이고
    커미션을 받지 않습니다.' );
    ELSE
    DBMS_OUTPUT.PUT_LINE('사번' || VEMPNO || '은 ' || VENAME || '사원이고' || VCOMM || '을 받습니다.' );
    END IF;
END;
/

--예제> 부서번호로 부서명 알아내기

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
    DBMS_OUTPUT.PUT_LINE('사번 이름 부서명');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------');
    DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO || '  ' || VEMP.ENAME || '  ' || VDNAME);
END;
/


--실슴> score 변수에 85 를 대입하고, 점수에 대한 학점을 출력하시오.
--출력 예 : 당신의 SCORE 는 85 점이고,Grade 는 B 입니다.
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
    DBMS_OUTPUT.PUT_LINE('당신의 SCOR 는 ' || score || '점이고, ' || 'Grade 는 ' || grade || '입니다.');
END;
/
-- CASE 문
--예제> 부서번호로 부서명 알아내기
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



