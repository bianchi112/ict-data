-- day6_select_subquery.sql

-- SELECT : 서브쿼리 (SUBQUERY) ----------------------
-- SELECT 문 안에 사용되는 SELECT 문 => 내부쿼리라고도 함
-- 바깥 SELECT 문을 외부쿼리(메인쿼리, MAIN_AUERY)라고 함


/*
    바깥함수(반환값이 있는 함수())
    => 안쪽 함수가 먼저 실행되면서, 반환된 값을 바깥함수가 사용함
    
조건구문에서 컬럼명 비교연산자 비교값 <-- 비교값 알아내기 위한 SEELCT 문을 값 대신에 사용할 수 있음   
    컬럼명 비교연산자 (비교값 조회하는 SELECT문) <-- 내부(서브)쿼리라고 함
*/

-- 나승원과 같은 부서에 근무하는 직원 명단 조회
SELECT DEPT_ID -- 50
FROM EMPLOYEE
WHERE EMP_NAME = '나승원';
 
-- 2. 조회된 부서코드로 직원 명단 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_ID = '50';

-- 서브쿼리 구문 : 
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_ID = (SELECT DEPT_ID -- 50
                 FROM EMPLOYEE
                 WHERE EMP_NAME = '나승원');

-- 서브쿼리 유형(종류)
-- 서브쿼리가 만드는 결과값의 갯수에 따라 구분
-- 서브쿼리 앞에 사용되는 연산자가 달라져야 함
-- 단일행 서브쿼리와 다중행 서브쿼리로 구분됨

-- 단일행 서브퀄 : SELECT 한 결과값이 1개인 서브쿼리
--      일반 비교(관계)연산자 (=, != | ^= | <>, >, <, >=, <=) 사용가능함
-- 다중행 서브쿼리 : SELECT 한 결과값이 여러 개인 서브쿼리
--       일반 비교연산자(비교값 1개가 원칙임) 사용 못 함 => IN, ANY, ALL 사용해야 함

-- 그 외 유형 : 
-- 다중열 단일행 서브쿼리 : 결과값 1개, SELECT 절에 컬럼이 여러 개
--       조건절에서 (컬럼1, 컬럼2, ...) 비교연산자 (SELECT 컬럼1, 컬럼2, ... FROM ...)
-- 다중열 다중행 서브쿼리 : 결과값 여러 개, SELECT 절에 컬럼이 여러 개
--       조건절에서 (컬럼1, 컬럼2, ...) IN | ANY | ALL (SELECT 컬럼1, 컬럼2, ... FROM ...)

-- 상[호연]관 서브쿼리 :  메인쿼리의 컬럼값을 가져다가 서브쿼리가 사용하는 구조임
-- 스칼라 서브쿼리 : 단일행 + 상호연관 서브쿼리

-- 단일행 서브쿼리 (SINGLE ROW SUBAUERY) ----------------
-- 서브쿼리의 결과값이 1개인 경우
-- 단일행 서브쿼리 앞에는 일반 비교연산자 사용할 수 잇음

-- 예 : 나승원과 직급이 같으면서, 나승원보다 급여를 많이 받는 직원 조회
-- 1. 나승원 직급 조회
SELECT JOB_ID -- J5 : 1개
FROM EMPLOYEE
WHERE EMP_NAME = '나승원';

-- 2.나승원 급여 조회
SELECT SALARY -- 2300000 : 1개
FROM EMPLOYEE
WHERE EMP_NAME = '나승원';

-- 3. 직원 조회
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMPLOYEE
WHERE JOB_ID = 'J5'
AND SALARY > 23000000;

-- 서브쿼리 구문 : 
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMPLOYEE
WHERE JOB_ID = (SELECT JOB_ID -- J5 : 1개, 단일행 서브쿼리
                FROM EMPLOYEE
                WHERE EMP_NAME = '나승원')
AND SALARY > (SELECT SALARY -- 2300000 : 1개, 단일행 서브쿼리
             FROM EMPLOYEE
             WHERE EMP_NAME = '나승원');
             
