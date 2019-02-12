<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>레슨 시간표</title>
</head>
<style>
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
<h1 style="text-align:center;"> LESSON SCHEDULE </h1>
<br/>
<br/>
<table id="lesson" style="">
    <thead>
    <tr>
        <th data-cell-id="A1" data-x="0" data-y="1"></th>
        <th data-cell-id="B1" data-x="1" data-y="1">월</th>
        <th data-cell-id="C1" data-x="2" data-y="1">화</th>
        <th data-cell-id="D1" data-x="3" data-y="1">수</th>
        <th data-cell-id="E1" data-x="4" data-y="1">목</th>
        <th data-cell-id="F1" data-x="5" data-y="1">금</th>
        <th data-cell-id="G1" data-x="6" data-y="1">토</th>
    </tr>
    </thead>
    <tbody id="lesson-tbody">
        <tr>
            <td data-cell-id="A2" data-x="0" data-y="2">12</td>
            <td data-cell-id="B2" data-x="1" data-y="2">$100</td>
            <td data-cell-id="C2" data-x="2" data-y="2">January</td>
            <td data-cell-id="D2" data-x="3" data-y="2">$100</td>
            <td data-cell-id="E2" data-x="4" data-y="2">January</td>
            <td data-cell-id="F2" data-x="5" data-y="2">$100</td>
            <td data-cell-id="G2" data-x="6" data-y="2">January</td>
        </tr>
        <tr>
            <td>13</td>
            <td>$100</td>
            <td>January</td>
            <td>$100</td>
            <td>January</td>
            <td>$100</td>
            <td>January</td>
        </tr>
    </tbody>
</table>

<br/>

<script>
    function add_row() {
        var my_tbody = document.getElementById('my-tbody');
        // var row = my_tbody.insertRow(0); // 상단에 추가
        var row = my_tbody.insertRow( my_tbody.rows.length ); // 하단에 추가
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        cell1.innerHTML = '항목';
        cell2.innerHTML = new Date().toUTCString();
    }
</script>
</body>
</html>