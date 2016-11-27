use CMSDB
go

--创建：登录(用户名，密码)，成功返回账户ID，失败返回-1
CREATE PROCEDURE Login(@username nvarchar(64),@password nvarchar(32))
AS
BEGIN
	--检查存在性
	DECLARE @aid int;
	SET @aid = (
		SELECT ID
		FROM Account
		WHERE Username = @username
	)
	IF @aid IS NULL
	BEGIN
		RAISERROR(N'账户不存在！',15,0)--向用户发送错误消息	
		return -1;
	END
	--检查密码是否正确
	IF @password = (
		SELECT Password
		FROM Account
		WHERE ID = @aid
	)
	BEGIN
		--以查询结果的方式返回结果
		SELECT ID,Name
		FROM Account
		WHERE ID = @aid
		return @aid;
	END
	RAISERROR(N'密码错误！',15,0)--向用户发送错误消息	
	return -1;
END