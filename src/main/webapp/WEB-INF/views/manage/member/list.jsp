<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 목록</title>
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
<br/>
<br/>
총 ${totalCount} 명<br/>

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
                    ${member.status}
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<br/>
<a href="/">메인으로</a>
</body>
</html>