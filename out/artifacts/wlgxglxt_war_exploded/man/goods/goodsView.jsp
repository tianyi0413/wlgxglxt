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
                        <h5>查看物料信息</h5>
                    </div>
		        	<div class="ibox-content">

					<form >
						<div class="panel-body">
								<input name="id" type="hidden" value="${goods.id}" />
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
											服装名称：
										</label>
										<div class="input-group" style="width:450px">
											<input readonly="readonly" name="name" type="text" value="${goods.name}"
												class="form-control wk-normal-input" maxlength="20" />
										</div>
									</div>

									<div>
										<label class="control-label wk-filed-label">
											供货商:
										</label>
										<div class="input-group" style="width:450px">
										
											<input readonly="readonly" name="companyname" type="text" value="${goods.companyname}"
												class="form-control wk-normal-input"   maxlength="20"/>
										</div>
									</div>
									
									
									
									
									<div>
										<label class="control-label wk-filed-label">
											分类:
										</label>
										<div class="input-group" style="width:450px">
											<input readonly="readonly" name="type" type="text" value="${goods.type}"
												class="form-control wk-normal-input"   maxlength="20"/>
										</div>
									</div>
									
									
									<div>
										<label class="control-label wk-filed-label">
											售价:
										</label>
										<div class="input-group" style="width:450px">
											<input readonly="readonly" name="shoujia" type="text"  value="${goods.shoujia}"
												class="form-control wk-normal-input"   maxlength="5"/>
										</div>
									</div>
									
									
									
									
									<div>
										<label class="control-label wk-filed-label">
											备注：
										</label>
										<div class="input-group" style="width:450px">
											<textarea  readonly="readonly" class="form-control wk-normal-input" name="note" rows="5"  maxlength="200">${goods.note}</textarea>
											
										</div>
									</div>
									
									
									
									
									<div>
										<label class="control-label wk-filed-label">
												
										</label>
										
										<div class="input-group">
										
											<input class="btn btn-default wk-btn" type="button" onClick="javascript :history.back(-1);" value="关&nbsp;&nbsp;闭"  />
									
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