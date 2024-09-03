-- day5_select_join.sql

-- 조인 (JOIN)
-- 여러 개의 테이블들을 하나로 합쳐서 큰 테이블을 만드는 것
-- 조인한 결과 테이블에서 원하는 컬럼을 선택함
-- 오라클 전용 구문과 ANSI 표준 구문으로 작성할 수 있음

-- 조인은 기본 EQUAL JOIN 이다. (같은 값끼리 연결됨)
--  ==> EQUAL 이 아닌 값에 대한 행은 조인에서 제외됨
-- 연결할 두 테이블의 FOREIGN KEY(외래키, 외부키)로 관계를 가진 컬럼이 조인에 기본적으로 사용됨

-- 오라클 전용 구문 : 오라클에서만 사용함
-- FROM 절에 조인함(합칠) 테이블들을 나열함
-- WHERE 절에 연결할 컬럼에 대한 조건을 설정함
-- 단점 : WHERE 절에 일반 조건과 조인 조건이 섞임 => 복잡해짐

SELECT *
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DEPT_ID = DEPARTMENT.DEPT_ID;
-- 결과행 : 20행, EMPLOYEE.DEPT_ID 가 NULL 인 직원 2명이 제외됨
-- EQUAL INNER JOIN 이라고 함

SELECT *FROM DEPARTMENT;

-- 오라클 전용구문은 조인한 결과에 두 테이블의 컬럼이 모두 포함되어 있음
-- SELECT 시에 테이블명.컬럼명으로 중복된 컬럼은 구분해 줘야 함
SELECT EMP_NAME, EMPLOYEE.DEPT_ID, DEPT_NAME
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DEPT_ID = DEPARTMENT.DEPT_ID;

-- 조인시에  테이블명에 별칭 붙일 수 있음
SELECT EMP_NAME, E.DEPT_ID, DEPT_NAME
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_ID = D.DEPT_ID;

-- ANSI 표준 구문
-- 모든 DBMS 가 공통으로 사용하는 표준 구문임
-- 조인 처리를 위한 별도의 키워드를 사용함 => FROM 절에 JOIN 키워드를 추가해서 작성함
-- 오라클 전용구문과 다른 점 : WHERE 절에서 조인 조건을 분리함

SELECT * 
FROM EMPLOYEE
JOIN DEPARTMENT USING (DEPT_ID);
-- 조인에 사용된 컬럼이 조인 결과에 한 개 존재함. 오라클 전용 구문의 조인 경로와다른 점임

SELECT EMP_NAME, DEPT_ID, DEPT_NAME
FROM EMPLOYEE
JOIN DEPARTMENT USING (DEPT_ID); -- 20행
-- 조인의 기본은 EQUAL INNER JOIN 임 : 연결 컬럼의 일치하는 값에 대한 행들만 조인됨
-- INNER 생략해도 됨

-- 조인시에 사용되는 두 테이블의 컬럼명이 같으면 USING 사용함
-- 사용된 값은 같은데 컬럼명만 다르면 ON 사용함

-- USING 사용 예 : 
SELECT EMP_NAME, JOB_ID, DEPT_ID, DEPT_NAME
FROM EMPLOYEE INNER JOIN DEPARTMENT USING (DEPT_ID)
WHERE JOB_ID = 'J6'
ORDER BY DEPT_NAME DESC;

-- ON 사용 예 : 
SELECT * 
FROM DEPARTMENT INNER JOIN LOCATION ON (LOC_ID = LOCATION_ID);

-- 위의 조언을 오라클 전용 구문으로 바꾼다면
SELECT *
FROM DEPARTMENT D, LOCATION L
WHERE D.LOC_ID = L.LOCATION_ID;

-- 사번, 이름, 직급명 조회 ; 별칭 처리
-- 1. 오라클 전용구문
SELECT EMP_ID 사번, EMP_NAME 이름, JOB_TITLE 직급명
FROM EMPLOYEE E, JOB J
WHERE E.JOB_ID = J.JOB_ID; -- 21행

-- 2. ASNI 표준 구문
SELECT EMP_ID 사번, EMP_NAME 이름, JOB_TITLE 직급명
FROM EMPLOYEE
JOIN JOB USING (JOB_ID); -- 21행

-- OUTER JOIN ----------------------------------
-- 기본은 EQUAL INNER JOIN + 값이 일치하지 않은 행도 포함시키는 조인
-- OUTER JOIN 도 EQUAL JOIN 임 => 없는 값이  있는  테이블에 값을 추가하는 방식임

-- EMPLOYEE 테이블의 전 직원의 정보를 조인 결과에 포함시키고자 한다면
-- 1. 오라클 전용 구문 : 값이 없는 테이블에 행을 추가하는 방식임 => (+) 표시함
SELECT *
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_ID = D.DEPT_ID(+); -- 222행

-- 2. ANSI 표준 구문
SELECT *
--FROM EMPLOYEE LEFT OUTER JOIN DEPARTMENT USING (DEPT_ID);
--FROM EMPLOYEE LEFT JOIN DEPARTMENT USING (DEPT_ID); -- OUTER 생락해도 됨
FROM DEPARTMENT RIGHT JOIN EMPLOYEE USING (DEPT_ID);

-- DEPARTMENT 테이블이 가진 모든 행을 조인에 포함시키려면
-- 1. 오라클 전용 구문
SELECT *
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_ID(+) = D.DEPT_ID;

