-- day9_ddl_view.sql

-- VIEW (뷰)---------------------------------------------
-- STORED QUERY : SELECT 쿼리문 저장하는 객체
-- VIRTUAL TABLE : 저장된 SELECT 쿼리문이 실행이 되면서 결과뷰를 보여줌
-- 사용목적 : 
-- 1. 보안에 유리 : 쿼리문을 보이지 않게 하고, 결과뷰만 보이게 함
-- 2. 복잡하고 긴 쿼리문을 직접 실행하지 않고, 저장된 쿼리문을 실행함
--       => 실행 속도가 빠름, 실제 실행구문이 간단함
-- 명령구문 : CREATE VIEW, DROP VIEW
--      ALTER VIEW 없음, ALTER VIEW 대신에 CREATE OR REPLACE VIEW 를 사용함
--  작성형식 : 
/*
CREATE [OR PEPLACE] VIEW 뷰이름
AS
서브쿼리
[WITH READ ONLY CONSTRAINT 저장이름]
[WITH CHECK OPTION CONSTRAINT 저장이름];
*/

CREATE VIEW V_EMP
AS 
SELECT * FROM EMPLOYEE; -- 권한 불충분 에러 발생하면

-- 관리자계정(SYSTEM/ORACLE)에서 권한 부여받음
--GRANT CREATE VIEW TO c##student;

-- 뷰 정보를 저장하는 딕셔너리 : USER_VIEWS, USER_CATALOG, USER_OBJECTS
-- 딕셔너리의 구조 확인
DESC USER_VIEWS;

SELECT VIEW_NAME, TEXT_LENGTH, TEXT, READ_ONLY
FROM USER_VIEWS
WHERE VIEW_NAME = 'V_EMP';

CREATE VIEW V_EMP_DEPT90
AS
SELECT EMP_NAME, DEPT_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
LEFT OUTER JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
WHERE DEPT_ID = '90';

-- 뷰 사용 : FROM 절에 테이블 대신에 사용함 => 인라인뷰 처럼 이용함
SELECT * FROM V_EMP_DEPT90;

-- 실습 : 
-- 직급명이 '사원'인 모든 직원들의 사원명, 부서명, 직급명을 조회하는 구문을 뷰로 저장하시요
-- 뷰이름 : V_EMP_DEPT_JOB
CREATE VIEW V_EMP_DEPT_JOB
AS
SELECT EMP_NAME, DEPT_NAME, JOB_TITLE
FROM EMPLOYEE 
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
WHERE JOB_TITLE = '사원';

-- 실행확인
SELECT * FROM V_EMP_DEPT_JOB;

-- 딕셔너리 확인 : 
-- 뷰 객체를 테이블 객체처럼 조회할 수도 있음
SELECT COLUMN_NAME, DATA_TYPE, NULLABLE
FROM USER_TAB_COLS
WHERE TABLE_NAME = 'V_EMP_DEPT_JOB';

-- 뷰 생성시 서브쿼리 SELECT 항목의 컬럼 별칭을 따로 지정할 수도 있음
-- SELECT 항목 전부 다 별칭 처리해야 함
CREATE OR REPLACE VIEW V_EMP_DEPT_JOB (ENAME, DNAME, JTITLE)
AS
SELECT EMP_NAME, DEPT_NAME, JOB_TITLE
FROM EMPLOYEE 
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
WHERE JOB_TITLE = '사원';

SELECT * FROM V_EMP_DEPT_JOB;

-- 서브쿼리 부분에서 별칭 적용해도 됨
CREATE OR REPLACE VIEW V_EMP_DEPT_JOB
AS
SELECT EMP_NAME 이름, DEPT_NAME 부서명, JOB_TITLE
FROM EMPLOYEE 
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
WHERE JOB_TITLE = '사원';

SELECT * FROM V_EMP_DEPT_JOB;

-- 주의 : 
-- 서브쿼리 SELECT 절에 함수계산식은 반드시 별칭 붙여야 함
CREATE OR REPLACE VIEW V_EMP
AS
SELECT EMP_NAME,
       DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남자', '3', '남자', '여자') 성별,
       ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) 근무년수
FROM EMPLOYEE;

CREATE OR REPLACE VIEW V_EMP ("Ename", "Gender", "Years")
AS
SELECT EMP_NAME,
       DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남자', '3', '남자', '여자'),
       ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) 
FROM EMPLOYEE;

SELECT * FROM V_EMP;

-- 뷰 제약조건 ----------------------------------------
-- WITH READ ONLY : 뷰를 이용한 DML 작업 못 함 (읽기전용 뷰)
-- WITH CHECK OPTION : 뷰를 테이블처럼 사용해서 DML 수행할 수 있음
--                     베이스테이블이 1개인 서브쿼리에 적용함
--                     베이스테이블에 DML 이 적용됨 => DELTE 문은 사용제한 없음
--                     => 서브쿼리 구문과 관련해서 제한된 DML(INSERT, UPDATE) 수행할 수 있음
-- 뷰 제약조건도 CONSTRAINT 이름으로 저장할 수 있음

