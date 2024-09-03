-- SCOTT계정 서브쿼리 연습문제


-- 1. 직원 테이블에서 BLAKE 보다 급여가 많은 직원들의 사번, 이름, 급여를 조회하시오.
SELECT EMPNO 사번, ENAME 이름, SAL 급여
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'BLAKE');



-- 2. 직원 테이블에서 MILLER 보다 늦게 입사한 직원의 사번, 이름, 입사일을 조회하시오
SELECT EMPNO 사번, ENAME 이름, HIREDATE 입사일
FROM EMP
WHERE HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'MILLER');



-- 3. 직원 테이블에서 직원 전체의 평균급여보다 급여가 많은 직원들의 
-- 사번, 이름, 급여를 조회하시오.
SELECT EMPNO 사번, ENAME 이름, SAL 급여
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP);



-- 4. 직원 테이블에서 부서별 최대 급여를 받는 직원들의 
-- 사번, 이름, 부서코드, 급여를 조회하시오.
SELECT EMPNO 사번, ENAME 이름, DEPTNO 부서코드, SAL 급여
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO);




-- 5. Salgrade가 2등급인 직원들의 평균급여보다 급여를 적게 받는 
-- 직원의 모든 정보를 조회하시오.

-- 오라클 : 
SELECT *
FROM EMP
WHERE SAL < (SELECT AVG(E.SAL)
            FROM EMP E, SALGRADE S
            WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
              AND S.GRADE = 2);




-- ANSI : 
SELECT *
FROM EMP
WHERE SAL < (SELECT AVG(E.SAL)
                FROM EMP E
                JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
                WHERE S.GRADE = 2 );


-- 6. 소속된 부서의 평균급여보다 급여를 많이 받는 직원의 정보 조회
-- 부서번호, 직원이름, 급여 출력
-- 상호연관 서브쿼리 사용할 것
SELECT DEPTNO 부서번호, ENAME 직원이름, SAL 급여
FROM EMP E1
WHERE SAL > (SELECT AVG(E2.SAL)
                FROM EMP E2
                WHERE E1.DEPTNO = E2.DEPTNO);


-- 7. 30번 부서의 가장 최근 입사일보다 먼저 입사한 30번 부서원이 아닌 직원들의 정보 조회
-- 이름, 입사일, 부서번호, 급여

-- 단일행 서브쿼리 사용
SELECT ENAME 이름, HIREDATE 입사일, DEPTNO 부서번호, SAL 급여
FROM EMP
WHERE DEPTNO <> 30
  AND HIREDATE < (SELECT MAX(HIREDATE)
                  FROM EMP
                  WHERE DEPTNO = 30);

-- 다중행 서브쿼리 사용
SELECT ENAME, HIREDATE, DEPTNO, SAL
FROM EMP
WHERE DEPTNO <> 30
  AND HIREDATE < ALL (SELECT HIREDATE
                      FROM EMP
                      WHERE DEPTNO = 30);


-- 8 job이 analyst인 모든 사원보다 급여를 많이 받는 타 업무의 사원을 출력 
-- (단, 업무가 clerk인 사원은 제외)

-- 다중행 서브쿼리 사용
SELECT ENAME, JOB, SAL
FROM EMP
WHERE JOB <> 'CLERK'
  AND SAL > ALL (SELECT SAL
                  FROM EMP
                  WHERE JOB = 'ANALYST');

-- 단일행 서브쿼리 사용
SELECT ENAME, JOB, SAL
FROM EMP
WHERE JOB <> 'CLERK'
  AND SAL > (SELECT MAX(SAL)
              FROM EMP
              WHERE JOB = 'ANALYST');

