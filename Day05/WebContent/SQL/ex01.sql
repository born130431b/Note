-- 폰트 크기 지정 : 도구 -> 검색: 글꼴 -> 수정

-- CRUD (Create, Read, Update, Delete)
-- 데이터를 입출력 할 수 있는 소프트웨워가 기본적으로 가지는 구성요소를 의미

-- CRUD     : OracleDB
-- Create   : Insert
-- read     : Select
-- Update   : Update
-- Delete   : Delete

SELECT * from test;         -- *는 모든 열을 출력할 때 사용
SELECT name, age FROM test; -- 원하는 열만 출력시 콤나로 나열

DROP TABLE TEST;            -- DROP TABLE 테이블명 테이블을 삭제하는 커리

-- CREATE TABLE 테이블명 (열1,2,3....)
CREATE TABLE TEST(
    USERID VARCHAR2(20),
    USERPW VARCHAR2(20),
    NAME VARCHAR2(20),
    AGE NUMBER,
    JOINDATE DATE
);
-- INSERT INTO 테이블명 VALUES(값1, 2, 3....)
-- 참고로 문자열은 홑따움표면 사용가능, 정수는 그냥 입력
INSERT INTO TEST VALUES('user1','1','유저1',30,'2021-05-22');

-- INSERT INTO 테이블명(열1, 2, ...) VALUES(값1, 2....)
INSERT INTO TEST(USERID, USERPW) VALUES('USER2','2');

SELECT * FROM TEST;

-- UPDATE 테이블명 SET 열1,열2... WHERE 조건문
UPDATE TEST SET USERPW = 'qwe@123' WHERE USERID = 'user1';
UPDATE TEST SET AGE = 17 WHERE USERID = 'USER2';
UPDATE TEST SET USERPW = '12345', NAME = '관리자' WHERE USERID = 'USER2';

DROP TABLE TEST;

CREATE TABLE Idol(
    이름 VARCHAR(20),
    나이 number,
    성별 VARCHAR(20),
    ID VARCHAR(20),
    PW VARCHAR(20)
);

INSERT INTO Idol values('이지은', 26, '여성', 'iu', 'iu');
INSERT INTO Idol VALUES('김사나',23,'여성','sana','jpy');
INSERT INTO Idol VALUES('이수현',19,'여성','suhyun','yg');
INSERT INTO Idol VALUES('아이린',28,'여성','irene','sm');
INSERT INTO Idol VALUES('이찬혁',22,'남성','chan','yg');

SELECT * FROM Idol; 