/*  (book_orders-ora.sql) */

-- Book(bookid, bookname, publisher, price)
-- Customer(custid, name, address, phone)
-- Orders(orderid, custid, bookid, saleprice, orderdate)

drop table orders;
drop table book;
drop table customer;

-- Book, Customer, Orders ���̺� ����

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

-- Book, Customer, Orders ������ ����
INSERT INTO Book VALUES(1, '�౸�� ����', '�½�����', 7000);
INSERT INTO Book VALUES(2, '�౸ �ƴ� ����', '������', 13000);
INSERT INTO Book VALUES(3, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO Book VALUES(4, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO Book VALUES(5, '�ǰ� ����', '�½�����', 8000);
INSERT INTO Book VALUES(6, '���� �ܰ躰 ���', '�½�����', 6000);
INSERT INTO Book VALUES(7, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO Book VALUES(8, '�߱��� ��Ź��', '�̻�̵��', 13000);
INSERT INTO Book VALUES(9, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES (1, '������', '���� ��ü��Ÿ', '000-5000-0001');
INSERT INTO Customer VALUES (2, '�迬��', '���ѹα� ����', '000-6000-0001');  
INSERT INTO Customer VALUES (3, '��̶�', '���ѹα� ������', '000-7000-0001');
INSERT INTO Customer VALUES (4, '�߽ż�', '�̱� Ŭ������', '000-8000-0001');
INSERT INTO Customer VALUES (5, '�ڼ���', '���ѹα� ����', NULL);

-- �ֹ�(Orders) ���̺��� å���� ���� �ǸŸ� ������
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

-- custid �� ###### ���� ��µȴ�
/*
COL custid  FOR a5
COL name    FOR a8
COL address FOR a20
COL phone   FOR a15
*/

select * from book;
select * from customer;
select * from orders;

-- ����1-1) '�౸�� ����' ��� ������ ���ǻ�� ������ �˻��϶�

SELECT publisher, price 
FROM book
WHERE bookname='�౸�� ����';

PUBLISHER     PRICE
---------- --------
�½�����       7000

-- ����1-2) �迬�� ���� ��ȭ��ȣ�� �˻��϶�
SELECT phone 
FROM customer
WHERE name='�迬��';

PHONE          
---------------
000-6000-0001

-- ����1-3) 10,000 �̻��� ������ �̸��� ���ǻ縦 �˻��϶�

SELECT bookname, publisher
FROM book
WHERE price >=10000;

BOOKNAME             PUBLISHER 
-------------------- ----------
�౸ �ƴ� ����       ������    
�౸�� ����          ���ѹ̵��
���� ���̺�          ���ѹ̵��
�߱��� �߾�          �̻�̵��
�߱��� ��Ź��        �̻�̵��
Olympic Champions    Pearson 

-- ����2-1) ��� ������ �̸��� ������ �˻��϶�

SELECT bookname, price 
FROM book;

BOOKNAME                PRICE
-------------------- --------
�౸�� ����              7000
�౸ �ƴ� ����          13000
�౸�� ����             22000
���� ���̺�             35000
�ǰ� ����                8000
���� �ܰ躰 ���         6000
�߱��� �߾�             20000
�߱��� ��Ź��           13000
�ø��� �̾߱�            7500
Olympic Champions       13000

-- ����2-2) ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ �˻��϶�

SELECT bookid, bookname, publisher, price  
FROM book;

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     1 �౸�� ����          �½�����       7000
     2 �౸ �ƴ� ����       ������        13000
     3 �౸�� ����          ���ѹ̵��    22000
     4 ���� ���̺�          ���ѹ̵��    35000
     5 �ǰ� ����            �½�����       8000
     6 ���� �ܰ躰 ���     �½�����       6000
     7 �߱��� �߾�          �̻�̵��    20000
     8 �߱��� ��Ź��        �̻�̵��    13000
     9 �ø��� �̾߱�        �Ｚ��         7500
    10 Olympic Champions    Pearson       13000

