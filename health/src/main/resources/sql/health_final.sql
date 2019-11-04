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


--USER 생성
INSERT INTO users (id, password, name, role) values('chloe', 1234, 'Chloe Kim', 'admin');
INSERT INTO users (id, password, name, role) values('camila', 1234, 'Camila Kim', 'user');



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

insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('김치참치필라프',(foodidseq.nextval),'칼로리 546kcal | 지방 38.9g | 단백질 35.7g | 순탄수 17.0g | 식이섬유 5.9g','/img/img_kimchipilaf.jpg','WED','O',3);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('나가사끼부대찌개',(foodidseq.nextval),'칼로리 402kcal | 지방 23.4g | 단백질 19.9g | 순탄수 19.8g | 식이섬유 3.7g','/img/img_nagasaki.jpg','MON','O',1);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('아보카도명란비빔밥',(foodidseq.nextval),'칼로리 744kcal | 지방 67.4g | 단백질 23.0g | 순탄수 13.0g | 식이섬유 14.9g','/img/img_avocadobibim.jpg','THU','O',4);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('북경오리포두부쌈',(foodidseq.nextval),'칼로리 744kcal | 지방 67.4g | 단백질 23.0g | 순탄수 13.0g | 식이섬유 14.9g','/img/img_tofuwrapping.jpg','FRI','O',5);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('미소마요고등어구이',(foodidseq.nextval),'칼로리 856kcal | 지방 72.4g | 단백질 41.1g | 순탄수 10.3g | 식이섬유 5.9g','/img/img_fishmackerel.jpg','WED','O',3);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('매콤쭈꾸미덮밥',(foodidseq.nextval),'칼로리 459kcal | 지방 30.9g | 단백질 30.7g | 순탄수 17.1g | 식이섬유 10.0g','/img/img_mixedrice.jpg','FRI','O',5);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('유자소고기곤약국수',(foodidseq.nextval),'칼로리 305kcal | 지방 5.6g | 단백질 20.8g | 순탄수 3.4g | 식이섬유 3.7g','/img/img_konjacnoodle.jpg','TUE','O',2);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('마파두부',(foodidseq.nextval),'칼로리 540kcal | 지방 3.5g | 단백질 27.6g | 순탄수 12.3g | 식이섬유 10.7g','/img/img_mapotofu.jpg','THU','O',4);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('닭가슴살깻잎볶음',(foodidseq.nextval),'칼로리 470kcal | 지방 2.2g | 단백질 42.8g | 순탄수 5.8g | 식이섬유 11.8g','/img/img_chickenSesame.jpg','MON','O',0);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('풋호박맑은아귀탕',(foodidseq.nextval),'칼로리 347kcal | 지방 1.3g | 단백질 26.7g | 순탄수 1.3g | 식이섬유 10.1g','/img/img_blackmouth angler.jpg','THU','O',4);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('케일베이컨까르보나라',(foodidseq.nextval),'칼로리 582kcal | 지방 49.7g | 단백질 18.7g | 순탄수 18.5g | 식이섬유 3.9g','/img/img_baconcabonara.jpg','SAT','O',6);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('해물잡채밥',(foodidseq.nextval),'칼로리 477kcal | 지방 3.2g | 단백질 25.2g | 순탄수 12.9g | 식이섬유 12.5g','/img/img_Japchae.jpg','SAT','O',6);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('돼지고기쌈장볶음밥',(foodidseq.nextval),'칼로리 479kcal | 지방 3.0g | 단백질 31.6g | 순탄수 8.9g | 식이섬유 12.3g','/img/img_porkmixedrice.jpg','SUN','O',0);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('얼큰해물뚝배기',(foodidseq.nextval),'칼로리 403kcal | 지방 1.6g | 단백질 32.6g | 순탄수 2.9g | 식이섬유 11.4g','/img/img_spicyseafoodsoup.jpg','TUE','O',2);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('소고기들깨버섯영양탕',(foodidseq.nextval),'칼로리 475kcal | 지방 4.7g | 단백질 31.6g | 순탄수 9.3g | 식이섬유 14.1g','/img/img_beefsoup.jpg','FRI','O',5);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('돼지고기고추장찌개',(foodidseq.nextval),'칼로리 485kcal | 지방 2.4g | 단백질 36.4g | 순탄수 3.9g | 식이섬유 14.1g','/img/img_porkredpeppersoup.png','SAT','O',6);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('백아귀찜',(foodidseq.nextval),'칼로리 386kcal | 지방 2.6g | 단백질 28.3g | 순탄수 1.6g | 식이섬유 10.6g','/img/img_Steamed Monkfish.jpg','SUN','O',0);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('타이누들샐러드',(foodidseq.nextval),'칼로리 207kcal | 지방 3.2g | 단백질 14.4g | 순탄수 0.1g | 식이섬유 3.2g','/img/img_thainoodlesalad.jpg','MON','O',1);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('사천식닭조림',(foodidseq.nextval),'칼로리 641kcal | 지방 5.1g | 단백질 46.4g | 순탄수 13.0g | 식이섬유 12.6g','/img/img_spicychicken.jpg','SAT','O',6);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('하얀닭개장',(foodidseq.nextval),'칼로리 400kcal | 지방 1.5g | 단백질 37.1g | 순탄수 3.4g | 식이섬유 10.7g','/img/img_whitechickensoup.jpg','WED','O',3);

