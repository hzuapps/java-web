use CMSDB
go

--创建：插入Reply2表记录触发器
CREATE TRIGGER Insert_Reply2
ON Reply2
AFTER INSERT
AS
BEGIN
	--获取此Reply2记录所属的帖子ID
	DECLARE @pid int
	SET @pid = (
		SELECT PID
		FROM Reply1
		WHERE ID = (
			SELECT RID
			FROM inserted
		)
	)
	--给此帖子记录累加回复数
	UPDATE Posts
	SET ReplyCount = ReplyCount + 1
	WHERE ID = @pid
END
go

--创建：插入Reply1表记录触发器
CREATE TRIGGER Insert_Reply1
ON Reply1
AFTER INSERT
AS
BEGIN
	--获取此Reply1记录所属的帖子ID
	DECLARE @pid int
	SET @pid = (
		SELECT PID
		FROM inserted
	)
	--给此帖子记录累加回复数
	UPDATE Posts
	SET ReplyCount = ReplyCount + 1
	WHERE ID = @pid
END
go

--创建：删除Reply2表记录触发器
CREATE TRIGGER Delete_Reply2
ON Reply2
INSTEAD OF DELETE
AS
BEGIN
	--真正删除每个2级回复
	DELETE Reply2
	WHERE ID in (
		SELECT ID
		FROM deleted
	)
	--记录空闲ID
	INSERT INTO R_R2ID(ID)
		SELECT id
		FROM deleted
END
go

--创建：删除Reply1表记录触发器
CREATE TRIGGER Delete_Reply1
ON Reply1
INSTEAD OF DELETE
AS
BEGIN
	--删除对此1级回复进行的回复
	DELETE Reply2
	WHERE RID in (
		SELECT ID
		FROM deleted
	)
	--END
	--真正删除1级回复
	DELETE Reply1
	WHERE ID in (
		SELECT ID
		FROM deleted
	)
	--记录空闲ID
	INSERT INTO R_R1ID(ID)
		SELECT ID
		FROM deleted
END
go

--创建：删除Posts表记录触发器
CREATE TRIGGER Delete_Posts
ON Posts
INSTEAD OF DELETE
AS
BEGIN
	--删除对此帖子进行的回复
	DELETE Reply1
	WHERE PID in (
		SELECT ID
		FROM deleted
	)
	--END
	--真正删除帖子
	DELETE Posts
	WHERE ID in (
		SELECT ID
		FROM deleted
	)
	--记录空闲ID
	INSERT INTO R_PID(ID)
		SELECT ID
		FROM deleted
END
go

--创建：删除Account表记录触发器
CREATE TRIGGER Delete_Account
ON Account
INSTEAD OF DELETE
AS
BEGIN
	--删除此账户的所有帖子
	DELETE Posts
	WHERE AID in (
		SELECT ID
		FROM deleted
	)
	--删除此账户的其它1级回复
	DELETE Reply1
	WHERE AID in (
		SELECT ID
		FROM deleted
	)
	--删除此账户的其它2级回复
	DELETE Reply2
	WHERE AID in (
		SELECT ID
		FROM deleted
	)
	--真正删除账户
	DELETE Account
	WHERE ID in (
		SELECT ID
		FROM deleted
	)
	--记录空闲ID
	INSERT INTO R_AID(ID)
		SELECT ID
		FROM deleted
END
go