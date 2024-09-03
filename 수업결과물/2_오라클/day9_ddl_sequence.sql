-- day9_ddl_sequence.sql

-- ������ (SEQUENCE)
-- �ڵ� ����(����) �߻��ϴ� ��ü
-- ���������� �������� �ڵ����� �߻���
-- ��ü ���� ���� :
/*
CREATE SEQUENCE �������̸�
[START WITH ���ۼ���] -- �����Ǹ� �⺻ 1 ����
[INCREMENT BY �������Ҽ���] -- �����Ǹ� �⺻ 1 ������
[MAXVALUE ������ | NOMAXVALUE (�⺻)] -- NOMAXVALUE �̸� 10�� 27�±��� ���� �߻���
[MINVALUE �ּҰ� | NOMINVALUE (�⺻)] -- NOMINVALUE �̸� -10�� 26�±��� ���� �߻���
[CYCLE | NOCYCLE (�⺻)] -- ������(�ּҰ�)���� ���� ��ȯ�Ǹ� ������ 1���� ������
[CACHE ���尹�� | NOCACHE (�⺻)] -- ĳ�� �޸𸮿� �̸� ���ڸ� �߻����� ���� �ϳ��� ���� (���尹�� 2~10)
*/

-- ������ ����� 1 :
CREATE SEQUENCE SEQ_EMPID
START WITH 300 -- 300���� ����
INCREMENT BY 5 -- 5�� ����
MAXVALUE 310 -- 310���� ���ڸ� �߻�
NOCYCLE --310 ���� �� ���̻� ���� ���� �� ��
NOCACHE; -- �̸� �޸𸮿� ���� ���� ���� �� ��

-- ������ ���� ��ųʸ� Ȯ�� : USER_SEQUENCES, USER_OBJECTS
DESC USER_SEQUENCES;

SELECT * FROM USER_SEQUENCES;

SELECT SEQUENCE_NAME, CACHE_SIZE, LAST_NUMBER
FROM USER_SEQUENCES;
-- LAST_NUMBER : ���� �߻����� �ǹ���

-- ������ ��� : �������̸�.NEXTVAL �Ӽ� ������� ���� �߻���Ŵ
SELECT SEQ_EMPID.NEXTVAL FROM DUAL;
-- NOCYCLE �̱� ������ ������ 310 ���� �� �߻���Ű�� ���� �߻�

-- ������ ����� 2 :
CREATE SEQUENCE SEQ2_EMPID
START WITH 5
INCREMENT BY 5
MAXVALUE 15
CYCLE
NOCACHE;

-- ��� : 
SELECT SEQ2_EMPID.NEXTVAL FROM DUAL;
-- 5, 10, 15, 1, 6, 11, 1, 6, 11.... �ݺ���

-- ������  ��� �Ӽ� : 
-- �������̸�.NEXTVAL : ���ο� ���� ���ڸ� �߻���Ű�� �Ӽ���
-- �������̸�.CURRVAL : �������� ���������� �߻��� �� Ȯ���ϴ� �Ӽ���
--      ���� : ������ ��ü �����, NEXTVAL �� ���� �����ϰ� ���� ����ؾ� ��
--           NEXTVAL �������� �ʰ� CURRVAL ����ϸ� ���� �߻���

CREATE SEQUENCE SEQ3_EMPID
INCREMENT BY 5
START WITH 300
MAXVALUE 310
NOCYCLE NOCACHE;

-- ������ ��ü ����� �ٷ� CURRVAL ��� Ȯ��
SELECT SEQ3_EMPID.CURRVAL FROM DUAL; -- DRROR

SELECT SEQ3_EMPID.NEXTVAL FROM DUAL; -- 300
SELECT SEQ3_EMPID.CURRVAL FROM DUAL; -- ������ �߻��� 300 Ȯ��

-- ������ ��ü�� ���� INSERT ������ ���� ��Ͽ����� �����
CREATE SEQUENCE SEQID
START WITH 300
INCREMENT BY 1 -- �⺻�� 1��, �����ص� ��
MAXVALUE 310
NOCYCLE NOCACHE; 

INSERT  INTO EMP_COPY (EMP_ID, EMP_NAME,EMP_NO)
VALUES (SEQID.NEXTVAL, '�迵��', '940301-1234567');

INSERT  INTO EMP_COPY (EMP_ID, EMP_NAME,EMP_NO)
VALUES (TO_CHAR(SEQID.NEXTVAL), '����ǥ', '940305-1234567');

SELECT * FROM EMP_COPY;

-- ������ ���� -----------------------------------------------
-- ���� : START WITH �� ���� �� ��, ������ ���ϸ� ������ �����ϰ� �ٽ� �������
/*
���� ���� : 
ALTER SEQUENCE �������̸�
[INCREMENT BY �������Ҽ��ں���]
[MAXVALUE ���������� | NOMAXVALUE �� ����]
[MINVALUE �ּҰ����� | NOMINVLAUE �� ����]
[CYCLE �� ���� | NOCYCLE �� ����]
[CACHE ���尹������ |  NOCACHE ����];

������ ���Ŀ� ����ϸ�, ������ �������� �� �߻���
*/

-- ������ ����  �� : 
CREATE SEQUENCE SEQID2
START WITH 300
INCREMENT BY 1
MAXVALUE 310
NOCYCLE NOCACHE;

SELECT SEQID2.NEXTVAL FROM DUAL; -- 300
SELECT SEQID2.NEXTVAL FROM DUAL; -- 301

ALTER SEQUENCE SEQID2
INCREMENT BY 5;

SELECT SEQID2.NEXTVAL FROM DUAL; -- 306

-- ������ ���� --------------------
-- DROP SEQUENCE �������̸�;
DROP SEQUENCE SEQID2;




























