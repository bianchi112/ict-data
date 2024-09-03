-- day3_select_함수2.sql

-- 숫자 처리 함수 ------------------------------------
-- ROUNT(), TRUNC(), FLOOR(), ABS(), MOD()

-- ROUND(숫자 | 숫자가 기록된 컬럼명 | 계산식, 반올림할 자릿수)
-- 버려지는 값이 5이상이면 자동 반올림함
-- 반올림할 자릿수가 양수이면 소숫점 아래 표시(출력)할 자리를 의미함
-- 반올림할 자릿수가 음수이면 소숫점 앞(정수부) 올림할 자리를 의미함

SELECT 123.456,
       ROUND(123.456) -- 123
       , ROUND(123.456,0) -- 123
       , ROUND(123.456, 1) -- 123.5
       , ROUND(123.456, -1) -- 120
FROM DUAL;

-- 직원 정보에서 사번, 이름, 급여, 보너스포인트, 보너스포인트 적용 연봉 조회
-- 연봉은 별칭 처리 : 1년급여
-- 연봉은 천단위에서 반올림 처리함
SELECT EMP_ID 사번, EMP_NAME 이름, SALARY 급여, BONUS_PCT 보너스포인트,
       ROUND(((SALARY  + (SALARY * NVL(BONUS_PCT, 0))) * 12 ), -4) "1년급여"
FROM EMPLOYEE;

-- TRUNC(숫자 | 숫자가 기록퇸 컬럼명 계산식, 자를 자릿수)
-- 지정한 자리 아래의 값을 버림, 절삭함수, 반올림없ㅇ므

SELECT 145.678,
       TRUNC(145.678) -- 145
       , TRUNC(145.678, 0) -- 145
       , TRUNC(145.678, 1) -- 145.6
       , TRUNC(145.678, -1) -- 140
       , TRUNC(145.678, -3) -- 0
FROM DUAL;

-- 직원 정보에서 급여의 평균을 조회
-- 10단위에서 절삭함
SELECT AVG(SALARY), TRUNC(AVG(SALARY), -2)
FROM EMPLOYEE;

-- FLOOR(숫자 | 숫자가 기록된 컬럼명 | 계산식)
-- 정수 만들기 함수 (소수점 아래값 버림)
SELECT ROUND(123.5), TRUNC(123.5), FLOOR(123.5)
FROM DUAL;

-- ABS(숫자 | 숫자가 기록된 컬럼명 | 계산식)
-- 절대값 리턴 (양수, 0 : 값 그대로, 음수 : 양수로 바꿈)
SELECT ABS(123), ABS(-123)
FROM DUAL;

-- 직원 정보에서 입사일 - 오늘, 오늘 - 입사일 조회
-- 별칭 : 근무일수
-- 오늘 날짜 조회 함수 : SYSDATE
-- 근무일수는 모두 양수 & 정수로 처리함

SELECT ABS(FLOOR(HIRE_DATE - SYSDATE)) 근무일수, 
        ABS(FLOOR(SYSDATE - HIRE_DATE)) 근무일수
FROM EMPLOYEE;

-- MOD(나눌 값, 나눌 수)
--- 나누기한 나머지를 리턴
-- 데이터베이스에서는 % (MPD) 연산자 사용 못 함
SELECT FLOOR(25 / 7) 몫, MOD(25,7) 나머지
FROM DUAL;

-- 직원 정보에서 사번이 홀수인 직원 조회
-- 사번, 이름
-- '100' 은 숫자 100 으로 자동형변환됨

SELECT EMP_ID 사번, EMP_NAME 이름
FROM EMPLOYEE
WHERE MOD(EMP_ID, 2) = 1;

