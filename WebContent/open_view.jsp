<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bbs.diaryBbs" %>
<%@ page import="bbs.diaryDAO" %>
<%@ page import="bbs.comBbs" %>
<%@ page import="bbs.comDAO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		
		int pageNumber=1;
		if(request.getParameter("pageNumber") != null)
		{
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		String comUserID=null;
		if(session.getAttribute("userID") !=null)
		{
			comUserID = (String) session.getAttribute("userID");
			session.setAttribute("userID", comUserID);
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
				<form action="open_comment.jsp?diaryID=<%=diaryID %>" method="post" >
					<br><br><br><br>
					<p>Comment</p> 
					<div class="input-group"> 
						  <input type="text" class="form-control" placeholder="댓글을 입력하세요" name="comText" maxlength="80">
						  <div class="input-group-btn">                
						  <input type="submit" class="btn btn-default" value="저장"></div>
					</div>
					<br><br>
				</form>
				<table class="table table-hover">  
					<thead>       
						<tr>        
						<th>ID</th>          
						<th>Comment</th>          
						<th>Date</th>    
						<th></th>   
						</tr>    
					</thead>
					<tbody>
				
						<%
				
						comDAO bbsDAO = new comDAO();
						ArrayList<comBbs> list = bbsDAO.getList(pageNumber);
						for(int i=0; i< list.size(); i++){
							if(list.get(i).getComNum()==diaryID){

						%>
						<tr>
							<td><%= list.get(i).getComUserID() %></td> 
							<td><%= list.get(i).getComText() %></td>
							<td><%= list.get(i).getComDate() %></td>
							<td><a href="open_co_update.jsp?comID=<%=list.get(i).getComID()%>&diaryID=<%=diaryID%>" class="btn">수정</a></td>
							<td><a onClick="return confirm('정말로 삭제하겠습니까?')" href="open_co_delete.jsp?comID=<%=list.get(i).getComID()%>&diaryID=<%=diaryID%>" class="btn">삭제</a></td>
						</tr>
						<%
									}
						}
						%>
					
				</tbody>
				</table>
				<div class="pull-right">
				<a href="open_diary.jsp" class="btn btn-default">목록</a>
				<a href="open_update.jsp?diaryID=<%=diaryID%>" class="btn btn-primary">수정</a>
				<a onClick="return confirm('정말로 삭제하겠습니까?')" href="open_delete.jsp?diaryID=<%=diaryID%>" class="btn btn-primary">삭제</a>
				</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>
