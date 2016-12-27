<%@ page language="java" contentType="text/html; charset="ISO-8859-1" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3><center>欢迎你，已成功登录贩卖机管理系统</center></h3>

<form action="success.jsp" method="post">

<p>现在你可以对以下商品进行更新：</p>
<select>
<c:if test="${number>=0&&number<=10} }">现在需要增加矿泉水的数量：</c:if>
<option>5瓶</option>
<option>10瓶</option>
<option>15瓶</option>
<option>20瓶</option>
</select>
<c:if test="${number>=20}">现在的矿泉水数量充足，不需要增加</c:if>

<select>
<c:if test="${number>=0&&number<=10}">现在需要增加宝矿力饮品的数量：</c:if>
<option>5瓶</option>
<option>10瓶</option>
<option>15瓶</option>
<option>20瓶</option>
</select>
<c:if test="${number>=20}">现在的宝矿力饮品数量充足，不需要增加</c:if>

<select>
<c:if test="${number>=0&&number<=10}">现在需要增加加多宝饮品的数量：</c:if>
<option>5瓶</option>
<option>10瓶</option>
<option>15瓶</option>
<option>20瓶</option>
</select>
<c:if test="${number>=20}">现在的加多宝饮品数量充足，不需要增加</c:if>

<select>
<c:if test="${number>=0&&number<=10}">现在需要可乐饮品的数量：</c:if>
<option>5瓶</option>
<option>10瓶</option>
<option>15瓶</option>
<option>20瓶</option>
</select>
<c:if test="${number>=20}">现在的可乐饮品数量充足，不需要增加</c:if>

<select>
<c:if test="${number>=0&&number<=10}">现在需要增加雪碧饮品的数量：</c:if>
<option>5瓶</option>
<option>10瓶</option>
<option>15瓶</option>
<option>20瓶</option>
</select>
<c:if test="${number>=20}">现在的雪碧饮品数量充足，不需要增加</c:if>

<select>
<c:if test="${number>=0&&number<=10}">现在需要增加果粒橙饮品的数量：</c:if>
<option>5瓶</option>
<option>10瓶</option>
<option>15瓶</option>
<option>20瓶</option>
</select>
<c:if test="${number>=20}">现在的果粒橙饮品数量充足，不需要增加</c:if>

<select>
<c:if test="${number>=0&&number<=10}">现在需要增加芬达饮品的数量：</c:if>
<option>5瓶</option>
<option>10瓶</option>
<option>15瓶</option>
<option>20瓶</option>
</selcet>
<c:if test="${number>=20}">现在的芬达饮品数量充足，不需要增加</c:if>

<select>
<c:if test="${number>=0&&number<=10}">现在需要增加咖啡饮品的数量：</c:if>
<option>5瓶</option>
<option>10瓶</option>
<option>15瓶</option>
<option>20瓶</option>
</select>
<c:if test="${number>=20}">现在的咖啡饮品充足，不需要增加</c:if>
<p>
<input type="submit" name="以修改" value="确认修改" >
</p>
</form>
</body>
</html>