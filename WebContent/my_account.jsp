<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="css/custom.css">


<title>YOUR DAY</title>
<div class="col-lg-5">
<a href="main_page.jsp"><h1>YOUR DAY<small>_My Account</small></h1></a>
</div>
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
		
		User bbs = new UserDAO().getBbs(userID);
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
				<li class="active"><a href="my_account.jsp"><h4>My account</h4></a></li>    
				<li><a href="notice.jsp"><h4>Notice</h4></a></li> 
			</ul>
			</div>
			</div>
		</div>
				<div class="col-md-8"  style="background-color: #B2CDD2; ">
				<center><h2>My Account</h2></center><br>
				<form class="form-horizontal" role="form">    
					<div class="form-group">             
					<label for="name" class="col-sm-4 control-label">Name</label> 
						<div class="col-sm-3">  
						<label><h5><%=bbs.getUserName()%></h5></label>
						</div>
					</div>
					<div class="form-group">
					<label for="id" class="col-sm-4 control-label">ID</label>       
						<div class="col-sm-3">       
						<label><h5><%=bbs.getUserID()%></h5></label>
						</div>
					</div>
					<div class="form-group">
					<label for="password" class="col-sm-4 control-label">Password</label>       
						<div class="col-sm-3">       
						<label><h5><%=bbs.getUserPassword()%></h5></label>
						</div>
					</div>
					<div class="form-group">
					<label for="phone" class="col-sm-4 control-label">Phone Number</label>       
						<div class="col-sm-3">      
						<label><h5><%=bbs.getPhone()%></h5></label> 
						</div>
					</div>
					<div class="form-group">
				  	 <label for="gender" class="col-sm-4 control-label">Gender</label>
					  	 <div class="col-sm-3">  
					  	 <label><h5><%=bbs.getGender()%></h5></label>
					   	 </div>
					</div>
		      	</form>
        
				<div class="col-sm-offset-4 col-sm-8">
				 <a href="my_account_update.jsp"><input type="submit" class="btn btn-default" value="수정"> </a>
				 <a href="my_account_delete.jsp"><input type="submit" class="btn btn-default" value="탈퇴"> </a> <br><br>
         		</div> 
		</div>
</div>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>