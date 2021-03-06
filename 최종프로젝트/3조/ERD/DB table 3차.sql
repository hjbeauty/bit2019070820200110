﻿CREATE TABLE `User` (
	`user_id`	varchar(30)	NOT NULL,
	`funnel_id`	int(5)	NOT NULL,
	`name`	varchar(20)	NULL,
	`password`	varchar(20)	NULL,
	`identification_number`	varchar(13)	NULL,
	`email`	varchar(100)	NULL,
	`role`	varchar(20)	NULL,
	`phone`	char(11)	NULL,
	`message_yn`	tinyint(1)	NULL,
	`dislike_genre`	varchar(500)	NULL,
	`wishlist`	varchar(500)	NULL,
	`noshow_count`	int(2)	NULL,
	`join_date`	date	NULL
);

CREATE TABLE `like_dislike` (
	`like_id`	int(5)	NOT NULL,
	`show_id`	int(5)	NOT NULL,
	`user_id`	varchar(30)	NOT NULL,
	`like_dislike_flag`	tinyint(1)	NOT NULL,
	`like_dislike_date`	date	NULL
);

CREATE TABLE `genre` (
	`genre_id`	int(5)	NOT NULL,
	`genre_name`	varchar(30)	NULL,
	`genre_content`	varchar(500)	NOT NULL
);

CREATE TABLE `review` (
	`review_id`	int(5)	NOT NULL,
	`ticketing_id`	int(5)	NOT NULL,
	`review_content`	varchar(10000)	NULL,
	`review_grade`	float(2,1)	NULL,
	`review_report_yn`	tinyint(1)	NULL,
	`review_date`	date	NULL
);

CREATE TABLE `exclude_show` (
	`user_id`	varchar(30)	NOT NULL,
	`show_id`	int(5)	NOT NULL
);

CREATE TABLE `funnel` (
	`funnel_id`	int(5)	NOT NULL,
	`funnel_name`	varchar(20)	NOT NULL
);

CREATE TABLE `blacklist` (
	`blacklist_id`	int(5)	NOT NULL,
	`user_id`	varchar(30)	NOT NULL,
	`reason_id`	int(5)	NOT NULL,
	`name`	varchar(20)	NULL,
	`email`	varchar(100)	NULL,
	`role`	varchar(20)	NULL,
	`phone`	char(11)	NULL,
	`delete_date`	date	NULL
);

CREATE TABLE `notice` (
	`notice_id`	int(5)	NOT NULL,
	`user_id`	varchar(30)	NOT NULL,
	`notice_title`	varchar(100)	NULL,
	`notice_content`	varchar(10000)	NULL,
	`notice_date`	date	NULL,
	`picture`	varchar(200)	NULL,
	`notice_view`	int(5)	NULL
);

CREATE TABLE `reason` (
	`reason_id`	int(5)	NOT NULL,
	`reason_type`	tinyint(1)	NULL,
	`reason_content`	varchar(50)	NULL
);

CREATE TABLE `audience_price` (
	`audience_price_id`	int(5)	NOT NULL,
	`show_id`	int(5)	NOT NULL,
	`audience1_price`	int(5)	NOT NULL,
	`audience2_price`	int(5)	NOT NULL,
	`audience3_price`	int(5)	NOT NULL,
	`audience4_price`	int(5)	NOT NULL,
	`audience5_price`	int(5)	NOT NULL,
	`audience6_price`	int(5)	NOT NULL
);

CREATE TABLE `show_check` (
	`show_check_id`	int(5)	NOT NULL,
	`reservation`	tinyint(1)	NULL,
	`standing`	tinyint(1)	NULL,
	`no_show`	tinyint(1)	NULL
);

CREATE TABLE `ticketing` (
	`ticketing_id`	int(5)	NOT NULL,
	`show_id`	int(5)	NOT NULL,
	`user_id`	varchar(30)	NOT NULL,
	`show_check_id`	int(5)	NOT NULL,
	`reason_id`	int(5)	NOT NULL,
	`price`	int(6)	NULL,
	`seat_number`	int(3)	NULL,
	`ticketing_date`	DATE	NULL,
	`refund_flag`	char(8)	NULL,
	`payment_type`	varchar(10)	NULL,
	`refund_date`	DATE	NULL,
	`refund_apply_date`	DATE	NULL
);

CREATE TABLE `troup` (
	`troup_id`	int(5)	NOT NULL,
	`user_id`	varchar(30)	NOT NULL,
	`troup_name`	varchar(30)	NULL,
	`troup_phone`	char(10)	NULL	COMMENT 'unique',
	`bank_name`	varchar(20)	NULL,
	`bank_account`	char(12)	NULL,
	`kakao_account`	varchar(30)	NULL,
	`theater_name`	varchar(50)	NULL,
	`theater_location`	varchar(200)	NULL,
	`seat_yn`	tinyint(1)	NULL,
	`latitude`	float(3,1)	NULL,
	`longitude`	float(3,1)	NULL
);

