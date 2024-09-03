-- sql_1차_실기테스트_문제.sql

/*1. 2001 년에 입학 한 사학과 학생이 몇 명인지 학생수를 조회하시오. 사학과 코드는 TB_DEPARTMENT 에서
검색한다. (Join 을 사용하지 않는다.)*/

SELECT COUNT(*) AS "학생수"
FROM TB_STUDENT
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO 
                       FROM TB_DEPARTMENT 
                       WHERE DEPARTMENT_NAME = '사학과')
  AND SUBSTR(ENTRANCE_DATE, 1, 2) = '01';

/*2. 계열이 ‘공학’인 학과 중 입학정원이 20 명 이상, 30 명 이하인 학과의 계열, 학과이름, 정원을 조회하시오.
단 학과이름을 기준으로 오름차순 정렬하시오.”*/

SELECT D.CATEGORY AS "계열", D.DEPARTMENT_NAME AS "학과이름", D.CAPACITY AS "정원"
FROM TB_DEPARTMENT D
WHERE D.CATEGORY = '공학'
  AND D.CAPACITY BETWEEN 20 AND 30
ORDER BY D.DEPARTMENT_NAME;

/*3. ‘학’자가 들어간 계열의 소속 학과가 몇 개 있는지 계열, 학과수를 출력하시오. 단 학과수가 많은 순으로
정렬하시오.*/

SELECT CATEGORY AS "계열", COUNT(DEPARTMENT_NAME) AS "학과수"
FROM TB_DEPARTMENT 
WHERE CATEGORY LIKE '%학%'
GROUP BY CATEGORY
ORDER BY COUNT(DEPARTMENT_NAME) DESC;

/*4. ‘영어영문학과’ 교수이름, 출생년도, 주소를 조회하고 나이가 많은 순으로 정렬하시오. 영어영문학과 코드는
TB_DEPARTMENT 에서 검색한다. (Join 을 사용하지 않는다.)*/

SELECT P.PROFESSOR_NAME AS "교수이름", SUBSTR(P.PROFESSOR_SSN, 1, 4) AS "출생년도", P.PROFESSOR_ADDRESS AS "주소"
FROM TB_PROFESSOR P
WHERE P.DEPARTMENT_NO = (
    SELECT D.DEPARTMENT_NO
    FROM TB_DEPARTMENT D
    WHERE D.DEPARTMENT_NAME = '영어영문학과'
)
ORDER BY SUBSTR(P.PROFESSOR_SSN, 1, 4) DESC;

/*5. 국어국문학과 학생 중 서울에 거주하는 학생의 학과번호, 학생이름, 휴학여부를 조회하고 학생이름으로
오름차순 정렬하시오. 단 휴학여부는 값이 ‘Y’이면 ‘휴학’으로 ‘N’이면 ‘정상’으로 출력한다. 국어국문학과
코드는 TB_DEPARTMENT 에서 찾는다. (Join 을 사용하지 않는다)*/

SELECT A.DEPARTMENT_NO AS "학과번호", A.STUDENT_NAME AS "학생이름",
       CASE A.ABSENCE_YN
           WHEN 'Y' THEN '휴학'
           WHEN 'N' THEN '정상'
           ELSE '알 수 없음'
       END AS "휴학여부"
FROM TB_STUDENT A
WHERE A.DEPARTMENT_NO = (
    SELECT D.DEPARTMENT_NO
    FROM TB_DEPARTMENT D
    WHERE D.DEPARTMENT_NAME = '국어국문학과'
)
  AND A.STUDENT_ADDRESS LIKE '%서울%'
ORDER BY A.STUDENT_NAME;

/*6. 80 년생인 여학생 중 성이 ‘김’씨인 학생의 주민번호, 학생이름을 조회하시오. 단 학생이름으로 오름차순
정렬하시오.*/

SELECT S.STUDENT_SSN AS "주민번호", S.STUDENT_NAME AS "학생이름"
FROM TB_STUDENT S
WHERE SUBSTR(S.STUDENT_SSN, 1, 2) = '80'   
  AND SUBSTR(S.STUDENT_SSN, 8, 1) IN ('2', '4') 
  AND S.STUDENT_NAME LIKE '김%'           
ORDER BY S.STUDENT_NAME;                 

/*7. 계열이 ‘예체능’인 학과의 정원을 기준으로 40 명 이상이면 ‘대강의실’, 30 명 이상이면 ‘중강의실’, 30 명
미만이면 ‘소강의실’로 출력한다. 단, 정원이 많은 순으로 정렬 한다.*/

