<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支出信息</title>
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

	<!--编辑模态框  -->
	<div class="modal fade" id="editSpendModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">更新支出信息</h4>
	      </div>
	      <div class="modal-body">
	      	<form class="form-horizontal" id="updateForm">
	         <div class="form-group">
			    <label class="col-sm-2 control-label">用户名</label>
			    <div class="col-sm-10">
			      <p class="form-control-static" id="usernamestatic"></p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputDate" class="col-sm-2 control-label">日期</label>
			    <div class="col-sm-10">
			      <input type="date" name="date" class="form-control" id="inputUpdateDate" placeholder="yyyy-mm-dd">
			    </div>
			  </div>
			  <div class="form-group">
			  	  <label class="col-sm-2 control-label">种类</label>
			  	  <div class="col-sm-10">
				    <div class="input-group">
				      <input type="text" class="form-control" name="species" id="inputUpdateSpecies" placeholder="" aria-describedby="chooseAddItem">
				      <div class="input-group-btn">
				        <button type="button" class="btn btn-default dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">choose<span class="caret"></span></button>
				        <ul class="dropdown-menu dropdown-menu-right" id="chooseUpdateItem">
				          <li><a href="#">衣着</a></li>
				          <li><a href="#">食品</a></li>
				          <li><a href="#">娱乐</a></li>
				          <li><a href="#">医疗</a></li>
				          <li><a href="#">理财</a></li>
				          <li><a href="#">教育</a></li>
				          <li><a href="#">其它</a></li>
				        </ul>
				      </div>
				    </div>
				  </div>
			  </div>
			  <div class="form-group">
			    <label for="inputMoney" class="col-sm-2 control-label">金额</label>
			    <div class="col-sm-10">
			      <input type="text" name="money"  class="form-control" id="inputUpdateMoney" placeholder="￥">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputNote" class="col-sm-2 control-label">备注</label>
			    <div class="col-sm-10">
			      <input type="text"  name="note" class="form-control" id="inputUpdateNote" placeholder="可为空">
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="update_spend_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!--新增模态框  -->
	<div class="modal fade" id="addSpendModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">新增支出信息</h4>
	      </div>
	      <div class="modal-body">
	      	<form class="form-horizontal" id="addForm">
			  <div class="form-group">
			    <label for="inputDate" class="col-sm-2 control-label">日期</label>
			    <div class="col-sm-10">
			      <input type="date" name="date" class="form-control" id="inputDate" placeholder="yyyy-mm-dd">
			    </div>
			  </div>
			  <div class="form-group">
			  	  <label class="col-sm-2 control-label">种类</label>
			  	  <div class="col-sm-10">
				    <div class="input-group">
				      <input type="text" class="form-control" name="species" id="inputSpecies" placeholder="" aria-describedby="chooseAddItem">
				      <div class="input-group-btn">
				        <button type="button" class="btn btn-default dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">choose<span class="caret"></span></button>
				        <ul class="dropdown-menu dropdown-menu-right" id="chooseAddItem">
				          <li style="vertical-align: middle !important;text-align: center;">衣着</li>
				          <li><a href="#">食品</a></li>
				          <li><a href="#">娱乐</a></li>
				          <li><a href="#">医疗</a></li>
				          <li><a href="#">理财</a></li>
				          <li><a href="#">教育</a></li>
				          <li><a href="#">其它</a></li>
				        </ul>
				      </div>
				    </div>
				  </div>
			  </div>
			  <div class="form-group">
			    <label for="inputMoney" class="col-sm-2 control-label">金额</label>
			    <div class="col-sm-10">
			      <input type="text" name="money"  class="form-control" id="inputMoney" placeholder="￥">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputNote" class="col-sm-2 control-label">备注</label>
			    <div class="col-sm-10">
			      <input type="text"  name="note" class="form-control" id="inputNote" placeholder="可为空">
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="save_spend_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!--主要页面  -->
	<div class="container">
		<div class="row"></br></div>
		<div class="row">
			<h1>支出信息</h1>
		</div>
		<div class="row"></br></div>
		<div class="row">
			<div class="col-md-3 col-md-offset-9">
				<button class="btn btn-primary"  id="add_spend_btn"  style="margin-left:15px">新增</button>
				 <button class="btn btn-success" id="return_main_btn" style="margin-left:15px">返回个人主页</button>
			</div>
		</div>
		<div class="row"></br></div>
		<div class="row">
			<div class="col-md-11 col-md-offset-1" style="font-size:16px;">
				<table class="table table-hover" id="spendShow">
					<thead>
						<tr>
							<th style="vertical-align: middle !important;text-align: center;">日期</th>
							<th style="vertical-align: middle !important;text-align: center;">种类</th>
							<th style="vertical-align: middle !important;text-align: center;">金额</th>
							<th style="vertical-align: middle !important;text-align: center;">备注</th>
							<th style="vertical-align: middle !important;text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
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
	
	<script type="text/javascript">
	
		var Ohref=window.location.href;
		var arrhref=Ohref.split("?username=");
		var username = arrhref[1];
		var totalRecord;
		var currentPage;
		var pages;
		
		$(function(){
			to_page(1);
		});
		
		function to_page(pn){
			$.ajax({
				url:"${APP_PATH }/spend/show",
				data:{"username":username,"pn":pn},
				type:"GET",
				success:function(result){
					//1、解析并显示数据
					build_spend_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
		}
		
		function dateFormat(longTypeDate){  
		    var dateType = "";  
		    var date = new Date();  
		    date.setTime(longTypeDate); 
		    dateType = date.getFullYear()+"-"+getMonth(date)+"-"+getDay(date);//yyyy-MM-dd格式日期
		    return dateType;
		} 
		
		/* var moveInArray = $("#inputDate").val().split('-');
		var d = new Date();
		d.setYear(moveInArray[0]);
		d.setMonth(moveInArray[1]-1);
		d.setDate(moveInArray[2]);
		var moveIn = d.getTime();
		alert(moveIn); */
		
		//返回 01-12 的月份值   
		function getMonth(date){  
		    var month = "";  
		    month = date.getMonth() + 1; //getMonth()得到的月份是0-11  
		    if(month<10){  
		        month = "0" + month;  
		    }  
		    return month;  
		}  
		//返回01-30的日期  
		function getDay(date){  
		    var day = "";  
		    day = date.getDate();  
		    if(day<10){  
		        day = "0" + day;  
		    }  
		    return day;  
		}
		
		function build_spend_table(result){
			//清空table表格
			$("#spendShow tbody").empty();
			
			var spends = result.map.pageInfo.list;
			$.each(spends,function(index,item){
				var date = dateFormat(item.date);
				var note = item.note;
				var dateTd = $("<td style=\"vertical-align: middle !important;text-align: center;\"></td>").append(date);
				var speciesTd = $("<td style=\"vertical-align: middle !important;text-align: center;\"></td>").append(item.species);
				var moneyTd = $("<td style=\"vertical-align: middle !important;text-align: center;\"></td>").append(item.money);
				if(note == null){
					note = " ";
				}
				var noteTd = $("<td style=\"vertical-align: middle !important;text-align: center;\"></td>").append(note);
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前员工id
				editBtn.attr("edit-id",item.spendid);
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				//为删除按钮添加一个自定义的属性来表示当前删除的员工id
				delBtn.attr("del-id",item.spendid);
				var btnTd = $("<td style=\"vertical-align: middle !important;text-align: center;\"></td>").append(editBtn).append(" ").append(delBtn);
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(dateTd)
					.append(speciesTd)
					.append(moneyTd)
					.append(noteTd)
					.append(btnTd)
					.appendTo("#spendShow tbody");
			});
		}
		
		//2、解析并显示分页信息
		function build_page_info(result){
			$("#page_info_area").empty();
			$("#page_info_area").append("当前"+result.map.pageInfo.pageNum+"页,总"+
					result.map.pageInfo.pages+"页,总"+
					result.map.pageInfo.total+"条记录");
			totalRecord = result.map.pageInfo.total;
			currentPage = result.map.pageInfo.pageNum;
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
		
		$("#return_main_btn").click(function(){
			window.location.href = "show.jsp?username="+username;
		});
		
		function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		$("#chooseAddItem").on("click", "li", function(){
	        $("#inputSpecies").val($(this).text());
	    });
		$("#chooseUpdateItem").on("click", "li", function(){
	        $("#inputUpdateSpecies").val($(this).text());
	    });
		
		$("#add_spend_btn").click(function(){
			reset_form("#addForm");
			$("#addSpendModal").modal({
				backdrop:"static"
			});
		});
		
		
		
		$("#save_spend_btn").click(function(){	
			$.ajax({
				url:"${APP_PATH}/spend/save",
				//data:$("#addIncomeModal form").serialize(),
				data:{
					"username":username,
					"date":$("#inputDate").val(),
					"species":$("#inputSpecies").val(),
					"money":$("#inputMoney").val(),
					"note":$("#inputNote").val(),
				},
				type:"POST",
				success:function(result){
					$("#addSpendModal").modal('hide');
					alert("保存成功");
					var pn = pages+((totalRecord+1)%5 == 0?0:1);
					if((totalRecord+1) < 5){
						pn = 1;
					}
					to_page(pn);
				}
			});
		});
		
		$(document).on("click",".edit_btn",function(){
			$("#update_spend_btn").attr("edit-id",$(this).attr("edit-id"));
			//查出员工信息，显示员工信息
			getSpend($(this).attr("edit-id"));	
			$("#editSpendModal").modal({
				backdrop:"static"
			});
		}); 
		
		function getSpend(spendid){
			$.ajax({
				url:"${APP_PATH}/spend",
				type:"GET",
				data:"spendid="+spendid,
				success:function(result){
					var spend = result.map.spend;
					var date = dateFormat(spend.date);
					$("#usernamestatic").text(spend.username);
					$("#inputUpdateDate").val(date);
					$("#inputUpdateSpecies").val(spend.species);
					$("#inputUpdateMoney").val(spend.money);
					$("#inputUpdateNote").val(spend.note);
				}
			});
		}
		
		$("#update_spend_btn").click(function(){
			$.ajax({
				url:"${APP_PATH}/spend/update",
				data:{
					"spendid":$(this).attr("edit-id"),
					"username":username,
					"date":$("#inputUpdateDate").val(),
					"species":$("#inputUpdateSpecies").val(),
					"money":$("#inputUpdateMoney").val(),
					"note":$("#inputUpdateNote").val(),
				},
				type:"POST",
				success:function(result){
					$("#editSpendModal").modal('hide');
					alert("更新成功");
					to_page(currentPage);
				}
			});
		});
		
		$(document).on("click",".delete_btn",function(){
			if(confirm("确认删除吗？")){
				//确认，发送ajax请求删除即可
				del_spend($(this).attr("del-id"));
			}
		});
		
		function del_spend(spendid){
			$.ajax({
				url:"${APP_PATH}/spend/delete",
				type:"POST",
				data:"spendid="+spendid,
				success:function(){
					alert("删除成功");
					to_page(currentPage);
				}
			});
		}
		
	</script>

</body>
</html>