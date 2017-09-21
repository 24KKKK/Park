<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改停车场</title>
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
		request.setCharacterEncoding("utf-8");//设置网页编码
		response.setContentType("text/html;charset=UTF-8");//设置传输编码

		String strparklotname = request.getParameter("parklotname");//这里接收过来之后，username是乱码
		System.out.println("strparklotname="+strparklotname);
		
		String parklotname=new String(strparklotname.getBytes("ISO-8859-1"),"utf-8"); //转码UTF8，到这里才变成中文
		System.out.println("parklotname="+parklotname);
		
		String sql = "select * from Parklotinfo where parklotname=" + "'"+parklotname+"'";
		System.out.println(sql);
		ResultSet rs = db.executeQuery(sql);
		rs.next();
	%>
	<form action="UpdateParkLotInfo.jsp" method="post">
		<table>
			<caption>修改停车场信息</caption>
			<tr>
				<th>名字：</th>
				<td><input name="parklotname" type="text" readonly="true"
					value="<%=rs.getString(1)%>"></td>
			</tr>
			<tr>
				<th width="30%">地址：</th>
				<td width="70%"><input name="parklotaddress" type="text"
					value="<%=rs.getString(2)%>"></td>
			</tr>
			<tr>
				<th>停车位数量：</th>
				<td><input name="parklotamount" type="text"
					value="<%=rs.getInt(3)%>"></td>
			</tr>
			<tr>
				<th>管理员编号：</th>
				<td><select name="parklotadminid" id="parklotadminid"
					style="width: 200px">
						<option value="<%=rs.getInt(4)%>" selected="selected"></option>
						<%
							String sql1 = "select * from Parklotinfo";
							ResultSet rs1 = db.executeQuery(sql1);
							while (rs1.next()) {
								out.println("<option value=" + rs1.getInt(4) + ">" + rs1.getInt(4) + "</option>");
							}
							rs1.close();
						%>
				</select></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th>管理员编号：</th> -->
<!-- 				<td><input name="parklotadminid" type="text" -->
<%-- 					value="<%=rs.getInt(4)%>"></td> --%>
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