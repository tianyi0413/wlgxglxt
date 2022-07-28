<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%
	String path = request.getContextPath();
	//request.getSession().invalidate();
%>
<script>
      	  var win=window;
          while(win.parent!=window.top){
          	win=win.parent;
          }
          var url= "<%=path%>/login.jsp";

         
          win.parent.location.replace(url);
           
          <%
          session.invalidate();  
          %>
</script>