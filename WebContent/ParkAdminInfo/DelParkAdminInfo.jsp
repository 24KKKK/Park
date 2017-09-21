<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>删除停车场管理员</title>
</head>
<body bgcolor="#ccd9ff">
	<jsp:useBean id="db" class="bean.DBBean" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");

		String str_parkadminid = request.getParameter("parkadminid");
		int parkadminid = Integer.parseInt(str_parkadminid);
		String str_del="delete from ParkAdminInfo where parkadminid=" + parkadminid;
		System.out.println(str_del);
		int i = db.executeUpdate(str_del);

		if (i == 1) {
			out.println("<script language='javaScript'> alert('删除成功，点击确定后自动跳到主页！');</script>");
			response.setHeader("refresh", "0;url=parkadmininfo_index.jsp");
		} else {
			out.println("<script language='javaScript'> alert('删除失败，请先删除相应停车场信息！');</script>");
			response.setHeader("refresh", "0;url=parkadmininfo_index.jsp");
		}
		db.close();
	%>
</body>
</html>