<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.diaryBbs" %>
<%@ page import="bbs.diaryDAO" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
 <link rel="stylesheet" href="css/custom.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
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
<a href="main_page.jsp"><h1>YOUR DAY<small>_Secret diary</small></h1></a>

</div>
</head>
<body>
	<%
		String diaryuserID=null;
		if(session.getAttribute("userID") !=null)
		{
			diaryuserID = (String) session.getAttribute("userID");
		}
		if(diaryuserID==null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('수정하기 위해서는 로그인 하세요.')");
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
			script.println("location.href = 'secret_diary.jsp'");
			script.println("</script>");
		}
		diaryBbs bbs = new diaryDAO().getBbs(diaryID);
		if(!diaryuserID.equals(bbs.getDiaryuserID()) )
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'secret_diary.jsp'");
			script.println("</script>");
		}
	%>

	<div class="container">
		<div class="row"></div>
		<div class="col-lg-2">
			<ul class="nav nav-pills nav-stacked">    
				<li><a href="today.jsp"><h4>Today</h4></a></li>    
				<li><a href="open_diary.jsp"><h4>Open Diary</h4></a></li>    
				<li class="active"><a href="secret_diary.jsp"><h4>Secret Diary</h4></a></li>   
				<li><a href="picture_diary.jsp"><h4>Picture Diary</h4></a></li>  
				<li><a href="my_account.jsp"><h4>My account</h4></a></li>    
				<li><a href="notice.jsp"><h4>Notice</h4></a></li> 
			</ul>
		</div>
		<div class="col-lg-10">
			<table class ="table table-hover">
		
			<form action="secret_upAction.jsp?diaryID=<%=diaryID %>" method="post">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">오늘의 일기</th>
						</tr>
					</thead>
					<tbody>
						<tr><td>ID</td><td><%=bbs.getDiaryuserID()%></td></tr>
						<tr><td>Weather</td><td><input type="text" class="form-control"  name="diaryW" maxlength="50" value="<%=bbs.getDiaryW()%>"></td></tr>
						<tr><td>Title</td><td><input type="text" class="form-control" name="diaryTitle" maxlength="100" value="<%=bbs.getDiaryTitle()%>"></td></tr>
						<tr><td>Content</td><td><input type="text" class="form-control"  name="diaryContent" maxlength="4096" value="<%=bbs.getDiaryContent()%>"></td></tr>
						<tr><td>POST</td><td>
						<label class="checkbox-inline">       
				   		<input type="radio" name="diaryOption" value="1">	Open Diary</label>    
				   		<label class="checkbox-inline">       
				   		<input type="radio" name="diaryOption" value="2" checked>	Secret Diary</label>   
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="확인">
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>
