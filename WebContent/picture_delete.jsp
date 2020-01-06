<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.picDAO" %>
<%@ page import="bbs.picBbs" %>
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
			script.println("alert('글쓰기를 위해서는 로그인 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int picId=0;
		if(request.getParameter("picId") != null)
		{
			picId = Integer.parseInt(request.getParameter("picId"));
		}
		if(picId==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href='picture_diary.jsp'");
			script.println("</script>");
		}
		picBbs bbs = new picDAO().getBbs(picId);
		if(!userID.equals(bbs.getPicuserID()) )
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'picture_diary.jsp'");
			script.println("</script>");
		}
		else {
			picDAO picDAO = new picDAO();
			int result = picDAO.delete(picId);
			if( result == -1)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else 
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('삭제되었습니다.')");
				script.println("location.href = 'picture_diary.jsp'");
				script.println("</script>");
			}				
		}

	%>

</body>
</html>