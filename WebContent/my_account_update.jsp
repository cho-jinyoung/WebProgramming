<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter" %>
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
<a href="main_page.jsp"><h1>YOUR DAY<small>_My Account</small></h1></a>

</div>
</head>
<body>
	<%
		String userID=null;
		if(session.getAttribute("userID") !=null)
		{
			userID = (String) session.getAttribute("userID");
			session.setAttribute("userID", userID);
		}
		User bbs = new UserDAO().getBbs(userID);
		if(userID==null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('수정하기 위해서는 로그인 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
	%>
<form action="my_account_upAction.jsp?userID=<%=userID %>" method="post">
	<div class="container">
		<div class="row"></div>
		<div class="col-lg-2">
			<ul class="nav nav-pills nav-stacked">    
				<li><a href="today.jsp"><h4>Today</h4></a></li>    
				<li><a href="open_diary.jsp"><h4>Open Diary</h4></a></li>    
				<li><a href="secret_diary.jsp"><h4>Secret Diary</h4></a></li>   
				<li><a href="picture_diary.jsp"><h4>Picture Diary</h4></a></li>  
				<li class="active"><a href="my_account.jsp"><h4>My account</h4></a></li>    
				<li><a href="notice.jsp"><h4>Notice</h4></a></li> 
			</ul>
			</div>


				<div class="col-md-8"  style="background-color: #B2CDD2; ">
				<center><h2>My Account Modify</h2></center><br>
				<div class="form-horizontal">
  
				 <div class="form-group">             
					<label for="name" class="col-sm-2 control-label">Name</label>       
					<div class="col-sm-10">     
					<input type="text" class="form-control" name="userName" value="<%=bbs.getUserName()%>">
					</div>
					</div>
					
					<div class="form-group">
					<label for="id" class="col-sm-2 control-label">ID</label>       
					<div class="col-sm-10">          
					<label><h5><%=bbs.getUserID()%></h5></label>
					</div>
					</div>
					
					<div class="form-group">
					<label for="password" class="col-sm-2 control-label">Password</label>       
					<div class="col-sm-10">          
					<input type="text" class="form-control" name="userPassword" value="<%=bbs.getUserPassword()%>">
					</div>
					</div>
					
					<div class="form-group">
					<label for="phone" class="col-sm-2 control-label">Phone Number</label>       
					<div class="col-sm-10">          
					<input type="text" class="form-control" name="phone" value="<%=bbs.getPhone()%>">
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
					<input type="submit" class="btn btn-default" value="확인">
					<a href="my_account.jsp"><input type="button" class="btn btn-default" value="취소"> </a>
					 <br><br>
         		</center>
		</div>
		</div>
		</div>
	</form>
	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
