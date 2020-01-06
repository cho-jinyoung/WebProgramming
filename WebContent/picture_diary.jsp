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


<title>YOUR DAY</title>
<div class="col-lg-5">
<a href="main_page.jsp"><h1>YOUR DAY<small>_Picture Diary</small></h1></a>
</div>
</head>
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
</style>
<body>
	<%
		int pageNumber=1;
		if(request.getParameter("pageNumber") != null)
		{
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
<form action="picture_Action.jsp" method="post" >
	<div class="container">
	<div class="row"></div>
		<div class="col-lg-2">
			<ul class="nav nav-pills nav-stacked">    
				<li><a href="today.jsp"><h4>Today</h4></a></li>    
				<li><a href="open_diary.jsp"><h4>Open Diary</h4></a></li>    
				<li><a href="secret_diary.jsp"><h4>Secret Diary</h4></a></li>    
				<li class="active"><a href="picture_diary.jsp"><h4>Picture Diary</h4></a></li>  
				<li><a href="my_account.jsp"><h4>My account</h4></a></li>    
				<li><a href="notice.jsp"><h4>Notice</h4></a></li>  
			</ul>
		</div>
		<div class="col-md-4 col-lg-10">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>No.</th>
					<th>Comment</th>
					<th>Picture</th>
					<th>Id</th>
					<th>Date</th>
					
				</tr>	
			</thead>	
			<tbody>
				<%
					int num=0;
					picDAO bbsDAO = new picDAO();
					ArrayList<picBbs> list = bbsDAO.getList(pageNumber);
					for(int i=0; i< list.size(); i++){
						num++;
				%>
				<tr>
					<td><%= num %></td>
					<td><a href="picture_view.jsp?picId=<%=list.get(i).getPicId()%>"> <%= list.get(i).getPicText() %> </a></td>
					<td><a href="picture_view.jsp?picId=<%=list.get(i).getPicId()%>"> <img src="picture_read.jsp?picId=<%=list.get(i).getPicId()%>" class = "float-left" width="70" onerror="this.src='no_img.jpg'" > </a></td>
					<td><%= list.get(i).getPicuserID() %></td>
					<td><%= list.get(i).getPicDate()%></td>
				</tr>
				<%
					}
				%>
			</tbody>		
		</table>
		<ul class="pager"> 
		<%
			if(pageNumber != 1) {
		%>
			<li class="previous"><a href="picture_diary.jsp?pageNumber=<%=pageNumber-1 %>" >이전</a></li>
			
		<%
			} 
			if(bbsDAO.nextPage(pageNumber+1)) {
		%>
			<li class="next"><a href="picture_diary.jsp?pageNumber=<%=pageNumber+1 %>">다음</a></li>
		<%
			}
		%>
		</ul>
		
		<a href="picture_write.jsp" class="btn btn-default pull-right">글쓰기</a>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>