-- day4_select_형변환함수.sql

-- 타입(자료형) 변환 함수 ----------------------------------------------------
-- 문자형(CHAR, VARCHAR2, LONG, CLOB) 숫자형(NUMBER), 날짜형(DATE)

-- 자동형변환 (암시적 형변환) 되는 경우
-- 컴퓨터 연산 원칙 : 같은 종류의 값끼리만 계산할 수 있다.
 SELECT 25 + '10' -- NUMBER + CHARACTER => NUMBER + NUMBER (자동형변환)
 FROM DUAL; 
 
 SELECT *
 FROM EMPLOYEE
 WHERE EMP_ID = 100; -- CHAR = NUMBER => CHAR = CHAR (자동형변환)
 -- WHERE EMP_ID = '100';
 -- WHERE TO_NUMBER(EMP_ID) = 100;
 
 SELECT FLOOR(MONTHS_BETWEEN(SYSDATE, '00/12/31')) -- DATE - CHARCTER (자동형변환)
 FROM DUAL; -- DATE - DATE 연산임
 
 -- 자동형변환이 안 되는 경우가 있음
 SELECT SYSDATE - '15/03/25'
 FROM DUAL;
 
 -- 명시적 형변환 필요함 => 형변환 함수사용함
SELECT SYSDATE - TO_DATE('15/03/25') -- DATE - CHARACTER => DATE - DATE
FROM  DUAL;
 
 -- TO_CHAR() 함수 ------------------------------------------
 -- NUMBER(숫자 : 정수, 실수)나 DATE(날짜, 시간)에 대해 출력 포멧(FORMAT)을 지정하는 함수
 -- 포멧이 적용된 결과는 문자열(CHARACTER)이 리턴됨
 -- TO_CHAR(숫자  | 날짜, '적용할 포멧형식 지정')
 
 -- 숫자에 포멧 적용
 -- TO_CHAR(숫자 | 숫자가 기록된 컬럼명 | 계산식, '적용할 포멧문자들 나열')
 -- 주로 통화단위 표시(L), 천단위 구분자 표시(,), 소숫점 자릿수 지정(.), 지수형 표시(EEEE) 등
 
 SELECT EMP_NAME 이름,
        TO_CHAR(SALARY, 'L99,999,999') 급여,
        TO_CHAR(NVL(BONUS_PCT,0), '90.00') 보너스포인트
 FROM EMPLOYEE;
 
 -- 날짜에 포멧 적용
 -- TO_CHAR(TO_DATE('날짜문자열') | 날짜가 기록된 컬럼명 | DATE 타입반환함수식, '적응할 포멧문자들 나열')
 -- 년월일 시분초 요일 분기 등을 출력 처리 형식으로 지적할 수 있음
 
 -- 년도 출력 포멧
 SELECT SYSDATE -- NLS_DATE_FROMATE : RR/MM/DD
        , TO_CHAR(SYSDATE, 'YYYY'), TO_CHAR(SYSDATE, 'RRRR')
        , TO_CHAR(SYSDATE, 'YY'), TO_CHAR(SYSDATE, 'RR')
        , TO_CHAR(SYSDATE, 'YEAR'), TO_CHAR(SYSDATE, 'RRRR"년"')
 FROM DUAL;
 
 -- 월에 대한 출력 포멧
 SELECT SYSDATE -- NLS_DATE_FROMATE : RR/MM/DD
        , TO_CHAR(SYSDATE, 'MM'), TO_CHAR(SYSDATE, 'RM')
        , TO_CHAR(SYSDATE, 'MONTH'), TO_CHAR(SYSDATE, 'MON')
        , TO_CHAR(SYSDATE, 'YYYY"년" fmMM"월"'), TO_CHAR(SYSDATE, 'RRRR"년" MM"월"')
 FROM DUAL;
 
 -- 날짜에 대한 출력 포멧
 SELECT SYSDATE -- NLS_DATE_FROMATE : RR/MM/DD
        , TO_CHAR(SYSDATE, '"1년기준" DDD "일째"')
        , TO_CHAR(SYSDATE, '"월기준" DD "일째"')
        , TO_CHAR(SYSDATE, '"주기준" D "일째"')
        , TO_CHAR(SYSDATE, 'RRRR"년" MM"월" fmDD"일"')
 FROM DUAL;
 
  -- 분기, 요일에 대한 출력 포멧
 SELECT SYSDATE -- NLS_DATE_FROMATE : RR/MM/DD
        , TO_CHAR(SYSDATE, 'Q "사분기"')
        , TO_CHAR(SYSDATE, 'DAY')
        , TO_CHAR(SYSDATE, 'DY')
 FROM DUAL;
 
 -- 시분초 오전 | 오후에 대한 출력 포멧
 SELECT SYSTIMESTAMP
        , TO_CHAR(SYSDATE, 'HH24"시" MI"분" SS"초"')
        , TO_CHAR(SYSDATE, 'AM HH:MI:SS')
        , TO_CHAR(SYSDATE, 'PM HH24:MI:SS')
 FROM DUAL;
 
 -- 직원 정보에서 이름, 입사일 조회
 -- 입사일에 포멧 적용 : 2024년 8월 1일 (목) 입사
 
 SELECT EMP_NAME 이름,
        TO_CHAR(HIRE_DATE, 'YYYY"년" fmMM"월" fmDD"일 ("DY") 입사"')입사일,
        TO_CHAR(HIRE_DATE, 'RRRR"년" MON fmDD"일 ("DY") 입사"')입사일
