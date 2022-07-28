<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//request.getSession().invalidate();
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>化工企业物料供销管理系统</title>
  
    <link rel="shortcut icon" href="man/favicon.ico"> 
    <link href="<%=path %>/bootstrap/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="<%=path %>/bootstrap/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">

    <link href="<%=path %>/bootstrap/css/animate.min.css" rel="stylesheet">
    <link href="<%=path %>/bootstrap/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    

	<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path%>/dwr/interface/loginService.js'></script>
	<script type='text/javascript' src='<%=path%>/dwr/util.js'></script>
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
    <script language="javascript">
			function check1(){
				var userName= document.ThisForm.userName.value; 
				var userPw= document.ThisForm.userPw.value;                                                                                        
		    	if(userName==""){
				 	alert("请输入用户名");
					document.ThisForm.userName.focus();
					return false;
			 	}
				if(userPw==""){
				 	alert("请输入密码");
					document.ThisForm.userPw.focus();
					return false;
			 	}
			 	
			 	var type = 0;
			 	loginService.login(userName,userPw,type,callback);
		 	}
		
			function callback(data){
			   	if(data=="no"){
			        alert("用户名或密码错误");
			    }
			    if(data=="yes"){

			        window.location.href="<%=path %>/loginSuccess.jsp";
				}
			}

			function resets() {
				document.ThisForm.userName.value = "";
				document.ThisForm.userPw.value = "";
			}
		 
		 
		 </script>
</head>

<body class="gray-bg" style=" background-image: url('<%=path %>/images/login-background.png'); background-size: 100%;  background-repeat:no-repeat;">

    <div class="middle-box text-center loginscreen  animated fadeInDown" style="max-width: 1000px;width:1000px; padding-top: 200px">
        <div>
            <div style="    margin-bottom: 50px;">

                <h1 class="logo-name" style="font-size:40px; color:#ffffff!important;">化工企业物料供销管理系统</h1>

            </div>
         
            <form class="m-t"  name="ThisForm" method="POST" action="" style="max-width: 300px;margin: 0 auto;">
            	
                <div class="form-group">
                    <input type="email" name="userName" class="form-control" placeholder="用户名" required="">
                </div>
                <div class="form-group">
                    <input type="password" name="userPw" class="form-control" placeholder="密码" required="">
                </div>
                <button  type="button" onclick="check1();" class="btn btn-primary block full-width m-b">登 录</button>


              </form>
        </div>
    </div>
    <script src="<%=path %>/bootstrap/js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=path %>/bootstrap/js/bootstrap.min.js?v=3.3.5"></script>
    
</body>

</html>