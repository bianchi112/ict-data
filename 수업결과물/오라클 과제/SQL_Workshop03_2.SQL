-- SQL_Workshop03_2.SQL
/*14. 춘 기술대학교 서반아어학과 학생들의 지도교수를 게시하고자 핚다. 학생이름과
지도교수 이름을 찾고 맊일 지도 교수가 없는 학생일 경우 "지도교수 미지정?으로
표시하도록 하는 SQL 문을 작성하시오. 단, 출력헤더는 ?학생이름?, ?지도교수?로
표시하며 고학번 학생이 먼저 표시되도록 핚다.*/

SELECT STUDENT_NAME AS "학생이름",
        NVL(PROFESSOR_NAME, '지도교수 미지정') AS "지도교수"
FROM TB_STUDENT A
LEFT JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO = PROFESSOR_NO)
LEFT JOIN TB_DEPARTMENT B ON(A.DEPARTMENT_NO = B.DEPARTMENT_NO)
WHERE B.DEPARTMENT_NAME = '서반아어학과'
ORDER BY STUDENT_NO ;

/*15. 휴학생이 아닌 학생 중 평점이 4.0 이상인 학생을 찾아 그 학생의 학번, 이름, 학과
이름, 평점을 출력하는 SQL 문을 작성하시오.*/
SELECT STUDENT_NO AS "학번",
       STUDENT_NAME AS "이름",
       DEPARTMENT_NAME AS "학과 이름",
       AVG(POINT) AS "평점"
FROM TB_STUDENT 
JOIN TB_GRADE USING (STUDENT_NO)
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE ABSENCE_YN != 'Y'
GROUP BY STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
HAVING AVG(POINT) >= 4.0
ORDER BY 1;

/*16. 홖경조경학과 젂공과목들의 과목 별 평점을 파악핛 수 있는 SQL 문을 작성하시오.*/
SELECT C.CLASS_NO, C.CLASS_NAME, ROUND(AVG(G.POINT), 8) AS AVG_POINT
FROM TB_CLASS C
JOIN TB_DEPARTMENT D ON C.DEPARTMENT_NO = D.DEPARTMENT_NO
JOIN TB_GRADE G ON C.CLASS_NO = G.CLASS_NO
WHERE D.DEPARTMENT_NAME = '환경조경학과'
  AND C.CLASS_TYPE LIKE '전공%'
GROUP BY C.CLASS_NO, C.CLASS_NAME
ORDER BY C.CLASS_NO;




/*17. 춘 기술대학교에 다니고 있는 최경희 학생과 같은 과 학생들의 이름과 주소를 출력하는
SQL 문을 작성하시오.*/

SELECT S.STUDENT_NAME, S.STUDENT_ADDRESS
FROM TB_STUDENT S
WHERE S.DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                         FROM TB_STUDENT
                         WHERE STUDENT_NAME = '최경희')
ORDER BY S.STUDENT_NAME;

/*18. 국어국문학과에서 총 평점이 가장 높은 학생의 이름과 학번을 표시하는 SQL 문을
작성하시오.*/
SELECT STUDENT_NO, STUDENT_NAME
FROM (SELECT S.STUDENT_NO, S.STUDENT_NAME, AVG(G.POINT) AS AVG_POINT
        FROM TB_STUDENT S
        JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
        JOIN TB_GRADE G ON S.STUDENT_NO = G.STUDENT_NO
        WHERE D.DEPARTMENT_NAME = '국어국문학과'
        GROUP BY S.STUDENT_NO, S.STUDENT_NAME
        ORDER BY AVG_POINT DESC)
WHERE ROWNUM = 1;

/*19. 춘 기술대학교의 "홖경조경학과"가 속핚 같은 계열 학과들의 학과 별 젂공과목 평점을
파악하기 위핚 적젃핚 SQL 문을 찾아내시오. 단, 출력헤더는 "계열 학과명",
"젂공평점"으로 표시되도록 하고, 평점은 소수점 핚 자리까지맊 반올림하여 표시되도록
핚다.*/

SELECT S.STUDENT_NAME AS "학생이름",
       TO_CHAR(TO_DATE(S.ENTRANCE_DATE, 'RR/MM/DD'), 'RR 년 MM 월 DD 일') AS "입학일자",
       TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE(S.ENTRANCE_DATE, 'RR/MM/DD')) / 12) AS "입학후기간(년)"
FROM TB_STUDENT S
WHERE (S.STUDENT_ADDRESS LIKE '%경기%' OR S.STUDENT_ADDRESS LIKE '%인천%')
  AND TO_NUMBER(TO_CHAR(TO_DATE(S.ENTRANCE_DATE, 'RR/MM/DD'), 'YYYY')) < 2000
ORDER BY "입학후기간(년)" DESC, S.STUDENT_NAME ASC;










