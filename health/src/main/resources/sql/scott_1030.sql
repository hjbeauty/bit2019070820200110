-- [ 글 ]


drop table healthBoard CASCADE CONSTRAINTS;


CREATE TABLE healthBoard (
postno  NUMBER(5) PRIMARY KEY,      
groupno NUMBER(5) ,                              
grouporder NUMBER(2),                             
depth NUMBER(2),                                  
title VARCHAR2(100),
writer VARCHAR2 (100),
content VARCHAR2 (3000),
reg_date DATE,
count NUMBER(3) DEFAULT 0

);

drop sequence postseq;


 create sequence postseq
 MINVALUE 0
 START WITH 1
 INCREMENT BY 1
 MAXVALUE 100;


--글 생성
--1
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date) 
values (postseq.nextval, (select nvl(max(groupno),0)+1 from healthBoard), 0, 0, '제목1', '글쓴이1','내용1', SYSDATE);



--2
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date) 
values (postseq.nextval, (select nvl(max(groupno),0)+1 from healthBoard), 0, 0, '제목2', '글쓴이2','내용2', SYSDATE);

--3
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date ) 
values (postseq.nextval, (select nvl(max(groupno),0)+1 from healthBoard), 0, 0, '제목3', '글쓴이3','내용3', SYSDATE);


--글 1에 대한 답글
--답글 생성1
--UPDATE
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 1 AND grouporder > 0 ;
--INSERT??
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 1, 1, 1, '답글1', '답글쓴이1', '답글내용1', SYSDATE, 0);

--답글 생성2
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 1 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 1, 1, 1, '답글2', '답글쓴이2', '답글내용2', SYSDATE);


--답글 생성3
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 1 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 1, 1, 1, '답글3', '답글쓴이3', '답글내용3',SYSDATE);





--글 2에 대한 답글
--답글 생성1
--UPDATE
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 2 AND grouporder > 0 ;
--INSERT??
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 2, 1, 1, '답글1', '답글쓴이1', '답글내용1', SYSDATE);

--?답글 생성2
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 2 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 2, 1, 1, '답글2', '답글쓴이2', '답글내용2', SYSDATE);

--?답글 생성3
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 2 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 2, 1, 1, '답글3', '답글쓴이3', '답글내용3', SYSDATE);


--?답글 생성4
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 2 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 2, 1, 1, '답글4', '답글쓴이4', '답글내용4', SYSDATE);


--글 3에 대한 답글
--답글 생성1
--UPDATE
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 3 AND grouporder > 0 ;
--INSERT??
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 3, 1, 1, '답글1', '답글쓴이1', '답글내용1', SYSDATE);

--?답글 생성2
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 3 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 3, 1, 1, '답글2', '답글쓴이2', '답글내용2', SYSDATE);

--?답글 생성3
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 3 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 3, 1, 1, '답글3', '답글쓴이3', '답글내용3', SYSDATE);


--?답글 생성4
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 3 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 3, 1, 1, '답글4', '답글쓴이4', '답글내용4', SYSDATE);




-- 글삭제

DELETE from healthBoard where postno = 2;
UPDATE healthBoard set title = '[원글이 사라진 답글입니다]' + title WHERE groupno = 2 AND grouporder> 0;


UPDATE healthBoard set grouporder = grouporder -1 WHERE groupno = 2 AND grouporder > 1 ;


rollback;

SELECT*FROM healthBoard ORDER BY groupno desc, grouporder asc;

SELECT*FROM healthBoard where postno = 1;

commit;


--제목으로 검색
SELECT * FROM healthBoard where title like '%제목%';


--작성자로 검색
SELECT * FROM healthBoard where writer like '%글쓴이%';

SELECT*FROM healthBoard where writer like %쓴% ORDER BY groupno DESC, grouporder ASC;


--조회수 증가시키기
UPDATE healthBoard set count = count +1 where postno = 1;

commit;


-- [ 댓글 ]

drop table healthComment;

CREATE TABLE healthComment(
  commentno NUMBER(3) PRIMARY KEY,
  postno NUMBER(3),
  content VARCHAR2 (1000),
  writer VARCHAR2 (20),
  reg_date DATE
);


drop sequence commentseq;

 create sequence commentseq
 MINVALUE 0
 START WITH 1
 INCREMENT BY 1
 MAXVALUE 100;


INSERT INTO healthComment(commentno, postno, content, writer, reg_date)
VALUES(commentseq.nextval, 1, '댓글1', '댓글쓴이1', SYSDATE);

