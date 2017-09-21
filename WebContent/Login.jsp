<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>用户登录</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.min.css" rel="stylesheet"
	type="text/css">
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css">
</head>

<body class="templatemo-bg-gray">
	<div class="container">
		<div class="col-md-12">
			<h1 class="margin-bottom-15">用户登录</h1>
			<form name="form1"
				class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30"
				role="form" action="person_judge.jsp" method="post">
				<div class="form-group">
					<div class="col-xs-12">
						<div class="control-wrapper">
							<label for="username" class="control-label fa-label"><i
								class="fa fa-user fa-medium"></i></label> <input type="text"
								class="form-control" id="username" name="username"
								placeholder="用户名">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<div class="control-wrapper">
							<label for="password" class="control-label fa-label"><i
								class="fa fa-lock fa-medium"></i></label> <input type="password"
								class="form-control" id="password" name="password"
								placeholder="密码">
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-12">
						<div class="control-wrapper">
						<center>
							<input type="submit" value="登录" class="btn btn-info"
								onclick="this.form.action='person_judge.jsp';this.form.submit();">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="重置" class="btn btn-info">
<!-- 							<a href="forgot-password.html" class="text-right pull-right">忘记密码?</a> -->
						</center>
						</div>
					</div>
				</div>
				<hr>
			</form>
			<div class="text-center">
<!-- 				<a href="Register.jsp" class="templatemo-create-new">新建账户 <i class="fa fa-arrow-circle-o-right"></i></a> -->
			</div>
		</div>
	</div>
</body>
</html>