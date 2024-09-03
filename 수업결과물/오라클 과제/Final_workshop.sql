--  Final_workshop
/*1. 4�� ���̺� ���Ե� ������ �� ���� ���ϴ� SQL ������ ����� SQL ������ �ۼ��Ͻÿ�.*/
SELECT 'TB_BOOK' TABLE_NAME, COUNT(*) ROW_COUNT
FROM TB_BOOK
UNION ALL
SELECT 'TB_BOOK_AUTHOR' TABLE_NAME, COUNT(*) ROW_COUNT
FROM TB_BOOK_AUTHOR
UNION ALL
SELECT 'TB_PUBLISHER' TABLE_NAME, COUNT(*) ROW_COUNT
FROM TB_PUBLISHER
UNION ALL
SELECT 'TB_WRITER' TABLE_NAME, COUNT(*) ROW_COUNT
FROM TB_WRITER;

/*2. 4�� ���̺��� ������ �ľ��Ϸ��� �Ѵ�. ���õ� ���ó�� TABLE_NAME, COLUMN_NAME, DATA_TYPE,
DATA_DEFAULT, NULLABLE, CONSTRAINT_NAME, CONSTRAINT_TYPE, R_CONSTRAINT_NAME ����
��ȸ�ϴ� SQL ������ �ۼ��Ͻÿ�.*/

SELECT 
    C.TABLE_NAME, 
    C.COLUMN_NAME, 
    C.DATA_TYPE, 
    C.DATA_DEFAULT, 
    C.NULLABLE, 
    CC.CONSTRAINT_NAME, 
    CONS.CONSTRAINT_TYPE, 
    CONS.R_CONSTRAINT_NAME
FROM USER_TAB_COLUMNS C
LEFT JOIN USER_CONS_COLUMNS CC ON C.TABLE_NAME = CC.TABLE_NAME 
     AND C.COLUMN_NAME = CC.COLUMN_NAME
LEFT JOIN USER_CONSTRAINTS CONS ON CC.CONSTRAINT_NAME = CONS.CONSTRAINT_NAME
WHERE C.TABLE_NAME IN ('TB_BOOK', 'TB_BOOK_AUTHOR', 'TB_PUBLISHER', 'TB_WRITER')
ORDER BY C.TABLE_NAME, C.COLUMN_NAME;

/*3. �������� 25�� �̻��� å ��ȣ�� �������� ȭ�鿡 ����ϴ� SQL ���� �ۼ��Ͻÿ�.*/

SELECT BOOK_NO, BOOK_NM
FROM TB_BOOK
WHERE LENGTH(BOOK_NM) >= 25;

/*4. �޴��� ��ȣ�� ��019���� �����ϴ� �达 ���� ���� �۰��� �̸������� �������� �� ���� ���� ǥ�õǴ� �۰�
�̸��� �繫�� ��ȭ��ȣ, �� ��ȭ��ȣ, �޴��� ��ȭ��ȣ�� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.*/

SELECT WRITER_NM, OFFICE_TELNO, HOME_TELNO, MOBILE_NO
FROM (
    SELECT WRITER_NM, OFFICE_TELNO, HOME_TELNO, MOBILE_NO,
           RANK() OVER (ORDER BY WRITER_NM) AS RN
    FROM TB_WRITER
    WHERE WRITER_NM LIKE '��%' 
      AND MOBILE_NO LIKE '019%'
)
WHERE RN = 1;

/*5. ���� ���°� ���ű衱�� �ش��ϴ� �۰����� �� �� ������ ����ϴ� SQL ������ �ۼ��Ͻÿ�. (��� �����
���۰�(��)������ ǥ�õǵ��� �� ��)*/
SELECT COUNT(DISTINCT WRITER_NO) "�۰�(��)"
FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE = '�ű�';

/*6. 300�� �̻� ��ϵ� ������ ���� ���� �� ��ϵ� ���� ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.(����
���°� ��ϵ��� ���� ���� ������ ��)*/

SELECT COMPOSE_TYPE, COUNT(*) BOOK_COUNT
FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE IS NOT NULL
GROUP BY COMPOSE_TYPE
HAVING COUNT(*) >= 300
ORDER BY BOOK_COUNT DESC, COMPOSE_TYPE;

/*7. ���� �ֱٿ� �߰��� �ֽ��� �̸��� ��������, ���ǻ� �̸��� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.*/
SELECT BOOK_NM, ISSUE_DATE, PUBLISsHER_NM
FROM TB_BOOK
WHERE ISSUE_DATE = (SELECT MAX(ISSUE_DATE) FROM TB_BOOK);

/*8. ���� ���� å�� �� �۰� 3���� �̸��� ������ ǥ���ϵ�, ���� �� ������� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
��, ��������(��٣���) �۰��� ���ٰ� �����Ѵ�. (��� ����� ���۰� �̸���, ���� ������ ǥ�õǵ��� ��
��)*/
SELECT WRITER_NM "�۰� �̸�", COUNT(*) "�� ��"
FROM TB_BOOK_AUTHOR
JOIN TB_WRITER USING (WRITER_NO)
GROUP BY WRITER_NM
ORDER BY "�� ��" DESC
FETCH FIRST 3 ROWS ONLY;