-- ����2-3) ���� ���̺� �ִ� ��� ���ǻ縦 �˻��϶�
--(�ߺ�����) ���� ���̺� �ִ� ��� ���ǻ縦 �˻��϶�

SELECT distinct publisher
FROM book;

PUBLISHER 
----------
������
�̻�̵��
���ѹ̵��
Pearson
�½�����
�Ｚ��

-- ����2-4) ������ 20,000 �� �̸��� ������ �˻��϶�

SELECT * 
FROM book
WHERE price < 20000

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     1 �౸�� ����          �½�����       7000
     2 �౸ �ƴ� ����       ������        13000
     5 �ǰ� ����            �½�����       8000
     6 ���� �ܰ躰 ���     �½�����       6000
     8 �߱��� ��Ź��        �̻�̵��    13000
     9 �ø��� �̾߱�        �Ｚ��         7500
    10 Olympic Champions    Pearson       13000
    
--����2-5) ������ 10,000 �� �̻� 20,000 �� ������ ������ �˻��϶�
--(BETWEEN .. AND ���)

SELECT *
FROM book
WHERE price between 10000 and 20000;

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     2 �౸ �ƴ� ����       ������        13000
     7 �߱��� �߾�          �̻�̵��    20000
     8 �߱��� ��Ź��        �̻�̵��    13000
    10 Olympic Champions    Pearson       13000
    
--����2-5) ������ 10,000 �� �̻� 20,000 �� ������ ������ �˻��϶�
--(�ε�ȣ ���)

SELECT *
FROM book
WHERE price >=10000 and price <= 20000;

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     2 �౸ �ƴ� ����       ������        13000
     7 �߱��� �߾�          �̻�̵��    20000
     8 �߱��� ��Ź��        �̻�̵��    13000
    10 Olympic Champions    Pearson       13000

-- ����2-6) ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��' �� ������ �˻��϶�
-- (IN ���)

SELECT *
FROM book
WHERE publisher in '���ѹ̵��';

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     3 �౸�� ����          ���ѹ̵��    22000
     4 ���� ���̺�          ���ѹ̵��    35000

--����2-7) --���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��' �� �ƴ� ������ �˻��϶�
--(NOT IN ���)

SELECT *
FROM book
WHERE publisher not in '���ѹ̵��';

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     1 �౸�� ����          �½�����       7000
     2 �౸ �ƴ� ����       ������        13000
     5 �ǰ� ����            �½�����       8000
     6 ���� �ܰ躰 ���     �½�����       6000
     7 �߱��� �߾�          �̻�̵��    20000
     8 �߱��� ��Ź��        �̻�̵��    13000
     9 �ø��� �̾߱�        �Ｚ��         7500
    10 Olympic Champions    Pearson       13000

--(���Ϲ���, ���ϵ�ī��)
-- ����3-1) '�౸�� ����' �� �Ⱓ�� ������, ���ǻ縦 �˻��϶�

SELECT bookname, publisher
FROM book
WHERE bookname = '�౸�� ����';

BOOKNAME             PUBLISHER 
-------------------- ----------
�౸�� ����          �½�����  

-- ����3-2) �����̸��� '�౸' �� ���Ե� ������, ���ǻ縦 �˻��϶�

SELECT bookname, publisher
FROM book
WHERE bookname like '%�౸%';

BOOKNAME             PUBLISHER 
-------------------- ----------
�౸�� ����          �½�����  
�౸ �ƴ� ����       ������    
�౸�� ����          ���ѹ̵��

-- ����3-3) �����̸� ���� �ι�° ��ġ�� '��' ��� ���ڿ��� ���� ������ �˻��϶�

SELECT * 
FROM book
WHERE bookname like '_��%';

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     1 �౸�� ����          �½�����       7000
     2 �౸ �ƴ� ����       ������        13000
     3 �౸�� ����          ���ѹ̵��    22000
     7 �߱��� �߾�          �̻�̵��    20000
     8 �߱��� ��Ź��        �̻�̵��    13000
     
