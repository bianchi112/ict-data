-- 함수 연습문제

--1. 직원명과 주민번호를 조회함
--  단, 주민번호 9번째 자리부터 끝까지는 '*'문자로 채움
--  예 : 홍길동 771120-1******
SELECT EMP_NAME AS 이름,
       SUBSTR(EMP_NO, 1, 8) || REPLACE(SUBSTR(EMP_NO, 9), SUBSTR(EMP_NO, 9), '******') AS 주민번호
FROM EMPLOYEE;


-- 2. 직원명, 직급코드, 연봉(원) 조회
-- 단, 연봉은 ￦57,000,000 으로 표시되게 함
-- 연봉은 보너스포인트가 적용된 1년치 급여임
SELECT EMP_NAME AS 직원명,
       JOB_ID AS 직급코드,
       TO_CHAR(SALARY * 12 * (1 + NVL(BONUS_PCT, 0)), 'L99,999,999') AS 연봉
FROM EMPLOYEE;

/*
3. 부서코드가 50, 90인 직원들 중에서 2004년도에 입사한 직원의 
   수 조회함.
	사번 사원명 부서코드 입사일*/
SELECT EMP_ID, EMP_NAME, DEPT_ID, HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_ID IN ('50', '90')
AND EXTRACT(YEAR FROM HIRE_DATE) = 2004;

/*
4. 직원명, 입사일, 입사한 달의 근무일수 조회
  단, 주말도 포함함*/
SELECT EMP_NAME AS 직원명,
       HIRE_DATE AS 입사일,
       ROUND(LAST_DAY(HIRE_DATE) - TRUNC(HIRE_DATE, 'MM') + 1, 0) AS 근무일수
FROM EMPLOYEE;



/*5. 직원명, 부서코드, 생년월일, 나이(만) 조회
  단, 생년월일은 주민번호에서 추출해서, 
     ㅇㅇ년 ㅇㅇ월 ㅇㅇ일로 출력되게 함.
  나이는 주민번호에서 추출해서 날짜데이터로 변환한 다음, 계산함*/
SELECT EMP_NAME, EMP_ID, EMP_NO,
       SUBSTR(EMP_NO, 1, 2) || '년' || SUBSTR(EMP_NO, 3, 2) || '월' || SUBSTR(EMP_NO, 5, 2) || '일' AS 생년월일,
       EXTRACT(YEAR FROM SYSDATE) - 
       CASE 
           WHEN TO_NUMBER(SUBSTR(EMP_NO, 1, 2)) >= 50 
           THEN TO_NUMBER(SUBSTR(EMP_NO, 1, 2)) + 1900
           ELSE TO_NUMBER(SUBSTR(EMP_NO, 1, 2)) + 2000
       END + 1 AS 나이
FROM EMPLOYEE;







/*6. 직원들의 입사일로 부터 년도만 가지고, 각 년도별 입사인원수를 구하시오.
  아래의 년도에 입사한 인원수를 조회하시오.
  => to_char, decode, sum 사용

	-------------------------------------------------------------
	전체직원수   2001년   2002년   2003년   2004년
	-------------------------------------------------------------*/
SELECT 
    COUNT(*) AS 전체직원수,
    SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2001', 1, 0)) AS "2001년",
    SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2002', 1, 0)) AS "2002년",
    SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2003', 1, 0)) AS "2003년",
    SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2004', 1, 0)) AS "2004년"
FROM EMPLOYEE;


/*7.  부서코드가 50이면 총무부, 60이면 기획부, 90이면 영업부로 처리하시오.
   단, 부서코드가 50, 60, 90 인 직원의 정보만 조회함
  => case 사용
	부서코드 기준 오름차순 정렬함.*/
SELECT 
    EMP_NAME AS 직원명,
    EMP_ID AS 사번,
    CASE 
        WHEN DEPT_ID = '50' THEN '총무부'
        WHEN DEPT_ID = '60' THEN '기획부'
        WHEN DEPT_ID = '90' THEN '영업부'
        ELSE '기타' -- 실제로는 부서코드가 50, 60, 90이 아닌 경우는 없음
    END AS 부서명
FROM EMPLOYEE
WHERE DEPT_ID IN ('50', '60', '90')
ORDER BY DEPT_ID;


















