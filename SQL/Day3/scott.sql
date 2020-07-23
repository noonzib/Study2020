CREATE TABLE customer (
    cno char(4) NOT NULL,
    cname varchar2(12) NOT NULL,
    city varchar2(20),
    point int,
    CONSTRAINT pk_customer_cno PRIMARY KEY(cno)
);

INSERT INTO customer VALUES('c101','홍길동','서울',500);
INSERT INTO customer VALUES('c102','임꺽정','인천',300);
INSERT INTO customer VALUES('c103','박찬호','안양',800);
INSERT INTO customer VALUES('c204','신동엽','과천',350);
INSERT INTO customer VALUES('c205','정진우','고양',400);
INSERT INTO customer VALUES('c307','정동우','서울',null);

select * from customer;
select cno, cname, city from CUSTOMER;
select cname, city from CUSTOMER;
select cname as 성명, city as 거주지 from CUSTOMER;
select city from CUSTOMER;
select DISTINCT city from CUSTOMER; 

SELECT * from CUSTOMER WHERE cno='c101';
select * from CUSTOMER where point <= 400;
select cname, city, point from CUSTOMER where city="서울" and point >= 500;
select cname, city, point from CUSTOMER where city="서울" or point >= 500;
select cname, city, point from CUSTOMER where point BETWEEN 350 AND 500;

select cname, city, point from CUSTOMER where city IN ('서울', '안양');
select cname, city, point from CUSTOMER where city NOT IN ('서울', '안양');

select * from CUSTOMER where cname like '정%';
select * from CUSTOMER where cname like '%동%';
select * from CUSTOMER where cname like '%우';
select * from CUSTOMER where cname like '홍%' and cname like '박%' and cname like '정%';
select * from CUSTOMER where cname NOT like '홍%' and cname NOT like '박%' and cname NOT like '정%';
select cno, cname, point from CUSTOMER where point is NULL;
select cno, cname, point from CUSTOMER where point is NOt NULL;

select * from CUSTOMER order by cname asc;
select * from CUSTOMER where city='서울' order by cname asc;
select * from CUSTOMER order by city asc, point desc;
select * from CUSTOMER order by point desc, cname asc, city asc;
select * from CUSTOMER order by 3;
-- 3번째 컬럼으로 오름차순 정렬

drop table 학과;
drop table 학생;

CREATE TABLE 학과 (
    학과번호 int,
    학과명 VARCHAR(30),
    primary key(학과번호)
);

CREATE table 학생(
    학번 int,
    이름 varchar(20),
    학과번호 int,
    primary key(학번),
    FOREIGN key(학과번호) REFERENCES 학과(학과번호)
);

INSERT INTO 학과 VALUES(1,'컴퓨터공학과');
INSERT INTO 학과 VALUES(2,'정보통신과');
INSERT INTO 학과 VALUES(3,'심리학과');

insert into 학생 VALUES(1,'고현준',1);
insert into 학생 VALUES(2,'김미르',2);
insert into 학생 VALUES(3,'이현봉',1);
insert into 학생 VALUES(4,'이정재',3);
insert into 학생 VALUES(5,'권순호',2);

select * from 학과;
select * from 학생;

SELECT 이름, 학과명 FROM 학생, 학과 WHERE 학생.학과번호 = 학과."학과번호";


