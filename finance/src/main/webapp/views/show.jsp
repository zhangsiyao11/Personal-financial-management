<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人主页</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
 -->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-2.1.1.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body background="${APP_PATH }/static/image/bg.jpg">
	<div class="container">
	  <div class="row">
	  	<div class="col-md-12 ">
	  		<h3>${param.username}的个人主页</h3>
	  	</div>
	  </div>
	  <div class="row"></br></div>
	  <div class="row"></br></div>
	  <div class="row">
	    <div class="col-md-6 ">
	    	<a href="user.jsp?username=${param.username}" class="btn btn-info btn-lg btn-block"  role="button">个人信息(Personal information)</a>
	  	</div>
	  </div>
	  <div class="row"></br></div>
	  <div class="row"></br></div>
	  <div class="row">
	  	<div class="col-md-6 ">
	  		<a href="income.jsp?username=${param.username}" class="btn btn-info btn-lg btn-block"  role="button">收入信息(Income information)</a>
	  	</div>
	  </div>
	  <div class="row"></br></div>
	  <div class="row"></br></div>
	  <div class="row">
	  	<div class="col-md-6 ">
	  		<a href="spend.jsp?username=${param.username}" class="btn btn-info btn-lg btn-block"  role="button">支出信息(Spending information)</a>
	  	</div> 
	  </div>
	  <div class="row"></br></div>
	  <div class="row"></br></div>
	  <div class="row">
	  	<div class="col-md-6 ">
	  		<a href="draw.jsp?username=${param.username}" class="btn btn-info btn-lg btn-block"  role="button">统计分析(Statistical analysis)</a>
	  		<%-- <a href="analysis.jsp?username=${param.username}" class="btn btn-info btn-lg btn-block"  role="button">统计分析(Statistical analysis)</a> --%>
	  	</div> 
	  </div>
	  <div class="row"></br></div>
	  <div class="row"></br></div>
	  <div class="row">
	  	<div class="col-md-6 ">
	  		<button class="btn btn-danger btn-lg btn-block" id="cancel_btn">注销( cancellation)</button>
	  	</div> 
	  </div>
	  <div class="row"></br></div>
	  <div class="row"></br></div>
	  <div class="row">
	  	<div class="col-md-6 ">
	  		<button  class="btn btn-success btn-lg btn-block"  id="user_out_btn">退出(sign out)</button>
	  	</div> 
	  </div>
	</div>
	
	<script type="text/javascript">
		var Ohref=window.location.href;
		var arrhref=Ohref.split("?username=");
		var username = arrhref[1];
	
		$("#cancel_btn").click(function(){
			if(confirm("确认注销吗?")){
				del_user();
			}
		});
		
		function del_user(){
			$.ajax({
				url:"${APP_PATH}/user/delete",
				data:"username="+username,
				type:"POST",
				success:function(){
					alert("注销成功");
					window.location.href = "${APP_PATH}/index.jsp";
				}
			});
		}
		
		$("#user_out_btn").click(function(){
			if(confirm("确认退出??")){
				window.location.href = "${APP_PATH}/";
			}	
		});
	</script>
	
</body>
</html>