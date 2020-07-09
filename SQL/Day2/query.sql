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

-- 데이터 조회
SELECT * FROM 학과;

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
    FOREIGN KEY (부서코드) REFERENCES 부서(부서코드)
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