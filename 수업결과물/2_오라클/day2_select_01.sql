-- day2 : select_01.sql

-- 한글 1글자는 2바이트임 : 오라클 정품일때
SELECT LENGTH('ORACLE'), LENGTH('오라클'),
       LENGTHB('ORACLE'), LENGTHB('오라클')
FROM DUAL;
-- 확인 : 한글 1글자가 3바이트임 (XE 모듈)   

-- DUAL : DUMMY(더미) 테이블임
-- 오라클이 제공하는 가짜 테이블임

SELECT 3 + 5 FROM DUAL;

SELECT SYSDATE FROM DUAL;
SELECT SYSDATE + 50 FROM DUAL;
SELECT SYSDATE + 100/24 FROM DUAL;

SELECT (SYSDATE - HIRE_DATE) /365
FROM EMPLOYEE
WHERE EMP_ID = '101';

-- 오라클 셋팅 정보 확인하기
SELECT * FROM v$nls_parameters;
--NLS_LANGUAGE KOREAN
--NLS_DATE_FORMAT RR/MM/DD
--NLS_CHARACTERSET AL32UTF8
-- 필요시 변경할 수 있음
-- *********************************

-- SELECT 구문 : 데이터 검색 / 조회 

/*
SELECT 문 기본 작성법 : 
SELECT * | 컬럼명, 컬럼명, 함수식, 계산식
FROM 조회에사용할테이블명;

* : 테이블이 가진 모든 컬럼의 데이터를 조회한다는 의미임 (테이블 전체 조회)
*/

-- 직원(EMPLOYEE) 테이블 전체 조회
SELECT * FROM EMPLOYEE;

-- 부서(DEPARTMENT) 테이블 전체 조회
SELECT * FROM DEPARTMENT;

-- 직급(JOB) 테이블 전체 조회
SELECT * FROM JOB;

-- 테이블의 특정 컬럼에 기록된 값들을 조회하려면
-- 예 : 직원 테이블에서 사번(EMP_ID), 이름(EMP_NAME), 주민번호(EMP_NO) 조회
SELECT EMP_ID, EMP_NAME, EMP_NO
FROM EMPLOYEE;

-- 직원 테이블에서 사번, 이름, 급여, 보너스포인트 조회
SELECT EMP_ID, EMP_NAME, SALARY, BONUS_PCT
FROM EMPLOYEE;

-- 직원 테이블에서 사번, 이름, 직급코드, 입사일, 부서코드 조회
SELECT EMP_ID, EMP_NAME, JOB_ID, HIRE_DATE, DEPT_ID
FROM EMPLOYEE;

-- SELECT 절에 계산식 사용할 수도 있음
-- 컬럼에 기록된 값을 계산에 사용한 결과를 출력함
-- 예 : 직원 테이블에서 사번, 이름, 급여, 연봉(급여 * 12)을 조회
SELECT EMP_ID, EMP_NAME,SALARY, SALARY * 12
FROM EMPLOYEE;

-- SELECT 절에 함수를 사용할 수도 있음
-- 제공되는 함수를 파악하고 사용법 확인하고 사용함
-- 함수는 컬럼에 기록된 값을 읽어서, 함수로 처리한 결과를 반환함
-- 예 : 직원 테이블에서 사번, 이름, 주민번호 앞 6자리만 조회
SELECT EMP_ID, EMP_NAME, SUBSTR(EMP_NO,1,6)
FROM EMPLOYEE;

-- 조회형태 2 : 특정 행(ROW, 가로 한 줄)들을 조회
-- 조건을 만족하는 행들을 골라낸 다음, 원하는 컬럼값을 선택하는 방식임
-- 조건절을 사용함 : WHERE 컬럼명 비교연산자 비교값
-- WHERE 절은 FROM 절 다음에 위치함

-- 예 : 직원 정보에서 기혼자인(결혼한) 직원들만 조회한다면
ㄴ

-- 미혼인 직원 정보 조회
SELECT *
FROM EMPLOYEE
WHERE MARRIAGE = 'N';

-- 조회형태 3 : 
-- 조건을 만족하는 행들을 골라냄 ==>  원하는 컬럼을 선택하는 조회임
-- 예 : 직원 벙보에서 직급코드가 'J4'인 직원들의 사번, 이름, 직금코드, 급여 조회
SELECT EMP_ID, EMP_NAME, JOB_ID, SALARY
FROM EMPLOYEE
WHERE JOB_ID = 'J4';

-- 직급코드 'J4'에 대한 직급명을 조회한다면
SELECT JOB_TITLE
FROM JOB
WHERE JOB_ID = 'J4';

