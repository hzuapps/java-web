--创建数据库
CREATE DATABASE CMSDB;
go

use CMSDB;

--创建账户表
CREATE TABLE Account(
	ID int PRIMARY KEY,
	Username nvarchar(64) UNIQUE not null,	--用户名
	Password nvarchar(32) not null,			--密码
	Name nvarchar(256) not null				--昵称
)
go

--创建帖子表
CREATE TABLE Posts(
	ID int PRIMARY KEY,
	AID int not null,					--发帖账户ID
	Title nvarchar(128) not null,		--标题
	Text nvarchar(max) not null,		--内容
	CreateDateTime datetime not null,	--发帖时间
	ReplyCount int not null,			--回复数
	FOREIGN KEY(AID) REFERENCES Account(ID)
)
go

--创建1级回复表
CREATE TABLE Reply1(
	ID int PRIMARY KEY,
	AID int not null,					--发表账户ID
	PID int not null,					--所回复帖子ID
	Text nvarchar(max) not null,		--内容
	CreateDateTime datetime not null,	--发表时间
	FOREIGN KEY(AID) REFERENCES Account(ID),
	FOREIGN KEY(PID) REFERENCES Posts(ID)
)
go

--创建2级回复表
CREATE TABLE Reply2(
	ID int PRIMARY KEY,
	AID int not null,					--发表账户ID
	RID int not null,					--所回复的1级回复的ID
	Text nvarchar(max) not null,		--内容
	CreateDateTime datetime not null,	--发表时间
	FOREIGN KEY(AID) REFERENCES Account(ID),
	FOREIGN KEY(RID) REFERENCES Reply1(ID)
)
go

--创建账户表的空闲ID表
CREATE TABLE R_AID(
	ID int PRIMARY KEY
)
--创建帖子表的空闲ID表
CREATE TABLE R_PID(
	ID int PRIMARY KEY
)
--创建1级回复表的空闲ID表
CREATE TABLE R_R1ID(
	ID int PRIMARY KEY
)
--创建2级回复表的空闲ID表
CREATE TABLE R_R2ID(
	ID int PRIMARY KEY
)
