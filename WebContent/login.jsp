<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>YOUR DAY</title>
<center><h1>YOUR DAY</h1><br><p class="jg">당신의 하루를 기록하세요<p></center>
<br><br><br>
<style type="text/css">
	a, a:hover {
		color: #4C4C4C;
		text-decoration: none;
	}
</style>
</head>

<body BGCOLOR="#cbd8de">

	<div class="container">   
		<div class="row"> 
		<div class="col-md-4"> </div>
		<div class="col-md-4"  style="background-color: #B2CDD2; ">
		<br><center><h2>Login</h2></center>	<br><br>
		<form class="form-horizontal" role="form" method="post" action="login_Action.jsp">    <div class="form-group">             
			<label for="ID" class="col-sm-3 control-label"><p class="jg">ID</p></label>       
			<div class="col-sm-8">     
			<input type="text" class="form-control" name="userID" placeholder="Enter ID">
			</div>
		</div>	
			<div class="form-group">
		<label for="Password" class="col-sm-3 control-label"><p class="jg">Password</p></label>       
			<div class="col-sm-8">     
			<input type="password" class="form-control" name="userPassword" placeholder="Enter Password">
			</div>
		</div>		
			<center>
			<input type="submit" class="btn" value="sign in"><br><br>
			<a href="join.jsp"><input type="button" class="btn" value="Join"></a>
			</center> <br>
		</form>
		</div>
	</div>
	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>