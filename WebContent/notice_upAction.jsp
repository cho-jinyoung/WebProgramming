<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>


<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload to Database Demo</title>
</head>
<body>
	<%
		int bbsID=0;
		if(request.getParameter("bbsID") != null)
		{
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		String bbsuserID=null;
		if(session.getAttribute("userID") !=null)
		{
			bbsuserID = (String) session.getAttribute("userID");
		}
		BbsDAO bbsDAO = new BbsDAO();
		int result;
		if( request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			if( request.getParameter("bbsFileName") != null )
			{
				result = bbsDAO.update( bbsID, request.getParameter("bbsTitle"), bbsuserID, request.getParameter("bbsContent"), request.getParameter("bbsFileName"));
			}
			else
			{
				result = bbsDAO.update( bbsID, request.getParameter("bbsTitle"), bbsuserID, request.getParameter("bbsContent"));
			}
			
			
			if( result == -1)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('수정에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else 
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("location.href = 'notice.jsp'");
				script.println("</script>");
			}	
		}
	%>
</body>
</html>
