-- JOIN ��������

-- 1. 2020�� 12�� 25���� ���� �������� ��ȸ�Ͻÿ�.
SELECT TO_CHAR(TO_DATE('2020/12/25'), 'YYYYMMDD DAY') 
FROM DUAL;


-- 2. �ֹι�ȣ�� 60��� ���̸鼭 ������ �����̰�, 
-- ���� �达�� �������� 
-- �����, �ֹι�ȣ, �μ���, ���޸��� ��ȸ�Ͻÿ�.
SELECT EMP_NAME, EMP_NO, DEPT_NAME, JOB_TITLE
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
JOIN DEPARTMENT USING (DEPT_ID)
WHERE EMP_NO LIKE '6%'
AND SUBSTR(EMP_NO, 8, 1) = '2'
AND EMP_NAME LIKE '��%';


-- 3. ���� ���̰� ���� ������ 
-- ���, �����, ����, �μ���, ���޸��� ��ȸ�Ͻÿ�.

--������ �ּҰ� ��ȸ
SELECT MIN(TRUNC((MONTHS_BETWEEN(SYSDATE,
          TO_DATE(SUBSTR(EMP_NO, 1, 2), 'RR')) / 12))) ���� 
FROM EMPLOYEE;       

-- ��ȸ�� ������ �ּҰ��� �̿��� ������ ���� ��ȸ��
-- outer join �ʿ���.
SELECT EMP_ID, EMP_NAME, 
       MIN(TRUNC((MONTHS_BETWEEN(SYSDATE, TO_DATE(SUBSTR(EMP_NO, 1, 2), 
       'RR')) / 12))) ���� ,
       DEPT_NAME, JOB_TITLE
FROM EMPLOYEE
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
GROUP BY EMP_ID, EMP_NAME, DEPT_NAME, JOB_TITLE
HAVING MIN(TRUNC((MONTHS_BETWEEN(SYSDATE, TO_DATE(SUBSTR(EMP_NO, 1, 2), 
       'RR')) / 12))) = 24;

-- ���������� ����� ��� *****************************
SELECT EMP_ID, EMP_NAME, 
       MIN(TRUNC((MONTHS_BETWEEN(SYSDATE, TO_DATE(SUBSTR(EMP_NO, 1, 2), 
       'RR')) / 12))) ���� ,
       DEPT_NAME, JOB_TITLE
FROM EMPLOYEE
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
GROUP BY EMP_ID, EMP_NAME, DEPT_NAME, JOB_TITLE
HAVING MIN(TRUNC((MONTHS_BETWEEN(SYSDATE, TO_DATE(SUBSTR(EMP_NO, 1, 2), 
       'RR')) / 12))) = (SELECT MIN(TRUNC((MONTHS_BETWEEN
                      (SYSDATE, 
                      TO_DATE(SUBSTR(EMP_NO, 1, 2), 
                                 'RR')) / 12))) ���� 
                      FROM EMPLOYEE);

-- 4. �̸��� '��'�ڰ� ���� �������� 
-- ���, �����, �μ����� ��ȸ�Ͻÿ�.
SELECT EMP_ID, EMP_NAME, DEPT_NAME
FROM EMPLOYEE
JOIN DEPARTMENT USING (DEPT_ID)
WHERE EMP_NAME LIKE '%��%';


-- 5. �ؿܿ������� �ٹ��ϴ� 
-- �����, ���޸�, �μ��ڵ�, �μ����� ��ȸ�Ͻÿ�.
SELECT EMP_NAME, JOB_TITLE, DEPT_ID, DEPT_NAME
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
JOIN DEPARTMENT USING (DEPT_ID)
WHERE DEPT_NAME LIKE '�ؿܿ���%'
ORDER BY 4;


-- 6. ���ʽ�����Ʈ�� �޴� �������� 
-- �����, ���ʽ�����Ʈ, �μ���, �ٹ��������� ��ȸ�Ͻÿ�.
SELECT EMP_NAME, BONUS_PCT, DEPT_NAME, LOC_DESCRIBE
FROM EMPLOYEE
JOIN DEPARTMENT USING (DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOC_ID)
WHERE BONUS_PCT IS NOT NULL
AND BONUS_PCT <> 0.0;


-- 7. �μ��ڵ尡 20�� �������� 
-- �����, ���޸�, �μ���, �ٹ��������� ��ȸ�Ͻÿ�.
SELECT EMP_NAME, JOB_TITLE, DEPT_NAME, LOC_DESCRIBE
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
JOIN DEPARTMENT USING (DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOC_ID)
WHERE DEPT_ID = '20';


-- 8. ���޺� ������ �ּұ޿�(MIN_SAL)���� ���� �޴� ��������
-- �����, ���޸�, �޿�, ������ ��ȸ�Ͻÿ�.
-- ������ ���ʽ�����Ʈ�� �����Ͻÿ�.
SELECT EMP_NAME, JOB_TITLE, SALARY, 
       (SALARY + NVL(BONUS_PCT, 0) * SALARY) * 12 ����
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)       
WHERE (SALARY + NVL(BONUS_PCT, 0) * SALARY) * 12 
      > MIN_SAL;


-- 9 . �ѱ�(KO)�� �Ϻ�(JP)�� �ٹ��ϴ� �������� 
-- �����(emp_name), �μ���(dept_name), ������(loc_describe),
--  ������(country_name)�� ��ȸ�Ͻÿ�.
SELECT EMP_NAME �����, DEPT_NAME �μ���,
       LOC_DESCRIBE ������, COUNTRY_NAME ������
FROM EMPLOYEE
JOIN DEPARTMENT USING (DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOC_ID)
JOIN COUNTRY USING (COUNTRY_ID)       
WHERE COUNTRY_ID IN ('KO', 'JP');

-- 10. ���� �μ��� �ٹ��ϴ� �������� 
-- �����, �μ��ڵ�, �����̸�, �μ��ڵ带 ��ȸ�Ͻÿ�.
-- self join ���
SELECT E.EMP_NAME �����, E.DEPT_ID �μ��ڵ�, 
       C.EMP_NAME �����̸�, C.DEPT_ID �μ��ڵ�
FROM EMPLOYEE E, EMPLOYEE C
WHERE E.EMP_NAME <> C.EMP_NAME
AND E.DEPT_ID = C.DEPT_ID
ORDER BY E.EMP_NAME;



-- 11. ���ʽ�����Ʈ�� ���� ������ �߿��� 
-- �����ڵ尡 J4�� J7�� �������� �����, ���޸�, �޿��� ��ȸ�Ͻÿ�.

-- ��, join�� IN ���
SELECT EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE JOB_ID IN ('J4', 'J7') AND BONUS_PCT IS NULL;

-- ��, join�� set operator ���
SELECT EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE JOB_ID = 'J4' AND BONUS_PCT IS NULL
UNION
SELECT EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE JOB_ID = 'J7' AND BONUS_PCT IS NULL;



-- 12. �ҼӺμ��� 50 �Ǵ� 90�� ������ 
-- ��ȥ�� ������ ��ȥ�� ������ ���� ��ȸ�Ͻÿ�.
SELECT DECODE(MARRIAGE, 'Y', '��ȥ', 'N', '��ȥ') ��ȥ����, 
       COUNT(*) ������
FROM EMPLOYEE
WHERE DEPT_ID IN ('50', '90')
GROUP BY DECODE(MARRIAGE, 'Y', '��ȥ', 'N', '��ȥ')
ORDER BY 1;