-- 조회형태 4 :
-- 직원 정보에서 '90'번 부서에서 근무하는 직원들의 사번, 이름, 부서코드, 관리자사번 조회
SELECT EMP_ID, EMP_NAME, DEPT_ID, MGR_ID
FROM EMPLOYEE
WHERE DEPT_ID = '90';

-- 90번 부서의 부서명은?
SELECT DEPT_NAME
FROM DEPARTMENT
WHERE DEPT_ID = '90';

-- SELECT 구문은 기본 1개의 테이블에 대한 조회임
-- 필요할 경우 여러 개의 테이블을 하나로 합쳐서(조인, JOIN) 원하는 컬럼을 조회할 수도 있음
-- 예 : 직원 테이블과 부서 테이블을 합쳐서, 사번, 이름, 부서코드, 부서명 조회
SELECT EMP_ID, EMP_NAME, DEPT_ID, DEPT_NAME
FROM EMPLOYEE
JOIN DEPARTMENT USING (DEPT_ID)
WHERE DEPT_ID = '90';

-- 직급이 '과장'인 직원 정보 조회
-- 사번, 이름, 직급코드, 직급명, 급여, 보너스포인트
SELECT EMP_ID, EMP_NAME, JOB_ID, JOB_TITLE, SALARY, BONUS_PCT
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE JOB_TITLE = '과장';

-- 직원 정보에서 사번, 이름, 급여, 보너스포인트, 보너스포인트가 적응된 연봉 조회
SELECT EMP_ID, EMP_NAME, SALARY, BONUS_PCT,
       (SALARY + (SALARY * BONUS_PCT)) * 12
FROM EMPLOYEE;
-- 데이터베이스에서는 계산할 값에 NULL 이 있으면, 결과도 NULL 임
-- 계산할 값이 NULL이면, 결과값이 나오게끔 NULL을 다른 값으로 바꾸면 됨
-- 관련 함수 이요앟ㅁ : NVL(컬럼명, NULL일때 바꿀 값)
SELECT EMP_ID, EMP_NAME, SALARY, BONUS_PCT,
       (SALARY + (SALARY * NVL(BONUS_PCT,0))) * 12
FROM EMPLOYEE;

-- 별칭 (ALIAS)
SELECT EMP_ID AS 사번, EMP_NAME 이름, SALARY 급여, BONUS_PCT 보너스포인트, 
       (SALARY + (SALARY * NVL(BONUS_PCT,0))) * 12 보너스적용연봉
FROM EMPLOYEE;

/*
SELECT 구문 작성 형식 : 
실행순서 : 절
5 :     SELECT * 컬럼명 [AS] 별칭, 계산식 [AS] 별칭
1 :     FROM 조회에 사용할 테이블명
2 :     WHERE 컬럼명 비교연산자 비교값
3 :     GROUP BY 컬럼명 | 계산식`
4 :     HAVING 그룹함수 비교연산자 비교값 (조건을 만족하는 그룹을 골라냄)
6 :     ORDER BY 컬럼명 정렬기준, SELECT 절에 나열된 항목 순번 정렬방식, 별칭 정렬방식, 별칭 [ASC] | DESC;
*/

-- SELECT 절의 컬럼명 | 계산식 뒤에 별칭(ALIAS)를 사용할 수 있음
--  컬럼명 AS 별칭, 계산식 AS 별칭
-- AS 는 생략해도 됨 => 컬럼명 별칭, 계산식 별칭
-- 주의사항 : 
-- 별칭에 숫자, 공백, 기호가 포함되면 반드시 ""로 묶어야 함, "별칭"
-- 별칭에 사용되는 글자수는 제한없음
-- 영어 별칭은 기본 대분자로 표시됨 =>"소문자", "대소문자혼합" 따옴표 사용함

SELECT EMP_ID 사번, EMP_NAME 이름, SALARY "급여(원)", BONUS_PCT "보너스 포인트",
       (SALARY + (SALARY * NVL(BONUS_PCT,0))) * 12 "1년소득"
FROM EMPLOYEE;

-- 리터럴(LITERAL) : 문자열값
-- SELECT 절에 리터럴(문자열값) 사용할 수 있음
SELECT  EMP_ID 사번, EMP_NAME 이름, '재직' 근무상태
FROM EMPLOYEE;

-- DISTINCT
-- SELECT 절에 컬럼명 앞에 사용함
-- SELECT DISTINCT 컬럼명
-- SELECT 절에 한번만 사용할 수 있음
-- 컬럼에 중복 기록된 값을 한개만 선택하라는 의미임

--  컬럼에 기록된 값의 종류를 파악할 때 사용하면 편리함
SELECT DISTINCT MARRIAGE
FROM EMPLOYEE;

