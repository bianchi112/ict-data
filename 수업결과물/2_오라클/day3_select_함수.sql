-- day3_select_함수.sql

-- 오라클에서 제공하는 함수(function)
-- 다른 dbms 에서도 사용이 비슷하거나 같음

-- 함수(FUNCTION)
-- 컬럼에 기록된 값을 읽어서 함수가 처리한 겨로가를 리턴(반환)하는 형태임
-- 사용 : 함수명(컬럼명)

-- 단일행 함수와 그룹 함수로 구분됨 => 리턴하는 결과행의 갯수가 다름
-- 단일행 함수(SINGLE ROW FUNCTION) :
-- 지정하는 컬럼의 값이 N개이면, 함수가 처리한  결과값도 N개임
-- 즉, 한 행(한 개)씩 다루는 함수

-- 그룹  함수(GROUP FUNCTION) :
-- 읽은 값이 N개이면, 리턴하는 결과값은 1개임

SELECT EMAIL -- 22행
       , UPPER(EMAIL) -- 22행
FROM EMPLOYEE;

SELECT SUM(SALARY) -- 1행
FROM EMPLOYEE;

SELECT SALARY FROM EMPLOYEE;

-- SELECT 절에서 그룹함수와 단일행함수는 같이 사용 못 함
SELECT SALARY, SUM(SALARY)
FROM EMPLOYEE;

SELECT  UPPER(EMAIL), SUM(SALARY) -- 결과행의 갯수가 다름 : ERROR
FROM EMPLOYEE;
-- 현재 데이터베이스는 관계형 데이터베이스(RDB)임
-- RDB는 데이터를 2차원 테이블(반드시 사각형)임 => 즉,  사각형이 아닌 결과는 출력 못 함

