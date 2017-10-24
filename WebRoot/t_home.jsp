<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!-- 教师主界面 -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="x-ua-compatible" content="IE=edge">
<base href="<%=basePath%>">

<title>t_home.jsp</title>

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
						<a class="brand" href="t_home.jsp"><c:out value="${name}"></c:out>,欢迎您使用学生成绩管理系统！</a>
						<div style="margin-bottom: 5px;" align="right">
							<br> <br> 
							<button class="btn btn-info" 
								onclick = "$('#left').load('gradeManage.jsp');"
							>管理学生成绩</button> 
							<a href = "bukao.jsp" class="btn btn-danger">补考学生管理</a>
							<a href = "chongxiu.jsp" class="btn btn-danger">重修学生管理</a>
							<button class="btn btn-success" 
								onclick = "$('#left').load('TeacherInfo');"
							>查看个人信息</button> 
							 <button class="btn btn-warning" 
								onclick = "$('#left').load('password_t.jsp');"
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
						<h3>成绩管理</h3>
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




			</div>
			<div  class="span9 well">
				<div>
					<form id = "grade_u" action = "UpdateGrade">
					<table class="table table-hover table-bordered">
 						<thead>
 							<tr>
 								<td width="70px;">选课编号</td>
 								<td width="70px;">课程编号</td>
 								<td width="200px;">课程名称</td>
 								<td>学分</td>
 								<td width="150px;">学生学号</td>
 								<td>学生名</td>
 								<td>考试成绩</td>
 								<td>平时成绩</td>
 								<td>总成绩</td>
 							</tr>
 						</thead>
 						
 						
 						
 						<tbody>
 							<c:forEach var="map" items="${list}">
    							<tr>
    								<td><span class = "s_c_id">${map.get('r_0')}</span><input type = "hidden" name = "s_c_id" value = "${map.get('r_0')}"/></td>
    								
									<td>${map.get('r_1')}</td>
									<td>${map.get('r_2')}</td>						
 									<td>${map.get('r_3')}</td>
 									<td>${map.get('r_4')}</td>
 									<td>${map.get('r_5')}</td>
 									<td><input class="s_c_grade" style="width: 80px;height: 25px;" type = "text" name = "grade" value = "${map.get('r_6')}"></td>
 								<td><input class="s_c_grade" style="width: 80px;height: 25px;" type = "text" name = "pgrade" value = "${map.get('r_7')}"></td>
 								<td>${map.get('r_8')}</td>
 								</tr>
    						</c:forEach>
    					
 						</tbody>
						 						
 						
 						
					</table>
				<div align="right">
					<input 
					onclick = "
								 $('#grade_u').submit(function(){
									 $.ajax({
										 url : 'UpdateGrade',
										 data : $('#grade_u').serialize(), 
										 type : 'POST',
										 success : function(){
											 alert('修改成功！');
										 }
										 
									 });
									 return false; 
									 
								 });
							"
					
					class= "btn btn-primary" type = "submit" value = "提交修改"/> 
					
					
					<input class= "btn btn-success" type = "reset" value = "重置"/>
				</div>					
					</form>
				
				</div>
			</div>
		</div>
	</div>
</body>
</html>