-- WITH READ ONLY:
CREATE OR REPLACE VIEW V_EMP
AS
SELECT * FROM EMPLOYEE
WITH READ ONLY;

-- DML 사용 확인 : 
INSERT INTO V_EMP (EMP_ID, EMP_NAME, EMP_NO)
VALUES ('666',  '테스터', '901225-1234567'); -- 에러

DELETE FROM V_EMP; -- ERROR

UPDATE V_EMP
SET DEPT_ID = NULL; -- ERROR

SELECT * FROM V_EMP;

-- WITH CHECK OPTION : 
-- DELETE 문은 제한 없이 사용 가능함
-- INSERT, UPDATE 문은 조건에 따라 작업이 제한되어 사용할 수 있음
CREATE OR REPLACE VIEW V_EMP
AS
SELECT EMP_ID, EMP_NAME, EMP_NO, MARRIAGE
FROM EMPLOYEE
WHERE MARRIAGE = 'N'
WITH CHECK OPTION; -- DML 사용 가능

SELECT * FROM V_EMP;

INSERT INTO V_EMP (EMP_ID, EMP_NAME, EMP_NO, MARRIAGE)
VALUES ('666', '테스터', '991225-1234567', 'Y'); -- ERROR
-- 서브쿼리의 조건과 일치하는 값만 기록할 수 있음 

UPDATE V_EMP
SET MARRIAGE = 'Y'; -- ERROR

INSERT INTO V_EMP (EMP_ID, EMP_NAME, EMP_NO, MARRIAGE)
VALUES ('666', '테스터', '991225-1234567', 'N'); -- 베이스테이블에 추가 기록됨

SELECT * FROM EMPLOYEE;

SELECT * FROM V_EMP;

ROLLBACK;

-- SELECT 쿼리문이 저장된 뷰객체는 다른 SELECT 문의 FROM  절에  인라인뷰로 사용할 수 있음
-- 인라인뷰 : FROM 절에 사용된 서브쿼리의 결과뷰를 말함
--           FROM (서브쿼리) 별칭 => FORM 뷰이름

-- 인라인뷰 사용 예 1:
CREATE OR REPLACE VIEW V_EMP_INFO
AS
SELECT EMP_NAME, DEPT_NAME, JOB_TITLE
FROM EMPLOYEE 
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID);

SELECT * FROM V_EMP_INFO;

-- 뷰객체를 테이블 대신에 사용함
SELECT EMP_NAME
FROM V_EMP_INFO -- 테이블 대신 뷰 사용
WHERE DEPT_NAME = '해외영업1팀'
AND JOB_TITLE =  '사원';

-- 인라인뷰 사용 예 2 : 
CREATE OR REPLACE VIEW V_DEPT_SAL ("Did", "Dname", "Davg")
AS
SELECT NVL(DEPT_ID, '00'),
       NVL(DEPT_NAME, 'NONAME'),
       ROUND(AVG(SALARY), -3)
FROM DEPARTMENT
RIGHT JOIN EMPLOYEE USING (DEPT_ID)
GROUP BY DEPT_ID, DEPT_NAME;

-- 뷰를 인라인뷰로 사용시 뷰에서 만든 별칭(컬럼처럼 사용됨) 사용시 ""  묶은 별칭은 사용시에도 "" 묶어야 함
SELECT "Dname", "Davg"
FROM V_DEPT_SAL
WHERE "Davg" > 3000000;

SELECT DNAME, DAVG
FROM V_DEPT_SAL
WHERE DAVG > 3000000; -- 에러 : (DAVG != "Davg")

-- 뷰 수정 구문 별도로 없음
-- ALTER VIEW 뷰이름 없음
-- 뷰 수정을 원하면, 기존 뷰ㅠ를 삭제하고 다시 만들기함
-- 또는 CREATE OR REPLACE VIEW 사용함

-- 뷰 삭제
-- DROP VIEW 뷰이름;
DROP VIEW V_EMP;

-- FORCE 옵션 :
-- 서브쿼리(저장되는 쿼리문)에 사용된 테이블이 존재하지 않아도 뷰를 생성해 줌
-- SELECT 구문만 저장하는 용도로 쓸 때 이용함

CREATE OR REPLACE FORCE VIEW V_EMP
AS
SELECT TCODE, TNAME, TCONTENT
FROM TTT;

CREATE OR REPLACE NOFORCE VIEW V_EMP -- NOFORCE : 기본임, 생략가능
AS
SELECT TCODE, TNAME, TCONTENT
FROM TTT; -- 테이블이 존재하지 않으면 에러남


SELECT 
    EMP_NAME AS 사원명,
    EMP_NO AS 주민번호
FROM 
    EMPLOYEE
WHERE 
    SUBSTR(EMP_NO, 8, 1) IN ('1', '3');