SELECT D.DEPARTMENT_NAME AS "학과이름", D.CAPACITY AS "정원",
       CASE
           WHEN D.CAPACITY >= 40 THEN '대강의실'
           WHEN D.CAPACITY >= 30 THEN '중강의실'
           ELSE '소강의실'
       END AS "강의실크기"
FROM TB_DEPARTMENT D
WHERE D.CATEGORY = '예체능'
ORDER BY D.CAPACITY DESC;

/*8. 주소지가 ‘경기’ 또는 ‘인천’인 학생 중 1900년대에 입학 한 학생들을 조회 하고자 한다. 오늘날짜를 기준
으로 입학 후 기간을 계산하여 입학 후 기간이 오래된 순으로 정렬 한다. (단 입학 후 기간의 단위는 년(年)으
로 하고, 소수점 이하 자리는 버린다. 또한 입학 후 기간이 같을 경우 이름으로 오름차순 정렬한다.)*/

SELECT S.STUDENT_NAME AS "학과이름",
       TO_CHAR(S.ENTRANCE_DATE, 'YY/MM/DD') AS "입학일자",
       TRUNC(MONTHS_BETWEEN(SYSDATE, S.ENTRANCE_DATE) / 12) AS "입학후기간(년)"
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
WHERE (S.STUDENT_ADDRESS LIKE '%경기%' OR S.STUDENT_ADDRESS LIKE '%인천%')
  AND EXTRACT(YEAR FROM S.ENTRANCE_DATE) BETWEEN 1900 AND 1999
ORDER BY S.STUDENT_NAME ASC;


/*9. 학과별 서울에 거주하는 교수 중 나이가 가장 적은 교수의 나이를 조회한다. 단, 나이가 적은 순으로 정렬
한다.*/

SELECT DEPARTMENT_NO AS "학과번호",
       CASE
           WHEN TO_NUMBER(SUBSTR(PROFESSOR_SSN, 1, 2)) > 40 THEN
               TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (1900 + TO_NUMBER(SUBSTR(PROFESSOR_SSN, 1, 2)))
           ELSE
               TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (2000 + TO_NUMBER(SUBSTR(PROFESSOR_SSN, 1, 2)))
       END AS "나이"
FROM TB_PROFESSOR
WHERE PROFESSOR_ADDRESS LIKE '%서울%'
ORDER BY PROFESSOR_SSN DESC;

/*10. 2005년1월1일부터 2006년12월31일까지의 기간에 입학한 학생 중 주소가 등록되지 않은 남학생의 학과번
호, 학생이름, 지도교수번호, 입학년도를 조회하시오. 입학년도를 기준으로 오름차순 정렬한다.*/

SELECT DEPARTMENT_NO AS "학과번호", STUDENT_NAME AS "학생이름", 
        COACH_PROFESSOR_NO AS "지도교수번호", TO_CHAR(ENTRANCE_DATE, 'YYYY') || ' 년' AS "입학년도"
FROM TB_STUDENT
WHERE ENTRANCE_DATE BETWEEN TO_DATE('2005-01-01', 'YYYY-MM-DD') AND TO_DATE('2006-12-31', 'YYYY-MM-DD')
  AND (STUDENT_ADDRESS IS NULL OR STUDENT_ADDRESS = '')
  AND SUBSTR(STUDENT_SSN, 8, 1) = '1'
ORDER BY TO_CHAR(ENTRANCE_DATE, 'YYYY');

/*11. 다음조건에 맞는 데이터를 조회 하시오.
? “서가람” 학생의 지도 교수가 지도한 학생들의 년도 별 평점을 표시하는 구문을 작성한다.
? 평점은 소수점 1 자리까지만 반올림하여 표시 한고 년도를 최근 순으로 정렬 한다. */

SELECT SUBSTR(G.TERM_NO, 1, 4) AS "년도",
       ROUND(AVG(G.POINT), 1) AS "평점"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.COACH_PROFESSOR_NO = (
    SELECT COACH_PROFESSOR_NO
    FROM TB_STUDENT
    WHERE STUDENT_NAME = '서가람'
)
GROUP BY SUBSTR(G.TERM_NO, 1, 4)
ORDER BY SUBSTR(G.TERM_NO, 1, 4) DESC;