CREATE TABLE western(
foodid			number(3),
foodname		VARCHAR2(100),
image			VARCHAR2(200),
image_menu		VARCHAR2(3000),
foodtype			VARCHAR2(30),
constraint FK_western FOREIGN KEY (foodid) REFERENCES mealplanner(foodid) ON DELETE CASCADE
);

insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('바베큐소스목살구이',(foodidseq.nextval),'칼로리 584kcal | 지방 37.5g | 단백질 43.4g | 순탄수 13.2g | 식이섬유 3.7g','/img/img_barbecuesteak.jpg','THU','W',4);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('니수아즈샐러드',(foodidseq.nextval),'칼로리 738kcal | 지방 63.9g | 단백질 29.4g | 순탄수 10.3g | 식이섬유 12.2g','/img/img_nicesalad.jpg','THU','W',4);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('새우감바스',(foodidseq.nextval),'칼로리 718kcal | 지방 52.7g | 단백질 39.9g | 순탄수 23.1g | 식이섬유 16.4g','/img/img_shrimpgambas.jpg','MON','W',1);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('멕시칸치킨수프',(foodidseq.nextval),'칼로리 751kcal | 지방 53.5g | 단백질 41.2g | 순탄수 20.5g | 식이섬유 14.2g','/img/img_chickensoup.jpg','MON','W',1);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('루꼴라가지피자',(foodidseq.nextval),'칼로리 837kcal | 지방 72.0g | 단백질 31.5g | 순탄수 9.9g | 식이섬유 12.5g','/img/img_eggplantpizza.jpg','WED','W',3);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('팟타이',(foodidseq.nextval),'칼로리 507kcal | 지방 33.8g | 단백질 36.5g | 순탄수 15.6g | 식이섬유 3.6g','/img/img_padthai.jpg','TUE','W',2);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('지중해식연어스테이크',(foodidseq.nextval),'칼로리 563kcal | 지방 39.2g | 단백질 42.6g | 순탄수 11.8g | 식이섬유 1.7g','/img/img_salmonsteak.jpg','FRI','W',5);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('데리야끼 가자미구이',(foodidseq.nextval),'칼로리 429kcal | 지방 26.8g | 단백질 39.8g | 순탄수 8.8g | 식이섬유 3.5g','/img/img_floundersteak.jpg','TUE','W',2);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('레드와인소스스테이크',(foodidseq.nextval),'칼로리 576kcal | 지방 40.6g | 단백질 37.5g | 순탄수 7.69g | 식이섬유 3.4g','/img/img_redwinesteak.jpg','SUN','W',0);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('베이컨크림리조토',(foodidseq.nextval),'칼로리 673kcal | 지방 52.6g | 단백질 26.6g | 순탄수 20g | 식이섬유 5.8g','/img/img_creamrisotto.jpg','SAT','W',6);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('아보카도샐러드',(foodidseq.nextval),'칼로리 453kcal | 지방 46.9g | 단백질 14.8g | 순탄수 6.9g | 식이섬유 5.8g','/img/img_avocadosalad.jpg','TUE','W',2);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('해물커리리조또',(foodidseq.nextval),'칼로리 370kcal | 지방 18.0g | 단백질 26.4g | 순탄수 20.2g | 식이섬유 8.2g','/img/img_curryrisotto.jpg','WED','W',3);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('치킨알프레도',(foodidseq.nextval),'칼로리 487kcal | 지방 30.3g | 단백질 37.3g | 순탄수 15.8g | 식이섬유 4.1g','/img/img_chickenpasta.jpg','SUN','W',0);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('주키니연어프리터',(foodidseq.nextval),'칼로리 770kcal | 지방 61.9g | 단백질 28.7g | 순탄수 16.6g | 식이섬유 11.7g','/img/img_Zucchinisalmon.jpg','SAT','W',6);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('새우아보카도계란랩',(foodidseq.nextval),'칼로리 811kcal | 지방 68.7g | 단백질 35.4g | 순탄수 11.4g | 식이섬유 10.0g','/img/img_shrimpomelet.jpg','MON','W',1);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('바질페스토스테이크',(foodidseq.nextval),'칼로리 658kcal | 지방 52.3g | 단백질 39.2g | 순탄수 10.2g | 식이섬유 2.3g','/img/img_basilsteak.jpg','WED','W',3);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('소고기타코',(foodidseq.nextval),'칼로리 535kcal | 지방 8.0g | 단백질 28.6g | 순탄수 15.7 | 식이섬유 5.7g','/img/img_roastbeafataco.jpg','THU','W',4);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('해물토마토파스타',(foodidseq.nextval),'칼로리 600kcal | 지방 9.0g | 단백질 38.6g | 순탄수 10.7 | 식이섬유 3.7g','/img/img_seafoodpasta.jpg','FRI','W',5);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('바베큐수제버거',(foodidseq.nextval),'칼로리 809kcal | 지방 60.4g | 단백질 47.2g | 순탄수 19.0g | 식이섬유 4.9g','/img/img_avocadoburger.jpg','TUE','W',2);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('코코넛커리치킨',(foodidseq.nextval),'칼로리 648kcal | 지방 44.0g | 단백질 45.7g | 순탄수 15.4g | 식이섬유 4.8g','/img/img_chickencurry.jpg','MON','W',1);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('타코샐러드',(foodidseq.nextval),'칼로리 737kcal | 지방 60.9g | 단백질 28.4g | 순탄수 12.6g | 식이섬유 14.5g','/img/img_tacosalad.jpg','SUN','W',0);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('아보카도불고기샐러드',(foodidseq.nextval),'칼로리 853kcal | 지방 76.9g | 단백질 24.8g | 순탄수 12.9g | 식이섬유 13.8g','/img/img_avocadosteak.jpg','FRI','W',5);


