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
 
           function kucunAdd(){
           		var url="<%=path%>/kucunToAdd.action";
				window.location.href=url;
           }		
       </script>
	</head>

	<body class="gray-bg">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
		
		
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>库存管理</h5>
                    </div>
		        	<div class="ibox-content">
		        	<div class="alert alert-danger">
		        		<label style="float:left">库存数量不足10，数量显示颜色为</label><div style="height:20px;width:30px;background-color: #FF5722;float: left;"></div>，<label>请尽快进货</label>
                       
                    </div>


						<div class="ibox-content">
							<div class="ibox-content m-b-sm border-bottom">
								<form action="<%=path%>/kucunList.action" name="formAdd" method="post"  >
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

					<!-- 引入 分页   url里面的改成自己的路径 就是查询列表的这个方法  -->
			   		<pg:pager  url="jinhuoList.action" items="${itemSize}" maxPageItems="${pageItem}" 
			   			maxIndexPages="${pageItem}" isOffset="${true}" export="offset,currentPageNumber=pageNumber"  scope="request">
					<pg:param name="type" value="${type}" />
					<table  class="table table-bordered">
						<thead>
							<tr>
								<th width="200px">物料编号</th>
								<th>名称</th>
								<th width="100px">数量</th>
								<th width="140px">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${kucunList}" var="kucun" varStatus="status">
							<tr>
								<td> <a style="text-decoration:underline;color:blue;"  href="<%=path%>/togoodsView.action?id=${kucun.id}">${kucun.bianhao}</a></td>
								<td>${kucun.name}</td>
								<c:if test="${kucun.kcnum<10}"><td style="background-color: #FF5722;color:#fff;">${kucun.kcnum}</td></c:if> 
								<c:if test="${kucun.kcnum>=10}"><td>${kucun.kcnum}</td></c:if> 
				
								
								<td>
								 
									<a class="btn btn-xs btn-success" href="<%=path%>/tokucunEdit.action?id=${kucun.id}">
										修改
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