-- 직원 중에서 전체 급여에 대해 최저 급여(가장 작은값)을 받는 직원 명단 조회
-- WHERE 절에 그룹함수 사용 못함 => 서브쿼리로 해결
-- 1. 급여의 최소값 조회
SELECT MIN(SALARY) -- 1500000
FROM EMPLOYEE;

-- 2. 최소값과 일치하는 급여를 받는 직원 조회
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY = 1500000;

-- 3. 서브쿼리로 변경 : 
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
--WHERE SALARY = MIN(SALARY); -- ERROR
WHERE SALARY = (SELECT MIN(SALARY) -- 1500000
                FROM EMPLOYEE);

-- HAVING 절에서도 서브쿼리 사용할 수도 있음
-- 예 : 부서별 급여합계 중 가장 큰 값에 대한 부서코드와 급여합계 조회
-- 1. 부서별 급여합계 중 최대값 조회
SELECT MAX(SUM(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_ID;

-- 2. 최대 급여총합을 가져가는 부서 조회
SELECT DEPT_ID, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_ID
HAVING SUM(SALARY) =  1810000;

-- 3. 서브쿼리로 변경
SELECT DEPT_ID, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_ID
HAVING SUM(SALARY) =  (SELECT MAX(SUM(SALARY))
                        FROM EMPLOYEE
                        GROUP BY DEPT_ID);

-- 서브쿼리는 SELECT 구문 모든 절에서 사용할 수 있음
-- 주로 SELECT 절, FROM 절, WHERE 절, HAVING 절 사용함

-- 다중열 (MULTI COLUMN) [단일행] 서브쿼리 ---------------------
-- 서브쿼리가 만든 결과행은 1개, SELECT 한 항목은 여러 개인 서브쿼리
-- 결과행이 1개(단일행)이면 일반 비교연산자 사용 가능함
-- 주의 : 서브쿼리의 SELECT 한 항목 갯수와 비교할 컬럼 갯수가 같아야 함
-- (비교할 컬럼1, 비교할 컬럼2) 비교연산자 (SELECT 컬럼1, 컬럼2 FROM ...)

-- 나승원과 직급과 급여가 같은 직원 조회
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMPLOYEE
WHERE (JOB_ID, SALARY) = (SELECT JOB_ID, SALARY
         FROM EMPLOYEE
         WHERE EMP_NAME = '나승원');
         
-- 다중행 (MULTI ROW)  [단일열] 서브쿼리 --------------------
-- 서브쿼리가 만든 결과행 (결과값)이 여러 개인 경우 
-- 다중행 서브쿼리 앞에는 일반 비교연산자 (비교값 1개가 원칙) 사용 못 함 : 에러
-- 여러 개의 값을 비교할 수 있는 연산자 사용해야 함 : IN, ANY, ALL

-- 예 : 각 부서별로 급여가 가장 작은 직원 정보 조회
-- 1. 부서별로 급여 작은 값들 조회
SELECT MIN(SALARY) -- 7행
FROM EMPLOYEE
GROUP BY DEPT_ID;

-- 2. 요구조건에 해당하는 직원 정보 조회
SELECT EMP_ID, EMP_NAME, DEPT_ID, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY) -- 7행 : 다중행 서브쿼리
                FROM EMPLOYEE
                GROUP BY DEPT_ID); -- ERROR : 일반 비교 연산자 사용 못 함

-- 해결
SELECT EMP_ID, EMP_NAME, DEPT_ID, SALARY
FROM EMPLOYEE
WHERE SALARY IN (SELECT MIN(SALARY) -- 7행 : 다중행 서브쿼리
                FROM EMPLOYEE
                GROUP BY DEPT_ID)
ORDER BY 3 NULLS LAST;

