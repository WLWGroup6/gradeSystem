﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 新生注册失败处理 -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="x-ua-compatible" content="IE=edge">
    <base href="<%=basePath%>">
    
    <title>My JSP 'loginFail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 
	<script language="javascript">
		window.alert("登录失败,用户名或密码错误");
		window.location="login.jsp";
	</script> -->
	
	<script type="text/javascript">
		alert('注册失败,该学号已注册！');
		window.location="register.jsp";
	</script>

  </head>
  
  <body>
   	
  </body>
</html>
