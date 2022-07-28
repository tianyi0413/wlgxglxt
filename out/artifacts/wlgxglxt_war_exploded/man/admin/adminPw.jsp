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
		
		
		<script type="text/javascript" src="<%=path%>/js/jquery-3.1.1.js"></script>
		<link href="<%=path %>/bootstrap/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
		<link href="<%=path %>/bootstrap/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
		<link href="<%=path %>/bootstrap/css/plugins/iCheck/custom.css" rel="stylesheet">
		<link href="<%=path %>/bootstrap/css/animate.min.css" rel="stylesheet" /> 
		<link href="<%=path %>/bootstrap/css/style.min.css?v=4.0.0" rel="stylesheet" />
			
		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>	
			
		<script language="javascript">
            function check()
            {
                 var userPwReal="";
                 <c:if test="${sessionScope.userType==0}">
                 	userPwReal="${sessionScope.admin.upwd}";
                 </c:if>
               
                 <c:if test="${sessionScope.userType==1}">
                 	userPwReal="${sessionScope.user.upwd}";
                 </c:if>
                 
                 
                 if(document.formPw.userPw.value !=userPwReal)
                 {
                     alert("原密码不正确");
                     return ;
                 }
                 
                 if(document.formPw.userPw1.value ==""){
                     alert("新密码不能空");
                     return ;
                 }
                 
                 //document.getElementById("indicator").style.display="block";
                 loginService.adminPwEdit(document.formPw.userPw1.value,callback);
            }
            function callback(data){
            	if(data=='yes'){
            		alert("修改成功");
            		window.location.href="<%=path%>/man/welcome.jsp";
            		
            	}
                
            }
        </script>
	</head>

	<body class="gray-bg">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
                        <h5>修改密码</h5>
                    </div>
		        	<div class="ibox-content">
					<form action="" name="formPw"
						method="post">
						<div class="panel-body">
							<input name="id" type="hidden" value="${sessionScope.admin.id}"/>
							<div class="form-inline">
								<div>
									<label class="control-label wk-filed-label">
										登录账号:
									</label>
									<div class="input-group" style="width:340px">
										<c:if test="${sessionScope.userType==0}">
										<input readonly="readonly" name="uname" type="text" 
											class="form-control wk-normal-input"  value="${sessionScope.admin.uname}"/>
										</c:if>
									
											<c:if test="${sessionScope.userType==1}">
										<input readonly="readonly" name="uname" type="text" 
											class="form-control wk-normal-input"  value="${sessionScope.user.uname}"/>
										</c:if>	
										
										
									
									</div>
								</div>

								<div>
									<label class="control-label wk-filed-label">
										旧密码:
									</label>
									<div class="input-group" style="width:340px">
										<input required="required" name="userPw" type="password"
											class="form-control wk-normal-input" 
											placeholder="请输入登录密码" />
									</div>
								</div>
								
								<div>
									<label class="control-label wk-filed-label">
										新密码:
									</label>
									<div class="input-group" style="width:340px">
										<input required="required" name="userPw1" type="password"
											class="form-control wk-normal-input" 
											placeholder="请输入登录密码" />
									</div>
								</div>
								
								<div>
									<label class="control-label wk-filed-label">
											
									</label>
									<div class="input-group">
										<input type="button" onclick="check()" class="btn btn-primary wk-btn" value="保&nbsp;&nbsp;存" />
										
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