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

<div class="container">
	<a href="/user/join">회원가입</a>
	
	<a href="/user/login">로그인</a>
	<button onClick="javascript:goPost()">로그아웃 POST</button>
	
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
	
	<hr>
	일반 회원 페이지
	<br><a href="/user/detail">내 정보 보기(마이페이지)</a>
	
	<hr>
	관리자 페이지
	<br><a href="/user/list">회원 목록</a>


</div>



<script type="text/javascript">
function goPost(){
    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/user/logout?${_csrf.parameterName}=${_csrf.token}');
    
    document.body.appendChild(f);
    f.submit();
}

</script>
<%@include file="include/footer.jsp"%>
</body>
</html>
