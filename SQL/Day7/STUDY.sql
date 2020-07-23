rem salary_null.sql

/* NULL 값 처리 */

drop table 급여;

drop table 사원;
drop table 부서;

/* 부서(부서코드, 부서명) */
CREATE TABLE 부서 (
  부서코드 char(2) NOT NULL ,
  부서명   char(9) ,
  PRIMARY KEY(부서코드)
);

/* 급여(사원번호, 사원명, 주민등록번호, 소속부서, 직급, 성별, 기본급, 수당) */
CREATE TABLE 급여 (
  사원번호 		char(4) NOT NULL ,
  사원명 		varchar(9) ,
  주민등록번호  	char(14) ,
  소속부서 		char(2) ,
  직급 			char(6) ,
  성별 			char(3) ,
  기본급 			int ,
  수당			int ,
  PRIMARY KEY(사원번호) ,
  FOREIGN KEY(소속부서) REFERENCES 부서(부서코드)
 );

insert into 부서 values('AA','총무부');
insert into 부서 values('BB','영업부');
insert into 부서 values('CC','기획부');

insert into 급여 values('1111','홍길동','801211-1111111','AA','과장','남',2000000,100000);
insert into 급여 values('2222','임꺽정','850505-2222222','AA','사원','여',1200000,300000);
insert into 급여 values('6666','송종국','730301-1444444','BB','부장','남',2500000,50000);
insert into 급여 values('5555','차두리','821004-1333333','AA','사원','남',1150000,300000);

/* 수당이 NULL 인 데이터 입력 */
insert into 급여 values('3333','이병진','830301-1555555','CC','사원','남',1200000,NULL);
insert into 급여 values('4444','우현정','891004-2666666','CC','사원','여',1150000,NULL);

col 부서코드 format a10
col 사원번호 format a10
col 소속부서 format a10
col 성별 format a4

select * from 부서;
select * from 급여;

select * from 급여 where 수당 is null;

SELECT 사원번호, 사원명, 직급, 기본급+수당
FROM 급여;

SELECT 사원번호, 사원명, 직급, 기본급, 수당, 기본급+NVL(수당,0) s1, NVL(기본급+수당, 기본급) S2
FROM 급여;

SELECT 사원번호, 사원명, 직급, 기본급, 수당, NVL2(수당, 기본급+수당, 기본급) total
FROM 급여;




