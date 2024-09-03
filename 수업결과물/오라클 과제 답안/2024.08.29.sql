-- <JDBC ½Ç½À>
-- BOOK

CREATE TABLE Book (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(50) NOT NULL,
    author VARCHAR2(20) NOT NULL,
    publisher VARCHAR2(20) NOT NULL,
    publish_date DATE NOT NULL,
    price NUMBER NOT NULL
);

CREATE SEQUENCE seq_bid
START WITH 1
INCREMENT BY 1;
