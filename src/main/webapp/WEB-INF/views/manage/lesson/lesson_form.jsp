<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>레슨 시간표 추가/수정</title>
    <script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
    <style>
        .text-center{text-align:center}
        table {
            width: 100%;
            border:1px solid;
            border-collapse: collapse;
            text-align:center;
        }
        th, td {
            border: 1px solid;
        }
    </style>
</head>
<body>
<table id="allMemberList">
    <thead>
    <tr>
        <th></th>
        <th>m_id</th>
        <th>ID</th>
        <th>이름</th>
        <th>메일</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="member" items="${memberList}" varStatus="status">
        <c:if test="${member.status eq 1}">
        <tr>
            <td class="text-center">
                <input type="radio" name="selectMember" value="${member.m_id}" />
            </td>
            <td class="text-center" id="m_id">${member.m_id}</td>
            <td class="text-center" id="id">${member.id}</td>
            <td class="text-center" id="name">${member.name}</td>
            <td class="text-center" id="email">${member.email}</td>
        </tr>
        </c:if>
    </c:forEach>
    </tbody>
</table>
<br/>
<div>
    <span>회원이름 : </span><span id="select_name"></span><br/>
    <span>시간 : </span><span id="start"></span> ~ <span id="end"></span>
</div><br/>
<button type="button" onclick="selectMember()">회원 선택</button><br/>



<script>
    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
    var startTime = getParameterByName('startDate');
    var endTime = getParameterByName('endDate');
    $("#start").text(startTime);
    $("#end").text(endTime);

    $('table#allMemberList tbody tr').click(function () {
        $('table#allMemberList tbody tr').css({backgroundColor: "white", color: "black"});
        $('table#allMemberList tbody tr td input:radio').attr('checked', false);

        $(this).find('td input:radio').attr('checked', true);
        $("#select_name").text($(this).find('td#name').text());
        $(this).css({backgroundColor: "#353F62", color: "white"});
    });

    function selectMember() {
        var m_id = parseInt($('input[name="selectMember"]:checked').val());
        var name = $('input[name="selectMember"]:checked').parent().parent().find('td#name').text();

        console.log("m_id : " +m_id +"\nname : " +name);
        if (confirm("회원 " +name +"님을 선택하시겠습니까?")) {

            var start_time = $("#start").text();
            var end_time = $("#end").text();
            var newLesson = JSON.stringify({l_id: 0, start : start_time, end: end_time, m_id: m_id});
            console.log(newLesson);

            $.ajax({
                url: "/manage/lesson/insert",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: newLesson,
                cache: false,
                success : function(res) {
                    alert(res.message);
                    console.log(res.message);
                    if(!res.result) {
                        return false;
                    }
                },
                error: function(request,status, error) {
                    console.log(request.readyState +" : " +status);
                    alert('there was an error while fetching events!');
                    if (request.readyState === XMLHttpRequest.DONE) {
                        console.log(" 응답 받았음 ");
                        if (request.status === 200) {
                            console.log(" 이상 없음! ");
                        } else {
                            console.log(" 요구를 처리하는 과정에서 문제가 발생되었음");
                        }
                    } else {
                        console.log(" // 아직 준비되지 않음 ");
                    }
                    alert('창 닫을거임?');
                }
            });
            window.opener.location.reload();
            window.opener.setMemberInfo(m_id, name);
            window.close();
        } else {
            return false;
        }
    }
</script>
</body>
</html>

