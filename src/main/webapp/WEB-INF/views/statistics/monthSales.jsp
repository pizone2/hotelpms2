<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
<div class="row" style="position: relative;">
    <div class="col-6" style="overflow: hidden;">
        <div id="piechart" style="width: 900px; height: 500px;"></div>
        <script>
            var chartData = [
                <c:forEach var="selectedSalesPie" items="${selectedSalesPie}" varStatus="status">
                ['${selectedSalesPie.roomType} (${selectedSalesPie.count})', ${selectedSalesPie.count}]${!status.last ? ',' : ''}
                </c:forEach>
            ];

            // 차트 그리기 함수
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Room Type', 'Count'],
                    ...chartData
                ]);

                var options = {
                    title: 'Month 예약 현황',
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
                <%-- <th data-orderable="false"></th>--%>
                <th>객실</th>
                <th>분류</th>
                <th>매출</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>더블</td>
                <td>ROOM</td>
                <td>${selectedSales[0].total}</td>
            </tr>
            <tr>
                <td>디럭스</td>
                <td>ROOM</td>
                <td>${selectedSales[1].total}</td>
            </tr>
            <tr>
                <td>스위트</td>
                <td>ROOM</td>
                <td>${selectedSales[2].total}</td>
            </tr>
            <tr>
                <td>스탠다드</td>
                <td>ROOM</td>
                <td>${selectedSales[3].total}</td>
            </tr>
            <tr>
                <td>트윈</td>
                <td>ROOM</td>
                <td>${selectedSales[4].total}</td>
            </tr>
            <tr>
                <td>합계</td>
                <td>ROOM</td>
                <td>${selectedSales[5].total}</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
<script>
    // 페이지 로드 시 차트 그리기 함수 호출
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
</script>
</html>