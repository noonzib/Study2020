/*  (book_orders-ora.sql) */

-- Book(bookid, bookname, publisher, price)
-- Customer(custid, name, address, phone)
-- Orders(orderid, custid, bookid, saleprice, orderdate)

drop table orders;
drop table book;
drop table customer;

-- Book, Customer, Orders 테이블 생성

CREATE TABLE Book (
  bookid      INT PRIMARY KEY,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       INT 
);

CREATE TABLE  Customer (
  custid      INT PRIMARY KEY,  
  name        VARCHAR(40),
  address     VARCHAR(40),
  phone       VARCHAR(30)
);

CREATE TABLE Orders (
  orderid	INT  PRIMARY KEY,
  custid	INT  REFERENCES Customer(custid),
  bookid	INT  REFERENCES Book(bookid),
  saleprice INT,
  orderdate DATE
);

-- Book, Customer, Orders 데이터 생성
INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구 아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '역도 단계별 기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전', NULL);

-- 주문(Orders) 테이블의 책값은 할인 판매를 가정함
INSERT INTO Orders VALUES (1, 1, 1, 6000, '2013-07-01'); 
INSERT INTO Orders VALUES (2, 1, 3, 21000, '2013-07-03');
INSERT INTO Orders VALUES (3, 2, 5, 8000, '2013-07-03'); 
INSERT INTO Orders VALUES (4, 3, 6, 6000, '2013-07-04'); 
INSERT INTO Orders VALUES (5, 4, 7, 20000, '2013-07-05');
INSERT INTO Orders VALUES (6, 1, 2, 12000, '2013-07-07');
INSERT INTO Orders VALUES (7, 4, 8, 13000, '2013-07-07');
INSERT INTO Orders VALUES (8, 3, 10, 12000, '2013-07-08'); 
INSERT INTO Orders VALUES (9, 2, 10, 7000, '2013-07-09'); 
INSERT INTO Orders VALUES (10, 3, 8, 13000, '2013-07-10');

COL bookid    FOR 99
COL bookname  FOR a20
COL publisher FOR a10
COL price     FOR 9999999

COL custid  FOR 99999
COL name    FOR a8
COL address FOR a20
COL phone   FOR a15

COL orderdate FOR a10

-- custid 가 ###### 으로 출력된다
/*
COL custid  FOR a5
COL name    FOR a8
COL address FOR a20
COL phone   FOR a15
*/

select * from book;
select * from customer;
select * from orders;