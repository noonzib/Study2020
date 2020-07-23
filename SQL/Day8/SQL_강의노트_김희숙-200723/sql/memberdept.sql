--(memberdept.sql)

DROP TABLE member   ;
DROP TABLE dept     ;

CREATE TABLE dept (
  dept_id   char(3)		    NOT NULL ,
  name      varchar(20) ,
  PRIMARY KEY(dept_id)
);

CREATE TABLE member (
  name      varchar(10)             NOT NULL ,
  dept      char(3)    ,
  PRIMARY KEY(name)    ,
  CONSTRAINT fk_member_dept FOREIGN KEY (dept) REFERENCES dept(dept_id)
);

INSERT INTO dept VALUES('100', '��ǻ�Ͱ��а�');
INSERT INTO dept VALUES('101', '������а�');

insert into member values('�豤��','100');
insert into member values('������','101');
insert into member values('������','101');

select * from dept;
select * from member;

COMMIT;