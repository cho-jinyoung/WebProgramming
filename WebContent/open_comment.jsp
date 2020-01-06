<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="bbs.diaryBbs" %>
<%@ page import="bbs.diaryDAO" %>
<%@ page import="bbs.comDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="bbs.comBbs" scope="page" />
<jsp:setProperty name="bbs" property="comNum" />
<jsp:setProperty name="bbs" property="comUserID" />
<jsp:setProperty name="bbs" property="comDate" />
<jsp:setProperty name="bbs" property="comText" />

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<%
		int diaryID=0;

		
		if(request.getParameter("diaryID") != null)
		{
			diaryID = Integer.parseInt(request.getParameter("diaryID"));
		}
		
		
		String comUserID=null;
		if(session.getAttribute("userID") !=null)
		{
			comUserID = (String) session.getAttribute("userID");
		}
		
		if(comUserID==null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 댓글 작성이 가능합니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
	    }
		if(bbs.getComText() == null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{	
			comDAO bbsDAO = new comDAO();
			int result = bbsDAO.write( diaryID, comUserID, bbs.getComText());
			

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
				response.sendRedirect("open_view.jsp?diaryID="+diaryID);
			}
		}
%>

</body>
</html>