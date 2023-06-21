<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
<div class="row" style="position: relative;">
    <div class="col-6" style="overflow: hidden;">
        <div id="piechart" style="width: 900px; height: 500px;"></div>

        <script>
            var chartData = [
                <c:forEach var="vo" items="${data}" varStatus="status">
                ['${vo.roomType} (${vo.count})', ${vo.count}]${!status.last ? ',' : ''}
                </c:forEach>
            ];

            // 차트 그리기 함수
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Room Type', 'Count'],
                    ...chartData
                ]);

                var options = {
                    title: 'To day 예약 현황',
                    // 툴팁에 백분율 표시
                    tooltip: {
                        showPercentage: true
                    }
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                chart.draw(data, options);
            }

            // Google Charts 로드 후 차트 그리기 함수 호출
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChart);
        </script>
    </div>
    <div class="col-6" style="display: flex; align-items: center;">
        <table id="datatablesSimple" class="datatable-table">
            <thead>
            <tr>
                <th>객실</th>
                <th>분류</th>
                <th>매출</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="vo" items="${statisticsVO}">
                <!-- 유저 정보-->
                <tr>
                    <td>${vo.roomType}</td>
                    <td>ROOM</td>
                    <td align="right">${vo.todaySales}원</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    // 페이지 로드 시 차트 그리기 함수 호출
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
</script>
</body>
</html>
