--* 집계함수 : 여러 개 행의 값들을 계산하여 하나의 결과를 산출하는 함수
conn study/study123

--성적(이름, 점수)
--성적2(이름, 과목, 점수)
--2-1) 최고 점수를 검색하라 
SELECT MAX(점수)
FROM 성적;

--2-2) 최저 점수를 검색하라
SELECT MIN(점수)
FROM 성적;

--2-3) 점수합계를 검색하라 
SELECT SUM(점수)
FROM 성적;

--2-4) 평균점수를 검색하라
SELECT AVG(점수)
FROM 성적;

--* COUNT(*)      : NULL 포함하여 계산
--* COUNT(필드) : NULL 제외하여 계산
--2-5) 학생수는 모두 몇 명인지 검색하라
SELECT COUNT(*)
FROM 성적;

--2-6) 시험에 응시한 학생수는 모두 몇 명인지 검색하라
SELECT COUNT(점수)
FROM 성적;

--3-1) 각 과목수는 몇 개인지 검색하라(DISTINCT 사용)
SELECT COUNT(DISTINCT 과목)
FROM 성적2;

--3-2) 과목별 수강생은 몇 명인지 검색하라(GROUP BY)
SELECT 과목, count(*)
FROM 성적2
GROUP BY 과목;
--3-3) 과목별 평균점수를 검색하라(GROUP BY)

--3-4) 과목별 평균점수 75 보다 높은 학생 수를 검색하라(HAVING)
SELECT 과목, COUNT(*)
FROM 성적2
GROUP BY 과목
HAVING AVG(점수) >= 75;


--주의) 문제수정!
--(문제 수정) 3-4) 과목별 평균점수 75 보다 높은 학생의 과목별 평균점수를 검색하라(HAVING)

--ROUND() 함수
select 과목, ROUND(AVG(점수))
from 성적2
group by 과목;

--3-5) 점수가 70 이상인 과목이름, 과목 평균점수를 과목의 과목별 평균점수가 75 이상인 것만
--과목별 평균점수가 높은 순으로 검색하라(ORDER  BY)
SELECT 과목, AVG(점수)
FROM   성적2
WHERE  점수 >= 70
GROUP BY 과목
HAVING  AVG(점수) >= 75
ORDER BY 2 DESC ;