-- 정식 표기 => 사용자계정 또는 사용자계정.객체명 생략 가능함
SELECT C##STUDENT.EMPLOYEE.EMP_ID 사번, C##STUDENT.EMPLOYEE.EMP_NAME 이름
FROM C##STUDENT.EMPLOYEE
WHERE MOD(C##STUDENT.EMPLOYEE.EMP_ID, 2) = 1;

-- 날짜 처리 함수 ------------------------------------------------

-- SYSDATE 함수
-- 시스템으로 부터 현재 날짜와 시간을 조회할 때 사용
SELECT SYSDATE FROM DUAL;
-- 출력되는 형식(FORMAT) (RR/MM/DD) : 24/07/31

-- 오라클에서는 환경설정, 객체 관련 정보들을 모두 저장 관리하고 있음
-- 데이터 딕셔너리 (데이터 사전) 에서 관리되고 있음
-- 데이터 딕셔너리에 저장된 정보는 조회는 할 수 있음 (손댈수는 없음)
-- 테이블 형태로 각 정보들을 보여줌

-- 단, 환경설정과 관련된 PARAMATER (변수) 정보는 일부 변경할 수 있음
SELECT * FROM SYS.NLS_SESSION_PARAMETERS;

-- 날짜 포멧과 관련된 변수  값만 조회한다면
SELECT VALUE
FROM SYS.NLS_SESSION_PARAMETERS
WHERE PARAMETER = 'NLS_DATE_FORMAT';

-- 날짜 포맷을 수정한다면
ALTER SESSION
SET NLS_DATE_FORMAT = 'DD-MON-RR';

-- 확인
SELECT SYSDATE FROM DUAL;

-- 원래 포멧으로 변경
ALTER SESSION
SET NLS_DATE_FORMAT = 'RR/MM/DD';

-- ADD_MONTHS('날짜' | 날짜가 기록된 컬럼명, 더할 개월수)
-- 더한 개월수에 대한 날짜가 리턴됨

-- 오늘 날짜에서 6개월 뒤 날짜는?
SELECT ADD_MONTHS(SYSDATE,6)
FROM DUAL;

-- 직원 정보에서 입사일로부터 20년된 날짜 조회
-- 사번, 이름, 입사일, 20년된 날짜 : 별칭 처리
SELECT EMP_ID 사번, EMP_NAME 이름, HIRE_DATE 입사일, 
       ADD_MONTHS(HIRE_DATE, 240) "20년된 날짜"
FROM EMPLOYEE;

-- 단일행 함수는 WHERE 절에서 사용할 수 있음
-- 직원들 중에서 근무년수가 20년된 직원 명단 조회
-- 사번, 이름, 부서코드, 직급코드, 입사일,  근무년수 : 별칭 처리
-- 근무년수 기준 내림차순정렬 처리함

SELECT EMP_ID 사번, EMP_NAME 이름, DEPT_ID 부서코드, JOB_ID 직급코드, HIRE_DATE 입사일,
       FLOOR((SYSDATE - HIRE_DATE) / 365) 근무년수
FROM EMPLOYEE
WHERE ADD_MONTHS(HIRE_DATE, 240) <= SYSDATE
ORDER BY 근무년수 DESC;

-- MONTHS_BETWEEN(DATE1, DATE2)
-- '날짜' | 날짜가 기록된 컬럼명  | 날짜함수
-- 두 날짜의 차이나는 개월수를 리턴함

-- 직원들의 이름, 입사일, 현재까지의 근무일수, 근무개월수, 근무년수 조회
-- 정수형으로 출력 처리함

SELECT EMP_NAME 이름, HIRE_DATE 입사일, 
       FLOOR(SYSDATE - HIRE_DATE)근무일수,
       FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))근무개월수,
       FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) /12 )근무년수
FROM EMPLOYEE;

-- NEXT_DAY('날짜' | 날짜가 기록된 컬럼명, '요일이름')
-- 지정한 날짜 뒤쪽 날짜에서 가장 가까운 지정 요일의 날짜를 리턴함
-- 현재 DBMS 의 사용 언어가 'KOREAN' 이므로, 요일이름에 한글 사용해야 함
-- 영어 요일이름 사용하면 에러남

SELECT SYSDATE, NEXT_DAY(SYSDATE, '일요일')
FROM DUAL;

SELECT SYSDATE, NEXT_DAY(SYSDATE, 'SUNDAY') -- 영어 요일이름 사용시 에러 발생
FROM DUAL;

-- 환경설정 변수의 언어를 변경해 봄
ALTER SESSION 
SET NLS_LANGUAGE = AMERICAN;

-- 원상 복구함
ALTER SESSION 
SET NLS_LANGUAGE = KOREAN;

-- LAST_DAY('날짜' | 날짜가 기록된 컬럼명)
-- 지정한 날짜의 월에 대한 마지막 날짜를 리턴함
SELECT SYSDATE, LAST_DAY(SYSDATE),
       '24/02/15', LAST_DAY('24/02/15')
FROM DUAL;

-- 직원 정보에서 이름, 입사일, 입사한 달의 근무일수 조회
SELECT EMP_NAME 이름, HIRE_DATE 입사일, 
       LAST_DAY(HIRE_DATE) - HIRE_DATE "입사한 달의 근무일수"
FROM EMPLOYEE;

-- 현재 날짜와 시간을 조회하려면
SELECT SYSDATE, SYSTIMESTAMP,
       CURRENT_DATE, CURRENT_TIMESTAMP
FROM DUAL;

-- EXTRACT(추출할 정보 FROM 날짜)
-- 날짜 데이터에서 원하는 정보만 추출
-- 추출할 정보 : YEAR, MONTH, DAY, HOUR, MINUTE, SECOND

-- 오늘 날짜에서 년, 월, 일 따로 추출
SELECT SYSDATE,
       EXTRACT(YEAR FROM SYSDATE),
       EXTRACT(MONTH FROM SYSDATE),
       EXTRACT(DAY FROM SYSDATE)
FROM DUAL;

SELECT HIRE_DATE,
       EXTRACT(YEAR FROM SYSDATE),
       EXTRACT(MONTH FROM SYSDATE),
       EXTRACT(DAY FROM SYSDATE)
FROM EMPLOYEE;

-- 직원들의 이름, 입사일, 근무년수 조회
SELECT EMP_NAME 이름, HIRE_DATE 입사일,
       EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE) 근무년수
FROM EMPLOYEE;






