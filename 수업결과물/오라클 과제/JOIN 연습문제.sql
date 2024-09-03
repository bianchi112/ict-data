-- JOIN 연습문제

--1. 2020년 12월 25일이 무슨 요일인지 조회하시오.
SELECT TO_CHAR(TO_DATE('2020-12-25', 'YYYY-MM-DD'), 'Day') AS Day_of_Week
FROM dual;


--2. 주민번호가 60년대 생이면서 성별이 여자이고, 성이 김씨인 직원들의 
--사원명, 주민번호, 부서명, 직급명을 조회하시오.
SELECT E.EMP_NAME AS 사원명,
       E.EMP_NO AS 주민번호,
       D.DEPT_NAME AS 부서명,
       J.JOB_TITLE AS 직급명  
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
JOIN JOB J ON E.JOB_ID = J.JOB_ID
WHERE SUBSTR(E.EMP_NO, 1, 2) BETWEEN '60' AND '69' 
  AND DECODE(SUBSTR(E.EMP_NO, 8, 1), '1', '남', '3', '남', '여') = '여' 
  AND E.EMP_NAME LIKE '김%'  
ORDER BY E.EMP_NAME;



--3. 가장 나이가 적은 직원의 사번, 사원명, 나이, 부서명, 직급명을 조회하시오.
-- 나이 계산과 가장 나이가 적은 직원 찾기
SELECT E.EMP_ID AS 사번,
       E.EMP_NAME AS 사원명,
       EXTRACT(YEAR FROM SYSDATE) - 
       CASE 
           WHEN TO_NUMBER(SUBSTR(E.EMP_NO, 1, 2)) >= 50 THEN 1900 + TO_NUMBER(SUBSTR(E.EMP_NO, 1, 2))
           ELSE 2000 + TO_NUMBER(SUBSTR(E.EMP_NO, 1, 2))
       END AS 나이,
       D.DEPT_NAME AS 부서명,
       J.JOB_TITLE AS 직급명
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
JOIN JOB J ON E.JOB_ID = J.JOB_ID
WHERE EXTRACT(YEAR FROM SYSDATE) - 
      CASE 
          WHEN TO_NUMBER(SUBSTR(E.EMP_NO, 1, 2)) >= 50 THEN 1900 + TO_NUMBER(SUBSTR(E.EMP_NO, 1, 2))
          ELSE 2000 + TO_NUMBER(SUBSTR(E.EMP_NO, 1, 2))
      END = (
          SELECT MIN(EXTRACT(YEAR FROM SYSDATE) - 
                     CASE 
                         WHEN TO_NUMBER(SUBSTR(EMP_NO, 1, 2)) >= 50 THEN 1900 + TO_NUMBER(SUBSTR(EMP_NO, 1, 2))
                         ELSE 2000 + TO_NUMBER(SUBSTR(EMP_NO, 1, 2))
                     END)
          FROM EMPLOYEE
      );


SELECT EMP_ID 사번, EMP_NAME 사원명
        , TO_NUMBER(TO_CHAR(SYSDATE, 'RRRR')) - TO_NUMBER(TO_CHAR(TO_DATE(SUBSTR(EMP_NO, 1, 2), 'RR'), 'RRRR')) 나이
        , DEPT_NAME 부서명
        , JOB_TITLE 직급명
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
JOIN JOB J ON E.JOB_ID = J.JOB_ID
WHERE TO_NUMBER(TO_CHAR(SYSDATE, 'RRRR')) - TO_NUMBER(TO_CHAR(TO_DATE(SUBSTR(EMP_NO, 1, 2), 'RR'), 'RRRR'))
        = (SELECT MIN(TO_NUMBER(TO_CHAR(SYSDATE, 'RRRR')) - TO_NUMBER(TO_CHAR(TO_DATE(SUBSTR(EMP_NO, 1, 2), 'RR'), 'RRRR')))
            FROM EMPLOYEE);



