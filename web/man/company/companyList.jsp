<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"  %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<!--frame传值后再添加新数据的实现方法尝试页面备份-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link href="<%=path %>/bootstrap/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
		<link href="<%=path %>/bootstrap/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
		<link href="<%=path %>/bootstrap/css/plugins/iCheck/custom.css" rel="stylesheet">
		<link href="<%=path %>/bootstrap/css/animate.min.css" rel="stylesheet" /> 
		<link href="<%=path %>/bootstrap/css/style.min.css?v=4.0.0" rel="stylesheet" />
		
    	<script language="javascript">
           function companyDel(id)
           {
           	   
           	   if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path%>/companyDel.action?id="+id;
               }
           	  
           	   
               
           }
           
           function companyAdd()
           {
                  var url="<%=path%>/companyToAdd.action";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 
				 window.location.href=url;
           }		
       </script>
	</head>


	<body class="gray-bg">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
		
		
				<div class="ibox float-e-margins">
					<div class="ibox-title">
                        <h5>供货商列表</h5>
                        <div class="ibox-tools">
                            <button type="button" onclick="companyAdd()" class="btn btn-success"><i class="fa fa-plus"></i>添加</button>
                        </div>
                    </div>
		        	<div class="ibox-content">		
					<!-- 引入 分页  url="zuopinMana.action"  url里面的改成自己的路径 就是查询列表的这个方法  -->
			   		<pg:pager url="companyList.action" items="${itemSize}" maxPageItems="${pageItem}" 
			   			maxIndexPages="${pageItem}" isOffset="${true}" export="offset,currentPageNumber=pageNumber"  scope="request">
					<!-- 引入 分页  -->
					<table class="table table-bordered" id="memberList">
						<thead>
							<tr>
								<th width="200px">供货商</th>
								<th width="120px">联系人</th>
								<th width="120px">电话</th>
								<th >地址</th>
								<th width="120px">操作</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${companyList}" var="company" varStatus="status">
							<tr>
								<td>${company.name}</td>
								<td>${company.lianxiren}</td>
								<td>${company.tel}</td>
								<td>${company.address}</td>
								<td>
									<a class="btn btn-xs btn-info" href="<%=path%>/tocompanyEdit.action?id=${company.id}">
										编辑
									</a>
									<a class="btn btn-xs btn-danger" onclick="companyDel('${company.id}')">
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