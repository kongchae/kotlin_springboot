<%@ page language="java" pageEncoding="UTF-8"
%><%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>Piano Space</title>

    <tiles:insertAttribute name="javascript.header"/>
    <tiles:insertAttribute name="stylesheet"/>
</head>
<body>
<div class="wrapper">
    <tiles:insertAttribute name="header"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <tiles:insertAttribute name="title"/>
            </h1>
            <tiles:getAsString name="location"/>
        </section>
        <tiles:insertAttribute name="content"/>
    </div>
</div>
<tiles:insertAttribute name="footer"/>
</body>
</html>
