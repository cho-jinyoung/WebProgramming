<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.picDAO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="bbs.picBbs" scope="page" />
<jsp:setProperty name="bbs" property="picText" />
<jsp:setProperty name="bbs" property="picId" />
<jsp:setProperty name="bbs" property="picFileName" />






<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload to Database Demo</title>
</head>
<body>
	<%
		int picId=0;
		if(request.getParameter("picId") != null)
		{
			picId = Integer.parseInt(request.getParameter("picId"));
		}
		String picuserID=null;
		if(session.getAttribute("userID") !=null)
		{
			picuserID = (String) session.getAttribute("userID");
		}
		picDAO bbsDAO = new picDAO();
		int result;
		if( bbs.getPicText() == null )
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			if( bbs.getPicFileName() == null )
			{
				result = bbsDAO.update( picId, bbs.getPicText(), picuserID);
			}
			else
			{
				//result = bbsDAO.update( picId, bbs.getPicText(), picuserID);
				result = bbsDAO.update( picId, bbs.getPicText(), bbs.getPicFileName(), picuserID);
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
				script.println("location.href = 'picture_diary.jsp'");
				script.println("</script>");
			}	
		}
	%>
</body>
</html>
