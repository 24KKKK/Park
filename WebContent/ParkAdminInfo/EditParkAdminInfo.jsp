<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.sql.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改停车场管理员</title>
</head>
<style type="text/css">
table {
	border-collapse: collapse;
	border: none;
	margin: 0px auto;
	width: 400px;
}

th, td {
	border: solid #333 1px;
	height: 20px;
}

div {
	text-align: center;
}
</style>
<body bgcolor="#ccd9ff">
	<jsp:useBean id="db" class="bean.DBBean" scope="page" />
	<%
		request.setCharacterEncoding("utf-8");

		String str_parkadminid = request.getParameter("parkadminid");
		System.out.println("str_parkadminid=" + str_parkadminid);
		int parkadminid = Integer.parseInt(str_parkadminid);
		System.out.println("parkadminid=" + parkadminid);
		String sql = "select * from ParkAdminInfo where parkadminid=" + parkadminid;
		System.out.println(sql);
		ResultSet rs = db.executeQuery(sql);
		rs.next();
	%>
	<form action="UpdateParkAdminInfo.jsp" method="post">
		<table>
			<caption>修改停车场管理员信息</caption>
			<tr>
				<th>编号：</th>
				<td><input name="parkadminid" type="text" readonly="readonly"
					value="<%=rs.getInt(1)%>">编号不能修改</td>
			</tr>
			<tr>
				<th width="30%">电话：</th>
				<td width="70%"><input name="parkadminphone" type="text"
					value="<%=rs.getString(2)%>"></td>
			</tr>
			<tr>
				<th>年龄：</th>
				<td><input name="parkadminage" type="text"
					value="<%=rs.getInt(3)%>"></td>
			</tr>
			<tr>
				<th>身份证号：</th>
				<td><input name="parkadminidnumber" type="text"
					value="<%=rs.getString(4)%>"></td>
			</tr>
			<tr>
				<th>姓名：</th>
				<td><input name="parkadminname" type="text"
					value="<%=rs.getString(5)%>"></td>
			</tr>
			<tr>
				<th>登陆账号：</th>
				<td><input name="parkadminloginid" type="text"
					value="<%=rs.getInt(6)%>"></td>
			</tr>
			<tr>
				<th>登陆密码：</th>
				<td><input name="parkadminloginpass" type="text"
					value="<%=rs.getString(7)%>"></td>
			</tr>
			<tr>
				<th>所属停车场：</th>
				<td><select name="parkadminbelong" id="parkadminbelong"
					style="width: 200px">
<%-- 						<option value="<%=rs.getString(8)%>" selected="selected"></option> --%>
						<%
							String sql1 = "select parklotname from Parklotinfo";
							ResultSet rs1 = db.executeQuery(sql1);
							while (rs1.next()) {
								out.println("<option value=" + rs1.getString(1) + ">" + rs1.getString(1) + "</option>");
							}
							rs1.close();
						%>
				</select></td>
			</tr>
			<!-- 			<tr> -->
			<!-- 				<th>所属停车场：</th> -->
			<!-- 				<td><input name="parkadminbelong" type="text" -->
			<%-- 					value="<%=rs.getString(8)%>"></td> --%>
			<!-- 			</tr> -->
			<tr>
				<th colspan="2"><input type="submit" value="修改"> <input
					type="reset" value="重置"></th>
			</tr>
		</table>

	</form>
	<%
		rs.close();
		db.close();
	%>
</body>
</html>