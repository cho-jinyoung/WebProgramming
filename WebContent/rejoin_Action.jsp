<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

		User bbs = new UserDAO().getBbs(userID);
		if(!userID.equals(bbs.getUserID()) )
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'main_page.jsp'");
			script.println("</script>");
		}
		else {
			if( request.getParameter("userName") == null || request.getParameter("userID") == null || request.getParameter("userPassword") == null || request.getParameter("phone") == null || request.getParameter("gender") == null)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else
			{
				UserDAO bbsDAO = new UserDAO();
				int result = bbsDAO.reupdate( request.getParameter("userName"), request.getParameter("userID"), request.getParameter("userPassword"), request.getParameter("phone"), request.getParameter("gender"));
	
				if( result == -1)
				{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('재가입에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else 
				{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('재가입되었습니다.')");
					script.println("location.href = 'main_page.jsp'");
					script.println("</script>");
				}	
			}
		}
	
	%>

</body>
</html>