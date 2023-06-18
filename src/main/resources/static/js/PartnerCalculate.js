$.ajax({
    url: "/partnerCalculate/receipt?date=2023-06-19&businessNumber=2618123567",
    method: "GET",
    success: function(response) {
        $("#tableDiv").html(response);
    },
    error: function(xhr, status, error) {
        // 오류 처리
        console.error('오류가 발생했습니다. 관리자에게 문의하세요:', status, error);
    }
});


$(document).ready(function() {
    $('td.tg-mkvm').click(function() {
        var businessNumber = $(this).siblings('.tg-mkvm.businessNumber').text();
        var url = 'http://localhost/partnerCalculate/receipt?date=2023-06-19&businessNumber=' + encodeURIComponent(businessNumber);

        // AJAX 요청 또는 페이지 전환을 수행하는 코드 작성
        // 예시: AJAX 요청을 수행하여 데이터를 가져오는 경우
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'html',
            success: function(response) {
                // AJAX 요청이 성공했을 때의 동작을 작성
                // response 변수에는 서버에서 반환한 데이터가 포함됩니다.
                // 가져온 데이터를 사용하여 필요한 동작을 수행하십시오.
            },
            error: function(xhr, status, error) {
                // AJAX 요청이 실패했을 때의 동작을 작성
                // 실패에 대한 처리를 수행하십시오.
            }
        });

        // 페이지 전환을 수행하는 경우
        // window.location.href = url;
    });
});