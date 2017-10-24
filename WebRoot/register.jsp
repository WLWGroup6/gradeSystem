<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="java.sql.*"%>

<!-- 新学生注册界面 -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="x-ua-compatible" content="IE=edge">
<title>新用户注册</title>
<link rel="stylesheet" href="css/register.css" type="text/css"></link>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="css/bootstrap-responsive.css"
	type="text/css"></link>
<style type="text/css">
.input {
	height: 30px;
}
</style>
<script type="text/javascript">
	function validate() {
		var username = document.getElementsByName("username")[0];
		var password = document.getElementsByName("password")[0];
		var repassword = document.getElementsByName("repassword")[0];
		var sex = document.getElementsByName("sex");
		var realname = document.getElementsByName("realname")[0];
		var major = document.getElementsByName("major")[0];

		if (username.value.length < 1||username.value.length > 10) {
			alert("学号为10位以内数字！");

			return false;
		}
		if (realname.value.length < 1) {
			alert("用户名不能为空！");

			return false;
		}

		if (password.value.length < 1) {
			alert("密码不能为空！");

			return false;
		}

		if (repassword.value.length < 1) {
			alert("确认密码不能为空!");
			return false;
		}

		if (realname.value.length < 1) {
			alert("真实姓名不能为空!");
			return false;
		}

		if (sex.value == '') {
			alert("性别必须要选择");

			return false;
		}

		if (major.value.length < 1) {
			alert("专业不能为空！");

			return false;
		}
		if(password.value!=repassword.value){
			alert('两次密码不一致！');
			return flase;
		}
		
		return true;
	}
</script>

</head>
<body class="well">
	<br>
	<br>
	<h1 align="center">新学生注册</h1>
	<br>
	<br>
	<form onsubmit="return validate();" action="AddStudent" method="post">
		<table align="center">
			<tr>
				<td>学　　号：<input style="height: 30px;width: 250px;" type="text"
					name="username" /></td>
			</tr>
			<tr>
				<td>姓　　名：<input style="height: 30px;width: 250px;" type="text"
					name="realname"></td>
			</tr>
			<tr>
				<td>密　　码：<input style="height: 30px;width: 250px;"
					type="password" name="password"></td>
			</tr>
			<tr>
				<td>确认密码 ：<input style="height: 30px;width: 250px;"
					type="password" name="repassword"></td>
			</tr>
			<tr>
				<td>性 　　别： <select style="height: 30px;width: 240px;" id="sex"
					name="sex" class="input">
						<option value="男">男</option>
						<option value='女'>女</option>
				</select></td>
			</tr>
			<tr>
				<td>年 　　级：<input style="height: 30px;width: 250px;" type="text"
					name="year"></td>
			</tr>
			<tr>
				<td>学 　　院：<input style="height: 30px;width: 250px;" type="text"
					name="dept"></td>
			</tr>
			<tr>
				<td>专 　　业：<input style="height: 30px;width: 250px;" type="text"
					name="major"></td>
			</tr>
			<tr>
				<td>班 　　级：<input style="height: 30px;width: 250px;" type="text"
					name="class"></td>
			</tr>
			<tr>
				<td align="center"><input class="btn" type="submit" value="注册">&nbsp;&nbsp;&nbsp;
					<input type="reset" class="btn" value="清空"></td>
			</tr>
		</table>
		<center style="padding-top:10px;">
			<a href="login.jsp">返回登录界面</a>
		</center>
	</form>
</body>
</html>
