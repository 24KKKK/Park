<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理停车场信息界面</title>
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
	这是停车场信息主界面
	<div>
		<a href="../Login.jsp" target="_parent" ><font color=blue>退出并回到首页</font></a>
	</div>
	<p />
	<div>
		<a href="AddParkLotInfo.jsp"><font color=blue>增加停车场</font></a>
	</div>
	<p />
	
	<table>
		<tr>
			<td><font color=red>停车场名字</font></td>
			<td><font color=red>地址</font></td>
			<td><font color=red>车位数量</font></td>
			<td><font color=red>管理员编号</font></td>
			<td><font color=red>操作</font></td>
		</tr>
		<jsp:useBean id="db" class="bean.DBBean" scope="page" />
		<%
			String s = "select * from Parklotinfo;";
			ResultSet rs = db.executeQuery(s);
			while (rs.next()) {
				String parklotname = rs.getString(1);
				System.out.println("每一个parklotname="+parklotname);
				out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getInt(3)
						+ "</td><td>" + rs.getInt(4) + "</td><td><a onclick='return delconfim()' href='DelParkLotInfo.jsp?parklotname="
						+ rs.getString(1) + "'>删除</a>&nbsp;<a href='EditParkLotInfo.jsp?parklotname=" +  rs.getString(1)
						+ "'>修改</a></td></tr>");
			}
			rs.close();
			db.close();
		%>
	</table>
	
</body>
</html>