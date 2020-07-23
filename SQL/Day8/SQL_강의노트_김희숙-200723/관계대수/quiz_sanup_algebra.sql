--[Quiz] (quiz_sanup_algebra_stu.sql)(quiz_������_����ó��������_stu.hwp)
--11���� �ǽ�(���: �����)('17/11/23)

--������
/*----------------------------------------------------*/
/* ��Ű��
CREATE TABLE ���� (
  �̸� varchar(20) ,
  ���� int ,
  ���� int ,
  ���� int ,
  ���� int ,
  PRIMARY KEY(�̸�)
);

CREATE TABLE ������ (
  �̸� varchar(20) ,
  �ּ� varchar(50) ,
  ���� int ,
  PRIMARY KEY(�̸�) ,
  FOREIGN KEY(�̸�) REFERENCES ����(�̸�)
);

insert into ���� values('��浿',70,90,78,88);
insert into ���� values('�̼���',90,80,88,98);
insert into ���� values('�Ѹ�',80,68,98,78);
insert into ���� values('�ƹ���',79,79,70,57);
insert into ���� values('�Ӳ���',67,98,80,84);

insert into ������ values('��浿','������',25);
insert into ������ values('�̼���','ȭ�絿',20);
insert into ������ values('�Ѹ�','�ھ絿',24);
insert into ������ values('�ƹ���','ȭ�絿',19);
insert into ������ values('�Ӳ���','���ǵ�',18);

COMMIT:
*/
/*----------------------------------------------------*/

--���� ���� ������

--1) SELECTION

--����(�̸�, ����, ����, ����, ����)
--������(�̸�, �ּ�, ����)

--����1) <����> �����̼ǿ��� ���� ������ 80�� �̻��� Ʃ�õ��� �����Ѵ�.

--����2) <����> �����̼ǿ��� ���� ���� �Ǵ� ���� ������ 80�� �̻��� Ʃ�õ��� �����Ѵ�.

--2) PROJECT

--����) <����> �����̼ǿ��� �̸��� ���� �Ӽ��� �����Ѵ�,

--3) JOIN

--����) <����> �����̼ǰ� <������> �����̼����κ��� �̸� �Ӽ��� ���� Ʃ�õ��� �����Ͽ� ���ο� �����̼��� �����Ѵ�.

/*----------------------------------------------------*/

--�Ϲ� ���� ������

--���(���, �̸�)
--����(���, �̸�)

/* ��Ű��
CREATE TABLE ��� (
  ��� int ,
  �̸� varchar(20) ,
  PRIMARY KEY(���)
);

CREATE TABLE ���� (
  ��� int ,
  �̸� varchar(20) ,
  PRIMARY KEY(���)
);

insert into ��� values(1, '��浿');
insert into ��� values(2, '�̼���');

insert into ���� values(2, '�̼���');
insert into ���� values(3, '�Ѹ�');

COMMIT;
*/

--���(���, �̸�)
--����(���, �̸�)

--����1) <���> �����̼ǰ� <����> �����̼ǿ��� �̸��� ������ ���� �������� ���Ѵ�.

--����2) <���> �����̼ǰ� <����> �����̼ǿ��� �̸��� ������ ���� �������� ���Ѵ�.

--����3) <���> �����̼ǰ� <����> �����̼ǿ��� �̸��� ������ ���� �������� ���Ѵ�.

--����4) <���> �����̼ǰ� <����> �����̼ǿ��� �̸��� ������ ���� īƼ�� ���δ�Ʈ�� ���Ѵ�.

/*----------------------------------------------------*/
--���⹮�� ����1)

--�л�(�й�, �̸�, �г�, �а�)

/* ��Ű��
CREATE TABLE �л� (
  �й� char(4) ,
  �̸� varchar(20) ,
  �г� int ,
  �а� varchar(20) ,
  PRIMARY KEY(�й�)
);

insert into �л� values('1001','������',4,'��ǻ��');
insert into �л� values('1002','������',3,'����');
insert into �л� values('1003','����',1,'��ǻ��');
insert into �л� values('1004','�ں�ȭ',4,'����');
insert into �л� values('1005','��̳�',1,'��ǻ��');

COMMIT;
*/

--��1)

--��2)

--��3)
/*----------------------------------------------------*/

--���⹮�� ����2)

--employee(empno, empname, dno)
--department(deptno, deptname)

/* ��Ű��
CREATE TABLE department (
  deptno int ,
  deptname varchar(20) ,
  PRIMARY KEY(deptno)
);

CREATE TABLE employee (
  empno char(4) ,
  empname varchar(20) ,
  dno int
  PRIMARY KEY(empno) ,
  FOREIGN KEY(dno) REFERENCES department(deptno)
);

insert into department values(1,'����');
insert into department values(2,'��ȹ');
insert into department values(3,'����');
insert into department values(4,'�ѹ�');

insert into employee values('1234','���ȣ',2);
insert into employee values('1235','�ڿ���',1);
insert into employee values('1236','�̼���',3);
insert into employee values('1237','���μ�',2);
insert into employee values('1238','������',3);

COMMIT;
*/

--��1) ��������

--��2) �ڿ�����

--��3) ���� �ܺ�����

/*----------------------------------------------------*/


