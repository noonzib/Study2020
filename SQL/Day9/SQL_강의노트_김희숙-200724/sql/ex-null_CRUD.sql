--널 값 입력/수정/삭제

--(addr_book-k.sql)

drop table 주소록;

--주소록(이름, 전화번호, 주소, 생일)

--주소록 테이블 생성
CREATE TABLE 주소록(
  이름        varchar(10) NOT NULL ,
  전화번호    char(13) ,
  주소        varchar(10) ,
  생일        varchar(11) ,
  PRIMARY KEY(이름)
);

--데이터 입력
--주소록(이름, 전화번호, 주소, 생일)

INSERT INTO 주소록(이름, 전화번호, 주소, 생일) 
VALUES('홍길동','010-1234-5678','서울','3월 15일');

INSERT INTO 주소록(이름, 전화번호, 주소, 생일) 
VALUES('이몽룡','010-3354-5643','부산','12월 14일');

INSERT INTO 주소록(이름, 전화번호, 주소, 생일) 
VALUES('최용만','321-2345','대전','5월 8일');

select * from 주소록;

--박찬호 주소, 이름은 널 값으로 입력
INSERT INTO 주소록(이름, 전화번호) 
VALUES('박찬호','010-1234-5678');

select * from 주소록;

--주소가 널 값인 레코드를 검색하라
SELECT *
FROM   주소록
WHERE  주소 IS NULL;

--홍길동의 이름, 전화번호, 주소, 생일을 검색하라
SELECT *
FROM   주소록
WHERE  이름 = '홍길동';

--홍길동의 주소를 NULL 값으로 수정하라
UPDATE 주소록
SET    주소 = NULL
WHERE  이름 = '홍길동';


--전체 레코드 조회(널 값인 데이터를 확인해 두시오)
select * from 주소록;

--주소가 널 값이고 생일이 널 값인 레코드를 삭제하라
DELETE
FROM   주소록 
WHERE  주소 IS NULL AND 생일 IS NULL;

select * from 주소록;


DELETE
FROM    주소록
WHERE   이름 = '박찬호';