-- ����3-4) �౸�� ���� ���� �� ������ 20,000 �̻��� ������ �˻��϶�

SELECT *
FROM book
WHERE bookname like '%�౸%' and price >= 20000;

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     3 �౸�� ����          ���ѹ̵��    22000
     
--(����)
-- ����4-1) ������ �̸������� �˻��϶�

SELECT * 
FROM book
ORDER BY bookname asc;

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
    10 Olympic Champions    Pearson       13000
     4 ���� ���̺�          ���ѹ̵��    35000
     8 �߱��� ��Ź��        �̻�̵��    13000
     7 �߱��� �߾�          �̻�̵��    20000
     6 ���� �ܰ躰 ���     �½�����       6000
     9 �ø��� �̾߱�        �Ｚ��         7500
     2 �౸ �ƴ� ����       ������        13000
     1 �౸�� ����          �½�����       7000
     3 �౸�� ����          ���ѹ̵��    22000
     5 �ǰ� ����            �½�����       8000

-- ����4-2) ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��϶�

SELECT * 
FROM book
ORDER BY price ASC, bookname asc;

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     6 ���� �ܰ躰 ���     �½�����       6000
     1 �౸�� ����          �½�����       7000
     9 �ø��� �̾߱�        �Ｚ��         7500
     5 �ǰ� ����            �½�����       8000
    10 Olympic Champions    Pearson       13000
     8 �߱��� ��Ź��        �̻�̵��    13000
     2 �౸ �ƴ� ����       ������        13000
     7 �߱��� �߾�          �̻�̵��    20000
     3 �౸�� ����          ���ѹ̵��    22000
     4 ���� ���̺�          ���ѹ̵��    35000
     
-- ����4-3) ������ ������ ������������ �˻��ϰ�, ������ ������ ���ǻ��� ������������ �˻��϶�

SELECT *
FROM book
order by price desc, publisher asc;

BOOKID BOOKNAME             PUBLISHER     PRICE
------ -------------------- ---------- --------
     4 ���� ���̺�          ���ѹ̵��    35000
     3 �౸�� ����          ���ѹ̵��    22000
     7 �߱��� �߾�          �̻�̵��    20000
    10 Olympic Champions    Pearson       13000
     2 �౸ �ƴ� ����       ������        13000
     8 �߱��� ��Ź��        �̻�̵��    13000
     5 �ǰ� ����            �½�����       8000
     9 �ø��� �̾߱�        �Ｚ��         7500
     1 �౸�� ����          �½�����       7000
     6 ���� �ܰ躰 ���     �½�����       6000

--(�����Լ�/GROUP BY)
-- ����5-1) �ֹ������� �� �Ǹž��� �˻��϶�

SELECT SUM(saleprice)
from orders;

SUM(SALEPRICE)
--------------
        118000

-- ����5-2) 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� �˻��϶�

SELECT SUM(saleprice)
FROM orders
WHERE custid = 2;

SUM(SALEPRICE)
--------------
         15000

-- ����5-3) �ֹ������� �� �Ǹž�, ��հ�, ������, �ְ��� �˻��϶�

SELECT SUM(saleprice), AVG(saleprice), MIN(saleprice), MAX(saleprice)
FROM orders;

-- ����5-4) ������ �Ǹ� �Ǽ��� �˻��϶�

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
    
-- ����5-5) ������ �ֹ��� ������ �� ������ �� �Ǹž��� �˻��϶�

SELECT custid, count(orderid), sum(saleprice)
FROM orders
GROUP BY custid;

CUSTID COUNT(ORDERID) SUM(SALEPRICE)
------ -------------- --------------
     1              3          39000
     2              2          15000
     4              2          33000
     3              3          31000
     