-- 컬럼명 IN (여러 개의 값들 | 다중행 서브쿼리)
-- 컬럼명 = 비교값1 OR 컬럼명 = 비교값2 OR 컬럼명 = 비교값3 OR ........
-- 컬럼에 여러 개의 비교값과 일치하는 값이 있으면 선택하라는 의미임

-- 컬럼명 NOT IN (여러 개의 값들 | 다중행 서브쿼리)
-- NOT 컬럼명 IN (여러 개의 값들 | 다중행 서브쿼리) 과 같음
-- NOT (컬럼명 = 비교값1 OR 컬럼명 = 비교값2 OR 컬럼명 = 비교값3 OR ........)
-- 컬럼에 여러 개의 비교값과 일치하지 않는 값이 있으면 선택하라는 의미임

-- 예 : 관리자인 직원과 관리자가 아닌 직원을 별도로 조회해서 합쳐라.
-- 1. 관리자인 직원 조회
SELECT DISTINCT MGR_ID -- 6행
FROM EMPLOYEE
WHERE MGR_ID IS NOT NULL;

-- 2. 직원 정보에서 관리자만 조회
SELECT EMP_ID, EMP_NAME, '관리자' 구분
FROM EMPLOYEE
WHERE EMP_ID IN (SELECT DISTINCT MGR_ID -- 6행 : 다중행 서브쿼리
                FROM EMPLOYEE
                WHERE MGR_ID IS NOT NULL)
UNION
SELECT EMP_ID, EMP_NAME, '직원' 구분
FROM EMPLOYEE
WHERE EMP_ID NOT IN (SELECT DISTINCT MGR_ID -- 6행 : 다중행 서브쿼리
                FROM EMPLOYEE
                WHERE MGR_ID IS NOT NULL)
ORDER BY 구분, 1;

-- SELECT 절에서 서브쿼리 사용할 수 있음
-- 주로 함수 안에서 서브쿼리가 사용됨

-- 위의 구문을 변경
SELECT EMP_ID, EMP_NAME,
        CASE WHEN EMP_ID IN (SELECT DISTINCT MGR_ID -- 6행 : 다중행 서브쿼리
                            FROM EMPLOYEE
                            WHERE MGR_ID IS NOT NULL)
            THEN '관리자' 
            ELSE '직원'
        END 구분
FROM EMPLOYEE
ORDER BY 3,1;

-- 컬럼명 > ANY (다중행 서브쿼리)
-- 다중행 서브쿼리가 만든 결과값들 중 가장 작은 값보다 큰 값이면 선택됨
-- 컬럼명 < ANY (다중행 서브쿼리)
-- 다중행 서브쿼리가 만든 결과값들 중 가장 큰 값보다 작은 값이면 선택됨
-- 여러 개의 결과값 들 중 최소 하나만 조건을 만족하면 될 경우에  사용됨
-- = ANY : IN 과 연산자와 같음

-- 예 : 대리 직급의 직원 중에서 과장 직급의 최소급여보다 많이 받는 대리 조회
SELECT EMP_ID, EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE SALARY > ANY (SELECT SALARY
                    FROM EMPLOYEE
                    JOIN JOB USING (JOB_ID)
                    WHERE JOB_TITLE = '과장')
AND JOB_TITLE =  '대리';

-- 컬럼명 > ALL (다중행 서브쿼리) : 가장 큰 값보다 큰 값 선택함
-- 컬럼명 < ALL (다중행 서브쿼리) : 가장 작은 값보다 작은 값 선택함

-- 예 : 모든 과장들의 급여보다 더 많은 급여를 받는 대리 직원 조회
SELECT EMP_ID, EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE SALARY > ANY (SELECT SALARY -- 3GOD
                    FROM EMPLOYEE
                    JOIN JOB USING (JOB_ID)
                    WHERE JOB_TITLE = '과장')
AND JOB_TITLE =  '대리';

-- 서브쿼리 사용구문 : 
-- SELECT 문은 모든 절에서 서브쿼리 사용가능함
-- 주로, SELECT 절 함수  안에 값대신, WHERE 절, GROUP BY 절, HAVING 절, ORDER BY 절
-- DML 문 : INSERT 문, UPDATE 문
-- DDL 문 : CREATE TABLE 문, CREATE VIEW 문

