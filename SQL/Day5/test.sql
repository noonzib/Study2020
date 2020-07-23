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

-- 질의1-1) '축구의 역사' 라는 도서의 출판사와 가격을 검색하라

SELECT publisher, price 
FROM book
WHERE bookname='축구의 역사';

PUBLISHER     PRICE
---------- --------
굿스포츠       7000

-- 질의1-2) 김연아 고객의 전화번호를 검색하라
SELECT phone 
FROM customer
WHERE name='김연아';

PHONE          
---------------
000-6000-0001

-- 질의1-3) 10,000 이상인 도서의 이름과 출판사를 검색하라

SELECT bookname, publisher
FROM book
WHERE price >=10000;

BOOKNAME             PUBLISHER 
-------------------- ----------
축구 아는 여자       나무수    
축구의 이해          대한미디어
골프 바이블          대한미디어
야구의 추억          이상미디어
야구를 부탁해        이상미디어
Olympic Champions    Pearson 

-- 질의2-1) 모든 도서의 이름과 가격을 검색하라

SELECT bookname, price 
FROM book;

BOOKNAME                PRICE
-------------------- --------
축구의 역사              7000
축구 아는 여자          13000
축구의 이해             22000
골프 바이블             35000
피겨 교본                8000
역도 단계별 기술         6000
야구의 추억             20000
야구를 부탁해           13000
올림픽 이야기            7500
Olympic Champions       13000

-- 질의2-2) 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하라

SELECT bookid, bookname, publisher, price  
FROM book;

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     1 축구의 역사          굿스포츠       7000
     2 축구 아는 여자       나무수        13000
     3 축구의 이해          대한미디어    22000
     4 골프 바이블          대한미디어    35000
     5 피겨 교본            굿스포츠       8000
     6 역도 단계별 기술     굿스포츠       6000
     7 야구의 추억          이상미디어    20000
     8 야구를 부탁해        이상미디어    13000
     9 올림픽 이야기        삼성당         7500
    10 Olympic Champions    Pearson       13000

-- 질의2-3) 도서 테이블에 있는 모든 출판사를 검색하라
--(중복제거) 도서 테이블에 있는 모든 출판사를 검색하라

SELECT distinct publisher
FROM book;

PUBLISHER 
----------
나무수
이상미디어
대한미디어
Pearson
굿스포츠
삼성당

-- 질의2-4) 가격이 20,000 원 미만인 도서를 검색하라

SELECT * 
FROM book
WHERE price < 20000

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     1 축구의 역사          굿스포츠       7000
     2 축구 아는 여자       나무수        13000
     5 피겨 교본            굿스포츠       8000
     6 역도 단계별 기술     굿스포츠       6000
     8 야구를 부탁해        이상미디어    13000
     9 올림픽 이야기        삼성당         7500
    10 Olympic Champions    Pearson       13000
    
--질의2-5) 가격이 10,000 원 이상 20,000 원 이하인 도서를 검색하라
--(BETWEEN .. AND 사용)

SELECT *
FROM book
WHERE price between 10000 and 20000;

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     2 축구 아는 여자       나무수        13000
     7 야구의 추억          이상미디어    20000
     8 야구를 부탁해        이상미디어    13000
    10 Olympic Champions    Pearson       13000
    
--질의2-5) 가격이 10,000 원 이상 20,000 원 이하인 도서를 검색하라
--(부등호 사용)

SELECT *
FROM book
WHERE price >=10000 and price <= 20000;

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     2 축구 아는 여자       나무수        13000
     7 야구의 추억          이상미디어    20000
     8 야구를 부탁해        이상미디어    13000
    10 Olympic Champions    Pearson       13000

-- 질의2-6) 출판사가 '굿스포츠' 혹은 '대한미디어' 인 도서를 검색하라
-- (IN 사용)

SELECT *
FROM book
WHERE publisher in '대한미디어';

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     3 축구의 이해          대한미디어    22000
     4 골프 바이블          대한미디어    35000

--질의2-7) --출판사가 '굿스포츠' 혹은 '대한미디어' 가 아닌 도서를 검색하라
--(NOT IN 사용)

