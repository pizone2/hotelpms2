
    // JSTL을 사용하여 Java 객체 'data'를 JavaScript 배열 'chartData'로 변환
    var chartData = [
    <c:forEach var="vo" items="${data}" varStatus="status">
        ['${vo.roomType}', ${vo.count}]${!status.last ? ',' : ''}
    </c:forEach>
    ];

    // 차트 그리기 함수
    function drawChart() {
    var data = google.visualization.arrayToDataTable([
    ['Task', 'Hours per Day'],
    ...chartData
    ]);

    var options = {
    title: 'My Daily Activities'
};

    var chart = new google.visualization.PieChart(document.getElementById('piechart'));

    chart.draw(data, options);
}

    // Google Charts 로드 후 차트 그리기 함수 호출
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
