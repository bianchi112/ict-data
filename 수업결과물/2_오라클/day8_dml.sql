-- day8_dml.sql

-- DML (Data Manipulation Language : 데이터 조작어)
-- 명령구문 : INSERT, UPDATE, DELETE
-- 테이블에 데이터를 추가 기록 (저장 : INSERT) => 행갯수 늘어남
-- 테이블에 기록된 데이터(컬럼값)를 수정 (UPDATE) => 행갯수 영향없음
-- 테이블에 기록된 행을 삭제 (DELETE)= 행갯수 줄어듦

-- CRUD (C: INSERT, R: SELECT, U: UPDATE, D: DELETE)
-- TRUNCATE 문 : 테이블의 모든 행을 삭제함 (복구 안됨)

-- UPDATE 문 -------------------------------
/*
기록된 데이터 값을 변경(수정)하는 구문
작성형식 : 
UPDATE 테이블명
SET 값바꿀컬럼명 = 바꿀값, 값바꿀컬럼명 = DEFAULT, 값바꿀컬럼명 = (서브쿼리)
WHERE 컬럼명 연산자 비교값 | (서브쿼리);

주의 : 
WHERE 절이 생략되면  테이블의 해당 컬럼값 전체가 변경됨
바꿀 값 해당 컬럼의 제약조건에 위배되지 않아야 함
*/

SELECT * FROM DCOPY;

UPDATE DCOPY
SET DNAME = '인사팀'
WHERE DID = '10'; -- WHERE 절이 생략되면, 컬럼 전체 값이 변경됨

-- 방금 사용한 DML 구문은 실행 취소됨
ROLLBACK;

UPDATE DCOPY
SET DNAME = '홍보팀'
WHERE DID = '30';

-- UPDATE 문 SET 절에 바꿀 값 대신에 서브쿼리 사용할 수 있음
-- WEHRE 절에 비교값 대신에 서브쿼리 사용할 수 있음

SELECT  * FROM EMP_COPY;

-- 심하균 직원의 직급코드와 급여를
-- 성해교 직원의 직급코드와 급여로 변경하시오

-- UPDATE 전 데이터 확인
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMP_COPY
WHERE EMP_NAME IN ('심하균', '성해교');

UPDATE EMP_COPY
SET JOB_ID = (SELECT JOB_ID FROM EMP_COPY
                WHERE EMP_NAME = '성해교'),
    SALARY = (SELECT SALARY FROM EMP_COPY
                WHERE EMP_NAME = '성해교')
WHERE EMP_NAME = '심하균';

-- 다중열 서브쿼리로 변경
UPDATE EMP_COPY
SET (JOB_ID, SALARY) = (SELECT JOB_ID,  SALARY FROM EMP_COPY
                        WHERE EMP_NAME = '성해교')
WHERE EMP_NAME = '심하균';

-- UPDATE 후 데이터 확인
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMP_COPY
WHERE EMP_NAME IN ('심하균', '성해교');

-- SET 절에 바꿀 값에 DEFAULT 사용해도 됨
-- DEFAULT 로 설정된 기본값이 사용됨(DEFAULT 설정이 안 된 컬럼이면 NULL 처리됨)
DESC EMP_COPY;

ALTER TABLE EMP_COPY
MODIFY (MARRIAGE DEFAULT 'N');

-- 변경 전 확인
SELECT EMP_NAME, MARRIAGE
FROM EMP_COPY
WHERE EMP_ID = '210';

-- 변경
UPDATE EMP_COPY
SET MARRIAGE = DEFAULT
WHERE EMP_ID = '210';

-- 변경 후 확인
SELECT EMP_NAME, MARRIAGE
FROM EMP_COPY
WHERE EMP_ID = '210';

-- UPDATE 문 WHERE 절에도 서브쿼리 적용 가능
-- 예 : 해외영업2팀 직워들의 보너스포인트 모두 0.3으로 변경하시오.
UPDATE EMP_COPY
SET BONUS_PCT = 0.3
WHERE DEPT_ID = (SELECT DEPT_ID
                 FROM DEPARTMENT
                 WHERE DEPT_NAME = '해외영업2팀');

-- 확인
SELECT EMP_NAME, BONUS_PCT, DEPT_ID
FROM EMP_COPY
WHERE DEPT_ID = (SELECT DEPT_ID
                 FROM DEPARTMENT
                 WHERE DEPT_NAME = '해외영업2팀');

ROLLBACK;

-- SET 절에 변경값은 제약조건 위배되지 않는 값이어야 한다.
ALTER TABLE EMP_COPY
ADD CONSTRAINT FK_DID_ECOPY FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT;

