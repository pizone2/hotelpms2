<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>



    <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;}
        .tg td {
            border-color: black;
            border-style: solid;
            border-width: 1px;
            font-family: Arial, sans-serif;
            font-size: 14px;
            overflow: hidden;
            padding: 10px 5px;
            word-break: normal;
        }
        .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
            font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
        .tg .tg-0lax{text-align:left;vertical-align:top}
    </style>


</head>
<body>
<%! int count = 0; %>
<%
    // 페이지가 로드될 때마다 count 변수 초기화
    count = 0;
%>

<table class="tg">
    <thead>
    <tr>
        <th class="tg-0pky">TYPE</th>
        <th class="tg-0pky">ROOM</th>
        <th class="tg-0lax">재실</th>
        <%
            java.util.Date currentDate = new java.util.Date();
            java.util.Calendar calendar = java.util.Calendar.getInstance();
            calendar.setTime(currentDate);

            java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("MM월 dd일 (E)");

            for (int i = 0; i < 14; i++) {
                java.util.Date date = calendar.getTime();
                String formattedDate = dateFormat.format(date);
        %>

        <th class="tg-0lax"><%= formattedDate %></th>

        <%
                calendar.add(java.util.Calendar.DATE, 1);
            }
        %>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td class="tg-0pky" colspan="2">체크인수</td>
        <c:forEach items="${checkinCount}" var="checkin" varStatus="loop">
            <c:if test="${loop.index < 15}">
            <td class="tg-0lax">${checkin.checkinCount}</td>
            </c:if>
        </c:forEach>

    </tr>
    <tr>
        <td class="tg-0lax" colspan="2">예약수</td>
        <c:forEach items="${reservationCount}" var="reservation" varStatus="loop">
            <c:if test="${loop.index < 15}">
                <td class="tg-0lax">${reservation.reservationCount}</td>
            </c:if>
        </c:forEach>

    </tr>
    <tr>
        <td class="tg-0lax" colspan="2">객실재고</td>
        <c:forEach items="${roomStock}" var="stock" varStatus="loop">
            <c:if test="${loop.index < 15}">
                <td class="tg-0lax">${stock.roomStock}</td>
            </c:if>
        </c:forEach>

    </tr>
    </tbody>
</table>
<%--<%--%>
<%--    // 어제 날짜 계산--%>
<%--    java.time.LocalDate yesterday = java.time.LocalDate.now().minusDays(1);--%>
<%--    java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd");--%>
<%--    String yesterdayFormatted = yesterday.format(formatter);--%>

<%--    // 어제 날짜 변수를 JSP 변수로 설정--%>
<%--    pageContext.setAttribute("yesterday", yesterdayFormatted);--%>
<%--%>--%>
<%
    // Calculate yesterday's date
    java.time.LocalDate yesterday = java.time.LocalDate.now().minusDays(1);
    java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd");

    // Create a list to store the dates
    java.util.List<String> dateList = new java.util.ArrayList<>();

    // Loop through the dates and add them to the list
    for (int i = 0; i < 14; i++) {
        dateList.add(yesterday.minusDays(i).format(formatter));
    }

    // Set the date list as a JSP variable
    pageContext.setAttribute("dateList", dateList);
%>

    <table class="tg">
        <tbody>
        <c:forEach items="${roomStatusVO}" var="roomStatus" varStatus="status">
            <c:if test="${status.index % 15 == 0}">
                <tr>
                <td style="height: 20px; width: 20px;">${roomStatus.roomType}</td>
                <td style="height: 100px; width: 200px;">${roomStatus.roomNumber}</td>
            </c:if>
            <td style="height: 100px;
                    background-color: ${roomStatus.roomStatus == 1 ? 'lightblue' : roomStatus.roomStatus == 2 ? 'orange' : roomStatus.roomStatus == 3 ? 'lightgreen' : 'inherit'};">
                <p>ROOMNUMBER: ${roomStatus.roomNumber}</p>
                <p>reservationDate: ${roomStatus.reservationDate}</p>
                <p>name: ${roomStatus.name}</p>
                <p>roomStatus: ${roomStatus.roomStatus}</p>
                <p>reservationNumber: ${roomStatus.reservationNumber}</p>
                <p>phoneNumber: ${roomStatus.phoneNumber}</p>
                <p>checkinDate: ${roomStatus.checkinDate}</p>
                <p>checkoutDate: ${roomStatus.checkoutDate}</p>
                <c:if test="${roomStatus.reservationDate ==  dateList   && roomStatus.roomStatus == 2}">
                    <% count++; %>
                </c:if>
            </td>
            <c:if test="${status.index % 15 == 14 || status.last}">
                </tr>
        </c:if>
        </c:forEach>
        </tbody>
    </table>

    <script>
        // count 값을 JavaScript 변수로 가져오기
        let countValue = <%= count %>;

        // JavaScript 파일 로드
        let script = document.createElement('script');
        script.src = '/js/roomStatus.js';
        document.head.appendChild(script);
    </script>



<p>yesterday: ${yesterday}</p>
<p>count: <%= count %></p>




</table>
<script src="/js/roomStatus.js"></script>
</body>