--4. 이름에 '성'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.
SELECT E.EMP_ID AS 사번,
       E.EMP_NAME AS 사원명,
       D.DEPT_NAME AS 부서명
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
WHERE E.EMP_NAME LIKE '%성%';


--5. 해외영업팀에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.
SELECT E.EMP_NAME AS 사원명,
       J.JOB_TITLE AS 직급명,
       E.DEPT_ID AS 부서코드,
       D.DEPT_NAME AS 부서명
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
JOIN JOB J ON E.JOB_ID = J.JOB_ID
WHERE D.DEPT_NAME LIKE '해외영업%팀';



--6. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.
SELECT E.EMP_NAME AS 사원명,
       E.BONUS_PCT AS 보너스포인트,
       D.DEPT_NAME AS 부서명,
       L.LOC_DESCRIBE AS 근무지역명
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
JOIN LOCATION L ON D.LOC_ID = L.LOCATION_ID
WHERE E.BONUS_PCT IS NOT NULL;


--7. 부서코드가 20인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.
SELECT E.EMP_NAME AS 사원명,
       J.JOB_TITLE AS 직급명,
       D.DEPT_NAME AS 부서명,
       L.LOC_DESCRIBE AS 근무지역명
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
JOIN LOCATION L ON D.LOC_ID = L.LOCATION_ID
JOIN JOB J ON E.JOB_ID = J.JOB_ID
WHERE E.DEPT_ID = '20';


--8. 직급별 연봉의 최소급여(MIN_SAL)보다 많이 받는 직원들의
--사원명, 직급명, 급여, 연봉을 조회하시오.
--연봉에 보너스포인트를 적용하시오.
SELECT E.EMP_NAME AS 사원명,
       J.JOB_TITLE AS 직급명,
       E.SALARY AS 급여,
       (E.SALARY * 12) + NVL(E.BONUS_PCT, 0) * (E.SALARY * 12) AS 연봉
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_ID = J.JOB_ID
WHERE (E.SALARY * 12) > J.MIN_SAL;




--9. 한국(KO)과 일본(JP)에 근무하는 직원들의 
--사원명(emp_name), 부서명(dept_name), 지역명(loc_describe), 국가명(country_name)을 조회하시오.
SELECT E.EMP_NAME AS 사원명,
       D.DEPT_NAME AS 부서명,
       L.LOC_DESCRIBE AS 지역명,
       C.COUNTRY_NAME AS 국가명
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID
JOIN LOCATION L ON D.LOC_ID = L.LOCATION_ID
JOIN COUNTRY C ON L.COUNTRY_ID = C.COUNTRY_ID
WHERE C.COUNTRY_ID IN ('KO', 'JP');

--10. 같은 부서에 근무하는 직원들의 사원명, 부서코드, 동료이름을 조회하시오.
--self join 사용
SELECT E1.EMP_NAME AS 사원명,
       E1.DEPT_ID AS 부서코드,
       E2.EMP_NAME AS 동료이름
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON E1.DEPT_ID = E2.DEPT_ID
                 AND E1.EMP_ID != E2.EMP_ID
ORDER BY E1.DEPT_ID, E1.EMP_NAME, E2.EMP_NAME;


--11. 보너스포인트가 없는 직원들 중에서 직급코드가 J4와 J7인 직원들의 사원명, 직급명, 급여를 조회하시오.
--단, join과 IN 사용할 것
SELECT E.EMP_NAME AS 사원명,
       J.JOB_TITLE AS 직급명,
       E.SALARY AS 급여
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_ID = J.JOB_ID
WHERE E.BONUS_PCT IS NULL
  AND J.JOB_ID IN ('J4', 'J7');

--12. 기혼인 직원과 미혼인 직원의 수를 조회하시오.
SELECT MARRIAGE AS 결혼상태,
       COUNT(*) AS 직원수
FROM EMPLOYEE
GROUP BY MARRIAGE;



