-- ��ũ�� _v2.0 _2
-- DDL

GRANT CREATE VIEW TO c##homework;


/*10. �� ������б� �л����� �������� ���ԵǾ� �ִ� �л��Ϲ����� VIEW �� ������� ����.
�Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�.*/
CREATE VIEW VW_�л��Ϲ�����
AS
SELECT STUDENT_NO �й�,
       STUDENT_NAME �л��̸�,
       STUDENT_ADDRESS �ּ�
FROM TB_STUDENT;


/*11. �� ������б��� 1 �⿡ �� ���� �а����� �л��� ���������� ���� ����� ��������.
�̸� ���� ����� �л��̸�, �а��̸�, ��米���̸� ���� �����Ǿ� �ִ� VIEW �� ����ÿ�.
�̶� ���� ������ ���� �л��� ���� �� ������ ����Ͻÿ� (��, �� VIEW �� �ܼ� SELECT
���� �� ��� �а����� ���ĵǾ� ȭ�鿡 �������� ����ÿ�.)*/

CREATE VIEW VW_������� 
AS
SELECT S.STUDENT_NAME �л��̸�,
       D.DEPARTMENT_NAME �а��̸�,
       P.PROFESSOR_NAME ���������̸�
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
LEFT JOIN TB_PROFESSOR P ON S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
ORDER BY D.DEPARTMENT_NAME;

SELECT * FROM VW_�������;


/*12. ��� �а��� �а��� �л� ���� Ȯ���� �� �ֵ��� ������ VIEW �� �ۼ��� ����.*/

CREATE VIEW VW_�а����л��� 
AS
SELECT D.DEPARTMENT_NAME DEPARTMENT_NAME,
       COUNT(S.STUDENT_NO) STUDENT_COUNT
FROM TB_DEPARTMENT D
LEFT JOIN TB_STUDENT S ON D.DEPARTMENT_NO = S.DEPARTMENT_NO
GROUP BY D.DEPARTMENT_NAME;

SELECT * FROM  VW_�а����л���;


/*13. ������ ������ �л��Ϲ����� View �� ���ؼ� �й��� A213046 �� �л��� �̸��� ����
�̸����� �����ϴ� SQL ���� �ۼ��Ͻÿ�. */

UPDATE TB_STUDENT
SET STUDENT_NAME = '�����̸�'
WHERE STUDENT_NO = 'A213046';


/*14. 13 �������� ���� VIEW �� ���ؼ� �����Ͱ� ����� �� �ִ� ��Ȳ�� �������� VIEW ��
��� �����ؾ� �ϴ��� �ۼ��Ͻÿ�.*/

CREATE VIEW VW_�л��Ϲ����� 
AS
SELECT STUDENT_NO �й�,
       STUDENT_NAME �л��̸�,
       STUDENT_ADDRESS �ּ�
FROM TB_STUDENT
WITH READ ONLY;


/*15. �� ������б��� �ų� ������û ��A�� �Ǹ� Ư�� �α� ����鿡 ���� ��û�� ����
������ �ǰ� �ִ�. �ֱ� 3 ���� �������� �����ο��� ���� ���Ҵ� 3 ������ ã�� ������
�ۼ��غ��ÿ�.*/

SELECT *
FROM (
    SELECT C.CLASS_NO �����ȣ,
           C.CLASS_NAME �����̸�,
           COUNT(G.STUDENT_NO) "������������(��)"
    FROM TB_GRADE G
    JOIN TB_CLASS C ON G.CLASS_NO = C.CLASS_NO
    WHERE G.TERM_NO BETWEEN '200601' AND '200903'
    GROUP BY C.CLASS_NO, C.CLASS_NAME
    ORDER BY "������������(��)" DESC
)
WHERE ROWNUM <= 3;




