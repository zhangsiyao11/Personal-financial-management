<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
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

<body background="static/image/bg.jpg">

	<!--修改密码  -->
	<!--<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">修改密码</h4>
	      </div>
	      <div class="modal-body">
	      ....
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label for="changeUername" class="col-sm-2 control-label">用户名</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="changeUername" placeholder="xxx@pfg.com">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="changePassword" class="col-sm-2 control-label">密码</label>
			    <div class="col-sm-10">
			      <input type="password" class="form-control" id="changePassword" placeholder="6~16位字母，数字">
			      <span class="help-block"></span>
			    </div>
			   </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="save_change_password">保存</button>
	      </div>
	    </div>
	  </div>
	</div>  -->

	<!--用户注册模态框  -->
	<div class="modal fade" id="userAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" >用户注册</h4>
	      </div>
	      <div class="modal-body">
		     <form class="form-horizontal" id="registerForm">
				 <div class="form-group">
				    <label class="col-sm-2 control-label">用户名</label>
				    <div class="col-sm-10">
				      <input type="text" name="username" class="form-control" id="username_add_input" placeholder="xxx@pfg.com">
				      <span class="help-block"></span>
				    </div>
				  </div>
		  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">密码</label>
				    <div class="col-sm-10">
				      <input type="password" name="password" class="form-control" id="password_add_input" placeholder="6~16位字母、数字">
				      <span class="help-block"></span>
				    </div>
				  </div>
			 </form>
		  </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
        	<button type="button" class="btn btn-primary" id="user_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!--登录页面  -->
	<div class="container"  >
		<!-- 标题 -->
		<div class="row"></br></div>
		
		<div class="row">
			<div class="col-md-12">
				<h1>个人财务管理系统</h1>
			</div>
		</div>
		
		<div class="row"></br></div>
		<div class="row"></br></div>
		<div class="row"></br></div>
		
		<div class="row">
			<div class="col-md-6 col-md-offset-5">
				<h2>用户登录</h2>
			</div>
		</div>
		<div class="row"></br></div>
		<!-- 显示登录表单 -->
		<div class="row" >
			<div class="col-md-10 col-md-offset-3">
				<form  class="form-horizontal" id="loginUser" >
				  <div class="form-group ">
				    <label for="inputUername" class="col-sm-2 control-label">用户名</label>
				    <div class="col-sm-4">
				      <input type="text" name="username" class="form-control" id="inputUername" placeholder="xxx@pfg.com">
				      <span class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group ">
				    <label for="inputPassword" class="col-sm-2 control-label">密码</label>
				    <div class="col-sm-4">
				      <input type="password"  name="password"  class="form-control" id="inputPassword" placeholder="password">
				      <span class="help-block"></span>
				    </div>
				  </div>
				</form>
			</div>
			<!-- <div class="col-sm-3 col-sm-offset-7">
					<button class="btn btn-default btn-sm" id="forget_password_btn"  >忘记密码</button>
			</div> -->
		</div>
		<!--显示按钮  -->
		<div class="row">
			<div class="col-md-10 col-md-offset-4">
				<button class="btn btn-success " id="user_login_btn" style="margin-left:60px" > 登录(sign in) </button>
				<button class="btn btn-info " id="user_register_btn" style="margin-left:60px"> 注册(sign up) </button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		$(function(){
			reset_form("#loginUser");
		});
	
		//点击注册按钮弹出模态框。
		$("#user_register_btn").click(function(){
			
			$("#userAddModal").modal({
			
				backdrop:"static"
			});
			reset_form("#registerForm");
		});
		
		//检验表单
		function validate_add_form(){
			//1、拿到要校验的数据，使用正则表达式
			var username= $("#username_add_input").val();
			var regName = /^([a-z0-9_\.-]+)@pfg.com$/;
			if(!regName.test(username)){
				show_validate_msg("#username_add_input", "error", "用户名格式不正确(xxx@pfg.com)");
				return false;
			}else{
				show_validate_msg("#username_add_input", "success", "");
			}
			
			var password = $("#password_add_input").val();
			var regPassword = /^[a-zA-Z0-9_-]{6,16}$/;
			if(!regPassword.test(password)){
				show_validate_msg("#password_add_input", "error", "密码格式不正确(6~16位字母、数字)");
				return false;
			}else{
				show_validate_msg("#password_add_input", "success", "");
			};	
			
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
		
		//校验用户名是否可用
		$("#username_add_input").change(function(){
			//发送ajax请求校验用户名是否可用
			var username= $("#username_add_input").val();
			var regName = /^([a-z0-9_\.-]+)@pfg.com$/;
			if(!regName.test(username)){
				show_validate_msg("#username_add_input", "error", "用户名格式不正确(xxx@pfg.com)");
			}else{
				$.ajax({
					url:"${APP_PATH}/checkuser",
					data:"username="+username,
					type:"POST",
					success:function(result){
						if(result.code==1){
							show_validate_msg("#username_add_input","success"," ");
						}else{
							show_validate_msg("#username_add_input","error","用户名已存在，请登录");
						}
					}
				});
			}
		});
		
		$("#password_add_input").change(function(){
			var password = this.value;
			var regPassword = /^[a-zA-Z0-9_-]{6,16}$/;
			if(!regPassword.test(password)){
				show_validate_msg("#password_add_input", "error", "密码格式不正确(6~16位字母，数字)");
			}else{
				show_validate_msg("#password_add_input", "success", "");
			}	
		});
		
		function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		//保存新注册用户
		$("#user_save_btn").click(function(){
			
			//1、模态框中填写的表单数据提交给服务器进行保存
			//1、先对要提交给服务器的数据进行校验
			if(!validate_add_form()){
				return false;
			};
			//1、判断之前的ajax用户名校验是否成功。如果成功。
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			
			//2、发送ajax请求保存员工
			$.ajax({
				url:"${APP_PATH}/user",
				type:"POST",
				data:$("#userAddModal form").serialize(),
				success:function(result){
					if(result.code == 1){
						//员工保存成功；
						//1、关闭模态框
						$("#userAddModal").modal('hide');
						alert("注册成功");
						reset_form("#loginUser");
						show_validate_msg("#inputUername", "success", "");
					}
				}
			});
		});

		$("#inputUername").change(function(){
			var username= $("#inputUername").val();
			var regName = /^([a-z0-9_\.-]+)@pfg.com$/;
			if(!regName.test(username)){
				show_validate_msg("#inputUername", "error", "用户名格式不正确(xxx@pfg.com)");
			}else{
				$.ajax({
					url:"${APP_PATH}/checkuser",
					data:"username="+username,
					type:"POST",
					success:function(result){
						if(result.code==0){
							show_validate_msg("#inputUername","success"," ");
						}else{
							show_validate_msg("#inputUername","error","用户名不存在，请先注册");
						}
					}
				});
			}
		});
		$("#inputPassword").change(function(){
			var password = this.value;
			var regPassword = /^[a-zA-Z0-9_-]{6,16}$/;
			if(!regPassword.test(password)){
				show_validate_msg("#inputPassword", "error", "密码格式不正确(6~16位字母，数字)");
			}else{
				show_validate_msg("#inputPassword", "success", "");
			}	
		});
		//登录
		$("#user_login_btn").click(function(){
			
			$.ajax({
				url:"${APP_PATH}/login",
				type:"GET",
				data:$("#loginUser").serialize(),
				success:function(result){
					if(result.code == 1){
						//员工登录成功；
						//1、关闭模态框
						var username= $("#inputUername").val();
						if( username == "admin@pfg.com"){
							window.location.href = "views/admin.jsp?";
						}else{
							window.location.href = "views/show.jsp?username="+username;
						}
					}else{
						show_validate_msg("#inputPassword","error","密码错误");
					}
				}
			});
		});
		
		/* $("#changeUername").change(function(){
			//发送ajax请求校验用户名是否可用
			var username= $("#changeUername").val();
			var regName = /^([a-z0-9_\.-]+)@pfg.com$/;
			if(!regName.test(username)){
				show_validate_msg("#changeUername", "error", "用户名格式不正确(xxx@pfg.com)");
			}else{
				$.ajax({
					url:"${APP_PATH}/checkuser",
					data:"username="+username,
					type:"POST",
					success:function(result){
						if(result.code==0){
							show_validate_msg("#changeUername","success"," ");
						}else{
							show_validate_msg("#changeUername","error","用户名不存在");
						}
					}
				});
			}
		});
		
		$("#changePassword").change(function(){
			var password = this.value;
			var regPassword = /^[a-zA-Z0-9_-]{6,16}$/;
			if(!regPassword.test(password)){
				show_validate_msg("#changePassword", "error", "密码格式不正确(6~16位字母，数字)");
			}else{
				show_validate_msg("#changePassword", "success", "");
			}	
		});
		
		$("#forget_password_btn").click(function(){
			$("#changeModal").modal({
				
				backdrop:"static"
			});
			reset_form("#changeModal form");
		});
		
	   $("#save_change_password").click(function(){
			$.ajax({
				url:"${APP_PATH}/update",
				date:$("#changeModal form").serialize(),
				type:"POST",
				success:function(result){
					$("#changeModal").modal('hide');
					alert("保存成功，请登录");
					reset_form("#loginUser");
					show_validate_msg("#inputUername", "success", "");
				}
			});
	  }); */
	  

		
	</script>
	
</body>
</html>