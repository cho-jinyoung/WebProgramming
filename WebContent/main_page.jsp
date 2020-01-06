<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="css/NewFile.css">
<link rel="stylesheet" href="css/custom.css">


<title>YOUR DAY</title>
<a href="main_page.jsp"><center><h1>YOUR DAY</h1></center><br>
</head>
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
</style>
<body> 
	<%
		String userID=null;
		if(session.getAttribute("userID") !=null)
		{
			userID = (String) session.getAttribute("userID");
			session.setAttribute("userID", userID);
		}
	%>
	<div class="container">   
	<div class="row"> 
		<div class="clearfix">
	<%
		if( userID != null) {
	%>
		<center><h5 class="jg"> <%= userID %> 님<br> 당신의 하루를 기록하세요 ٩( ᐛ )و</h5></center><br>
		<div class="pull-right">
		<a href="logout_Action.jsp"><h3 class="cs">Log out</h3></a>
		</class></div>
	<%
		}
		else{
	%>
		<center><h5 class="jg"><br> 당신의 하루를 기록하세요</h5></center><br>
		<div class="pull-right">
		<a href="login.jsp"><h3 class="cs">Login</h3></a>
		</class></div></div>
	<%
		}
	%>
			<div class="col-md-4"> </div>
			<div class="col-md-4"  style="background-color: #B2CDD2; ">
				<br><center><a href="today.jsp"><h3>To Day</h3></center>
				<center><a href="open_diary.jsp"><h3>Open Diary</h3></center>
				<center><a href="secret_diary.jsp"><h3>Secret Diary</h3></center>
				<center><a href="picture_diary.jsp"><h3>Picture Diary</h3><center>
				<center><a href="my_account.jsp"><h3>My Account</h3></center>
				<center><a href="notice.jsp"><h3>Notice</h3></center><br>
			</div>
	</div>
	</div>
	
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>