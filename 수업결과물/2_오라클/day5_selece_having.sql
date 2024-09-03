-- day5_selece_having.sql

 -- SELECT 구문 : HABING 절 ---------------------------------------------------
 -- 사용위치 : GROUP BY 절 다음에 작성함
 -- 작성형식 : HAVING 그룹함수(계산에 사용할 컬럼명) 비교연산자 비교값
 -- 그룹별로 그룹함수 계산결과를 가지고 조건을 만족하는 그룹을 골라냄
 -- 골라낸 그룹과 결과값을 SLECT 절에 표시함
 
 -- 부서별 급여합계 중 가장 큰 값 조회
 SELECT MAX(SUM(SALARY)) -- 1행 18100000
 FROM EMPLOYEE
 GROUP BY DEPT_ID;

 -- 부서코드도 함께 조회하게 하려면
SELECT DEPT_ID, -- 7행
       MAX(SUM(SALARY)) -- 1행
FROM EMPLOYEE
GROUP BY DEPT_ID; -- ERROR

-- 부서별 급여합계 중 가장 큰값에 대한 부서코드와 급여합계를 조회
SELECT DEPT_ID, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_ID
--HAVING SUM(SALARY) = 18100000;
HAVING SUM(SALARY) = ( Select max(sum(salary)) -- 1행 18100000
                         FROM EMPLOYEE
                         GROUP BY DEPT_ID);
                         
-- 분석함수 (윈도우 함수라고도 함) ************************************************
-- 일반함수와 사용 형식이 다름

-- RANK() 함수 : 순위(등수) 반환

-- 1. 전체 컬럼값에 대해 순위 매기기
-- RANK() OVER (ORDER BY 순위매길컬럼명 정렬방식)

-- 직원 정보에서 급여를 많이 받는 순으로 순위를 매긴다면 (큰값이 1등 : 내림차순)
-- 이름, 급여, 순위
SELECT EMP_NAME, SALARY, 
       RANK() OVER(ORDER BY SALARY DESC) 순위
FROM EMPLOYEE
ORDER BY 순위;

-- 2. 지정하는 값이 해당 컬럼 안에서 몇등인지 순위를 조회 용도로 사용
-- RANK(순위를알고자하는값) WITHIN GROUP (ORDER BY 순위매길컬럼명 정렬방식)

-- 급여 230만이 전체 급여중 몇 순위? (급여 내림차순정렬의 경우)
SELECT RANK(2300000) WITHIN GROUP (ORDER BY SALARY DESC)
FROM EMPLOYEE;

-- ROWID
-- 테이블에 데이터 저장시 (행 추가시, INSERT 문) 자동으로 붙여짐
-- DBMS 가 자동으로 붙임, 수정 못 함, 조회만 할 수 있음
SELECT EMP_ID, ROWID
FROM EMPLOYEE;

-- ROWNUM
-- FOWID 와 다름
-- ROWNUM 은 SELECT 문 실행시 결과행에 부여되는 행순번임. (1부터 시작)
-- 인라인뷰 (FROM 절에 사용된 서브쿼리의 결과화면)를 사용해서, TOP-N 분석시 ROWNUM 을 이용할 수 있음

SELECT * 
FROM (SELECT ROWNUM RNUM, EMP_ID, JOB_ID
      FROM EMPLOYEE
      WHERE JOB_ID='J5')
WHERE RNUM > 2;








                         
                         
                         
                         
                         
                         
                         
                         
                         
                         
                         
                         
 
 