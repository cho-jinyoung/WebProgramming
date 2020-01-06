<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="bbs.comDAO" %>
<%@ page import="bbs.comBbs" %>
<%@ page import="bbs.diaryBbs" %>
<%@ page import="bbs.diaryDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html>
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
<a href="main_page.jsp"><h1>YOUR DAY<small>_Open diary</small></h1></a>

</div>
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
			script.println("alert('로그인 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		int diaryID=0;
		if(request.getParameter("diaryID") != null)
		{
			diaryID = Integer.parseInt(request.getParameter("diaryID"));
		}
		diaryBbs bbs = new diaryDAO().getBbs(diaryID);
		
		int comID=0;
		if(request.getParameter("comID") != null)
		{
			comID = Integer.parseInt(request.getParameter("comID"));
		}
		comBbs combbs = new comDAO().getBbs(comID);
		
		if(!userID.equals(combbs.getComUserID()) )
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>

	<div class="container">
		<div class="row"></div>
		<div class="col-lg-2">
			<div class="clearfix">
			<div class="pull-left">
			<ul class="nav nav-pills nav-stacked">    
				<li><a href="today.jsp"><h4>Today</h4></a></li>    
				<li class="active"><a href="open_diary.jsp"><h4>Open Diary</h4></a></li>    
				<li><a href="secret_diary.jsp"><h4>Secret Diary</h4></a></li>    
				<li><a href="picture_diary.jsp"><h4>Picture Diary</h4></a></li> 
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
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">Open Diary</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">ID</td>
							<td colspan="2" style="min-height: 20px; text-align:left;"><%=bbs.getDiaryuserID().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td style="width: 20%;">Title</td>
							<td colspan="2" style="min-height: 30px; text-align:left;"><%=bbs.getDiaryTitle().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td style="width: 20%;">Weather</td>
							<td colspan="2" style="min-height: 30px; text-align:left;"><%=bbs.getDiaryW().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td style="width: 20%;">Content</td>
							<td colspan="2" style="min-height: 200px; text-align:left;"><%=bbs.getDiaryContent().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>")%></td>
						</tr>
					</tbody>
				</table>
				<br><br><br>
		<form method="post" action="open_co_upAction.jsp?comID=<%=combbs.getComID()%>&diaryID=<%=bbs.getDiaryID()%>">
			<table class="table table-hover">  
				<tbody>
					<tr>	
						<th>Comment</th><td><input type="text" class="form-control"  name="comText" maxlength="250" value="<%=combbs.getComText() %>"></td>
					</tr>
				</tbody>
			</table>
			<div class="pull-right">
			<input type="submit" class="btn btn-default" value="저장"> </div>
		</form>

	</div>	
</div>

	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>