SELECT DISTINCT DEPT_ID
FROM EMPLOYEE
ORDER BY 1 ASC;

-- DISTINCT : 1번만 사용함
SELECT DISTINCT DEPT_ID, DISTINCT JOB_ID -- ERROR
FROM EMPLOYEE;

SELECT DISTINCT DEPT_ID, JOB_ID -- 두 컬럼값을 묶어서 하나의 값으로 보고 중복 판단함
FROM EMPLOYEE;

-- 직원 중에서 관리자인 직원들만 조회
SELECT DISTINCT MGR_ID
FROM EMPLOYEE
WHERE MGR_ID IS NOT NULL
ORDER BY 1 ASC;

-- WHERE 절 ****************************************************************
/*
작동순서 :
FROM 절이 작동되고 나서 WHERE 절이 작동됨
=> 테이블을 찾아서, 테이블에 저장된 값들 중에 조건을 만족하는 값이 있는 행(가로줄)을 골라냄
WHERE 컬럼명 비교연산자 비교값 => 조건절이라고 함

비교연산자 : > (크냐, 초과), < (작으냐, 미만), >= (크거나 같으냐, 이상), <= (작거나 같으냐, 이하),
           = (같으냐), != (같지않느냐, <>, <=)
           IN, NOT IN, LIKE, NOT LIKE, BETWEEN AND, NOT BETWEEN AND
논리연산자 : AND, OR
*/

-- 직원 테이블에서 부서코드가 '90'인 직원 정보 조회
-- 모든 항목 조회
SELECT *
FROM EMPLOYEE
WHERE DEPT_ID = '90'; -- 조건과 일치하는 값이 기록된 행(ROW))들을 골라냄

-- 직원 중 급여를 4백만보다 많이 받는 (4백만을 초과하는) 직원 명단을 조회
-- 사번, 이름, 급여 : 별칭 처리
SELECT EMP_ID 사번, EMP_NAME 이름, SALARY 급여
FROM EMPLOYEE
WHERE SALARY > 4000000;

-- 90번 부서에 근무하는 직원 중 급여가 2백만을 초과하는 직원 정보 조회ㅣ
-- 사번, 이름, 급여, 부서코드 : 별칭 처리
SELECT EMP_ID 사번, EMP_NAME 이름, SALARY 급여, DEPT_ID 부서코드
FROM EMPLOYEE
WHERE DEPT_ID = '90' AND SALARY > 2000000; -- 결과행 : 3행

-- 90 또는 20번 부서에 근무하는 직원 조회
-- 사번, 이름, 주민번호, 전화번호, 부서코드 : 별칭처리
-- 부서코드로  오름차순정렬 처리함
SELECT EMP_ID AS 사번, EMP_NAME AS 이름, EMP_NO 주민번호, PHONE 전화번호, DEPT_ID 부서코드
FROM EMPLOYEE
--WHERE DEPT_ID = '90' OR DEPT_ID = '20'
WHERE DEPT_ID IN('20','90,')
--ORDER BY DEPT_ID ASC; -- 결과: 6행 -- 결과 6행
-- ORDER BY 5 ASC;
--ORDER BY 부서코드 ASC;
ORDER BY 부서코드;

-- 연습 1 :
-- 급여가 2백만이상 4백만이하인 직원 조회
-- 사번, 이름, 급여, 직급코드, 부서코드 : 별칭처리
SELECT EMP_ID 사번, EMP_NAME 이름, SALARY 급여, JOB_ID 직급코드, DEPT_ID 부서코드
FROM EMPLOYEE
--WHERE SALARY >= 2000000 AND SALARY <= 4000000;
WHERE SALARY BETWEEN 2000000 AND 40000000;

-- 연습 2 :
-- 입사일이 1995년 1월 1일부터 2000년 12월 31일 사이에 입사한 직원 조회
-- 사번, 이름, 입사일, 부서코드 : 별칭
-- 날짜 데이터는 기록된 날짜포멧과 일치되게 작성함
-- 날짜 데이터는 작은 따옴표로 묶어서 표기함 : '1995/01/01' 또는 '95/01/01'
SELECT EMP_ID 사번, EMP_NAME 이름, HIRE_DATE 입사일, DEPT_ID 부서코드
FROM EMPLOYEE
--WHERE HIRE_DATE >= '95/01/01' AND HIRE_DATE <= '2000/12/31';
WHERE HIRE_DATE BETWEEN '95/01/01' AND '2000/12/31';

