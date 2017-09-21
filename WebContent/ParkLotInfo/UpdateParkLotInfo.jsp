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
	response.setContentType("text/html;charset=UTF-8");//设置传输编码

		String str_parklotamount = request.getParameter("parklotamount");
		String str_parklotadminid = request.getParameter("parklotadminid");

		int parklotamount = Integer.parseInt(str_parklotamount);
		int parklotadminid = Integer.parseInt(str_parklotadminid);
		
		String parklotname = request.getParameter("parklotname");
		//String parklotname=new String(strparklotname.getBytes("ISO-8859-1"),"utf-8"); //转码UTF8
		String parklotaddress = request.getParameter("parklotaddress");
		//String parklotaddress=new String(strparklotaddress.getBytes("ISO-8859-1"),"utf-8"); //转码UTF8

		String sql = "update Parklotinfo set parklotname=" + "'"+parklotname+"'" + ",parklotaddress=" + "'"+parklotaddress +"'"
				+ ",parklotamount=" + parklotamount + ",parklotadminid="  + parklotadminid +"where parklotname="+"'"+parklotname+"'";
		System.out.println("sql=" + sql);
		int i = db.executeUpdate(sql);
		if (i == 1) {
			out.println("<script language='javaScript'> alert('修改成功，点击确定后自动跳到主页。');</script>");
			response.setHeader("refresh", "0;url=parklotinfo_index.jsp");
		}
		db.close();
	%>
</body>
</html>