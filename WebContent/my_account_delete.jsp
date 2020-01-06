<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
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
		User bbs = new UserDAO().getBbs(userID);
		if(!userID.equals(bbs.getUserID()) ){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 회원입니다.')");
			script.println("location.href='notice.jsp'");
			script.println("</script>");
		}
		UserDAO bbsDAO = new UserDAO();
		
		int result = bbsDAO.delete(userID);
		if( result == -1)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('탈퇴에 실패하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else 
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('탈퇴되었습니다.')");
			session.invalidate();
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}	
	%>

</body>
</html>