-- ����5-6) ������ 8,000 �� �̻��� ������ ������ ���� ���Ͽ�
-- ���� �ֹ� ������ �� ������ �˻��϶�.  ��, �� �� �̻� ������ ���� ���Ѵ�

SELECT custid, count(orderid)
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING count(orderid) >= 2;

--(����)
-- ����6-1) ���� ���� �ֹ��� ���� �����͸� ��� �˻��϶�

SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid;

CUSTID NAME     ADDRESS              PHONE              ORDERID CUSTID BOOKID  SALEPRICE ORDERDATE 
------ -------- -------------------- --------------- ---------- ------ ------ ---------- ----------
     1 ������   ���� ��ü��Ÿ        000-5000-0001            1      1      1       6000 13/07/01  
     1 ������   ���� ��ü��Ÿ        000-5000-0001            2      1      3      21000 13/07/03  
     2 �迬��   ���ѹα� ����        000-6000-0001            3      2      5       8000 13/07/03  
     3 ��̶�   ���ѹα� ������      000-7000-0001            4      3      6       6000 13/07/04  
     4 �߽ż�   �̱� Ŭ������      000-8000-0001            5      4      7      20000 13/07/05  
     1 ������   ���� ��ü��Ÿ        000-5000-0001            6      1      2      12000 13/07/07  
     4 �߽ż�   �̱� Ŭ������      000-8000-0001            7      4      8      13000 13/07/07  
     3 ��̶�   ���ѹα� ������      000-7000-0001            8      3     10      12000 13/07/08  
     2 �迬��   ���ѹα� ����        000-6000-0001            9      2     10       7000 13/07/09  
     3 ��̶�   ���ѹα� ������      000-7000-0001           10      3      8      13000 13/07/10  
     
-- ����6-2) ���� ���� �ֹ��� ���� �����͸� ������ �����Ͽ� �˻��϶�

SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid
order by customer.custid;

CUSTID NAME     ADDRESS              PHONE              ORDERID CUSTID BOOKID  SALEPRICE ORDERDATE 
------ -------- -------------------- --------------- ---------- ------ ------ ---------- ----------
     1 ������   ���� ��ü��Ÿ        000-5000-0001            2      1      3      21000 13/07/03  
     1 ������   ���� ��ü��Ÿ        000-5000-0001            6      1      2      12000 13/07/07  
     1 ������   ���� ��ü��Ÿ        000-5000-0001            1      1      1       6000 13/07/01  
     2 �迬��   ���ѹα� ����        000-6000-0001            9      2     10       7000 13/07/09  
     2 �迬��   ���ѹα� ����        000-6000-0001            3      2      5       8000 13/07/03  
     3 ��̶�   ���ѹα� ������      000-7000-0001            4      3      6       6000 13/07/04  
     3 ��̶�   ���ѹα� ������      000-7000-0001           10      3      8      13000 13/07/10  
     3 ��̶�   ���ѹα� ������      000-7000-0001            8      3     10      12000 13/07/08  
     4 �߽ż�   �̱� Ŭ������      000-8000-0001            7      4      8      13000 13/07/07  
     4 �߽ż�   �̱� Ŭ������      000-8000-0001            5      4      7      20000 13/07/05 

-- ����6-3) ���� �̸��� ���� �ֹ��� ������ ������ �˻��϶�

SELECT customer.name, ORDERS.SALEPRICE
FROM customer, orders
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID;

NAME      SALEPRICE
-------- ----------
������         6000
������        21000
�迬��         8000
��̶�         6000
�߽ż�        20000
������        12000
�߽ż�        13000
��̶�        12000
�迬��         7000
��̶�        13000

-- ����6-4) ���̸����� �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����϶�

SELECT customer.name, ORDERS.SALEPRICE
FROM customer, orders
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
ORDER BY customer.name;

NAME      SALEPRICE
-------- ----------
�迬��         7000
�迬��         8000
������        21000
������        12000
������         6000
��̶�         6000
��̶�        13000
��̶�        12000
�߽ż�        13000
�߽ż�        20000