-- 2. ANSI 표준 구문
SELECT * 
FROM EMPLOYEE RIGHT JOIN DEPARTMENT USING (DEPT_ID);

-- 두 테이블의 제외되는 모든행을 조인 결과에 포함시킨다면
-- FULL OUTER JOIN 이라고 함

-- 오라클 전용구문에는FULL OUTER JOIN 이 제공되지 않음.
SELECT * 
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DEPT_ID(+) = D.DEPT_ID(+);

-- ANSI 표준 구문
SELECT *
FROM EMPLOYEE
FULL JOIN DEPARTMENT USING (DEPT_ID); -- 23행

-- CROSS JOIN  -----------------------
-- 두 테이블을 연결할 컬럼이 없을 때 사용
-- 테이블1 N개행 * 테이블2 M개행

-- 1. 오라클 전용구문
SELECT * 
FROM LOCATION, COUNTRY;

--  2. ANSI 표준 구문
SELECT *
FROM LOCATION CROSS JOIN COUNTRY;

-- NATURAL JOIN --------------------------------
-- 테이블이 가진 PRIMARY KEY 컬럼을 이용해서 조인이 되는 방식

SELECT * 
FROM EMPLOYEE
NATURAL JOIN DEPARTMENT; -- PRIMARY KEY 컬럼인 DEPT_ID 가 조인에 사용됨
-- INNER JOIN DEPARTMENT USING (DEPT_ID); 와 결과가 같음

-- NON EQUI JOIN -------------------------
-- 지정하는 컬럼의 값이 일치하는 경우가 아닌, 값의 범위에 해당하는 행들을 연결하는 조인 방식임
-- JOIN ON 사용함

SELECT *
FROM EMPLOYEE
JOIN SAL_GRADE ON (SALARY BETWEEN LOWEST AND HIGHEST);

SELECT EMP_NAME, SALARY, SLEVEL
FROM EMPLOYEE
JOIN SAL_GRADE ON (SALARY BETWEEN LOWEST AND HIGHEST);

-- SELF JOIN -------------------------------
-- 같은 테이블을 조인하는 경우
-- 같은 테이블 안에 다른 컬럼을 참조하는 외래키(FOREIGN KEY)가 있을 때 사용함
-- EMP_ID : 직원의 사번 ---> MAG_ID : 관리자 사번 <= EMP_ID 컬럼값 가져다 사용(참조)하는 컬럼임
-- 즉, 관리자는 직원 중에서 존재한다의 의미임

-- 관리자가 배정된 직원의 명단과 관리자인 직원의 이름을 조회
-- ANSI 표준구문에서 SELF JOIN 시에는 테이블 별칭 사용해야 함 => ON 사용해야 함

SELECT * 
FROM EMPLOYEE E
JOIN EMPLOYEE M ON (E.MGR_ID = M.EMP_ID); -- 15행

SELECT E.EMP_NAME 직원, M.EMP_NAME 관리자
FROM EMPLOYEE E
JOIN EMPLOYEE M ON (E.MGR_ID = M.EMP_ID); 

-- 관리자인 직원 명단
SELECT DISTINCT M.EMP_NAME 관리자 -- 6행
FROM EMPLOYEE E
JOIN EMPLOYEE M ON (E.MGR_ID = M.EMP_ID); 

-- 오라클 전용구문
SELECT *
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MGR_ID = M.EMP_ID;

SELECT E.EMP_NAME 직원, M.EMP_NAME 관리자
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MGR_ID = M.EMP_ID;

-- N개의 테이블 조인 ---------------------------
-- 조인 순서가 중요함
-- 첫번째 테이블과 두번째 테이블이 조인되고 난 다음에 합친 결과테이블에, 다시 세번째 테이블이 조인됨

SELECT EMP_NAME, JOB_TITLE, DEPT_NAME
FROM EMPLOYEE
LEFT JOIN  JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID); -- 22행

SELECT *
FROM EMPLOYEE
LEFT JOIN LOCATION ON (LOCATION_ID =  LOC_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID); -- ERROR

SELECT *
FROM EMPLOYEE
LEFT JOIN DEPARTMENT USING (DEPT_ID)
LEFT JOIN LOCATION ON (LOCATION_ID =  LOC_ID); -- 해결

-- 직원이름, 직급볌ㅇ, 부서명, 지역명, 국가명 조회
-- 직원 전체 조회임
-- 1. ANSI 표준 구문
SELECT EMP_NAME 직원이름, JOB_TITLE 직급명, DEPT_NAME 부서명, LOC_DESCRIBE 지역명, COUNTRY_NAME 국가명
FROM EMPLOYEE
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
LEFT JOIN LOCATION ON (LOC_ID = LOCATION_ID)
LEFT JOIN COUNTRY USING (COUNTRY_ID);

-- 2. 오라클 전용 구문
SELECT EMP_NAME 직원이름, JOB_TITLE 직급명, DEPT_NAME 부서명, LOC_DESCRIBE 지역명, COUNTRY_NAME 국가명
FROM EMPLOYEE E, JOB J, DEPARTMENT D, LOCATION L, COUNTRY C
WHERE E.JOB_ID = J.JOB_ID(+)
AND E.DEPT_ID = D.DEPT_ID(+)
AND D.LOC_ID = L.LOCATION_ID(+)
AND L.COUNTRY_ID = C.COUNTRY_ID(+);
