-- 다중열 다중행 서브쿼리 ---------------------------
-- 예 : 자기 직급의 평균 급여를 받는 직원 조회
-- 1. 직급별 급여 평균 조회
SELECT JOB_ID, TRUNC(AVG(SALARY), -5)
FROM EMPLOYEE
GROUP BY JOB_ID;
-- 실제 기록된 급여값과 평균값의 자릿수맞추기가 필요함

-- 2.적용
SELECT  EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
LEFT JOIN JOB USING (JOB_ID)
WHERE (JOB_ID,  SALARY) IN (SELECT JOB_ID, TRUNC(AVG(SALARY), -5) -- 8행
                            FROM EMPLOYEE
                            GROUP BY JOB_ID);

-- FROM 절에서도 서브쿼리 사용할 수 있음 => 서브쿼리의 결과뷰를 테이블 대신 사용할
-- FROM (서브쿼리) 별칭 ==> 별칭이 테이블명을 대신함
-- 인라인 뷰(INLINE VIEW)라고 함

-- 테이블에 별칭 사용 참고사항 : 
-- 조인시에 오라클 전용구문은 FROM 절에 조인할 테이블명 옆에 별칭을 지정할 수 있음
--       테이블명.컬럼명 => 테이블별칭.컬럼명 으로 사용함
-- ANSI 표준구문으로는 조인시에는 USING 을 사용할 때는 테이블 별칭 사용 못 함
--      ON 사용시에는 테이블 별칭 사용할 수 있음
-- FROM 절에 서브쿼리 사용시, 인라인뷰로 별칭 사용함

-- 자기 직급의 평균 급여를 받는 직원 조회
-- 인라인 뷰를 사용한다면
SELECT EMP_NAME,  JOB_TITLE, SALARY
FROM (SELECT JOB_ID, TRUNC(AVG(SALARY), -5) JOBAVG
      FROM EMPLOYEE
      GROUP BY JOB_ID) V -- 인라인 뷰
JOIN EMPLOYEE E ON (V.JOBAVG = E.SALARY AND V.JOB_ID = E.JOB_ID)
JOIN JOB J ON (E.JOB_ID = J.JOB_ID)
ORDER BY 3, 2;

-- 상[호연]관 서브쿼리 (CORRELATE SUBQUERY) -------------------------
-- 대부분의 서브쿼리는 서브쿼리가 만든 결과를 메인쿼리가 사용하는 구조임
-- 서브쿼리만 따로 실행해서 결과를 확인할 수 있음
-- 상호연관 서브쿼리는 서브쿼리가 메인쿼리의 값을 가져다가 결과를 만듦
-- 즉, 메인쿼리의 값이 바뀌면 서브쿼리의 결과도 달라지게 됨
-- 서브쿼리를 따로 실행할 수 없음

-- 자기 직급의 평균 급여를 받는 직원 조회 : 상호연관 서브쿼리로 작성한다면
SELECT EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE E
LEFT JOIN JOB J ON (E.JOB_ID = J.JOB_ID)
-- WHERE 해당 직원의 SALARY = (해당 직원의 직급의 평균급여 계산)
-- WHERE 첫번째 직원의 SALARY = (첫번째 직원의 직급을 가져다가 해당 직급의 급여평균을 계산)
-- WHERE 두번째 직원의 SALARY = (두번째 직원의 직급을 가져다가 해당 직금의 급여평균 계산)
-- 22명에 대해 22번 작동될 것임
WHERE SALARY = (SELECT TRUNC(AVG(SALARY), -5)
                FROM EMPLOYEE
                WHERE NVL(JOB_ID, ' ') = NVL(E.JOB_ID, ' '));
                
