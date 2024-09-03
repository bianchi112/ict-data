-- 워크북 _v2.0 _2
-- DDL

GRANT CREATE VIEW TO c##homework;


/*10. 춘 기술대학교 학생들의 정보맊이 포함되어 있는 학생일반정보 VIEW 를 맊들고자 핚다.
아래 내용을 참고하여 적젃핚 SQL 문을 작성하시오.*/
CREATE VIEW VW_학생일반정보
AS
SELECT STUDENT_NO 학번,
       STUDENT_NAME 학생이름,
       STUDENT_ADDRESS 주소
FROM TB_STUDENT;


/*11. 춘 기술대학교는 1 년에 두 번씩 학과별로 학생과 지도교수가 지도 면담을 진행핚다.
이를 위해 사용핛 학생이름, 학과이름, 담당교수이름 으로 구성되어 있는 VIEW 를 맊드시오.
이때 지도 교수가 없는 학생이 있을 수 있음을 고려하시오 (단, 이 VIEW 는 단순 SELECT
맊을 핛 경우 학과별로 정렬되어 화면에 보여지게 맊드시오.)*/

CREATE VIEW VW_지도면담 
AS
SELECT S.STUDENT_NAME 학생이름,
       D.DEPARTMENT_NAME 학과이름,
       P.PROFESSOR_NAME 지도교수이름
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
LEFT JOIN TB_PROFESSOR P ON S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
ORDER BY D.DEPARTMENT_NAME;

SELECT * FROM VW_지도면담;


/*12. 모든 학과의 학과별 학생 수를 확인핛 수 있도록 적젃핚 VIEW 를 작성해 보자.*/

CREATE VIEW VW_학과별학생수 
AS
SELECT D.DEPARTMENT_NAME DEPARTMENT_NAME,
       COUNT(S.STUDENT_NO) STUDENT_COUNT
FROM TB_DEPARTMENT D
LEFT JOIN TB_STUDENT S ON D.DEPARTMENT_NO = S.DEPARTMENT_NO
GROUP BY D.DEPARTMENT_NAME;

SELECT * FROM  VW_학과별학생수;


/*13. 위에서 생성핚 학생일반정보 View 를 통해서 학번이 A213046 인 학생의 이름을 본인
이름으로 변경하는 SQL 문을 작성하시오. */

UPDATE TB_STUDENT
SET STUDENT_NAME = '본인이름'
WHERE STUDENT_NO = 'A213046';


/*14. 13 번에서와 같이 VIEW 를 통해서 데이터가 변경될 수 있는 상황을 막으려면 VIEW 를
어떻게 생성해야 하는지 작성하시오.*/

CREATE VIEW VW_학생일반정보 
AS
SELECT STUDENT_NO 학번,
       STUDENT_NAME 학생이름,
       STUDENT_ADDRESS 주소
FROM TB_STUDENT
WITH READ ONLY;


/*15. 춘 기술대학교는 매년 수강신청 기갂맊 되면 특정 인기 과목들에 수강 신청이 몰려
문제가 되고 있다. 최근 3 년을 기준으로 수강인원이 가장 맋았던 3 과목을 찾는 구문을
작성해보시오.*/

SELECT *
FROM (
    SELECT C.CLASS_NO 과목번호,
           C.CLASS_NAME 과목이름,
           COUNT(G.STUDENT_NO) "누적수강생수(명)"
    FROM TB_GRADE G
    JOIN TB_CLASS C ON G.CLASS_NO = C.CLASS_NO
    WHERE G.TERM_NO BETWEEN '200601' AND '200903'
    GROUP BY C.CLASS_NO, C.CLASS_NAME
    ORDER BY "누적수강생수(명)" DESC
)
WHERE ROWNUM <= 3;




