SELECT * FROM MEMBER;

INSERT INTO member VALUES('test','1','테스트 계정','test@itbank.com','2021-05-23');


INSERT INTO member VALUES('root','qwe@123','관리자','root@itbank.com','2021-01-23');

SELECT * FROM MEMBER WHERE ID='test' and pw="1";
SELECT * FROM MEMBER WHERE ID='root' and pw="d";

DELETE itbank from MEMBER;

SELECT * FROM board;
SELECT * FROM BOARD ORDER BY IDX ASC;   -- 오름차순
SELECT * FROM BOARD ORDER BY IDX DESC;  -- 내림차순

INSERT INTO board VALUES(BOARD_SEQ.NEXTVAL, '테스트1', '테스트 글 입니다', 'test', '2021-06-02', '192.168.0.1', 0);
-- BOARD_SEQ.NEXTVAL : 해당 시퀀스의 값을 자동으로 증가시켜주는 구문

INSERT INTO board VALUES(BOARD_SEQ.NEXTVAL, '안녕하세요', '관리자 입니다.', 'test', '2021-06-02', '192.168.0.100', 30);
INSERT INTO board VALUES(BOARD_SEQ.NEXTVAL, '로또', '이번주에 1등 당첨!', 'test', '2021-06-02', '192.168.0.200', 1);

INSERT INTO BOARD (TITLE, CONTENTS, ID, CREATEDATE, IPADDR, VIEWCOUNT)
SELET TITLE, CONTENTS, ID, CREATEDATE, IPADDR, VIEWCOUNT FROM BOARD;
-- 위의 구문은 SELECT한 결과를 바로 INSERT해버리는 구문 즉 조회된 만큼 추가됨



