<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.sql.*" errorPage="error.jsp"%>
<html>
<head>
<title>添加停车场管理员信息</title>
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
</head>
<body bgcolor="#ccd9ff">
<jsp:useBean id="db" class="bean.DBBean" scope="page" />
	添加停车场管理员信息
	
	<br /><br /><br />
	<a href="parkadmininfo_index.jsp">返回上一页面</a>
	
	<form method="post">
		<table>
			<caption>添加停车场管理员信息</caption>
			<tr>
				<th>编号：</th>
				<td><input name="parkadminid" type="text"></td>
			</tr>
			<tr>
				<th width="30%">电话：</th>
				<td width="70%"><input name="parkadminphone" type="text"></td>
			</tr>
			<tr>
				<th>年龄：</th>
				<td><input name="parkadminage" type="text"></td>
			</tr>
			<tr>
				<th>身份证号：</th>
				<td><input name="parkadminidnumber" type="text"></td>
			</tr>
			<tr>
				<th>姓名：</th>
				<td><input name="parkadminname" type="text"></td>
			</tr>
			<tr>
				<th>登陆账号：</th>
				<td><input name="parkadminloginid" type="text"></td>
			</tr>
			<tr>
				<th>登陆密码：</th>
				<td><input name="parkadminloginpass" type="text"></td>
			</tr>
			
<!-- 			<tr> -->
<!-- 				<th>所属停车场：</th> -->
<!-- 				<td><select name="parkadminbelong" id="parkadminbelong" -->
<!-- 					style="width: 56%"> -->
<%-- 						<option value="<%=rs.getString(8)%>" selected="selected"></option> --%>
						<%
// 							String sql1 = "select parklotname from Parklotinfo";
// 							ResultSet rs1 = db.executeQuery(sql1);
// 							while (rs1.next()) {
// 								out.println("<option value=" + rs1.getString(1) + ">" + rs1.getString(1) + "</option>");
// 							}
// 							rs1.close();
						%>
<!-- 				</select></td> -->
<!-- 			</tr> -->
			
<!-- 			<tr> -->
<!-- 				<th>所属停车场：</th> -->
<!-- 				<td><input name="parkadminbelong" type="text"></td> -->
<!-- 			</tr> -->
			<tr>
				<th colspan="2"><input type="submit" name="submit" value="添加">
					<input type="reset" value="重置"></th>
			</tr>
		</table>
	</form>
<%-- 	<jsp:useBean id="db" class="bean.DBBean" scope="page" /> --%>
	<%
		request.setCharacterEncoding("UTF-8");
		String submit = request.getParameter("submit");

		if (submit != null && !submit.equals("")) {
			String str_parkadminid = request.getParameter("parkadminid");
			String str_parkadminage = request.getParameter("parkadminage");
			String str_parkadminloginid = request.getParameter("parkadminloginid");

			int parkadminid = Integer.parseInt(str_parkadminid);
			int parkadminage = Integer.parseInt(str_parkadminage);
			int parkadminloginid = Integer.parseInt(str_parkadminloginid);

			String parkadminphone = request.getParameter("parkadminphone");
			String parkadminidnumber = request.getParameter("parkadminidnumber");
			String parkadminname = request.getParameter("parkadminname");
			String parkadminloginpass = request.getParameter("parkadminloginpass");
			String parkadminbelong = request.getParameter("parkadminbelong");

			//先判断表中是否有相同书号的图书，如果有，则添加失败

			String sql = "insert into ParkAdminInfo values(" + parkadminid + ",'" + parkadminphone + "',"
					+ parkadminage + ",'" + parkadminidnumber + "','" + parkadminname + "'," + parkadminloginid
					+ ",'" + parkadminloginpass + "','" + "" + "')";
			int i = db.executeUpdate(sql);
			if (i == 1) {
				out.println("<script language='javaScript'> alert('添加成功,点击确定跳转到主页!');</script>");
				response.setHeader("refresh", "0;url=parkadmininfo_index.jsp");
			} else {
				out.println("<script language='javaScript'> alert('添加失败，点击确定返回添加页面！');</script>");
				response.setHeader("refresh", "0;url=AddParkAdminInfo.jsp");
			}
			db.close();
		}
	%>
</body>
</html>
