<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.picDAO" %>
<%@ page import="bbs.picBbs" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
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
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
</style>
<a href="main_page.jsp"><h1>YOUR DAY<small>_Picture Diary</small></h1></a>

</div>
</head>

<body>
	
	<%
		String picuserID=null;
		if(session.getAttribute("userID") !=null)
		{
			picuserID = (String) session.getAttribute("userID");
		}
		if(picuserID==null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('수정하기 위해서는 로그인 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int picId=1;
		if(request.getParameter("picId") != null)
		{
			picId = Integer.parseInt(request.getParameter("picId"));
		}
		picDAO bbsDAO = new picDAO();	
		if(picId==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href = 'picture_diary.jsp'");
			script.println("</script>");
		}
		picBbs bbs = new picDAO().getBbs(picId);
		if(!picuserID.equals(bbs.getPicuserID()) )
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'picture_diary.jsp'");
			script.println("</script>");
		}
	%>

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
		<form method="post" action="picture_upAction.jsp?picId=<%=picId%>">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">그림 일기</th>
				</tr>
			</thead>
		
			<tbody>
				<%
					picBbs list = bbsDAO.getBbs(picId);
				%>
				<tr><td>ID</td><td><%=bbs.getPicuserID()%></td></tr>
				<tr><td>Comment</td><td><input type="text" class="form-control"  name="picText" maxlength="250" value="<%=bbs.getPicText()%>"></textarea></td></tr>
				<tr><td>Photo</td><td><input type="file" name="picFileName" value="<%=bbs.getPicFileName()%>"/></td></tr>
 </tbody>
</table>

			<div class="pull-right">
			 <a href="notice.jsp" class="btn btn-default">취소</a>
			 <input type="submit" class="btn btn-primary" value="저장"> </div>
</form>
	</div>	
</div>

	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>