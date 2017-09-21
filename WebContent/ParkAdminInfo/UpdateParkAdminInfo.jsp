<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.sql.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改编辑后的停车场管理员信息</title>
</head>
<body bgcolor="#ccd9ff">
	<jsp:useBean id="db" class="bean.DBBean" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");

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

		// 		update bookinfo set bookname='数据结构',author='严为民',price='30' where isbn=1

		// 		String sql = "insert into ParkAdminInfo values(" + parkadminid + ",'" + parkadminphone + "',"
		// 					+ parkadminage + ",'" + parkadminidnumber + "','" + parkadminname + "'," + parkadminloginid
		// 					+ ",'" + parkadminloginpass + "','" + parkadminbelong + "')";

		String sql = "update ParkAdminInfo set parkadminid=" + parkadminid + ",parkadminphone=" + "'"+parkadminphone +"'"
				+ ",parkadminage=" + parkadminage + ",parkadminidnumber=" + "'" + parkadminidnumber + "'"
				+ ",parkadminname=" + "'" + parkadminname + "'" 
				+ ",parkadminloginid=" + parkadminloginid + ",parkadminloginpass=" + "'"
				+ parkadminloginpass + "'" + ",parkadminbelong=" + "'" + parkadminbelong + "'"
				+ " where parkadminid=" + parkadminid;
		System.out.println("sql=" + sql);
		int i = db.executeUpdate(sql);
		if (i == 1) {
			out.println("<script language='javaScript'> alert('修改成功，点击确定后自动跳到主页。');</script>");
			response.setHeader("refresh", "0;url=parkadmininfo_index.jsp");
		}
		db.close();
	%>
</body>
</html>