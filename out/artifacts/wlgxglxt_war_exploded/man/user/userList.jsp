<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
           function userDel(id){
               if(confirm('您确定删除吗？')){
                   window.location.href="<%=path%>/userDel.action?id="+id;
               }
           }
           
 
          
           function userAdd(){
           		var url="<%=path%>/userToAdd.action";
				window.location.href=url;
           }	
 
           
       </script>
	</head>

	<body class="gray-bg">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
		
		
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>客户列表</h5>
						<div class="ibox-tools">
							<button type="button" onclick="userAdd()" class="btn btn-success"><i class="fa fa-plus"></i>添加</button>
					 
						</div>
                    </div>
		        	<div class="ibox-content">
					<!-- 引入 分页   url里面的改成自己的路径 就是查询列表的这个方法  -->
			   		<pg:pager  url="userList.action" items="${itemSize}" maxPageItems="${pageItem}" 
			   			maxIndexPages="${pageItem}" isOffset="${true}" export="offset,currentPageNumber=pageNumber"  scope="request">
					
					<table  class="table table-bordered">
						<thead>
							<tr>
								<th width="140px">编号</th>

								<th width="120px">名称</th>
							 
								<th>联系方式</th>
							 <th>地址</th>
								<th width="200px">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList}" var="user" varStatus="status">
		
								<tr>
									<td>${user.huiyuanhao}</td>

									<td>${user.name}</td>
								 
									<td>${user.tel}</td>
									<td>${user.address}</td>
									<td>
								 
									
										<a class="btn btn-xs btn-success" href="<%=path%>/touserEdit.action?id=${user.id}">
											编辑
										</a>
										
										<a class="btn btn-xs btn-danger" onclick="userDel('${user.id}')">
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