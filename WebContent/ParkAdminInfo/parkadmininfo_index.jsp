<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name=”viewport” content=”width=device-width, initial-scale=1, maximum-scale=1″>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理停车场管理员界面</title>
<style type="text/css">
table {
	border-collapse: collapse;
	border: none;
	margin: 0px auto;
	font-weight: bold;
	/* 	width: 500px; */
}

th, td {
	border: solid #333 1px;
	height: 20px;
}

div {
	text-align: center;
}
</style>
</head>
<script type="text/javascript">
	function delconfim()
	{
		var a = confirm("确定删除吗?");
		if(a==true)
		{
			return true;
		}
		else
		{
			return false;
		}	
	}
</script>		
<body bgcolor="#ccd9ff">
	管理员登陆成功,你好:
	<%
		Object username = session.getAttribute("username");
		out.println(username);
	%>
	这是停车场管理员信息主界面
	
	<div>
		<a href="../Login.jsp" target="_parent" ><font color=blue>退出并回到首页</font></a>
	</div>
	<p />
	<div>
		<a href="AddParkAdminInfo.jsp"><font color=blue>增加停车场管理员</font></a>
	</div>
	<p />
	<table>
		<tr>
			<td><font color=red>编号</font></td>
			<td><font color=red>电话</font></td>
			<td><font color=red>年龄</font></td>
			<td><font color=red>身份证号</font></td>
			<td><font color=red>姓名</font></td>
			<td><font color=red>登陆账号</font></td>
			<td><font color=red>登陆密码</font></td>
			<td><font color=red>所属停车场</font></td>
			<td><font color=red>操作</font></td>
		</tr>
		<jsp:useBean id="db" class="bean.DBBean" scope="page" />
		<%
			String s = "select * from ParkAdminInfo;";
			ResultSet rs = db.executeQuery(s);
			while (rs.next()) {
				int parkadminid = rs.getInt(1);
				out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3)
						+ "</td><td>" + rs.getString(4) + "</td><td>" + rs.getString(5) + "</td><td>" + rs.getString(6)
						+ "</td><td>" + rs.getString(7) + "</td><td>" + rs.getString(8)
						+ "</td><td><a onclick='return delconfim()' href='DelParkAdminInfo.jsp?parkadminid=" + parkadminid
						+ "'>删除</a>&nbsp;<a href='EditParkAdminInfo.jsp?parkadminid=" + parkadminid
						+ "'>修改</a></td></tr>");
			}
			rs.close();
			db.close();
		%>
	</table>
</body>
</html>