FROM EMPLOYEE; -- fm 모델은 포멧 안에서 한번만 사용할 수 있음
 
 -- 날짜 데이터 비교연산시 주의사항 : 
 -- 날짜만 기록된 데이터와 날짜와 시간을 같이 기록한 데이터 비교시, 두 데이터는 equal 이 아님
 -- '24/08/01' = '24/08/01  12:08:30' =>FALSE 임
 
 -- 확인
 SELECT EMP_NAME 이름,
        TO_CHAR(HIRE_DATE, 'YYYY-MM-DD AM HH:MI:SS') 입사일,
        TO_CHAR(HIRE_DATE, 'YYYY-MM-DD HH24:MI:SS') 입사일
 FROM EMPLOYEE;
 -- 한선기만 시간 데이터를 가지고 있음, 다른 직원들은 시간 데이터가 없음
 
 -- 날짜와 시간이 같이 기록되어 있는 경우는 비교연산시 날짜만 비교연산시 날짜만 비교할 수 없음
 SELECT EMP_NAME, HIRE_DATE
 FROM EMPLOYEE
 WHERE HIRE_DATE = '90/04/01'; -- 0행
 -- '2090-04-01 12:30:30' = '2090-04-01' : 같지 않다
 
 -- 해결방법 1 : 날짜데이터에 포멧 적용
  SELECT EMP_NAME, HIRE_DATE
 FROM EMPLOYEE
 WHERE TO_CHAR(HIRE_DATE, 'RR/MM/DD') = '90/04/01';
 
 -- 해결방법 2 : LIKE  연산자 사용
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE LIKE '90/04/01';
 
 -- 해결방법 3 : SUBSTR() 사용
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE SUBSTR(HIRE_DATE, 1, 8) = '90/04/01';
 
-- 해결방법 4 : 날짜 빼기 연산 사용
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE FLOOR(HIRE_DATE - TO_DATE('2090/04/01')) = 0;

-- 해결방법 5 : 비교값 날짜데이터를 바꿈
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE = TO_DATE('90/04/01 13:30:30', 'YY/MM/DD HH24:MI:SS');
 
-- TO_DATE() ------------------------------------
-- TO_DATE('문자형 날짜' | 문자형날짜가 기록된 컬럼명, '각 문자와 매칭할 포멧문자들')
-- 문자 글자수와 포멧 글자수가 반드시 같아야 함 : TO_CHAR() 의 포멧과 다른 점

SELECT TO_DATE('20161225','RRRRMMDD'),
       TO_CHAR(TO_DATE('20161225','RRRRMMDD'), 'DY')
FROM DUAL;

-- RR 와 YY 의 차이
-- 두자리 년도를 네자리 년도로 바꿀 때
-- 현재 년도가 (24 : 50보다 작음) 일 때
-- 바꿀 년도가 50미만이면 현재 세기(2000)가 적용 : '14'이면 'RRRR' => 2014 가 됨
-- 바꿀 년도가 50이상이면 이전 세기(1900)가 적용 : '95'이면 'RRRR' => 1995 가 됨

SELECT HIRE_DATE, -- 년도 두 자리 표시
       TO_CHAR(HIRE_DATE, 'RRRR'),
       TO_CHAR(HIRE_DATE, 'YYYY')