UPDATE healthComment SET content = '댓글수정1' where commentno = 1;

DELETE FROM healthComment where commentno = 1;

commit;


-- [ File 업로드 ]
DROP TABLE files;

create table files(
fno NUMBER(3) PRIMARY KEY,
postno NUMBER(5) REFERENCES healthBoard(postno),
filename VARCHAR2(200),
fileOriName VARCHAR2(300),
fileurl VARCHAR2(500)
);

DROP SEQUENCE fileseq;

 create sequence fileseq
 MINVALUE 0
 START WITH 1
 INCREMENT BY 1
 MAXVALUE 100;




-- [ paging 처리 ]
SELECT*FROM
		(select rownum row#, postno, groupno, grouporder, depth, title, writer, content, reg_date from 
		healthBoard ORDER BY groupno DESC, grouporder ASC) where row# between 1 AND 10;
        
        
        
	public int count_search_move(String condition, String keyword) throws Exception {
		String sql = "select * from  healthBoard condition+" like '%'||?||'%' ";        
        
--[USERS]

DROP TABLE users;

CREATE TABLE users(

    id VARCHAR2(50) PRIMARY KEY,
    password VARCHAR(1000),
    name VARCHAR(50),
    role VARCHAR(20) DEFAULT 'user' check(role in ('user', 'admin'))
    );
      
INSERT INTO users (id, password, name, role) values('주현짱', 1234, '김주현', 'admin');
INSERT INTO users (id, password, name, role) values('민서짱', 1234, '김민서', 'admin');
INSERT INTO users (id, password, name, role) values('성현짱', 1234, '김성현', 'user');
INSERT INTO users (id, password, name, role) values('민석짱', 1234, '고민석', 'user');
INSERT INTO users (id, password, name, role) values('원재짱', 1234, '두원재', 'user');

SELECT * FROM users WHERE id = '주현짱' AND password = 1234;

COMMIT;


--성현 table
  CREATE TABLE QNABOARD 
   (	
    POSTNO NUMBER(5,0) primary key, 
	GROUPNO NUMBER(5,0) not null, 
	GROUPORDER NUMBER(2,0) not null, 
	DEPTH NUMBER(2,0) not null, 
	TITLE VARCHAR2(200) not null, 
	WRITER VARCHAR2(20) not null, 
	CONTENT VARCHAR2(3000) not null, 
	IMG VARCHAR2(200)
    );

--민석 시퀸스
    create sequence seq_board
    start with 1
    increment by 1
    maxvalue 10000;
--민석 table
    CREATE TABLE freeboard (
       boardnum number(4),
       title varchar2(100),
       boardtime date default sysdate,
       txt varchar2(2000),
       writer varchar2(20),     
      constraint pk_boardnum primary key(boardnum)
    );

--원재 table
    create table thumbnailBoard
    (
    title varchar2(200),
    uploadDate date,
    boardContent varchar2(1000),
    articleNumber number(10),
    imgsrc varchar2(200),
    primary key(articleNumber)
    );

--원재 글 작성
insert into thumbnailBoard(title, uploadDate, boardContent, articleNumber, imgsrc) 
values('웨이트 트레이닝 도중에 하지 말아야 할 행동', sysdate, '운동 동작 중에 말을 한다.', (select nvl(max(articleNumber),0)+1 from thumbnailBoard), '1.jpg');

insert into thumbnailBoard(title, uploadDate, boardContent, articleNumber, imgsrc) 
values('데드리프트, 제대로 알고 하자', sysdate, '그것은 당신의 둔근과 등하부, 그리고 햄스트링을 타깃으로 한다.', (select nvl(max(articleNumber),0)+1 from thumbnailBoard), '2.jpg');

insert into thumbnailBoard(title, uploadDate, boardContent, articleNumber, imgsrc) 
values('벤치프레스', sysdate, '인클라인 벤치프레스와 디클라인 벤치프레스가 있다.', (select nvl(max(articleNumber),0)+1 from thumbnailBoard), '3.png');

insert into thumbnailBoard(title, uploadDate, boardContent, articleNumber, imgsrc) 
values('스쿼트', sysdate, '스쿼트는 성별 관련없이 모두 스쿼트 운동효과를 톡톡히 볼 수 있다. ', (select nvl(max(articleNumber),0)+1 from thumbnailBoard), '4.jpeg');

