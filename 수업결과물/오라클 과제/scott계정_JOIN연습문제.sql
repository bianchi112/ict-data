-- SCOTT 계정 : JOIN 연습문제
-- 오라클 전용구문과 ANSI 표준구문 두 가지로 작성하시오.

-- 1. 부서 테이블과 직원 테이블에서 사번, 사원명, 부서코드, 부서명을 조회하시오. 
-- 사원명 기준 오름차순 정렬 처리함

-- 오라클 : 
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY E.ENAME ASC;

-- ANSI : 
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
ORDER BY E.ENAME ASC;

-- 2. 부서 테이블과 직원 테이블에서 급여가 2000 이상인 사원에 대하여
-- 사번, 사원명, 급여, 부서명을 조회하시오. 
-- 단, 급여기준으로 내림차순 정렬 처리함

-- 오라클 : 
SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND E.SAL >= 2000
ORDER BY E.SAL DESC;

-- ANSI : 
SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.SAL >= 2000
ORDER BY E.SAL DESC;


-- 3. 부서 테이블과 직원 테이블에서 직무가 Manager이고 급여가 2500 이상인 직원의
-- 사번, 사원명, 직무명, 급여, 부서명을 조회하시오. 
-- 단, 사번을 기준으로 오름차순 정렬 처리함. 

-- 오라클 : 
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND E.JOB = 'MANAGER'
  AND E.SAL >= 2500
ORDER BY E.EMPNO ASC;

-- ANSI : 
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DNAME
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.JOB = 'MANAGER'
  AND E.SAL >= 2500
ORDER BY E.EMPNO ASC;


-- 4. 직원 테이블과 급여 등급 테이블에서 
-- 급여가 하한값과 상한값 범위에 포함되고 등급이 4인 직원들의
-- 사번, 사원명, 급여, 등급을 조회하시오. 
-- 단, 급여를 기준으로 내림차순 정렬 처리함

-- 오라클 : 
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
  AND S.GRADE = 4
ORDER BY E.SAL DESC;

-- ANSI : 
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE S.GRADE = 4
ORDER BY E.SAL DESC;

-- 5. 부서 테이블, 직원 테이블, 급여등급 테이블에서 
-- 급여가 하한값과 상한값 범위에 포함되는 등급을 지정하여
-- 사번, 사원명, 부서명, 급여, 등급을 조회하시오. 
-- 단, 등급을 기준으로 내림차순 정렬 처리함

-- 오라클 : 
SELECT E.EMPNO, E.ENAME, D.DNAME, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
  AND E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY S.GRADE DESC;

-- ANSI : 
SELECT E.EMPNO, E.ENAME, D.DNAME, E.SAL, S.GRADE
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY S.GRADE DESC;

 
-- 6. 직원 테이블에서 사원명과 해당 사원의 관리자명을 조회하시오

-- 오라클 : 
SELECT E1.ENAME AS 사원명, E2.ENAME AS 관리자명
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

-- ANSI : 
SELECT E1.ENAME AS 사원명, E2.ENAME AS 관리자명
FROM EMP E1
JOIN EMP E2 ON E1.MGR = E2.EMPNO;


-- 7. 직원 테이블에서 
-- 사원명, 해당 사원의 관리자명, 해당 사원의 관리자의 관리자명을 조회하시오

-- 오라클 : 
SELECT E1.ENAME AS 사원명,
       E2.ENAME AS 관리자명,
       E3.ENAME AS "관리자의 관리자명"
FROM EMP E1, EMP E2, EMP E3
WHERE E1.MGR = E2.EMPNO
  AND E2.MGR = E3.EMPNO;


-- ANSI : 
SELECT E1.ENAME AS 사원명,
       E2.ENAME AS 관리자명,
       E3.ENAME AS "관리자의 관리자명"
FROM EMP E1
LEFT JOIN EMP E2 ON E1.MGR = E2.EMPNO
LEFT JOIN EMP E3 ON E2.MGR = E3.EMPNO
WHERE E3.EMPNO IS NOT NULL;

-- 8. 7번 결과에서 관리자와 상위 관리자가 없는 모든 직원의 정보도 출력되도록 수정하시오.

-- 오라클 : 
SELECT E1.ENAME AS 사원명,
       E2.ENAME AS 관리자명,
       E3.ENAME AS "관리자의 관리자명"
FROM EMP E1, EMP E2, EMP E3
WHERE E1.MGR = E2.EMPNO(+)
  AND E2.MGR = E3.EMPNO(+);