-- 연결 연산자 : ||
-- 자바에서 "HELLO" + "WORKD" => "HELLO WORLD"
-- SELECT 절에서 조회한 컬럼값들을 연결 처리로 하나의 문장을 만들 때 사용할 수 있음
-- WHERE 절에서 비교값 여러 개를 한개의 값으로 만들 때 사용하기도 함

SELECT EMP_NAME || '의 급여는' || SALARY || '원 입니다' AS 급여정보
FROM EMPLOYEE
WHERE DEPT_ID = '90';

-- 연습 3 : 
-- 2000년 1월 1일 이후에 입사한 기혼인 직원 조회
-- 이름, 입사일, 직급코드, 부서코드, 급여, 결혼여부 : 별칭 처리
--  입사날짜 뒤에 ' 입사' 문자 연결 출력함
-- 급여값 뒤에는 '(원)'  문자 연결 출력함
-- 결혼여부는 리터럴 사용함 : '기혼' 으로 채움

SELECT EMP_NAME 이름, HIRE_DATE || ' 입사' 입사일, JOB_ID 직급코드, DEPT_ID 부서코드,
       SALARY || '(원)' 급여, '기혼' 결혼여부
FROM EMPLOYEE
WHERE HIRE_DATE >= '00/01/01' AND MARRIAGE = 'Y'; -- 결과 : 13행

-- BETWEEN AND 연산자 
-- WHERE 컬럼명 BETWEEN 작은값 AND 큰값
-- 커럼에 기록된 값이 작은값 이상이면서 큰값이하인 값이라는 의미임
-- WHERE 컬럼명 >= 작은값 AND 컬럼명 <= 큰값 과 같음
-- 날짜 데이터에도 사용할 수 있음

-- IN 연산자
-- WHERE 컬럼명 IN('값', '값', ....)
-- WHERE 컬럼명 = '값' OR 컬럼명 = '값' OR ...... 과 같음

-- LIKE 연산자
-- 와일드카드 문자(%, _)를 이용해서 문자 패턴을 설정함
-- 컬럼에 기록된 값이 제시된 문자패턴과 일치하는 값들을 골라낼 때 사용함
-- WHERE 컬럼면  LIKE '문자패턴'
-- % : 0개 이상의 글자들, _ : 글자 한자리

-- 성이 김씨인 직원 조회
-- 사번, 이름, 전화번호, 이메일 : 별칭
SELECT EMP_ID 사번, EMP_NAME 이름, PHONE 전화번호, EMAIL 이메일
FROM EMPLOYEE
WHERE EMP_NAME LIKE '김%'; -- 3행

-- 성이 김씨가 아닌 직원 조회
SELECT EMP_ID 사번, EMP_NAME 이름, PHONE 전화번호, EMAIL 이메일
FROM EMPLOYEE
--WHERE EMP_NAME NOT LIKE '김%'; -- 19행
WHERE NOT EMP_NAME  LIKE '김%';

-- 직원들의 이름에 '해'자가 들어있는 직원 조회
SELECT EMP_ID 사번, EMP_NAME 이름, PHONE 전화번호, EMAIL 이메일
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%해%'; -- 1행

-- 전화번호의 국번이 4자리이면서 9로 시자갛는 번호를 가진 직원 조회
-- 이름, 전화번호
SELECT EMP_NAME 이름, PHONE 전화번호
FROM EMPLOYEE
--WHERE PHONE LIKE '___9_______'; -- 2행
WHERE PHONE LIKE '___9%'; -- 3행 : 국번이 9로 시작하는 그룹 선택됨

-- 성별이 여자인 직원 조회
-- 사번, 이름, 주민번호, 전화번호 : 별칭
-- 주민번호 8번째 글자가 1 또는 3이면 남자, 2 또는 4이면 여자
SELECT EMP_ID 사번, EMP_NAME 이름, EMP_NO 주민번호, PHONE 전화번호
FROM EMPLOYEE
--WHERE EMP_NO LIKE '_______2%' OR EMP_NO LIKE '_______4%'; -- 8행
WHERE SUBSTR(EMP_NO, 8, 1) IN ('2', '4');

-- ESCAPE OPTION
-- WHERE 컬럼명 LIKE '문자패턴안에 기호문자 사용' ESCAPE '기호문자'
-- 기록된 컬럼값에 와일드카드 문자(_, %)와 같은 문자가 있을 때, 문자패턴에서 구분할 때 사용함
-- '패턴 기호문자 기록값'

-- 이메일에서 기록된 '_' 문자 앞글자가 3글자인 직원 조회
SELECT EMP_NAME, EMAIL
FROM EMPLOYEE
--WHERE EMAIL LIKE '___\_%' ESCAPE '\'; -- 1행
WHERE EMAIL LIKE '___#_%' ESCAPE '#';








