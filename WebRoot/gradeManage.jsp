<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 教师登陆后成绩管理界面 -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="x-ua-compatible" content="IE=edge">
    <base href="<%=basePath%>">
    
    <title>My JSP 'grade_query.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <div>
					<center>
						<h3>成绩查询</h3>
					</center>
					<form action = "Query_t" method = "POST">
						<table>
							<tr>
								<td>学年：
									<select name = "year" style="width: 200px;height: 30px;">
										<option value = "">选择全部</option>
										<option value="2007-2008">2007-2008</option>
										<option value="2008-2009">2008-2009</option>
										<option value="2009-2010">2009-2010</option>
										<option value="2010-2011">2010-2011</option>
										<option value="2011-2012">2011-2012</option>
										<option value="2012-2013">2012-2013</option>
										<option value="2013-2014">2013-2014</option>
										<option value="2014-2015">2014-2015</option>
										<option value="2015-2016">2015-2016</option>
									</select> 
								</td>
							</tr>
							<tr>
								<td>学期：
									<select name = "term" style="width: 200px;height: 30px;"> 
										<option value = "">选择全部</option>
										<option value = "1">1</option>
										<option value = "2">2</option>
									</select>	
								</td>
							</tr>
							<tr>
								<td>课程：
									<input value="" placeholder = "选择全部" style="width: 200px;height: 30px;" type = "text" name = "course"/>
								</td>
							</tr>
							<tr>
								<td>专业：
									<input value="" placeholder = "选择全部" style="width: 200px;height: 30px;" type = "text" name = "major"/>
								</td>
							</tr>
							<tr>
								<td>班级：
									<input value="" placeholder = "选择全部" style="width: 200px;height: 30px;" type = "text" name = "s_class"/>
								</td>
							</tr>
						
							<tr>
								<td>
									<center>
										<input  class="btn btn-primary" type="submit" value="查询"> &nbsp;&nbsp;<input class= "btn btn-success"
											type="reset" value="清空">
									</center>
								</td>
							</tr>

						</table>
					</form>

				</div>
  </body>
</html>