FROM EMPLOYEE; -- 년도를 2자리에서 4자리로 바꿀 때 Y, R 아무거나 사용
 
 -- 현재 년도(24년)와 바꿀 년도가 둘 다 50미만이면, Y | R 아무거나 사용해도 됨
 SELECT TO_DATE('160505', 'YYMMDD'),
        TO_CHAR(TO_DATE('160505', 'YYMMDD'),'YYYY-MM-DD'),
        TO_CHAR(TO_DATE('160505', 'RRMMDD'),'RRRR-MM-DD'),
        TO_CHAR(TO_DATE('160505', 'RRMMDD'),'YYYY-MM-DD'),
        TO_CHAR(TO_DATE('160505', 'YYMMDD'),'RRRR-MM-DD')
 FROM DUAL;
 
 -- 현재 년도(24년)가 50 미만이고, 바꿀 년도가 50이상일 때
 -- 문자를 날짜로 바꿀 때 년도를 Y 사용 : 현재 세기(2000)가 적용됨
 -- R 사용시에는 이전세기(1900)
 SELECT TO_DATE('160505', 'YYMMDD'),
        TO_CHAR(TO_DATE('970325', 'YYMMDD'),'YYYY-MM-DD'), -- 2097
        TO_CHAR(TO_DATE('970325', 'RRMMDD'),'RRRR-MM-DD'), -- 1997
        TO_CHAR(TO_DATE('970325', 'RRMMDD'),'YYYY-MM-DD'), -- 1997
        TO_CHAR(TO_DATE('970325', 'YYMMDD'),'RRRR-MM-DD')  -- 2097
 FROM DUAL;
 
 -- 결론 : 문자를 TO_DATE() 로 날짜를 바꿀 때 년도 적요에 'R' 사용하면 됨
 -- 년도 2자리를 4자리로 바꿀 때는 Y, R 아무거나 사용해도 됨
 
 -- 기타 함수 -----------------------------------------------------------
 
 -- NUL() 함수
 -- 사용형식 : NVL(컬럼명, 컬럼값이 NULL일 때 바꿀 값)
 SELECT EMP_NAME, BONUS_PCT, DEPT_ID, JOB_ID
 FROM EMPLOYEE;
 
 SELECT EMP_NAME,
        NVL(BONUS_PCT, 0.0),
        NVL(DEPT_ID, '00'),
        NVL(JOB_ID, 'J0')
 FROM EMPLOYEE;
 
 -- NVL2() 함수
 -- 사용형식 : NVL2(컬럼명, 바꿀값1, 바꿀값2)
 -- 해당 컬럼에 값이 있으면 바꿀값1로 바꾸고, NULL이면 바꿀값2로 변경
 
 -- 직원 정보에서 보너스포인트가 0.2미만이거나 NULL 인 직원들 조회
 -- 사번, 이름, 보너스포인트, 변경보너스포인트 : 별칭 처리
 -- 변경보너스포인트 : 보너스포인트 값이 있으면 0.15로 바꾸고, NULL이면 0.05로 바꿈
 
 SELECT EMP_ID 사번, EMP_NAME 이름, BONUS_PCT 보너스포인트,
        NVL2(BONUS_PCT, 0.12, 0.05)변경보너스포인트
 FROM EMPLOYEE
 WHERE BONUS_PCT < 0.2 OR BONUS_PCT IS NULL; -- 17행
 
 -- DECODE() 함수
 /*
 사용형식 : 
 DECODE(계산식 | 컬럼명, 값제시, 값이 맞으면 선택할 값, .....,  값제시N, 선택값N)
 또는
 DECODE(계산식 | 컬럼명, 값제시, 값이 맞으면 선택할 값, .....,  값제시N, 선택값N, 모든 제시값이 아닐 때 선택할 값)
 
 자바의 SWITCH 문의 동작구조를 가지는 함수임
 */
 
 -- 50번 부서에 근무하는 직원들의 이름, 성별 조회
 -- 성별 기준 : 주민번호 8번째 값이 1 | 3 이면 남자, 2 | 4 이면 여자
 -- 성별 기준 오름차순정렬하고, 같은 성별은 이름 기준 오름차순정렬 처리함
 SELECT EMP_NAME 이름,
        DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남자', '2', '여자',  '3', '남자', '4', '여자') 성별
 FROM EMPLOYEE
 WHERE DEPT_ID = '50'
 ORDER BY 성별, 이름; -- 오름차순정렬(ASC)은 생략할 수 있음

 SELECT EMP_NAME 이름,
        DECODE(SUBSTR(EMP_NO, 8, 1), '1', '남자', '3', 'SKAWK', '여자') 성별
 FROM EMPLOYEE
 WHERE DEPT_ID = '50'
 -- ORDER BY 성별, 이름; -- SELECT 절에 사용된 별칭, 컬럼명, 항목 나열 순번 사용 가능함
