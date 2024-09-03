-- day7_ddl_dml.sql

-- DDL (DATA DEFINITION LANGUAGE, 데이터 정의어)
-- 명령어 : CRATE, ALTER, DROP
-- 데이터베이스 객체를 생성, 수정, 제거하는 구문임
-- 테이블 객체 : CREATE TQBLE, ALTER TABLE, DROP TABLE
-- 뷰 객체 : CREAT VIEW, DROP VIEW
-- 시퀀스 객체 : CREATE SEQUENCR, ALTER SEQUENCE, DROP SEQUENCE
-- 사용자 객체 : CREATE USER,  ALTER USER, DROP USER

-- 테이블 만들기
/*
CREAT TABLE 테이블명 (
    컬럼명 자료형,
    컬럼명 숫자자료형,
    컬럼명 날짜자료형,
    컬럼명 문자자료형(기록할 최대바이트크기) -- 문자형은 반드시 기록할 최대 바이트 크기 지정해야 함
);

테이블은 최소 1개의 컬럼은 가져야 됨 => 컬럼없는 빈 테이블은 만들 수 없음
*/

CREATE TABLE TESTL -- ERROR
CREATE TABLE TEST(); -- ERROR

CREATE TABLE TEST (
    ID NUMBER
    , NAME VARCHAR2(20)
    , ADDRESS VARCHAR2(100)
    , ENROLL_DATE DATE DEFAULT SYSDATE
);

DROP TABLE TEST;

-- SQL PLUS 에서 생성된 테이블의 구조 확인 명령어 : DESC[RIBE] 테이블명;
DESCRIBE TEST;

-- 테이블 생성 실습
CREATE TABLE ORDERS (
    ORDERNO         CHAR(4),
    CUSTNO          CHAR(4),
    ORDERDATE       DATE    DEFAULT SYSDATE,
    SHIPDATE        DATE,
    SHIPADDRESS     VARCHAR2(40),
    QUANTITY        NUMBER
);

DESC ORDERS;

-- 컬럼에 설명(COMMENT) 추가 : 
-- COMMENT ON COLUMN [소유자계정.]테이블명.컬럼명 IS '설명';

COMMENT ON COLUMN ORDERS.ORDERNO IS '주문번호';
COMMENT ON COLUMN ORDERS.CUSTNO IS '고객번호';
COMMENT ON COLUMN ORDERS.ORDERDATE IS '주문일자';
COMMENT ON COLUMN ORDERS.SHIPDATE IS '배송일자';
COMMENT ON COLUMN ORDERS.SHIPADDRESS IS '배송주소';
COMMENT ON COLUMN ORDERS.QUANTITY IS '주문수량';

-- ********************************************************************
-- 무결성 제약조건들 (CONSTRAINTS)
-- NOT NULL, UNIQUE, PRIMARY KEY, CHECK, FOREIGN KEY

-- 1. NOT NULL 제약조건
-- 컬럼에 반드시 값을 기록해야 됨 (필수 입력항목을 뜻함)
-- 컬럼에 NULL 사용 못 한다는 제약조건임
-- NULL 이 사용되면 에러 발생함
-- 주의 : 컬럼레벨에서만 설정할 수 있음 (테이블레벨에서 설정 못 함)
-- 컬럼레벨 : 컬럼명 자료형 [DEFAULT 기본값] NOT NULL

CREATE TABLE TESTNN (
    NID NUMBER(5) NOT NULL -- 컬럼레벨
    , N_NAME VARCHAR2(30)
);

-- 제약조건은 테이블에 데이터 기록시 작동됨 (검사함)
-- DML 의 INSERT 명령문 사용함
INSERT INTO TESTNN(NID, N_NAME)
VALUES (1, '테스트');

SELECT * FROM TESTNN;

INSERT INTO TESTNN(NID, N_NAME)
VALUES (NULL, '테스트2'); -- ERROR : NOT NULL 제약조건 위배

INSERT INTO TESTNN(NID, N_NAME)
VALUES (2, NULL);

SELECT * FROM TESTNN;

-- 제약조건은 DBMS 가 이름으로 관리함
-- 제약조건 설정시 이름을 지정하지 않으면 자동으로 'SYS_C...' 형식으로 이름 지정됨

-- 제약조건에 이름 같이 설정하기
-- 컬럼레벨 : 컬럼명 자료형 CONSTRAINT 이름 지정 제약조건
-- 테이블레벨 : CONSTRAINT 이름지정 제약조건 (적용할 컬럼명)