/*12. 아래 조건에 맞는 내용을 검색 하시오.
? 전체 남학생 중 휴학한 학생의 입학 일자를 조회한다.
? 입학일자가 2001 년 1 월 1 일(포함)부터 현재까지(포함)인 학생만 표시하는 구문을 작성한다.
? 입학 일자가 최근 순으로 정렬한다.*/

SELECT D.DEPARTMENT_NAME AS "학과명", S.STUDENT_NAME AS "학생명", TO_CHAR(S.ENTRANCE_DATE, 'YY/MM/DD') AS "입학일자"
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
WHERE S.ABSENCE_YN = 'Y'
  AND SUBSTR(S.STUDENT_SSN, 8, 1) IN ('1', '3') 
  AND S.ENTRANCE_DATE >= TO_DATE('2001-01-01', 'YYYY-MM-DD')
ORDER BY S.ENTRANCE_DATE ;

/*13. 아래 조건에 맞는 내용을 검색 하시오
? 과목을 하나도 배정 받지 못한 교수가 지도교수인 학생수를 표시하는 구문을 작성한다*/

SELECT P.PROFESSOR_NAME AS "지도교수", COUNT(S.STUDENT_NO) AS "학생수"
FROM TB_PROFESSOR P
LEFT JOIN TB_CLASS C ON P.PROFESSOR_NO = C.CLASS_NO
LEFT JOIN TB_STUDENT S ON P.PROFESSOR_NO = S.COACH_PROFESSOR_NO
WHERE C.CLASS_NO IS NULL
GROUP BY P.PROFESSOR_NAME
HAVING COUNT(S.STUDENT_NO) > 0
ORDER BY P.PROFESSOR_NAME;

/*14. 다음조건에 맞는 데이터를 조회 하시오.
? “공학”계열의 학생들 중 2009 년도 평점 이 4.0 이상인 학생을 표시하는 구문을 작성한다.
? 평점은 소수점 1 자리까지만 반올림하여 표시 한다.
? 점수가 높은 순으로 정렬 하고 같으면 학생이름순(가나다순)으로 정렬 한다*/

SELECT S.STUDENT_NAME AS "학생이름", G.TERM_NO AS "학기", ROUND(AVG(G.POINT), 1) AS "학점"
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
JOIN TB_GRADE G ON S.STUDENT_NO = G.STUDENT_NO
WHERE D.CATEGORY = '공학'
  AND G.TERM_NO LIKE '2009%'
GROUP BY S.STUDENT_NAME, G.TERM_NO
HAVING ROUND(AVG(G.POINT), 1) >= 4.0
ORDER BY S.STUDENT_NAME;

/*15. 다음조건에 맞는 데이터를 조회 하시오
? “김고운” 학생이 있는 과의 2007 년, 2008 년 학기 별 평점과
년도 별 누적 평점, 총 평점을 표시하는 구문을 작성한다. (평점은 소수점 1 자리까지만 반올림)*/

SELECT
    EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')) AS "년도",
    SUBSTR(G.TERM_NO, 5, 2) AS "학기", ROUND(AVG(G.POINT), 1) AS "평점"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT S.DEPARTMENT_NO
    FROM TB_STUDENT S
    WHERE S.STUDENT_NAME = '김고운'
)
AND EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')) IN (2007, 2008)
GROUP BY EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')), SUBSTR(G.TERM_NO, 5, 2)

UNION ALL

-- 연도별 총 평점
SELECT
    EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')) AS "년도",
    '' AS "학기", ROUND(AVG(G.POINT), 1) AS "평점"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT S.DEPARTMENT_NO
    FROM TB_STUDENT S
    WHERE S.STUDENT_NAME = '김고운'
)
AND EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')) IN (2007, 2008)
GROUP BY EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY'))

UNION ALL

-- 01 학기들의 평점
SELECT
    NULL AS "년도", '' AS "학기", ROUND(AVG(G.POINT), 1) AS "평점"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT S.DEPARTMENT_NO
    FROM TB_STUDENT S
    WHERE S.STUDENT_NAME = '김고운'
)
AND SUBSTR(G.TERM_NO, 5, 2) = '01'

UNION ALL

-- 02 학기들의 평점
SELECT
    NULL AS "년도", '' AS "학기", ROUND(AVG(G.POINT), 1) AS "평점"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT S.DEPARTMENT_NO
    FROM TB_STUDENT S
    WHERE S.STUDENT_NAME = '김고운'
)
AND SUBSTR(G.TERM_NO, 5, 2) = '02'

