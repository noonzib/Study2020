rem salary_null.sql

/* NULL �� ó�� */

drop table �޿�;

drop table ���;
drop table �μ�;

/* �μ�(�μ��ڵ�, �μ���) */
CREATE TABLE �μ� (
  �μ��ڵ� char(2) NOT NULL ,
  �μ���   char(9) ,
  PRIMARY KEY(�μ��ڵ�)
);

/* �޿�(�����ȣ, �����, �ֹε�Ϲ�ȣ, �ҼӺμ�, ����, ����, �⺻��, ����) */
CREATE TABLE �޿� (
  �����ȣ 		char(4) NOT NULL ,
  ����� 		varchar(9) ,
  �ֹε�Ϲ�ȣ  	char(14) ,
  �ҼӺμ� 		char(2) ,
  ���� 			char(6) ,
  ���� 			char(3) ,
  �⺻�� 			int ,
  ����			int ,
  PRIMARY KEY(�����ȣ) ,
  FOREIGN KEY(�ҼӺμ�) REFERENCES �μ�(�μ��ڵ�)
 );

insert into �μ� values('AA','�ѹ���');
insert into �μ� values('BB','������');
insert into �μ� values('CC','��ȹ��');

insert into �޿� values('1111','ȫ�浿','801211-1111111','AA','����','��',2000000,100000);
insert into �޿� values('2222','�Ӳ���','850505-2222222','AA','���','��',1200000,300000);
insert into �޿� values('6666','������','730301-1444444','BB','����','��',2500000,50000);
insert into �޿� values('5555','���θ�','821004-1333333','AA','���','��',1150000,300000);

/* ������ NULL �� ������ �Է� */
insert into �޿� values('3333','�̺���','830301-1555555','CC','���','��',1200000,NULL);
insert into �޿� values('4444','������','891004-2666666','CC','���','��',1150000,NULL);

col �μ��ڵ� format a10
col �����ȣ format a10
col �ҼӺμ� format a10
col ���� format a4

select * from �μ�;
select * from �޿�;

select * from �޿� where ���� is null;

SELECT �����ȣ, �����, ����, �⺻��+����
FROM �޿�;

SELECT �����ȣ, �����, ����, �⺻��, ����, �⺻��+NVL(����,0) s1, NVL(�⺻��+����, �⺻��) S2
FROM �޿�;

SELECT �����ȣ, �����, ����, �⺻��, ����, NVL2(����, �⺻��+����, �⺻��) total
FROM �޿�;




