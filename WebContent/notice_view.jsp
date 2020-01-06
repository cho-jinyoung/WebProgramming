<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		int bbsID=0;
		if(request.getParameter("bbsID") != null)
		{
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		int bbsCount=0;
		if(request.getParameter("bbsCount") != null)
		{
			bbsCount = Integer.parseInt(request.getParameter("bbsCount"));
		}
		
		BbsDAO bbs1 = new BbsDAO();
		int count = bbs1.count(bbsID);
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
		
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">Notice</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">ID</td>
							<td colspan="2" style="min-height: 20px; text-align:left;"><%=bbs.getBbsuserID().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td style="width: 20%;">Title</td>
							<td colspan="2" style="min-height: 20px; text-align:left;"><%=bbs.getBbsTitle().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td style="width: 20%;">Content</td>
							<td colspan="2" style="min-height: 200px; text-align:left;"><%=bbs.getBbsContent().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>")%></td>
						</tr>
						<tr>
							<td style="width: 20%;">File</td>
							<td> <a href="fileDown.jsp?bbsID=<%=bbs.getBbsID()%>">  <%= bbs.getBbsFileName() %> </a></td>
						</tr>
					</tbody>
				</table>
				<div class="pull-right">
				<a href="notice.jsp" class="btn btn-default">목록</a>
				<a href="notice_update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">수정</a>
				<a onClick="return confirm('정말로 삭제하겠습니까?')" href="notice_delete.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">삭제</a>
				</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>
