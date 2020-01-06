<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="bbs.diaryDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="bbs.diaryBbs" scope="page" />
<jsp:setProperty name="bbs" property="diaryTitle" />
<jsp:setProperty name="bbs" property="diaryuserID" />
<jsp:setProperty name="bbs" property="diaryContent" />
<jsp:setProperty name="bbs" property="diaryOption" />
<jsp:setProperty name="bbs" property="diaryW" />

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
		if(bbs.getDiaryTitle() == null || bbs.getDiaryContent() == null || bbs.getDiaryW()==null)
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
			int result = bbsDAO.write(bbs.getDiaryTitle(), diaryuserID, bbs.getDiaryContent(), bbs.getDiaryOption(), bbs.getDiaryW());
			
			int op = Integer.parseInt(bbs.getDiaryOption());
			
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
	%>

</body>
</html>