/*9. �۰� ���� ���̺��� ��� ������� �׸��� �����Ǿ� �ִ� �� �߰��Ͽ���. ������ ������� ���� �� �۰���
������ ���ǵ����� �����ϰ� ������ ��¥���� �����Ű�� SQL ������ �ۼ��Ͻÿ�. (COMMIT ó���� ��)*/

UPDATE TB_WRITER W
SET REGIST_DATE = (
    SELECT MIN(B.ISSUE_DATE)
    FROM TB_BOOK_AUTHOR BA
    JOIN TB_BOOK B ON BA.BOOK_NO = B.BOOK_NO
    WHERE BA.WRITER_NO = W.WRITER_NO
)
WHERE REGIST_DATE IS NULL;

COMMIT;

/*10. ���� �������� ���� ���̺��� ������ �������� ���� ���� �����ϰ� �ִ�. �����δ� �������� ���� �����Ϸ�
�� �Ѵ�. ���õ� ���뿡 �°� ��TB_BOOK_ TRANSLATOR�� ���̺��� �����ϴ� SQL ������ �ۼ��Ͻÿ�.
(Primary Key ���� ���� �̸��� ��PK_BOOK_TRANSLATOR���� �ϰ�, Reference ���� ���� �̸���
��FK_BOOK_TRANSLATOR_01��, ��FK_BOOK_TRANSLATOR_02���� �� ��)*/

CREATE TABLE TB_BOOK_TRANSLATOR (
    BOOK_NO    VARCHAR2(10) NOT NULL,
    WRITER_NO  VARCHAR2(10) NOT NULL,
    TRANS_LANG VARCHAR2(60),
    
    CONSTRAINT PK_BOOK_TRANSLATOR PRIMARY KEY (BOOK_NO, WRITER_NO),
    
    CONSTRAINT FK_BOOK_TRANSLATOR_01 FOREIGN KEY (BOOK_NO)
        REFERENCES TB_BOOK (BOOK_NO),
    CONSTRAINT FK_BOOK_TRANSLATOR_02 FOREIGN KEY (WRITER_NO)
        REFERENCES TB_WRITER (WRITER_NO)
);

/*11. ���� ���� ����(compose_type)�� '�ű�', '����', '��', '����'�� �ش��ϴ� �����ʹ�
���� ���� ���� ���̺��� ���� ���� ���� ���̺�(TB_BOOK_ TRANSLATOR)�� �ű�� SQL
������ �ۼ��Ͻÿ�. ��, ��TRANS_LANG�� �÷��� NULL ���·� �ε��� �Ѵ�. (�̵��� �����ʹ� ��
�̻� TB_BOOK_AUTHOR ���̺� ���� ���� �ʵ��� ������ ��)*/

-- ���� ���� ���� ���̺�� ������ �̵�
INSERT INTO TB_BOOK_TRANSLATOR (BOOK_NO, WRITER_NO, TRANS_LANG)
SELECT BOOK_NO, WRITER_NO, NULL
FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE IN ('�ű�', '����', '��', '����');

-- ���� ���� ���� ���̺��� ������ ����
DELETE FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE IN ('�ű�', '����', '��', '����');

COMMIT;

/*12. 2007�⵵�� ���ǵ� ������ �̸��� ������(����)�� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.*/

SELECT B.BOOK_NM "������ �̸�", W.WRITER_NM "������"
FROM TB_BOOK B
JOIN TB_BOOK_TRANSLATOR BT ON B.BOOK_NO = BT.BOOK_NO
JOIN TB_WRITER W ON BT.WRITER_NO = W.WRITER_NO
WHERE TO_CHAR(B.ISSUE_DATE, 'YYYY') = '2007';

/*13. 12�� ����� Ȱ���Ͽ� ��� ���������� �������� ������ �� ������ �ϴ� �並 �����ϴ� SQL
������ �ۼ��Ͻÿ�. (�� �̸��� ��VW_BOOK_TRANSLATOR���� �ϰ� ������, ������, ��������
ǥ�õǵ��� �� ��)*/
GRANT CREATE VIEW TO c##test; -- ������ �������� �� ���� ���� �߰�

CREATE OR REPLACE VIEW VW_BOOK_TRANSLATOR 
AS
SELECT B.BOOK_NM "������", 
       W.WRITER_NM "������", 
       B.ISSUE_DATE "������"
FROM TB_BOOK B
JOIN TB_BOOK_TRANSLATOR BT ON B.BOOK_NO = BT.BOOK_NO
JOIN TB_WRITER W ON BT.WRITER_NO = W.WRITER_NO
WHERE TO_CHAR(B.ISSUE_DATE, 'YYYY') = '2007'
WITH CHECK OPTION;

/*14. ���ο� ���ǻ�(�� ���ǻ�)�� �ŷ� ����� �ΰ� �Ǿ���. ���õ� ���� ������ �Է��ϴ� SQL
������ �ۼ��Ͻÿ�.(COMMIT ó���� ��)*/