SELECT *
FROM book
WHERE publisher not in '대한미디어';

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     1 축구의 역사          굿스포츠       7000
     2 축구 아는 여자       나무수        13000
     5 피겨 교본            굿스포츠       8000
     6 역도 단계별 기술     굿스포츠       6000
     7 야구의 추억          이상미디어    20000
     8 야구를 부탁해        이상미디어    13000
     9 올림픽 이야기        삼성당         7500
    10 Olympic Champions    Pearson       13000

--(패턴문자, 와일드카드)
-- 질의3-1) '축구의 역사' 를 출간한 도서명, 출판사를 검색하라

SELECT bookname, publisher
FROM book
WHERE bookname = '축구의 역사';

BOOKNAME             PUBLISHER 
-------------------- ----------
축구의 역사          굿스포츠  

-- 질의3-2) 도서이름에 '축구' 가 포함된 도서명, 출판사를 검색하라

SELECT bookname, publisher
FROM book
WHERE bookname like '%축구%';

BOOKNAME             PUBLISHER 
-------------------- ----------
축구의 역사          굿스포츠  
축구 아는 여자       나무수    
축구의 이해          대한미디어

-- 질의3-3) 도서이름 왼쪽 두번째 위치에 '구' 라는 문자열을 갖는 도서를 검색하라

SELECT * 
FROM book
WHERE bookname like '_구%';

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     1 축구의 역사          굿스포츠       7000
     2 축구 아는 여자       나무수        13000
     3 축구의 이해          대한미디어    22000
     7 야구의 추억          이상미디어    20000
     8 야구를 부탁해        이상미디어    13000
     
-- 질의3-4) 축구에 관한 도서 중 가격이 20,000 이상인 도서를 검색하라

SELECT *
FROM book
WHERE bookname like '%축구%' and price >= 20000;

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     3 축구의 이해          대한미디어    22000
     
--(정렬)
-- 질의4-1) 도서를 이름순으로 검색하라

SELECT * 
FROM book
ORDER BY bookname asc;

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
    10 Olympic Champions    Pearson       13000
     4 골프 바이블          대한미디어    35000
     8 야구를 부탁해        이상미디어    13000
     7 야구의 추억          이상미디어    20000
     6 역도 단계별 기술     굿스포츠       6000
     9 올림픽 이야기        삼성당         7500
     2 축구 아는 여자       나무수        13000
     1 축구의 역사          굿스포츠       7000
     3 축구의 이해          대한미디어    22000
     5 피겨 교본            굿스포츠       8000

-- 질의4-2) 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하라

SELECT * 
FROM book
ORDER BY price ASC, bookname asc;

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     6 역도 단계별 기술     굿스포츠       6000
     1 축구의 역사          굿스포츠       7000
     9 올림픽 이야기        삼성당         7500
     5 피겨 교본            굿스포츠       8000
    10 Olympic Champions    Pearson       13000
     8 야구를 부탁해        이상미디어    13000
     2 축구 아는 여자       나무수        13000
     7 야구의 추억          이상미디어    20000
     3 축구의 이해          대한미디어    22000
     4 골프 바이블          대한미디어    35000
     
-- 질의4-3) 도서를 가격의 내림차순으로 검색하고, 가격이 같으면 출판사의 오름차순으로 검색하라

SELECT *
FROM book
order by price desc, publisher asc;

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     4 골프 바이블          대한미디어    35000
     3 축구의 이해          대한미디어    22000
     7 야구의 추억          이상미디어    20000
    10 Olympic Champions    Pearson       13000
     2 축구 아는 여자       나무수        13000
     8 야구를 부탁해        이상미디어    13000
     5 피겨 교본            굿스포츠       8000
     9 올림픽 이야기        삼성당         7500
     1 축구의 역사          굿스포츠       7000
     6 역도 단계별 기술     굿스포츠       6000

--(집계함수/GROUP BY)
-- 질의5-1) 주문도서의 총 판매액을 검색하라

SELECT SUM(saleprice)
from orders;

SUM(SALEPRICE)
--------------
        118000

-- 질의5-2) 2번 김연아 고객이 주문한 도서의 총 판매액을 검색하라

