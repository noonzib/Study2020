rem sungjuk_group.sql
rem �����Լ�, Group by

drop table ����;
drop table ����2;

rem �����Լ�
CREATE TABLE ����(�̸� varchar(9) NOT NULL primary key, ���� int );

INSERT INTO ���� ( �̸�, ���� ) VALUES ( 'ȫ�浿', 87 );
INSERT INTO ���� ( �̸�, ���� ) VALUES ( '�Ӳ���', 60 );
INSERT INTO ���� ( �̸�, ���� ) VALUES ( '����ȣ', 75 );
INSERT INTO ���� ( �̸�, ���� ) VALUES ( '������', 70 );
INSERT INTO ���� ( �̸�, ���� ) VALUES ( 'ȫ��', 90 );
INSERT INTO ���� ( �̸�, ���� ) VALUES ( '������', 75 );
INSERT INTO ���� ( �̸�, ���� ) VALUES ( '������', 68 );
INSERT INTO ���� ( �̸�, ���� ) VALUES ( '�ŵ���', null);

rem �׷�ȭ
rem GROUP BY, HAVING

CREATE TABLE ����2 (
  �̸� varchar(9) NOT NULL primary key , 
  ���� varchar(8), 
  ���� int
);

INSERT INTO ����2 VALUES ('ȫ�浿', '����',87 );
INSERT INTO ����2 VALUES ('�Ӳ���', '����',60 );
INSERT INTO ����2 VALUES ('����ȣ', '����',75 );
INSERT INTO ����2 VALUES ('������', '����',70 );
INSERT INTO ����2 VALUES ('ȫ��', '����',90 );
INSERT INTO ����2 VALUES ('������', '����',75 );
INSERT INTO ����2 VALUES ('������', '����',68 );
INSERT INTO ����2 VALUES ('�ŵ���', '����',null);

SELECT * FROM ����;
SELECT * FROM ����2;

 