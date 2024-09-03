-- day11_trigger.sql

-- 트리거 (TRIGGER) 객체
-- 데이터베이스 이벤트 객체임
-- 주로 테이블에 DML(INSERT, UPDATE, DELETE) 이 수행될 때
-- 다른 테이블에 자동으로 함께 DML 을 작동시킬 때 이용함
/*
작성형식 : 
CREATE OR REPLACE TRIGGER 트리거이름
[BEFORE | AFTER]  -- 이벤트 발생 시점을 지정
[INSERT | UPDATE | DELETE] ON 테이블명
FOR EACH ROW  -- 개별 행단위로 실행을 의미함
[WHEN 조건식]  -- 대상 행에 대한 이벤트 조건 지정
BEGIN
    -- 위에서 지정한 이벤트 발생시 처리할 내용 (자동 실행될 내용)
    다른 테이블에 수행하려는 DML 구문 작성; 
END;
/

트리거 수정구문 없음 => ALTER TRIGGER 없음
트리거 제거 : DROP TRIGGER 트리거이름;
*/

-- 화면(콘솔)에 내용을 출력시키기 위한 설정값 확인
SHOW SERVEROUTPUT;
-- OFF 상태이면 ON 으로 바꿈
SET SERVEROUTPUT ON;

-- 샘플 테이블 만들기 : 
-- 테이블의 컬럼 구조만 복사해 오게 함
DROP TABLE EMPCPY CASCADE CONSTRAINTS;

CREATE TABLE EMPCPY
AS
SELECT EMP_ID, EMP_NAME, DEPT_ID
FROM EMPLOYEE
WHERE 1 = 0;  -- 구조만 복사해 오게 함

DESC EMPCPY;  -- 컬럼 구조 복사됨
SELECT * FROM EMPCPY;  -- 데이터 없음

-- 특정 테이블에 DML 이 수행이 되면, 자동으로 어떤 내용을 실행시키는 이벤트 객체 => 트리거임.

-- 예 : EMPCPY 테이블에 INSERT 가 수행이 되고 나면 (AFTER)
-- 자동으로 출력뷰(콘솔)에 환영메세지가 출력되는 이벤트가 실행되는 트리커 만들기

CREATE OR REPLACE TRIGGER TRI_WELCOME
AFTER INSERT ON EMPCPY
BEGIN
    DBMS_OUTPUT.PUT_LINE('입사를 환영합니다.');
END;
/

-- 트리거 자동 실행 확인 : 
INSERT INTO EMPCPY VALUES ('777', '홍길순', '90');

SELECT * FROM EMPCPY;

-- 실습 : 
-- 직원 테이블
CREATE TABLE EMP03 (
    EMPNO  NUMBER(4) PRIMARY KEY,
    ENAME  VARCHAR2(15),
    SAL  NUMBER(7, 2)
);

-- 급여 테이블
CREATE TABLE SALARY (
    NO  NUMBER  PRIMARY KEY,
    EMPNO  NUMBER(4) REFERENCES EMP03,
    SAL NUMBER(7, 2)
);

-- SALARY 테이블의 NO 컬럼 값은 시퀀스 이용함
CREATE SEQUENCE SEQ_SALARY_NO
START WITH 1
INCREMENT BY 1
NOCYCLE NOCACHE;

-- 트리거 만들기
CREATE OR REPLACE TRIGGER TRI_SALARY
AFTER INSERT ON EMP03  -- EMP03 테이블에 INSERT 실행된 다음 자동 실행되는 트리거임
FOR EACH ROW  -- INSERT 된 값 사용시 반드시 필요함
BEGIN
    INSERT INTO SALARY
    VALUES (SEQ_SALARY_NO.NEXTVAL, :NEW.EMPNO, :NEW.SAL);
    -- 바인드(BIND) 변수 : 새로 추가된 값은 :NEW.컬럼명, 기존에 기록되어 있던 갑 :OLD.컬럼명 사용함
    -- FOR EACH ROW 설정시에만 이용할 수 있음
END;
/

-- 트리거 작동전 확인
SELECT * FROM EMP03;
SELECT * FROM SALARY;

-- 트리거 자동 실행 확인 : 
INSERT INTO EMP03 VALUES (8888, '홍길수', 3500);

-- 트리거 작동후 확인
SELECT * FROM EMP03;
SELECT * FROM SALARY;   -- 자동 INSERT 확인

-- 실습 : 
-- 트리거 만들기
-- EMP03 의 직원의 급여 변경시 SALARY 테이블의 해당 직원의 급여 자동 변경되는 트리거 : TRI_SAL_UPDATE
-- EMP03 의 직원 삭제시 SALARY 테이블의 해당 직원 정보 자동 삭제되는 트리거 : TRI_SAL_DELETE

CREATE OR REPLACE TRIGGER TRI_SAL_UPDATE
AFTER UPDATE ON EMP03
FOR EACH ROW
BEGIN
    UPDATE SALARY
    SET SAL = :NEW.SAL  -- 새로 기록된 값으로 변경
    WHERE EMPNO = :OLD.EMPNO;  -- 기존 기록값으로 검색
END;
/

CREATE OR REPLACE TRIGGER TRI_SAL_DELETE
AFTER DELETE ON EMP03
FOR EACH ROW
BEGIN
    DELETE FROM SALARY
    WHERE EMPNO = :OLD.EMPNO;  -- 기존 기록값으로 검색
END;
/

-- 변경 전 확인
SELECT * FROM EMP03;
SELECT * FROM SALARY; 

UPDATE EMP03
SET SAL = 4800
WHERE EMPNO = 8888;

