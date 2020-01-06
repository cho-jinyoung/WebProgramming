<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
<a href="main_page.jsp"><h1>YOUR DAY<small>_Notice</small></h1></a>

</div>
</head>
<body>
	<%
		String bbsuserID=null;
		if(session.getAttribute("userID") !=null)
		{
			bbsuserID = (String) session.getAttribute("userID");
		}
		if(bbsuserID==null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('수정하기 위해서는 로그인 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int bbsID=0;
		if(request.getParameter("bbsID") != null)
		{
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!bbsuserID.equals(bbs.getBbsuserID()) )
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");
		}
	%>
<form action="notice_upAction.jsp?bbsID=<%=bbsID %>" method="post">
	<div class="container">
		<div class="row"></div>
		<div class="col-lg-2">
			<ul class="nav nav-pills nav-stacked">    
				<li><a href="today.jsp"><h4>Today</h4></a></li>    
				<li><a href="open_diary.jsp"><h4>Open Diary</h4></a></li>    
				<li><a href="secret_diary.jsp"><h4>Secret Diary</h4></a></li>   
				<li><a href="picture_diary.jsp"><h4>Picture Diary</h4></a></li>  
				<li><a href="my_account.jsp"><h4>My account</h4></a></li>    
				<li class="active"><a href="notice.jsp"><h4>Notice</h4></a></li> 
			</ul>
		</div>
		<div class="col-lg-10">
			<table class ="table table-hover">

			
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">NOTICE</th>
						</tr>
					</thead>
					<tbody>
						<tr><td>ID</td><td><%= bbsuserID %></td></tr>
						<tr><td>Title</td><td><input type="text" class="form-control"  name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle()%>"></td></tr>
						<tr><td>Content</td><td><input type="text" class="form-control"  name="bbsContent" maxlength="250" value="<%=bbs.getBbsContent()%>"></textarea></td></tr>
						<tr><td>File</td><td><input type="file" name="bbsFileName" value="<%=bbs.getBbsFileName()%>"/></td></tr>
 

</tbody>
</table>
			<div class="pull-right">
			 <a href="notice.jsp" class="btn btn-default">취소</a>
			 <input type="submit" class="btn btn-primary" value="저장"> </div>
				
	</table>
	</div>
	</div>
	</form>
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>
