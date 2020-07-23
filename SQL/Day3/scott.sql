CREATE TABLE customer (
    cno char(4) NOT NULL,
    cname varchar2(12) NOT NULL,
    city varchar2(20),
    point int,
    CONSTRAINT pk_customer_cno PRIMARY KEY(cno)
);

INSERT INTO customer VALUES('c101','ȫ�浿','����',500);
INSERT INTO customer VALUES('c102','�Ӳ���','��õ',300);
INSERT INTO customer VALUES('c103','����ȣ','�Ⱦ�',800);
INSERT INTO customer VALUES('c204','�ŵ���','��õ',350);
INSERT INTO customer VALUES('c205','������','���',400);
INSERT INTO customer VALUES('c307','������','����',null);

select * from customer;
select cno, cname, city from CUSTOMER;
select cname, city from CUSTOMER;
select cname as ����, city as ������ from CUSTOMER;
select city from CUSTOMER;
select DISTINCT city from CUSTOMER; 

SELECT * from CUSTOMER WHERE cno='c101';
select * from CUSTOMER where point <= 400;
select cname, city, point from CUSTOMER where city="����" and point >= 500;
select cname, city, point from CUSTOMER where city="����" or point >= 500;
select cname, city, point from CUSTOMER where point BETWEEN 350 AND 500;

select cname, city, point from CUSTOMER where city IN ('����', '�Ⱦ�');
select cname, city, point from CUSTOMER where city NOT IN ('����', '�Ⱦ�');

select * from CUSTOMER where cname like '��%';
select * from CUSTOMER where cname like '%��%';
select * from CUSTOMER where cname like '%��';
select * from CUSTOMER where cname like 'ȫ%' and cname like '��%' and cname like '��%';
select * from CUSTOMER where cname NOT like 'ȫ%' and cname NOT like '��%' and cname NOT like '��%';
select cno, cname, point from CUSTOMER where point is NULL;
select cno, cname, point from CUSTOMER where point is NOt NULL;

select * from CUSTOMER order by cname asc;
select * from CUSTOMER where city='����' order by cname asc;
select * from CUSTOMER order by city asc, point desc;
select * from CUSTOMER order by point desc, cname asc, city asc;
select * from CUSTOMER order by 3;
-- 3��° �÷����� �������� ����

drop table �а�;
drop table �л�;

CREATE TABLE �а� (
    �а���ȣ int,
    �а��� VARCHAR(30),
    primary key(�а���ȣ)
);

CREATE table �л�(
    �й� int,
    �̸� varchar(20),
    �а���ȣ int,
    primary key(�й�),
    FOREIGN key(�а���ȣ) REFERENCES �а�(�а���ȣ)
);

INSERT INTO �а� VALUES(1,'��ǻ�Ͱ��а�');
INSERT INTO �а� VALUES(2,'������Ű�');
INSERT INTO �а� VALUES(3,'�ɸ��а�');

insert into �л� VALUES(1,'������',1);
insert into �л� VALUES(2,'��̸�',2);
insert into �л� VALUES(3,'������',1);
insert into �л� VALUES(4,'������',3);
insert into �л� VALUES(5,'�Ǽ�ȣ',2);

select * from �а�;
select * from �л�;

SELECT �̸�, �а��� FROM �л�, �а� WHERE �л�.�а���ȣ = �а�."�а���ȣ";