-- 그룹함수는 WHERE 절에서 사용 못 함
-- 예 : 직원들 중에서 직원 전체 급여의 평균보다 많은 급여를 받은 직원 조회`ㅋ
SELECT *
FROM EMPLOYEE
WHERE SALARY > AVG(SALARY);

-- 해결 1
SELECT AVG(SALARY)
FROM EMPLOYEE;

SELECT *
FROM EMPLOYEE
WHERE SALARY > 2961818.18181818181818181818181818181818; -- 7행

-- 해결 2
SELECT *
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE); -- 7행

-- 그룹함수 ********************************************************
-- SUM(), AVG(), MIN(), MAX(), COUNT()

-- SUM(컬럼명) | SUM(DISTINCT 컬럼명)
-- 합계를 구해서 리턴
-- 소속부서가 50이거나 부서가 배정되지 않은 직원들의 급여 합계 조회
SELECT SUM(SALARY) 급여합계,
       SUM(DISTINCT SALARY) "중복값 제외한 급여합계"
FROM EMPLOYEE
WHERE DEPT_ID = '50' OR DEPT_ID IS NULL;

-- 사용된 값들 확인
SELECT DEPT_ID, SALARY
FROM EMPLOYEE
WHERE DEPT_ID = '50' OR DEPT_ID IS NULL;  -- 8행

-- AVG(컬럼명) | AVG(DISTINCT 컬럼명)
-- 평균을 구해서 리턴

-- 소속부서가 50 또는 90 또는 NULL 인 직원들의 보너스포인트 평균 조회
SELECT AVG(BONUS_PCT) -- /4
      ,AVG(DISTINCT BONUS_PCT) -- /3
      ,AVG(NVL(BONUS_PCT,0)) -- /11
FROM EMPLOYEE
WHERE DEPT_ID IN ('50', '90') OR DEPT_ID IS NULL;

-- 사용된 값들 확인
SELECT DEPT_ID, BONUS_PCT
FROM EMPLOYEE
WHERE DEPT_ID IN ('50', '90') OR DEPT_ID IS NULL; -- 11행

-- MAX(컬럼명) | MAX(DISTINCT 컬럼명)
-- 가장 큰 값 리턴(숫자, 날짜, 문자 모두 처리함)

-- MIN(컬럼명) | MIN(DISTINCT 컬럼명)
-- 가장 작은 값 리턴 (숫자, 날짜, 문자 모두 처리함)

-- 오라클 DATA TYPE : 테이블의 컬럼에 지정함
-- 문자형(CHAR, VARCHAR2, LONG, CLOB), 숫자형(NUMBER), 날짜형(DATE)

-- 부서코드가 50 또는 90인 직원들의
-- 직급코드(CHAR)의 최대값, 최소값
-- 입사일(DATE)의 최대값, 최소값
-- 급여(NUMBER)의 최대값, 최소값 조회
SELECT MAX(JOB_ID), MIN(JOB_ID), 
       MAX(HIRE_DATE), MIN(HIRE_DATE),
       MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE
WHERE DEPT_ID IN ('50', '90');

-- COUNT(*) | COUNT(컬럼명) | COUNT(DISTINCT 컬럼명)
-- COUNT(*) : NULL 을 포함한 전체 행 갯수
-- COUNT(컬럼명) : NULL 을 제외한 행 갯수

-- 50번 부서 또는 부서코드가 NULL 인 직원 조회
SELECT DEPT_ID
FROM EMPLOYEE
WHERE DEPT_ID = '50' OR DEPT_ID IS NULL; -- 8행

SELECT COUNT(*) -- 전체 행 갯수 : 8
      , COUNT(DEPT_ID) -- NULL 제외된 행 갯수 : 6
      , COUNT(DISTINCT DEPT_ID) -- 중복값 제외
FROM EMPLOYEE
WHERE DEPT_ID = '50' OR DEPT_ID IS NULL; 

-- 단일행 함수 ******************************************************

-- 문자 처리 함수 ---------------------------------

-- LONGTH('문자리터럴') | LENGTH(문자가 기록된 컬럼명)
-- 글자 바이트수 리턴

SELECT LENGTH('ORACLE'), LENGTH('오라클')
FROM DUAL;

SELECT EMAIL, LENGTH(EMAIL)
FROM EMPLOYEE;

SELECT LENGTHB('ORACLE'), LENGTHB('오라클')
FROM DUAL;

SELECT EMAIL, LENGTH(EMAIL)
FROM EMPLOYEE;

-- INSTR('문자열리터럴' | 문자가 기록된 컬럼명, 찾을 문자, 찾을 시작위치, 몇번재문자)
-- 찾을 문자의 위치 리턴 (앞에서 부터의 순번)
-- 데이터베이스는 시작갑싱 무조건 1부터임 (0이 아님)

-- 이메일에서 '@' 문자의 위치 조회
SELECT EMAIL, INSTR(EMAIL, '@')
FROM EMPLOYEE;

-- 이메일에서 '@' 문자 바로 뒤에 있는 'k' 문자 위치를 조회
-- 단, 뒤에서 부터 검색함
SELECT EMAIL, INSTR(EMAIL, '@') + 1, INSTR(EMAIL, 'k', -1, 3)
FROM EMPLOYEE;

-- 함수 중첩 사용 가능
-- 이메일에서 '.'문자 바로 뒤에 있는 'c'의 위치를 조회
-- 단, '.' 문자 바로 앞글자부터 검색을 시작하도록 함
SELECT EMAIL, INSTR(EMAIL, 'c', INSTR(EMAIL, '.') - 1)
FROM EMPLOYEE;

-- LPAD('문자리터럴' | 문자가 기록된 컬럼명, 출력할 너비바이트, 남는 영역의 채울문자)
-- 채울문자가 생략되면 기본값은 ' ' (공백문자임)
-- LPAD() : 왼쪽 채우기, RPAD() : 오른쪽 채우기

SELECT EMAIL 원본, LENGTH(EMAIL) 원본길이,
       LPAD(EMAIL, 20, '*') 왼쪽채우기결과,
       LENGTH(LPAD(EMAIL, 20, '*')) 결과길이
FROM EMPLOYEE;

SELECT EMAIL 원본, LENGTH(EMAIL) 원본길이,
       RPAD(EMAIL, 20, '*') 오른쪽채우기결과,
       LENGTH(RPAD(EMAIL, 20, '*')) 결과길이
FROM EMPLOYEE;

-- LTRIM('문자리터럴' | 문자가 기록된 컬럼명,  '제거할 문자들 나열')
-- 왼쪽에 있는 문자들을 제거한 결과를 리턴
-- RTRIM() : 오른쪽에 있는 문자들을 제거한 결과 문자열을 리턴

SELECT '     123xyORACLExxyzz567     ',
        LTRIM('     123xyORACLExxyzz567     '), -- 기본 제거문자는 공백임.' '
        LTRIM('     123xyORACLExxyzz567     ', ' '),
        LTRIM('     123xyORACLExxyzz567     ',' 0123456789'),
        LTRIM('     123xyORACLExxyzz567     ',' xyz1234567')
FROM DUAL;

SELECT '     123xyORACLExxyzz567     ',
        RTRIM('     123xyORACLExxyzz567     '), -- 기본 제거문자는 공백임.' '
        RTRIM('     123xyORACLExxyzz567     ', ' '),
        RTRIM('     123xyORACLExxyzz567     ',' 0123456789'),
        RTRIM('     123xyORACLExxyzz567     ',' xyz1234567')
FROM DUAL;

-- TRIM(LEADING | TRAILING) BOTH '제거할문자하나' FROM '문자리터럴' | 문자가 기록된 컬럼명)
-- 기본은 BOTH (앞뒤 모두 제거)
-- 제거할 문자 생략은 기본 ' ' (공백문자임)

SELECT 'aaORACLEaa',
        TRIM('a' FROM 'aaORACLEaa'),
        TRIM(LEADING 'a' FROM 'aaORACLEaa'),
        TRIM(TRAILING 'a' FROM 'aaORACLEaa'),
        TRIM(BOTH 'a' FROM 'aaORACLEaa')
FROM DUAL;

-- SUBSTR('문자리터럴'| 문자가 기록된 컬럼명, 추출할 시작위치, 추출할 글자갯수)
-- 추출할 시작위치 : 양수 (앞에서부터의 위치), 음수(뒤에서부터의 위치)
-- 추출할 글자갯수 : 생략되면 끝 글자까지를 의미함

SELECT 'ORACLE 18C',
        SUBSTR('ORACLE 18C', 5), --LE 18C
        SUBSTR('ORACLE 18C', 8, 2), -- 18
        SUBSTR('ORACLE 18C', -7, 3) -- CLE
FROM DUAL;

-- 직원 정보에서 주민번호의 생년, 생월, 생일을 각각 분리 조회
SELECT EMP_NO,
       SUBSTR(EMP_NO, 1, 2) 생년,
       SUBSTR(EMP_NO, 3, 2) 생월,
       SUBSTR(EMP_NO, 5, 2) 생일
FROM EMPLOYEE;

-- 날짜 표기시에 문자처럼 '날짜'로 표기해야 함
-- '24/07/31'
-- SUBSTR() 은 날짜 데이터에도 사용할 수 있음

-- 직원들의 입사일에서 입사년도, 입사월, 입사일을 분리 조회
SELECT HIRE_DATE 입사일,
       SUBSTR(HIRE_DATE, 1, 2) 입사년도,
       SUBSTR(HIRE_DATE, 4, 2) 입사월,
       SUBSTR(HIRE_DATE, 7, 2) 입사일
FROM EMPLOYEE;

-- SUBSTRB('문자리터럴' | 문자가 기록된 컬럼명, 추출할바이트위치, 추출할 바이트 크기)
SELECT 'ORACLE',
        SUBSTR('ORACLE', 3, 2), SUBSTRB('ORACLE', 3, 2) -- AC
        , '오라클'
        , SUBSTR('오라클', 2, 2), SUBSTRB('오라클', 4, 6) -- 라클
FROM DUAL;

-- UPPER('영문리터럴' | 영문자가 기록된 컬럼명) : 대문자로 바꾸는 함수
-- LOWER('영문리터럴' | 영문자가 기록된 컬럼명) : 소문자로 바꾸는 함수
-- INITCAP('영문리터럴' | 영문자가 기록된 컬럼명) : 첫글자만 대문자로 바꾸는 함수

SELECT UPPER('ORACLE'), UPPER('oracle'), UPPER('Oracle'),
       LOWER('ORACLE'), LOWER('oracle'), LOWER('Oracle'),
       INITCAP('ORACLE'), INITCAP('oracle'), INITCAP('Oracle')
FROM DUAL;
    
-- 함수 중첩 사용 : 함수 안에 값 대신에 다른 함수를 사용할 수 있음
-- 안쪽 함수가 리턴한 값을 바깥 함수가 사용하게 됨

-- 예 : 직원 정보에서 사번, 이름, 아이디 조회
-- 아이디는 이메일에서 분리 추출함
SELECT EMP_ID 사번, EMP_NAME 이름, -- EMAIL,
      SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') - 1) 아이디
FROM EMPLOYEE;

-- 예 : 직원 정보에서 사번, 이름, 주민번호 조회
-- 주민번호 생년월일만 보이게 하고, 뒷자리는 '*' 처리함 : 891225-*******
SELECT EMP_ID 사번, EMP_NAME 이름,
       RPAD(SUBSTR(EMP_NO, 1, 7), 14, '*') 주민번호,
       SUBSTR(EMP_NO, 1, 7) ||'*******' 주민번호
FROM EMPLOYEE;

