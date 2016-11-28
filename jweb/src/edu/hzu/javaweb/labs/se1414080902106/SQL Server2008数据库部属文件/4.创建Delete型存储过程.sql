use CMSDB
go

--创建：删除2级回复(回复ID)
CREATE PROCEDURE DeleteReply2(@id int)
AS
BEGIN
	--检查存在性
	IF NOT EXISTS (
		SELECT *
		FROM Reply2
		WHERE ID = @id
	)
	BEGIN
		RAISERROR(N'将删除的回复不存在！',15,0)--向用户发送错误消息
		return -1;
	END
	--删除该2级回复
	DELETE Reply2
	WHERE ID = @id
	return 0;
END
go

--创建：删除1级回复(回复ID)
CREATE PROCEDURE DeleteReply1(@id int)
AS
BEGIN
	--检查存在性
	IF NOT EXISTS (
		SELECT *
		FROM Reply1
		WHERE ID = @id
	)
	BEGIN
		RAISERROR(N'将删除的回复不存在！',15,0)--向用户发送错误消息
		return -1;
	END
	--删除该回复
	DELETE Reply1
	WHERE ID = @id
	return 0;
END
go

--创建：删除帖子(帖子ID)
CREATE PROCEDURE DeletePosts(@id int)
AS
BEGIN
	--检查存在性
	IF NOT EXISTS (
		SELECT *
		FROM Posts
		WHERE ID = @id
	)
	BEGIN
		RAISERROR(N'将删除的帖子不存在！',15,0)--向用户发送错误消息
		return -1;
	END
	--删除该帖子
	DELETE Posts
	WHERE ID = @id
	return 0;
END
go

--创建：注销(用户名)
CREATE PROCEDURE DeleteAccount(@username nvarchar(64))
AS
BEGIN
	DECLARE @id int
	--检查存在性
	IF NOT EXISTS (
		SELECT *
		FROM Account
		WHERE Username = @username
	)
	BEGIN
		RAISERROR(N'将注销的账户不存在！',15,0)--向用户发送错误消息	
		return -1;
	END
	--获取ID
	SET @id = (
		SELECT ID
		FROM Account
		WHERE Username = @username
	)
	--删除账户
	DELETE Account
	WHERE Username = @username
	return 0;
END
go