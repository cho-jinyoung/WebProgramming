<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.picDAO" %>
<%@ page import="bbs.picBbs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>Insert title here</title>
</head>
<body>
<%

		int picId=1;
		picDAO bbsDAO = new picDAO();	
		
		if(request.getParameter("picId") != null)
		{
			picId = Integer.parseInt(request.getParameter("picId"));
		}
		
		int picNice=0;
		if(request.getParameter("picNice") != null)
		{
			picNice = Integer.parseInt(request.getParameter("picNice"));
		}


		String userID=null;
		if(session.getAttribute("userID") !=null)
		{
			userID = (String) session.getAttribute("userID");
		}
		
		picDAO dao = new picDAO();
		int count = dao.nice(picId);

		PrintWriter script=response.getWriter();
		
		response.sendRedirect("picture_view.jsp?picId="+picId);


%>


</body>
</html>