<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!-- 学生个人信息界面 -->

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
		<form  id = "personInfo"  action="Update" method="get" onsubmit = "alert('修改成功！');">
			<table align="center">
				<tr>
					<td>学  号：<input style="height: 30px;width: 200px;" type="text" value = "${s_no} "
						name="username" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>姓 名：<input style="height: 30px;width: 200px;" type="text" value = "${s_name} "
						name="realname"></td>
				</tr>
				<tr>
					<td>性 别： <select style="height: 30px;width: 200px;" id="sex"
						name="sex" class="input">
							<option value="${s_sex }">${s_sex }</option>
							<option value='${o_sex }'>${o_sex }</option>
					</select></td>
				</tr>
				<tr> 
					<td>年 级：<input style="height: 30px;width: 200px;" type="text" value = "${s_year }"
						name="year"></td>
				</tr>
				<tr>
					<td>学 院：<input style="height: 30px;width: 200px;" type="text" value = "${s_dept }"
						name="dept"></td>
				</tr>
				<tr>
					<td>专 业：<input style="height: 30px;width: 200px;" type="text" value = "${s_major }"
						name="major"></td>
				</tr>
				<tr>
					<td>班 级：<input style="height: 30px;width: 200px;" type="text" value = "${s_class }"
						name="class"></td>
				</tr>
				<tr>
					<td align="center">
						<input  
							onclick = "
								 $('#personInfo').submit(function(){
									 $.ajax({
										 url : 'Update',
										 data : $('#personInfo').serialize(), 
										 type : 'POST',
										 success : function(){
											 
											  ('#left').load('PersonInfo'); 
											  alert('修改成功！');
										 }
										 
									 });
									 return false; 
									 
								 });
								 
							"
						
						
						
						class="btn btn-primary" type="submit" value="修改">&nbsp;&nbsp;&nbsp;
						<input type="reset" class="btn btn-success" value="清空">
					</td>
				</tr>
			</table>
			</form>
	</div>
</body>
</html>