CREATE TABLE `QnA` (
	`QnA_id`	int(5)	NOT NULL,
	`user_id`	varchar(30)	NOT NULL,
	`QnA_title`	varchar(100)	NULL,
	`QnA_content`	varchar(10000)	NULL,
	`QnA_date`	DATE	NULL,
	`QnA_view`	int(5)	NULL,
	`group_number`	int(5)	NULL,
	`order`	int(2)	NULL,
	`depth`	int(2)	NULL
);

CREATE TABLE `show` (
	`show_id`	int(5)	NOT NULL,
	`troup_id`	int(5)	NOT NULL,
	`genre_id`	int(5)	NOT NULL,
	`show_title`	varchar(100)	NULL,
	`start_date`	DATE	NULL,
	`end_date`	DATE	NULL,
	`show_preview`	varchar(500)	NULL,
	`show_content`	varchar(500)	NULL
);

CREATE TABLE `show_date` (
	`show_date_id`	int(5)	NOT NULL,
	`show_id`	int(5)	NOT NULL,
	`show_time_week`	datetime	NULL,
	`show_time_weekend1`	datetime	NULL,
	`show_time_weekend2`	datetime	NULL,
	`show_time_etc`	datetime	NULL,
	`show_length`	time	NULL
);

CREATE TABLE `audience_count` (
	`audience_count_id`	int(5)	NOT NULL,
	`ticketing_id`	int(5)	NOT NULL,
	`audience1_count`	int(6)	NULL,
	`audience1_amount`	int(6)	NULL,
	`audience2_count`	int(6)	NULL,
	`audience2_amount`	int(6)	NULL,
	`audience3_count`	int(6)	NULL,
	`audience3_amount`	int(6)	NULL,
	`audience4_count`	int(6)	NULL,
	`audience4_amount`	int(6)	NULL,
	`audience5_count`	int(6)	NULL,
	`audience5_amount`	int(6)	NULL,
	`audience6_acount`	int(6)	NULL,
	`audience6_amount`	int(6)	NULL
);

CREATE TABLE `theater` (
	`theater_name`	varchar(50)	NOT NULL,
	`troup_id`	int(5)	NOT NULL,
	`row`	int(2)	NULL,
	`column`	int(2)	NULL
);

CREATE TABLE `theater1_seat` (
	`index`	int(3)	NOT NULL,
	`seat_status`	tinyint(1)	NULL
);

ALTER TABLE `User` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `like_dislike` ADD CONSTRAINT `PK_LIKE_DISLIKE` PRIMARY KEY (
	`like_id`
);

ALTER TABLE `genre` ADD CONSTRAINT `PK_GENRE` PRIMARY KEY (
	`genre_id`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`review_id`
);

ALTER TABLE `exclude_show` ADD CONSTRAINT `PK_EXCLUDE_SHOW` PRIMARY KEY (
	`user_id`,
	`show_id`
);

ALTER TABLE `funnel` ADD CONSTRAINT `PK_FUNNEL` PRIMARY KEY (
	`funnel_id`
);

ALTER TABLE `blacklist` ADD CONSTRAINT `PK_BLACKLIST` PRIMARY KEY (
	`blacklist_id`
);

ALTER TABLE `notice` ADD CONSTRAINT `PK_NOTICE` PRIMARY KEY (
	`notice_id`
);

ALTER TABLE `reason` ADD CONSTRAINT `PK_REASON` PRIMARY KEY (
	`reason_id`
);

ALTER TABLE `audience_price` ADD CONSTRAINT `PK_AUDIENCE_PRICE` PRIMARY KEY (
	`audience_price_id`
);

ALTER TABLE `show_check` ADD CONSTRAINT `PK_SHOW_CHECK` PRIMARY KEY (
	`show_check_id`
);

ALTER TABLE `ticketing` ADD CONSTRAINT `PK_TICKETING` PRIMARY KEY (
	`ticketing_id`
);

ALTER TABLE `troup` ADD CONSTRAINT `PK_TROUP` PRIMARY KEY (
	`troup_id`
);

ALTER TABLE `QnA` ADD CONSTRAINT `PK_QNA` PRIMARY KEY (
	`QnA_id`
);

ALTER TABLE `show` ADD CONSTRAINT `PK_SHOW` PRIMARY KEY (
	`show_id`
);

ALTER TABLE `show_date` ADD CONSTRAINT `PK_SHOW_DATE` PRIMARY KEY (
	`show_date_id`
);

ALTER TABLE `audience_count` ADD CONSTRAINT `PK_AUDIENCE_COUNT` PRIMARY KEY (
	`audience_count_id`
);

ALTER TABLE `theater` ADD CONSTRAINT `PK_THEATER` PRIMARY KEY (
	`theater_name`
);

ALTER TABLE `theater1_seat` ADD CONSTRAINT `PK_THEATER1_SEAT` PRIMARY KEY (
	`index`
);

ALTER TABLE `exclude_show` ADD CONSTRAINT `FK_User_TO_exclude_show_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `User` (
	`user_id`
);

ALTER TABLE `exclude_show` ADD CONSTRAINT `FK_show_TO_exclude_show_1` FOREIGN KEY (
	`show_id`
)
REFERENCES `show` (
	`show_id`
);

