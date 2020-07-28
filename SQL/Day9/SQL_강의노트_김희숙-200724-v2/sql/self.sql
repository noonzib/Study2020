/* self.sql */
/* ��ü���� */

drop table emp;

drop table ���;
drop table ����;
drop table dept;

drop table ����;

/*-------[����]   ��Ű��-------------------------------*/

create table emp (
  empno   char(4) PRIMARY KEY ,
  empname varchar(12) ,
  manager char(4) ,
  dno     char(1) ,
  FOREIGN KEY (manager) REFERENCES emp(empno)
);

insert into emp values('3011','�̼���',NULL,'1');
insert into emp values('3426','�ڿ���','3011','3');
insert into emp values('1003','������','3011','1');
insert into emp values('2106','��â��','3426','2');
insert into emp values('3427','����ö','2106','3');

/*-------[Quiz 1]   ��Ű��-------------------------------*/
CREATE TABLE ��� (
  ���        INT           PRIMARY KEY ,
  �̸�        varCHAR(10) ,
  �ֹι�ȣ    CHAR(14) ,
  �ڵ�����ȣ  CHAR(14) ,
  ���ӻ��    INT      ,     
  FOREIGN KEY (���) REFERENCES ���( ��� ) 
);

INSERT INTO ��� ( ���, �̸�, �ֹι�ȣ, �ڵ�����ȣ, ���ӻ�� )
VALUES ( 1, '����ȣ', '720201-1034343', '(017) 234-2342', NULL );
INSERT INTO ��� ( ���, �̸�, �ֹι�ȣ, �ڵ�����ȣ, ���ӻ�� )
VALUES ( 2, '������', '680709-1078656', '(018) 234-2342',1 ); 
INSERT INTO ��� ( ���, �̸�, �ֹι�ȣ, �ڵ�����ȣ, ���ӻ�� )
VALUES ( 3, '�Ӳ���', '700101-1027362', '(016)2342-2342',2); 
INSERT INTO ��� ( ���, �̸�, �ֹι�ȣ, �ڵ�����ȣ, ���ӻ�� )
VALUES ( 4, '������', '600809-1987766', '(019) 234-2342', 3);
INSERT INTO ��� ( ���, �̸�, �ֹι�ȣ, �ڵ�����ȣ, ���ӻ�� )
VALUES ( 5, 'ȫ�浿', '651214-1078767', '(011) 234-2342', 4);

/*-------[Quiz 2]   ��Ű��-------------------------------*/

CREATE TABLE ����( ������ VARCHAR(20) , ���ڸ� VARCHAR(12) );
INSERT  INTO ���� ( ������, ���ڸ� ) VALUES ( 'ȫ�浿��','ȫ�浿');
INSERT  INTO ���� ( ������, ���ڸ� ) VALUES ( '�Ӳ�����','�Ӳ���');
INSERT  INTO ���� ( ������, ���ڸ� ) VALUES ( '�߱���','������');
INSERT  INTO ���� ( ������, ���ڸ� ) VALUES ( 'ȫ�浿��','����ȣ');

/*-------[Quiz 3]   ��Ű��-------------------------------*/

/* dept(deptno,dname,college,loc) */

CREATE TABLE dept (
  deptno char(3)     NOT NULL CONSTRAINT dept_no_pk PRIMARY KEY,
  dname  varchar(30) NOT NULL,
  college char(3),
  loc varchar(7)
);

insert into dept values ('101', '��ǻ�Ͱ��а�', '100', '1ȣ��');
insert into dept values ('102', '��Ƽ�̵���а�', '100', '2ȣ��');
insert into dept values ('201', '���ڰ��а�', '200', '3ȣ��');
insert into dept values ('202', '�����а�', '200', '4ȣ��');
insert into dept values ('100', '�����̵���к�', '10', NULL);
insert into dept values ('200', '��īƮ�δн��к�', '10', NULL);
insert into dept values ('10', '��������', NULL, NULL);

/*---------------��Ű��--------------------------------*/
/* ��ü����(self join) : ehan 2�� p39 [�׸�2-10] ���� */
/* self_prof.sql */

drop table ����;

CREATE TABLE ���� ( 
	������ȣ            char(5)       NOT NULL ,
	�ֹε�Ϲ�ȣ        char(14)      NOT NULL ,
	�̸�                varchar2(20)  NOT NULL ,
	�а���              varchar2(20)  NOT NULL ,
	�а���              char(5)   ,
        CONSTRAINT pk_����_������ȣ PRIMARY KEY(������ȣ)
);

insert into ���� values('92001','590327-1839240','���±�','��ǻ�Ͱ��а�','92001');
insert into ���� values('92002','690702-1350026','����','��ǻ�Ͱ��а�','92001');
insert into ���� values('92301','741011-2765501','�ּ���','������а�','92302');
insert into ���� values('92302','750728-1102458','���¼�','������а�','92302');
insert into ���� values('92501','620505-1400546','��ö��','���ڰ��а�',NULL);
insert into ���� values('92502','740101-1830264','��μ�','���ڰ��а�',NULL);

select * from ����;

/*---------------��Ű��--------------------------------*/

select * from ���;
select * from ����;

select * from emp;
select * from dept;

select * from ����;
