<%@ page language="java" pageEncoding="UTF-8"
%><%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>피아노 공간</title>

    <script language="javascript">
        function show_lesson_popup() { window.open("lesson.jsp", "a", "width=600, height=400, left=100, top=50"); }
    </script>
</head>
<body>
!!!! 여기는 STATIC JSP index 입니다

<h1 style="text-align:center;"> 피 아 노  공 간</h1>

<div style="text-align:center;">
    <img src="../../webapp/resources/images/moon.png">
</div>
<br/>
<br/>
<br/>
<br/>
<div style="text-align:center;">
    <span>학원안내</span>&nbsp
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