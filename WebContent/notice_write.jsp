<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
 
<!DOCTYPE html>
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
	%>
<form action="notice_Action.jsp" method="post" >
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
		<div class="col-md-4 col-lg-10">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">NOTICE</th>
						</tr>
					</thead>
					<tbody>
						<tr><td>ID</td><td><%= bbsuserID %></td></tr>
						<tr><td>Title</td><td><input type="text" class="form-control" placeholder="제목을 입력하세요" name="bbsTitle" maxlength="100"></td></tr>
						<tr><td>Content</td><td><textarea class="form-control col-sm-5" placeholder="내용을 입력하세요" name="bbsContent" maxlength="4096" cols=30 rows=20></textarea></td></tr>
						<tr><td>File</td><td><input type="file"  name="bbsFileName"></td></tr>
					</tbody>
			</table>
			<div class="pull-right">
			 <a href="notice.jsp" class="btn btn-default">취소</a>
			 <input type="submit" class="btn btn-primary" value="저장"> </div>
        </div>  	 
	</div>			
</form>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>