CREATE TABLE TESTNN2 (
    NID NUMBER(5) CONSTRAINT TNN2_NID_NN NOT NULL -- 컬럼레벨
    , N_NAME VARCHAR2(30)
    -- 테이블레벨에서 제약조건들을 따로 모아서 지정할 수 있음
    -- 제약조건종류 (적용할 컬럼명)
    -- CONSTRAINT 이름지정 제약조건종류 (적용할 컬럼명)
--    , CONSTRAINT TNN2_NAME_NN NOT NULL (N_NAME) -- ERROR
);

-- 2. UNIQUE 제약조건 --------------------------------------------
-- 지정 컬럼에 중복값(같은 값 두번 기록시) 입력을 검사하는 제약조건임
-- 같은 값 두번 기록 못하는 컬럼이 됨
-- NULL 은 사용할 수 있음
-- 복합키 (여러 개의 컬럼을 묶음)로 지정할 수도 있음

CREATE TABLE TESTUN(
    U_ID CHAR(3) UNIQUE,
    U_NAME VARCHAR2(10) NOT NULL
);

-- 값 기록
INSERT INTO TESTUN (U_ID, U_NAME) VALUES('AAA', '오라클');
INSERT INTO TESTUN VALUES ('AAA'. '자바'); -- 에러
INSERT INTO TESTUN VALUES (NULL, '자바'); -- NULL 사용 가능
INSERT INTO TESTUN VALUES ('AAB', '자바');

SELECT * FROM TESTUN;

-- 제약조건 설정시 이름 지정
CREATE TABLE TESTUN2 (
    UN_ID CHAR(3) CONSTRAINT TUN2_ID_UN UNIQUE
    , UN_NAME VARCHAR2(10) CONSTRAINT TUN2_NAME_NN NOT NULL
);

-- 제약조건 에러 발생시 제약조건이름으로 파악이 빠름
INSERT INTO TESTUN2 VALUES ('AAA', '오라클');
INSERT INTO TESTUN2 VALUES ('AAA', '오라클'); -- ERROR : 이름으로 확인

-- 테이블레벨 설정
CREATE TABLE TESTUN3 (
    UN_ID CHAR(3) 
    , UN_NAME VARCHAR2(10) CONSTRAINT TUN3_NAME_NN NOT NULL
    -- 테이블레벨
    , CONSTRAINT TUN3_ID_UN UNIQUE (UN_ID)
);

-- 3. PRIMARY KEY (기본키) 제약조건 ----------------------
-- NOT NULL + UNIQUE
-- 식별자(IDENTIFIR) : 테이블에서 한 행의 정보를 찾기 위해 이용할 수 있는 컬럼(속성)
-- 복합키(여러 개의 컬럼을 묶어서 하나의 제약조건을 설정함)로 지정할 수도 있음
-- 한 테이블에 한번만 사용할 수 있음

CREATE TABLE TESTPK (
    P_ID NUMBER PRIMARY KEY
    , P_NAME VARCHAR2(10) NOT NULL
    , P_DATE DATE DEFAULT SYSDATE
);

-- 값 기록
INSERT INTO TESTPK (P_ID, P_NAME) VALUES (1, '홍길동');
INSERT INTO TESTPK VALUES (2, '이순신', DEFAULT);
INSERT INTO TESTPK VALUES (3, '이순신'); -- 에러
-- INSERT 시 컬럼명 생략하면, 테이블의 모든 컬럼에 값을 기록한다는 의미임
-- VALUES (테이블 컬럼 갯수와 일치되게 값 나열 기술함)
INSERT INTO TESTPK VALUES (NULL, '이순신', SYSDATE); -- ERROR : NULL 사용 못함
 INSERT INTO TESTPK VALUES (2, '이순신', DEFAULT); -- ERROR : 중복되는 값 기록 못함

SELECT * FROM TESTPK;

CREAT TABLE TESTPK2 (
    PID NUMPER PRIMARY KEY
    , PNAME VARCHAR2(10) PRIMARY KEY
); -- ERROR : 한 테이블에 기본키(PRIMARY KEY) 는 한 개만 사용할 수 있음

-- 컬럼레벨
CREATE TABLE TESTPK2 (
    PID NUMBER CONSTRAINT TPK2_ID_PK PRIMARY KEY
    , PNAME VARCHAR2(10)
);

-- 테이블 레벨
CREATE TABLE TESTPK3(
    PID NUMBER
    , PNAME VARCHAR2(10)
    , CONSTRAINT TPK3_ID_PK PRIMARY KEY(PID)
);

-- 4. CHECK 제약조건 ----------------------------
-- 컬럼에 기록되는 값에 대해 조건 설정하는 제약조건임
-- CHECK (컬럼명 연산자 조건값 AND | OR 조건2 .........)
-- 주의 : 조건값은 바뀌는 값을 사용할 수 없음 (SYSDATE 등)

