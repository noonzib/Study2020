/* ������ */

/* �ܺ����� �ǽ��� (ehan_ch2_outerjoin.sql) */

drop table freshman;
drop table member;

CREATE TABLE freshman ( 
 name    VARCHAR(12) NOT NULL ,
 address VARCHAR(9)
);

CREATE TABLE member ( 
 name      VARCHAR(12) NOT NULL ,
 dept_name VARCHAR(30)
);

INSERT INTO freshman VALUES('�豤��', '����');
INSERT INTO freshman VALUES('������', '����');
INSERT INTO freshman VALUES('������', '����');

INSERT INTO member VALUES('�豤��', '��ǻ�Ͱ��а�');
INSERT INTO member VALUES('������', '������а�');
INSERT INTO member VALUES('������', '���ڰ��а�');

SELECT * FROM freshman;
SELECT * FROM member;
