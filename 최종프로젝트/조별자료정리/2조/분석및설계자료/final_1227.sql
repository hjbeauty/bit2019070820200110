-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
-- -----------------------------------------------------
-- Schema testdb
-- -----------------------------------------------------

 DROP database testdb;

CREATE SCHEMA IF NOT EXISTS `testdb` DEFAULT CHARACTER SET utf8mb4 ;
USE `testdb` ;

-- -----------------------------------------------------
-- Table `testdb`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`Admin` (
  `adminNo` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `adminID` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`adminNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `testdb`.`codes`
-- -----------------------------------------------------
DROP TABLE if exists Codes;

CREATE TABLE IF NOT EXISTS `testdb`.`Codes` (
  `codeNo` TINYINT(4) NOT NULL,
  `codeName` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`codeNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO Codes (`codeNo`,`codeName`) VALUES (11,'활동');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (12,'정지');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (13,'탈퇴');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (14,'강퇴');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (21,'정상');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (22,'경고');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (23,'퇴장');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (31,'예약확인되었습니다');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (32,'수리중입니다');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (33,'예약 끝');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (34,'휴무일 입니다.');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (41,'여성');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (42,'남성');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (51,'한식');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (52,'양식');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (53,'중식');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (54,'일식');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (55,'동남아식');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (56,'뷔페식');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (61,'1');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (62,'2');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (63,'3');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (64,'4');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (65,'5');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (71,'유효');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (72,'사용자삭제');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (73,'관리자삭제');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (81,'사용자가 삭제하였습니다.');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (91,'부적절한 홍보 게시글');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (92,'음란성 또는 청소년에게 부적합한 내용');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (93,'중복된 내용');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (94,'운영자가 삭제한 내용입니다.(ex.신고횟수많음)');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (101,'가게 비방 및 허위사실유포');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (102,'악성 댓글 신고 횟수 많음');
INSERT INTO Codes (`codeNo`,`codeName`) VALUES (103,'기타의 사유로 운영자가 계정을 정지하였습니다.');

Select count(*) from Codes;
select* from Codes;
-- -----------------------------------------------------
-- Table `testdb`.`level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`Level` (
  `grade` SMALLINT(6) NOT NULL,
  `low` SMALLINT(6) NULL DEFAULT NULL,
  `high` SMALLINT(6) NULL DEFAULT NULL,
  PRIMARY KEY (`grade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO Level(grade,low,high) values(1,0, 10);
INSERT INTO Level(grade,low,high) values(2,11, 20);
INSERT INTO Level(grade,low,high) values(3,21, 30);
INSERT INTO Level(grade,low,high) values(4,31, 40);
INSERT INTO Level(grade,low,high) values(5,41, 10000);


-- -----------------------------------------------------
-- Table `testdb`.`users`
-- -----------------------------------------------------
DROP TABLE if exists Users; 

CREATE TABLE IF NOT EXISTS `testdb`.`Users` (
  `userNo` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT, 
  `level` SMALLINT(6) NOT NULL DEFAULT 1, 
  `gender` TINYINT(4) NOT NULL DEFAULT 41,
  `userStatus` TINYINT(4) NOT NULL DEFAULT 11,
  `violation` TINYINT(4) NOT NULL DEFAULT 21,
  `reasonCode` TINYINT(4) NULL DEFAULT 71,
  `userID` VARCHAR(100) NULL DEFAULT NULL,
  `nickname` VARCHAR(30) NULL DEFAULT NULL UNIQUE,
  `birthday` DATE NULL DEFAULT NULL,
  `age` TINYINT(4) NULL DEFAULT 0,
  `phone` VARCHAR(100) NULL DEFAULT NULL,
  `profileImg` VARCHAR(100) NULL DEFAULT NULL,
  `shareLocation` TINYINT(1) NULL DEFAULT false,
  `regDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `wtCount` SMALLINT(6) DEFAULT 0,
  PRIMARY KEY (`userNo`),
  UNIQUE INDEX `userID` (`userID` ASC),
  INDEX `fk_users_Level1_idx` (`level` ASC),
  INDEX `fk_users_Codes1_idx` (`gender` ASC),
  INDEX `fk_users_Codes2_idx` (`userstatus` ASC),
  INDEX `fk_users_Codes3_idx` (`violation` ASC),
  INDEX `fk_users_Codes4_idx` (`reasonCode` ASC),
  CONSTRAINT `fk_users_Codes1`
    FOREIGN KEY (`gender`)
    REFERENCES `testdb`.`Codes` (`codeNo`),
  CONSTRAINT `fk_users_Codes2`
    FOREIGN KEY (`userstatus`)
    REFERENCES `testdb`.`Codes` (`codeNo`),
  CONSTRAINT `fk_users_Codes3`
    FOREIGN KEY (`violation`)
    REFERENCES `testdb`.`Codes` (`codeNo`),
  CONSTRAINT `fk_users_Level1`
    FOREIGN KEY (`level`)
    REFERENCES `testdb`.`Level` (`grade`),
  CONSTRAINT `fk_users_codes4`
    FOREIGN KEY (`reasonCode`)
    REFERENCES `testdb`.`Codes` (`codeNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `testdb`.`project`
-- -----------------------------------------------------
Drop TABLE if exists Project;

CREATE TABLE IF NOT EXISTS `testdb`.`Project` (
  `projectNo` INT(3) NOT NULL AUTO_INCREMENT, 
  `userNo` SMALLINT(5) UNSIGNED NOT NULL, 
  `projectStatus` TINYINT(4) default 71,
  `reasonCode` TINYINT(4) NULL DEFAULT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `regDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `meetingDate` DATE NULL DEFAULT NULL,
  `totalExpense` INT(3) NULL DEFAULT 0,
  `read` SMALLINT(6) NULL DEFAULT 0,
  `open` TINYINT(1) NULL DEFAULT true,
  `shared` TINYINT(1) NULL DEFAULT false,
  `baseNo` VARCHAR(45) NULL DEFAULT NULL,
  `buddies` int(3) NULL DEFAULT NULL, 
  PRIMARY KEY (`projectNo`),
  INDEX `fk_project_users1_idx` (`userNo` ASC),
  INDEX `fk_project_codes1_idx` (`projectStatus` ASC),
  INDEX `fk_project_codes2_idx` (`reasonCode` ASC),
  CONSTRAINT `fk_project_codes1`
    FOREIGN KEY (`projectStatus`)
    REFERENCES `testdb`.`codes` (`codeNo`),
  CONSTRAINT `fk_project_codes2`
    FOREIGN KEY (`reasonCode`)
    REFERENCES `testdb`.`codes` (`codeNo`),
  CONSTRAINT `fk_project_users1`
    FOREIGN KEY (`userNo`)
    REFERENCES `testdb`.`users` (`userNo`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4;

select*from Users;


-- -----------------------------------------------------
-- Table `testdb`.`buddy`
-- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `testdb`.`buddy` (
--   `userNo` SMALLINT(5) NOT NULL,
--   `projectNo` INT(3) NOT NULL,
--   PRIMARY KEY (`userNo`, `projectNo`),
--   INDEX `buddy_fk` (`projectNo` ASC),
--   CONSTRAINT `buddy_fk`
--     FOREIGN KEY (`projectNo`)
--     REFERENCES `testdb`.`project` (`projectNo`)
--     ON DELETE RESTRICT)
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8mb4;
-- 

-- -----------------------------------------------------
-- Table `testdb`.`projectcomment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`ProjectComment` (
  `projectcommentNo` INT(3) NOT NULL AUTO_INCREMENT,
  `projectNo` INT(3) NOT NULL,
  `userNo` SMALLINT(5) UNSIGNED NOT NULL,
  `content` VARCHAR(1000) NULL DEFAULT NULL,
  `regDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `open` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`projectcommentNo`),
  INDEX `fk_comment_project1_idx` (`projectNo` ASC),
  INDEX `fk_comment_users1_idx` (`userNo` ASC),
  CONSTRAINT `fk_comment_project1`
    FOREIGN KEY (`projectNo`)
    REFERENCES `testdb`.`project` (`projectNo`) ON DELETE CASCADE,
  CONSTRAINT `fk_comment_users1`
    FOREIGN KEY (`userNo`)
    REFERENCES `testdb`.`users` (`userNo`) ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `testdb`.`userfollow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS UserFollow;

CREATE TABLE IF NOT EXISTS `testdb`.`UserFollow` (
  `targetNo` SMALLINT(6) NOT NULL,
  `userNo` SMALLINT(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`targetNo`, `userNo`),
  INDEX `fk_follow_users1_idx` (`userNo` ASC),
  CONSTRAINT `fk_follow_users1`
    FOREIGN KEY (`userNo`)
    REFERENCES `testdb`.`Users` (`userNo`) ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `testdb`.`ownerstore`
-- -----------------------------------------------------
DROP TABLE IF EXISTS OwnerStore;

CREATE TABLE IF NOT EXISTS `testdb`.`OwnerStore` (
  `ownerNo` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `cuisine` TINYINT(4) NOT NULL,
  `ownerID` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(1000) NULL DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `tel` VARCHAR(100) NULL DEFAULT NULL,
  `address` VARCHAR(100) NULL DEFAULT NULL,
  `storeName` VARCHAR(1000) NULL DEFAULT NULL,
  `BRNo` VARCHAR(12) NULL DEFAULT NULL,
  `menuImg` VARCHAR(1000) NULL DEFAULT NULL,
  `openingHours` VARCHAR(600) NULL DEFAULT NULL,
  PRIMARY KEY (`ownerNo`),
  UNIQUE INDEX `ownerID_UNIQUE` (`ownerID` ASC),
  INDEX `fk_ownerstore_Codes1_idx` (`cuisine` ASC),
  CONSTRAINT `fk_ownerstore_Codes1`
    FOREIGN KEY (`cuisine`)
    REFERENCES `testdb`.`Codes` (`codeNo`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `testdb`.`projectdetail`
-- -----------------------------------------------------
DROP TABLE if exists ProjectDetail; 


CREATE TABLE IF NOT EXISTS `testdb`.`ProjectDetail` (
  `projectNo` INT(3) NOT NULL,
  `ownerNo` SMALLINT(6) NOT NULL,
  `routeNo` TINYINT(4) NULL DEFAULT NULL,
  `estimate` INT(3) NULL DEFAULT NULL,
  `time` DATETIME NULL DEFAULT NULL,
  `payment` INT(3) NULL DEFAULT NULL,
  `memo` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`ownerNo`),
  INDEX `fk_route_ownerstore1_idx` (`ownerNo` ASC),
  INDEX `fk_pjdetail_project1_idx` (`projectNo` ASC),
  CONSTRAINT `fk_pjdetail_project1`
    FOREIGN KEY (`projectNo`)
    REFERENCES `testdb`.`Project` (`projectNo`) ON DELETE CASCADE,
  CONSTRAINT `fk_route_ownerstore1`
    FOREIGN KEY (`ownerNo`)
    REFERENCES `testdb`.`Ownerstore` (`ownerNo`) ON DELETE CASCADE) 
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `testdb`.`projectlike`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`ProjectLike` (
  `projectNo` INT(3) NOT NULL,
  `userNo` SMALLINT(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`projectNo`, `userNo`),
  INDEX `fk_pjlike_project1_idx` (`projectNo` ASC),
  INDEX `fk_pjlike_users1_idx` (`userNo` ASC),
  CONSTRAINT `fk_pjlike_project1`
    FOREIGN KEY (`projectNo`)
    REFERENCES `testdb`.`project` (`projectNo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pjlike_users1`
    FOREIGN KEY (`userNo`)
    REFERENCES `testdb`.`users` (`userNo`)ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `testdb`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`Reservation` (
  `reserveNo` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `ownerNo` SMALLINT(6) NOT NULL,
  `userNo` SMALLINT(5) UNSIGNED NOT NULL,
  `answerNo` TINYINT(4) NOT NULL,
  `phone` VARCHAR(100) NULL DEFAULT NULL,
  `regDate` DATE NULL DEFAULT NULL,
  `adult` TINYINT(4) NULL DEFAULT NULL,
  `child` TINYINT(4) NULL DEFAULT NULL,
  `request` TEXT NULL DEFAULT NULL,
  `reTime` TIME NULL DEFAULT NULL,
  `acceptance` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`reserveNo`),
  INDEX `fk_reserve_ownerstore1_idx` (`ownerNo` ASC),
  INDEX `fk_reserve_users1_idx` (`userNo` ASC),
  INDEX `fk_reserve_Codes1_idx` (`answerNo` ASC),
  CONSTRAINT `fk_reserve_Codes1`
    FOREIGN KEY (`answerNo`)
    REFERENCES `testdb`.`codes` (`codeNo`),
  CONSTRAINT `fk_reserve_ownerstore1`
    FOREIGN KEY (`ownerNo`)
    REFERENCES `testdb`.`ownerstore` (`ownerNo`),
  CONSTRAINT `fk_reserve_users1`
    FOREIGN KEY (`userNo`)
    REFERENCES `testdb`.`users` (`userNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `testdb`.`storereview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`StoreReview` (
  `storereviewNo` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `userNo` SMALLINT(5) UNSIGNED NOT NULL,
  `ownerNo` SMALLINT(6) NOT NULL,
  `star` TINYINT(4) NOT NULL,
  `contents` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`storereviewNo`),
  INDEX `fk_reviews_users1_idx` (`userNo` ASC),
  INDEX `fk_reviews_ownerstore1_idx` (`ownerNo` ASC),
  INDEX `fk_reviews_Codes1_idx` (`star` ASC),
  CONSTRAINT `fk_reviews_Codes1`
    FOREIGN KEY (`star`)
    REFERENCES `testdb`.`codes` (`codeNo`),
  CONSTRAINT `fk_reviews_ownerstore1`
    FOREIGN KEY (`ownerNo`)
    REFERENCES `testdb`.`ownerstore` (`ownerNo`),
  CONSTRAINT `fk_reviews_users1`
    FOREIGN KEY (`userNo`)
    REFERENCES `testdb`.`users` (`userNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `testdb`.`storelike`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`StoreLike` (
  `userNo` SMALLINT(5) UNSIGNED NOT NULL,
  `ownerNo` SMALLINT(6) NOT NULL,
  PRIMARY KEY (`userNo`, `ownerNo`),
  INDEX `fk_stlike_users1_idx` (`userNo` ASC),
  INDEX `fk_stlike_ownerstore1_idx` (`ownerNo` ASC),
  CONSTRAINT `fk_stlike_ownerstore1`
    FOREIGN KEY (`ownerNo`)
    REFERENCES `testdb`.`ownerstore` (`ownerNo`),
  CONSTRAINT `fk_stlike_users1`
    FOREIGN KEY (`userNo`)
    REFERENCES `testdb`.`users` (`userNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `testdb`.`waiting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `testdb`.`Waiting` (
  `ownerNo` SMALLINT(6) NOT NULL,
  `userNo` SMALLINT(5) UNSIGNED NOT NULL,
  `waitingList` TINYINT(4) NULL DEFAULT NULL,
  `storeName` VARCHAR(100) NULL DEFAULT NULL,
  `userName` VARCHAR(100) NULL DEFAULT NULL,
  `phone` VARCHAR(100) NULL DEFAULT NULL,
  `regDate` DATE NULL DEFAULT NULL,
  `adult` TINYINT(4) NULL DEFAULT NULL,
  `child` TINYINT(4) NULL DEFAULT NULL,
  `request` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`userNo`, `ownerNo`),
  INDEX `fk_waiting_ownerstore1_idx` (`ownerNo` ASC),
  INDEX `fk_waiting_users1_idx` (`userNo` ASC),
  CONSTRAINT `fk_waiting_ownerstore1`
    FOREIGN KEY (`ownerNo`)
    REFERENCES `testdb`.`ownerstore` (`ownerNo`),
  CONSTRAINT `fk_waiting_users1`
    FOREIGN KEY (`userNo`)
    REFERENCES `testdb`.`users` (`userNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


Drop table Codes cascade;
																							
commit;




Select * from Codes;
Select * from Project;
Select * from Users;

UPDATE Users SET profileImg = "url/url" where userNo=1;

-- Users Table 가 데이터
INSERT INTO Users(userstatus, violation, gender,userID, nickname, shareLocation) 
VALUES (11, 21, 41,'juhyun@gmail.com', '주현주현', true);

INSERT INTO Users(userstatus, violation, gender,userID, nickname,shareLocation)
VALUES (11, 21, 41,'myomyo@gmail.com', '묘음묘음' ,true);

INSERT INTO Users(userstatus, violation, gender,userID,nickname, shareLocation)
VALUES (11, 21, 41,'minmin@gmail.com', '민서민서',true);

INSERT INTO Users(userstatus, violation, gender,userID, nickname,shareLocation)
VALUES (11, 21, 42,'deokdeok@gmail.com', '덕현덕현',true);

INSERT INTO Users(userstatus, violation, gender,userID,nickname, shareLocation)
VALUES (11, 21, 42,'euneun2@gmail.com', '은석은석2',true);


-- ㄹㅇ Users Insert문
INSERT INTO Users(userID, nickname, phone, birthday, gender, shareLocation)
VALUES ('yes@gmail.com', '캬캬', '010-1234-5678', '1995-08-25', 41,true);

INSERT INTO Users(userID, nickname, phone, birthday, gender, shareLocation)
VALUES ('yay@gmail.com', '집좀가자', '010-1234-5678', '1995-08-25', 42,true);

INSERT INTO Users(userID, nickname, phone, birthday, shareLocation)
VALUES ('yo@gmail.com', '집좀가자고...', '010-1234-5678', '1995-08-25', true);

INSERT INTO Users(userID, nickname, phone, birthday, gender, shareLocation)
VALUES ('yassssss@gmail.com', '캬', '010-1234-5678', '1995-08-25', 41,true);


INSERT INTO Users(userID, nickname, phone, birthday, shareLocation)
VALUES ('yassssssss@gmail.com', '캬하', '010-1234-5678', '1995-08-25', true);

-- 회원 정보 수정 @mypage
UPDATE Users SET nickname = '크크', phone = '010-0000-0000', birthday = '1995-08-14', gender = 41, shareLocation = true
WHERE userID = 'juhyun.kim@lindsey.edu';

-- UserID로 UserNo 알아내기 (Session에 userNo 넣으려구)
SELECT userNo FROM Users WHERE userID = 'juhyun.kim@lindsey.edu';


SELECT*FROM Users;

-- User nickname으로 검색 (Chat 상대 검색할 때 쓰려구)
SELECT * FROM Users WHERE nickname LIKE '%ho%';

-- OwnerStore 가데이터
INSERT INTO OwnerStore(cuisine, ownerID, password, name, tel, address, storeName, BRNo)
VALUES(51, 'owner@gmail.com',1234,'김오너', '010-1234-5678','서울시 강남구 강남대로 23', '호랑이식당',9002000200);

INSERT INTO OwnerStore(cuisine, ownerID, password, name, tel, address, storeName, BRNo, menuImg)
VALUES(52, 'store2@gmail.com',1234,'임오너', '010-3333-3333', '서울시 중구 소공로 119', '도원', 7891882817, 'Final-Project/Taoyuen.jpg');

INSERT INTO OwnerStore(cuisine, ownerID, password, name, tel, address, storeName, BRNo, menuImg)
VALUES(52, 'store3@gmail.com',1234,'박오너', '010-3333-3333', '서울시 중구 소공로 119', '세븐스퀘어', 910292347, 'Final-Project/Sevensquare.jpg');

INSERT INTO OwnerStore(cuisine, ownerID, password, name, tel, address, storeName, BRNo, menuImg)
VALUES(54, 'store4@gmail.com',1234,'최오너', '010-3333-4444', '서울시 중구 소공로 119', '주옥', 910292347, 'Final-Project/juoak.jpg');

INSERT INTO OwnerStore(cuisine, ownerID, password, name, tel, address, storeName, BRNo, menuImg)
VALUES(52, 'store5@gmail.com',1234,'이오너', '010-3333-5555', '서울시 중구 태평로 119', 'Waffle Bant', 910292347, 'Final-Project/WaffleBant.jpg');

-- 음식점 이름으로 검색
SELECT*FROM OwnerStore WHERE storeName LIKE '%스%';
SELECT*FROM OwnerStore WHERE storeName LIKE '%원%';
SELECT*FROM OwnerStore WHERE storeName LIKE '%waffle%';
SELECT*FROM OwnerStore WHERE storeName LIKE '%도원%';

-- 이렇게 해야 한다!!!
SELECT*FROM OwnerStore WHERE storeName LIKE CONCAT('%','도원','%');


-- 음식 종류로 검색 (51 ~ 56)
SELECT*FROM OwnerStore WHERE cuisine = 51;

-- 음식점 이름 & 음식점 종류로 검색
SELECT*FROM OwnerStore WHERE storeName LIKE '%븐%' AND cuisine = 52;




DELETE FROM OwnerStore where ownerNo =2;
UPDATE OwnerStore set menuImg = 'Final-Project/tiger.jpg' WHERE ownerNo = 1;


select*from OwnerStore;

-- StoreLike 가데이터
INSERT INTO StoreLike (userNo, ownerNo) VALUES (1,2);
INSERT INTO StoreLike (userNo, ownerNo) VALUES (1,1);
INSERT INTO StoreLike (userNo, ownerNo) VALUES (1,3);
INSERT INTO StoreLike (userNo, ownerNo) VALUES (2,1);
INSERT INTO StoreLike (userNo, ownerNo) VALUES (2,2);
INSERT INTO StoreLike (userNo, ownerNo) VALUES (2,3);
INSERT INTO StoreLike (userNo, ownerNo) VALUES (2,4);

select*from StoreLike;

-- user 1이 좋아요한 음식점 목록 출력
SELECT*FROM OwnerStore WHERE ownerNo IN (SELECT ownerNo FROM StoreLike WHERE userNo =1);

-- user 2 가 좋아요한 음식점 목록 출력
SELECT*FROM OwnerStore WHERE ownerNo IN (SELECT ownerNo FROM StoreLike WHERE userNo =2);



-- ProjectDetail 가데이터
INSERT INTO ProjectDetail(projectNo,ownerNo, routeNo, estimate)
VALUES (1,1, 2, 10000);

INSERT INTO ProjectDetail (projectNo, ownerNo, routeNo, estimate)
VALUES (1,2,1,25000);  

SELECT*FROM ProjectDetail;
SELECT*FROM OwnerStore;


-- Project 1의  대표사진으로 쓸 ProjectDetail의 routeNo 2 인  음식점 사진 Select 문
SELECT menuImg from OwnerStore WHERE ownerNo IN (SELECT ownerNo from ProjectDetail WHERE projectNo =1 AND routeNo = 2);                                                                                                                 


-- Delete 같지만 사실은 Update 인 회원 탈퇴  ( 11 => 13 )
UPDATE Users set userStatus = 13 where userNo =1;



-- userNo 1의 성별 출력
Select codeName FROM Codes where codeNo IN (Select gender from Users where userNo=1);

-- Project Table 가 데이터
Insert into Project (userNo, projectStatus,title)
VALUES (1, 71, '다 내가 먹을꺼야');

Insert into Project (userNo, projectStatus, title)
VALUES (2, 71, '묘음이의 맛집 탐방');

INSERT INTO Project (userNo, title) VALUES (4, '프로젝트 원글1');
INSERT INTO Project (userNo, title) VALUES (5, '프로젝트 원글2');
INSERT INTO Project (userNo, title) VALUES (6, '프로젝트 원글3');
INSERT INTO Project (userNo, title) VALUES (7, '프로젝트 원글4');
INSERT INTO Project (userNo, title) VALUES (8, '프로젝트 원글5');
INSERT INTO Project (userNo, title) VALUES (9, '프로젝트 원글6');


-- 프로젝트 퍼가기
INSERT INTO Project (userNo, title, shared, baseNo)
VALUES (2, '주현이 프로젝트 퍼가기', true, 1);
INSERT INTO Project (userNo, title, shared, baseNo)
VALUES (2, '퍼가기 2', true, 4);
INSERT INTO Project (userNo, title, shared, baseNo)
VALUES (2, '퍼가기 3', true, 5);
INSERT INTO Project (userNo, title, shared, baseNo)
VALUES (2, '퍼가기 4', true, 6);
INSERT INTO Project (userNo, title, shared, baseNo)
VALUES (2, '퍼가기 5', true, 7);
INSERT INTO Project (userNo, title, shared, baseNo)
VALUES (2, '퍼가기 6', true, 8);


select*from Project;

-- User 2가 만든 프로젝트 조회
SELECT * FROM Project WHERE userNo = 2 AND shared = false;

-- User 2가 퍼온 프로젝트 조회
SELECT * FROM Project WHERE userNo =2 AND shared = true;


-- ProjectLike 테이블 가데이터
INSERT INTO ProjectLike(projectNo, userNo) VALUES (2,1);
INSERT INTO ProjectLike(projectNo, userNo) VALUES (3,1);
INSERT INTO ProjectLike(projectNo, userNo) VALUES (4,1);
INSERT INTO ProjectLike(projectNo, userNo) VALUES (5,1);
INSERT INTO ProjectLike(projectNo, userNo) VALUES (6,1);
INSERT INTO ProjectLike(projectNo, userNo) VALUES (7,1);
INSERT INTO ProjectLike(projectNo, userNo) VALUES (8,1);
INSERT INTO ProjectLike(projectNo, userNo) VALUES (4,2);
INSERT INTO ProjectLike(projectNo, userNo) VALUES (5,2);
INSERT INTO ProjectLike(projectNo, userNo) VALUES (6,2);
INSERT INTO ProjectLike(projectNo, userNo) VALUES (7,2);
INSERT INTO ProjectLike(projectNo, userNo) VALUES (8,2);
INSERT INTO ProjectLike(projectNo, userNo) VALUES (9,2);

-- userNo 1이 좋아요한 프로젝트 목록 출력
Select*from Project WHERE projectNo IN (Select projectNo from ProjectLike WHERE userNo =1);

-- userNo 2가 좋아요한 프로젝트 목록 출력
SELECT*FROM Project WHERE projectNo IN (SELECT projectNo FROM ProjectLike WHERE userNo =2);


SELECT * FROM ProjectLike;


-- [ UserFollow table 가데이터 ]

-- userNo 1이 follow하는 userNo 2,3,5
INSERT INTO UserFollow(userNo, targetNo) VALUES(1,2);
INSERT INTO UserFollow(userNo, targetNo) VALUES(1,3);
INSERT INTO UserFollow(userNo, targetNo) VALUES(1,5);

-- userNo 1을 follow 하는 userNo 2,5,6 
INSERT INTO UserFollow(userNo, targetNo) VALUES(2,1);
INSERT INTO UserFollow(userNo, targetNo) VALUES(5,1);
INSERT INTO UserFollow(userNo, targetNo) VALUES(6,1);

-- userNo 1이 Follow 하는 사람 목록 출력
SELECT * FROM  Users WHERE userNo in (SELECT targetNo FROM UserFollow where userNo =1); 

-- userNo 1을 Follow 하는 사람 목록 출력
SELECT * FROM Users WHERE userNo in (SELECT userNo FROM UserFollow where targetNo =1); 


-- user 1이 user 2 unFollow 하기
DELETE FROM UserFollow WHERE userNo = 1 AND targetNo = 2;


commit;

Select count(*) from Project where userNo =1;

-- [ ver1) wtCount & Level 동시에 Update ]
-- Project 생성 or StoreReview 작성 시 Users의 wtCount & Level Update   => Level이 Update 될 때에 wtCount도 update 됨..
UPDATE Users as u 
INNER JOIN 
	(Select count(*) as c from StoreReview where userNo=1) as a
	, (Select count(*) as d from Project where userNo=1) as b
	,(SELECT l.grade as grade from Users u, Level l where u.wtCount between l.low AND l.high AND userNo=1) as user 
Set
	u.wtCount = a.c + b.d
	, u.level = user.grade 
WHERE userNo =1;


-- [ ver2) wtCount Update 후  Level Update ]
-- Project 생성 or StoreReview 작성 시 Users의 wtCount Update
UPDATE Users Set wtCount = 
(Select count(*) from StoreReview where userNo=1) 
+ 
(Select count(*) from Project where userNo=1)
WHERE userNo =1;


-- Project 생성 or StoreReview 작성 시 Users의 Level Update
UPDATE Users as u INNER JOIN 
(SELECT l.grade as grade from Users u, Level l where u.wtCount between l.low AND l.high AND userNo=1) as user 
Set
u.level = user.grade
WHERE userNo =1;








