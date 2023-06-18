// // parameter value
// let urlParams = new URLSearchParams(window.location.search);
// let dateParam = urlParams.get('date');
//
// console.log(dateParam);
//
// // calculate
// $.ajax({
//     url: "/partnerCalculate/receipt?date=" + dateParam + "&businessNumber=2618123567",
//     method: "GET",
//     success: function(response) {
//         $("#tableDiv").html(response);
//     },
//     error: function(xhr, status, error) {
//         // error handling
//         console.error('오류가 발생했습니다. 관리자에게 문의하세요:', status, error);
//     }
// });
// parameter value
let urlParams = new URLSearchParams(window.location.search);
let dateParam = urlParams.get('date');

console.log(dateParam);

// td 클릭 이벤트 핸들러
$('td.tg-mkvm').click(function() {
    // 선택한 td의 사업자 번호 가져오기
    let businessNumber = $(this).closest('tr').find('.tg-mkvm:nth-child(2)').text();

    // calculate
    $.ajax({
        url: "/partnerCalculate/receipt?date=" + dateParam + "&businessNumber=" + businessNumber,
        method: "GET",
        success: function(response) {
            $("#tableDiv").html(response);
        },
        error: function(xhr, status, error) {
            // error handling
            console.error('오류가 발생했습니다. 관리자에게 문의하세요:', status, error);
        }
    });
});

