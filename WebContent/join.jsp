<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="css/custom.css">

<title>YOUR DAY</title>
<div class="col-lg-5">
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
</style>
<a href="main_page.jsp"><h1>YOUR DAY<small>_Join</small></h1></a>

</div>
</head>
<body>
<form method="post" action="join_Action.jsp"> 
	<div class="container">   
			<div class="row"> 
			
				<div class="col-md-8"  style="background-color: #B2CDD2; ">
				<center><h2>Join</h2></center><br>
				<div class="form-horizontal">
  
				 <div class="form-group">             
					<label for="name" class="col-sm-2 control-label">Name</label>       
					<div class="col-sm-10">     
					<input type="text" class="form-control" name="userName" placeholder="이름을 입력하세요.">
					</div>
					</div>
					
					<div class="form-group">
					<label for="id" class="col-sm-2 control-label">ID</label>       
					<div class="col-sm-10">          
					<input type="text" class="form-control" name="userID" placeholder="아이디를 입력하세요 수정이 불가능합니다.">
					</div>
					</div>
					
					<div class="form-group">
					<label for="password" class="col-sm-2 control-label">Password</label>       
					<div class="col-sm-10">          
					<input type="text" class="form-control" name="userPassword" placeholder="영문 대 소문자, 숫자를 사용하세요.">
					</div>
					</div>
					
					<div class="form-group">
					<label for="phone" class="col-sm-2 control-label">Phone Number</label>       
					<div class="col-sm-10">          
					<input type="text" class="form-control" name="phone" placeholder="핸드폰 번호를 입력하세요.">
					</div>
					</div>
					
					<div class="form-group">
				  	 <label for="gender" class="col-sm-2 control-label"> Gender</label>
				  	 <label class="checkbox-inline">
					 <input type="radio" name="gender" value="Woman" checked>W</label> 
					 <label class="checkbox-inline">
					 <input type="radio" name="gender" value="Man">M</label>
				   	</div>  
				<center>
					<input type="submit" class="btn btn-default" value="Create Account"> <br><br>
         		</center>
		</div>
		</div>
	</div>
</div>
</form>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>