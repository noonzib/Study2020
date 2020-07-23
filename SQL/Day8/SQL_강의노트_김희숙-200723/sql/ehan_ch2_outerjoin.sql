/* 관계대수 */

/* 외부조인 실습용 (ehan_ch2_outerjoin.sql) */

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

INSERT INTO freshman VALUES('김광식', '서울');
INSERT INTO freshman VALUES('김현정', '대전');
INSERT INTO freshman VALUES('조영수', '대전');

INSERT INTO member VALUES('김광식', '컴퓨터공학과');
INSERT INTO member VALUES('김현정', '산업공학과');
INSERT INTO member VALUES('이진영', '전자공학과');

SELECT * FROM freshman;
SELECT * FROM member;
