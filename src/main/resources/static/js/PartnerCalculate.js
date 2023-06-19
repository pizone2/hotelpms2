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
$('td.tg-kxtx').click(function() {

    // 선택한 td의 사업자 번호 가져오기
    let businessNumber = $(this).closest('tr').find('.tg-kxtx:nth-child(2)').text();

    // calculate
    $.ajax({
        url: "/partnerCalculate/receipt?date=" + dateParam + "&businessNumber=" + businessNumber,
        method: "GET",
        success: function(response) {
            $("#tableDiv").html(response);

            // 애니메이션 효과 추가
            $("#tableDiv").hide().fadeIn(500); // 예시: 500ms 동안 서서히 나타나는 효과
            // 다른 애니메이션 효과를 원한다면 jQuery의 animate() 함수를 사용하여 원하는 애니메이션을 정의할 수 있습니다.
            // $("#tableDiv").hide().animate({ left: '+=100px' }, 1000); // 예시: 1000ms 동안 오른쪽으로 100px 이동하는 효과

            $("#tableDiv").html(response);

            // 모든 <td> 요소의 값을 가져와서 합계 구하기
            let sum = 0;
            let tdElements = document.querySelectorAll('.tg-kxtx#itemIdSum');
            tdElements.forEach(function(element) {
                let value = parseInt(element.textContent.replace(/[^0-9]/g, ''));
                if (!isNaN(value)) {
                    sum += value;
                }
            });

          // 계산된 합계 값을 삽입하기
            let sumElement = document.querySelector('.tg-amwm#total');
            sumElement.textContent = new Intl.NumberFormat('ko-KR').format(sum) + ' 원';

            // 콘솔에 결과 출력
            console.log("합계 값:", sum);
        },
        error: function(xhr, status, error) {
            console.error('오류가 발생했습니다. 관리자에게 문의하세요:', status, error);
        }
    });
});
