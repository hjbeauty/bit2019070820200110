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
    
    
 --�� ����
--1
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date) 
values (postseq.nextval, (select nvl(max(groupno),0)+1 from healthBoard), 0, 0, '����1', '�۾���1','����1', SYSDATE);



--2
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date) 
values (postseq.nextval, (select nvl(max(groupno),0)+1 from healthBoard), 0, 0, '����2', '�۾���2','����2', SYSDATE);

--3
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date ) 
values (postseq.nextval, (select nvl(max(groupno),0)+1 from healthBoard), 0, 0, '����3', '�۾���3','����3', SYSDATE);


--�� 1�� ���� ���
--��� ����1
--UPDATE
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 1 AND grouporder > 0 ;
--INSERT??
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 1, 1, 1, '���1', '��۾���1', '��۳���1', SYSDATE, 0);

--��� ����2
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 1 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 1, 1, 1, '���2', '��۾���2', '��۳���2', SYSDATE);


--��� ����3
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 1 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 1, 1, 1, '���3', '��۾���3', '��۳���3',SYSDATE);





--�� 2�� ���� ���
--��� ����1
--UPDATE
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 2 AND grouporder > 0 ;
--INSERT??
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 2, 1, 1, '���1', '��۾���1', '��۳���1', SYSDATE);

--?��� ����2
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 2 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 2, 1, 1, '���2', '��۾���2', '��۳���2', SYSDATE);

--?��� ����3
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 2 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 2, 1, 1, '���3', '��۾���3', '��۳���3', SYSDATE);


--?��� ����4
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 2 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 2, 1, 1, '���4', '��۾���4', '��۳���4', SYSDATE);


--�� 3�� ���� ���
--��� ����1
--UPDATE
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 3 AND grouporder > 0 ;
--INSERT??
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 3, 1, 1, '���1', '��۾���1', '��۳���1', SYSDATE);

--?��� ����2
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 3 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 3, 1, 1, '���2', '��۾���2', '��۳���2', SYSDATE);

--?��� ����3
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 3 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 3, 1, 1, '���3', '��۾���3', '��۳���3', SYSDATE);


--?��� ����4
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 3 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 3, 1, 1, '���4', '��۾���4', '��۳���4', SYSDATE);


--USER ����
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

insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('��ġ��ġ�ʶ���',(foodidseq.nextval),'Į�θ� 546kcal | ���� 38.9g | �ܹ��� 35.7g | ��ź�� 17.0g | ���̼��� 5.9g','/img/img_kimchipilaf.jpg','WED','O',3);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�����糢�δ��',(foodidseq.nextval),'Į�θ� 402kcal | ���� 23.4g | �ܹ��� 19.9g | ��ź�� 19.8g | ���̼��� 3.7g','/img/img_nagasaki.jpg','MON','O',1);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�ƺ�ī����������',(foodidseq.nextval),'Į�θ� 744kcal | ���� 67.4g | �ܹ��� 23.0g | ��ź�� 13.0g | ���̼��� 14.9g','/img/img_avocadobibim.jpg','THU','O',4);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�ϰ�������κν�',(foodidseq.nextval),'Į�θ� 744kcal | ���� 67.4g | �ܹ��� 23.0g | ��ź�� 13.0g | ���̼��� 14.9g','/img/img_tofuwrapping.jpg','FRI','O',5);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�̼Ҹ�������',(foodidseq.nextval),'Į�θ� 856kcal | ���� 72.4g | �ܹ��� 41.1g | ��ź�� 10.3g | ���̼��� 5.9g','/img/img_fishmackerel.jpg','WED','O',3);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�����޲ٹ̵���',(foodidseq.nextval),'Į�θ� 459kcal | ���� 30.9g | �ܹ��� 30.7g | ��ź�� 17.1g | ���̼��� 10.0g','/img/img_mixedrice.jpg','FRI','O',5);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('���ڼҰ���౹��',(foodidseq.nextval),'Į�θ� 305kcal | ���� 5.6g | �ܹ��� 20.8g | ��ź�� 3.4g | ���̼��� 3.7g','/img/img_konjacnoodle.jpg','TUE','O',2);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('���ĵκ�',(foodidseq.nextval),'Į�θ� 540kcal | ���� 3.5g | �ܹ��� 27.6g | ��ź�� 12.3g | ���̼��� 10.7g','/img/img_mapotofu.jpg','THU','O',4);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�߰����첢�ٺ���',(foodidseq.nextval),'Į�θ� 470kcal | ���� 2.2g | �ܹ��� 42.8g | ��ź�� 5.8g | ���̼��� 11.8g','/img/img_chickenSesame.jpg','MON','O',0);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('ǲȣ�ڸ����Ʊ���',(foodidseq.nextval),'Į�θ� 347kcal | ���� 1.3g | �ܹ��� 26.7g | ��ź�� 1.3g | ���̼��� 10.1g','/img/img_blackmouth angler.jpg','THU','O',4);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('���Ϻ������������',(foodidseq.nextval),'Į�θ� 582kcal | ���� 49.7g | �ܹ��� 18.7g | ��ź�� 18.5g | ���̼��� 3.9g','/img/img_baconcabonara.jpg','SAT','O',6);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�ع���ä��',(foodidseq.nextval),'Į�θ� 477kcal | ���� 3.2g | �ܹ��� 25.2g | ��ź�� 12.9g | ���̼��� 12.5g','/img/img_Japchae.jpg','SAT','O',6);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('���������庺����',(foodidseq.nextval),'Į�θ� 479kcal | ���� 3.0g | �ܹ��� 31.6g | ��ź�� 8.9g | ���̼��� 12.3g','/img/img_porkmixedrice.jpg','SUN','O',0);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('��ū�ع��ҹ��',(foodidseq.nextval),'Į�θ� 403kcal | ���� 1.6g | �ܹ��� 32.6g | ��ź�� 2.9g | ���̼��� 11.4g','/img/img_spicyseafoodsoup.jpg','TUE','O',2);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�Ұ��������������',(foodidseq.nextval),'Į�θ� 475kcal | ���� 4.7g | �ܹ��� 31.6g | ��ź�� 9.3g | ���̼��� 14.1g','/img/img_beefsoup.jpg','FRI','O',5);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�������������',(foodidseq.nextval),'Į�θ� 485kcal | ���� 2.4g | �ܹ��� 36.4g | ��ź�� 3.9g | ���̼��� 14.1g','/img/img_porkredpeppersoup.png','SAT','O',6);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('��Ʊ���',(foodidseq.nextval),'Į�θ� 386kcal | ���� 2.6g | �ܹ��� 28.3g | ��ź�� 1.6g | ���̼��� 10.6g','/img/img_Steamed Monkfish.jpg','SUN','O',0);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('Ÿ�̴��������',(foodidseq.nextval),'Į�θ� 207kcal | ���� 3.2g | �ܹ��� 14.4g | ��ź�� 0.1g | ���̼��� 3.2g','/img/img_thainoodlesalad.jpg','MON','O',1);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('��õ�Ĵ�����',(foodidseq.nextval),'Į�θ� 641kcal | ���� 5.1g | �ܹ��� 46.4g | ��ź�� 13.0g | ���̼��� 12.6g','/img/img_spicychicken.jpg','SAT','O',6);
insert into mealplanner (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�Ͼ�߰���',(foodidseq.nextval),'Į�θ� 400kcal | ���� 1.5g | �ܹ��� 37.1g | ��ź�� 3.4g | ���̼��� 10.7g','/img/img_whitechickensoup.jpg','WED','O',3);

CREATE TABLE western(
foodid			number(3),
foodname		VARCHAR2(100),
image			VARCHAR2(200),
image_menu		VARCHAR2(3000),
foodtype			VARCHAR2(30),
constraint FK_western FOREIGN KEY (foodid) REFERENCES mealplanner(foodid) ON DELETE CASCADE
);

insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�ٺ�ť�ҽ���챸��',(foodidseq.nextval),'Į�θ� 584kcal | ���� 37.5g | �ܹ��� 43.4g | ��ź�� 13.2g | ���̼��� 3.7g','/img/img_barbecuesteak.jpg','THU','W',4);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�ϼ����������',(foodidseq.nextval),'Į�θ� 738kcal | ���� 63.9g | �ܹ��� 29.4g | ��ź�� 10.3g | ���̼��� 12.2g','/img/img_nicesalad.jpg','THU','W',4);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('���차�ٽ�',(foodidseq.nextval),'Į�θ� 718kcal | ���� 52.7g | �ܹ��� 39.9g | ��ź�� 23.1g | ���̼��� 16.4g','/img/img_shrimpgambas.jpg','MON','W',1);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�߽�ĭġŲ����',(foodidseq.nextval),'Į�θ� 751kcal | ���� 53.5g | �ܹ��� 41.2g | ��ź�� 20.5g | ���̼��� 14.2g','/img/img_chickensoup.jpg','MON','W',1);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('��ö�������',(foodidseq.nextval),'Į�θ� 837kcal | ���� 72.0g | �ܹ��� 31.5g | ��ź�� 9.9g | ���̼��� 12.5g','/img/img_eggplantpizza.jpg','WED','W',3);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('��Ÿ��',(foodidseq.nextval),'Į�θ� 507kcal | ���� 33.8g | �ܹ��� 36.5g | ��ź�� 15.6g | ���̼��� 3.6g','/img/img_padthai.jpg','TUE','W',2);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�����ؽĿ������ũ',(foodidseq.nextval),'Į�θ� 563kcal | ���� 39.2g | �ܹ��� 42.6g | ��ź�� 11.8g | ���̼��� 1.7g','/img/img_salmonsteak.jpg','FRI','W',5);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�����߳� ���ڹ̱���',(foodidseq.nextval),'Į�θ� 429kcal | ���� 26.8g | �ܹ��� 39.8g | ��ź�� 8.8g | ���̼��� 3.5g','/img/img_floundersteak.jpg','TUE','W',2);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('������μҽ�������ũ',(foodidseq.nextval),'Į�θ� 576kcal | ���� 40.6g | �ܹ��� 37.5g | ��ź�� 7.69g | ���̼��� 3.4g','/img/img_redwinesteak.jpg','SUN','W',0);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('������ũ��������',(foodidseq.nextval),'Į�θ� 673kcal | ���� 52.6g | �ܹ��� 26.6g | ��ź�� 20g | ���̼��� 5.8g','/img/img_creamrisotto.jpg','SAT','W',6);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�ƺ�ī��������',(foodidseq.nextval),'Į�θ� 453kcal | ���� 46.9g | �ܹ��� 14.8g | ��ź�� 6.9g | ���̼��� 5.8g','/img/img_avocadosalad.jpg','TUE','W',2);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�ع�Ŀ��������',(foodidseq.nextval),'Į�θ� 370kcal | ���� 18.0g | �ܹ��� 26.4g | ��ź�� 20.2g | ���̼��� 8.2g','/img/img_curryrisotto.jpg','WED','W',3);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('ġŲ��������',(foodidseq.nextval),'Į�θ� 487kcal | ���� 30.3g | �ܹ��� 37.3g | ��ź�� 15.8g | ���̼��� 4.1g','/img/img_chickenpasta.jpg','SUN','W',0);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('��Ű�Ͽ���������',(foodidseq.nextval),'Į�θ� 770kcal | ���� 61.9g | �ܹ��� 28.7g | ��ź�� 16.6g | ���̼��� 11.7g','/img/img_Zucchinisalmon.jpg','SAT','W',6);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('����ƺ�ī�������',(foodidseq.nextval),'Į�θ� 811kcal | ���� 68.7g | �ܹ��� 35.4g | ��ź�� 11.4g | ���̼��� 10.0g','/img/img_shrimpomelet.jpg','MON','W',1);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�����佺�佺����ũ',(foodidseq.nextval),'Į�θ� 658kcal | ���� 52.3g | �ܹ��� 39.2g | ��ź�� 10.2g | ���̼��� 2.3g','/img/img_basilsteak.jpg','WED','W',3);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�Ұ��Ÿ��',(foodidseq.nextval),'Į�θ� 535kcal | ���� 8.0g | �ܹ��� 28.6g | ��ź�� 15.7 | ���̼��� 5.7g','/img/img_roastbeafataco.jpg','THU','W',4);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�ع��丶���Ľ�Ÿ',(foodidseq.nextval),'Į�θ� 600kcal | ���� 9.0g | �ܹ��� 38.6g | ��ź�� 10.7 | ���̼��� 3.7g','/img/img_seafoodpasta.jpg','FRI','W',5);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�ٺ�ť��������',(foodidseq.nextval),'Į�θ� 809kcal | ���� 60.4g | �ܹ��� 47.2g | ��ź�� 19.0g | ���̼��� 4.9g','/img/img_avocadoburger.jpg','TUE','W',2);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('���ڳ�Ŀ��ġŲ',(foodidseq.nextval),'Į�θ� 648kcal | ���� 44.0g | �ܹ��� 45.7g | ��ź�� 15.4g | ���̼��� 4.8g','/img/img_chickencurry.jpg','MON','W',1);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('Ÿ�ڻ�����',(foodidseq.nextval),'Į�θ� 737kcal | ���� 60.9g | �ܹ��� 28.4g | ��ź�� 12.6g | ���̼��� 14.5g','/img/img_tacosalad.jpg','SUN','W',0);
insert into MEALPLANNER (foodname, foodid, image, image_menu, day, foodtype, dayorder) values('�ƺ�ī���Ұ�������',(foodidseq.nextval),'Į�θ� 853kcal | ���� 76.9g | �ܹ��� 24.8g | ��ź�� 12.9g | ���̼��� 13.8g','/img/img_avocadosteak.jpg','FRI','W',5);


