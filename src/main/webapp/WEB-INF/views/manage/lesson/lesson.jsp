<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>레슨 시간표</title>

    <link rel='stylesheet' href='/resources/css/fullcalendar.css' />
    <script type="text/javascript" src='/resources/js/moment.js'></script>
    <script type="text/javascript" src='/resources/js/fullcalendar.js'></script>
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
    .lessonName {
        color: snow;
    }
    .fc-time-grid .fc-slats td {
        height : 2.2em;
    }
</style>

<body>
<h1 id="pageName" style="text-align:center;"> LESSON SCHEDULE </h1>
<br/>
<div>
    회원번호 : <span id="m_id"></span><br/>
    회원이름 : <span id="name"></span>
</div><br/>
<div id='calendar'></div>
<br/><br/>
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
<button type="button" onclick="add_row()">일정추가</button> <br/>
<button type="button" onclick="del_row()">일정삭제</button>
<br/>

<script>
    $(function() {
        $('#calendar').fullCalendar({
            selectable :true,
            header: {
                left : 'today',
                center : 'title',
                right : 'prev, next'
            },
            defaultView: 'agendaWeek',
            dayCount: 7,
            minTime : "12:00:00",
            maxTime : "22:00:00",
            titleFormat: 'MMMM YYYY',
            locale: 'ko',
            allDaySlot : false,
            slotDuration : '01:00:00', // 1 hour
            height : 'auto',
            contentHeight: 'auto',
            events: {
                url: '/schedule/lesson/list',
                type : 'GET',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function(request,status,error) {
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
                },
                success: function() {
                  console.log("Success!!");
                },
                color: 'yellow',   // a non-ajax option
                textColor: 'black' // a non-ajax option
            },

            eventClick: function(calEvent, jsEvent, view) {
                alert('Event: ' + calEvent.title);
                // change the border color just for fun
                $(this).css('background-color', '#4a498d');
            },

            select: function(startDate, endDate, jsEvent) {
                startDate = startDate.format("YYYY-MM-DD HH:mm:ss");
                endDate = endDate.format("YYYY-MM-DD HH:mm:ss");
                alert('selected :' +startDate +"  to  " +endDate);
                var url = "/manage/form/lessonMemberList?startDate=" +startDate +"&endDate=" +endDate;
                window.open(url, "a", "width=800, height=600, left=100, top=50");
            }
        });
    });

    function setMemberInfo(m_id, name) {
        $("#m_id").text(m_id);
        $("#name").text(name);
    }

    function add_row() {
        var my_tbody = document.getElementById('lesson');
        // var row = my_tbody.insertRow(0); // 상단에 추가
        var row = my_tbody.insertRow( my_tbody.rows.length ); // 하단에 추가
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);

        cell1.innerHTML = '항목';
        cell2.innerHTML = new Date().toUTCString();
        cell1.setAttribute("class", "lessonName");
        cell1.style.backgroundColor = "#4a498d"
    }
    function del_row() {
        var my_tbody = document.getElementById('lesson');
        var row = my_tbody.deleteRow( my_tbody.rows.length - 1 );

        //my_tbody.deleteCell(0); // index 넣기
    }

</script>
</body>
</html>