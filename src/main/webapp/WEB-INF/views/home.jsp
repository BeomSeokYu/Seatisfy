<%@page import="java.io.Writer"%>
<%@page import="org.springframework.security.web.authentication.WebAuthenticationDetails"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<html>
<%@include file="include/header.jsp"%>
<body>
<%@include file="include/navbar.jsp"%>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<a href="/user/login">로그인</a>
<button onClick="javascript:goPost()">로그아웃 POST</button>

<script type="text/javascript">
function goPost(){
    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/user/logout');
    document.body.appendChild(f);
    f.submit();
}

</script>

<%
	Object details = SecurityContextHolder.getContext().getAuthentication().getDetails();
	if (details instanceof WebAuthenticationDetails) {
	    String sessionId = ((WebAuthenticationDetails) details).getSessionId();
%>
	<br>sessionId : <%=sessionId %>

<%
	    // 세션 ID를 사용하는 코드
	}
%>


<%@include file="include/footer.jsp"%>
</body>
</html>
