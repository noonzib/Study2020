/* self.sql */
/* 자체조인 */

drop table emp;

drop table 사원;
drop table 저자;
drop table dept;

drop table 교수;

/*-------[예제]   스키마-------------------------------*/

create table emp (
  empno   char(4) PRIMARY KEY ,
  empname varchar(12) ,
  manager char(4) ,
  dno     char(1) ,
  FOREIGN KEY (manager) REFERENCES emp(empno)
);

insert into emp values('3011','이수민',NULL,'1');
insert into emp values('3426','박영권','3011','3');
insert into emp values('1003','조민희','3011','1');
insert into emp values('2106','김창섭','3426','2');
insert into emp values('3427','최종철','2106','3');

/*-------[Quiz 1]   스키마-------------------------------*/
CREATE TABLE 사원 (
  사번        INT           PRIMARY KEY ,
  이름        varCHAR(10) ,
  주민번호    CHAR(14) ,
  핸드폰번호  CHAR(14) ,
  직속상사    INT      ,     
  FOREIGN KEY (사번) REFERENCES 사원( 사번 ) 
);

INSERT INTO 사원 ( 사번, 이름, 주민번호, 핸드폰번호, 직속상사 )
VALUES ( 1, '박찬호', '720201-1034343', '(017) 234-2342', NULL );
INSERT INTO 사원 ( 사번, 이름, 주민번호, 핸드폰번호, 직속상사 )
VALUES ( 2, '선동열', '680709-1078656', '(018) 234-2342',1 ); 
INSERT INTO 사원 ( 사번, 이름, 주민번호, 핸드폰번호, 직속상사 )
VALUES ( 3, '임꺽정', '700101-1027362', '(016)2342-2342',2); 
INSERT INTO 사원 ( 사번, 이름, 주민번호, 핸드폰번호, 직속상사 )
VALUES ( 4, '차범근', '600809-1987766', '(019) 234-2342', 3);
INSERT INTO 사원 ( 사번, 이름, 주민번호, 핸드폰번호, 직속상사 )
VALUES ( 5, '홍길동', '651214-1078767', '(011) 234-2342', 4);

/*-------[Quiz 2]   스키마-------------------------------*/

CREATE TABLE 저자( 서적명 VARCHAR(20) , 저자명 VARCHAR(12) );
INSERT  INTO 저자 ( 서적명, 저자명 ) VALUES ( '홍길동전','홍길동');
INSERT  INTO 저자 ( 서적명, 저자명 ) VALUES ( '임꺽정전','임꺽정');
INSERT  INTO 저자 ( 서적명, 저자명 ) VALUES ( '야구왕','선동열');
INSERT  INTO 저자 ( 서적명, 저자명 ) VALUES ( '홍길동전','박찬호');

/*-------[Quiz 3]   스키마-------------------------------*/

/* dept(deptno,dname,college,loc) */

CREATE TABLE dept (
  deptno char(3)     NOT NULL CONSTRAINT dept_no_pk PRIMARY KEY,
  dname  varchar(30) NOT NULL,
  college char(3),
  loc varchar(7)
);

insert into dept values ('101', '컴퓨터공학과', '100', '1호관');
insert into dept values ('102', '멀티미디어학과', '100', '2호관');
insert into dept values ('201', '전자공학과', '200', '3호관');
insert into dept values ('202', '기계공학과', '200', '4호관');
insert into dept values ('100', '정보미디어학부', '10', NULL);
insert into dept values ('200', '메카트로닉스학부', '10', NULL);
insert into dept values ('10', '공과대학', NULL, NULL);

/*---------------스키마--------------------------------*/
/* 자체조인(self join) : ehan 2장 p39 [그림2-10] 교수 */
/* self_prof.sql */

drop table 교수;

CREATE TABLE 교수 ( 
	교수번호            char(5)       NOT NULL ,
	주민등록번호        char(14)      NOT NULL ,
	이름                varchar2(20)  NOT NULL ,
	학과명              varchar2(20)  NOT NULL ,
	학과장              char(5)   ,
        CONSTRAINT pk_교수_교수번호 PRIMARY KEY(교수번호)
);

insert into 교수 values('92001','590327-1839240','이태규','컴퓨터공학과','92001');
insert into 교수 values('92002','690702-1350026','고희석','컴퓨터공학과','92001');
insert into 교수 values('92301','741011-2765501','최성희','산업공학과','92302');
insert into 교수 values('92302','750728-1102458','김태석','산업공학과','92302');
insert into 교수 values('92501','620505-1400546','박철재','전자공학과',NULL);
insert into 교수 values('92502','740101-1830264','장민석','전자공학과',NULL);

select * from 교수;

/*---------------스키마--------------------------------*/

select * from 사원;
select * from 저자;

select * from emp;
select * from dept;

select * from 교수;
