-- SQL_Workshop02 과제

-- 10번 학과별 학생수를 구하여 "학과번호", "학생수(명)" 의 형태로 헤더를 맊들어 결과값이 출력되도록 하시오.
SELECT DEPARTMENT_NO AS 학과번호, COUNT(STUDENT_NO) AS "학생수(명)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO ASC;

-- 11. 지도 교수를 배정받지 못한 학생의 수는 몇 명 정도 되는 알아내는 SQL 문을 작성하시오.
SELECT COUNT(*) AS "미배정 학생수"
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

/*12. 학번이 A112113 인 김고운 학생의 년도 별 평점을 구하는 SQL 문을 작성하시오. 단,
이때 출력 화면의 헤더는 "년도", "년도 별 평점" 이라고 찍히게 하고, 점수는 반올림하여
소수점 이하 핚 자리까지맊 표시한다.*/
SELECT SUBSTR(TERM_NO, 1, 4) 년도, ROUND(AVG(POINT), 1) 년도별평점
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO, 1, 4)
ORDER BY 년도;

-- 13. 학과 별 휴학생 수를 파악하고자 핚다. 학과 번호와 휴학생 수를 표시하는 SQL 문장을 작성하시오.
SELECT DEPARTMENT_NO AS 학과코드명, 
        COUNT(CASE WHEN ABSENCE_YN = 'Y' THEN 1 END) AS "휴학생 수"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;

-- 14. 춘 대학교에 다니는 동명이인(同名異人) 학생들의 이름을 찾고자 핚다. 어떤 SQL 문장을 사용하면 가능하겠는가?
SELECT STUDENT_NAME AS 동일이름, 
        COUNT(*) AS 동명인수
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1
ORDER BY STUDENT_NAME;

-- 15. 학번이 A112113 인 김고운 학생의 년도, 학기 별 평점과 년도 별 누적 평점 , 총
-- 평점을 년도 순서로 표시하는 SQL 문을 작성하시오. (단, 평점은 소수점 1 자리까지만
-- 반올림하여 표시한다.)

SELECT
    SUBSTR(TERM_NO, 1, 4) AS 년도,
    SUBSTR(TERM_NO, 5, 2) AS 학기,
    ROUND(AVG(POINT), 1) AS 평점
FROM 
    TB_GRADE
WHERE 
    STUDENT_NO = 'A112113'
GROUP BY 
    ROLLUP(SUBSTR(TERM_NO, 1, 4), SUBSTR(TERM_NO, 5, 2))
ORDER BY 
    SUBSTR(TERM_NO, 1, 4),
    SUBSTR(TERM_NO, 5, 2);




















