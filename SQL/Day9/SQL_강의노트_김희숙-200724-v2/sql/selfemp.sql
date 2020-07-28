/* 자체조인 */

drop table selfemp;

create table selfemp (
  empno   char(4) PRIMARY KEY ,
  empname varchar(12) ,
  manager char(4) ,
  dno     char(1) ,
  FOREIGN KEY (manager) REFERENCES selfemp(empno)
);

insert into selfemp values('3011','이수민',NULL,'1');
insert into selfemp values('3426','박영권','3011','3');
insert into selfemp values('1003','조민희','3011','1');
insert into selfemp values('2106','김창섭','3426','2');
insert into selfemp values('3427','최종철','2106','3');

COL empno FOR a5
COL manager FOR a7
COL dno   FOR a3

--사원명, 관리자이름 을 검색하라

select  E.empname 사원명, M.empname 관리자이름
from    selfemp E, selfemp M
where   E.manager = M.empno;


REM-----------------------------------------------------------
select * from 교수;

--교수명, 학과명, 학과장이름 을 검색하라
select  p1.이름, p1.학과명, p2.이름
from    교수 p1, 교수 p2
where   p1.학과장 =  p2.교수번호;

select  p1.이름 교수명, p1.학과명, p2.이름 학과장이름
from    교수 p1, 교수 p2
where   p1.학과장 =  p2.교수번호;
REM-----------------------------------------------------------
