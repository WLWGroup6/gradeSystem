<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 教师密码修改界面 -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="x-ua-compatible" content="IE=edge">
    <base href="<%=basePath%>">
    
    <title>My JSP 'password_s.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>	
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function check(){
		
		var oldpassword = $('#oldpassword').val();
		var newpassword = $('#newpassword').val();
		var repassword = $('#repassword').val();
		
		if(newpassword!=repassword){
			alert("两次密码不一致，请重新输入！");
			return false;
		}
		
		return true;
	}

</script>



  </head>
  
  <body>
    <center>
			<h3>密码修改</h3>
		</center>
		<form  id = "password"  action="Password_t"  onsubmit = "return check();">
			<table align="center">
				<tr>
					<td>原密码　：<input style="height: 30px;width: 180px;" type="password"  id = "oldpassword"
						name="oldpassword"/></td>
				</tr>
				<tr>
					<td>新密码　：<input style="height: 30px;width: 180px;" type="password"  id = "newpassword"
						name="password"></td>
				</tr>
				<tr>
					<td>密码确认：<input style = "height: 30px;width: 180px;" type = "password"  id = "repassword"
						name = "repassword"></td>
				</tr>
				
				<tr>
					<td align="center">
						<input  
						class="btn btn-primary" type="submit" value="修改">&nbsp;&nbsp;&nbsp;
						<input type="reset" class="btn btn-success" value="重置">
					</td>
				</tr>
			</table>
			</form>
  </body>
</html>
 <!-- $('#personInfo').submit(function(){
									 $.ajax({
										 url : 'Passowrd',
										 data : $('#password').serialize(), 
										 type : 'POST',
										 success : function(){
											 
											  ('#left').load('Password'); 
											  alert('修改成功！');
										 }
										 
									 });
									 return false; 
									 
								 });
								  -->
