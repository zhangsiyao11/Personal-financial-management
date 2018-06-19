<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
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

	<!--主要页面  -->
	<div class="container">
		<div class="row"></br></div>
		<div class="row">
			<div class="col-md-12">
				<h1>个人信息</h1>
			</div>
		</div>
		<div class="row"></br></div>
		<div class="row">
			<div class="col-md-3 col-md-offset-8">
				<button class="btn btn-info  btn-block" id="return_main_btn">返回主页</button>
			</div>
		</div>
		<div class="row"></br></div>
		<div class="row"></br></div>
		<div class="row"></br></div>
		<div class="row">
		<!--style="font-size:20px;"  -->
			<div class="col-md-10 col-md-offset-1" style="font-size:18px;">
				<form class="form-horizontal" id="userShowForm">
			 	  <div class="form-group">
				    <label class="col-sm-4 control-label">用户名</label>
				    <div class="col-sm-5">
				       <p class="form-control-static" id="username"></p>
				    </div>
				  </div>
		          <div class="form-group">
				    <label for="inputPassword" class="col-sm-4 control-label">密 码 </label>
				    <div class="col-sm-5">
				      <input type="text" name="password" class="form-control" id="inputPassword" >
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputRealname" class="col-sm-4 control-label">真实姓名</label>
				    <div class="col-sm-5">
				      <input type="text" name="realname" class="form-control" id="inputRealname">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputAge" class="col-sm-4 control-label">年 龄</label>
				    <div class="col-sm-5">
				      <input type="text" name="age" class="form-control" id="inputAge">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail" class="col-sm-4 control-label">邮 箱</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" name="email" id="inputEmail" >
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPhone" class="col-sm-4 control-label">电 话</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" name="phone" id="inputPhone" >
				      <span class="help-block"></span>
				    </div>
				  </div>
				</form>
			</div>
			<div class="row"></br></div>
			<div class="row"></br></div>
			<div class="row">
				<div class="col-md-4 col-md-offset-7">
					<button class="btn btn-danger" id="cancel_update_btn" >取消</button>
					<button class="btn btn-success" id="user_update_btn" >保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var Ohref=window.location.href;
		var arrhref=Ohref.split("?username=");
		var username = arrhref[1];
		//页面加载完成以后，直接去发送ajax请求,要到用户数据
		$(function(){
			showForm();
		});
		function showForm(){
			$.ajax({
				url:"${APP_PATH}/user",
				data:"username="+username,
				type:"Get",
				success:function(result){
					$("#userShowForm").setForm(result);
				}
			});
		}
		
		$.fn.setForm = function(result){
			  var user = result.map.user;
			  $("#username").text(user.username)
			  $("#inputPassword").val(user.password);
			  $("#inputRealname").val(user.realname);
			  $("#inputAge").val(user.age);
			  $("#inputEmail").val(user.email);
			  $("#inputPhone").val(user.phone);
		};
		
		//检验表单
		function validate_form(){
			//1、拿到要校验的数据，使用正则表达式
			var password = $("#inputPassword").val();
			var regPassword = /^[a-zA-Z0-9_-]{6,12}$/;
			if(!regPassword.test(password)){
				show_validate_msg("#inputPassword", "error", "密码格式不正确(6~12位字母，数字)");
				return false;
			}else{
				show_validate_msg("#inputPassword", "success", "");
			}	
			
			var email= $("#inputEmail").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				show_validate_msg("#inputEmail", "error", "邮箱格式不正确");
				return false;
			}else{
				show_validate_msg("#inputEmail", "success", "");
			}
			
			var phone= $("#inputPhone").val();
			var regPhone = /^0?(13|14|15|17|18|19)[0-9]{9}$/;
			if(!regPhone.test(phone)){
				show_validate_msg("#inputPhone", "error", "电话格式不正确");
				return false;
			}else{
				show_validate_msg("#inputPhone", "success", "");
			}
			
			return true;
		}
		
		//显示校验结果的提示信息
		function show_validate_msg(ele,status,msg){
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error" == status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		} 
		
		$("#inputPassword").change(function(){
			var password = $("#inputPassword").val();
			var regPassword = /^[a-zA-Z0-9_-]{6,16}$/;
			if(!regPassword.test(password)){
				show_validate_msg("#inputPassword", "error", "密码格式不正确(6~16位字母，数字)");
			}else{
				show_validate_msg("#inputPassword", "success", "");
			}	
		});
		
		$("#inputEmail").change(function(){
			var email= $("#inputEmail").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				show_validate_msg("#inputEmail", "error", "邮箱格式不正确");
			}else{
				show_validate_msg("#inputEmail", "success", "");
			}
		});
		
		$("#inputPhone").change(function(){
			var phone= $("#inputPhone").val();
			var regPhone = /^0?(13|14|15|17|18|19)[0-9]{9}$/;
			if(!regPhone.test(phone)){
				show_validate_msg("#inputPhone", "error", "电话格式不正确");
			}else{
				show_validate_msg("#inputPhone", "success", "");
			}
		});
		

		
		$("#user_update_btn").click(function(){
			show_validate_msg("#inputUsername", "success", "");
			if(!validate_form()){
				return false;
			}
			
			/* if($(this).attr("ajax-va")=="error"){
				return false;
			} */
			$.ajax({
				url:"${APP_PATH}/update",
				data:{
					 "username":username, 
					 "password": $("#inputPassword").val(),
					  "realname":$("#inputRealname").val(),
					  "age":$("#inputAge").val(),
					  "email":$("#inputEmail").val(),
					  "phone":$("#inputPhone").val(),
				},
				type:"POST",
				success:function(result){
					alert("保存成功");
				}
			});
		});
		
		$("#cancel_update_btn").click(function(){
			showForm();
		});
		
		$("#return_main_btn").click(function(){
			window.location.href = "show.jsp?username="+username;
		});
		
		/* function build_emps_table(result){
			//清空table表格
			var user = result.map.user;
			var tbBody = "";
			tbBody = "<tr><td>用户名</td><td>" + user.username + "</td></tr>";
            $("#usertable").append(tbBody);
            tbBody = "<tr><td>密码</td><td>" + user.password + "</td></tr>";
            $("#usertable").append(tbBody);
            tbBody = "<tr><td>真实姓名</td>";
            if(user.realname != null){
            	tbBody += "<td>" + user.realname + "</td>";
            }
            tbBody += "</tr>";
            $("#usertable").append(tbBody);
            tbBody = "<tr><td>邮箱</td>";
           	if(user.email != null){
               	tbBody += "<td>" + user.email + "</td>";
               }
               tbBody += "</tr>";
            $("#usertable").append(tbBody);
            tbBody = "<tr><td>电话</td>";
            if(user.phone != null){
              tbBody += "<td>" + user.phone + "</td>";
            }
            tbBody += "</tr>";
            $("#usertable").append(tbBody);
			 
		} */
		
		/* $("#user_update_btn").click(function(){
			$("#updateUserModal").modal({
				backdrop:"static"
			});
		}); */
	</script>
</body>
</html>