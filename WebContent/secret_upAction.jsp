<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.diaryDAO" %>
<%@ page import="bbs.diaryBbs" %>
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
	
		String diaryuserID=null;
		if(session.getAttribute("userID") !=null)
		{
			diaryuserID = (String) session.getAttribute("userID");
		}
		if(diaryuserID == null)	
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기를 위해서는 로그인 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int diaryID=0;
		if(request.getParameter("diaryID") != null)
		{
			diaryID = Integer.parseInt(request.getParameter("diaryID"));
		}
		if(diaryID==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href='main_page.jsp'");
			script.println("</script>");
		}
		diaryBbs bbs = new diaryDAO().getBbs(diaryID);
		if(!diaryuserID.equals(bbs.getDiaryuserID()) )
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'main_page.jsp'");
			script.println("</script>");
		}
		else
		{
				if( request.getParameter("diaryTitle") == null || request.getParameter("diaryContent") == null ||
						 request.getParameter("diaryTitle").equals("") || request.getParameter("diaryContent").equals("") ||
						  request.getParameter("diaryW") == null || request.getParameter("diaryW").equals("") )
				{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else
				{
					diaryDAO bbsDAO = new diaryDAO();
					int result = bbsDAO.update(diaryID, request.getParameter("diaryTitle"), diaryuserID, request.getParameter("diaryContent"), request.getParameter("diaryOption"), request.getParameter("diaryW"));
					int op = Integer.parseInt(bbs.getDiaryOption());
					
					if( result == -1)
					{
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('글 수정에 실패하였습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else 
					{
						if( op == 1){
							PrintWriter script=response.getWriter();
							script.println("<script>");
							script.println("location.href = 'open_diary.jsp'");
							script.println("</script>");
						}
						else if ( op == 2) {
							PrintWriter script=response.getWriter();
							script.println("<script>");
							script.println("location.href = 'secret_diary.jsp'");
							script.println("</script>");
						}
						else {
							PrintWriter script=response.getWriter();
							script.println("<script>");
							script.println("alert('오류가 발생하였습니다.')");
							script.println("</script>");
						}
					}
				}
	
		}
		
	
	%>

</body>
</html>