-- EXISTS / NOT EXISTS 연산자
-- 상호연관 서브쿼리 앞에섬나 사용하는 연산자임
-- 서브쿼리가 만든 결과가 존재하는지 물어볼 때 EXISTS 사용함
-- 이 연산자 사용시에는 서브쿼리 SELECT 절에 컬럼명 사용하면 안됨 => NULL 컬럼 사용함
-- 컬럼명 EXISTS(SELECT NULL FROM 상호연관 서브쿼리)
-- 상호연관 서브쿼리의 결과가 있느냐, 없느냐 물어보는 연산자임

-- 예 : 관리자인 직원 조회
SELECT EMP_ID, EMP_NAME, '관리자' 구분
FROM EMPLOYEE E
WHERE EXISTS (SELECT NULL
              FROM EMPLOYEE
              WHERE E.EMP_ID = MGR_ID);
-- 상호연관 서브쿼리의 결과가 존재하면, 해당 값에 대한 행을 골라냄

-- NOT EXISTS : 상호연관 서브쿼리에 결과가 존재하지 않느냐
-- 예 : 관리자가 아닌 직원 조회
SELECT EMP_ID, EMP_NAME, '직원' 구분
FROM EMPLOYEE E
WHERE NOT EXISTS (SELECT NULL
              FROM EMPLOYEE
              WHERE E.EMP_ID = MGR_ID);
-- 상호연관 서브쿼리의 결과가 존재하지 않으면, 해당 값에 대한 행을 골라냄

-- 스칼라 서브쿼리 -----------------------------------
-- 단일행 + 상호연관 서브쿼리

-- 예 : 이름, 부서코드, 급여, 해당 직원이 소속된 부서의 평균급여 조회
SELECT EMP_NAME, DEPT_ID, SALARY,
        (SELECT TRUNC(AVG(SALARY), -5)
        FROM EMPLOYEE
        WHERE E.DEPT_ID = DEPT_ID) "소속부서의 급여 평균"
FROM EMPLOYEE E;

-- ORDER BY 절에서 스칼라 서브쿼리 사용할 수 있음
-- 직원이 소속된 부서의 부서명이 큰 값부터 내림차순 정렬된 직원 정보 조회
SELECT EMP_ID, EMP_NAME, DEPT_ID, HIRE_DATE
FROM EMPLOYEE E
ORDER BY (SELECT DEPT_NAME
          FROM DEPARTMENT
          WHERE E.DEPT_ID = DEPT_ID) DESC NULLS LAST;
          
-- TOP-N 분석 -----------------------------
-- 상위 몇 개, 하위 몇 개를 조회하는 것
-- 방법 1 : 인라인뷰와 RANK() 함수를 이용
-- 방법 2 : 인라인뷰와 ROWNUM 이용

-- 방법 1 : 인라인뷰와 RANK() 함수를 이용
-- 직원 정보에서 급여를 가장 많이 받는 상위 5명 조회
-- 이름, 급여, 순위

SELECT * 
FROM (SELECT EMP_NAME, SALARY, RANK() OVER (ORDER BY SALARY DESC) 순위
        FROM EMPLOYEE)
WHERE 순위 <= 5;

-- 방법 2 : 인라인뷰와 ROWNUM 이용
-- 인라인뷰에서 ORDER BY 한 다음 ROWNUM 이 부여되게 함
-- ROWNUM : 행번호, WHERE 절 작동 후에 자동으로 부여됨

-- 확인
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE -- ROWNUM 지정됨
ORDER BY SALARY DESC;

-- 급여 많이 받는 직원 5명 조회 : 인라인뷰 사용하지 않은 경우
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE 
WHERE ROWNUM <= 5 -- ROWNUM 지정됨
ORDER BY SALARY DESC;

-- 해결 : 정렬하고 나서 ROWNUM 이 부여되게끔 구문 작성함
-- 인라인뷰 사용함
SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT * FROM EMPLOYEE
      ORDER BY SALARY DESC) -- 정렬하고 나서 ROWNUM 부여됨
WHERE ROWNUM <= 5;







