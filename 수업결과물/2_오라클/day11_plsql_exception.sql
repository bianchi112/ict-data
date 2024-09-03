-- day11_plsql_exception.sql

-- PL/SQL 블럭의 EXCEPTION (예외) 처리

-- 예> UNIQUE INDEX 가 설정된 컬럼에 중복값 입력한 경우의 예외처리
--DROP TABLE EXAM_MEMBERS;

CREATE TABLE EXAM_MEMBERS (
    MID  VARCHAR2(20) PRIMARY KEY,  -- UNIQUE INDEX 자동 생성됨
    PWD  VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL
);

INSERT INTO EXAM_MEMBERS VALUES ('javaking', '111', '자바킹');

SELECT * FROM EXAM_MEMBERS;

COMMIT;

-- PL/SQL 블럭의 예외처리 : 
SET SERVEROUTPUT ON;

BEGIN
    INSERT INTO EXAM_MEMBERS VALUES ('javaking', '111', '자바킹');
EXCEPTION
    -- WHEN 예외이름 THEN 처리내용;
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('회원의 아이디가 중복 입력되었습니다.');
END;
/

-- 시스템이 제공하는 예외이름을 모르거나, 이름이 제공되지 않는 에러가 발생한 경우
-- 예외로 다루려면 직접 예외이름을 정의하면 됨
/*
에러 발생시 보여지는 오라클 에러 코드를 활용함 : ORA-xxxxx : 에러메세지 중 -xxxxx 이 부분을 사용함
DECLARE
    예외이름지어줌 EXCEPTION;  -- 예외에 대한 이름임을 선언함
    PRAGMA EXCEPTION_INIT(위에서지정한예외이름, -오류코드번호);  -- 이 함수로 에러코드번호와 위에서 지정한 예외이름 등록함
    -- PRAGMA 지시자 : 컴파일러 지시자라고 함, 컴파일할 때 등록 설정됨
    
예외 사용:
EXCEPTION
    WHEN 지정한예외이름 사용함 THEN 처리내용;
*/

DECLARE
    TOOLARGE_MID EXCEPTION;
    PRAGMA EXCEPTION_INIT(TOOLARGE_MID, -12899);
BEGIN
    INSERT INTO EXAM_MEMBERS VALUES ('javaking12345678912345', '111', '자바킹');
EXCEPTION
    -- WHEN 예외이름 THEN 처리내용;
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('회원의 아이디가 중복 입력되었습니다.');
    WHEN TOOLARGE_MID THEN
        DBMS_OUTPUT.PUT_LINE('아이디가 지정한 바이트수를 초과하였습니다.');   
END;
/

-- 정상 실행 구문에 대해 예외를 임의로 발생시킬수도 있음:  RAISE_APPLICATION_ERROR(); 함수 사용함
/*
IF 에러발생상황에 대한 조건식 THEN
    RAISE_APPLICATION_ERROR(-만든에러코드, '에러메세지');
END IF;    
    
오라클이 제공하는 예외이름으로 예외 발생시에는,
IF 예외발생조건식 THEN
    RAISE 예외이름;
END IF;
    
오라클사에서 오류 코드번호 중 20000 ~ 20999 까지는 비워둔 코드임.
개발자가 에러를 만들어서 위 오류 코드와 연결해서 예외로 사용할 수 있음
*/


--실습> 아이디와 암호를 입력받아서 변수에 저장하고,
-- 아이디와 암호는 글자갯수가 10 글자이상 15 글자 미만일 때만 정상 출력하고
-- 글자 갯수가 10 글자 미만이면, TOOSHORT 에외 발생시키고 
-- 글자 갯수가 15 글자 이상이면, TOOLONG 예외 발생시키도록 
-- PL/SQL 구문을 작성하시오.
-- TOOLONG 은 제공되는 오류코드 -12899 에 대해 매핑하고,
-- TOOSHORT 는 오류코드를 -20001 로 새로 정하고, 메세지는 '글자갯수 부족'으로 처리함
-- 아이디는 같은 값 두번 입력못하게 중복 예외 적용함.
-- 아이디 중복 예외 테스트용 초기값 대입한 상수형 아이디 변수 따로 준비해 놓음
-- 입력된 아이디와 준비된 상수형 아이디 변수값이 같으면 중복 예외 발생시킴
-- 참고 : RAISE_APPLICATION_ERROR(-에러코드, '출력메세지');
--   => 정의된 예외코드로 예외변수와 예외초기화 설정을 하면 됨.

DECLARE
    VID CONSTANT VARCHAR2(14) := 'student0123';  -- 상수형 변수
    V_MID VARCHAR2(14);
    V_PWD VARCHAR2(14);
    
    TOOLONG EXCEPTION;
    TOOSHORT EXCEPTION;
    PRAGMA EXCEPTION_INIT(TOOLONG, -12899);
    PRAGMA EXCEPTION_INIT(TOSHORT, -20001);
BEGIN
    V_MID := '&아이디';
    V_PWD := '&암호';
    
    IF(LENGTH(V_MID) < 10 OR LENGTH(V_PWD) < 10) THEN
        RAISE_APPLICATION_ERROR(-20001, '글자 갯수 부족');
    END IF;
    
    IF VID = M_VID THEN
        RAISE DUP_VAL_ON_INDEX;
    END IF;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN DBMS_OUTPUT.PUT_LINE('아이디가 중복되었습니다.');
    WHEN TOOLONG THEN DBMS_OUTPUT.PUT_LINE('글자 갯수 범위 초과.');
    WHEN TOOSHORT THEN DBMS_OUTPUT.PUT_LINE('글자 갯수 부족.');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('알수없는 오류가 발생하였습니다.');
END;
/



