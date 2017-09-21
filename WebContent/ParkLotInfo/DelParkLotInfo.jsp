<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>删除停车场</title>
</head>
<body bgcolor="#ccd9ff">
	<jsp:useBean id="db" class="bean.DBBean" scope="page" />
	<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=UTF-8");//设置传输编码

	String strparklotname = request.getParameter("parklotname");
	System.out.println("strparklotname="+strparklotname);
	
	String parklotname=new String(strparklotname.getBytes("ISO-8859-1"),"utf-8"); //转码UTF8
	System.out.println("parklotname="+parklotname);
		
		String sql="delete from Parklotinfo where parklotname=" + "'"+parklotname+"'";
		System.out.println("sql="+sql);
		int i = db.executeUpdate(sql);

		if (i == 1) {
			out.println("<script language='javaScript'> alert('删除成功，点击确定后自动跳到主页！');</script>");
			response.setHeader("refresh", "0;url=parklotinfo_index.jsp");
		} else {
			out.println("<script language='javaScript'> alert('删除失败，点击确定后自动跳到主页！');</script>");
			response.setHeader("refresh", "0;url=parklotinfo_index.jsp");
		}
		db.close();
	%>
</body>
</html>