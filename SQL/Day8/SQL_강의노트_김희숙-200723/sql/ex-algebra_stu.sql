/* [����] ������ (algebra.sql) */

drop table R;
drop table S;
drop table V;

drop table R1;
drop table S1;

/* ����1 �����̼� R, S */

/* ��� ���̺�  R ���� */
CREATE TABLE R ( 
 name CHAR(9) NOT NULL ,
 dept CHAR(2),
 gender CHAR(1)
);

/* ��� ���̺�  S ���� */
CREATE TABLE S ( 
 name CHAR(9) NOT NULL ,
 dept CHAR(2),
 gender CHAR(1)
);

INSERT INTO R (name, dept, gender) VALUES ( 'ȫ�浿', 'AA', 'M');
INSERT INTO R (name, dept, gender) VALUES ( '�Ӳ���', 'AA', 'M');

INSERT INTO S (name, dept, gender) VALUES ( 'ȫ�浿', 'AA', 'M');
INSERT INTO S (name, dept, gender) VALUES ( '����ȣ', 'BB', 'M');
INSERT INTO S (name, dept, gender) VALUES ( '�ڼ���', 'BB', 'F');

CREATE TABLE V ( 
 name     CHAR(9) NOT NULL,
 category VARCHAR(15), 
 c_name   VARCHAR(12),
 year     CHAR(4), 
 buy_date CHAR(7) 
);

INSERT INTO V VALUES ('�Ӳ���','Ʈ��','����','1995','1997-05');
INSERT INTO V VALUES ('������','�¿���','����','2001','2001-08');
INSERT INTO V VALUES ('ȫ�浿','�¿���','�ҳ�Ÿ','1998','1998-08');
INSERT INTO V VALUES ('�ڼ���','�¿���','��Ÿ��','1999','1999-12');

/* ����3 product */

CREATE TABLE R1 (
	A char(2),
	B char(2)
);

CREATE TABLE S1 (
	A char(2),
	C char(2),
        D char(2)
);

INSERT INTO R1 VALUES ('1','4');
INSERT INTO R1 VALUES ('2','5');

INSERT INTO S1 VALUES ('1','3','4');
INSERT INTO S1 VALUES ('2','2','6');
INSERT INTO S1 VALUES ('3','1','9');
/*---------------------------------------------*/
/* ������ (alg02.sql) */

drop table member;
drop table group_ex;

CREATE TABLE member ( 
 id      CHAR(3) NOT NULL ,
 groupid CHAR(1)
);

CREATE TABLE group_ex ( 
 groupid   CHAR(1) NOT NULL ,
 position  VARCHAR(12)
);

INSERT INTO member VALUES('100', 'A');
INSERT INTO member VALUES('101', 'B');
INSERT INTO member VALUES('102', 'A');
INSERT INTO member VALUES('102', 'F');

INSERT INTO group_ex VALUES('A', '����');
INSERT INTO group_ex VALUES('B', '�뱸');
INSERT INTO group_ex VALUES('C', '����');
INSERT INTO group_ex VALUES('D', '�λ�');
INSERT INTO group_ex VALUES('E', '����');

col groupid format a10

SELECT * FROM member;
SELECT * FROM group_ex;



