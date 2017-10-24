<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 登陆界面 -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="x-ua-compatible" content="IE=edge">
  
    <title>用户登录</title>
    <link rel="stylesheet" href="css/login.css" type="text/css"></link>
  	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
  	<link rel="stylesheet" href="css/bootstrap-responsive.css" type="text/css"></link>
       <script type="text/javascript">
    
    function validate()
    {
    	var username = document.getElementsByName("username")[0];
    	var password = document.getElementsByName("password")[0];
    	var role = document.getElementsByName("role")[0];    	
    	
    	if(username.value.length < 1)
    	{
    		alert("学号/教工号不能为空！");
    		
    		return false;
    	}
    	
    	if(password.value.length < 1)
    	{
    		alert("密码不能为空！");
    		
    		return false;
    	}
    	
    	if(role.value==-1){
    		alert("请选择用户角色！");
    		return false;
    	}
    	
    	return true;
    }
     
    
   </script> 	
    	
  </head>
  <body class= "well"> 
  <div id = "main" >
  <br><br>
   		<h1 align = "center">成绩管理系统登录</h1>
   		<br><br>
   		<form action = "Login" method = "post" onsubmit = "return validate();">
   			<table  align = "center" >
   				<tr><td><input id="name" placeholder = "请输入学号/教工号" type = "text" name = "username"/></td></tr>
   				<tr><td><input id="password" placeholder = "请输入密码" type = "password" name = "password"></td></tr>
 				<tr>
 				<td>
   				<select  id = "role"  name="role">
   					<option value="-1">请选择角色</option>
          			<option value='1'>学生</option>
          			<option value='0'>老师</option>
          		</select></td></tr>
          			
   				<tr><td align = "center"><input  class = "btn"type = "submit" value = "登录">&nbsp;&nbsp;&nbsp;
   				<input class= "btn" type = "reset" value = "清空"></td></tr>
   			</table>
   				<center style="padding-top:10px;"><a href = "register.jsp">注册用户</a></center>
   		</form>
   	</div>
  </body>
</html>
