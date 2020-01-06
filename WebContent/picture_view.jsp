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
		int picId=1;
		picDAO bbsDAO = new picDAO();	
		
		if(request.getParameter("picId") != null)
		{
			picId = Integer.parseInt(request.getParameter("picId"));
		}
	%>

	<div class="container">
		<div class="row"></div>
		<div class="col-lg-2">
			<div class="clearfix">
			<div class="pull-left">
			<ul class="nav nav-pills nav-stacked">    
				<li><a href="today.jsp"><h4>Today</h4></a></li>    
				<li><a href="open_diary.jsp"><h4>Open Diary</h4></a></li>    
				<li><a href="secret_diary.jsp"><h4>Secret Diary</h4></a></li>    
				<li class="active"><a href="picture_diary.jsp"><h4>Picture Diary</h4></a></li> 
				<li><a href="my_account.jsp"><h4>My account</h4></a></li>    
				<li><a href="notice.jsp"><h4>Notice</h4></a></li> 
			</ul>
			</div>
			</div>
		</div>
		<div class="col-md-4 col-lg-10">
		
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">Picture Diary</th>
						</tr>
					</thead>
					<tbody>
					<%
						picBbs list = bbsDAO.getBbs(picId);
					%>
						<tr><td>ID</td><td><%= list.getPicuserID() %></td></tr>
						<tr><td>Photo</td><td><img src="picture_read.jsp?picId=<%=list.getPicId()%>" onerror="this.src='no_img.jpg'" ></td></tr>
						<tr><td>Comment</td><td><%= list.getPicText() %></td></tr>
					</tbody>		
		</table>
		<a href="picture_nice.jsp?picId=<%=list.getPicId() %>" class="btn btn-default">❤️</a>
		<%= list.getPicNice() %>
		
	</div>

	<div class="pull-right">
		<a href="picture_diary.jsp" class="btn btn-default">목록</a>
		<a href="picture_update.jsp?picId=<%=list.getPicId() %>" class="btn btn-primary">수정</a>
		<a onClick="return confirm('정말로 삭제하겠습니까?')" href="picture_delete.jsp?picId=<%=list.getPicId() %>" class="btn btn-primary">삭제</a>		
	</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>