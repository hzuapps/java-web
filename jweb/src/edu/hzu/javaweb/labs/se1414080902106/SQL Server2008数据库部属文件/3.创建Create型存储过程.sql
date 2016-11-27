use CMSDB
go

--创建：注册(用户名，密码，昵称)
CREATE PROCEDURE CreateAccount(@username nvarchar(64),@password nvarchar(32),@name nvarchar(256))
AS
BEGIN
	--查空
	IF @username IS NULL or @username = ''
	BEGIN
		RAISERROR(N'用户名不能为空！',15,0)--向用户发送错误消息
		return -1;
	END
	IF @password IS NULL or @password = ''
	BEGIN
		RAISERROR(N'密码不能为空！',15,0)--向用户发送错误消息
		return -1;
	END
	IF @name IS NULL or @name = ''
	BEGIN
		RAISERROR(N'昵称不能为空！',15,0)--向用户发送错误消息
		return -1;
	END
	--判断用户名是否重复
	IF EXISTS (
		SELECT *
		FROM Account
		WHERE Username = @username
	)
	BEGIN
		RAISERROR(N'用户名已存在！',15,0)--向用户发送错误消息
		return -1;
	END
	--获取空闲ID
	DECLARE @id int;
	SET @id = (
		SELECT TOP(1) ID
		FROM R_AID
	)
	--判断是否有空闲ID,若没有则以当前记录数为ID
	IF @id IS NULL
	BEGIN
		SET @id = (
			SELECT COUNT(*)
			FROM Account
		)
	END
	ELSE
	BEGIN
		DELETE R_AID
		WHERE ID = @id
	END
	--插入新记录
	INSERT INTO Account(ID,Username,Password,Name)
	VALUES (@id,@username,@password,@name)
	return 0;
END
go

--创建：发帖(发帖账户ID，标题，内容)
CREATE PROCEDURE CreatePosts(@aid int,@title nvarchar(128),@text nvarchar(max))
AS
BEGIN
	--检查存在性
	IF NOT EXISTS (
		SELECT *
		FROM Account
		WHERE ID = @aid
	)
	BEGIN
		RAISERROR(N'将发帖的账户不存在！',15,0)--向用户发送错误消息	
		return -1;
	END
	--查空
	IF @title IS NULL or @title = ''
	BEGIN
		RAISERROR(N'标题不能为空！',15,0)--向用户发送错误消息
		return -1;
	END	
	IF @text IS NULL or @text = ''
	BEGIN
		RAISERROR(N'内容不能为空！',15,0)--向用户发送错误消息
		return -1;
	END	
	--获取空闲ID
	DECLARE @id int;
	SET @id = (
		SELECT TOP(1) ID
		FROM R_PID
	)
	--判断是否有空闲ID,若没有则以当前记录数为ID
	IF @id IS NULL
	BEGIN
		SET @id = (
			SELECT COUNT(*)
			FROM Posts
		)
	END
	ELSE
	BEGIN
		DELETE R_PID
		WHERE ID = @id
	END
	--插入新记录
	INSERT INTO Posts(ID,AID,Title,Text,CreateDateTime,ReplyCount)
	VALUES (@id,@aid,@title,@text,GETDATE(),0)
	return 0;
END
go

--创建：发表1级回复(发帖账户ID，对应帖子ID，内容)
CREATE PROCEDURE CreateReply1(@aid int,@pid int,@text nvarchar(max))
AS
BEGIN
	--检查存在性
	IF NOT EXISTS (
		SELECT *
		FROM Account
		WHERE ID = @aid
	)
	BEGIN
		RAISERROR(N'用户不存在无法发表回复！',15,0)--向用户发送错误消息	
		return -1;
	END
	IF NOT EXISTS (
		SELECT *
		FROM Posts
		WHERE ID = @pid
	)
	BEGIN
		RAISERROR(N'帖子不存在无法发表回复！',15,0)--向用户发送错误消息	
		return -1;
	END
	--查空
	IF @text IS NULL or @text = ''
	BEGIN
		RAISERROR(N'回复内容不能为空！',15,0)--向用户发送错误消息	
		return -1;		
	END
	--获取空闲ID
	DECLARE @id int;
	SET @id = (
		SELECT TOP(1) ID
		FROM R_R1ID
	)
	--判断是否有空闲ID,若没有则以当前记录数为ID
	IF @id IS NULL
	BEGIN
		SET @id = (
			SELECT COUNT(*)
			FROM Reply1
		)
	END
	ELSE
	BEGIN
		DELETE R_R1ID
		WHERE ID = @id
	END
	--记录1级回复
	INSERT INTO Reply1(ID,AID,PID,Text,CreateDateTime)
	VALUES (@id,@aid,@pid,@text,GETDATE())
	return 0;
END
go

--创建：发表2级回复(发帖账户ID，对应1级回复ID，内容)
CREATE PROCEDURE CreateReply2(@aid int,@rid int,@text nvarchar(max))
AS
BEGIN
	--检查存在性
	IF NOT EXISTS (
		SELECT *
		FROM Account
		WHERE ID = @aid
	)
	BEGIN
		RAISERROR(N'账户不存在无法发表回复！',15,0)--向用户发送错误消息	
		return -1;
	END
	IF NOT EXISTS (
		SELECT *
		FROM Reply1
		WHERE ID = @rid
	)
	BEGIN
		RAISERROR(N'回复不存在无法发表回复！',15,0)--向用户发送错误消息	
		return -1;
	END
	--查空
	IF @text IS NULL or @text = ''
	BEGIN
		RAISERROR(N'回复内容不能为空！',15,0)--向用户发送错误消息	
		return -1;		
	END
	--获取空闲ID
	DECLARE @id int;
	SET @id = (
		SELECT TOP(1) ID
		FROM R_R2ID
	)
	--判断是否有空闲ID,若没有则以当前记录数为ID
	IF @id IS NULL
	BEGIN
		SET @id = (
			SELECT COUNT(*)
			FROM Reply2
		)
	END
	ELSE
	BEGIN
		DELETE R_R2ID
		WHERE ID = @id
	END
	--记录2级回复
	INSERT INTO Reply2(ID,AID,RID,Text,CreateDateTime)
	VALUES (@id,@aid,@rid,@text,GETDATE())
	return 0;
END
go