--(3�� ���̺� ����)
-- ����7-1) ���� �̸��� ���� �ֹ��� ������ �̸��� �˻��϶�

SELECT CUSTOMER.NAME, BOOK.BOOKNAME
FROM book, customer, orders
WHERE BOOK.BOOKID = ORDERS.BOOKID and CUSTOMER.CUSTID = ORDERS.CUSTID;

NAME     BOOKNAME            
-------- --------------------
������   �౸�� ����         
������   �౸ �ƴ� ����      
������   �౸�� ����         
�迬��   �ǰ� ����           
��̶�   ���� �ܰ躰 ���    
�߽ż�   �߱��� �߾�         
��̶�   �߱��� ��Ź��       
�߽ż�   �߱��� ��Ź��       
�迬��   Olympic Champions   
��̶�   Olympic Champions

-- ����7-2) ������ 20,000 ���� ������ �ֹ��� ���� �̸��� ������ �̸��� �˻��϶�

SELECT CUSTOMER.NAME, BOOK.BOOKNAME
FROM book, customer, orders
WHERE ORDERS.SALEPRICE >= 20000 and BOOK.BOOKID = ORDERS.BOOKID and CUSTOMER.CUSTID = ORDERS.CUSTID;

NAME     BOOKNAME                PRICE
-------- -------------------- --------
������   �౸�� ����             22000
�߽ż�   �߱��� �߾�             20000

--(�ܺ�����)
--����8-1) ������ �������� ���� ���� �����Ͽ� ���� �̸��� �ֹ��� ������ �˻��϶�



--(������ : sub query)
--����9-1) ���� ��� �����̸��� �˻��϶�

SELECT bookname
from book
where price = (select max(price) from book);

BOOKNAME            
--------------------
���� ���̺�

--(����/����)
--Customer(custid, name, address, phone)
--����10-1) Customer ���̺��� ����ȣ�� 5�� ���� �ּҸ� '���ѹα� �λ�'���� �����϶�
            ������ ���� ����� ��ȸ�Ͻÿ�

UPDATE customer 
set address = '���ѹα� �λ�'
WHERE CUSTID = 5;

select * 
from customer;

CUSTID NAME     ADDRESS              PHONE          
------ -------- -------------------- ---------------
     1 ������   ���� ��ü��Ÿ        000-5000-0001  
     2 �迬��   ���ѹα� ����        000-6000-0001  
     3 ��̶�   ���ѹα� ������      000-7000-0001  
     4 �߽ż�   �̱� Ŭ������      000-8000-0001  
     5 �ڼ���   ���ѹα� �λ�  

--����10-2) Customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����϶�
������ ���� ����� ��ȸ�Ͻÿ�

UPDATE customer 
set address = (select address 
                from customer
                where name = '�迬��')
WHERE name = '�ڼ���';

select * 
from customer;

CUSTID NAME     ADDRESS              PHONE          
------ -------- -------------------- ---------------
     1 ������   ���� ��ü��Ÿ        000-5000-0001  
     2 �迬��   ���ѹα� ����        000-6000-0001  
     3 ��̶�   ���ѹα� ������      000-7000-0001  
     4 �߽ż�   �̱� Ŭ������      000-8000-0001  
     5 �ڼ���   ���ѹα� ����                       

--����11-1) Customer ���̺��� ����ȣ�� 5�� ���� �����϶�
������ ���� ����� ��ȸ�Ͻÿ�

DELETE 
FROM customer
where custid = 5;

select * 
from customer;

CUSTID NAME     ADDRESS              PHONE          
------ -------- -------------------- ---------------
     1 ������   ���� ��ü��Ÿ        000-5000-0001  
     2 �迬��   ���ѹα� ����        000-6000-0001  
     3 ��̶�   ���ѹα� ������      000-7000-0001  
     4 �߽ż�   �̱� Ŭ������      000-8000-0001  
     