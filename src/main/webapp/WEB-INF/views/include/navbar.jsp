<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light is-visible is-fixed" id="mainNav">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="/">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            	메뉴
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto py-4 py-lg-0">
            	<li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle px-lg-3 py-3 py-lg-4" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				        소개
				    </a>
				    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				        <li><a class="dropdown-item" href="/intro">서비스 소개</a></li>
				        <li><a class="dropdown-item" href="/how">이용 방법</a></li>
				    </ul>
				</li>
                <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/reserve">예약</a></li>
                <li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle px-lg-3 py-3 py-lg-4" href="/notice" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				        지원
				    </a>
				    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				        <li><a class="dropdown-item" href="/notice">공지사항</a></li>
				        <li><a class="dropdown-item" href="/qnas">자주 묻는 질문(QnA)</a></li>
				    </ul>
				</li>
                <sec:authorize access="isAnonymous()">
                <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/login">로그인</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
				
                <li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle px-lg-3 py-3 py-lg-4 currentUser" href="/user/detail" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<sec:authentication var="sessionId" property="name" />
				    </a>
				    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				        <li><a class="dropdown-item" href="/user/detail">마이페이지</a></li>
				        <li><a class="dropdown-item" href="/reserve/mypost">내 예약 게시글 보기</a></li>
				        <li><a class="dropdown-item" href="/reserve/myreser">내 좌석 보기</a></li>
				        <li><a class="dropdown-item" href="#" onClick="javascript:logoutPost()">로그아웃</a></li>
				        <sec:authorize access="hasRole('ROLE_ADMIN')">
					        <li><a class="dropdown-item" href="/user/list">회원 목록</a></li>
						</sec:authorize>
				    </ul>
				</li>
				</sec:authorize>
            </ul>
        </div>
    </div>
</nav>

<script type="text/javascript">
function logoutPost(){
    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/user/logout?${_csrf.parameterName}=${_csrf.token}');
    
    document.body.appendChild(f);
    f.submit();
}

getName('${sessionId}')
function getName(email) {
	fetch("/uname", {	
		method: "post",
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded',
			'X-CSRF-TOKEN': '${ _csrf.token }'
		},
		body: new URLSearchParams({
				username: email
			})
        })
		.then(resp => resp.json())
		.then(data => {
			$('.currentUser').text(data.name);
		})
}
</script>