-- 참조컬럼(부모키) 값 확인
SELECT DEPT_ID
FROM DEPARTMENT;

UPDATE  EMP_COPY
SET DEPT_ID = '65' -- ERROR : 제공되지 않는 값임
WHERE DEPT_ID IS NULL;

-- INSERT 문 --------------------------------------
-- 테이블에 새로운 데이터를 기록 저장할 때 사용함 : 행 갯수가 늘어남
/*
작성형식 : 
INSERT INTO 테이블명 (값기록할 컬럼명, 컬럼명, ......)
VALUED (기록할값, 기록할값, .....);

VALUES 대신에 서브쿼리 사용해도 됨, (서브쿼리) 괄호 생략함
INSERT INTO 테이블명
(SELECT 서브쿼리);

주의 : 
1. 나열한 컬럼과 기록할 값의 갯수와 자료형 순서도 일치해야 함
2. 컬럼 나열이 생략되면, 테이블의 모든 컬럼에 값을 기록한다는 의미임
    => 테이블의 컬럼 생성 순서에 맞춰서 값을 기록해야 함
3. 기록값은 제약조건 위배되지 않는 값 사용할 것
4. 컬럼과 기록값에 논리적인 오류 주의할 것 (EMP_NO 에 직원이름 기록 등)
*/

CREATE TABLE DEPT (
    DEPTID CHAR(2)
    , DEPTNAME VARCHAR(20)
);

SELECT COUNT(*) FROM DEPT; -- 0
SELECT * FROM DEPT;

INSERT INTO DEPT (DEPTID, DEPTNAME)
VALUES ('10', '회계팀');

SELECT COUNT(*)  FROM DEPT; -- 1
SELECT * FROM DEPT;

INSERT INTO DEPT
VALUES ('20', '인사팀');

SELECT COUNT(*)  FROM DEPT; -- 2
SELECT * FROM DEPT;

-- 지금 실행된 DML 명령문(INSERT, UPDATE, DELETE)은 메모리의 버퍼상에서 작동되었음
-- 테이블에 추가/수정/삭제된 실행의 결과는 디스크상의 데이터베이스 파일 시스템으로 저장(반영)시커야 함
-- 트랜잭션 명령어 (TCL : Transaction Control Language, 트랜잭션 제어어) : COMMIT,  ROLLBACK

COMMIT;

-- 테이블이 가진 전체 컬럼에 값 기록시에는 컬럼명 생략할 수 있음
-- INSERT 시에 기록할 값 대신에 DEFAULT, NULL 사용해도 됨
SELECT * FROM  EMP_COPY; -- 22행
DESC EMP_COPY; -- 컬럼 12개

INSERT INTO EMP_COPY (EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, HIRE_DATE,
                      JOB_ID, SALARY, BONUS_PCT, MARRIAGE, MGR_ID, DEPT_ID)
VALUES ('900', '홍길동', '891225-1234567', 'hong123@test.org', '01012345678', '20/06/12',
        'J6', 4500000, 0.05, DEFAULT, '176', NULL);

SELECT * FROM  EMP_COPY; -- 23행

SELECT * FROM EMP_COPY
WHERE EMP_ID = '900'; -- 조회 확인

COMMIT;

INSERT INTO EMP_COPY
VALUES ('840', '하지언', '880315-2345678', 'ha_88@test.org', '01088887777', '22/03/15',
        'J6', 4300000, 0.045, 'Y', '141', '30');

SELECT * FROM  EMP_COPY; -- 24행

COMMIT;

-- INSERT 시에 컬럼명 일부 생략되면, 해당 컬럼은 NULL 처리됨
-- DEFAULT 가 지정되지 않은 컬럼에 DEFAULT 사용하면 NULL 처리됨
INSERT INTO EMP_COPY (EMP_ID, EMP_NAME, EMP_NO, SALARY, MARRIAGE)
VALUES ('888', '신예찬', '880209-1456789', DEFAULT, DEFAULT);

SELECT * FROM  EMP_COPY
WHERE EMP_ID = '888'; -- 25행

-- INSERT 에 서브쿼리 사용
-- VALUES 대신에 사용함

CREATE TABLE EMP(
    EMP_ID CHAR(3)
    , EMP_NAME VARCHAR2(20)
    , DEPT_NAME VARCHAR2(20)
);

SELECT * FROM EMP;

INSERT INTO EMP
SELECT EMP_ID, EMP_NAME, DEPT_NAME
FROM EMPLOYEE
LEFT OUTER JOIN DEPARTMENT USING (DEPT_ID); -- 22행 추가

