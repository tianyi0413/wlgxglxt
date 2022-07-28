<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
%>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<title>化工企业物料供销管理系统</title>
	<link rel="shortcut icon" href="favicon.ico"/>
	<script type="text/javascript" src="<%=path%>/js/jquery-3.1.1.js"></script>
	<link href="<%=path %>/bootstrap/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
	<link href="<%=path %>/bootstrap/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
	<link href="<%=path %>/bootstrap/css/plugins/iCheck/custom.css" rel="stylesheet">
	<link href="<%=path %>/bootstrap/css/animate.min.css" rel="stylesheet" /> 
	<link href="<%=path %>/bootstrap/css/style.min.css?v=4.0.0" rel="stylesheet" />
	<script language='javascript'>
			function logout(){
				if(confirm("您确定要退出化工企业物料供销管理系统吗？")) {
					top.location = "<%=path%>/logout.jsp";
					return true;
				}
				return false;
			}
			function openPw(){
				 var url="<%=path%>/man/admin/adminPw.jsp";
				 window.location.href=url;
			}
			
			
			
			
	    </script>
</head>

<body class="fixed-sidebar full-height-layout gray-bg"
	style="overflow: hidden">
		<div style="color:red;width:100%;height:90px;"   >
	  ddd
	   </div>
	<div id="wrapper">

		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side"   role="navigation" style="margin-top: -10px;">
 
		<div class="sidebar-collapse" >
			<ul class="nav" id="side-menu" >
				 
		
		<!-- 管理员 -->
		
		<c:if test="${userType==0}">

			<c:if test="${sessionScope.admin.utype=='管理员'}">


