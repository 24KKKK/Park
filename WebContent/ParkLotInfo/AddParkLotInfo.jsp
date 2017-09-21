<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.sql.*" %>
<html>
<head>
<title>添加停车场信息</title>
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
	添加停车场信息

	<br />
	<br />
	<br />
	<a href="parklotinfo_index.jsp">返回上一页面</a>

	<form method="post">
		<table>
			<caption>添加停车场信息</caption>
			<tr>
				<th>名字：</th>
				<td><input name="parklotname" type="text"></td>
			</tr>
			<tr>
				<th width="30%">地址：</th>
				<td width="70%"><input name="parklotaddress" type="text"></td>
			</tr>
			<tr>
				<th>车位数量：</th>
				<td><input name="parklotamount" type="text"></td>
			</tr>

			<tr>
				<th>管理员编号：</th>
				<td><select name="parklotadminid" id="parklotadminid"
					style="width: 56%">
						<option value="0" selected="selected"></option>
						<%
							String sql1 = "select parkadminid from Parkadmininfo";
							ResultSet rs1 = db.executeQuery(sql1);
							while (rs1.next()) {
								out.println("<option value=" + rs1.getInt(1) + ">" + rs1.getInt(1) + "</option>");
							}
							rs1.close();
						%>
				</select></td>
			</tr>

<!-- 						<tr> -->
<!-- 							<th>管理员编号：</th> -->
<!-- 							<td><input name="parklotadminid" type="text"></td> -->
<!-- 						</tr> -->
			<tr>
				<th colspan="2"><input type="submit" name="submit" value="添加">
					<input type="reset" value="重置"></th>
			</tr>
		</table>
	</form>

	<%
		request.setCharacterEncoding("UTF-8");
		String submit = request.getParameter("submit");

		if (submit != null && !submit.equals("")) {
			String str_parklotamount = request.getParameter("parklotamount");
			String str_parklotadminid = request.getParameter("parklotadminid");

			int parklotamount = Integer.parseInt(str_parklotamount);
			int parklotadminid = Integer.parseInt(str_parklotadminid);

			String parklotname = request.getParameter("parklotname");
			String parklotaddress = request.getParameter("parklotaddress");

			//先判断表中是否有相同书号的图书，如果有，则添加失败

			String sql = "insert into Parklotinfo values(" + "'" + parklotname + "'" + "," + "'" + parklotaddress
					+ "'" + "," + parklotamount + "," + parklotadminid + ")";
			System.out.println("sql=" + sql);
			int i = db.executeUpdate(sql);
			if (i == 1) {
				out.println("<script language='javaScript'> alert('添加成功,点击确定跳转到主页!');</script>");
				response.setHeader("refresh", "0;url=parklotinfo_index.jsp");
			} else {
				out.println("<script language='javaScript'> alert('添加失败，点击确定返回添加页面！');</script>");
				response.setHeader("refresh", "0;url=AddParkLotInfo.jsp");
			}
			db.close();
		}
	%>
</body>
</html>
