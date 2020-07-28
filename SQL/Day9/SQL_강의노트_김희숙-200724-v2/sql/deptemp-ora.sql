/*----------------------------------------------------------------------*/
--(Oracle) (booksr_deptemp-ora.sql)

--department(deptno, deptname, floor)
--employee(empno, empname, title, manager, salary, dno)

drop table employee;
drop table department;

CREATE TABLE department (
	deptno		int	NOT NULL,
	deptname	varchar(10),
	floor		int,
	PRIMARY KEY(deptno)
);

INSERT INTO department VALUES(1, '영업', 8);
INSERT INTO department VALUES(2, '기획', 10);
INSERT INTO department VALUES(3, '개발', 9);
INSERT INTO department VALUES(4, '총무', 7);

CREATE TABLE employee (
	empno		int		NOT NULL,
	empname	        varchar(10)		UNIQUE,
	title		varchar(10)		DEFAULT '사원',
	manager	int,
	salary		int		CHECK (salary < 6000000),
	dno		int		CHECK (dno IN (1,2,3,4)) ,
	PRIMARY KEY(empno),
	FOREIGN KEY(dno) REFERENCES department(deptno)
);

INSERT INTO employee VALUES(2106, '김창섭','대리',1003, 2500000, 2);
INSERT INTO employee VALUES(3426, '박영권','과장',4377, 3000000, 1);
INSERT INTO employee VALUES(3011, '이수민','부장',4377, 4000000, 3);
INSERT INTO employee VALUES(1003, '조민희','과장',4377, 3000000, 2);
INSERT INTO employee VALUES(3427, '최종철','사원',3011, 1500000, 3);
INSERT INTO employee VALUES(1365, '김상원','사원',3426, 1500000, 1);
INSERT INTO employee(empno, empname, title, salary, dno) VALUES(4377, '이성래','이사', 5000000, 2);

select * from department;
select * from employee;

--department(deptno, deptname, floor)
--employee(empno, empname, title, manager, salary, dno)

--형식 명령어
set pagesize 50

COL deptno for 999999
COL deptname for a8
COL floor  for 99999

COL empno  for 99999
COL empname for a8
COL title   for a6
COL manager for 9999999
COL salary  for 9999999
COL dno     for 999

select * from department;
select * from employee;
