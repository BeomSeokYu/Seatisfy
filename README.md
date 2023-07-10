# Seatisfy
좌석 예약 서비스 프로젝트

<br><br><br>



## 팀원

<table>
  <tbody>
    <tr>
      <td align="center"><a href="https://github.com/BeomSeokYu"><img src="https://avatars.githubusercontent.com/u/69231700?v=4" width="100px;" alt=""/><br /><sub><b>BeomSeokYu</b></sub></a><br /></td>
      <td align="center"><a href="https://github.com/kimjisudev"><img src="https://avatars.githubusercontent.com/u/114086659?s=60&v=4" width="100px;" alt=""/><br /><sub><b>kimjisudev</b></sub></a><br /></td>
      <td align="center"><a href="https://github.com/GwonDooHyeon"><img src="https://avatars.githubusercontent.com/u/122503466?v=4" width="100px;" alt=""/><br /><sub><b>GwonDooHyeon</b></sub></a><br /></td>
      <td align="center"><a href="https://github.com/gudwns4825"><img src="https://avatars.githubusercontent.com/u/122503377?v=4" width="100px;" alt=""/><br /><sub><b>gudwns4825</b></sub></a><br /></td>
    </tr>
  </tbody>
</table>

<br><br><br>



## 프로젝트 개요

이 프로젝트는 임의의 장소에 있는 좌석에 대해 누구나 좌석 예약 서비스를 만들고 참여할 수 있도록 하기 위해 개발되었습니다.

#### 프로젝트 목적과 목표
- 기존 좌석 예약 시스템의 문제점
  - 각각의 서비스에서 제공하는 정해진 좌석을 공식적인 일정이 있는 경우 자체적으로 예약 서비스를 실시함
  - 비공식적으로 좌석을 사용하거나 예약 서비스를 제공하지 않는 경우 좌석 예약 서비스를 이용할 수 없음
  - 좌석 배치가 달라지면 서비스 수정 등의 어려움이 생길 수 있음
- 우리 서비스 목표
  - 위의 제시된 문제점을 해결하고자 어떠한 공간에 대한 좌석의 배치를 이용자가 설정하고 등록하여 다른 이용자들이 예약 시스템을 사용할 수 있는 시스템으로 제작
  - 좌석의 예약만을 서비스하여 예약 서비스가 필요한 기업이나 개인이 손쉽게 좌석 예약을 만들고 사용할 수 있는 B2B(Business-to-Business) 비즈니스 모델을 만드는 것이 목표


<br><br><br>



## 기술 스택

#### 🖥️ FE

<a href="https://www.w3.org/TR/html52/" target="_blank">
  <img src="https://img.shields.io/badge/-HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white" alt="HTML5">
</a>
<a href="https://www.w3.org/Style/CSS/" target="_blank">
  <img src="https://img.shields.io/badge/-CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white" alt="CSS3">
</a>
<a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript" target="_blank">
  <img src="https://img.shields.io/badge/-JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black" alt="JavaScript">
</a>
<a href="https://jquery.com" target="_blank">
  <img src="https://img.shields.io/badge/-jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white" alt="jQuery">
</a>
<a href="https://getbootstrap.com" target="_blank">
  <img src="https://img.shields.io/badge/-Bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white" alt="Bootstrap">
</a>

#### ⌨️ BE

<a href="https://openjdk.java.net" target="_blank">
  <img src="https://img.shields.io/badge/-Java-CC0000?style=for-the-badge&logo=openjdk&logoColor=white" alt="Java">
</a>
<a href="https://spring.io" target="_blank">
  <img src="https://img.shields.io/badge/-Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white" alt="Spring">
</a>
<a href="https://jsp.dev" target="_blank">
  <img src="https://img.shields.io/badge/-JSP-007396?style=for-the-badge&logo=jsp&logoColor=white" alt="JSP">
</a>
<a href="https://tomcat.apache.org" target="_blank">
  <img src="https://img.shields.io/badge/-Servlet-007396?style=for-the-badge&logo=servlet&logoColor=white" alt="Servlet">
</a>
<a href="https://tomcat.apache.org" target="_blank">
  <img src="https://img.shields.io/badge/-Apache%20Tomcat-F8DC75?style=for-the-badge&logo=apache%20tomcat&logoColor=black" alt="Apache Tomcat">
</a>
<br>
<a href="https://www.mysql.com" target="_blank">
  <img src="https://img.shields.io/badge/-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL">
</a>
<a href="https://mybatis.org" target="_blank">
  <img src="https://img.shields.io/badge/-MyBatis-1F72B5?style=for-the-badge&logo=fluentd&logoColor=white" alt="MyBatis">
</a>

###
<br><br><br>


## 주요 기능

#### 인증 및 인가

- `Spring Security`를 이용한 인증 및 사용자 역할에 따른 인가 방식을 기본 세션 & 쿠키 방식을 이용해 구현
- 사용자의 역할은 관리자와 회원으로 구분

#### 예약

- `CSS/JS` 를 이용한 좌석 배치 폼 입력
- `kakao 지도 API`를 이용한 장소 입력
- `DB Lock`을 이용한 좌석 예약시 동시 접근 문제 방지

#### 게시판과 댓글

- 모든 게시판 `MyBatis`를 통한 동적 쿼리 작성으로, 옵션 검색과 게시글 수 조정에 대한 페이징 처리
- 예약 게시판 댓글 기능

<br><br><br>

## 상세 내용
- 노션 페이지 참조 - [이동](https://bsnote.notion.site/588db6c83fd142bcaa1c4ef3d269affb?pvs=4)

<br><br><br>


## 프로젝트 결과 소개
- ### 홈페이지 URL
  [Seatisfy (http://bsyu.shop)]([http://actswoori.org/main.jsp](http://bsyu.shop) "Seatisfy")

<br>

- ### 메인페이지
  <div align="center">
    <img src="./screenshot/main.png" width="500px" alt="...">
  </div>

- ### 예약 게시글 목록
  <div align="center">
    <img src="./screenshot/res_list.png" width="500px" alt="...">
  </div>

- ### 예약 게시글 등록
  <div align="center">
    <img src="./screenshot/res_add.png" width="500px" alt="...">
  </div>

- ### 예약 게시글 상세
  <div align="center">
    <img src="./screenshot/res_detail.png" width="500px" alt="...">
  </div>

- ### 예약 기능
  <div align="center">
    <img src="./screenshot/res_detail_modal.png" width="500px" alt="...">
    <img src="./screenshot/res_done.png" width="500px" alt="...">
    <img src="./screenshot/res_detail_modal_2.png" width="500px" alt="...">
  </div>

- ### 공지사항 게시판
  <div align="center">
    <img src="./screenshot/board_list.png" width="500px" alt="...">
    <img src="./screenshot/board_detail.png" width="500px" alt="...">
  </div>

<br><br><br>