ORDER BY 2, 1;

-- 직원 이름과 관리자의 사번 조회
SELECT EMP_NAME, MGR_ID
FROM EMPLOYEE;

-- 관리자 사번이 NULL이면 '000'으로 바꿈
SELECT EMP_NAME, MGR_ID, NVL(MGR_ID, '000')
FROM EMPLOYEE;

-- 2. DECODE() 사용
SELECT EMP_NAME, MGR_ID, DECODE(MGR_ID, NULL, '000', MGR_ID)
FROM EMPLOYEE;

-- 직급별 급여 인상분이 다를 때,
-- 1. DECODE() 사용한 경우
SELECT EMP_ID, JOB_ID,
       TO_CHAR(SALARY, 'L99,999,999'),
       TO_CHAR(DECODE(JOB_ID,'J7', SALARY * 1.1,
                             'J6', SALARY * 1.15,
                             'J5', SALARY * 1.2,
                             SALARY * 1.05), 'L99,999,999')인상급여
FROM EMPLOYEE;
 
 -- 2. CASE 표현식 사용한 경우 : 자바의 다중 IF문과 같은 동작 구조를 가짐
 SELECT EMP_ID, JOB_ID,
       TO_CHAR(SALARY, 'L99,999,999'),
       TO_CHAR(CASE JOB_ID
                  WHEN 'J7' THEN SALARY * 1.1
                  WHEN 'J6' THEN SALARY * 1.15
                  WHEN 'J5' THEN SALARY * 1.2
                  ELSE  SALARY * 1.05
               END, 'L99,999,999')인상급여
FROM EMPLOYEE;
 
 -- CASE 표현식 사용 2 : 
 -- 직원의 급여를 등급을 매겨서 구분 처리
 SELECT EMP_ID, EMP_NAME, SALARY,
        CASE WHEN SALARY <= 3000000 THEN '초급'
             WHEN SALARY <= 4000000 THEN '중급'
             ELSE '고급'
        END 구분
 FROM EMPLOYEE
 ORDER BY 구분;
 
 -- ****************************************************************
 
 -- ORDER BY 절 -------------------------------- 
/*
사용형식 : 
     ORDER BY 정렬기준 정렬방식, 정렬기준2 정렬방식, ........
작성위치 : SELECT 구문 가장 마지막에 작성함
실행순서 : 가장 마지막에 작동됨
정렬기준 : SELECT 절의 컬럼명, 별칭, SELECT 절에 나열된 항목의 순번(1,2,3...)
정렬방식 : ASC(생랴가능) | DESC
    ASCENDING : 오름차순정렬, DESCENDING : 내림차순정렬
*/

-- 직우언 정보에서 부서코드가 50 또는 NULL 인 직원들 조회
-- 이름, 급여
-- 급여기준 내림차순정렬하고, 같은 급여는 이름기준 오름차순정렬 처리함

SELECT EMP_NAME 이름, SALARY 급여
FROM EMPLOYEE
WHERE DEPT_ID = '50' OR DEPT_ID IS NULL
--ORDER BY SALARY DESC, EMP_NAME
--ORDER BY 급여 DESC, 이름;
ORDER BY 2 DESC, 1;
 
-- 2003년 1월 1일 이후 입사한 직원 명단 조회
-- 단, 해당 날짜는 제외함
-- 이름, 입사일, 부서코드, 급여 : 별칭
-- 부서코드 기준 내림차순정렬하고, 같은 부서코드에 대해서는 입사일 기준 오름차순 정렬하고, 입사일도 같으면 이름기준 오름차순정렬
 
SELECT EMP_NAME 이름, HIRE_DATE 입사일, DEPT_ID 부서코드, SALARY 급여
FROM EMPLOYEE
WHERE HIRE_DATE > TO_DATE('20030101', 'RRRRMMDD')
--ORDER BY DEPT_ID DESC NULLS LAST, HIRE_DATE ASC, EMP_NAME ASC; -- 11행
--ORDER BY 부서코드 DESC NULLS LAST, 입사일, 이름;
ORDER BY 3 DESC NULLS LAST, 2, 1;
 
-- ORDER BY 절의 NULL 위치 조정 구문 : 
-- ORDER BY 정렬기준 정렬방식 NULLS LAST : NULL을 아래쪽에 배치함
-- ORDER BY 정렬기준 정렬방식 NULLS FIRST : NULL 을 위쪽에 배치함 (기본)
 
 
 
 
 
 
 
 
 
 
 