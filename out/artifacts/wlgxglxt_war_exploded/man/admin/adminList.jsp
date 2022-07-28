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
           function adminDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path%>/adminDel.action?id="+id;
               }
           }
          
           function adminAdd(){
           		var url="<%=path%>/man/admin/adminAdd.jsp";
				window.location.href=url;
           }		
       </script>
	</head>

	<body class="gray-bg">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
		
		
				<div class="ibox float-e-margins">
					<div class="ibox-title">
                        <h5>员工列表</h5>
                        <div class="ibox-tools">
                            <button type="button" onclick="adminAdd()" class="btn btn-success"><i class="fa fa-plus"></i>添加</button>
                        </div>
                    </div>
		        	<div class="ibox-content">
				
					<!-- 引入 分页   url里面的改成自己的路径 就是查询列表的这个方法  -->
			   		<pg:pager  url="adminList.action" items="${itemSize}" maxPageItems="${pageItem}" 
			   			maxIndexPages="${pageItem}" isOffset="${true}" export="offset,currentPageNumber=pageNumber"  scope="request">
					
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width="100px">编号</th>
								<th>用户名</th>
								<th>姓名</th>
								<th>电话</th>
								<th width="140px">类型</th>
								<c:if test="${sessionScope.admin.id==1}">
								<th width="200px">操作</th>
								</c:if>	
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${adminList}" var="admin" varStatus="status">
		
								<tr>
									<td>${admin.id}</td>
									<td>${admin.uname}</td>
									<td>${admin.name}</td>
									<td>${admin.tel}</td>
									<td>${admin.utype}</td>
									<c:if test="${sessionScope.admin.id==1}">
									<td>
										<c:if test="${admin.id!=1}">
										<a class="btn btn-xs btn-info" href="<%=path%>/toadminEdit.action?id=${admin.id}">
									       修改
										</a>
										<a class="btn btn-xs btn-danger" onclick="adminDel('${admin.id}')">
											删除
										</a>
										</c:if>
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