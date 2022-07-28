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
                        <h5>新增</h5>
                    </div>
		        	<div class="ibox-content">
					<form action="<%=path%>/catelogAdd.action" name="formAdd" 
						method="post">
						<div class="panel-body">
						
								<div class="form-inline">
								
									<div>
										<label class="control-label wk-filed-label">
											 名称:
										</label>
										<div class="input-group" style="width:450px">
											<input required="required" name="name" type="text"
												class="form-control wk-normal-input" maxlength="100" />
										</div>
									</div>
									
									
									 
									
									
									<div>
										<label class="control-label wk-filed-label">
												
										</label>
										
										<div class="input-group">
											<button class="btn btn-primary wk-btn" type="submit">提&nbsp;&nbsp;交</button>
		                                    <button class="btn btn-white wk-btn" type="reset">重&nbsp;&nbsp;置</button>
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

			