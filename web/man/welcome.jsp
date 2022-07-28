<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"  %> 
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link href="<%=path %>/bootstrap/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
		<link href="<%=path %>/bootstrap/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
		<link href="<%=path %>/bootstrap/css/plugins/iCheck/custom.css" rel="stylesheet">
		<link href="<%=path %>/bootstrap/css/animate.min.css" rel="stylesheet" /> 
		<link href="<%=path %>/bootstrap/css/style.min.css?v=4.0.0" rel="stylesheet" />
		<script language="javascript" type="text/javascript" src="<%=path%>/My97DatePicker/WdatePicker.js"></script>

		 	<script src="<%=path%>/js/echarts.min.js"></script>
	</head>

	<body class="gray-bg">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
		
		
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>热销物料</h5>
					 
                    </div>
		        	<div class="ibox-content">


						<div class="ibox-content m-b-sm border-bottom">
							<form action="<%=path%>/toWeclome.action" name="formAdd" method="post"  >
								 
								<div class="form-inline">
									<label class="control-label " style="width: 80px; margin: 10px;">
										开始日期：
									</label>
									<div class="input-group" style="width:150px">
										<input class="form-control wk-normal-input Wdate" name="startdate"
											   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"  value ="${ginfo.startdate}" >
									</div>
									<label class="control-label " style="width: 80px; margin: 10px;">
										结束日期：
									</label>
									<div class="input-group" style="width:150px">
										<input class="form-control wk-normal-input Wdate" name="enddate"
											   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" value ="${ginfo.enddate}" >
									</div>

									 
                                    <label class="control-label " style="width: 80px; margin: 10px;">
										物料分类：
									</label>
										<div class="input-group" style="width:150px">
											<select class="form-control" name="type">
											   <option value="">全部</option>
		                                        <c:forEach items="${clist}" var="cinfo" varStatus="status">
													<option <c:if test="${cinfo.name==ginfo.type}">selected</c:if> value="${cinfo.name}">${cinfo.name}</option>
												</c:forEach>
		                                    </select>
										</div>
										
									<div class="input-group">
										<button type="submit"  class="btn btn-primary wk-btn">
											查&nbsp;&nbsp;询
										</button>
									</div>
								</div>
							</form>
						</div>
					<!-- 引入 分页   url里面的改成自己的路径 就是查询列表的这个方法  -->
			   	 
			   	<div align="center">
			   	    <div id="main" style="width: 800px; height: 400px;"></div>
			   	</div> 
			   	  
			   	  
			   	  
					</div>  
				</div>
			</div>
		</div>

		

	</body>
	
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '${title}'
            },
            tooltip: {},
            legend: {
                data:['选项']
            },
            xAxis: {
                data: [${items}]
            },
            yAxis: {},
            series: [{
                name: '选项',
                type: 'bar',
                 itemStyle : { normal:
                    {
                         label : {show: true,formatter: '{c}' 
                         
                         }
                    }
                 },
                data: [${score}]
            }
           
             ]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</html>