SELECT * FROM EMP;

COMMIT;

-- 값 기록시 제약조건 위배되지 않는 값이어야 함

-- EMP_COPY 테이블에 제약조건 추가
ALTER TABLE EMP_COPY
--ADD PRIMARY KEY (EMP_ID);
--ADD CONSTRAINT FK_MID_ECOPY FOREIGN KEY (MGR_ID) REFERENCES EMP_COPY;
ADD CONSTRAINT FK_JID_ECOPY FOREIGN KEY (JOB_ID) REFERENCES JOB
ADD UNIQUE (EMP_NO)
ADD CONSTRAINT CHK_MRG_ECOPY CHECK (MARRIAGE IN ('Y', 'N'));

-- DEFAULT 변경
ALTER TABLE EMP_COPY
MODIFY (HIRE_DATE DEFAULT SYSDATE);

-- 제약조건 위배 에러 확인
INSERT INTO EMP_COPY (EMP_ID, EMP_NAME, EMP_NO)
VALUES (NULL, '홍길순', '911123-2345678'); -- 에러 : EMP_ID 는 PRIMARY KEY 임, NULL 사용 못 함

INSERT INTO EMP_COPY (EMP_ID, EMP_NAME, EMP_NO)
VALUES ('100', '홍길순', '911123-2345678'); -- 에러 : EMP_ID 는 PRIMARY KEY 임, 같은 값 기록 못 함

INSERT INTO EMP_COPY (EMP_ID, EMP_NAME, EMP_NO)
VALUES ('777', NULL, '94823-2345678'); -- 에러 : EMP_NAME 은 NOT NULL 설정있음, NULL 사용 못함

INSERT INTO EMP_COPY (EMP_ID, EMP_NAME, EMP_NO)
VALUES ('777', '홍길순', '741122-2515789'); -- 에러 : EMP_NO 은 UNIQUE 설정있음, 같은 값 두번 기록 못함

INSERT INTO EMP_COPY (EMP_ID, EMP_NAME, EMP_NO)
VALUES ('777', '홍길순', NULL); -- 에러 : EMP_NO 은 NOT NULL 설정있음, NULL 사용 못함

-- DELETE 문 -------------------------------------
-- 행을 삭제하는 구문임
-- 테이블의 행갯수 줄어듦
-- ROLLBACK 가능함 (DELETE 실행을 취소할 수 있음)
/*
DELETE FROM 테이블명
WHERE 컬럼명 연산자 비교값;

주의 : 
1. FOREIGN KEY 제약조건으로 참조(REFERENCE)되고 있는 테이블의 참조컬럼(부모키)은 삭제 불가능임
    => 외래키 제약조건 지정시 삭제를 (SET NULL, CASCADE)이 함께 설정된 경우는  삭제 가능함
2. WHERE 절이 생략되면 테이블의 모든 행이 삭제됨 (복구 가능함)

테이블의 모든 행을 삭제하는 명령 구문 : 
TRUNCATE TABLE 테이블명; --> 보구 불가능(롤백 안됨)
*/

SELECT * FROM DCOPY; -- 7행

-- WHERE 절 생략
DELETE FROM DCOPY;
-- 확인
SELECT * FROM DCOPY; -- 0행

ROLLBACK; -- DELETE 취소
SELECT * FROM DCOPY; -- 7행  : 복구됨

TRUNCATE TABLE DCOPY;
SELECT * FROM DCOPY; -- 0행
ROLLBACK; -- 복구 안 됨
SELECT * FROM DCOPY; -- 0행 

-- 다른 테이블에서 FOREIGN KEY(외래키)로 참조하고 있는 값(부모키)은 삭제 못 함
DELETE FROM DEPARTMENT
WHERE DEPT_ID = '90'; -- EMPLOYEE  의 DEPT_ID 에서 사용하고 있는 값임, 삭제 못 함

-- 부모키 확인
SELECT * FROM DEPARTMENT
ORDER BY DEPT_ID;

-- 자식레코드 확인 : 사용하는 컬럼
SELECT  DISTINCT DEPT_ID
FROM EMPLOYEE
ORDER BY 1 NULLS LAST;

-- 사용되지 않은 부모키는 삭제할 수 있음
SELECT * FROM EMP_COPY
WHERE DEPT_ID = '30';

UPDATE EMP_COPY
SET DEPT_ID = NULL
WHERE EMP_ID = '840';

COMMIT;

DELETE FROM DEPARTMENT
WHERE DEPT_ID = '30';

ROLLBACK;



