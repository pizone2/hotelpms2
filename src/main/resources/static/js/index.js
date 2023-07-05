
$('#btn-day').click(function() {
    console.log("click")
    $.ajax({
        url: "/todaySales",
        method: "GET",
        success: function(response) {
            $('#todaySales').html(response);
            console.log("성공");
        },
        error: function(xhr, status, error) {
            console.error('오류가 발생했습니다. 관리자에게 문의해주세요.');
        }
    });
});
// // 버튼 3 클릭 함수
// function clickButton3() {
//     let button3 = document.getElementById('btn-day');
//     button3.click();
// }
//
// // '#btn-day' 버튼 클릭 이벤트 리스너 등록
// document.getElementById('btn-day').addEventListener('click', function() {
//     clickButton3();
//     clickButton3();
//     clickButton3();
//
// });


$('#btn-day').click(function() {
    console.log("click")
    $.ajax({
        url: "/todaySales",
        method: "GET",
        success: function(response) {
            $('.todaySales').html(response);
            console.log("성공");
        },
        error: function(xhr, status, error) {
            console.error('오류가 발생했습니다. 관리자에게 문의해주세요.');
        }
    });


});


$('#btn-month').click(function() {
    // 버튼이 클릭될 때마다 endDate 값을 갱신
    var selectedDate = $('#endDate').val();

    $.ajax({
        url: "/monthSales",
        method: "GET",
        data: { endDate: selectedDate }, // 선택된 날짜 값을 Controller에 전달
        success: function(response) {
            $('.todaySales').html(response);
            console.log("성공");
        },
        error: function(xhr, status, error) {
            console.error('오류가 발생했습니다. 관리자에게 문의해주세요.');
        }
    });
});

