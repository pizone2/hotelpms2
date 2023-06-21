
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
});// 버튼 3 클릭 함수
function clickButton3() {
    var button3 = document.getElementById('btn-day');
    button3.click();
}

// '#btn-day' 버튼 클릭 이벤트 리스너 등록
document.getElementById('btn-day').addEventListener('click', function() {
    clickButton3();
    clickButton3();
    clickButton3();

});


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

let selectedDate = 0;
$('#endDate').on('change', function() {
    // 변경된 날짜 값을 가져옴
    selectedDate = $(this).val();
});
    $('#btn-month').click(function() {
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
