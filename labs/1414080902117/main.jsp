<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.util.*,JDBC_package.JDBC_package" errorPage="" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<style type="text/css">
<!--
.STYLE5 {color: #CC3366}
-->
</style>
</head>
<style type="text/css">
body
{
	padding:  0px;
	margin: 0px;
}
div
{
	align : center;
}
.STYLE4 {
	font-size: x-large;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #CC3366;
}
a
{
	text-decoration: none ;
}
</style>
<body>
<table align="center" height="30" width="800">
<tr>
	<td height="30" width="800">
		<iframe src="time.jsp" height="30" width="800" frameborder="0">
		
		</iframe>
	</td>
</tr>
</table>
<table align="center" height="800" width="800">
	<tr>
		<td>
			<table align="center" width="800" height="30">
				<tr>
					<td bgcolor="#FF6666">
						<iframe id="enter" name="enter" src="enter.jsp" width="800" height="30" frameborder="0"></iframe>
					</td>
				</tr>
			</table>
			<table width="800" height="38" align="center" bgcolor=#FFFFFF border="0">
				<tr>
					<td width="270" height="34" class="STYLE4 STYLE5">计算机专业知识交流网</td>
					<td width="140" align="center" bgcolor="#FFFFFF">&nbsp;</td>
				    <td width="72" align="center" bgcolor="#FFFFFF"><a href="main.jsp">首页</a></td>
				    <td width="72" align="center" bgcolor="#FFFFFF"><a href="stuff.jsp">学习工具</a></td>
				    <td width="72" align="center" bgcolor="#FFFFFF"><a href="teach.jsp">素材教程</a></td>
				    <td width="72" align="center" bgcolor="#FFFFFF"><a href="work.jsp">寻找工作</a></td>
				    <td width="72" align="center" bgcolor="#FFFFFF"><a href="talk.jsp">专业论坛</a></td>
				</tr>
			</table>
			<table align="center" width="800" height="200">
				<tr>
					<td height="200"><a href="<%=request.getContextPath()%>/image/moto.png"><img src="<%=request.getContextPath()%>/image/moto.png" width="800" height="197" border="0"></a></td>
				</tr>
		  </table>
		  <table>
		  	<tr>
		  		<td align="center">
		  			<hr />
		  		</td>
		  	</tr>
		  	<tr>
		  		<td align="center"><h4>热门编程工具</h4></td>
		  	</tr>
		  	<tr>
		  		<td align="center">
		  			<hr width="800"/>
		  		</td>
		  	</tr>
		  </table>
		  <table align="center" width="800" height="201" border="1" >
				<tr>
					<td width="50"></td>
					<td width="50" height="30"><a href="" onMouseOver="f_java()">Java</a></td>
					<td width="50"><a href="" onMouseOver="f_VC2010()">VS2010</a></td>
					<td width="50"><a href="" onMouseOver="f_VC()">VC6.0</a></td>
					<td width="50"><a href="" onMouseOver="f_VB()">VB</a></td>
					<td width="80"><a href="" onMouseOver="f_E()">易语言</a></td>
					<td width="80"><a href="" onmouseover="f_R()">R语言</td>
					<td width="50"><a href="" onMouseOver="f_python()">python</a></td>
					<td width="50"><a href="" onMouseOver="f_PHP()">PHP</a></td>
					<td width="50"><a href="" onmouseover="f_js()">JS</td>
					<td width="50"><a href="" onmouseover="f_DW()">DW 8</td>
					<td width="50"><a href="" onmouseover="f_sql()">Sqlserver</td>
					<td width="50"><a href="" onmouseover="f_mysql()">Mysql</td>
					<td width="50"><a href="" onmouseover="f_Oracle()">Oracle</td>
					<td width="50"><a href="" onmouseover="f_masm()">Masm</td>
					<td width="50"></td>
			    </tr>
				<tr><td colspan="10">
				<table align="center" border="0"><tr>
				  <td colspan="10" height="240" width="400" align="center"><img name="img_software" src="<%=request.getContextPath()%>/image/eclipse.jpg" width="400" height="250"></td>
					</tr></table>	
					</td>
					<td colspan="6" align="center">
						<table align="center" border="0" height="240" width="350">
							<tr>
								<td width="80">软件名称:</td>
								<td><input type="text" name="software" id="software" value="eclipse" readonly="true"/></td>
							</tr>
							<tr>
								<td>支持系统:</td>
								<td><input type="text" name="adapt_system" id="adapt_system" value="win7、win8、win10" readonly="true"/></td>
							</tr>
							<tr>
								<td>版本语言:</td>
								<td><input type="text" name="lanaguage" id="lanaguage" value="英文" readonly="true" /></td>
							</tr>
							<tr>
								<td>下载次数:</td>
								<td><input type="text" name="count" id="count" value="50" readonly="true"/></td>
							</tr>
							<tr>
								<td>使用说明:</td>
								<td><a href="" name="introduce">使用说明下载</a></td>
							</tr>
							<tr>
								<td>下载地址:</td>
								<td><a href="" name="download">广东电信地址</td>
							</tr>
						</table>					</td>
			</tr>
				<tr>
					<td colspan="18">
						<hr align="center" width="800"/>					</td>
				</tr>
				<tr>
					<td colspan="18" align="center"><h4>热门教程</h4></td>
				</tr>
				<tr>
					<td colspan="18"><hr width="800"/></td>
				</tr>
				<tr>
				  <td width="50" rowspan="5"><a href="<%=request.getContextPath()%>/image/left.png" onmouseover="f_left()"><img src="<%=request.getContextPath()%>/image/left.png" width="50" onclick="f_left()"/></a></td>
					<td colspan="5" rowspan="5" width="100"><a href="<%=request.getContextPath()%>/image/left.png"><img src="<%=request.getContextPath()%>/image/java_teach.jpg" name="active_img"/></a></td>
					<td width="50" rowspan="5"><a href="<%=request.getContextPath()%>/image/right.png" onmouseover="f_right()"><img src="<%=request.getContextPath()%>/image/right.png"  width="50" onclick="f_right()"/></a></td>
					<td width="50" height="30"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
		    </tr>
				<tr>
				  <td width="50" height="30"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
		    </tr>
				<tr>
				  <td width="50" height="30"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
		    </tr>
				<tr>
				  <td width="50" height="30"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
		    </tr>
				<tr>
				  <td width="50" height="30"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
		    </tr>
				<tr>
				  <td width="50" height="30"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="80"></td>
					<td width="80"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
					<td width="50"></td>
		    </tr>
		  </table>
		  <table align="center" width="800" height="882">
				<tr>
					<td height="876"></td>
				</tr>
		  </table>
		</td>
	</tr>
</table>
</body>
</html>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
<script type="text/javascript">
	function f_java()
	{
		img_software.src ="<%=request.getContextPath()%>/image/eclipse.jpg";
		img_software.width=400;
		img_software.height=250;
		software.value = "eclipse";
		adapt_system.value="win7、win8、win10";
		count.value="50";
		lanaguage.value="英文";
		introduce.href="#";
		download.href="#";
		
	}
	function f_VC2010()
	{
		img_software.src= "<%=request.getContextPath()%>/image/VS2010.jpg";
		img_software.width=400;
		img_software.height=250;
		software.value = "Visal stdio 2010";
		adapt_system.value="win7、win8、win10";
		count.value="52";
		lanaguage.value="中文";
		introduce.href="#";
		download.href="#";
		
	}
	function f_VC()
	{
		img_software.src = "<%=request.getContextPath()%>/image/VC6.0.jpg";
		img_software.width=400;
		img_software.height=250;
		software.value = "VC++ 6.0企业版";
		count.value="53";
		adapt_system.value="win7、win8、win10";
		lanaguage.value="英文";
		introduce.href="#";
		download.href="#";
		
	}
	function f_VB()
	{
		img_software.src = "<%=request.getContextPath()%>/image/VB6.0.jpg";
		img_software.width=400;
		img_software.height=250;
		software.value = "VB6.0";
		adapt_system.value="win7、win8、win10";
		count.value="32";
		lanaguage.value="英文";
		introduce.href="#";
		download.href="#";
		
	}
	function f_E()
	{
		img_software.src = "<%=request.getContextPath()%>/image/E.jpg";
		img_software.width=400;
		img_software.height=250;
		software.value = "易语言";
		adapt_system.value="win7、win8、win10";
		count.value="35";
		lanaguage.value="中文";
		introduce.href="#";
		download.href="#";
		
	}
	function f_R()
	{
		img_software.src = "<%=request.getContextPath()%>/image/R.jpg";
		img_software.width=400;
		img_software.height=250;
		software.value = "R语言";
		adapt_system.value="win7、win8、win10";
		count.value="27";
		lanaguage.value="英文";
		introduce.href="#";
		download.href="#";
		
	}
	function f_python()
	{
		img_software.src = "<%=request.getContextPath()%>/image/python.jpg";
		img_software.width=400;
		img_software.height=250;
		software.value = "python";
		adapt_system.value="win7、win8、win10";
		count.value="29";
		lanaguage.value="英文";
		introduce.href="#";
		download.href="#";
		
	}
	function f_PHP()
	{
		img_software.src = "<%=request.getContextPath()%>/image/PHP.jpg";
		img_software.width=400;
		img_software.height=250;
		software.value = "PHP stdio";
		adapt_system.value="win7、win8、win10";
		count.value="72";
		lanaguage.value="英文";
		introduce.href="#";
		download.href="#";
		
	}
	
	function f_js()
	{
		img_software.src = "<%=request.getContextPath()%>/image/js.jpg";
		img_software.width=400;
		img_software.height=250;
		software.value = "javascript editer";
		adapt_system.value="win7、win8、win10";
		count.value="103";
		lanaguage.value="英文";
		introduce.href="#";
		download.href="#";
		
	}
	function f_DW()
	{
		img_software.src = "<%=request.getContextPath()%>/image/DW.jpg";
		img_software.width=400;
		img_software.height=250;
		software.value = "Dreamweaver 8";
		adapt_system.value="win7、win8、win10";
		count.value="89";
		lanaguage.value="中文";
		introduce.href="#";
		download.href="#";
		
	}
	function f_sql()
	{
		img_software.src = "<%=request.getContextPath()%>/image/sqlserver2008.jpg";
		img_software.width=400;
		img_software.height=250;
		software.value = "sql server 2008";
		count.value="90";
		adapt_system.value="win7、win8、win10";
		lanaguage.value="中文";
		introduce.href="#";
		download.href="#";
		
	}
	function f_mysql()
	{
		img_software.src = "<%=request.getContextPath()%>/image/mysql.jpg";
		img_software.width=400;
		img_software.height=250;
		software.value = "Mysql";
		count.value="57";
		adapt_system.value="win7、win8、win10";
		lanaguage.value="英文";
		introduce.href="#";
		download.href="#";
		
	}
	function f_Oracle()
	{
		img_software.src = "<%=request.getContextPath()%>/image/Oracle.jpg";
		img_software.width=400;
		img_software.height=250;
		software.value = "Oracle";
		count.value="21";
		adapt_system.value="win7、win8、win10";
		lanaguage.value="英文";
		introduce.href="#";
		download.href="#";
		
	}
	function f_masm()
	{
		img_software.src = "<%=request.getContextPath()%>/image/masm.jpg";
		img_software.width=400;
		img_software.height=250;
		software.value = "Masm";
		count.value="67";
		adapt_system.value="win7、win8、win10";
		lanaguage.value="中文";
		introduce.href="#";
		download.href="#";
		
	}
	i=0;
	function f_left()
	{
		if(i==0)
		{
			active_img.src="<%=request.getContextPath()%>/image/java_teach.jpg";
		}
		if(i==1)
		{
			active_img.src="<%=request.getContextPath()%>/image/VC2010_teach.jpg";
		}
		if(i==2)
		{
			active_img.src="<%=request.getContextPath()%>/image/DW_teach.jpg";
			i-=3;
		}
		i++;
	}
	function f_right()
	{
		if(i==2)
		{
			active_img.src="<%=request.getContextPath()%>/image/VC2010_teach.jpg";
		}
		if(i==1)
		{
			active_img.src="<%=request.getContextPath()%>/image/DW_teach.jpg";
		}
		if(i==0)
		{
			active_img.src="<%=request.getContextPath()%>/image/java_teach.jpg";
			i+=3;
		}
		i--;
	}
</script>

<%
/*常用的事件:
onmouseover
onmouseout
onmousemove
onclick
onchange
onfocus
*/
%>