-- UPDATE 후 트리거 작동 확인
SELECT * FROM EMP03;
SELECT * FROM SALARY; 

DELETE FROM EMP03
WHERE EMPNO = 8888;

-- DELETE 후 트리거 작동 확인
SELECT * FROM EMP03;
SELECT * FROM SALARY; 

-- 실습 ---------------------------------------
-- 1. 상품 테이블
CREATE TABLE 상품 (
    상품코드 CHAR(4) CONSTRAINT PK_상품 PRIMARY KEY,
    상품명 VARCHAR2(15) NOT NULL,
    제조사 VARCHAR2(15),
    소비자가격 NUMBER,
    재고수량 NUMBER DEFAULT 0
);

-- 상품 등록
INSERT INTO 상품 (상품코드, 상품명, 제조사, 소비자가격) VALUES ('a001', '마우스', 'LG', 1000);
INSERT INTO 상품 VALUES ('a002', '키보드', '삼성', 5000, DEFAULT);
INSERT INTO 상품 VALUES ('a003', '모니터', 'HP', 10000, DEFAULT);

COMMIT;
SELECT * FROM 상품;

-- 2. 입고 테이블
CREATE TABLE 입고 (
    입고번호 NUMBER PRIMARY KEY,
    상품코드 CHAR(4) REFERENCES 상품 (상품코드),
    입고일자 DATE,
    입고수량 NUMBER,
    입고단가 NUMBER,
    입고금액 NUMBER    -- 입고수량 * 입고단가
);

-- 입고번호에 사용될 시퀀스 생성
CREATE SEQUENCE SEQ_입고번호
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- 입고 정보를 INSERT 하면서, 입고수량과 입고단가를 가지고 입고금액을 계산하는 입력 처리 프로시저 만들기 : 
-- 프로시저(PROCEDURE) : PL/SQL 구문 저장 객체임
-- 상품코드 --> CODE, 입고수량 --> SU,  입고금액 --> WON 변수가 전달받도록 함
CREATE OR REPLACE PROCEDURE PRO_SP_INSERT(CODE CHAR, SU NUMBER, WON NUMBER)
IS
BEGIN
    INSERT INTO 입고
    VALUES (SEQ_입고번호.NEXTVAL, CODE, SYSDATE, SU, WON, SU * WON);
END;
/

-- 3. 입력 트리거 만들기 : 
-- 입고 테이블에 상품에 대한 입고정보가 등록(INSERT)되면  <= 프로시저에 의해 실행될 것임
-- 해당 상품의 입고수량에 대해서
-- 상품 테이블의 해당 상품의 재고수량을 증가 처리하는 트리거 : TRI_PRODUCT_INSERT

CREATE OR REPLACE TRIGGER TRI_PRODUCT_INSERT
AFTER INSERT ON 입고
FOR EACH ROW
BEGIN
    UPDATE 상품
    SET 재고수량 = 재고수량 + :NEW.입고수량
    WHERE 상품코드 = :NEW.상품코드;
END;
/

-- 수정 트리거 만들기 : 
-- 입고 테이블의 입고수량이 변경(UPDATE)되면
-- 상품 테이블의 재고수량이 수정된 값으로 자동 변경되는 트리거 : TRI_PRODUCT_UPDATE

CREATE OR REPLACE TRIGGER TRI_PRODUCT_UPDATE
AFTER UPDATE ON 입고
FOR EACH ROW
BEGIN
    UPDATE 상품
    SET 재고수량 = 재고수량 - :OLD.입고수량 + :NEW.입고수량
    WHERE 상품코드 = :OLD.상품코드;
END;
/

-- 삭제 트리거 만들기 : 
-- 입고 테이블에서 상품에 대한 행이 삭제되면
-- 상품 테이블의 해당 상품의 재고수량이 삭제된 행의 입고수량만큼 빼기하는 트리거 : TRI_PRODUCT_DELETE

CREATE OR REPLACE TRIGGER TRI_PRODUCT_DELETE
AFTER DELETE ON 입고
FOR EACH ROW
BEGIN
    UPDATE 상품
    SET 재고수량 = 재고수량 - :OLD.입고수량
    WHERE 상품코드 = :OLD.상품코드;
END;
/

-- 4. 트리거 작동 확인
-- 입고 테이블에 입고상품 등록하는 프로시저 실행함
-- EXECUTE 프로시저이름(전달값, 전달값, ...);  <= 프로시저 만들 때 매개변수와 자료형, 갯수, 순서 일치되게 사용해야 함
-- 단축명령어 사용 가능함 : EXEC 프로시저이름(전달값, 전달값, ...);
EXEC PRO_SP_INSERT('a002', 20, 5000);   -- 입고 INSERT 작동
EXEC PRO_SP_INSERT('a002', 10, 5000);   -- 입고 INSERT 작동

-- 확인
SELECT * FROM 입고;  -- 입고 정보 추가된 것 확인 (프로시저 실행)
SELECT * FROM 상품;  -- 입고상품에 대한 재고수량 자동 변경 확인함 (트리거 자동 실행)

-- 수정 트리거 작동 확인
UPDATE 입고
SET 입고수량 = 15, 입고금액 = 15 * 입고단가
WHERE 입고번호 = 2;

-- 확인
SELECT * FROM 입고;  -- 입고 정보 변경 확인
SELECT * FROM 상품;  -- 입고수량 변경에 대한 재고수량 변경 확인함

-- 삭제 트리거 작동 확인
DELETE FROM 입고
WHERE 입고번호 = 2;

-- 확인
SELECT * FROM 입고;  -- 입고 정보 삭제 확인
SELECT * FROM 상품;  -- 입고수량 삭제에 대한 재고수량 변경 확인함


