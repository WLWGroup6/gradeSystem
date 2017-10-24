<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!-- 教师个人信息界面 -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="x-ua-compatible" content="IE=edge">
<base href="<%=basePath%>">

<title>My JSP 'personInfo.jsp' starting page</title>

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
			<h3>个人信息</h3>
		</center>
		<form  id = "teacherInfo"  action="Update_t" method="get" onsubmit = "alert('修改成功！');">
			<table align="center">
				<tr>
					<td>教工号：<input style="height: 30px;width: 200px;" type="text" value = "${t_no} "
						name="username" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>姓　名：<input style="height: 30px;width: 200px;" type="text" value = "${t_name} "
						name="realname"></td>
				</tr>
				<tr>
					<td>性　别： <select style="height: 30px;width: 195px;" id="sex"
						name="sex" class="input">
							<option value="${t_sex }">${t_sex }</option>
							<option value='${o_sex }'>${o_sex }</option>
					</select></td>
				</tr>
				<tr>
					<td>学　院：<input style="height: 30px;width: 200px;" type="text" value = "${t_dept }"
						name="dept"></td>
				</tr>
				<tr>
					<td align="center">
						<input  
							onclick = "
								 $('#teacherInfo').submit(function(){
									 $.ajax({
										 url : 'Update_t',
										 data : $('#teacherInfo').serialize(), 
										 type : 'POST',
										 success : function(){
											 ('#left').load('TeacherInfo');
										 }
										 
									 });
									 return false; 
									 
								 });
								 
							"
						
						
						
						class="btn" type="submit" value="修改">&nbsp;&nbsp;&nbsp;
						<input type="reset" class="btn" value="清空">
					</td>
				</tr>
			</table>
			</form>
	</div>
</body>
</html>
