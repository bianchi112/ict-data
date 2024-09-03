-- day1 : 관리자계정(system/oracle) 에서 일반 사용자계정 관리하기

-- 현재 접속된 사용자 계정 보기
show user;
SHOW USER;
Show uSer;

/*
11g 까지는 오라컬 설치시 스터디를 위한 계정이 제공이 되었음.
soctt/tiger, hr/hr => 샘플 테이블과 데이터들이 제공이 됨
18c 부터는 제공이 안 됨
*/

-- 사용자 계정 만들기
-- create user 아이디명 identified by 암호;
-- 12c 부터는 사용자계정(아이디) 만들대, 아이디 글자 앞에 반드시 c## 을 붙여야 함

-- 데이터베이스는 사용자계정과 암호 생성 후에 권한을 부여해야 함
-- 권한 부여 명령 구문 : 
-- grant 권한종류, 권한종류, ..... to 사용자계정;
-- 권한종류 : create session(로그온 권한), create table, insert ito, update, delete, select 등등
-- 여러 권한들을 모아 놓은 객체를 이용할 수도 있음 : 롤(ROLE) 이라고 함
-- 오라클이 제공하는 롤을 이용할 수도 있음 : CONNECT 롤, RESOURCE 롤 등
-- 명령 구문 : GRANT 롤이름, 롤이름 TO 사용자계정;

-- 수업용 계정 만들고, 권한과 테이블스페이스 할당
CREATE USER c##student IDENTIFIED BY student;
GRANT CONNECT, RESOURCE TO c##scott;
ALTER USER c##student QUOTA 1024M ON USERS;

-- 오라클 12C 까지는 권한(GRANT)만 부여하면 테이블 생성과 데이터 기록 저장 가능했음
-- 18C 부터는 권한 부여 후에 티이블 스페이서(TABLE SPACE)를 할당받아야
-- 테이블 생성과 데이터 저장 기록이 가능해졌음
-- 사용자 정보 변경으로 설정함
-- 명령 구문 : 
-- ALTER USER 사용자계정 QUOTA 할당받을크기 ON USERS;

-- 사용자계정 : c##scott, 암호 : tiger
-- 사용자 추가 생성하고, 접속 및 자원 사용 롤(Role)을 이용해서 권한부여
-- 테이블 스페이스 할당함 : 1024M

CREATE USER c##scott IDENTIFIED BY tiger;
GRANT CONNECT, RESOURCE TO c##scott;
ALTER USER c##scott QUOTA 1024M ON USERS;

/*
과제용 계정 : c##homework, 암호 : homework
권한 부여 : 롤 이용 - connect, resource
테이블 스페이스 할당 : 1024M 
접속 뷰에 '과제용계정' 추가 등록하기
과제용계정에 사용할 스크립트 실행함 
*/
CREATE USER c##homework IDENTIFIED BY homework;
GRANT CONNECT, RESOURCE TO c##homework;
ALTER USER c##homework QUOTA 1024M ON USERS;

drop user c##homework;

-- 사용자계정 제거하기
-- 사용자계정에 문제가 있을 시, 제거하고 다시 만들기함
-- 구문 : DROP USER 사용자계졍 [CASCADE];

CREATE USER c##ttt IDENTIFIED BY ttt;

DROP USER c##ttt;
DROP USER c##ttt CASCADE;

-- 데이터베이스 접속시 계정 또는 암호를 오타로 몇번 에러를 발생시키거나
-- 자바 또는 파이썬의 코드로 SQL구문을 데이터베이스로 전송해서 실행 요청할 경우
-- SQL구문 에러가 있을 경우 (몇번 반복될 경우)
-- 데이터베이스가 해당 사용자계정을 잠글수 있음 (LOCK)
-- 관리자계정에서 잠긴 사용자계정을 LOCK 해제 처리해야 함
-- 구문 : ALTER USER 사용자계정 IDENTIFIED BY 암호 ACCOUNT UNLOCK;

-- 사용자계정 잠그기 (LOCK)
ALTER USER c##student IDENTIFIED BY student ACCOUNT LOCK; -- 잠금
ALTER USER c##student IDENTIFIED BY student ACCOUNT UNLOCK; -- 해제

-- 암호 변경시
-- ALTER USER 사용자계정 IDENRIFIED BY 바꿀암호;

CREATE USER c##ttt IDENTIFIED BY ttt;
GRANT CONNECT TO c##ttt;
CONN c##ttt/ttt;

ALTER USER c##ttt IDENTIFIED BY s123;
CONN c##ttt/ttt; -- 접속 에러 확인
DROP USER c##ttt;











