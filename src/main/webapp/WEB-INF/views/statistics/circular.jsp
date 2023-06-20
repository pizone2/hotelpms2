<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Chart Example</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
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
</body>
</html>
