$.ajax({
    url: "/partnerCalculate/receipt",
    method: "GET",
    success: function(response) {
        $("#tableDiv").html(response);
    },
    error: function(xhr, status, error) {
        // 오류 처리
        console.error('오류가 발생했습니다. 관리자에게 문의하세요:', status, error);
    }
});