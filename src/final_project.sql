SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS recommend;
DROP TABLE IF EXISTS report;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS mainsearch;
DROP TABLE IF EXISTS scrap;
DROP TABLE IF EXISTS member;




/* Create Tables */

CREATE TABLE board
(
	num int NOT NULL AUTO_INCREMENT,
	type int,
	id varchar(20) NOT NULL,
	subject varchar(100),
	content varchar(5000),
	file varchar(100),
	regdate date,
	readcnt int,
	recommend int,
	PRIMARY KEY (num)
);


CREATE TABLE comment
(
	num int NOT NULL,
	boardnum int NOT NULL,
	content varchar(500),
	regdate date,
	grp int,
	grplevel int,
	grpstep int,
	id varchar(20) NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE mainsearch
(
	num int(11) NOT NULL,
	id varchar(20) NOT NULL,
	keyword varchar(50) NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE member
(
	id varchar(20) NOT NULL,
	password varchar(20) DEFAULT 'NULL',
	name varchar(20) DEFAULT 'NULL',
	birthday varchar(50),
	tel varchar(50) DEFAULT 'NULL',
	email varchar(100) DEFAULT 'NULL',
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE recommend
(
	boardnum int NOT NULL,
	id varchar(20) NOT NULL,
	url varchar(250) NOT NULL,
	subject varchar(250),
	PRIMARY KEY (boardnum, id)
);


CREATE TABLE report
(
	id varchar(20) NOT NULL,
	url varchar(300) NOT NULL,
	num int NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE scrap
(
	id varchar(20) NOT NULL,
	url varchar(250) NOT NULL,
	title varchar(250) NOT NULL,
	type int(11) NOT NULL,
	PRIMARY KEY (id, url)
);



/* Create Foreign Keys */

ALTER TABLE comment
	ADD FOREIGN KEY (boardnum)
	REFERENCES board (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE recommend
	ADD FOREIGN KEY (boardnum)
	REFERENCES board (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE report
	ADD FOREIGN KEY (num)
	REFERENCES board (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE comment
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE mainsearch
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE recommend
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE scrap
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



