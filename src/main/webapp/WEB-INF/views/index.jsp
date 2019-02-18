<%@ page language="java" pageEncoding="UTF-8"
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>연습실 및 레슨 공간</title>

    <script language="javascript">
        function show_lesson_popup() { window.open("/lesson", "a", "width=600, height=400, left=100, top=50"); }
        function show_member_popup() { window.open("/manage/member", "a", "width=700, height=500, left=100, top=50"); }
    </script>
</head>
<body>
!!!! 여기는 WEB-INF의 views의 JSP index 입니다

<h1 style="text-align:center;"> 연 습 실  공 간</h1>

<div style="text-align:center;">
    <img src="/resources/images/moon.png" width="25%">
</div>
<br/>
<br/>
<br/>
<br/>
<div style="text-align:center;">
    <span onclick="show_member_popup()" style="cursor:pointer;">회원관리</span>&nbsp
    <span onclick="show_lesson_popup()" style="cursor:pointer;">레슨시간표</span>&nbsp
    <span>연습실예약</span>&nbsp
    <span>게시판</span>
</div>

<br/>
<br/>
<br/>
<div style="text-align:center;">
    <span>로그인</span>
    <span> / </span>
    <span>회원가입</span>
</div>
<div style="text-align:center;">
    <span>로그아웃</span>
    <span> / </span>
    <span>내정보 수정</span>
</div>

<br/>
<br/>
<br/>
<hr>
<br/>
<div style="text-align:center;">
    <span>위치 : </span>
</div>
<div style="text-align:center;">
    <span>Tel : </span>
</div>

</body>
</html>