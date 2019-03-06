<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 목록</title>
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
</head>
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

<body>
<h1 style="text-align:center;"> MemberLIst </h1>
<br/><br/>회원관리
<br/>
<div class="wrap-loading" style="display: none">
    <div><img src="/resources/images/ajax-loader7.gif"/></div>
</div>
<br/>
총 ${totalCount} 명<br/>

<table id="allMemberList">
    <thead>
    <tr>
        <th><input type="checkbox" id="check_all" /></th>
        <th>m_id</th>
        <th>ID</th>
        <th>이름</th>
        <th>메일</th>
        <th>상태</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="member" items="${memberList}" varStatus="status">
        <tr>
            <td class="text-center">
                <input type="checkbox" name="chk" value="${member.m_id}" />
            </td>
            <td class="text-center">
                    ${member.m_id}
            </td>
            <td class="text-center">
                    ${member.id}
            </td>
            <td class="text-center">
                    ${member.name}
            </td>
            <td class="text-center">
                    ${member.email}
            </td>
            <td class="text-center">
                    ${member.status}
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br/>
<button type="button" onclick="deleteChk()">회원 삭제</button><br/>


<br/><br/>테스트
<table>
    <thead>
    <tr>
        <th>m_id</th>
        <th>ID</th>
        <th>이름</th>
        <th>메일</th>
        <th>상태</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="member" items="${memberList}" varStatus="status">
        <tr>
            <td class="text-center">
                    ${member.m_id}
            </td>
            <td class="text-center">
                    ${member.id}
            </td>
            <td class="text-center">
                    ${member.name}
            </td>
            <td class="text-center">
                    ${member.email}
            </td>
            <td class="text-center">
                <c:choose>
                    <c:when test="${member.status eq 1}">승인회원</c:when>
                    <c:otherwise>비승인회원</c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<br/>
<a href="/">메인으로</a>
<script>

    $(document).ready(function(){
        $("#check_all").click(function(){
            if($("#check_all").prop("checked")){
                $("input[name='chk']").prop("checked",true);
            }else{
                $("input[name='chk']").prop("checked",false);
            }
        })
    });

    function deleteChk() {
        var deleteMembers = new Array();

        $("input[name='chk']:checked").each(function () {
            deleteMembers.push($(this).val());
        });
        if(deleteMembers.length < 1) {
            alert("삭제할 대상을 선택하세요.");
            return false;
        }

        if(confirm("정보를 삭제 하시겠습니까?")) {
            $(".wrap-loading").show();
            $.ajax({
                url: "/manage/member/delete",
                type: "POST",
                data: JSON.stringify(deleteMembers),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success:function(response) {
                    $(".wrap-loading").hide();
                    alert( "success" );
                    console.log("총 삭제된 멤버수 : " +response);
                    document.location.reload();
                },
                error: function() {
                    alert( "error" );
                    $(".wrap-loading").hide();
                    return false;
                }
            });
        } else {
            $(".wrap-loading").hide();
            return false;
        }
    }
</script>
</body>
</html>