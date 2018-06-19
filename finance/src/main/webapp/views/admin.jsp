<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员</title>
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
			<h3>admin@pfg.com</h3>
		</div>
		<div clas="row">
			<div  class="col-md-3 col-md-offset-9" >
				<button class="btn btn-success" id="sign_out_btn" style="margin-left:15px">退出登录（sign out）</button>
			</div>
		</div>
		<div clas="row"></br></div>
		<div clas="row"></br></div>
		<div clas="row"></br></div>
		<div clas="row"></br></div>
		<div clas="row"></br></div>
		<div clas="row"></br></div>
		<div clas="row">
			<div class="col-md-11 col-md-offset-1" style="font-size:16px;">
				<table class="table table-hover" id="users">
					<thead>
						<tr>
							<th style="vertical-align: middle !important;text-align: center;">用户名</th>
							<th style="vertical-align: middle !important;text-align: center;">真实姓名</th>
							<th style="vertical-align: middle !important;text-align: center;">年龄</th>
							<th style="vertical-align: middle !important;text-align: center;">邮箱</th>
							<th style="vertical-align: middle !important;text-align: center;">电话</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
			<!-- 显示分页信息 -->
			<div class="row">
				<!--分页文字信息  -->
				<div class="col-md-6 col-md-offset-2"  id="page_info_area" style="font-size:16px;"></div>
				<div class="col-md-3 " id="page_nav_area" ></div>
			</div>
			<div>
				<!-- 分页条信息 -->
				
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
		$(function(){
			to_page(1);
		});
		
		function to_page(pn){
	
			$.ajax({
				url:"${APP_PATH }/users",
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					//1、解析并显示数据
					build_users_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
		}
		function build_users_table(result){
			//清空table表格
			$("#users tbody").empty();
			
			var users = result.map.pageInfo.list;
			$.each(users,function(index,item){
				var usernameTd = $("<td style=\"vertical-align: middle !important;text-align: center;\"></td>").append(item.username);
				var realname = item.realname;
				if(realname == null){
					realname = " ";
				}
				var realnameTd = $("<td style=\"vertical-align: middle !important;text-align: center;\"></td>").append(realname);
				var age = item.age;
				if(age == null){
					age = " ";
				}
				var ageTd = $("<td style=\"vertical-align: middle !important;text-align: center;\"></td>").append(age);
				var email = item.email;
				if(email == null){
					email = " ";
				}
				var emailTd = $("<td style=\"vertical-align: middle !important;text-align: center;\"></td>").append(email);
				var phone = item.phone;
				if(phone == null){
					phone = " ";
				}
				var phoneTd = $("<td style=\"vertical-align: middle !important;text-align: center;\"></td>").append(phone);
				
				$("<tr></tr>").append(usernameTd)
			 	    .append(realnameTd)
					.append(ageTd)
					.append(emailTd)
					.append(phoneTd)
					.appendTo("#users tbody");
			});
		}
		
		//2、解析并显示分页信息
		function build_page_info(result){
			$("#page_info_area").empty();
			$("#page_info_area").append("当前"+result.map.pageInfo.pageNum+"页,总"+
					result.map.pageInfo.pages+"页,总"+
					result.map.pageInfo.total+"条记录");
			pages = result.map.pageInfo.pages;
		}
		
		//3、解析显示分页条数据
		function build_page_nav(result){
			//page_nav_area
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			//构建元素
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if(result.map.pageInfo.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				//为元素添加点击翻页的事件
				firstPageLi.click(function(){
					to_page(1);
				});
				prePageLi.click(function(){
					to_page(result.map.pageInfo.pageNum -1);
				});
			}
			
			
			
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			if(result.map.pageInfo.hasNextPage == false){
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}else{
				nextPageLi.click(function(){
					to_page(result.map.pageInfo.pageNum +1);
				});
				lastPageLi.click(function(){
					to_page(result.map.pageInfo.pages);
				});
			}
			
			
			
			//添加首页和前一页 的提示
			ul.append(firstPageLi).append(prePageLi);
			//1,2，3遍历给ul中添加页码提示
			$.each(result.map.pageInfo.navigatepageNums,function(index,item){
				
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if(result.map.pageInfo.pageNum == item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(item);
				});
				ul.append(numLi);
			});
			//添加下一页和末页 的提示
			ul.append(nextPageLi).append(lastPageLi);
			
			//把ul加入到nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
		$("#sign_out_btn").click(function(){
			if(confirm("确认退出??")){
				window.location.href = "${APP_PATH}/";
			}	
		}); 
	</script>

</body>
</html>