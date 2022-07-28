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
		<script src="<%=path%>/js/jquery-3.2.1.js"></script>
		<script language="javascript" type="text/javascript" src="<%=path%>/My97DatePicker/WdatePicker.js"></script>	
	</head>

	<body class="gray-bg">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
                        <h5>新增进货信息  
                        </h5>
                    </div>
		        	<div class="ibox-content">

					<form action="<%=path%>/jinhuoAdd.action" name="formAdd" 
						method="post">
						<div class="panel-body">
								<input name="type" type="hidden" value="${type}" />
								<div class="form-inline">
								
									<div>
										<label class="control-label wk-filed-label">
											物品名称:
										</label>
										<div class="input-group" style="width:450px">
											<select class="wk-select" name="goodsid">
		                                       	<c:forEach items="${goodsList}" var="goods" varStatus="status">
													<option value="${goods.id}">${goods.name}</option>
												</c:forEach>
		                                    </select>
										</div>
									</div>
									
									

									<div>
										<label class="control-label wk-filed-label">
											时间:
										</label>
										<div class="input-group" style="width:450px">
											<input required="required" class="form-control wk-normal-input Wdate" type="text" 
												name="cdate"  maxlength="20"
												onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"  maxlength="20"/>
										</div>
									</div>
									
									
									
									
									<div>
										<label class="control-label wk-filed-label">
											进货数量：
										</label>
										<div class="input-group" style="width:450px">
											<input required="required" name="num" type="text"
												onkeyup="this.value=this.value.replace(/[^\d]/g,'') " onafterpaste="this.value=this.value.replace(/[^\d]/g,'') "
												class="form-control wk-normal-input"   maxlength="5"/>
										</div>
									</div>
									
									<div>
										<label class="control-label wk-filed-label">
											价格：
										</label>
										<div class="input-group" style="width:450px">
											<input required="required" name="danjia" type="text"
												onkeyup="this.value=this.value.replace(/[^\d]/g,'') " onafterpaste="this.value=this.value.replace(/[^\d]/g,'') "
												class="form-control wk-normal-input"   maxlength="5"/>
										</div>
									</div>
									
									
									
									<div>
										<label class="control-label wk-filed-label">
												
										</label>
										
										<div class="input-group">
											<button class="btn btn-primary wk-btn" type="submit">保&nbsp;&nbsp;存</button>
		                                    <button class="btn btn-white wk-btn"  onClick="javascript :history.back(-1);" type="button">取&nbsp;&nbsp;消</button>
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