<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			
	</head>

	<body class="gray-bg">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
                        <h5>修改物料信息</h5>
                    </div>
		        	<div class="ibox-content">

					<form action="<%=path%>/goodsEdit.action" name="formAdd" 
						method="post">
						<div class="panel-body">
								<input name="id" type="hidden" value="${goods.id}" />
								<input name="kcnum" type="hidden" value="${goods.kcnum}" />
								
								<div class="form-inline">
									<div>
										<label class="control-label wk-filed-label">
											编号：
										</label>
										<div class="input-group" style="width:450px">
											<input readonly="readonly" name="bianhao" type="text" value="${goods.bianhao}"
												class="form-control wk-normal-input" />
										</div>
									</div>
								
									<div>
										<label class="control-label wk-filed-label">
											物料名称：
										</label>
										<div class="input-group" style="width:450px">
											<input required="required" name="name" type="text" value="${goods.name}"
												class="form-control wk-normal-input" maxlength="20" />
										</div>
									</div>

									<div>
										<label class="control-label wk-filed-label">
											供货商:
										</label>
										<div class="input-group" style="width:450px">
											<select class="wk-select" name="companyid">
		                                        <c:forEach items="${companyList}" var="company" varStatus="status">
													<option <c:if test="${company.id==goods.companyid}"> selected</c:if> value="${company.id}">${company.name}</option>
												</c:forEach>
		                                    </select>
										</div>
									</div>
									
									
									
									
									<div>
										<label class="control-label wk-filed-label">
											分类:
										</label>
										<div class="input-group" style="width:450px">
											<select class="wk-select" name="type">
		                                        <c:forEach items="${clist}" var="cinfo" varStatus="status">
													<option <c:if test="${cinfo.name==goods.type}"> selected</c:if> value="${cinfo.name}">${cinfo.name}</option>
												</c:forEach>
		                                    </select>
										</div>
									</div>
									
									
									<div>
										<label class="control-label wk-filed-label">
											售价:
										</label>
										<div class="input-group" style="width:450px">
											<input required="required" name="shoujia" type="text"  value="${goods.shoujia}"
												onkeyup="this.value=this.value.replace(/[^\d]/g,'') " onafterpaste="this.value=this.value.replace(/[^\d]/g,'') "
												class="form-control wk-normal-input"   maxlength="5"/>
										</div>
									</div>
									
									
									
									
									<div>
										<label class="control-label wk-filed-label">
											备注：
										</label>
										<div class="input-group" style="width:450px">
											<textarea  required="required" class="form-control wk-normal-input" name="note" rows="5"  maxlength="200">${goods.note}</textarea>
											
										</div>
									</div>
									
									
									
									
									<div>
										<label class="control-label wk-filed-label">
												
										</label>
										
										<div class="input-group">
											<input type="submit" class="btn btn-primary wk-btn" value="保&nbsp;&nbsp;存" />
										
											<input class="btn btn-default wk-btn" type="button" onClick="javascript :history.back(-1);" value="取&nbsp;&nbsp;消"  />
									
										</div>
									</div>
								</div>
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>

	</body>
</html>