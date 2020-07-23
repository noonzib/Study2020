--[Quiz] (quiz_sanup_algebra_stu.sql)(quiz_관계대수_정보처리산업기사_stu.hwp)
--11주차 실습(담당: 김희숙)('17/11/23)

--관계대수
/*----------------------------------------------------*/
/* 스키마
CREATE TABLE 성적 (
  이름 varchar(20) ,
  국어 int ,
  영어 int ,
  수학 int ,
  과학 int ,
  PRIMARY KEY(이름)
);

CREATE TABLE 학적부 (
  이름 varchar(20) ,
  주소 varchar(50) ,
  나이 int ,
  PRIMARY KEY(이름) ,
  FOREIGN KEY(이름) REFERENCES 성적(이름)
);

insert into 성적 values('고길동',70,90,78,88);
insert into 성적 values('이순신',90,80,88,98);
insert into 성적 values('둘리',80,68,98,78);
insert into 성적 values('아무개',79,79,70,57);
insert into 성적 values('임꺽정',67,98,80,84);

insert into 학적부 values('고길동','모진동',25);
insert into 학적부 values('이순신','화양동',20);
insert into 학적부 values('둘리','자양동',24);
insert into 학적부 values('아무개','화양동',19);
insert into 학적부 values('임꺽정','구의동',18);

COMMIT:
*/
/*----------------------------------------------------*/

--순수 관계 연산자

--1) SELECTION

--성적(이름, 국어, 영어, 수학, 과학)
--학적부(이름, 주소, 나이)

--예제1) <성적> 릴레이션에서 국어 점수가 80점 이상인 튜플들을 추출한다.

--예제2) <성적> 릴레이션에서 국어 점수 또는 영어 점수가 80점 이상인 튜플들을 추출한다.

--2) PROJECT

--예제) <성적> 릴레이션에서 이름과 국어 속성을 추출한다,

--3) JOIN

--예제) <성적> 릴레이션과 <학적부> 릴레이션으로부터 이름 속성이 같은 튜플들을 결합하여 새로운 릴레이션을 생성한다.

/*----------------------------------------------------*/

--일반 집합 연산자

--사원(사번, 이름)
--직원(사번, 이름)

/* 스키마
CREATE TABLE 사원 (
  사번 int ,
  이름 varchar(20) ,
  PRIMARY KEY(사원)
);

CREATE TABLE 직원 (
  사번 int ,
  이름 varchar(20) ,
  PRIMARY KEY(사원)
);

insert into 사원 values(1, '고길동');
insert into 사원 values(2, '이순신');

insert into 직원 values(2, '이순신');
insert into 직원 values(3, '둘리');

COMMIT;
*/

--사원(사번, 이름)
--직원(사번, 이름)

--예제1) <사원> 릴레이션과 <직원> 릴레이션에서 이름을 추출한 것의 합집합을 구한다.

--예제2) <사원> 릴레이션과 <직원> 릴레이션에서 이름을 추출한 것의 차집합을 구한다.

--예제3) <사원> 릴레이션과 <직원> 릴레이션에서 이름을 추출한 것의 차집합을 구한다.

--예제4) <사원> 릴레이션과 <직원> 릴레이션에서 이름을 추출한 것의 카티션 프로덕트를 구한다.

/*----------------------------------------------------*/
--기출문제 문제1)

--학생(학번, 이름, 학년, 학과)

/* 스키마
CREATE TABLE 학생 (
  학번 char(4) ,
  이름 varchar(20) ,
  학년 int ,
  학과 varchar(20) ,
  PRIMARY KEY(학번)
);

insert into 학생 values('1001','나기태',4,'컴퓨터');
insert into 학생 values('1002','송찬영',3,'전기');
insert into 학생 values('1003','정연',1,'컴퓨터');
insert into 학생 values('1004','박병화',4,'건축');
insert into 학생 values('1005','김미나',1,'컴퓨터');

COMMIT;
*/

--예1)

--예2)

--예3)
/*----------------------------------------------------*/

--기출문제 문제2)

--employee(empno, empname, dno)
--department(deptno, deptname)

/* 스키마
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

insert into department values(1,'영업');
insert into department values(2,'기획');
insert into department values(3,'개발');
insert into department values(4,'총무');

insert into employee values('1234','김원호',2);
insert into employee values('1235','박영주',1);
insert into employee values('1236','이수미',3);
insert into employee values('1237','조민수',2);
insert into employee values('1238','최종인',3);

COMMIT;
*/

--예1) 동등조인

--예2) 자연조인

--예3) 왼쪽 외부조인

/*----------------------------------------------------*/


