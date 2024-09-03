-- day10_ddl_role_권한.sql

-- 데이터베이스 롤(ROEL)
-- 사용자(USER)마다 일일이 하나씩 권한을 부여하는 것은 번거러움
-- 간편하게 권한을 부여할 수 있는 방법으로 ROLE 을 제공함
-- ROLE : 
-- 여러 개의 권한들을 묶어 놓은 데이터베이스 객체임
-- 사용자 권한 관리를 보다 간편하고 효율적으로 처리할 수 있게 됨
-- 다수의 사용자에게 공통으로 필요한 권한들을 롤에 하나의 그룹으로 묶어두고, 사용자마다 특정 롤에 대한 권한 부여함

-- 사용자에게 부여한 권한을 수정하고자 할 때도 일일이 사용자마다 권한 수정하지 않고
-- 롤만 수정하면 행당 롤로 권한을 부여받은 사용자들의 권한이 자동 수정됨

-- 롤을 활성화하거나 (권한 부여) 비활성화 (권한 철회)해서 일시적으로 권한 관리 가능함

-- 롤의 종류 : 
-- 사전 정의된 롤 (제공되는 롤)
-- 사용자가 정의한 롤

/*
사전 정의된 ROLE : 
    오라클 설치시 시스템에서 기본적으로 제공됨
    
    - CONTECT 롤 :
        사용자가  데이터베이스에 접속할 수 있도록 시스템 권한 8가지가 묶여있음
        CREATE SESSION, ALTER SESSION,
        CREATE TABLE, CREATE VIEW, VREATE SYNONYM,
        CREATE SEQUENCE, CREATE CLUSTER,
        CREATE DATABASE LINK
    
    - RESUORCE 롤 : 
        사용자가 객체를 생성할 수 있도록 하는 권한들을 묶어놓음
        CREATE CLUSTER, CREATE PROCEDURE, CREATE SEQUENCE,
        CREATE TABLE, CREATE TRIGGER
        
    - DBA 롤 : 
        사용자가 소유한 데이터베이스 객체를 관리하고
        사용자계정 만들고 편집하고 제거할 수 있는 모든 권한을 가짐
        시스템권한을 부여하는 강력한 롤임
*/

-- 새 사용자 계정 만들기
CREATE USER C##USER33 IDENTIFIED BY PASS33;

-- 접속 시도시 에러 : 접속 권한 없음
CONNECT C##USER33/PASS33

-- 권한 부여
GRANT CONNECT TO C##USER33;
GRANT RESOURCE TO C##USER33;
-- 또는
GRANT CONNECT, RESOURCE TO C##USER33;

-- 접속
CONN C##USER33/PASS33

-- 롤 관련 딕셔너리 : 롤을 확인하기 위한 데이터 딕셔너리가 아주 많음
SELECT * FROM DICT
WHERE TABLE_NAME LIKE '%ROLL%';

-- 사용자들에게 부여된 롤을 확인하기 : USER_ROLL_PRIVS
SELECT * FROM USER_ROLE_PRIVS;

-- ROLE_SYS_PRIVS : 롤에 부여된 시스템 권한 정보
-- ROLE_TAB_PRIVS : 롤에 부여돈 테이블 관련 권한 정보
-- USER_ROLE_PRIVS : 접근 가능한(관련) 롤 정보
-- USER_TAB_PRIVS_MADE : 해당 사용자 소유의 객체 권한 정보
-- USER_TAB_PRIVS_RECD : 사용자에게 부여한 객체 권한 정보
-- USER_COL_PRIVS_MADE : 해당 사용자 소유의 컬럼 객체 권한 정보
-- USER_COL_PRIVS_RECD : 사용자에게 부여한 특정 컬럼에 대한 객체 권한 정보

-- 사용자 정의 롤 만들기 : 
-- CREATE ROLE 명령으로 생성함
-- 롤 생성은 반드시 DBA 권한이 있는 사용자만 할 수 있음
/*
작성형식 : 
CREATE ROLE 롤이름;  -- 1. 롤 생성
-- 2. 생성된 롤에 권한 추가함 (부여함)
GRANT 권한종류 TO 롤이름;
GRANT 권한종류, 권한종류, .... TO 롤이름;

-- 3. 롤 사용
GRANT 롤이름 TO 사용자계정;
*/

-- 관리자계정에서 롤 생성 : ----------------------------
-- 오라클 12C 부터 공통 계정앞에 C## 붙이도록 네이밍 규칙이 정해져 있음
-- 롤이름에도 C## 붙임
-- 1. 롤 객체 생성
CREATE ROLE C##MYROLE;
-- 2. 롤에 권한 추가 (권한 부여)
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW TO C##MYROLE;
-- 3. 롤 사용
CREATE USER C##MYMY IDENTIFIED BY PASS;
GRANT C##MYROLE TO C##MYMY;

-- 로그인 확인 : SQL PLUS 에서 테스트
CONNECT C##MYMY/PASS -- 대소문자 주의
SHOW USER

-- 사용자에게 부여된 권한 확인
SELECT * FROM USER_ROLE_PRIVS;


/*
[연습] ---------------------------------------------------------
    관리자 계정에서
    롤이름 : C##MYROLE02
    롤에 부여할 객체 권한 : C##STUDENT.EMPLOYEE 테이블에 대한 SELECT
    롤 부여할 사용자 : C##MYMY
    => SQL PLUS 에서 확인
    => C##MYMY 로그인해서 EMPLOYEE 테이블 SELECT 권한 사용 확인함
    ------------------------------------------------------------    
*/

-- 1.
CREATE ROLE C##MYROLE02;
-- 2. 
GRANT SELECT ON C##STUDENT.EMPLOYEE TO C##MYROLE02; -- 롤에 권한 추가

-- 3. 
GRANT C##MYROLE02 TO C##MYMY;
-- C##MYMY 로그인 접속 => 테이블 조회
CONN C##MYMY/PASS
SELECT * FROM C##STUDENT.EMPLOYEE;

-- 권한 회수 (롤 회수) -------------------------
-- REVOKE 롤이름 FROM 사용자계정;

-- 시스템계정에서 부여한 것은 시스템계정에서 회수함
REVOKE C##MYROLE02 FROM C##MYMY;

-- C##MYMY 계정에서 자신에게 주어진 롤 정보 확인
CONN C##MYMY/PASS
SELECT * FROM USER_ROLE_PRIVS;

-- 롤 제거 -----------------------
-- DROP ROLE 롤이름;
DROP ROLE C##MYROLE02;




















