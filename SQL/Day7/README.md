
~~~ sql
-- ALTER TABLE 실습

-- project(projectno, projname, btdget)

CREATE TABLE project(
    projno int,
    projname char(10),
    budget int;
)

--(Oracle)
-- 테이블 구조 조회
desc project;

-- 필드 추가
ALTER TABLE project
ADD period;

-- 필드 삭제
ALTER TABLE project
DROP COLUMN period;

--필드 수정
-- (Oracle)
ALTER TABLE project
MODIFY projname varchar(30);

-- (MS SQL)(MySQL)
ALTER TABLE project
ALTER COLUMN projname varchar(30);



~~~