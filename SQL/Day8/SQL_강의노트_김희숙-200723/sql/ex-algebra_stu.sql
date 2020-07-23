/* [예제] 관계대수 (algebra.sql) */

drop table R;
drop table S;
drop table V;

drop table R1;
drop table S1;

/* 예제1 릴레이션 R, S */

/* 사원 테이블  R 생성 */
CREATE TABLE R ( 
 name CHAR(9) NOT NULL ,
 dept CHAR(2),
 gender CHAR(1)
);

/* 사원 테이블  S 생성 */
CREATE TABLE S ( 
 name CHAR(9) NOT NULL ,
 dept CHAR(2),
 gender CHAR(1)
);

INSERT INTO R (name, dept, gender) VALUES ( '홍길동', 'AA', 'M');
INSERT INTO R (name, dept, gender) VALUES ( '임꺽정', 'AA', 'M');

INSERT INTO S (name, dept, gender) VALUES ( '홍길동', 'AA', 'M');
INSERT INTO S (name, dept, gender) VALUES ( '박찬호', 'BB', 'M');
INSERT INTO S (name, dept, gender) VALUES ( '박세리', 'BB', 'F');

CREATE TABLE V ( 
 name     CHAR(9) NOT NULL,
 category VARCHAR(15), 
 c_name   VARCHAR(12),
 year     CHAR(4), 
 buy_date CHAR(7) 
);

INSERT INTO V VALUES ('임꺽정','트럭','포토','1995','1997-05');
INSERT INTO V VALUES ('차범근','승용차','에쿠스','2001','2001-08');
INSERT INTO V VALUES ('홍길동','승용차','소나타','1998','1998-08');
INSERT INTO V VALUES ('박세리','승용차','싼타페','1999','1999-12');

/* 예제3 product */

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
/* 관계대수 (alg02.sql) */

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

INSERT INTO group_ex VALUES('A', '서울');
INSERT INTO group_ex VALUES('B', '대구');
INSERT INTO group_ex VALUES('C', '광주');
INSERT INTO group_ex VALUES('D', '부산');
INSERT INTO group_ex VALUES('E', '대전');

col groupid format a10

SELECT * FROM member;
SELECT * FROM group_ex;



