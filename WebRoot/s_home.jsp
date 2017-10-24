<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!-- 学生主界面 -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="x-ua-compatible" content="IE=edge">
<base href="<%=basePath%>">

<title>s_home.jsp</title>

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="css/bootstrap-responsive.css"
	type="text/css"></link>
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>	
<script src="js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
	<div class="container-fluid well">
		<div class="row-fluid">
			<div id="top" class="span12">
				<div class="navbar">
					<div class="navbar-inner">
						<a class="brand" href="s_home.jsp"><c:out value="${name}"></c:out>,欢迎您使用学生成绩管理系统！</a>
						<div style="margin-bottom: 5px;" align="right">
							<br> <br> 
							<button class="btn btn-info" 
								onclick = "$('#left').load('gradeQuery.jsp');"
							>查询成绩</button> 
							<button class="btn btn-success" 
								onclick = "$('#left').load('PersonInfo');"
							>查看个人信息</button> 
							  <button class="btn btn-warning" 
								onclick = "$('#left').load('password_s.jsp');"
							>密码修改</button>  
							<a href = "Logout" class="btn btn-danger">退出系统</a>
						</div>
					</div>
				</div>



			</div>
		</div>









		<div class="row-fluid">
			<div id = "left" class="span3 well">
				<div>
						<center>
						<h3>成绩查询</h3>
					</center>
					<form action = "Query_s" method = "POST">
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
									<input placeholder = "选择全部" style="width: 200px;height: 30px;" type = "text" name = "course"/>
								</td>
							</tr>
						
						
						
							<tr>
								<td>
									<center>
										<input class="btn btn-primary" type="submit" value="查询"> &nbsp;&nbsp;<input class= "btn btn-success"
											type="reset" value="清空">
									</center>
								</td>
							</tr>

						</table>
					</form>

				</div>




			</div>
			<div  class="span9 well">
				<div>
					<table class="table table-bordered table-striped">
 						<thead>
 							<tr>
 								<td width="100px;">课程编号</td>
 								<td width="200px;">课程名称</td>
 								<td>考试成绩</td>
 								<td>授课老师</td>
 								<td>学分</td>
 								<td>平时成绩</td>
 								<td>总成绩</td>
 							</tr>
 						</thead>
 						
 						
 						<tbody>
 							<c:forEach var="map" items="${list}">
    							<tr>
									<td>${map.get('r_1')}</td>
									<td>${map.get('r_2')}</td>						
 									<td>${map.get('r_3')}</td>
 									<td>${map.get('r_4')}</td>
 									<td>${map.get('r_5')}</td>
 									<td>${map.get('r_6')}</td>
 									<td>${map.get('r_7')}</td>
 								</tr>
    						
    						</c:forEach>
 						
 						
 						</tbody>
 						
 						
 						
					</table>				
				
				
				</div>
			</div>
		</div>
	</div>
</body>
</html>
