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

		<script language="javascript">
           function orderDel(id){
               if(confirm('您确定删除吗？')){
                   window.location.href="<%=path%>/orderDel.action?id="+id;
               }
           }
           function orderTui(id){
               if(confirm('您确定退货吗？')){
                   window.location.href="<%=path%>/orderTui.action?id="+id;
               }
           }

 
           
          
           function orderAdd(type){
           		<c:if test="${type==1}">
           		var url="<%=path%>/orderToAdd.action?type=${type}";
				window.location.href=url;
				</c:if>
				
				<c:if test="${type==0}">
           		var url="<%=path%>/orderToAdd2.action?type=${type}";
				window.location.href=url;
				</c:if>
           }		
       </script>
	</head>

	<body class="gray-bg">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
		
		
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>物料销售</h5>
						<c:if test="${type!=0}">
	                    <div class="ibox-tools">
                            <button type="button" onclick="orderAdd()" class="btn btn-success"><i class="fa fa-plus"></i>添加</button>
                        </div>
                        </c:if>
                    </div>
		        	<div class="ibox-content">


						<div class="ibox-content m-b-sm border-bottom">
							<form action="<%=path%>/orderList.action" name="formAdd" method="post"  >
								<input type="hidden" name="type"  value="${type}" />
								<div class="form-inline">
									<label class="control-label " style="width: 80px; margin: 10px;">
										开始日期：
									</label>
									<div class="input-group" style="width:150px">
										<input class="form-control wk-normal-input Wdate" name="startDate"
											   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"  value ="${startDate}" >
									</div>
									<label class="control-label " style="width: 80px; margin: 10px;">
										结束日期：
									</label>
									<div class="input-group" style="width:150px">
										<input class="form-control wk-normal-input Wdate" name="endDate"
											   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" value ="${endDate}" >
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
			   		<pg:pager  url="orderList.action" items="${itemSize}" maxPageItems="${pageItem}" 
			   			maxIndexPages="${pageItem}" isOffset="${true}" export="offset,currentPageNumber=pageNumber"  scope="request">
					<pg:param name="type" value="${type}" />
					<table  class="table table-bordered">
						<thead>
							<tr>
								<th width="160px">订单编号</th>
								<th>物料名称</th>
								
								<th width="160px">用户</th>
								
								<th width="100px">时间</th>
								<th width="60px">数量</th>
								<th width="80px">总价</th>
								<th width="80px">状态</th>
								<th width="160px">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orderList}" var="order" varStatus="status">
							<tr>
								<td>${order.bianhao}</td>
								<td>${order.goodsname}</td>
								<td>${order.uname}</td>
								<td>${order.cdate}</td>
								<td>${order.num}</td>
								<td>${order.zongjia}</td>
								<td>
			 
									<c:if test="${order.tuihuodan!=null&&order.tuihuodan!=''}">已退货</c:if>
								</td>
								<td>
									<c:if test="${type==1}">
										<c:if test="${order.tuihuodan==null||order.tuihuodan==''}">
											<a class="btn btn-xs btn-warning" onclick="orderTui('${order.id}')">
												退货
											</a>
										</c:if>

									 

									</c:if>
									<a class="btn btn-xs btn-danger" onclick="orderDel('${order.id}')">
										删除
									</a>	
								</td>
							</tr>
							</c:forEach>
						</tbody>

					</table>
					<!-- 引入 分页  -->
					<pg:index>
					 	<jsp:include page="/man/pagination_tag.jsp" flush="true" />
					</pg:index>
					</pg:pager> 
					</div>  
				</div>
			</div>
		</div>

		

	</body>
</html>