<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>YOUR DAY</title>
<div class="col-lg-5">
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
</style>
<a href="main_page.jsp"><h1>YOUR DAY<small>_Notice</small></h1></a>
</div>
</head>
<body>

	<%
		int pageNumber=1;
		if(request.getParameter("pageNumber") != null)
		{
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		String userID=null;
		if(session.getAttribute("userID") !=null)
		{
			userID = (String) session.getAttribute("userID");
			session.setAttribute("userID", userID);
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
				<li><a href="picture_diary.jsp"><h4>Picture Diary</h4></a></li>  
				<li><a href="my_account.jsp"><h4>My account</h4></a></li>    
				<li class="active"><a href="notice.jsp"><h4>Notice</h4></a></li> 
			</ul>
			</div>
			</div>
		</div>

	<div class="col-md-4 col-lg-10">
	<table class="table table-hover">
			<thead>
				<tr>
					<th>No.</th>
					<th>Title</th>
					<th>Id</th>
					<th>Date</th>
					<th>Hits</th>
				</tr>	
			</thead>	
			<tbody>
				<%
					int num=0;
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for(int i=0; i< list.size(); i++){
						num++;
					
				%>
				<tr>
					<td><%= num %></td> 
					<td><a href="notice_view.jsp?bbsID=<%=list.get(i).getBbsID()%>"> <%= list.get(i).getBbsTitle() %> </a></td>
					<td><%= list.get(i).getBbsuserID() %></td>
					<td><%= list.get(i).getBbsDate()%></td>
					<td><%= list.get(i).getBbsCount() %></td>
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
				<li class="previous"><a href="notice.jsp?pageNumber=<%=pageNumber-1 %>">이전</a></li>
			<%
				} 
				if(bbsDAO.nextPage(pageNumber+1)) {
			%>
				<li class="next"><a href="notice.jsp?pageNumber=<%=pageNumber+1 %>">다음</a></li>
			<%
				}
			%>
		</ul>
		<a href="notice_write.jsp" class="btn btn-default pull-right">글쓰기</a>
			<br><br>
 
		</div>
	</div> 
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>