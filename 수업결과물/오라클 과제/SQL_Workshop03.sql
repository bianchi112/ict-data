-- SQL_Workshop03.sql

--1. �л��̸��� �ּ����� ǥ���Ͻÿ�. ��, ��� ����� "�л� �̸�", "�ּ���"�� �ϰ�,
-- ������ �̸����� �������� ǥ���ϵ��� �Ѵ�.
SELECT STUDENT_NAME AS "�л� �̸�", STUDENT_ADDRESS AS "�ּ���"
FROM TB_STUDENT
ORDER BY STUDENT_NAME ASC;

-- 2. �������� �л����� �̸��� �ֹι�ȣ�� ���̰� ���� ������ ȭ�鿡 ����Ͻÿ�.
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY TO_DATE(SUBSTR(STUDENT_SSN, 1, 6), 'YYMMDD') DESC;     

/*3. �ּ����� �������� ��⵵�� �л��� �� 1900 ��� �й��� ���� �л����� �̸��� �й�,
�ּҸ� �̸��� ������������ ȭ�鿡 ����Ͻÿ�. ��, ���������� "�л��̸�","�й�",
"������ �ּ�" �� ��µǵ��� �Ѵ�. */

SELECT STUDENT_NAME AS "�л��̸�", STUDENT_NO AS "�й�", STUDENT_ADDRESS AS "������ �ּ�"
FROM TB_STUDENT
WHERE (STUDENT_ADDRESS LIKE '%������%' OR STUDENT_ADDRESS LIKE '%��⵵%')
  AND STUDENT_NO NOT LIKE 'A%'  -- 1900��� �й�            
ORDER BY STUDENT_NAME ASC;

/*4. ���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� Ȯ���� �� �ִ� SQL ������
�ۼ��Ͻÿ�. (���а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã��
������ ����)*/

SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO FROM TB_DEPARTMENT WHERE DEPARTMENT_NAME = '���а�')
ORDER BY TO_DATE(SUBSTR(PROFESSOR_SSN, 1, 6), 'YYMMDD') ASC;

/*5. 2004 �� 2 �б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ�Ϸ��� ����. ������
���� �л����� ǥ���ϰ�, ������ ������ �й��� ���� �л����� ǥ���ϴ� ������
�ۼ��غ��ÿ�.*/

SELECT STUDENT_NO, TO_CHAR(POINT, '0.00') AS POINT
FROM TB_GRADE
WHERE TERM_NO = '200402' AND CLASS_NO = 'C3118100'
ORDER BY POINT DESC, STUDENT_NO ASC;

/* 6. �л� ��ȣ, �л� �̸�, �а� �̸��� �̸� ������ ������ �����Ͽ� ����ϴ� SQL ����
�ۼ��Ͻÿ�. */
SELECT S.STUDENT_NO, S.STUDENT_NAME, D.DEPARTMENT_NAME
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D 
ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
ORDER BY S.STUDENT_NAME ASC;

/*7. �� ������б��� ���� �̸��� ������ �а� �̸��� �а� �̸� ������ ������ ����ϴ�
SQL ������ �ۼ��Ͻÿ�.*/

SELECT C.CLASS_NAME, D.DEPARTMENT_NAME
FROM TB_CLASS C
JOIN TB_DEPARTMENT D 
ON C.DEPARTMENT_NO = D.DEPARTMENT_NO
ORDER BY D.DEPARTMENT_NAME ASC;

/*8. ���� ���� �̸��� ã������ ����. ���� �̸��� ���� �̸��� ����ϴ� SQL ����
�ۼ��Ͻÿ�.*/

SELECT C.CLASS_NAME, P.PROFESSOR_NAME
FROM TB_CLASS C
JOIN TB_CLASS_PROFESSOR CP ON C.CLASS_NO = CP.CLASS_NO
JOIN TB_PROFESSOR P ON CP.PROFESSOR_NO = P.PROFESSOR_NO
ORDER BY C.CLASS_NAME ASC, P.PROFESSOR_NAME ASC;

/*9. 8 ���� ��� �� ���ι���ȸ�� �迭�� ���� ������ ���� �̸��� ã������ ����. �̿�
�ش��ϴ� ���� �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�.*/

SELECT C.CLASS_NAME, P.PROFESSOR_NAME
FROM TB_CLASS C
JOIN TB_CLASS_PROFESSOR CP ON C.CLASS_NO = CP.CLASS_NO
JOIN TB_PROFESSOR P ON CP.PROFESSOR_NO = P.PROFESSOR_NO
JOIN TB_DEPARTMENT D ON C.DEPARTMENT_NO = D.DEPARTMENT_NO
WHERE D.CATEGORY = '�ι���ȸ'
ORDER BY C.CLASS_NAME ASC, P.PROFESSOR_NAME ASC;

/*10. �������а��� �л����� ������ ���Ϸ��� ����. �����а� �л����� "�й�", "�л� �̸�",
"��ü ����"�� ������ ���� ����(������ �����ϸ� �й� ����)�� ����ϴ� SQL ������
�ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1 �ڸ������� �ݿø��Ͽ� ǥ���Ѵ�.)*/

SELECT S.STUDENT_NO AS �й�, S.STUDENT_NAME AS �л�_�̸�, ROUND(AVG(G.POINT), 1) AS ��ü_����
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
JOIN TB_GRADE G ON S.STUDENT_NO = G.STUDENT_NO  
WHERE D.DEPARTMENT_NAME = '�����а�'
GROUP BY S.STUDENT_NO, S.STUDENT_NAME
ORDER BY ��ü_���� DESC, S.STUDENT_NO ASC;

/*11. �й��� A313047 �� �л��� �б��� ������ ���� �ʴ�. ���� �������� ������ �����ϱ�
���� �а� �̸�, �л� �̸��� ���� ���� �̸��� �ʿ��ϴ�. �̶� ����� SQL ����
�ۼ��Ͻÿ�. ��, �������� ?�а��̸�?, ?�л��̸�?, ?���������̸�?����
��µǵ��� ����.*/


SELECT D.DEPARTMENT_NAME AS �а��̸�, S.STUDENT_NAME AS �л��̸�, P.PROFESSOR_NAME AS ���������̸�
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
JOIN TB_PROFESSOR P ON S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
WHERE S.STUDENT_NO = 'A313047';



/*12. 2007 �⵵�� '�΁A�����' ������ ������ �л��� ã�� �л��̸��� �����б⸦ �̸�
������ ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.*/

SELECT S.STUDENT_NAME AS �л��̸�, G.TERM_NO AS �����б�
FROM TB_GRADE G
JOIN TB_STUDENT S ON G.STUDENT_NO = S.STUDENT_NO
JOIN TB_CLASS C ON G.CLASS_NO = C.CLASS_NO
WHERE C.CLASS_NAME = '�ΰ������'AND TO_CHAR(G.TERM_NO) LIKE '2007%'
ORDER BY S.STUDENT_NAME ASC;

/*13. ��ü�� �迭 ���� �� ���� ��米���� �� �� �������� ���� ������ ã�� �� ����
�̸��� �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.*/

SELECT C.CLASS_NAME AS �����̸�,D.DEPARTMENT_NAME AS �а��̸�
FROM TB_CLASS C
JOIN TB_DEPARTMENT D ON C.DEPARTMENT_NO = D.DEPARTMENT_NO
LEFT JOIN TB_CLASS_PROFESSOR CP ON C.CLASS_NO = CP.CLASS_NO
WHERE D.CATEGORY = '��ü��'  AND CP.PROFESSOR_NO IS NULL 
ORDER BY C.CLASS_NAME;