CREATE TABLE TESTCHK(
    C_NAME VARCHAR2(15) CONSTRAINT TCK_NAME_NN NOT NULL
    , C_PRICE NUMBER(5) CHECK (C_PRICE BETWEEN 1 AND 99999)
    , C_LEVEL CHAR(1) CHECK (C_LEVEL IN ('A', 'B', 'C'))
);

-- 값 기록
INSERT INTO TESTCHK VALUES ('갤럭시S23', 54000, 'A');
INSERT INTO TESTCHK VALUES ('LG G9', 125000, 'A'); -- ERROR : C_PRICE CHECK 제약조건 위배
INSERT INTO TESTCHK VALUES ('LG G9', 65000, 'D'); -- ERROR : C_LEVEL CHECK 제약조건 위배
INSERT INTO TESTCHK VALUES ('갤럭시S23', 54000, 'a'); -- ERROR : C_LEVEL CHECK 제약조건 위배
-- 기록(저장)되는 데이터(값)은 대소문자 구분함

SELECT * FROM TESTCHK;

CREATE TABLE TESTCHK2(
    C_NAME VARCHAR2(15) CONSTRAINT TCK2_NAME_NN NOT NULL
    , C_PRICE NUMBER(5) CHECK (C_PRICE BETWEEN 1 AND 99999)
    , C_LEVEL CHAR(1) CHECK (C_LEVEL IN ('A', 'B', 'C'))
--    , C_DATE DATE CHECK (C_DATE < SYSDATE) -- ERROR : 사용시 바뀌는 값은 지정 못 함
--    , C_DATE DATE CHECK (C_DATE < TO_DATE('24/12/31'))  -- ERROR : BUG
--    , C_DATE DATE CHECK (C_DATE < TO_DATE('24/12/31', 'RR/MM/DD')) -- ERROR : BUG
    , C_DATE DATE CHECK (C_DATE < TO_DATE('24/12/31', 'YYYY/MM/DD')) -- OK : BUG
);

-- 5. FOREIGN KEY 제약조건 ---------------------------
-- 다른 테이블 또는 같은 테이블 (부모 테이블)에서 제공하는 값(참조컬럼)을 사용하는 컬럼(자식레코드)을 지정할 때 이용
-- 제약사항 : 부모가 제공하는 값만 기록에 사용할 수 있게 됨
--       => 제공되지 않는 값을 사용하면 에러 발생함
-- 컬럼레벨 : [CONSTRAINT 이름] REFERENCES 부모테이블명 (참조컬럼명)
-- 테이블레벨 : 
--      [CONSTRAINT 이름] FOREIGN KEY {적용할컬럼명) REFERENCES 부모테이블명 (참조컬럼명)
-- 주의 : 참조컬럼은 반드시 PRIMARY KEY 또는 UNIQUE 제약조건이 설정된 컬럼이어야 함
-- NULL 사용할 수 있음

CREATE TABLE TESKFK (
    EID CHAR(3) REFERENCES EMPLOYEE -- EMPLOYEE 의 PRIMARY KEY 컬럼이 자동 참조컬림이 됨
    , DID CHAR(2) CONSTRAINT TFK_DID_FK REFERENCES DEPARTMENT (DEPT_ID)
    , JID CHAR(2)
    -- 테이블레벨
    , CONSTRAINT TFK_JID_FK FOREIGN KEY (JID) REFERENCES JOB (JOB_ID)
);

-- 참조테이블(부모테이블)의 참조컬럼에 있는 값만 기록에 사용할 수 있다는 제약조건임
INSERT INTO TESKFK VALUES ('300', NULL, NULL); -- ERROR : 제공되지 않는 사번 사용
INSERT INTO TESKFK VALUES ('100', NULL, NULL);
INSERT INTO TESKFK VALUES ('200', '70', NULL); -- ERROR : 제공되지 않는 부서코드 사용
INSERT INTO TESKFK VALUES ('200', '90', NULL);
INSERT INTO TESKFK VALUES ('124', '80', 'j7'); -- ERROR : 제공되지 않는 직급코드 사용
INSERT INTO TESKFK VALUES ('124', '80', 'J7');

SELECT * FROM TESKFK;

-- 참조테이블(부모테이블)의 참조컬럼(부모키)의 값 중에서, 자식레코드가 사용하고 있는 값은 삭제 못 함
-- 예 : 부서테이블의 90번 부서를 삭제(행삭제)
-- DML 의 DELETE 문 사용
/*
DELETR [FROM] 테이블명
WHERE 컬럼명 = 삭제할값; -- 삭제할 값이 기록된 행을 찾아서 삭제해라.
*/

