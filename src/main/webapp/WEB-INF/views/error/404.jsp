<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="../include/header.jsp" %>
<style>
@media (min-width: 992px) {
  #mainNav {
    border-bottom: 1px solid transparent;
    background: transparent;
  }
  #mainNav .navbar-brand {
    color: rgb(255, 255, 255);
  }
  #mainNav .navbar-brand:focus, #mainNav .navbar-brand:hover {
    color: rgb(255, 255, 255);
  }
  #mainNav .navbar-nav > li.nav-item > a.nav-link {
    color: rgb(255, 255, 255);
  }
  #mainNav .navbar-nav > li.nav-item > a.nav-link:focus, #mainNav .navbar-nav > li.nav-item > a.nav-link:hover {
    color: rgb(255, 255, 255);
  }
}
@media (min-width: 992px) {
  #mainNav {
    transition: background-color 0.2s;
    /* Force Hardware Acceleration in WebKit */
    transform: translate3d(0, 0, 0);
    -webkit-backface-visibility: hidden;
    backface-visibility: hidden;
  }
  #mainNav.is-fixed {
    /* when the user scrolls down, we hide the header right above the viewport */
    position: fixed;
    top: -83px;
    transition: transform 0.2s;
    border-bottom: 1px solid white;
    background-color: rgba(255, 255, 255, 0.9);
    transform: translate3d(0, 0%, 0);
  }
  #mainNav.is-fixed .navbar-brand {
    color: #212529;
  }
  #mainNav.is-fixed .navbar-brand:focus, #mainNav.is-fixed .navbar-brand:hover {
    color: #0085A1;
  }
  #mainNav.is-fixed .navbar-nav > li.nav-item > a {
    color: #212529;
  }
  #mainNav.is-fixed .navbar-nav > li.nav-item > a:focus, #mainNav.is-fixed .navbar-nav > li.nav-item > a:hover {
    color: #0085A1;
  }
  #mainNav.is-visible {
    /* if the user changes the scrolling direction, we show the header */
    transform: translate3d(0, 100%, 0);
  }
  
  body {
	  padding-top: 0PX;
	}
}
</style>
    <body>
<%@include file="../include/navbar.jsp" %>
<div class="container">
	<img src="/resources/img/404.jpg" style="width: 100%"/>
</div>
<%@include file="../include/footer.jsp" %>
    </body>
</html>
    