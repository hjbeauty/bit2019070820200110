-- [ healthBoard ]

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


-- [ FileVO ]
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

commit;


-- [ HealthComment ]

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
 

--[USERS]

DROP TABLE users;

CREATE TABLE users(

    id VARCHAR2(50) PRIMARY KEY,
    password VARCHAR(1000),
    name VARCHAR(50),
    role VARCHAR(20) DEFAULT 'user' check(role in ('user', 'admin'))
    );


-- [ QNA Board ]

DROP TABLE QNABOARD;

  CREATE TABLE QNABOARD 
   (	
    POSTNO NUMBER(5,0) primary key, 
	GROUPNO NUMBER(5,0) , 
	GROUPORDER NUMBER(2,0) , 
	DEPTH NUMBER(2,0) , 
	TITLE VARCHAR2(200) , 
	WRITER VARCHAR2(20) , 
	CONTENT VARCHAR2(3000) , 
	IMG VARCHAR2(200)
    );
    

-- [ MEAL Planner ]

DROP TABLE mealplanner CASCADE CONSTRAINTS;
DROP TABLE oriental;
DROP TABLE western;
DROP SEQUENCE foodidseq;

create table mealplanner(
dayorder varchar2(30),
foodid		number(3) PRIMARY KEY,
foodname	VARCHAR2(100),
image	VARCHAR2(200),
image_menu	VARCHAR2(3000),
day		VARCHAR2(30),
week		NUMBER(2),
foodtype    VARCHAR2(30)
);

create sequence foodidseq
MINVALUE 0
START WITH 1
INCREMENT BY 1
MAXVALUE 200;

CREATE TABLE oriental(
foodid			number(3),
foodname		VARCHAR2(100),
image			VARCHAR2(200),
image_menu		VARCHAR2(3000),
foodtype			VARCHAR2(30),
constraint FK_oriental FOREIGN KEY (foodid) REFERENCES mealplanner(foodid) ON DELETE CASCADE
);

CREATE TABLE western(
foodid			number(3),
foodname		VARCHAR2(100),
image			VARCHAR2(200),
image_menu		VARCHAR2(3000),
foodtype			VARCHAR2(30),
constraint FK_western FOREIGN KEY (foodid) REFERENCES mealplanner(foodid) ON DELETE CASCADE
);

-- [ Freeboard ]

drop sequence seq_board;

create sequence seq_board
    start with 1
    increment by 1
    maxvalue 10000;

--¹Î¼® table
    drop table freeboard;
    
    CREATE TABLE freeboard (
       boardnum number(4),
       title varchar2(100),
       boardtime date default sysdate,
       txt varchar2(2000),
       writer varchar2(20),     
      constraint pk_boardnum primary key(boardnum)
    );


-- [ ThumbnailBoard ] 

drop table thumbnailBoard;



    create table thumbnailBoard
    (
    title varchar2(200),
    uploadDate date,
    boardContent varchar2(1000),
    articleNumber number(10),
    imgsrc varchar2(200),
    primary key(articleNumber)
    );

