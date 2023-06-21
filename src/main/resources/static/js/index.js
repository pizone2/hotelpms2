
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

$('#endDate').on('change', function() {
    // 변경된 날짜 값을 가져옴
    let selectedDate = $(this).val();

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
});
