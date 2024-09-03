-- day9_ddl_sequence.sql

-- 시퀀스 (SEQUENCE)
-- 자동 정수(숫자) 발생하는 객체
-- 순차적으로 정수값을 자동으로 발생함
-- 객체 생성 구문 :
/*
CREATE SEQUENCE 시퀀스이름
[START WITH 시작숫자] -- 생략되면 기본 1 적용
[INCREMENT BY 증가감소숫자] -- 생략되면 기본 1 증가임
[MAXVALUE 최종값 | NOMAXVALUE (기본)] -- NOMAXVALUE 이면 10의 27승까지 값을 발생함
[MINVALUE 최소값 | NOMINVALUE (기본)] -- NOMINVALUE 이면 -10의 26승까지 값을 발생함
[CYCLE | NOCYCLE (기본)] -- 최종값(최소값)에서 값이 순환되면 무조건 1부터 시작함
[CACHE 저장갯수 | NOCACHE (기본)] -- 캐시 메모리에 미리 숫자를 발생시켜 놓고 하나씩 꺼냄 (저장갯수 2~10)
*/

-- 시퀀스 만들기 1 :
CREATE SEQUENCE SEQ_EMPID
START WITH 300 -- 300부터 시작
INCREMENT BY 5 -- 5씩 증가
MAXVALUE 310 -- 310까지 숫자를 발생
NOCYCLE --310 생성 후 더이상 숫자 생성 안 됨
NOCACHE; -- 미리 메모리에 숫자 생성 저장 안 함

-- 시퀀스 관련 딕셔너리 확인 : USER_SEQUENCES, USER_OBJECTS
DESC USER_SEQUENCES;

SELECT * FROM USER_SEQUENCES;

SELECT SEQUENCE_NAME, CACHE_SIZE, LAST_NUMBER
FROM USER_SEQUENCES;
-- LAST_NUMBER : 다음 발생값을 의미함

-- 시퀀스 사용 : 스퀀스이름.NEXTVAL 속성 사용으로 값을 발생시킴
SELECT SEQ_EMPID.NEXTVAL FROM DUAL;
-- NOCYCLE 이기 때문에 최종값 310 다음 값 발생시키면 에러 발생

-- 시퀀스 만들기 2 :
CREATE SEQUENCE SEQ2_EMPID
START WITH 5
INCREMENT BY 5
MAXVALUE 15
CYCLE
NOCACHE;

-- 사용 : 
SELECT SEQ2_EMPID.NEXTVAL FROM DUAL;
-- 5, 10, 15, 1, 6, 11, 1, 6, 11.... 반복됨

-- 시퀀스  사용 속성 : 
-- 시퀀스이름.NEXTVAL : 새로운 정수 숫자를 발생시키는 속성임
-- 시퀀스이름.CURRVAL : 시퀀스가 마지막으로 발생한 값 확인하는 속성임
--      주의 : 시퀀스 객체 만들고, NEXTVAL 을 먼저 실행하고 나서 사용해야 함
--           NEXTVAL 실행하지 않고 CURRVAL 사용하면 에러 발생함

CREATE SEQUENCE SEQ3_EMPID
INCREMENT BY 5
START WITH 300
MAXVALUE 310
NOCYCLE NOCACHE;

-- 시퀀스 객체 만들고 바로 CURRVAL 사용 확인
SELECT SEQ3_EMPID.CURRVAL FROM DUAL; -- DRROR

SELECT SEQ3_EMPID.NEXTVAL FROM DUAL; -- 300
SELECT SEQ3_EMPID.CURRVAL FROM DUAL; -- 마지막 발생값 300 확인

-- 시퀀스 객체는 실제 INSERT 문에서 순번 기록용으로 사용함
CREATE SEQUENCE SEQID
START WITH 300
INCREMENT BY 1 -- 기본이 1임, 생략해도 됨
MAXVALUE 310
NOCYCLE NOCACHE; 

INSERT  INTO EMP_COPY (EMP_ID, EMP_NAME,EMP_NO)
VALUES (SEQID.NEXTVAL, '김영민', '940301-1234567');

INSERT  INTO EMP_COPY (EMP_ID, EMP_NAME,EMP_NO)
VALUES (TO_CHAR(SEQID.NEXTVAL), '구진표', '940305-1234567');

SELECT * FROM EMP_COPY;

-- 시퀀스 수정 -----------------------------------------------
-- 주의 : START WITH 는 변경 못 함, 변경을 원하면 시퀀스 삭제하고 다시 만들기함
/*
수정 구문 : 
ALTER SEQUENCE 시퀀스이름
[INCREMENT BY 증가감소숫자변경]
[MAXVALUE 최종값변경 | NOMAXVALUE 로 변경]
[MINVALUE 최소값변경 | NOMINVLAUE 로 변경]
[CYCLE 로 변경 | NOCYCLE 로 변경]
[CACHE 저장갯수변경 |  NOCACHE 변경];

변경한 이후에 사용하면, 수정된 내용으로 값 발생함
*/

-- 시퀀스 수정  예 : 
CREATE SEQUENCE SEQID2
START WITH 300
INCREMENT BY 1
MAXVALUE 310
NOCYCLE NOCACHE;

SELECT SEQID2.NEXTVAL FROM DUAL; -- 300
SELECT SEQID2.NEXTVAL FROM DUAL; -- 301

ALTER SEQUENCE SEQID2
INCREMENT BY 5;

SELECT SEQID2.NEXTVAL FROM DUAL; -- 306

-- 시퀀스 삭제 --------------------
-- DROP SEQUENCE 시퀀스이름;
DROP SEQUENCE SEQID2;




