-- [ Freeboard ]

drop sequence seq_board;

create sequence seq_board
    start with 1
    increment by 1
    maxvalue 10000;

--�μ� table
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
values('����Ʈ Ʈ���̴� ���߿� ���� ���ƾ� �� �ൿ', sysdate, '� ���� �߿� ���� �Ѵ�', (select nvl(max(articleNumber),0)+1 from thumbnailBoard), ��1.jpg');

insert into thumbnailBoard(title, uploadDate, boardContent, articleNumber, imgsrc) 
values('���帮��Ʈ, ����� �˰� ����', sysdate, '�װ��� ����� �бٰ� ���Ϻ�, �׸��� �ܽ�Ʈ���� Ÿ������ �Ѵ�. ', (select nvl(max(articleNumber),0)+1 from thumbnailBoard), ��2.jpg');

insert into thumbnailBoard(title, uploadDate, boardContent, articleNumber, imgsrc) 
values('��ġ��������, sysdate, '��Ŭ���� ��ġ�������� ��Ŭ���� ��ġ�������� �ִ�.', (select nvl(max(articleNumber),0)+1 from thumbnailBoard), ��3.jpeg');

insert into thumbnailBoard(title, uploadDate, boardContent, articleNumber, imgsrc) 
values(������Ʈ��, sysdate, '����Ʈ�� ���� ���þ��� ��� ����Ʈ �ȿ���� ������ �� �� �ִ�. ', (select nvl(max(articleNumber),0)+1 from thumbnailBoard), ��4.png');