-- [ Freeboard ]

drop sequence seq_board;

create sequence seq_board
    start with 1
    increment by 1
    maxvalue 10000;

--민석 table
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
    
insert into thumbnailBoard(title, uploadDate, boardContent, articleNumber, imgsrc) 
values('웨이트 트레이닝 도중에 하지 말아야 할 행동', sysdate, '운동 동작 중에 말을 한다', (select nvl(max(articleNumber),0)+1 from thumbnailBoard), ‘1.jpg');

insert into thumbnailBoard(title, uploadDate, boardContent, articleNumber, imgsrc) 
values('데드리프트, 제대로 알고 하자', sysdate, '그것은 당신의 둔근과 등하부, 그리고 햄스트링을 타깃으로 한다. ', (select nvl(max(articleNumber),0)+1 from thumbnailBoard), ‘2.jpg');

insert into thumbnailBoard(title, uploadDate, boardContent, articleNumber, imgsrc) 
values('벤치프레스’, sysdate, '인클라인 벤치프레스와 디클라인 벤치프레스가 있다.', (select nvl(max(articleNumber),0)+1 from thumbnailBoard), ‘3.jpeg');

insert into thumbnailBoard(title, uploadDate, boardContent, articleNumber, imgsrc) 
values(‘스쿼트’, sysdate, '스쿼트는 성별 관련없이 모두 스쿼트 운동효과를 톡톡히 볼 수 있다. ', (select nvl(max(articleNumber),0)+1 from thumbnailBoard), ‘4.png');




