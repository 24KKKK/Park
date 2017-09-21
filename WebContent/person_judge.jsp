<%@page import="java.security.interfaces.RSAKey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>判断用户密码是否正确</title>
</head>
<body>
<jsp:useBean id="db" class="bean.DBBean" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String username = request.getParameter("username");
		
		session.setAttribute("username", username);
		
		String userpass = request.getParameter("password");
//		System.out.println("person_judge界面的用户名和密码："+username+"  "+userpass);

		if (username.equals("admin") && userpass.equals("admin"))
			response.setHeader("refresh", "0;url=admin_index.jsp");
		else {
			String sql = "select * from parkadmininfo where parkadminloginid='" + username + "' and parkadminloginpass='" + userpass
					+ "'";
			ResultSet rs = db.executeQuery(sql);

			int flag = 0;

			while (rs.next()) {
				flag = 1;
				response.setHeader("refresh", "0;url=index.jsp");
			}
			if (flag == 0) {
				out.println("<script language='javaScript'> alert('用户名或密码错误,请重新登录!');</script>");
				response.setHeader("refresh", "0;url=Login.jsp");
			}
			rs.close();
			db.close();
		}
		
	%>
</body>
</html>