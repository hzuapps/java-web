use CMSDB
go

--创建：获取帖子(帖子ID)
CREATE PROCEDURE GetPosts(@id int)
AS
BEGIN
	--检查存在性
	IF NOT EXISTS (
		SELECT *
		FROM Posts
		WHERE ID = @id
	)
	BEGIN
		RAISERROR(N'帖子不存在无法获取！',15,0)--向用户发送错误消息	
		return -1;
	END
	--查询帖子
	SELECT Posts.*,Name
	FROM Posts,Account
	WHERE Posts.ID = @id and Posts.AID = Account.ID
	return 0;
END
go

--创建：获取1级回复(回复ID)
CREATE PROCEDURE GetReply1(@id int)
AS
BEGIN
	--检查存在性
	IF NOT EXISTS (
		SELECT *
		FROM Reply1
		WHERE ID = @id
	)
	BEGIN
		RAISERROR(N'回复不存在无法获取！',15,0)--向用户发送错误消息	
		return -1;
	END
	--查询1级回复
	SELECT *
	FROM Reply1
	WHERE ID = @id
	return 0;
END
go

--创建：获取2级回复(回复ID)
CREATE PROCEDURE GetReply2(@id int)
AS
BEGIN
	--检查存在性
	IF NOT EXISTS (
		SELECT *
		FROM Reply2
		WHERE ID = @id
	)
	BEGIN
		RAISERROR(N'回复不存在无法获取！',15,0)--向用户发送错误消息	
		return -1;
	END
	--查询2级回复
	SELECT *
	FROM Reply2
	WHERE ID = @id
	return 0;
END
go

--创建：获取所有帖子的标题、作者和创建时间，按创建时间从晚到早排序
CREATE PROCEDURE GetAllPosts
AS
BEGIN
	SELECT Posts.ID,Title,Account.ID,Name,CreateDateTime,ReplyCount
	FROM Posts,Account
	WHERE Posts.AID = Account.ID
	ORDER BY CreateDateTime DESC
END
go

--创建：获取某个账户的所有帖子，按创建时间从晚到早排序
CREATE PROCEDURE GetSomePosts(@aid int)
AS
BEGIN
	--检查存在性
	IF NOT EXISTS (
		SELECT *
		FROM Account
		WHERE ID = @aid
	)
	BEGIN
		RAISERROR(N'账户不存在！',15,0)--向用户发送错误消息
		return -1;
	END
	--获取帖子
	SELECT ID,Title,CreateDateTime,ReplyCount
	FROM Posts
	WHERE AID = @aid
	return 0;
END
go

--创建：获取某个帖子的所有回复的内容、作者和创建时间(帖子ID)，按创建时间从早到晚排序
CREATE PROCEDURE GetSomeReply1(@pid int)
AS
BEGIN
	--检查存在性
	IF NOT EXISTS (
		SELECT *
		FROM Posts
		WHERE ID = @pid
	)
	BEGIN
		RAISERROR(N'帖子不存在！',15,0)--向用户发送错误消息	
		return -1;
	END
	--获取回复
	SELECT Reply1.ID,Text,Account.ID,Name,CreateDateTime
	FROM Reply1,Account
	WHERE PID = @pid and AID = Account.ID
	ORDER BY CreateDateTime ASC
	return 0;
END
go

--创建：获取某个1级回复的所有回复的内容、作者和创建时间(1级回复ID)，按创建时间从早到晚排序
CREATE PROCEDURE GetSomeReply2(@rid int)
AS
BEGIN
	--检查存在性
	IF NOT EXISTS (
		SELECT *
		FROM Reply1
		WHERE ID = @rid
	)
	BEGIN
		RAISERROR(N'回复不存在！',15,0)--向用户发送错误消息	
		return -1;
	END
	--获取回复
	SELECT Reply2.ID,Text,Account.ID,Name,CreateDateTime
	FROM Reply2,Account
	WHERE RID = @rid and AID = Account.ID
	ORDER BY CreateDateTime ASC
	return 0;
END
go

--创建：获取账户信息
CREATE PROCEDURE GetAccount(@id int)
AS
BEGIN
	--检查存在性
	IF NOT EXISTS (
		SELECT *
		FROM Account
		WHERE ID = @id
	)
	BEGIN
		RAISERROR(N'账户不存在！',15,0)--向用户发送错误消息
		return -1;
	END
	--获取信息
	SELECT Name
	FROM Account
	WHERE ID = @id
	return 0;
END
go