-- ANSI : 
SELECT E1.ENAME AS 사원명,
       E2.ENAME AS 관리자명,
       E3.ENAME AS "관리자의 관리자명"
FROM EMP E1
LEFT JOIN EMP E2 ON E1.MGR = E2.EMPNO
LEFT JOIN EMP E3 ON E2.MGR = E3.EMPNO;


-- 9. 20번 부서의 이름과 그 부서에 근무하는 직원의 이름을 조회하시오.

-- 오라클 : 
SELECT D.DNAME AS 부서명, E.ENAME AS 직원명
FROM DEPT D, EMP E
WHERE D.DEPTNO = E.DEPTNO
  AND D.DEPTNO = 20;

-- ANSI : 
SELECT D.DNAME AS 부서명, E.ENAME AS 직원명
FROM DEPT D
JOIN EMP E ON D.DEPTNO = E.DEPTNO
WHERE D.DEPTNO = 20;



-- 10. 커미션을 받는 직원의 이름, 커미션, 부서이름을 조회하시오.

-- 오라클 : 
SELECT E.ENAME AS 직원명, E.COMM AS 커미션, D.DNAME AS 부서명
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND E.COMM IS NOT NULL;

-- ANSI : 
SELECT E.ENAME AS 직원명, E.COMM AS 커미션, D.DNAME AS 부서명
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.COMM IS NOT NULL;


-- 11. 이름에 ‘A’ 가 들어가는 직원들의 이름과 부서명을 조회하시오.

-- 오라클 : 
SELECT E.ENAME AS 직원명, D.DNAME AS 부서명
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND E.ENAME LIKE '%A%';

-- ANSI : 
SELECT E.ENAME AS 직원명, D.DNAME AS 부서명
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.ENAME LIKE '%A%';


-- 12. DALLAS에 근무하는 직원 중 급여가 1500 이상인 
-- 사원의 이름, 급여, 입사일, 보너스(comm)를 조회하시오.
-- 급여 기준 내림차순 정렬 처리함

-- 오라클 : 
SELECT E.ENAME AS 직원명, E.SAL AS 급여, E.HIREDATE AS 입사일, E.COMM AS 보너스
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND D.LOC = 'DALLAS'
  AND E.SAL >= 1500
ORDER BY E.SAL DESC;

-- ANSI : 
SELECT E.ENAME AS 직원명, E.SAL AS 급여, E.HIREDATE AS 입사일, E.COMM AS 보너스
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = 'DALLAS'
  AND E.SAL >= 1500
ORDER BY E.SAL DESC;


-- 13. 자신의 관리자 보다 연봉(sal)을 많이 받는 
-- 직원의 이름과 연봉을 조회하시오.

-- 오라클 : 
SELECT E1.ENAME AS 직원명, E1.SAL AS 연봉
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO
  AND E1.SAL > E2.SAL;

-- ANSI : 
SELECT E1.ENAME AS 직원명, E1.SAL AS 연봉
FROM EMP E1
JOIN EMP E2 ON E1.MGR = E2.EMPNO
WHERE E1.SAL > E2.SAL;


-- 14. 직원 중 현재시간 기준으로 근무개월 수가 
-- 30년을 초과한 직원의 이름, 급여, 입사일, 부서명을 조회하시오

-- 오라클 : 
SELECT E.ENAME AS 직원명, E.SAL AS 급여, E.HIREDATE AS 입사일, D.DNAME AS 부서명
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND MONTHS_BETWEEN(SYSDATE, E.HIREDATE) > 12 * 30;

-- ANSI : 
SELECT E.ENAME AS 직원명, E.SAL AS 급여, E.HIREDATE AS 입사일, D.DNAME AS 부서명
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE MONTHS_BETWEEN(CURRENT_DATE, E.HIREDATE) > 12 * 30;


-- 15. 각 부서별로 1982년 이전에 입사한 직원들의 인원수를 조회하시오.
-- 부서번호 기준으로 오름차순 정렬 처리함

-- 오라클 : 
SELECT DEPTNO 부서번호, COUNT(*) 인원수
FROM EMP
WHERE HIREDATE < TO_DATE('1982-01-01', 'YYYY-MM-DD')
GROUP BY DEPTNO
ORDER BY DEPTNO ASC;


-- ANSI : 
SELECT DEPTNO 부서번호, COUNT(*) 인원수
FROM EMP
WHERE HIREDATE < DATE '1982-01-01'
GROUP BY DEPTNO
ORDER BY DEPTNO ASC;










