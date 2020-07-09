# 데이터베이스: database

## data -> information => 의사결정

## 데이터베이스 정의:

    1. 공유(shared)
    2. 통합(integrated)
    3. 저장(stored)
    4. 운영(operational data)

## 데이터베이스 특성:

1. 실시간 접근
2. 계속 변화
3. 동시 공유 가능
4. 내용으로 참조 가능
- 주소 기반 참조 X

------------------------------------------

- Oracle
- MS SQL
- MySQL, MariaDB

## SQL 
- Create (INSERT)
- Read   (SELECT)
- Update (UPDATE)
- Delete (DELETE)
- 데이터정의어(CREATE, DROP, ALTER)
- 데이터조작어(INSERTM, SELECT, UPDATE, DELETE) DBA가 안함
- 데이터제어어(GRANT, REVOKE)

~~~ sql
(Oracle)
-- 테이블 삭제
DROP TABLE 학과;

-- 학과(학과번호, 학과명)
CREATE TABLE 학과(
    학과번호 int NOT NULL,
    학과명 varchar(50),
    PRIMARY KEY(학과번호)
);

-- 데이터 입력
INSERT INTO 학과 VALUES(1,'컴퓨터소프트웨어공학과');
INSERT INTO 학과 VALUES(2,'컴퓨터정보과');
INSERT INTO 학과 VALUES(3,'정보통신과');

SELECT * FROM 학과;
~~~

- 차수 : 컬럼의 갯수
- 카디날리티 : 튜플의 갯수, 행의 갯수

## 스키마(Schema)

- 신입생 (학번 PK, 주민등록번호, 이름, 주소, 학과명)


## Quiz 3
1.
~~~ sql
drop table 부서;
-- 부서 테이블 생성
CREATE TABLE 부서(
    부서코드 char(2) NOT NULL,
    부서명 char(9),
    위치 char(6),
    PRIMARY KEY (부서코드)
);
~~~

2.
~~~ sql
drop table 사원;
drop table 부서;

CREATE table 부서 (
    부서코드 char(2) NOT NULL,
    부서명 varchar(10),
    PRIMARY KEY(부서코드)
);

CREATE TABLE 사원(
    사원번호 char(4) NOT NULL,
    이름 varchar(12),
    부서코드 char(2),
    PRIMARY KEY(사원번호),
    FOREIGN KEY (부서코드) REFERENCES 부서(부서코드) ON DELETE CASCADE
);

SELECT * FROM 부서;
SELECT * FROM 사원;

INSERT INTO 부서 VALUES ('AA', '총무부');
INSERT INTO 부서 VALUES ('BB', '영업부');
INSERT INTO 부서 VALUES ('CC', '기획부');

INSERT INTO 사원 VALUES ('1111','홍길동','AA');
INSERT INTO 사원 VALUES ('2222','임꺽정','AA');
INSERT INTO 사원 VALUES ('3333','박찬호','BB');
INSERT INTO 사원 VALUES ('4444','선동열','BB');
INSERT INTO 사원 VALUES ('5555','차두리','AA');
~~~

## SQL 스크립트 파일 만들기

1. 파일 탐색기를 실행한다
2. C 드라이브에 폴더 DBDATA를 만든다
3. 작성한 파일을 DBDATA 폴더에 복사한다
4. 오라클에서 스크립트 파일을 실행한다

~~~ sql
sqlplus /nplog
conn / as sysdba

create user study identified by study123 default tablespace users;
grant connect, resource to study;

conn study/study123;

@ C:\DBDATA/empdept-ora.sql;
~~~

D:\oracle\oradata\orcl\users.dbf

## SQL울 스크립트 파일로 실행하기

1. C드라이브에 DBDATA 폴더를 만든다
복사
scott.sql
scott_sys.sql

~~~ cmd
sqlplus /nolog
conn / as sysdba

@ C:\DBDATA\scott_sys.sql
~~~

## 요약
1. 기본키: 중복불가, 필수입력
2. 외래키: 다른 테이블의 기본키를 참조하는 키

## 요약
1. 개체무결성제약조건: 기본키는 널값을 가질 수 없다.
2. 참조무결성제약조건: 


## Quiz4
~~~ sql
drop table 학과;
drop table 학생;

CREATE TABLE 학과(
    학과코드 char(4) NOT NULL,
    학과명 varchar(30),
    CONSTRAINT pk_학과_학과코드 PRIMARY KEY(학과코드)
);

CREATE TABLE 학생(
    학번 char(3) NOT NULL,
    이름 varchar(10),
    학과코드 char(4),
    CONSTRAINT pk_학생_학번 PRIMARY KEY(학번),
    CONSTRAINT fk_학생_학과코드 FOREIGN KEY(학과코드)
                            REFERENCES 학과(학과코드)
);

INSERT INTO 학과 values('1001','컴퓨터학과');
INSERT INTO 학과 values('2001','체육학과');

INSERT INTO 학생 VALUES('501','박지성','1001');
INSERT INTO 학생 VALUES('401','김연아','2001');
INSERT INTO 학생 VALUES('402','장미란','2001');
INSERT INTO 학생 VALUES('502','추신수','1001');

SELECT * FROM 학과;
SELECt * from 학생;

drop table 학과2;
drop table 학생2;

CREATE TABLE 학과2(
    학과코드 char(4) NOT NULL,
    학과명 varchar(30),
    CONSTRAINT pk_학과_학과코드 PRIMARY KEY(학과코드)
);

CREATE TABLE 학생2(
    학번 char(3) NOT NULL,
    이름 varchar(10),
    학과코드 char(4),
    CONSTRAINT pk_학생_학번 PRIMARY KEY(학번),
    CONSTRAINT fk_학생_학과코드 FOREIGN KEY(학과코드)
                            REFERENCES 학과2(학과코드)
                            ON DELETE CASCADE
);

~~~