DELETE FROM DEPARTMENT
WHERE DEPT_ID = '90'; -- ERROR : 자식 레코드가 존재하면(값이 사용중이면) 삭제 못함

DELETE FROM DEPARTMENT
WHERE DEPT_ID = '30'; -- OK : 자식 레코드가 없으면(사용되지 않은 값) 삭제할 수 있음

SELECT * FROM DEPARTMENT;

-- 방금 실행한 삭제 작업을 취소함
ROLLBACK;
-- 확인
SELECT * FROM DEPARTMENT;

-- FOREIGH KEY 제약조건 설정시에 삭제 옵션 추가할 수 있음
-- 삭제 옵션 (DELETION OPTION) : 부모키 삭제 여부 지정 옵션
-- RESTRICTED (삭제 못 함, 기본), SET NULL (자식레코드 NULL로 바꿈), CASCADE(함께 삭제)

-- ON DELETE SET NULL --------------------------------
-- 부모키 값 삭제시 자식 레코드의 컬럼값을 NULL 로 바꿈

-- 부모키 제공 테이블 : 
CREATE TABLE PRODUCT_STATE (
    PSTATE CHAR(1) PRIMARY KEY
    , PCOMMENT VARCHAR2(10)
);

INSERT INTO PRODUCT_STATE VALUES('A', '최고급');
INSERT INTO PRODUCT_STATE VALUES('B', '보통');
INSERT INTO PRODUCT_STATE VALUES('C', '저급');

SELECT * FROM PRODUCT_STATE;

-- 외래키(FOREIGN KEY) 설정 테이블 : 
CREATE TABLE PRODUCT (
    PNAME VARCHAR(20) PRIMARY KEY
    , PPRICE NUMBER CHECK (PPRICE > 0)
    , PSTATE CHAR(1) REFERENCES PRODUCT_STATE ON DELETE SET NULL
);

INSERT INTO PRODUCT VALUES ('갤럭시', 654000, 'A');
INSERT INTO PRODUCT VALUES ('G9', 874500, 'B');
INSERT INTO PRODUCT VALUES ('맥북', 2500000, 'C');

SELECT * FROM PRODUCT;

SELECT *
FROM PRODUCT
NATURAL JOIN PRODUCT_STATE;

-- 부모테이블의 참조컬럼 값 삭제 확인
DELETE FROM PRODUCT_STATE
WHERE PSTATE = 'A'; -- 행삭제, 에러 안 남

-- 자식 레코드 값 확인 : NULL 로 바뀐 것 확인
SELECT * FROM PRODUCT;

-- ON DELETE CASCADE ------------------------
-- 부모키 값 삭제시 자식 레코드 행도 함께 삭제함

CREATE TABLE PRODUCT2 (
    PNAME VARCHAR(20) PRIMARY KEY
    , PPRICE NUMBER CHECK (PPRICE > 0)
    , PSTATE CHAR(1) REFERENCES PRODUCT_STATE ON DELETE CASCADE
);

INSERT INTO PRODUCT2 VALUES ('갤럭시', 654000, 'A');
INSERT INTO PRODUCT2 VALUES ('G9', 874500, 'B');
INSERT INTO PRODUCT2 VALUES ('맥북', 2500000, 'C');

SELECT * FROM PRODUCT2;

-- 부모키 삭제
DELETE FROM PRODUCT_STATE
WHERE PSTATE = 'B'; -- 1행 삭제, 에러 안 남

-- 자식 레코드 확인 : 행이 함께 삭제된 걸 확인
SELECT * FROM PRODUCT2;

create table constraint_emp(
    eid         char(3) constraint pkeid primary key,
    ename       varchaR2(20) constraint nename not null,
    ENO         CHAR(14) CONSTRAINT NENO NOT NULL CONSTRAINT UENO UNIQUE,
    EMAIL       VARCHAR2(25) CONSTRAINT UEMAIL UNIQUE,
    PHONE       VARCHAR2(12),
    HIRE_DATE   DATE DEFAULT SYSDATE,
    JID         CHAR(2) CONSTRAINT FKJID REFERENCES JOB ON DELETE SET NULL,
    SALARY      NUMBER,
    BONUS_PCT   NUMBER,
    MARRIAGE    CHAR(1) DEFAULT 'N' CONSTRAINT CHK CHECK (MARRIAGE IN ('Y', 'N')),
    MID         CHAR(3) CONSTRAINT FKMID REFERENCES CONSTRAINT_EMP ON DELETE SET NULL,
    DID         CHAR(2),
    CONSTRAINT FKDID FOREIGN KEY(DID) REFERENCES DEPARTMENT ON DELETE CASCADE
);

