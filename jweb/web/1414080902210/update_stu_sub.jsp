<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,edu.hzu.javaweb.labs.se1414080902210.*"%>
<html>
    <head> <title>提交页面</title> 
    </head>
    <style>
		table{
			margin-left:auto;
			margin-right:auto;
		}
		tr{
			text-align:center;
			bgcolor:cccccc;
		}
		hr{
			width:100%;
  			size:3;
		}
	</style>  
    <body>       
		   请选择修改记录所满足的条件<hr>
          <form  action="Find_Edit" method="post" >          
            <table>
				<tr><td>姓名</td><td><input type="text" name="name"></td></tr>
				<tr><td>性别 </td><td>男<input type="radio" name="sex" value="男" checked="checked">
									  女<input type="radio" name="sex" value="女">
					</td></tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="提交">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="取消">
					</td>
				</tr>
           </table> 
           </form>       
    </body>
</html>
