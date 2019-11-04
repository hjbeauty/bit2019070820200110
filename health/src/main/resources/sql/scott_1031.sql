-- [ CREATE ]

--[ HealthBoard 생성 ]
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


-- [ FileVO 생성 ]
DROP TABLE files;

create table files(
fno NUMBER(3) PRIMARY KEY,
postno NUMBER(5) REFERENCES healthBoard(postno) ON DELETE CASCADE,
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



-- [ HealthComment 생성 ]

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



-- [ INSERT ]
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


--삭제
--답변있는지 확인
select* from healthboard where groupno = 1 AND grouporder = 2 AND depth =2;

--답변있으면 원글 UPDATE
update healthBoard set title = '[ 삭제된 글입니다 ]', writer = null, reg_date = null, count = null where postno= 1;


commit;
