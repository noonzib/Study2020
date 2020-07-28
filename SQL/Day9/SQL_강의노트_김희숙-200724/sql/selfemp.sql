/* ��ü���� */

drop table selfemp;

create table selfemp (
  empno   char(4) PRIMARY KEY ,
  empname varchar(12) ,
  manager char(4) ,
  dno     char(1) ,
  FOREIGN KEY (manager) REFERENCES selfemp(empno)
);

insert into selfemp values('3011','�̼���',NULL,'1');
insert into selfemp values('3426','�ڿ���','3011','3');
insert into selfemp values('1003','������','3011','1');
insert into selfemp values('2106','��â��','3426','2');
insert into selfemp values('3427','����ö','2106','3');

COL empno FOR a5
COL manager FOR a7
COL dno   FOR a3

--�����, �������̸� �� �˻��϶�

select  E.empname �����, M.empname �������̸�
from    selfemp E, selfemp M
where   E.manager = M.empno;


REM-----------------------------------------------------------
select * from ����;

--������, �а���, �а����̸� �� �˻��϶�
select  p1.�̸�, p1.�а���, p2.�̸�
from    ���� p1, ���� p2
where   p1.�а��� =  p2.������ȣ;

select  p1.�̸� ������, p1.�а���, p2.�̸� �а����̸�
from    ���� p1, ���� p2
where   p1.�а��� =  p2.������ȣ;
REM-----------------------------------------------------------