UNION ALL

-- 03 학기들의 평점
SELECT
    NULL AS "년도", '' AS "학기", ROUND(AVG(G.POINT), 1) AS "평점"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT S.DEPARTMENT_NO
    FROM TB_STUDENT S
    WHERE S.STUDENT_NAME = '김고운'
)
AND SUBSTR(G.TERM_NO, 5, 2) = '03'

UNION ALL

-- 모든 학기의 평균 평점
SELECT
    NULL AS "년도", '' AS "학기", ROUND(AVG(G.POINT), 1) AS "평점"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT S.DEPARTMENT_NO
    FROM TB_STUDENT S
    WHERE S.STUDENT_NAME = '김고운'
)

ORDER BY "년도", "학기";


/*16. 다음조건에 맞는 데이터를 조회 하시오
? “문학과생태학” 과목을 진행하는 과의 2004 년도 학기 별 평점과
총 평점을 표시하는 구문을 작성한다.
? 평점은 소수점 1 자리까지만 반올림하여 표시 한다.*/

SELECT
    EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')) AS "년도",
    SUBSTR(G.TERM_NO, 5, 2) AS "학기", ROUND(AVG(G.POINT), 1) AS "평점"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT C.DEPARTMENT_NO
    FROM TB_CLASS C
    WHERE C.CLASS_NAME = '문학과생태학'
)
AND EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')) = 2004
GROUP BY EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')), SUBSTR(G.TERM_NO, 5, 2)

UNION ALL

SELECT
    2004 AS "년도", '' AS "학기", ROUND(AVG(G.POINT), 1) AS "평점"
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
WHERE S.DEPARTMENT_NO = (
    SELECT C.DEPARTMENT_NO
    FROM TB_CLASS C
    WHERE C.CLASS_NAME = '문학과생태학'
)
AND EXTRACT(YEAR FROM TO_DATE(SUBSTR(G.TERM_NO, 1, 4), 'YYYY')) = 2004
ORDER BY "년도", "학기";









DESC TB_GRADE;
DESC TB_CLASS;

/*17. 학생번호가 총 7 자리이고 'A'로 시작하며 4 번째 자리 데이터가 '3'인 학생 중 지도교수의 성이 '이'씨인
학생을 학생이름 순(가나다순)으로 표시하는 구문을 작성 하시오*/

SELECT S.STUDENT_NAME AS "학생이름",
       P.PROFESSOR_NAME AS "지도교수"
FROM TB_STUDENT S
JOIN TB_PROFESSOR P ON S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
WHERE S.STUDENT_NO LIKE 'A__3___'
  AND SUBSTR(P.PROFESSOR_NAME, 1, 1) = '이'
ORDER BY S.STUDENT_NAME;

/*18. 다음조건에 맞는 데이터를 조회 하시오
? “예체능”과 “의학” 계열의 모든 학과를 학과이름과 학생수로 표시하는 구문을 작성 하시오.
? 계열이름 순(가나다순)으로 정렬 하고 같으면 학생수가 많은 순으로 정렬 한다.*/

SELECT D.CATEGORY AS "계열",
       D.DEPARTMENT_NAME AS "학과이름",
       COUNT(S.STUDENT_NO) AS "학생수"
FROM TB_DEPARTMENT D
JOIN TB_STUDENT S ON D.DEPARTMENT_NO = S.DEPARTMENT_NO
WHERE D.CATEGORY IN ('예체능', '의학')
GROUP BY D.CATEGORY, D.DEPARTMENT_NAME
ORDER BY D.CATEGORY ;

/*19. ‘행정학과’의 모든 과목을 선수 과목과 함께 과목이름순(가나다순)으로 표시하는 구문을 작성 하시오.
(선수과목이 없을 출력되지 않는다.)*/

SELECT C.CLASS_NAME AS "과목",
       COALESCE(P.CLASS_NAME, C.CLASS_NAME) AS "선수과목"
FROM TB_CLASS C
LEFT JOIN TB_CLASS P ON C.PREATTENDING_CLASS_NO = P.CLASS_NO
JOIN TB_DEPARTMENT D ON C.DEPARTMENT_NO = D.DEPARTMENT_NO
WHERE D.DEPARTMENT_NAME = '행정학과'
  AND C.PREATTENDING_CLASS_NO IS NOT NULL
ORDER BY C.CLASS_NAME;










