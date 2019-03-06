<%@ page language="java" pageEncoding="UTF-8"
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>연습실 및 레슨 공간</title>
</head>
<body>
<br/><br/><br/><br/>
<br/><br/><br/>
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

<script language="javascript">
    function show_member_popup() { window.open("/manage/member", "a", "width=700, height=500, left=100, top=50"); }
    // function show_lesson_popup() { window.open("/lesson", "a", "width=700, height=500, left=100, top=50"); }
    function show_lesson_popup() { window.location.href="/lesson";  }
</script>
<style>
    body {
        background-image: url("/resources/images/nightSky.jpg");
        color : white;
    }
</style>
<!--
Universe Color Scheme

0F193B
202C54
353F62
826B57
824B31
733A2A
-->

</body>
</html>