INSERT INTO TB_PUBLISHER (PUBLISHER_NM, PUBLISHER_TELNO)
VALUES ('�� ���ǻ�', '02-6710-3737');

COMMIT;

/*15. ��������(��٣���) �۰��� �̸��� ã������ �Ѵ�. �̸��� �������� ���ڸ� ǥ���ϴ� SQL ������
�ۼ��Ͻÿ�.*/

SELECT WRITER_NM "�۰� �̸�", COUNT(*) "�������� ����"
FROM TB_WRITER
GROUP BY WRITER_NM
HAVING COUNT(*) > 1
ORDER BY "�������� ����" DESC, "�۰� �̸�";

/*16. ������ ���� ���� �� ���� ����(compose_type)�� ������ �����͵��� ���� �ʰ� �����Ѵ�. �ش� �÷���
NULL�� ��� '����'���� �����ϴ� SQL ������ �ۼ��Ͻÿ�.(COMMIT ó���� ��)*/

UPDATE TB_BOOK_AUTHOR
SET COMPOSE_TYPE = '����'
WHERE COMPOSE_TYPE IS NULL;

COMMIT;

/*17. �������� �۰� ������ �����Ϸ��� �Ѵ�. �繫���� �����̰�, �繫�� ��ȭ ��ȣ ������ 3�ڸ��� �۰���
�̸��� �繫�� ��ȭ ��ȣ�� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.*/

SELECT WRITER_NM "�۰� �̸�", 
        OFFICE_TELNO "�繫�� ��ȭ��ȣ"
FROM   TB_WRITER
WHERE  OFFICE_TELNO LIKE '02%'
AND    OFFICE_TELNO LIKE '02-___-%'
ORDER BY 1; 

/*18. 2006�� 1�� �������� ��ϵ� �� 31�� �̻� �� �۰� �̸��� �̸������� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.*/

SELECT WRITER_NM "�۰� �̸�"
FROM TB_WRITER
WHERE REGIST_DATE <= ADD_MONTHS(TO_DATE('2006-01-01', 'YYYY-MM-DD'), -31 * 12)
ORDER BY WRITER_NM;

/*19. ���� ��� �ٽñ� �α⸦ ��� �ִ� 'Ȳ�ݰ���' ���ǻ縦 ���� ��ȹ���� ������ �Ѵ�. 'Ȳ�ݰ���'
���ǻ翡�� ������ ���� �� ��� ������ 10�� �̸��� ������� ����, �����¸� ǥ���ϴ� SQL ������
�ۼ��Ͻÿ�. ��� ������ 5�� �̸��� ������ ���߰��ֹ��ʿ䡯��, �������� ���ҷ��������� ǥ���ϰ�,
�������� ���� ��, ������ ������ ǥ�õǵ��� �Ѵ�. */

SELECT BOOK_NM "������",
       PRICE "����",
       CASE
           WHEN STOCK_QTY < 5 THEN '�߰��ֹ��ʿ�'
           ELSE '�ҷ�����'
       END "������"
FROM   TB_BOOK
WHERE  PUBLISHER_NM = 'Ȳ�ݰ���'
AND    STOCK_QTY < 10
ORDER  BY STOCK_QTY DESC, BOOK_NM;

/*20. '��ŸƮ��' ���� �۰��� ���ڸ� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�. (��� �����
��������,�����ڡ�,�����ڡ��� ǥ���� ��)*/

SELECT B.BOOK_NM "������",
       A.WRITER_NM "����",
       T.WRITER_NM "����"
FROM   TB_BOOK B
LEFT JOIN TB_BOOK_AUTHOR BA ON B.BOOK_NO = BA.BOOK_NO
LEFT JOIN TB_WRITER A ON BA.WRITER_NO = A.WRITER_NO
LEFT JOIN TB_BOOK_TRANSLATOR BT ON B.BOOK_NO = BT.BOOK_NO
LEFT JOIN TB_WRITER T ON BT.WRITER_NO = T.WRITER_NO
WHERE  B.BOOK_NM = '��ŸƮ��';

/*21. ���� �������� ���� �����Ϸκ��� �� 30���� ����ǰ�, ��� ������ 90�� �̻��� ������ ���� ������, ���
����, ���� ����, 20% ���� ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�. (��� ����� ��������, �����
������, ������(Org)��, ������(New)���� ǥ���� ��. ��� ������ ���� ��, ���� ������ ���� ��, ������
������ ǥ�õǵ��� �� ��)*/

SELECT BOOK_NM "������",
       STOCK_QTY "��� ����",
       PRICE "����(Org)",
       TO_CHAR(PRICE * 0.8, '99,999') "����(New)"
FROM   TB_BOOK
WHERE  ISSUE_DATE <= ADD_MONTHS(SYSDATE, -30 * 12)
AND    STOCK_QTY >= 90
ORDER  BY STOCK_QTY DESC, PRICE * 0.8 DESC, BOOK_NM;