SELECT SUM(saleprice)
FROM orders
WHERE custid = 2;

SUM(SALEPRICE)
--------------
         15000

-- 질의5-3) 주문도서의 총 판매액, 평균값, 최저가, 최고가를 검색하라

SELECT SUM(saleprice), AVG(saleprice), MIN(saleprice), MAX(saleprice)
FROM orders;

-- 질의5-4) 도서별 판매 건수를 검색하라

SELECT bookid, COUNT(bookid)
from orders
Group by bookid
ORDER BY bookid asc;

BOOKID COUNT(BOOKID)
------ -------------
     1             1
     2             1
     3             1
     5             1
     6             1
     7             1
     8             2
    10             2
    
-- 질의5-5) 고객별로 주문한 도서의 총 수량과 총 판매액을 검색하라

SELECT custid, count(orderid), sum(saleprice)
FROM orders
GROUP BY custid;

CUSTID COUNT(ORDERID) SUM(SALEPRICE)
------ -------------- --------------
     1              3          39000
     2              2          15000
     4              2          33000
     3              3          31000
     
-- 질의5-6) 가격이 8,000 원 이상인 도서를 구매한 고객에 대하여
-- 고객별 주문 도서의 총 수량을 검색하라.  단, 두 권 이상 구매한 고객만 구한다

SELECT custid, count(orderid)
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING count(orderid) >= 2;

--(조인)
-- 질의6-1) 고객과 고객의 주문에 관한 데이터를 모두 검색하라

SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid;

CUSTID NAME     ADDRESS              PHONE              ORDERID CUSTID BOOKID  SALEPRICE ORDERDATE 
------ -------- -------------------- --------------- ---------- ------ ------ ---------- ----------
     1 박지성   영국 맨체스타        000-5000-0001            1      1      1       6000 13/07/01  
     1 박지성   영국 맨체스타        000-5000-0001            2      1      3      21000 13/07/03  
     2 김연아   대한민국 서울        000-6000-0001            3      2      5       8000 13/07/03  
     3 장미란   대한민국 강원도      000-7000-0001            4      3      6       6000 13/07/04  
     4 추신수   미국 클리블랜드      000-8000-0001            5      4      7      20000 13/07/05  
     1 박지성   영국 맨체스타        000-5000-0001            6      1      2      12000 13/07/07  
     4 추신수   미국 클리블랜드      000-8000-0001            7      4      8      13000 13/07/07  
     3 장미란   대한민국 강원도      000-7000-0001            8      3     10      12000 13/07/08  
     2 김연아   대한민국 서울        000-6000-0001            9      2     10       7000 13/07/09  
     3 장미란   대한민국 강원도      000-7000-0001           10      3      8      13000 13/07/10  
     
-- 질의6-2) 고객과 고객의 주문에 관한 데이터를 고객별로 정렬하여 검색하라

SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid
order by customer.custid;

CUSTID NAME     ADDRESS              PHONE              ORDERID CUSTID BOOKID  SALEPRICE ORDERDATE 
------ -------- -------------------- --------------- ---------- ------ ------ ---------- ----------
     1 박지성   영국 맨체스타        000-5000-0001            2      1      3      21000 13/07/03  
     1 박지성   영국 맨체스타        000-5000-0001            6      1      2      12000 13/07/07  
     1 박지성   영국 맨체스타        000-5000-0001            1      1      1       6000 13/07/01  
     2 김연아   대한민국 서울        000-6000-0001            9      2     10       7000 13/07/09  
     2 김연아   대한민국 서울        000-6000-0001            3      2      5       8000 13/07/03  
     3 장미란   대한민국 강원도      000-7000-0001            4      3      6       6000 13/07/04  
     3 장미란   대한민국 강원도      000-7000-0001           10      3      8      13000 13/07/10  
     3 장미란   대한민국 강원도      000-7000-0001            8      3     10      12000 13/07/08  
     4 추신수   미국 클리블랜드      000-8000-0001            7      4      8      13000 13/07/07  
     4 추신수   미국 클리블랜드      000-8000-0001            5      4      7      20000 13/07/05 

-- 질의6-3) 고객의 이름과 고객이 주문한 도서의 가격을 검색하라

