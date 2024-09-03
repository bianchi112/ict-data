-- day8_tcl.sql

-- TCL (Transaction Control Language : 트랜잭션 제어어)
-- 명령어 : COMMIT, ROLLBACK, SAVEPOINT
-- DMP (INSERT, UPDATE, DELETE) 사용시 함께 사용함

-- 트랜잭션의 시작 : 
-- 이전 트랜잭션이 종료되고 나서, 첫번째 DML 명령구문이 실행될 때
-- DDL (CREATE, ALTER, DEOP) 구문이 실행될 때 : 직전 트랜잭션은 AUTO COMMIT 됨

-- 트랜잭션의 종료 : 
-- COMMIT (저장 반영), ROLLBACK(명령구문들 취소) 실행
-- 자동 종료 : 새로운 DDL 명령 구문이 실행될 때

-- DDL 실행 : 트랜잭션 시작
ALTER TABLE EMPLOYEE
DISABLE CONSTRAINT FK_MGRID; -- 제약조건을 비활성화시킴

SAVEPOINT S0;

INSERT INTO DEPARTMENT
VALUES ('40', '기획전략팀', 'A1');
-- 확인
SELECT * FROM DEPARTMENT;

SAVEPOINT S1;

UPDATE EMPLOYEE
SET DEPT_ID = '40'
WHERE DEPT_ID IS NULL;
-- 확인
SELECT * FROM EMPLOYEE
WHERE DEPT_ID =  '40';

SAVEPOINT S2;

DELETE FROM  EMPLOYEE;
-- 확인
SELECT COUNT(*) FROM EMPLOYEE; -- 0

--ROLLBACK;  -- 트랜잭션 안의 DML 명령 모두 취소

-- S2 까지 롤백
ROLLBACK TO S2; -- DELETE 취소

-- 확인
SELECT * FROM EMPLOYEE;
SELECT COUNT(*) FROM EMPLOYEE;

-- S1 까지 롤백
ROLLBACK TO S1; -- UPDATE 취소

-- 확인
SELECT * FROM EMPLOYEE
WHERE DEPT_ID =  '40';

ROLLBACK TO S0; -- INSERT 취소

-- 확인
SELECT * FROM DEPARTMENT;












