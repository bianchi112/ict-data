--SELECT 연습문제
--
--1. 부서코드가 90이면서, 직급코드가 J2인 직원들의 사번, 이름, 부서코드, 직급코드, 급여 조회함
--   별칭 적용함
SELECT EMP_ID 사번, EMP_NAME 이름, DEPT_ID 부서코드, JOB_ID 직급코드, SALARY 급여
FROM EMPLOYEE
WHERE DEPT_ID = '90' AND JOB_ID = 'J2';

--2. 입사일이 '1982-01-01' 이후이거나, 직급코드가 J3 인 직원들의 사번, 이름, 관리자 사번, 보너스포인트 조회함
SELECT EMP_ID 사번, EMP_NAME 이름, MGR_ID 관리자사번, BONUS_PCT 보너스포인트
FROM EMPLOYEE
WHERE HIRE_DATE > '82/01/01' OR JOB_ID = 'J3';

--3. 직급코드가 J4가 아닌 직원들의 급여와 보너스포인트가 적용된 연봉을 조회함.
--  별칭 적용함, 사번, 사원명, 직급코드, 연봉(원)
--  단, 보너스포인트가 null 일 때는 0으로 바꾸어 계산하도록 함.
SELECT EMP_ID 사번, EMP_NAME 사원명, JOB_ID 직급코드, 
      (SALARY + (SALARY * NVL(BONUS_PCT, 0))) * 12 || ' (원)' 연봉
FROM EMPLOYEE
WHERE JOB_ID != 'J4';

--4. 보너스포인트가 0.1 이상 0.2 이하인 직원들의 사번, 사원명, 이메일, 급여, 보너스포인트 조회함
SELECT EMP_ID 사번, EMP_NAME 사원명, EMAIL 이메일, SALARY 급여, BONUS_PCT 보너스포인트
FROM EMPLOYEE
WHERE BONUS_PCT BETWEEN 0.1 AND 0.2;


--5. 보너스포인트가 0.1 보다 작거나(미만), 0.2 보다 많은(초과) 직원들의 사번, 사원명, 보너스포인트, 급여, 입사일 조회함
SELECT EMP_ID 사번, EMP_NAME 사원명, EMAIL 이메일, SALARY 급여, BONUS_PCT 보너스포인트
FROM EMPLOYEE
WHERE BONUS_PCT NOT BETWEEN 0.1 AND 0.2;

--6. '1982-01-01' 이후에 입사한 직원들의 사원명, 보너스포인트, 급여 조회함
SELECT EMP_NAME 사원명, BONUS_PCT 보너스포인트, SALARY 급여
FROM EMPLOYEE
WHERE HIRE_DATE > '82/01/01';

--7. 보너스포인트가 0.1, 0.2 인 직원들의 사번, 사원명, 보너스포인트, 전화번호 조회함
SELECT EMP_ID 사번, EMP_NAME 사원명, BONUS_PCT 보너스포인트, PHONE 전화번호
FROM EMPLOYEE
WHERE BONUS_PCT IN (0.1, 0.2);

--8. 보너스포인트가 0.1도 0.2도 아닌 직원들의 사번, 사원명, 보너스포인트, 주민번호 조회함
SELECT EMP_ID 사번, EMP_NAME 사원명, BONUS_PCT 보너스포인트, EMP_NO 주민번호
FROM EMPLOYEE
WHERE BONUS_PCT NOT IN (0.1, 0.2);

--9. 성이 '이'씨인 직원들의 사번, 사원명, 입사일 조회함
--  단, 입사일 기준 오름차순 정렬함
SELECT EMP_ID 사번, EMP_NAME 사원명, HIRE_DATE 입사일
FROM EMPLOYEE
WHERE EMP_NAME LIKE '이%'
ORDER BY HIRE_DATE ASC;


--10. 주민번호 8번째 값이 '2'인 직원의 사번, 사원명, 주민번호, 급여를 조회함
--  단, 급여 기준 내림차순 정렬함
SELECT EMP_ID 사번, EMP_NAME 사원명, EMP_NO 주민번호, SALARY 급여
FROM EMPLOYEE
WHERE EMP_NO LIKE '_______2%'
ORDER BY SALARY DESC;

