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
		<script language="javascript">
           function goodsDel(id){
               if(confirm('您确定删除吗？')){
                   window.location.href="<%=path%>/goodsDel.action?id="+id;
               }
           }
          
           function goodsAdd(){
           		var url="<%=path%>/goodsToAdd.action";
				window.location.href=url;
           }		
       </script>
	</head>

	<body class="gray-bg">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="ibox float-e-margins">



						<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>物料列表</h5>

						<c:if test="${sessionScope.admin.utype=='管理员'}">
	                    <div class="ibox-tools">
                            <button type="button" onclick="goodsAdd()" class="btn btn-success"><i class="fa fa-plus"></i>添加</button>
                        </div>
						</c:if>


						<div class="ibox-content">
							<div class="ibox-content m-b-sm border-bottom">
								<form action="<%=path%>/goodsList.action" name="formAdd" method="post"  >
									<input type="hidden" name="type"  value="${type}" />
									<div class="form-inline">

										<label class="control-label " style="width: 80px; margin: 10px;">
											物料名称：
										</label>
										<div class="input-group" style="width:150px">
											<input class="form-control wk-normal-input Wdate" name="name"
												 value ="${name}" >
										</div>
										<div class="input-group">
											<button type="submit"  class="btn btn-primary wk-btn">
												查&nbsp;&nbsp;询
											</button>
										</div>
									</div>
								</form>
							</div>

                    </div>
		        	<div class="ibox-content">
					<!-- 引入 分页   url里面的改成自己的路径 就是查询列表的这个方法  -->
			   		<pg:pager  url="goodsList.action" items="${itemSize}" maxPageItems="${pageItem}" 
			   			maxIndexPages="${pageItem}" isOffset="${true}" export="offset,currentPageNumber=pageNumber"  scope="request">
					
					<table  class="table table-bordered">
						<thead>
							<tr>
								<th width="160px">物品编号</th>
								<th>名称</th>
								<th width="180px">供货商</th>
								<th width="120px">分类</th>
								<th width="80px">售价</th>

								<c:if test="${sessionScope.admin.utype=='管理员'}">
								<th width="120px">操作</th>
								</c:if>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${goodsList}" var="goods" varStatus="status">
							<tr>
								<td> <a style="text-decoration:underline;color:blue;"  href="<%=path%>/togoodsView.action?id=${goods.id}">${goods.bianhao}</a></td>
								
								<td>${goods.name}</td>
								<td>${goods.companyname}</td>
								<td><span class="label label-primary">${goods.type}</span></td>
								
								<td>${goods.shoujia}</td>
								<c:if test="${sessionScope.admin.utype=='管理员'}">
									<td>
										
										<a class="btn btn-xs btn-success" href="<%=path%>/togoodsEdit.action?id=${goods.id}">
											修改
										</a>
										
										<a class="btn btn-xs btn-danger" onclick="goodsDel('${goods.id}')">
											删除
										</a>	
									</td>
								</c:if>
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