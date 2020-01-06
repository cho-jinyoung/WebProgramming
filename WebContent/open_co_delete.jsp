<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.comDAO" %>
<%@ page import="bbs.comBbs" %>
<%@ page import="bbs.diaryBbs" %>
<%@ page import="bbs.diaryDAO" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<%
		String userID=null;
		if(session.getAttribute("userID") !=null)
		{
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null)	
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		int diaryID=0;
		if(request.getParameter("diaryID") != null)
		{
			diaryID = Integer.parseInt(request.getParameter("diaryID"));
		}

		int comID=0;
		if(request.getParameter("comID") != null)
		{
			comID = Integer.parseInt(request.getParameter("comID"));
		}
		comBbs bbs = new comDAO().getBbs(comID);
		if(!userID.equals(bbs.getComUserID()) )
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			comDAO comDAO = new comDAO();
			int result = comDAO.delete(comID);
			if( result == -1)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('댓글 삭제에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else 
			{
				PrintWriter script=response.getWriter();
				/*script.println("<script>");
				script.println("alert('댓글이 삭제되었습니다.')");
				script.println("history.back()");
				script.println("</script>");*/
				response.sendRedirect("open_view.jsp?diaryID="+diaryID);
			}	
		}

	%>

</body>
</html>