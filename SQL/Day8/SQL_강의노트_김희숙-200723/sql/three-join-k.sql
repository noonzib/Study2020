create table �л� (
  �й�  char(5),
  �л���  varchar(12),
  primary key(�й�)
);

create table ���� (
  �����ȣ  char(5),
  �����  varchar(30),
  primary key(�����ȣ)
);
 
create table ���� (
  �й� char(5),
  �����ȣ  char(5),
  ���� int,
  primary key(�й�, �����ȣ),
  foreign key (�й�) references �л�(�й�),
  foreign key (�����ȣ) references ����(�����ȣ)
);

insert into �л� values('11002','��ȫ��');
insert into �л� values('24036','�����');
insert into �л� values('30419','�ڻ��');
insert into �л� values('30555','ȫ����');
insert into �л� values('31890','������');
insert into �л� values('31892','������');
insert into �л� values('32000','������');

insert into ���� values('CS310','�����ͺ��̽�');
insert into ���� values('CS313','�ü��');
insert into ���� values('CS345','�ڷᱸ��');
insert into ���� values('CS326','�ڹ�');
insert into ���� values('CS546','DB���α׷���');
insert into ���� values('CS378','��Ƽ�̵��');
insert into ���� values('CS388','�����α׷���');

insert into ���� values('11002','CS310',98);
insert into ���� values('11002','CS313',88);
insert into ���� values('24036','CS345',90);
insert into ���� values('30419','CS326',78);
insert into ���� values('31892','CS388',86);
insert into ���� values('32000','CS378',94);
insert into ���� values('31890','CS310',92);
 
select * from �л�;
select * from ����;
select * from ����;