<li>
			<a class="J_menuItem"  href='<%=path%>/toWeclome.action' >
				<i class="fa fa-user"></i> <span class="nav-label">首页</span>
			</a>
		</li>
		
		
		<li>
			<a class="J_menuItem"  href='<%=path%>/adminList.action' >
				<i class="fa fa-user"></i> <span class="nav-label">员工管理</span>
			</a>
		</li>
		
		<li>
			<a class="J_menuItem" href="<%=path %>/companyList.action">
				 <i class="fa fa-twitter"></i> <span class="nav-label">供货商管理</span>
			</a>
		</li>
		
		
		<li>
			<a class="J_menuItem" href="<%=path%>/userList.action">
				 <i class="fa fa-user-secret"></i> <span class="nav-label">客户管理</span>
			</a>
		</li>
		
		
		
		<li>
			<a class="J_menuItem" >
				<i class="fa fa-desktop "></i> <span class="nav-label">物料管理</span><span class="fa arrow"></span> 
			</a>
			<ul class="nav nav-second-level">
				<li>
					<a class="J_menuItem" href='<%=path %>/catelogList.action'>物料分类管理</a>
				</li>
				<li>
					<a class="J_menuItem"  href='<%=path %>/goodsList.action'>物料管理</a>
				</li>
				
			</ul>
		</li>
		

		
		 
		
		<li>
			<a class="J_menuItem" href='<%=path %>/kucunList.action'>
				<i class="fa fa-bell"></i> <span class="nav-label">库存管理</span>
			</a>
		</li>
		
		<li>
			<a class="J_menuItem" href='<%=path%>/jinhuoList.action?type=1' >
				<i class="fa fa-shopping-cart"></i> <span class="nav-label">入库管理</span>
			</a>
			
		</li>
		
		
		<li>
			<a class="J_menuItem" >
				<i class="fa fa-desktop "></i> <span class="nav-label">出库管理</span><span class="fa arrow"></span> 
			</a>
			<ul class="nav nav-second-level">
				<li>
					<a class="J_menuItem" href='<%=path%>/orderList.action?type=1'>物料销售</a>
				</li>
				<li>
					<a class="J_menuItem"  href='<%=path %>/orderList.action?type=0'>客户退货</a>
				</li>
				
			</ul>
		</li>
		
			<li>
			<a class="J_menuItem" >
				<i class="fa fa-desktop "></i> <span class="nav-label">统计分析</span><span class="fa arrow"></span> 
			</a>
			<ul class="nav nav-second-level">
				<li>
					<a class="J_menuItem" href='<%=path%>/report1.action'>采购统计</a>
				</li>
				<li>
					<a class="J_menuItem"  href='<%=path %>/report2.action'>销售统计</a>
				</li>
				
			</ul>
		</li>
			</c:if>


			<c:if test="${sessionScope.admin.utype=='销售'}">





				<li>
					<a class="J_menuItem" >
						<i class="fa fa-desktop "></i> <span class="nav-label">物料管理</span><span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">

						<li>
							<a class="J_menuItem"  href='<%=path %>/goodsList.action'>物料管理</a>
						</li>

					</ul>
				</li>


				<li>
					<a class="J_menuItem" >
						<i class="fa fa-desktop "></i> <span class="nav-label">出库管理</span><span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<a class="J_menuItem" href='<%=path%>/orderList.action?type=1'>物料销售</a>
						</li>
						<li>
							<a class="J_menuItem"  href='<%=path %>/orderList.action?type=0'>客户退货</a>
						</li>

					</ul>
				</li>

				<li>
					<a class="J_menuItem" >
						<i class="fa fa-desktop "></i> <span class="nav-label">统计分析</span><span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">

						<li>
							<a class="J_menuItem"  href='<%=path %>/report2.action'>销售统计</a>
						</li>

					</ul>
				</li>
			</c:if>


			<c:if test="${sessionScope.admin.utype=='采购'}">





				<li>
					<a class="J_menuItem" >
						<i class="fa fa-desktop "></i> <span class="nav-label">物料管理</span><span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">

						<li>
							<a class="J_menuItem"  href='<%=path %>/goodsList.action'>物料管理</a>
						</li>

					</ul>
				</li>



				<li>
					<a class="J_menuItem" href='<%=path%>/jinhuoList.action?type=1' >
						<i class="fa fa-shopping-cart"></i> <span class="nav-label">入库管理</span>
					</a>

				</li>


				<li>
					<a class="J_menuItem" >
						<i class="fa fa-desktop "></i> <span class="nav-label">统计分析</span><span class="fa arrow"></span>
					</a>
					<ul class="nav nav-second-level">
						<li>
							<a class="J_menuItem" href='<%=path%>/report1.action'>采购统计</a>
						</li>

					</ul>
				</li>
			</c:if>
		
		
		</c:if>
		

		
		</ul>
	</div>
	</nav>
	<!--左侧导航结束-->
	<!--右侧部分开始-->
	<div id="page-wrapper" class="gray-bg dashbard-1"   >
		<div class="row border-bottom">
			<nav class="navbar navbar-fixed-top" role="navigation" style="margin-bottom: 0;">
					<a class="navbar-header-txt">化工企业物料供销管理系统 </a>
					
					
					<div class="navbar-header-userinfo fr" >
			        	<div class="user-photo fl" >
			            	
			          	</div>
			          	<div class="user-info fl" >
			          		<div class="logout">
			          		<a id="riqi"></a> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			          		
			          	     	<a onclick="return logout()"> 
									<i class="fa fa-sign-out" style="margin-right: 6px;"></i>退出 </a></div>
			          		<div>
				          	<ul class="nav navbar-top-links navbar-left" style="background: #3333339e;border-radius: 4px;margin-left: 20px;">
				 
								<li class="dropdown hidden-xs" >
									<a class="dropdown-toggle" ata-toggle="dropdown" data-toggle="dropdown" href="#" aria-expanded="true">
									<c:if test="${sessionScope.userType==0}">
									          	<c:if test="${sessionScope.admin.id==1}">超级管理员</c:if>
									            <c:if test="${sessionScope.admin.id!=1}">${sessionScope.admin.utype}</c:if>
									      </c:if>
										 <c:if test="${sessionScope.userType==0}"> 
										    ${sessionScope.admin.uname }
										</c:if>
									 
										<i class="fa fa-angle-down"  style="font-size:18px;margin-left: 6px;"></i> 
									</a>
				                   	<ul  class="dropdown-menu">
										<li>
											<a class="J_menuItem" href="<%=path%>/man/admin/adminPw.jsp">修改密码</a>
										</li>
										
										<li class="divider"></li>
										<li onclick="return logout()">
											<a >安全退出</a>
										</li>
									</ul>
								</li>
							</ul>
							</div>
						</div>
			        </div>
					
					
				</nav>
		</div>
 
		<div class="row J_mainContent" id="content-main" >
			<iframe class="J_iframe" id="iframe0" name="iframe0" width="100%" height="100%" src="<%=path %>/toWeclome.action" frameborder="0" data-id="welcome.jsp"
				seamless></iframe>
		</div>
 
	</div>
	<!--右侧部分结束-->
	
	
	
	<script src="<%=path %>/bootstrap/js/jquery.min.js?v=2.1.4"></script>
	<script src="<%=path %>/bootstrap/js/bootstrap.min.js?v=3.3.5"></script>
	<script src="<%=path %>/bootstrap/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="<%=path %>/bootstrap/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="<%=path %>/bootstrap/js/plugins/layer/layer.min.js"></script>
	<script src="<%=path %>/bootstrap/js/hplus.min.js?v=4.0.0"></script>
	<script type="text/javascript" src="<%=path %>/bootstrap/js/contabs.min.js"></script>
	<script src="<%=path %>/bootstrap/js/plugins/pace/pace.min.js"></script>
	
	<script type="text/javascript">
		
			//获取当前时间，格式YYYY-MM-DD
		    function getNowFormatDate() {
		        var date = new Date();
		        var seperator1 = "-";
		        var year = date.getFullYear();
		        var month = date.getMonth() + 1;
		        var strDate = date.getDate();
		        if (month >= 1 && month <= 9) {
		            month = "0" + month;
		        }
		        if (strDate >= 0 && strDate <= 9) {
		            strDate = "0" + strDate;
		        }
		        var currentdate = year + seperator1 + month + seperator1 + strDate;
		        $('#riqi').append(currentdate);
		        
		    }
			$(document).ready(function(){
			    getNowFormatDate();
			});
			
			
	    </script>
</body>

</html>