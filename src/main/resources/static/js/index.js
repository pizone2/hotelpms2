
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