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
		<script src="<%=path %>/js/jquery-3.1.1.js"></script>		
	</head>

	<body class="gray-bg">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
                        <h5>修改客户信息</h5>
                    </div>
		        	<div class="ibox-content">

					<form action="<%=path%>/userEdit.action" name="formAdd" 
						method="post">
						<input name="id" type="hidden" value="${user.id}" />
		 
						<div class="panel-body">
						
							<div class="form-inline">

								<div>
									<label class="control-label wk-filed-label">
									会员编号:
									</label>
									<div class="input-group" style="width:450px">
										<input readonly="readonly" id="huiyuanhao" name="huiyuanhao" type="text"  value="${user.huiyuanhao}"
											class="form-control wk-normal-input" />
									</div>
								</div>
							
								<div>
									<label class="control-label wk-filed-label">
										姓名:
									</label>
									<div class="input-group" style="width:450px">
										<input required="required" id="name" name="name" type="text"  value="${user.name}"
											class="form-control wk-normal-input" maxlength="20" />
									</div>
								</div>
								
									<div>
									<label class="control-label wk-filed-label">
										电话:
									</label>
									<div class="input-group" style="width:450px">
										<input required="required" id="tel" name="tel" type="text" value="${user.tel}"
											class="form-control wk-normal-input"   maxlength="20"/>
									</div>
								</div>

								 
								
							 				<div>
									<label class="control-label wk-filed-label">
										地址:
									</label>
									<div class="input-group" style="width:450px">
										<textarea    class="form-control wk-normal-input" name="address" rows="5"  maxlength="200">${user.address}</textarea>
										
									</div>
								</div>
								
								
								<div>
									<label class="control-label wk-filed-label">
											
									</label>
									
									<div class="input-group">
										<input type="submit"  class="btn btn-primary wk-btn" value="保&nbsp;&nbsp;存" />
									
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
