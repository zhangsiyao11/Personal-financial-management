<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>统计分析</title>
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
<script src="${APP_PATH }/static/chart/Chart.js"></script>
</head>
<!-- background="${APP_PATH }/static/image/bg.jpg" -->
<body background="${APP_PATH }/static/image/bg.jpg">
	<div class="container">
		<div class="row">
			<h1>消费信息统计</h1>
		</div>
		<div class="row">
			<div class="">
				<form class="navbar-form navbar-left" role="search" id="search">
				  <div class="form-group">
				    	<!-- 部门提交部门id即可 -->
				      <select class="form-control" name="year" id="yearSelect">
				      </select>
				  </div>
				  <div class="form-group">
				    <input type="month" class="form-control" id="inputMonth" placeholder="">
				  </div>
				  <button type="button" class="btn btn-success navbar-btn" id="accordYearSearch">按年份</button>
			      <button type="button" class="btn btn-success navbar-btn" id="accordMonthSearch">按月份</button>
				  <button type="button" class="btn btn-success navbar-btn" id="accordSpeciesSearch">按种类</button>
				     按月份搜索输入(year),按种类搜索输入(year or year-month or null)
				</form>
				<button class="btn btn-primary" id="return_main_btn" style="margin-left:15px">返回个人主页</button>
			</div>
		</div>
		<div class="row">
			<div id="canvas">
				<canvas id="myChart" style="height:200px; width:50%">		
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
		var Ohref=window.location.href;
		var arrhref=Ohref.split("?username=");
		var username = arrhref[1];
		var flg ;
		var num ;
		
		function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		$(function(){
			reset_form($("#search"));
			getYear($("#search select"));
		});
		
		function getYear(ele){
			//清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url:"${APP_PATH}/year",
				data:"username="+username,
				type:"GET",
				success:function(result){
					var optionEle = $("<option></option>").append("");
					optionEle.appendTo(ele);
					$.each(result.map.years,function(){
						var optionEle = $("<option></option>").append(this);
						optionEle.appendTo(ele);
					});
				}
			});
			
		}
		$("#accordYearSearch").click(function(){
			$.ajax({
				url:"${APP_PATH}/year/money",
				data:"username="+username,
				type:"GET",
				success:function(result){
					
					flg = ["2014","2015","2016","2017","2018"];
					num = [0,0,0,0,0];
					draw_bar(result);
					/* var res = result.map.list;
					$.each(res,function(index,item){
						alert(item.num + item.event);
					}); */
				}
			}); 
		});
		
		$("#accordMonthSearch").click(function(){
			var year = $("#yearSelect").val();
			$.ajax({
				url:"${APP_PATH}/month",
				data:{
					"username":username,
					"year":year,
				},
				type:"GET",
				success:function(result){
					
					flg = ["1","2","3","4","5","6","7","8","9","10","11","12"];
					num = [0,0,0,0,0,0,0,0,0,0,0,0];
					draw_bar(result);
					/* var res = result.map.list;
					$.each(res,function(index,item){
						alert(item.num + item.event);					

					}); */
				}
				
			});
		});
		
		$("#accordSpeciesSearch").click(function(){
			if($("#yearSelect").val() != ""){
				getSpeciesWithYear($("#yearSelect").val());
			}else if($("#inputMonth").val() != ""){
				getSpeciesWithMonth($("#inputMonth").val());
			}else{
				getSpecies();
			}
		});
		
		function getSpeciesWithYear(year){
			$.ajax({
				url:"${APP_PATH}/species/year",
				data:{
					"username":username,
					"year":year,
				},
				type:"GET",
				success:function(result){
					flg = ["衣着","食品","娱乐","医疗","理财","教育","其它"];
					num = [0,0,0,0,0,0,0];
					draw_bar(result);
					/* $.each(result.map.list,function(index,item){
						alert(item.num + item.event);
					}); */
				}
			});	
		}
		
		function getSpeciesWithMonth(month){
			$.ajax({
				url:"${APP_PATH}/species/month",
				data:{
					"username":username,
					"month":month,
				},
				type:"GET",
				success:function(result){
					flg = ["衣着","食品","娱乐","医疗","理财","教育","其它"];
					num = [0,0,0,0,0,0,0];
					draw_bar(result);
					/* $.each(result.map.list,function(index,item){
						alert(item.num + item.event);
					}); */
				}
			});
		}
		
		function getSpecies(){
			$.ajax({
				url:"${APP_PATH}/species",
				data:"username="+username,
				type:"GET",
				success:function(result){
					/* $.each(result.map.list,function(index,item){
						alert(item.num + item.event);
					}); */
					flg = ["衣着","食品","娱乐","医疗","理财","教育","其它"];
					num = [0,0,0,0,0,0,0];
					draw_bar(result);
				}
			});
			
		}
		
		function clearCanvas(){
		    $("#myChart").remove();
		    $("#canvas").append("<canvas id=\"myChart\" style=\"height:200px; width:50%\">"	);
		}
		
		function draw_bar(result){
			clearCanvas();
			var species = [];
			var nums = [];
			var res = result.map.list;
			var max = 1;
			$.each(res,function(index,item){
				if(item.num > max){
					max = item.num;
				}
				nums.push(item.num);
				species.push(item.event);
			});
			for(var i=0 ; i<flg.length ; ++i){
				for(var j=0 ; j<species.length ; ++j){
					if( flg[i] == species[j] ){
						num[i] = nums[j];
					}
				}
			}
    
            var ctx = document.getElementById("myChart").getContext("2d");
            var myChart = new Chart(ctx,{
    		    type: 'bar',
    		    data : {
    	    	    labels: flg,
    	    	    datasets: [
    	    	        {
    	    	            label: "消费信息",
    	    	            backgroundColor: "rgba(	0,191,255)",
    	    	            data: num
    	    	        },
    	    	    ]
    	    	},
    		    options: {
    		    	 scales: {
    			            yAxes: [{
    			                ticks: {
    			                    beginAtZero:true
    			                }
    			            }]
    			     },
    		    	 legend: {
    		             display: true,
    		             labels: {
    		                 fontColor: 'rgb(128,128,0)',
    		             }   
    		         },
    		         layout: {
    		             padding: {
    		                 left: 270,
    		                 right:270,
    		                 top: 20,
    		                 bottom: 0
    		             }
    		         },
    		         scales: {
    		             yAxes: [{
    		                 ticks: {
    		                     max: max,
    		                     min: 0,
    		                     stepSize: 500
    		                 }
    		             }]
    		         }
    		    }
    		});     
  
		}
            
        $("#return_main_btn").click(function(){
  			window.location.href = "show.jsp?username="+username;
  		});
			
			
	</script>
	
</body>
</html>