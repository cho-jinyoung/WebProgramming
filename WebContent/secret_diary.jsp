<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="bbs.diaryDAO" %>
<%@ page import="bbs.diaryBbs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE>
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
<a href="main_page.jsp"><h1>YOUR DAY<small>_Secret diary</small></h1></a>

</div>
</head>
<body>
	<%
		int pageNumber=1;
		if(request.getParameter("pageNumber") != null)
		{
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		String userID=null;
		if(session.getAttribute("userID") !=null)
		{
			userID = (String) session.getAttribute("userID");
			session.setAttribute("userID", userID);
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
				<thead>
					<th>No.</th>
					<th>Title</th>
					<th>Id</th>
					<th>Date</th>

				</thead>
							<tbody>
				<%
				
					int secret=0;
					diaryDAO bbsDAO = new diaryDAO();
					ArrayList<diaryBbs> list = bbsDAO.getList(pageNumber);
					for(int i=0; i< list.size(); i++){
						if(userID.equals(list.get(i).getDiaryuserID())){
							if(Integer.parseInt(list.get(i).getDiaryOption())==2){
								secret++;
				%>
				<tr>
					<td><%= secret %></td> 
					<td><a href="secret_view.jsp?diaryID=<%=list.get(i).getDiaryID()%>"> <%= list.get(i).getDiaryTitle() %> </a></td>
					<td><%= list.get(i).getDiaryuserID() %></td>
					<td><%= list.get(i).getDiaryDate()%></td>
				</tr>
				<%
							}
						}
					}
				%>
			</tbody>		
		</table>
		<ul class="pager"> 
			<%
				if(pageNumber != 1) {
			%>
				<li class="previous"><a href="secret_diary.jsp?pageNumber=<%=pageNumber-1 %>">이전</a></li>
			<%
				} 
				if(bbsDAO.nextPage(pageNumber+1)) {
			%>
				<li class="next"><a href="secret_diary.jsp?pageNumber=<%=pageNumber+1 %>">다음</a></li>
			<%
				}
			%>
			</ul>
<br><br>

		</div>
		</div>
	
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
