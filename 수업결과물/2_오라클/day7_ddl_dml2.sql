-- day7_ddl_dml2.sql

-- 서브쿼리를 사용해서 새 테이블 만들기 ----------------------
-- 복사 기능 또는 SELECT 문 결과를 테이블로 저장하는 용도임
-- CREATE TABLE 테이블명 AS 서브쿼리;

CREATE TABLE EMP_COPY90
AS 
SELECT * FROM EMPLOYEE
WHERE DEPT_ID = '90';

SELECT * FROM EMP_COPY90;

-- 테이블 구조 확인 : DESCRIBE 명령 사용
DESC EMP_COPY90;

-- 테이블 복사본 만들기 : 
CREATE TABLE EMP_COPY
AS
SELECT * FROM EMPLOYEE;

DESC EMP_COPY;

SELECT * FROM EMP_COPY;
-- 서브쿼리를 이용해서 기존 테이블을 복사할 경우,
-- 컬럼명, 자료형, NOT NULL 제약조건, 값(DATE)은 그대로 복사됨
-- 나머지 제약조건들은 복사 안됨, DEFAULT 지정도 복사 안 됨

-- 실습 1 : 
-- 모든 직원들의 사번, 이름, 급여, 직급명, 부서명, 근무지역명, 소속국가명 조회한 결과를
-- EMP_LIST 테이블에 저장하시요.
CREATE TABLE EMP_LIST
AS
SELECT EMP_ID, EMP_NAME, SALARY, JOB_TITLE, DEPT_NAME, LOC_DESCRIBE, COUNTRY_NAME
FROM EMPLOYEE
LEFT JOIN JOB USING(JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
LEFT JOIN LOCATION ON (LOC_ID = LOCATION_ID)
LEFT JOIN COUNTRY USING (COUNTRY_ID);


SELECT * FROM EMP_LIST; -- 22행

-- 실습 2 : 
-- EMPLOYEE 테이블에서 남자 직원 정보만 골라내서, EMP_MAN 테이블에 저장하시오.
-- 컬럼은 모두 선택함
CREATE TABLE EMP_MAN AS
SELECT * 
FROM EMPLOYEE 
WHERE SUBSTR(EMP_NO, 8, 1) IN ('1', '3');

SELECT * FROM EMP_MAN ; -- 14행

-- 실습 3 : 
-- 여자 직원들의 정보만 골라내서, EML_FEMAIL 테이블에 저장하시오. 전체 컬럼 선택함
CREATE TABLE EML_FEMAIL
AS
SELECT *
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN ('2','4');

SELECT * FROM EML_FEMAIL ;  -- 8행

-- 실습 4 : 
-- 부서별로 정렬된 직원들의 명단을 PART_LIST 테이블에 저장하시오.
-- DEPT_NAME, JOB_TITLE, EMP_NAME, EMP_ID 순으로 컬럼 선택
-- PART_LIST 에 컬럼 설명 추가함 : 부서이름, 직급이름, 직원이름, 사번

CREATE TABLE PART_LIST 
AS 
SELECT DEPT_NAME, JOB_TITLE, EMP_NAME, EMP_ID 
FROM EMPLOYEE 
LEFT JOIN DEPARTMENT USING (DEPT_ID)
LEFT JOIN JOB  USING (JOB_ID)
ORDER BY DEPT_NAME;

SELECT * FROM PART_LIST ;

-- 컬럼 설명 추가
COMMENT ON COLUMN PART_LIST.DEPT_NAME IS '부서이름';
COMMENT ON COLUMN PART_LIST.JOB_TITLE IS '직급이름';
COMMENT ON COLUMN PART_LIST.EMP_NAME IS '직원이름';
COMMENT ON COLUMN PART_LIST.EMP_ID IS '사번';

-- 실습 : 제약조건이 설정된 테이블 만들기
-- 테이블명 : PHONEBOOK
-- 컬럼명 : ID CHAR(3) 기본키(저장이름 : PK_PBID)
--         PNAME       VARCHAR2(20)    널 사용못함.
--                                    (NN_PBNAME)
--         PHONE       VARCHAR2(15)    널 사용못함
--                                    (NN_PBPHONE)
--                                     중복값 입력 못함
--                                    (UN_PBPHONE)
--         ADDRESS     VARCHAR2(100)    기본값 지정함
--                                    '서울시 구로구'

-- NOT NULL을 제외하고, 모두 테이블 레벨에서 제약조건 지정함

CREATE TABLE PHONEBOOK (
    ID CHAR(3),
    PNAME VARCHAR2(20) CONSTRAINT NN_PBNAME NOT NULL,
    PHONE VARCHAR2(15) CONSTRAINT NN_PBPHONE NOT NULL,
    ADDRESS VARCHAR2(100) DEFAULT '서울시 구로구',
    CONSTRAINT PK_PBID PRIMARY KEY (ID),
    CONSTRAINT UN_PBPHONE UNIQUE (PHONE)
);

INSERT INTO PHONEBOOK
VALUES ('A01', '홍길동', '010-1234-5678', DEFAULT);

SELECT * FROM PHONEBOOK;

-- 서브쿼리로 새 테이블 만들 때,
-- 서브쿼리의 SELECT 한 컬럼명을 사용하지 않고, 새 테이블의 컬럼명을 바꿀 수도 있음

CREATE TABLE JOB_COPY
AS
SELECT * FROM JOB;

SELECT * FROM JOB_COPY;

DESC JOB_COPY;

-- 테이블 제거 : DROP TABLE 테이블명;
DROP TABLE JOB_COPY;

CREATE TABLE JOB_COPY (직급코드, 직급명,  최저급여, 최고급여) -- 전체 컬럼명 변경시에 사용
AS
SELECT * FROM JOB;

SELECT * FROM JOB_COPY;

DESC JOB_COPY;

-- 일부 컬럼 몇 개만 컬럼명을 바꾸고자 한다면
CREATE TABLE DCOPY (DID, DMANE) -- ERROR, 서브쿼리 SELECT 절 항목 갯수와 다름
AS
SELECT DEPT_ID, DEPT_NAME, LOC_ID
FROM DEPARTMENT;

-- 해결
CREATE TABLE DCOPY
AS
SELECT DEPT_ID DID, DEPT_NAME DNAME, LOC_ID
FROM DEPARTMENT;

DESC DCOPY;

-- 서브쿼리로 새 테이블 만들 때, 전체 컬럼명 바꾸면서 제약조건도 추가할 수 있음
-- 단, 외래키(FOREIGN KEY) 제약조건은 추가할 수 없음

DROP TABLE TBL_SUBQUERY;

CREATE TABLE TBL_SUBQUERY (
    EID PRIMARY KEY, 
    ENAME, 
    SAL CHECK (SAL > 2000000), -- ERROR : 서브쿼리 결과에 2백만보다 작은 값이 존재함
    DNAME, 
    JTITLE NOT NULL) -- ERROR : 서브쿼리 결과에 NULL 이 존재함
    -- 해결방법 1 : NVL() 이용해서 NULL 을 다른 값으로 바꾸는 방법
    -- 해결방법 2 : NULL을 제외
AS
SELECT  EMP_ID, EMP_NAME, SALARY, DEPT_NAME, NVL(JOB_TITLE, '미지정')
FROM EMPLOYEE
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
-- CHECK 제약 조건을 추가되게 하려면
WHERE SALARY > 2000000;

-- **************************************************************
-- 데이터 딕셔너리 (데이터 사전)
-- 사용자가 생성한 모든 객체 정보들은 테이블 형태로 DBMS  에 자동 저장 관리됨
-- 즉, 사용자가 설정한 제약조건도 자동 저장되고 있음 => USER_CONSTRAINTS
-- 저장된 정보는 조회만 할 수 있음
-- 딕셔너리는 사용자가 생성 또는 수정할 수 없음 (DBMS 가 자동으로 관리함)

DESC USER_CONSTRAINTS;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'PHONEBOOK'; 

-- CONSTRAINT_TYPE
-- P : PRIMARY KEY
-- U : UNIQUE
-- R : FOREIGN KEY
-- C : CHECK, NOT NULLL

-- 사용자가 만든 테이블 정보 : USER_TABLES, USER_CATEGORY, USER_OBJECTS
DESC USER_TABLES;

SELECT * FROM USER_TABLES;

-- 사용자가 만든 시퀀스 객체 : USER_SEQUENCES
SELECT * FROM USER_SEQUENCES;

-- 사용자가 만든 뷰 객체 : USER_VIEWS
SELECT * FROM USER_VIEWS;

-- 현재 사용자(USER)가 접근할 수 있는 모든 테이블들을 조회
SELECT * FROM ALL_TABLES;

-- DBA(DataBasa Administrator : 데이터베이스 관리자)가 접근할 수 있는 테이블 조회
-- DBA_TABLES
SELECT * FROM DBA_TABLES; -- 관리자계정에서 확인해야 함























