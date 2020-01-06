<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.picDAO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="bbs.picBbs" scope="page" />
<jsp:setProperty name="bbs" property="picText" />
<jsp:setProperty name="bbs" property="picFileName" />
<jsp:setProperty name="bbs" property="picuserID" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload to Database Demo</title>
</head>
<body>
	<%
		String picuserID=null;
		if(session.getAttribute("userID") !=null)
		{
			picuserID = (String) session.getAttribute("userID");
		}
		picDAO bbsDAO = new picDAO();
	
		if(bbs.getPicText() == null || bbs.getPicFileName() == null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			
			int result = bbsDAO.write(bbs.getPicText(), bbs.getPicFileName(), picuserID, bbs.getPicNice());			
			if( result == -1)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패하였습니다.')");
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