SELECT customer.name, ORDERS.SALEPRICE
FROM customer, orders
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID;

NAME      SALEPRICE
-------- ----------
박지성         6000
박지성        21000
김연아         8000
장미란         6000
추신수        20000
박지성        12000
추신수        13000
장미란        12000
김연아         7000
장미란        13000

-- 질의6-4) 고객이름별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하라

SELECT customer.name, ORDERS.SALEPRICE
FROM customer, orders
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
ORDER BY customer.name;

NAME      SALEPRICE
-------- ----------
김연아         7000
김연아         8000
박지성        21000
박지성        12000
박지성         6000
장미란         6000
장미란        13000
장미란        12000
추신수        13000
추신수        20000

--(3개 테이블 조인)
-- 질의7-1) 고객의 이름과 고객이 주문한 도서의 이름을 검색하라

SELECT CUSTOMER.NAME, BOOK.BOOKNAME
FROM book, customer, orders
WHERE BOOK.BOOKID = ORDERS.BOOKID and CUSTOMER.CUSTID = ORDERS.CUSTID;

NAME     BOOKNAME            
-------- --------------------
박지성   축구의 역사         
박지성   축구 아는 여자      
박지성   축구의 이해         
김연아   피겨 교본           
장미란   역도 단계별 기술    
추신수   야구의 추억         
장미란   야구를 부탁해       
추신수   야구를 부탁해       
김연아   Olympic Champions   
장미란   Olympic Champions

-- 질의7-2) 가격이 20,000 원인 도서를 주문한 고객의 이름과 도서의 이름을 검색하라

SELECT CUSTOMER.NAME, BOOK.BOOKNAME
FROM book, customer, orders
WHERE ORDERS.SALEPRICE >= 20000 and BOOK.BOOKID = ORDERS.BOOKID and CUSTOMER.CUSTID = ORDERS.CUSTID;

NAME     BOOKNAME                PRICE
-------- -------------------- --------
박지성   축구의 이해             22000
추신수   야구의 추억             20000

--(외부조인)
--질의8-1) 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 주문한 가격을 검색하라



--(부질의 : sub query)
--질의9-1) 가장 비싼 도서이름을 검색하라

SELECT bookname
from book
where price = (select max(price) from book);

BOOKNAME            
--------------------
골프 바이블

--(수정/삭제)
--Customer(custid, name, address, phone)
--질의10-1) Customer 테이블에서 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 수정하라
            수정한 이후 결과를 조회하시오

UPDATE customer 
set address = '대한민국 부산'
WHERE CUSTID = 5;

select * 
from customer;

CUSTID NAME     ADDRESS              PHONE          
------ -------- -------------------- ---------------
     1 박지성   영국 맨체스타        000-5000-0001  
     2 김연아   대한민국 서울        000-6000-0001  
     3 장미란   대한민국 강원도      000-7000-0001  
     4 추신수   미국 클리블랜드      000-8000-0001  
     5 박세리   대한민국 부산  

--질의10-2) Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 수정하라
수정한 이후 결과를 조회하시오

UPDATE customer 
set address = (select address 
                from customer
                where name = '김연아')
WHERE name = '박세리';

select * 
from customer;

CUSTID NAME     ADDRESS              PHONE          
------ -------- -------------------- ---------------
     1 박지성   영국 맨체스타        000-5000-0001  
     2 김연아   대한민국 서울        000-6000-0001  
     3 장미란   대한민국 강원도      000-7000-0001  
     4 추신수   미국 클리블랜드      000-8000-0001  
     5 박세리   대한민국 서울                       

--질의11-1) Customer 테이블에서 고객번호가 5인 고객을 삭제하라
삭제한 이후 결과를 조회하시오

DELETE 
FROM customer
where custid = 5;

select * 
from customer;

CUSTID NAME     ADDRESS              PHONE          
------ -------- -------------------- ---------------
     1 박지성   영국 맨체스타        000-5000-0001  
     2 김연아   대한민국 서울        000-6000-0001  
     3 장미란   대한민국 강원도      000-7000-0001  
     4 추신수   미국 클리블랜드      000-8000-0001  
     